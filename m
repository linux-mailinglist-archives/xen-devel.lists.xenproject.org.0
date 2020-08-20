Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 823AC24C58E
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 20:32:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8pKm-0006j6-3i; Thu, 20 Aug 2020 18:30:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ocHG=B6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k8pKl-0006j1-FO
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 18:30:43 +0000
X-Inumbo-ID: 23711b59-2794-4fc3-9426-424b3158c030
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23711b59-2794-4fc3-9426-424b3158c030;
 Thu, 20 Aug 2020 18:30:42 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y2so3212378ljc.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 11:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iFk+ncmvw9oTgZfY9ziYTuLK8qRmXV1IEzeg/uDP4nI=;
 b=XCEDrLJ+4M9S+MNTovCiB71imaw7eIRy1dNy9/x872M71TFhY/oWK6UsxGgbIWCnfo
 d3/7mGT8C/4GsqzatgQWCDuD5M2lPyOhiU6Gn/PMdtM8Nhjp5REb0e76DKcoNsTzBnMb
 EZkX1Z/0/scoGnS7xxUT/CxMc/a3n3iJSETljnlok9KKnkI3L6XG0E9vpXc5jt9k9vaI
 tyA71Zd+8ardrbOZIVZVOTfL422gjKnB6gPJ5T4ma5SzcL9LTj4Xware2dw041aOf2z0
 7vWK+HIKNU7vgTeHtOge+JFLcxRbNArBO4i7x4eQAQqkEOutPSX5tuM9pgoENQHg1i5u
 CBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iFk+ncmvw9oTgZfY9ziYTuLK8qRmXV1IEzeg/uDP4nI=;
 b=jifkpgIljLxu0od+ivyKpxGCCv4AQ4nErZUSvXQAqIMZg2aKxuUwAx7e+ZWHyRxEZN
 KGnh/TSm1DiKfBzRs8eF7Tx7pVrF0PX2W8De62a8JiGuPFm5JjJfUxh2e92v6+Z5gd7E
 pzEZB/vqdd74MmwTMVsKpX87sasbxg4Ky/VGR4iu4nJ/V1BxA1Qan/crRitJ4piv+6RG
 Li9OM2q5mEgk6ikSpcHQTf6UyA/G8aLzs84cvFCF3uyNPDDLQJ4oDvptdbcWHGTVY8G9
 1tDqNfVvvcglBMEJ3wle7AGELOhSPnUouzpC8kWiZgttK6pyRFKT1/SwzYXHyhxE3zrB
 iTrQ==
X-Gm-Message-State: AOAM5338wxN0ZiW+dXbz8Tn8YbptNWo6B8jEZIAhTkXcBvnZZpzSXaHE
 xL9POiOspJ9+ivLoWmC2yy8=
X-Google-Smtp-Source: ABdhPJxAVGuyN0txjxSh4rAHhE67BMZ+VTh2CUADLyu3kyVYENBXK8xAgfRLtg4LZQbrpXDD78zFaA==
X-Received: by 2002:a2e:9c8b:: with SMTP id x11mr1976645lji.218.1597948239997; 
 Thu, 20 Aug 2020 11:30:39 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r19sm653100lfi.58.2020.08.20.11.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 11:30:39 -0700 (PDT)
Subject: Re: [RFC PATCH V1 04/12] xen/arm: Introduce arch specific bits for
 IOREQ/DM features
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <8b841e83-3dbf-b8d8-37d8-2828ca2cca66@gmail.com>
Date: Thu, 20 Aug 2020 21:30:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fbc2d5a5-d8e7-0627-73cb-aca2b8addb8b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


Hello all.


I would like to clarify some questions based on the comments for the 
patch series. I put them together (please see below).


On 06.08.20 14:29, Jan Beulich wrote:
> On 06.08.2020 13:08, Julien Grall wrote:
>> On 05/08/2020 20:30, Oleksandr wrote:
>>> I was thinking how to split handle_hvm_io_completion()
>>> gracefully but I failed find a good solution for that, so decided to add
>>> two stubs (msix_write_completion and handle_realmode_completion) on Arm.
>>> I could add a comment describing why they are here if appropriate. But
>>> if you think they shouldn't be called from the common code in any way, I
>>> will try to split it.
>> I am not entirely sure what msix_write_completion is meant to do on x86.
>> Is it dealing with virtual MSIx? Maybe Jan, Roger or Paul could help?
> Due to the split brain model of handling PCI pass-through (between
> Xen and qemu), a guest writing to an MSI-X entry needs this write
> handed to qemu, and upon completion of the write there Xen also
> needs to take some extra action.


1. Regarding common handle_hvm_io_completion() implementation:

Could msix_write_completion() be called later on so we would be able to 
split handle_hvm_io_completion() gracefully or could we call it from 
handle_mmio()?
The reason I am asking is to avoid calling it from the common code in 
order to avoid introducing stub on Arm which is not going to be ever 
implemented
(if msix_write_completion() is purely x86 material).

For the non-RFC patch series I moved handle_realmode_completion to the 
x86 code and now my local implementation looks like:

bool handle_hvm_io_completion(struct vcpu *v)
{
     struct domain *d = v->domain;
     struct hvm_vcpu_io *vio = &v->arch.hvm.hvm_io;
     struct hvm_ioreq_server *s;
     struct hvm_ioreq_vcpu *sv;
     enum hvm_io_completion io_completion;

     if ( has_vpci(d) && vpci_process_pending(v) )
     {
         raise_softirq(SCHEDULE_SOFTIRQ);
         return false;
     }

     sv = get_pending_vcpu(v, &s);
     if ( sv && !hvm_wait_for_io(sv, get_ioreq(s, v)) )
         return false;

     vio->io_req.state = hvm_ioreq_needs_completion(&vio->io_req) ?
         STATE_IORESP_READY : STATE_IOREQ_NONE;

     msix_write_completion(v);
     vcpu_end_shutdown_deferral(v);

     io_completion = vio->io_completion;
     vio->io_completion = HVMIO_no_completion;

     switch ( io_completion )
     {
     case HVMIO_no_completion:
         break;

     case HVMIO_mmio_completion:
         return handle_mmio();

     case HVMIO_pio_completion:
         return handle_pio(vio->io_req.addr, vio->io_req.size,
                           vio->io_req.dir);

     default:
         return arch_handle_hvm_io_completion(io_completion);
     }

     return true;
}

2. Regarding renaming common handle_mmio() to ioreq_handle_complete_mmio():

There was a request to consider renaming that function which is called 
from the common code in the context of IOREQ series.
The point is, that the name of the function is pretty generic and can be 
confusing on Arm (we already have a try_handle_mmio()).
I noticed that except common code that function is called from a few 
places on x86 (I am not even sure whether all of them are IOREQ related).
The question is would x86 folks be happy with such renaming?

Alternatively I could provide the following in 
include/asm-arm/hvm/ioreq.h without renaming it in the common code and
still using non-confusing variant on Arm (however I am not sure whether 
this is a good idea):

#define handle_mmio ioreq_handle_complete_mmio


3. Regarding common IOREQ/DM stuff location:

Currently it is located at:
common/hvm/...
include/xen/hvm/...

For the non-RFC patch series I am going to avoid using "hvm" name (which 
is internal detail of arch specific code and shouldn't be exposed to the 
common code).
The question is whether I should use another directory name (probably 
ioreq?) or just place them in common root directory?


Could you please share your opinion?

-- 
Regards,

Oleksandr Tyshchenko


