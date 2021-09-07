Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF18C402616
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 11:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180679.327427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXEp-0007zl-Iw; Tue, 07 Sep 2021 09:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180679.327427; Tue, 07 Sep 2021 09:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNXEp-0007wU-F6; Tue, 07 Sep 2021 09:17:55 +0000
Received: by outflank-mailman (input) for mailman id 180679;
 Tue, 07 Sep 2021 09:17:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNXEn-0007wO-Qd
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 09:17:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXEn-0000JL-0s; Tue, 07 Sep 2021 09:17:53 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNXEm-0005Iv-QG; Tue, 07 Sep 2021 09:17:52 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xaPEDbTrlEdxGiPgvs3r61r+qm7NtTnC/Clpi0CTVhs=; b=twy/ZRMOwHvl1PKqlHGOecN0VG
	EcNXYeGjhtAstKYZwwpqW8Os7RIjOTnrgap5Tbb8/Algg4NyE54DKRtU8mRUAN+kgEB5UAIxn8i9F
	O8GHOtDfguExvTn7bUggb641ILmDYUCFhSiEzgjyztcgDZ7M76YRNPX4Zr0fhLbKzW70=;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <ea736db5-e3cf-7eea-cffe-98ecb0290048@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3222722f-b12e-3991-d0de-b455b9fca063@xen.org>
Date: Tue, 7 Sep 2021 10:17:50 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ea736db5-e3cf-7eea-cffe-98ecb0290048@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 07/09/2021 09:33, Jan Beulich wrote:
> On 07.09.2021 08:52, Luca Fancellu wrote:
>> Add a design describing a proposal to improve the EFI
>> configuration file, adding keywords to describe domU
>> guests and allowing to start a dom0less system.
>>
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>>   docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
>>   1 file changed, 105 insertions(+)
>>   create mode 100644 docs/designs/efi-arm-dom0less.md
>>
>> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom0less.md
>> new file mode 100644
>> index 0000000000..8d8fa2243f
>> --- /dev/null
>> +++ b/docs/designs/efi-arm-dom0less.md
>> @@ -0,0 +1,105 @@
>> +# Xen EFI configuration file
>> +
>> +The current configuration file used by Xen when it is started as an EFI
>> +application is considering only the dom0 guest and doesn't have any
>> +property to describe and load in memory domU guests.
>> +Hence currently it's impossible to start a dom0less system using EFI.
>> +
>> +# Objective
>> +
>> +This document describes the proposed improvement to the Xen EFI
>> +configuration file to list properly both the dom0 guest and the domU
>> +guests as well.
>> +The final goal is to be able to start a dom0less system using EFI.
>> +
>> +# Current Xen EFI configuration file
>> +
>> +The current configuration file is described by the documentation page
>> +https://xenbits.xenproject.org/docs/unstable/misc/efi.html.
>> +
>> +Here an example:
>> +
>> +```
>> +[global]
>> +default=section1
>> +
>> +[section1]
>> +options=console=vga,com1 com1=57600 loglvl=all noreboot
>> +kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>> +ramdisk=initrd-3.0.31-0.4-xen
>> +xsm=<filename>
>> +dtb=devtree.dtb
>> +```
>> +
>> +# Proposed improvement
>> +
>> +The proposed improvement to the current configuration file is the
>> +introduction of new keywords to describe additional domUs.
>> +
>> +Here follows the proposed new keywords:
>> +  - domu#_kernel=<kernel file> [domU command line options]
>> +    - Mandatory kernel file for the domU#
>> +  - domu#_ramdisk=<ramdisk file>
>> +    - Optional ramdisk file for the domU#
>> +  - domu#_dtb=<dtb file>
>> +    - Optional dtb fragment file for the domU#, it is used for device
>> +      assignment (passthrough).
>> +  - domu#_property=cpus=2
>> +    - Properties that should be added to the dtb in the domU node to
>> +      properly describe the domU guest. Refer to the documentation:
>> +      https://xenbits.xenproject.org/docs/unstable/misc/arm/device-tree/booting.txt,
>> +      section "Creating Multiple Domains directly from Xen".
>> +
>> +For all the keywords above, the # is a number that uniquely identifies
>> +the guest.
>> +The keywords domu#_kernel, domu#_ramdisk, domu#_dtb are unique, therefore there
>> +must not be specified the same keyword twice in a section.
>> +The # number is not enforcing any domid, it is just used to link each property
>> +to the right guest, so there can be domu1_* guests that are started with domid 2
>> +and so on.
>> +
>> +The domu#_property can appear multiple times and it specifies an additional
>> +property to be listed in the domU node inside the device tree, Xen will
>> +not check if the same content is specified multiple times.
>> +
>> +There are some property whose name starts with an hash symbol (#address-cells,
>> +#size-cells), in this case the line will be considered as a comment, so to
>> +specify them, they have to be listed without the hash symbol, the documentation
>> +will be updated as well to see the implemented handling of these special
>> +properties.
>> +
>> +# Example of a configuration file describing a dom0less system
>> +
>> +The following configuration file is describing a dom0less system starting two
>> +guests.
>> +
>> +```
>> +[global]
>> +default=xen
>> +
>> +[xen]
>> +# Xen boot arguments
>> +options=noreboot console=dtuart dtuart=serial0 bootscrub=0
>> +# Xen device tree
>> +dtb=devtree.dtb
>> +
>> +# Guest 1
>> +domu1_property=address-cells=2
>> +domu1_property=size-cells=2
>> +domu1_kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
>> +domu1_property=cpus=1
>> +domu1_property=memory=0xC0000
>> +domu1_dtb=domu.dtb
>> +
>> +# Guest 2
>> +domu2_kernel=Image-domu2.bin console=ttyAMA0 root=/dev/ram0 rw
>> +domu2_property=cpus=2
>> +domu2_property=memory=0x100000
>> +domu2_property=vpl011
>> +```
> 
> I'd like to suggest a different scheme, not the least because I expect
> the individual domains being independent of e.g. hypervisor command
> line options or Dom0 kernel versions. Yet varying sets of these are,
> for example, a reason to have multiple sections in the current scheme.
> Every dom0less guest would then require spelling out in every such
> section. Hence I think we'd be better off having a section per guest:
> 
> [guest1]
> kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
> property=cpus=1
> property=memory=0xC0000
> dtb=domu.dtb

I much prefer the idea of the section. This is going to be easier to 
parse the configuration file as we would not have to look for "domuX_" 
and then distinguishing X.

> 
> These sections would then be referenced by other sections, e.g. by a
> new "guests" (or "domus", but this ends up looking a little odd for
> its matching of an unrelated latin word) keyword:
> 
> guests=guest1,guest2
> 
> If it is deemed necessary to make sure such a section can't be
> (mistakenly) used to create Dom0, such sections would need identifying
> in some way. Presence of property= (or, as per below, properties=)
> could be one means (allowing an empty setting would then be desirable).

I would expect dom0 to be described in the similar fashion at some 
point. So maybe we should name the property "domains=...".

> 
> As to the properties, is there anything wrong with having them all on
> one line:
> 
> [guest1]
> kernel=Image-domu1.bin console=ttyAMA0 root=/dev/ram0 rw
> dtb=domu.dtb
> properties=cpus=1 memory=0xC0000

It depends on the number of properties for the domain, this may become 
quickly unreadable.

But... if we use sections, then I think it would be better to have:

kernel=..
dtb=...
cpu=1
memory=0xC0000

This would also allow us to create more complex setup (such as for the 
static memory allocation).

Cheers,

-- 
Julien Grall

