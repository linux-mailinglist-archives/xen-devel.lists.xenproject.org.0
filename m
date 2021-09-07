Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3B64028D2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181010.327957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNaFa-0000mk-Tb; Tue, 07 Sep 2021 12:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181010.327957; Tue, 07 Sep 2021 12:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNaFa-0000jq-Pq; Tue, 07 Sep 2021 12:30:54 +0000
Received: by outflank-mailman (input) for mailman id 181010;
 Tue, 07 Sep 2021 12:30:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNaFZ-0000jk-CN
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:30:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNaFV-0003uY-RY; Tue, 07 Sep 2021 12:30:49 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNaFV-0003Kr-Kj; Tue, 07 Sep 2021 12:30:49 +0000
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
	bh=3WWgZmgWXQnQKchVGG3MzV2yIqBwyB+TS5pKQRzF5DY=; b=T8nMCBhO8U7R7fpQOm/3AmZiNy
	BSjLYkXc2v9mwDZdUqnP3mblMQESiVKe56E4oIqtn/Gqv/ITJYxV7IrWT3G/ypHI35g6Ew0FX8dBo
	ZTMIxkD3PSnNL2ZoUxaKUg3saHP1Noo+tV4TReHtvezUHSu+vX5X4YCDhL5T4eJQ0ydE=;
Subject: Re: [RFC PATCH] xen/design: Add design for EFI dom0less system start
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210907065228.21794-1-luca.fancellu@arm.com>
 <4bab7902-0268-5705-5462-fcd7571d7492@xen.org>
 <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
Date: Tue, 7 Sep 2021 13:30:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <7BD59287-75ED-4D4F-B892-F6B04583A986@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 07/09/2021 12:51, Luca Fancellu wrote:
> 
> 
>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 07/09/2021 07:52, Luca Fancellu wrote:
>>> Add a design describing a proposal to improve the EFI
>>> configuration file, adding keywords to describe domU
>>> guests and allowing to start a dom0less system.
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>>   docs/designs/efi-arm-dom0less.md | 105 +++++++++++++++++++++++++++++++
>>>   1 file changed, 105 insertions(+)
>>>   create mode 100644 docs/designs/efi-arm-dom0less.md
>>> diff --git a/docs/designs/efi-arm-dom0less.md b/docs/designs/efi-arm-dom0less.md
>>> new file mode 100644
>>> index 0000000000..8d8fa2243f
>>> --- /dev/null
>>> +++ b/docs/designs/efi-arm-dom0less.md
>>> @@ -0,0 +1,105 @@
>>> +# Xen EFI configuration file
>>> +
>>> +The current configuration file used by Xen when it is started as an EFI
>>> +application is considering only the dom0 guest and doesn't have any
>>> +property to describe and load in memory domU guests.
>>
>>  From my understanding, the problem is less about properties (we already have them in the Device-Tree) but more about where are the binaries located in memory as we don't know in advance.
> 
> Hi Julien,
Hi Luca,

> I think I used the wrong word there, I meant “keyword” instead of “property” because I was referring about the
> lack of keywords to describe a domu guest in the Xen EFI configuration file.
> 
> I agree with you that on systems with static allocation, the kernel and ramdisk binaries must be at certain locations
> that are out of control when we use the EFI boot services, the thing we can do is provide a keyword to specify the
> addresses and then use the CopyMem() function to relocate the kernel/ramdisk in the address we want.

I wasn't specifically referring to static allocation here, sorry if this 
wasn't clear. I was pointing out that most of the information you create 
in the xen.cfg is going to be similar to what we already provide in the 
Device-Tree.

My main concern is everytime we add a new feature in Dom0less, a 
developer would need to write code for the DT and UEFI. This will 
increase the code size and maintenance.

The same can be said for the admin as if they want to switch from plain 
U-boot to UEFI, they would also need to fully rewrite the bindings.

AFAICT, most of the information provided in the Device-Tree are usable 
even when using UEFI. So I would prefer if we try to re-use what's 
existing. This is what my proposal below was about.

> 
>>
>> So I would like to propose something that build on top of the Device-Tree work we did. Note this is early thoughts.
>>
>> The problematic nodes in the DT are:
>>
>>         module@0x4a000000 {
>>             compatible = "multiboot,kernel", "multiboot,module";
>>             reg = <0x0 0x4a000000 0xffffff>;
>>             bootargs = "console=ttyAMA0 init=/bin/sh";
>>         };
>>
>>         module@0x4b000000 {
>>             compatible = "multiboot,ramdisk", "multiboot,module";
>>             reg = <0x0 0x4b000000 0xffffff>;
>>         };
>>
>> In particular the property "reg" cannot be known in advance because the UEFI stub will be responsible to load the binaries in memory.
> 
> Yes that’s true, the UEFI stub is using from the UEFI boot service the AllocatePages function that is giving back an address out of our control,
> then using another function the binary is read from the disk and copied at that address, finally the UEFI stub is writing the node in the device tree that
> will be used by Xen later.

I am not sure to follow. Are you saying the UEFI stub will create the 
dom0less node in the DT based on the xen.cfg?

> 
>>
>> What we could do is providing a list of binaries to load and associate a key for each of them. Something like:
>>
>> binary=<binary> <key>
>> binary=<binary2> <key2>
>> ....
>>
>> We can then replace the property "reg" with a new property "uefi,key" that will contain the name of the binary.
>>
>> What do you think?
> 
> Here I’m lost, because I don’t understand what we are going to do with the name of the binary.

<binaryX> would be used by the UEFI stub to load the binary in memory. 
Each binary will have a <keyX> which helps to refer them in the 
Device-Tree. To give a concrete example, let say we have two dom0less 
domains:
   - DomA: 2 vCPUs, 128MB
   - DomB: 3 vCPUs, 512MB

DomA and DomB will be using the same kernel but a different ramdisk. 
xen.cfg, would look like:

[global]
default=section1

[section1]
options=console=vga,com1 com1=57600 loglvl=all noreboot
kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
ramdisk=initrd-3.0.31-0.4-xen
xsm=<filename>
dtb=devtree.dtb
binary=vmlinuz-guest domu-kernel
binary=ramdisk-domA.img domA-ramdisk
binary=ramdisk-domB.img domB-ramdisk

The chosen node in the DT would look like:

chosen {
     domU1 {
         compatible = "xen,domain";
         #address-cells = <0x2>;
         #size-cells = <0x1>;
         memory = <0 0x8000000>;
         cpus = <2>;

         module@1 {
             compatible = "multiboot,kernel", "multiboot,module";
             uefi,binary = "domu-kernel";
             bootargs = "console=ttyAMA0 init=/bin/sh";
         };

         module@2 {
             compatible = "multiboot,ramdisk", "multiboot,module";
             uefi,binary = "domA-ramdisk";
         };
     };

     domU2 {
         compatible = "xen,domain";
         #address-cells = <0x3>;
         #size-cells = <0x1>;
         memory = <0 0x20000000>;
         cpus = <3>;

         module@1 {
             compatible = "multiboot,kernel", "multiboot,module";
             uefi,binary = "domu-kernel";
             bootargs = "console=ttyAMA0 init=/bin/sh";
         };

         module@2 {
             compatible = "multiboot,ramdisk", "multiboot,module";
             uefi,binary = "domA-ramdisk";
         };
     };
};

With this approach, the change is quite minimal to move between an 
classic U-boot boot and EFI boot.

Cheers,

-- 
Julien Grall

