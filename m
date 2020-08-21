Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CF824CDD2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 08:16:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k90LL-0001eU-Vd; Fri, 21 Aug 2020 06:16:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kxmg=B7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k90LK-0001eP-DL
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 06:16:02 +0000
X-Inumbo-ID: c37efd79-5cf9-4224-8fca-05291e7a145d
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c37efd79-5cf9-4224-8fca-05291e7a145d;
 Fri, 21 Aug 2020 06:15:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28D08B619;
 Fri, 21 Aug 2020 06:16:26 +0000 (UTC)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Oleksandr <olekstysh@gmail.com>
Cc: Julien Grall <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Daniel De Graaf
 <dgdegra@tycho.nsa.gov>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-5-git-send-email-olekstysh@gmail.com>
 <11eaa2f0-84c7-5972-d14c-4cb02458e882@xen.org>
 <3ee50c66-8761-6c86-3fab-a4c23622d2b8@gmail.com>
 <e8b0cccf-76cd-1be8-be75-33ccd571195e@xen.org>
 <fbc2d5a5-d8e7-0627-73cb-aca2b8addb8b@suse.com>
 <8b841e83-3dbf-b8d8-37d8-2828ca2cca66@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <78cfadf0-984d-909e-c08a-797fb9e876f2@suse.com>
Date: Fri, 21 Aug 2020 08:16:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <8b841e83-3dbf-b8d8-37d8-2828ca2cca66@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.08.2020 20:30, Oleksandr wrote:
> On 06.08.20 14:29, Jan Beulich wrote:
>> On 06.08.2020 13:08, Julien Grall wrote:
>>> On 05/08/2020 20:30, Oleksandr wrote:
>>>> I was thinking how to split handle_hvm_io_completion()
>>>> gracefully but I failed find a good solution for that, so decided to add
>>>> two stubs (msix_write_completion and handle_realmode_completion) on Arm.
>>>> I could add a comment describing why they are here if appropriate. But
>>>> if you think they shouldn't be called from the common code in any way, I
>>>> will try to split it.
>>> I am not entirely sure what msix_write_completion is meant to do on x86.
>>> Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could help?
>> Due to the split brain model of handling PCI pass-through (between
>> Xen and qemu), a guest writing to an MSI-X entry needs this write
>> handed to qemu, and upon completion of the write there Xen also
>> needs to take some extra action.
> 
> 
> 1. Regarding common handle_hvm_io_completion() implementation:
> 
> Could msix_write_completion() be called later on so we would be able to 
> split handle_hvm_io_completion() gracefully or could we call it from 
> handle_mmio()?
> The reason I am asking is to avoid calling it from the common code in 
> order to avoid introducing stub on Arm which is not going to be ever 
> implemented
> (if msix_write_completion() is purely x86 material).

I'm unconvinced of this last fact, but as with about everything it is
quite certainly possible to call the function later. The question is
how ugly this would become, as this may involve redundant conditionals
(i.e. ones which need to remain in sync) and/or extra propagation of
state.

> For the non-RFC patch series I moved handle_realmode_completion to the 
> x86 code and now my local implementation looks like:
> 
> bool handle_hvm_io_completion(struct vcpu *v)
> {
>      struct domain *d = v->domain;
>      struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
>      struct hvm_ioreq_server *s;
>      struct hvm_ioreq_vcpu *sv;
>      enum hvm_io_completion io_completion;
> 
>      if ( has_vpci(d) && vpci_process_pending(v) )
>      {
>          raise_softirq(SCHEDULE_SOFTIRQ);
>          return false;
>      }
> 
>      sv = get_pending_vcpu(v, &s);
>      if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
>          return false;
> 
>      vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
>          STATE_IORESP_READY : STATE_IOREQ_NONE;
> 
>      msix_write_completion(v);
>      vcpu_end_shutdown_deferral(v);
> 
>      io_completion = vio->io_completion;
>      vio->io_completion = HVMIO_no_completion;
> 
>      switch ( io_completion )
>      {
>      case HVMIO_no_completion:
>          break;
> 
>      case HVMIO_mmio_completion:
>          return handle_mmio();
> 
>      case HVMIO_pio_completion:
>          return handle_pio(vio->io_req.addr, vio->io_req.size,
>                            vio->io_req.dir);
> 
>      default:
>          return arch_handle_hvm_io_completion(io_completion);
>      }
> 
>      return true;
> }
> 
> 2. Regarding renaming common handle_mmio() to ioreq_handle_complete_mmio():
> 
> There was a request to consider renaming that function which is called 
> from the common code in the context of IOREQ series.
> The point is, that the name of the function is pretty generic and can be 
> confusing on Arm (we already have a try_handle_mmio()).
> I noticed that except common code that function is called from a few 
> places on x86 (I am not even sure whether all of them are IOREQ related).
> The question is would x86 folks be happy with such renaming?

handle_mmio() without any parameters and used for a varying set
of purposes was imo never a good choice of name. The situation
has improved, but can do with further improvement. The new name,
if to be used for truly renaming the function need to fit all
uses though. As such, I don't think ioreq_handle_complete_mmio()
is an appropriate name.

> Alternatively I could provide the following in 
> include/asm-arm/hvm/ioreq.h without renaming it in the common code and
> still using non-confusing variant on Arm (however I am not sure whether 
> this is a good idea):
> 
> #define handle_mmio ioreq_handle_complete_mmio

If anything, for x86 it ought to be the other way around, at
which point you wouldn't need any alias #define on Arm.

> 3. Regarding common IOREQ/DM stuff location:
> 
> Currently it is located at:
> common/hvm/...
> include/xen/hvm/...
> 
> For the non-RFC patch series I am going to avoid using "hvm" name (which 
> is internal detail of arch specific code and shouldn't be exposed to the 
> common code).
> The question is whether I should use another directory name (probably 
> ioreq?) or just place them in common root directory?

I think there are arguments for and against hvm/. I'm not of
the opinion that ioreq/ would be a good name, so if hvm/ was to
be ruled out, I think the file(s) shouldn't go into separate
subdirs at all.

Jan

