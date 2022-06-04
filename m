Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B375753D438
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jun 2022 03:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341752.566990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxIJJ-0007lu-CS; Sat, 04 Jun 2022 01:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341752.566990; Sat, 04 Jun 2022 01:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nxIJJ-0007jT-90; Sat, 04 Jun 2022 01:10:37 +0000
Received: by outflank-mailman (input) for mailman id 341752;
 Sat, 04 Jun 2022 01:10:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YCBW=WL=aim.com=brchuckz@srs-se1.protection.inumbo.net>)
 id 1nxIJH-0007jN-M0
 for xen-devel@lists.xenproject.org; Sat, 04 Jun 2022 01:10:36 +0000
Received: from sonic301-20.consmr.mail.gq1.yahoo.com
 (sonic301-20.consmr.mail.gq1.yahoo.com [98.137.64.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20ad5394-e3a3-11ec-bd2c-47488cf2e6aa;
 Sat, 04 Jun 2022 03:10:32 +0200 (CEST)
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Sat, 4 Jun 2022 01:10:30 +0000
Received: by hermes--canary-production-ne1-799d7bd497-2pzdr (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 349a39a7e5a8590bc241a8c8d4ccce1e; 
 Sat, 04 Jun 2022 01:10:27 +0000 (UTC)
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
X-Inumbo-ID: 20ad5394-e3a3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netscape.net; s=a2048; t=1654305030; bh=owMZygzC3CpzhLFFhxoJKKpvvUwv3HmvaQddnWgt7XQ=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=C0R72fHmlqwzBP8rU9XQofRNc5NHjqaQ1Y69aF/cyewo+Wzd6AaOAU6Ql95kMNBe5SK7yMF2/eh9mWQvl/wmd212bvtu4VtWrv1mNWLc/gcrq5y/VSuaVHba0gl0aaxatZ2Uw2jEwY6cc42W+/lakIU2w0nJVawyogtwmvEja18jM9VuEVwy66CI8bR8AHfxSw5fUq+sQx4UO+g6AE0mJDchwSZwvF5O3G7Q7lA85lSSYBYut0UBknDKn2dlT14t98Xs5+RcBXiggmuvipoRWBP/cxMe9d+RDbDE/tfmnvkogd/O8cnC9KdsfuMjVTDd8nhym39UfRQeLRXfVcADnw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1654305030; bh=j0odnHEajls3qfZXjAo1OwVlHEugMnvaly5uEPPk9mz=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=IO4pxP/Yj8oxQ/6Z04dNQu6NXbe/19UrHZUsFt6qWjQ5nVC2y/W1w2vIUy2y8Zy9pCO360u+hE9h8cpikVR2VtsK5Z0NAngsejPf+uTKta3cNEo1jGgSMj5LaGSTX065HPRrBnX6vBL6DC4erJ/QthqS/8+JRU/Y4FILglO+/HY4A8dLHOLvvjEjyWrUm/z4IA9RRYq0I2V030UWhX+JttQT7S6zD1VhicHKJ8GenqfF9ZCQ61C0KMb6iA5hvl7z6h0wU0FNgo8ZkZVeIgs8N4sgz2f0gBmFeXxyN/WPIU4paj3iEbNWnSJV0B5kDL2ooxM3SnOi3zKFfZg4sAMs6g==
X-YMail-OSG: U3NPG0UVM1kYui0QXfgMd.pS7GOjJY822PSjobs2od7LnmS1q6s3WCkYcABRNm9
 LnKHQQn0rCZQjgfX18oBMlpiZzVRoojdNb4eaQp7W9sYsknUkxn.TCoYRzzQIIrPS4eggr8aC4Bk
 nJTQxUhW2EHIRMmC2Mmk0DT6mVEK7vnO4wYiL71ILjNNwvVUlEhAVv12uZMYKc18Hc3MZULL5HmR
 IFhvezRf1mV_Pxi2vKfbAfEmhWHi9VkU0Grv9_x0030h9P19VWMfmteTq_smCZEAXmhtojyhp5OI
 anSaKaYXvy9Gjtv2hL5DHqdbPSnkKM1uiV7gSjW1ZryiZgUkAUwmtZr8PYwMNUvCOK4Z4iVUyku8
 7GqmvxTDy6Qyynpt.z5Pi0Lglmz7t_bkOkB2jopulTRzTqWG1osMojUD4K6ahgwBRT_GrxmkKLfs
 kt5yxvLPBFOhp7DfmzZPgDTfcyt4BwtqhAdyzaIHSHHJlGs3GKyJnmOMGORwoyfR8fWcEBCOKAqP
 qJrv7YJ5auB6ZhMVcEd7pUMPsopxW78kC._4HB6tjfpqOC8vC3r9OfgIHnyUnFvf5BUGqpxHB04U
 221VwXq6H0ZM7mR3P7DLY_VAShfMKRwYNektziRoJ0VuYIzdXrIyvYbWBQxPmKYaPz_JyMKYMbaa
 HepkGX8cTt4jOr7Am4MjL76vZhwkZ4cahDDvDIIFUJuI4v2RIKSl7mcHa8ydTO3wr.P58VuJnb.J
 Dke9XgaVDrbl0BGDWoLDFGu2rVPNLcJUTWvln8C.EIkqr23UZGF82xU93k4kCjjrKQ8oQjdjWAzu
 sVC.u.Z778PkDoKE8l7R1xkun5j4SYGuCxTmXX4ew8gN.obGz5dXSQdXUezmtu9Cl.QX2CO7kC.E
 8R9q44Na5D0j8gtc3szMxytMpgyj5.2d3OOD5TWxs94VglXrph0zWDwFHLqxjnAZFQMC_T_JqSCA
 DLRZDrUicomEMTbpPAwUINwwLDd2o0uhr_4iRDUn7q87.lPr0rc_n6RMLotYem90SvHv6.iIq6pR
 oRSmbdGmzHgzP3_NsScRA3Qi0pGhsZbpHmcW858AHKMIKjuMcmHJT8glYRTCmRDKoqIfKTR.bwFG
 W9nZ8YMHkYMVJ06z2C5C4DlxKf_9risztXYQ0NTfziNUyWWQoo_JhYjU2jBJ3qIuz0XtczYFWrvy
 SS6u153sfdHQD2V.apTU7UhWIPAG3goM1RqC5Nj.FP_GuyOs0wUPgLkeQVB3VXtEXMqBlyGlPHUZ
 .OK5V7UKSTZj7At1Sq0UXcRrwLY7Rspfk8IVjWpomsn6euKSo0LEAOBdonqwjtT1OKY9w7I7Dgda
 XPIXz7RxQH902ifMO4w4kXvzJXQaS8hqNOkICwbkDJVzX9D1OoTEU36q9bkzPLoZaliCSCAsH3B5
 7q86WDAXDk.GfSeXaRhZlhvbEVJaFvm._jxBz08gx7xexylv1N1ST1ZeG.SnH7DuwMCEBh2XW1RZ
 eJ_nOcsN45VttJPT7FwUcPdG0v2szjFzd5vPIRXzlxwg0u.SzT5MEFCng_jtvfa12GuWFgNTfFlw
 smjq6p3Q9ZO1U1MgcCxzuv7eAv8jleYbXV_nXj79.SITpCZDgh0lMZjpTzZc2g8EFW5W9l0dpJW5
 Uj8t3amfwz3Dv6rla7a8QohSOHBGGSrwvuPhqQTdcRM7_2U0aEZva6g4fPQi9nB.hBC0cBYQX6WN
 LW9ZVdsp2IKIpWn4F7EYu1G4FeN3X.uaUvb7Lazo02sYQb2UzyLqEBgVE5V.jcmKNW.qXxIa3JXS
 m7j3iu31RNG2Rr2HHUlCgGWw1ZrdLlmCfDPrsvFyUTBYf2CzRGkp0wqAUFrmxN.L4oxzbe1N0idf
 iuGjbV9JnO1YTOedoIsu.VKgR..283sPTQpoSBjw3_u0mrjBbx2KZCFDDm8DFMfCejaela_2nb8K
 28QZj2K3mtBYtaKT7PxmCUv.7mqrfxVTfGHzEGj4lodkJWa_kyGGYXjaYKqqPWmgsKBRrrjy81jV
 m8mrWVJtrfPTucHFIrhnWKXZE6qcZLaK4asch_37qb3xGFEREEt9Bz74I6WN7c4F.MHVRix1E2cT
 8pd8DeZdrf.wavHNdouEt.rNK5n89YLu8vOwwphO5BTYzWLiCOSZsKwLxG3CHPy3L.0uoDlwYbvM
 k.VNtBO7mW8QoURRnp2YPTitM0CmVg9_pNDeVXuLvElpKbyH2FqmtSXyiI0CO2N2ROVGbW7EOgix
 .HoBUoKdbNoqKYWUgp2ep
X-Sonic-MF: <brchuckz@aim.com>
Message-ID: <32638cee-de07-aa33-810b-534da4fa08ae@netscape.net>
Date: Fri, 3 Jun 2022 21:10:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
From: Chuck Zmudzinski <brchuckz@netscape.net>
In-Reply-To: <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.20225 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

On 3/30/22 1:15 PM, Anthony PERARD wrote:
> Hi Chuck,
>
> On Sun, Mar 13, 2022 at 11:41:37PM -0400, Chuck Zmudzinski wrote:
>> When gfx_passthru is enabled for the Intel IGD, hvmloader maps the IGD
>> opregion to the guest but libxl does not grant the guest permission to
> I'm not reading the same thing when looking at code in hvmloader. It
> seems that hvmloader allocate some memory for the IGD opregion rather
> than mapping it.
>
>
> tools/firmware/hvmloader/pci.c:184
>      if ( vendor_id == 0x8086 )
>      {
>          igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>          /*
>           * Write the the OpRegion offset to give the opregion
>           * address to the device model. The device model will trap
>           * and map the OpRegion at the give address.
>           */
>          pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>                     igd_opregion_pgbase << PAGE_SHIFT);
>      }
>
> I think this write would go through QEMU, does it do something with it?
> (I kind of replying to this question at the end of the mail.)
>
> Is this code in hvmloader actually run in your case?
>
>> Currently, because of another bug in Qemu upstream, this crash can
>> only be reproduced using the traditional Qemu device model, and of
> qemu-traditional is a bit old... What is the bug in QEMU? Do you have a
> link to a patch/mail?

I finally found a patch for the other bug in Qemu upstream. The
patch is currently being used in QubesOS, and they first added
it to their version of Qemu way back in 2017:

https://github.com/QubesOS/qubes-vmm-xen-stubdom-linux/pull/3/commits/ab2b4c2ad02827a73c52ba561e9a921cc4bb227c

Although this patch is advertised as applying to the device model
running in a Linux stub domain, it is also needed (at least on my
system) with the device model running in Dom0.

Here is the story:

The patch is titled "qemu: fix wrong mask in pci capability registers 
handling"

There is scant information in the commit message about the nature of
the problem, but I discovered the following in my testing:

On my Intel Haswell system configured for PCI passthrough to the
Xen HVM guest, Qemu does indeed incorrectly set the emulated
register because it uses the wrong mask that disables instead of
enables the PCI_STATUS_CAP_LIST bit of the PCI_STATUS register.

This disabled the MSI-x capability of two of the three PCI devices
passed through to the Xen HVM guest. The problem only
manifests in a bad way in a Linux guest, not in a Windows guest.

One possible reason that only Linux guests are affected is that
I discovered in the Xen xl-dmesg verbose logs that Windows and
Linux use different callbacks for interrupts:

(XEN) Dom1 callback via changed to GSI 28
...
(XEN) Dom3 callback via changed to Direct Vector 0xf3

Dom1 is a Windows Xen HVM and Dom3 is a Linux HVM

Apparently the Direct Vector callback that Linux uses requires
MSI or MSI-x capability of the passed through devices, but the
wrong mask in Qemu disables that capability.

After applying the QubesOS patch to Qemu upstream, the
PCI_STATUS_CAP_LIST bit is set correctly for the guest and
PCI and Intel IGD passthrough works normally because the
Linux guest can make use of the MSI-x capability of the
PCI devices.

The problem was discovered almost five years ago. I don't
know why the fix has not been committed to Qemu
upstream yet.

After this, I was able to discover that the need for libxl to
explicitly grant permission for access to the Intel OpRegion
is only needed for the old traditional device model because
the Xen hypercall to gain permission is included in upstream
Qemu, but it is omitted from the old traditional device model.

So this patch is not needed for users of the upstream device
model who also add the QubesOS patch to fix the
PCI_STATUS_CAP_LIST bit in the PCI_STATUS register.

This all assumes the device model is running in Dom0. The
permission for access to the Intel OpRegion might still be
needed if the upstream device model is running in a stub
domain.

There are other problems in addition to this problem of access
to the Intel OpRegion that are discussed here:

https://www.qubes-os.org/news/2017/10/18/msi-support/

As old as that post is, the feature of allowing PCI and VGA
passthrough to HVM domains is still not well supported,
especially for the case when the device model runs in a
stub domain.

Since my proposed patch only applies to the very insecure
case of the old traditional device model running in Dom0,
I will not pursue it further.

I will look for this feature in future versions of Xen. Currently,
Xen 4.16 advertises support for Linux-based stub domains
as "Tech Preview." So future versions of Xen might handle
this problem in libxl or perhaps in some other way, and also
hopefully the patch to Qemu to fix the PCI capabilities mask
can be committed to Qemu upstream soon so this feature
of Intel IGD passthrough can at least work with Linux
guests and the upstream Qemu running in Dom0.

Regards,

Chuck

>
>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>> index 4bbbfe9f16..a4fc473de9 100644
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>>                     domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>>               return ret;
>>           }
>> +
>> +        /* If this is an Intel IGD, allow access to the IGD opregion */
>> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;
>> +
>> +        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
>> +        uint32_t error = 0xffffffff;
>> +        if (igd_opregion == error) break;
>> +
>> +        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;
>> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
>> +        if (ret < 0) {
>> +            LOGED(ERROR, domid,
>> +                  "failed to give stubdom%d access to iomem range "
>> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
>> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
>> +                                                IGD_OPREGION_PAGES - 1));
>> +            return ret;
>> +        }
>> +        ret = xc_domain_iomem_permission(CTX->xch, domid,
>> +                                         vga_iomem_start,
>> +                                         IGD_OPREGION_PAGES, 1);
> Here, you seems to add permission to an address that is read from the
> pci config space of the device, but as I've pointed above hvmloader
> seems to overwrite this address. It this call to
> xc_domain_iomem_permission() does actually anything useful?
> Or is it by luck that the address returned by
> sysfs_dev_get_igd_opregion() happened to be the address that hvmloader
> is going to write?
>
> Or maybe hvmloader doesn't actually do anything?
>
>
> Some more though on that, looking at QEMU, it seems that there's already
> a call to xc_domain_iomem_permission(), in igd_write_opregion(). So
> adding one in libxl would seems redundant, or maybe it the one for the
> device model's domain that's needed  (named 'stubdom_domid' here)?
>
> Thanks,
>


