Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084A377715A
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 09:27:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581838.911275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU04t-0007T1-BW; Thu, 10 Aug 2023 07:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581838.911275; Thu, 10 Aug 2023 07:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU04t-0007R7-84; Thu, 10 Aug 2023 07:27:27 +0000
Received: by outflank-mailman (input) for mailman id 581838;
 Thu, 10 Aug 2023 07:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BYzL=D3=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qU04r-0007PN-TE
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 07:27:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 591e667e-374f-11ee-b283-6b7b168915f2;
 Thu, 10 Aug 2023 09:27:23 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 9E8544EE073F;
 Thu, 10 Aug 2023 09:27:23 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 591e667e-374f-11ee-b283-6b7b168915f2
MIME-Version: 1.0
Date: Thu, 10 Aug 2023 09:27:23 +0200
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Jun Nakajima <jun.nakajima@intel.com>, Kevin
 Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
Reply-To: simone.ballarin@bugseng.com
In-Reply-To: <8da9b4fe-3109-3a5e-9bc6-15fccc13a8f3@suse.com>
References: <cover.1690368810.git.simone.ballarin@bugseng.com>
 <CAFHJcJuSXqzHbB8P6d-YV_GgAadmxnWgETfaqDj_ge_ipWS7Pg@mail.gmail.com>
 <8da9b4fe-3109-3a5e-9bc6-15fccc13a8f3@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <a660e852cbe9c2f67904ff01f6cb3abd@bugseng.com>
X-Sender: simone.ballarin@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2023 11:15, Jan Beulich wrote:
> On 09.08.2023 10:58, Simone Ballarin wrote:
>> Il giorno mer 26 lug 2023 alle ore 13:04 Simone Ballarin <
>> simone.ballarin@bugseng.com> ha scritto:
>> 
>>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose 
>>> headline
>>> states:
>>> "A 'u' or 'U' suffix shall be applied to all integer constants that 
>>> are
>>> represented in an unsigned type".
>>> 
>>> These violations are caused by the missing "u" or "U" suffix in 
>>> unsigned
>>> integer constants, such as:
>>> 
>>> xen/arch/x86/hvm/hypercall.c:132.17-132.26
>>> if ( (eax & 0x80000000) && is_viridian_domain(currd) )
>>> 
>>> If a rule is not met, changes are needed in order to achieve 
>>> compliance.
>>> The patches in this series achieve compliance for MISRA C:2012 Rule 
>>> 7.2 by
>>> adding the 'U' suffix to integers literals with unsigned type and 
>>> also to
>>> other
>>> literals used in the same contexts or near violations, when their 
>>> positive
>>> nature is immediately clear. The latter changes are done for the sake 
>>> of
>>> uniformity.
>>> 
>>> Gianluca Luparini (4):
>>>   x86/vmx: address violations of MISRA C:2012 Rule 7.2
>>>   xen/vpci: address violations of MISRA C:2012 Rule 7.2
>>>   x86/viridian: address violations of MISRA C:2012 Rule 7.2
>>>   xen/x86: address violations of MISRA C:2012 Rule 7.2
>>> 
>>>  xen/arch/x86/apic.c                          |   2 +-
>>>  xen/arch/x86/cpu-policy.c                    |  18 +-
>>>  xen/arch/x86/cpu/mcheck/mce-apei.c           |   4 +-
>>>  xen/arch/x86/cpu/vpmu_intel.c                |   2 +-
>>>  xen/arch/x86/cpuid.c                         |   8 +-
>>>  xen/arch/x86/efi/efi-boot.h                  |   6 +-
>>>  xen/arch/x86/extable.c                       |   2 +-
>>>  xen/arch/x86/hvm/hypercall.c                 |   2 +-
>>>  xen/arch/x86/hvm/pmtimer.c                   |   4 +-
>>>  xen/arch/x86/hvm/stdvga.c                    |  50 +++---
>>>  xen/arch/x86/hvm/viridian/viridian.c         |   2 +-
>>>  xen/arch/x86/hvm/vlapic.c                    |   6 +-
>>>  xen/arch/x86/hvm/vmx/vmcs.c                  |   6 +-
>>>  xen/arch/x86/hvm/vmx/vvmx.c                  |   8 +-
>>>  xen/arch/x86/include/asm/apicdef.h           |   2 +-
>>>  xen/arch/x86/include/asm/config.h            |   2 +-
>>>  xen/arch/x86/include/asm/guest/hyperv-tlfs.h |  28 +--
>>>  xen/arch/x86/include/asm/hpet.h              |   2 +-
>>>  xen/arch/x86/include/asm/hvm/trace.h         |   4 +-
>>>  xen/arch/x86/include/asm/hvm/vioapic.h       |   2 +-
>>>  xen/arch/x86/include/asm/hvm/vmx/vmcs.h      |  84 ++++-----
>>>  xen/arch/x86/include/asm/hvm/vmx/vmx.h       |  16 +-
>>>  xen/arch/x86/include/asm/msi.h               |   2 +-
>>>  xen/arch/x86/include/asm/msr-index.h         | 180 
>>> +++++++++----------
>>>  xen/arch/x86/include/asm/pci.h               |   8 +-
>>>  xen/arch/x86/include/asm/x86-defns.h         |  24 +--
>>>  xen/arch/x86/percpu.c                        |   2 +-
>>>  xen/arch/x86/psr.c                           |   2 +-
>>>  xen/arch/x86/spec_ctrl.c                     |   8 +-
>>>  xen/arch/x86/x86_64/pci.c                    |   2 +-
>>>  xen/arch/x86/x86_emulate/x86_emulate.h       |   2 +-
>>>  xen/drivers/vpci/msi.c                       |   2 +-
>>>  xen/drivers/vpci/msix.c                      |   2 +-
>>>  xen/drivers/vpci/vpci.c                      |   6 +-
>>>  xen/lib/x86/cpuid.c                          |   8 +-
>>>  xen/lib/x86/policy.c                         |   2 +-
>>>  36 files changed, 255 insertions(+), 255 deletions(-)
>>> 
>>> --
>>> 2.34.1
>>> 
>>> 
>> Hi all,
>> the entire series has not received yet any feedback or Acked-by.
>> I would kindly ask if it is possible to have at least some feedback
> 
> I did reply to patch 4 on July 27th. For patch 2, Roger is on PTO for
> another week and a half.
> 
> Jan
Thanks for the information.
-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)

