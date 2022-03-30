Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C294ECAA3
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 19:28:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296459.504626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZc6m-0004iT-J2; Wed, 30 Mar 2022 17:27:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296459.504626; Wed, 30 Mar 2022 17:27:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZc6m-0004fE-Fq; Wed, 30 Mar 2022 17:27:48 +0000
Received: by outflank-mailman (input) for mailman id 296459;
 Wed, 30 Mar 2022 17:27:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5fr=UJ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nZc6l-0004e6-54
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 17:27:47 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5434510-b04e-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 19:27:44 +0200 (CEST)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:52158)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nZc6h-000AEC-KW (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 30 Mar 2022 18:27:43 +0100
Received: from [192.168.1.10] (host-78-149-3-47.as13285.net [78.149.3.47])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 2095D1FA4C;
 Wed, 30 Mar 2022 18:27:43 +0100 (BST)
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
X-Inumbo-ID: b5434510-b04e-11ec-a405-831a346695d4
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <408e5e07-453c-f377-a5b0-c421d002aec5@srcf.net>
Date: Wed, 30 Mar 2022 18:27:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>,
 Chuck Zmudzinski <brchuckz@netscape.net>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
 <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
In-Reply-To: <YkSQIoYhomhNKpYR@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/03/2022 18:15, Anthony PERARD wrote:
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
>     if ( vendor_id == 0x8086 )
>     {
>         igd_opregion_pgbase = mem_hole_alloc(IGD_OPREGION_PAGES);
>         /*
>          * Write the the OpRegion offset to give the opregion
>          * address to the device model. The device model will trap
>          * and map the OpRegion at the give address.
>          */
>         pci_writel(vga_devfn, PCI_INTEL_OPREGION,
>                    igd_opregion_pgbase << PAGE_SHIFT);
>     }
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
>
>> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
>> index 4bbbfe9f16..a4fc473de9 100644
>> --- a/tools/libs/light/libxl_pci.c
>> +++ b/tools/libs/light/libxl_pci.c
>> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>>                    domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>>              return ret;
>>          }
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

This has been discussed before, but noone's done anything about it. 
It's a massive layering violation for QEMU to issue
xc_domain_iomem_permission()/etc hypercalls.

It should be the toolstack, and only the toolstack, which makes
permissions hypercalls, which in turn will fix a slew of "QEMU doesn't
work when it doesn't have dom0 superpowers" bugs with stubdomains.

In this case specifically, the opregion is a magic Intel graphics
specific bodge.  The i915 driver in the guest really does need to access
part of the real PCH during init, which (in Xen's permission model)
really does require permitting access to the MMIO range (8k iirc) so it
can be mapped as a BAR in QEMU's emulated PCH.

~Andrew

