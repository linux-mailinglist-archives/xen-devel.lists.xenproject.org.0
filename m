Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB2AD7567
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 17:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013219.1391728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjb8-0001OS-AJ; Thu, 12 Jun 2025 15:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013219.1391728; Thu, 12 Jun 2025 15:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjb8-0001Mg-7j; Thu, 12 Jun 2025 15:12:10 +0000
Received: by outflank-mailman (input) for mailman id 1013219;
 Thu, 12 Jun 2025 15:12:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BvDY=Y3=bounce.vates.tech=bounce-md_30504962.684aee43.v1-3dc01c07460f42b1af093b4f015f6dbe@srs-se1.protection.inumbo.net>)
 id 1uPjb7-0001MH-2m
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 15:12:09 +0000
Received: from mail145-24.atl61.mandrillapp.com
 (mail145-24.atl61.mandrillapp.com [198.2.145.24])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 994268d9-479f-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 17:12:05 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-24.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4bJ5bl4kHdzGlspPt
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 15:12:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3dc01c07460f42b1af093b4f015f6dbe; Thu, 12 Jun 2025 15:12:03 +0000
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
X-Inumbo-ID: 994268d9-479f-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749741123; x=1750011123;
	bh=coH9VYj8t+cm8lyP6/1kT4a2yF9O9ZN1zz2YvmgHxes=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b7+cKclpRzdo678MH7N7S2huMmM1PFmKjwQH9+19yW0HDuzgTUJ732HtnfGuhR3Ln
	 Vl1DxrP2QfubTbLCyI6ZrXVZXXo2Vp0H7v+mQ34B1JvHHHhIkQYE8scADrstF4gujq
	 gVHtq9yZ3WxvyP1lwU3UvFBOkVEtTrOuHKOBw7eQSKzIZG70UsVtwcZQW0eKoQHCPK
	 Z98bbLxZenaj2TCqGNgfK5g/TySxXg11/nKc+JNpjowpV5Gzd03SEl+wxAVYVdg578
	 6H5wp00/8M9v0Yq3ShPpSaDC2bhde5rE+3eFQdCQx/1PBzsgN8nq8i5XYJxvRG9qM+
	 RAsaNZqY5tfnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749741123; x=1750001623; i=ngoc-tu.dinh@vates.tech;
	bh=coH9VYj8t+cm8lyP6/1kT4a2yF9O9ZN1zz2YvmgHxes=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=F6x0uYkpMKM6+ZpK9N7hPJN1rKSWY/PFIX3LAW3dBxb6hxypKdQSlwXKoon2XsmVy
	 J53a/L4rPEbYjRRk+KN1hZiYAxvft9x/19fEBHb01jLHjY7yd7dC6FtE5Abya6/F/Y
	 FHXgJAlmcFsJrEw+tZJQoO7LaRE41h01zJPzQgKC0wrQ4iuFG/hAM95X/A5G4n0AYs
	 rcRv6OL/j9yFszbHzvZ/p1dthuC7OLYe/j35P61k5FE6N3W5S2Wu8dCve02LMwQDWG
	 nNS0WWTqsvze5UADfxa/ZacaP+l0J/W0/wG+ezggiGYjzNsLWdFtIhO4odmkc/4UN4
	 8/X2CHYCaI9ZQ==
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4]=20x86/hvmloader:=20select=20xenpci=20MMIO=20BAR=20UC=20or=20WB=20MTRR=20cache=20attribute?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749741122123
Message-Id: <60a346b7-82f5-46ba-84f7-82c449bc0506@vates.tech>
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony@xenproject.org>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, "Community Manager" <community.manager@xenproject.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Anthoine Bourgeois" <anthoine.bourgeois@vates.tech>
References: <20250610162930.89055-1-roger.pau@citrix.com> <aEm8LuDrNBqjgaWF@l14> <aErqkcLYqTkykpp5@macbook.local>
In-Reply-To: <aErqkcLYqTkykpp5@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3dc01c07460f42b1af093b4f015f6dbe?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 15:12:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12/06/2025 16:57, Roger Pau Monn=C3=A9 wrote:
> On Wed, Jun 11, 2025 at 07:26:06PM +0200, Anthony PERARD wrote:
>> On Tue, Jun 10, 2025 at 06:29:30PM +0200, Roger Pau Monne wrote:
>>> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
>>> index c388899306c2..ddbff6fffc16 100644
>>> --- a/docs/man/xl.cfg.5.pod.in
>>> +++ b/docs/man/xl.cfg.5.pod.in
>>> @@ -2351,6 +2351,14 @@ Windows L<https://xenproject.org/windows-pv-driv=
ers/>.
>>>   Setting B<xen_platform_pci=3D0> with the default device_model "qemu-x=
en"
>>>   requires at least QEMU 1.6.
>>>   
>>> +
>>> +=3Ditem B<xenpci_bar_uc=3DBOOLEAN>
>>> +
>>> +B<x86 only:> Select whether the memory BAR of the Xen PCI device shoul=
d have
>>> +uncacheable (UC) cache attribute set in MTRR.
>>
>> For information, here are different name used for this pci device:
>>
>> - man xl.cfg:
>>      xen_platform_pci=3D<bool>
>>          Xen platform PCI device
>> - QEMU:
>>      -device xen-platform
>>      in comments: XEN platform pci device
>>      with pci device-id PCI_DEVICE_ID_XEN_PLATFORM
>> - EDK2 / OVMF:
>>      XenIoPci
>>          described virtual Xen PCI device
>>          But XenIo is a generic protocol in EDK2
>>      Before XenIo, the pci device would be linked to XenBus, and
>>      loaded with PCI_DEVICE_ID_XEN_PLATFORM
>> - Linux:
>>      Seems to be called "xen-platform-pci"
>>
>> Overall, this PCI device is mostly referenced as the Xen Platform PCI
>> device. So "xenpci" or "Xen PCI device" is surprising to me, and I'm not
>> quite sure what it is.
> 
> I can do xen_platform_pci_bar_uc, but it seems a bit long.
> 
>>
>>> +
>>> +Default is B<true>.
>>> +
>>>   =3Ditem B<viridian=3D[ "GROUP", "GROUP", ...]> or B<viridian=3DBOOLEA=
N>
>>>   
>>>   The groups of Microsoft Hyper-V (AKA viridian) compatible enlightenme=
nts
>>> diff --git a/tools/firmware/hvmloader/pci.c b/tools/firmware/hvmloader/=
pci.c
>>> index cc67b18c0361..cfd39cc37cdc 100644
>>> --- a/tools/firmware/hvmloader/pci.c
>>> +++ b/tools/firmware/hvmloader/pci.c
>>> @@ -116,6 +116,8 @@ void pci_setup(void)
>>>        * experience the memory relocation bug described below.
>>>        */
>>>       bool allow_memory_relocate =3D 1;
>>> +    /* Select the MTRR cache attribute of the xenpci device BAR. */
>>> +    bool xenpci_bar_uc =3D false;
>>
>> This default value for `xenpci_bar_uc` mean that hvmloader changes
>> behavior compared to previous version, right? Shouldn't we instead have
>> hvmloader keep the same behavior unless the toolstack want to use the
>> new behavior? (Like it's done for `allow_memory_relocate`,
>> "platform/mmio_hole_size")
>>
>> It would just mean that toolstack other than `xl` won't be surprised by
>> a change of behavior.
> 
> My plan was that we didn't need changes to XAPI to implement this new
> mode, but given the comment I will change to keep the previous
> behavior in absence of a xenstore node.
> 
>>
>>>       BUILD_BUG_ON((typeof(*pci_devfn_decode_type))PCI_COMMAND_IO !=3D
>>>                    PCI_COMMAND_IO);
>>> @@ -130,6 +132,12 @@ void pci_setup(void)
>>>       printf("Relocating guest memory for lowmem MMIO space %s\n",
>>>              allow_memory_relocate?"enabled":"disabled");
>>>   
>>> +    s =3D xenstore_read(HVM_XS_XENPCI_BAR_UC, NULL);
>>> +    if ( s )
>>> +        xenpci_bar_uc =3D strtoll(s, NULL, 0);
>>> +    printf("XenPCI device BAR MTRR cache attribute set to %s\n",
>>> +           xenpci_bar_uc ? "UC" : "WB");
>>> +
>>>       s =3D xenstore_read("platform/mmio_hole_size", NULL);
>>>       if ( s )
>>>           mmio_hole_size =3D strtoll(s, NULL, 0);
>>> @@ -271,6 +279,44 @@ void pci_setup(void)
>>>               if ( bar_sz =3D=3D 0 )
>>>                   continue;
>>>   
>>> +            if ( !xenpci_bar_uc &&
>>> +                 ((bar_data & PCI_BASE_ADDRESS_SPACE) =3D=3D
>>> +                   PCI_BASE_ADDRESS_SPACE_MEMORY) &&
>>> +                 vendor_id =3D=3D 0x5853 &&
>>> +                 (device_id =3D=3D 0x0001 || device_id =3D=3D 0x0002) =
)
>>
>> We don't have defines for 0x5853 in the tree (and those device_id)?
>> Maybe introduce at least one for the vendor_id:
>>
>> These two names are use by QEMU, OVMF, Linux, for example.
>>
>> #define PCI_VENDOR_ID_XEN           0x5853
>> #define PCI_DEVICE_ID_XEN_PLATFORM  0x0001
>>
>> There's even PCI_DEVICE_ID_XEN_PLATFORM_XS61 in Linux
> 
> You mean in the public headers?
> 
> For Device IDs we have ranges allocated to downstream vendors, I'm not
> sure we want to keep track of whatever IDs they use for their devices.
> OTOH, not tracking those IDs here means OSes are likely to miss
> additions of new Xen platform PCI devices?
> 

The devices starting from ID c000 are supposed to be xen_pvdevice, which 
are separate device types that work differently from Xen platform PCI 
devices. So I think you only need to check for 
PCI_DEVICE_ID_XEN_PLATFORM{,_XS61} unless another platform PCI ID gets 
defined some day.

> I could introduce public/pci.h to contain those IDs, but I would like
> consensus on what should be there, otherwise this patch will get
> stuck.
> 
>>
>>> diff --git a/tools/firmware/hvmloader/util.c b/tools/firmware/hvmloader=
/util.c
>>> index 79c0e6bd4ad2..31b4411db7b4 100644
>>> --- a/tools/firmware/hvmloader/util.c
>>> +++ b/tools/firmware/hvmloader/util.c
>>> @@ -867,7 +867,7 @@ void hvmloader_acpi_build_tables(struct acpi_config=
 *config,
>>>           config->table_flags |=3D ACPI_HAS_HPET;
>>>   
>>>       config->pci_start =3D pci_mem_start;
>>> -    config->pci_len =3D pci_mem_end - pci_mem_start;
>>> +    config->pci_len =3D RESERVED_MEMBASE - pci_mem_start;
>>>       if ( pci_hi_mem_end > pci_hi_mem_start )
>>>       {
>>>           config->pci_hi_start =3D pci_hi_mem_start;
>>> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_c=
reate.c
>>> index 8bc768b5156c..962fa820faec 100644
>>> --- a/tools/libs/light/libxl_create.c
>>> +++ b/tools/libs/light/libxl_create.c
>>> @@ -313,6 +313,7 @@ int libxl__domain_build_info_setdefault(libxl__gc *=
gc,
>>>           libxl_defbool_setdefault(&b_info->u.hvm.usb,                f=
alse);
>>>           libxl_defbool_setdefault(&b_info->u.hvm.vkb_device,         t=
rue);
>>>           libxl_defbool_setdefault(&b_info->u.hvm.xen_platform_pci,   t=
rue);
>>> +        libxl_defbool_setdefault(&b_info->u.hvm.xenpci_bar_uc,      tr=
ue);
>>>           libxl_defbool_setdefault(&b_info->u.hvm.pirq,               f=
alse);
>>>   
>>>           libxl_defbool_setdefault(&b_info->u.hvm.spice.enable, false);
>>> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.=
c
>>> index 4d67b0d28294..60ec0354d19a 100644
>>> --- a/tools/libs/light/libxl_dom.c
>>> +++ b/tools/libs/light/libxl_dom.c
>>> @@ -819,6 +819,15 @@ static int hvm_build_set_xs_values(libxl__gc *gc,
>>>               goto err;
>>>       }
>>>   
>>> +    if (info->type =3D=3D LIBXL_DOMAIN_TYPE_HVM &&
>>> +        libxl_defbool_val(info->u.hvm.xenpci_bar_uc)) {
>>
>> I think this condition is wrong. You should always write the value of
>> xenpci_bar_uc into xenstore, or only write it if a value have been
>> selected. But I guess we already lost the information here about whether
>> the value is the default or not, and it's probably not important, so I
>> think you should always write the value.
> 
> Indeed, whether the value is the default or the user-selected one is
> lost by the time we get here.
> 
> I would adjust according to the above comments, but I would suggest we
> leave out the addition of the Xen platform PCI device IDs to a
> separate patch, as I fear it will block the patch otherwise.
> 
> Thanks, Roger.
> 

Best regards,


Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



