Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D4402A9A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 16:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181109.328115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbvv-0004ii-P0; Tue, 07 Sep 2021 14:18:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181109.328115; Tue, 07 Sep 2021 14:18:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNbvv-0004gF-LB; Tue, 07 Sep 2021 14:18:43 +0000
Received: by outflank-mailman (input) for mailman id 181109;
 Tue, 07 Sep 2021 14:18:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNbvu-0004g9-3O
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 14:18:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNbvq-0005oi-JY; Tue, 07 Sep 2021 14:18:38 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNbvq-0004tO-BP; Tue, 07 Sep 2021 14:18:38 +0000
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
	bh=BgwjwoRffSORjuYOIjYU6JiyDgimHWexiXbdlk6/CCE=; b=Pb8RniQnpbLpN97SzuDt6ciO/l
	lubmC3unY3XmmqFTaEZxpWMyJGXMpli5q7YLSDM9oGZE+plZljbzEOSkoNes38vSyMu2sGA0eYmRt
	LeQHFZI22xfQhcj42iSW/Tt7WQuyDU4tSDANhYqRDmbtVZGtxX17SYOCqckme8LApoCE=;
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
 <1efbd9a8-232b-b267-fa8e-7f5f1af7cfed@xen.org>
 <5DA71CEF-0ADE-4846-A7BC-B378B95A38AD@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <910f2758-cbce-53b0-4e57-4b2a966ce2b3@xen.org>
Date: Tue, 7 Sep 2021 15:18:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5DA71CEF-0ADE-4846-A7BC-B378B95A38AD@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Luca,

On 07/09/2021 14:30, Luca Fancellu wrote:
>> On 7 Sep 2021, at 13:30, Julien Grall <julien@xen.org> wrote:
>> On 07/09/2021 12:51, Luca Fancellu wrote:
>>>> On 7 Sep 2021, at 10:35, Julien Grall <julien@xen.org> wrote:
>>>> What we could do is providing a list of binaries to load and associate a key for each of them. Something like:
>>>>
>>>> binary=<binary> <key>
>>>> binary=<binary2> <key2>
>>>> ....
>>>>
>>>> We can then replace the property "reg" with a new property "uefi,key" that will contain the name of the binary.
>>>>
>>>> What do you think?
>>> Here I’m lost, because I don’t understand what we are going to do with the name of the binary.
>>
>> <binaryX> would be used by the UEFI stub to load the binary in memory. Each binary will have a <keyX> which helps to refer them in the Device-Tree. To give a concrete example, let say we have two dom0less domains:
>>   - DomA: 2 vCPUs, 128MB
>>   - DomB: 3 vCPUs, 512MB
>>
>> DomA and DomB will be using the same kernel but a different ramdisk. xen.cfg, would look like:
>>
>> [global]
>> default=section1
>>
>> [section1]
>> options=console=vga,com1 com1=57600 loglvl=all noreboot
>> kernel=vmlinuz-3.0.31-0.4-xen [domain 0 command line options]
>> ramdisk=initrd-3.0.31-0.4-xen
>> xsm=<filename>
>> dtb=devtree.dtb
>> binary=vmlinuz-guest domu-kernel
>> binary=ramdisk-domA.img domA-ramdisk
>> binary=ramdisk-domB.img domB-ramdisk
>>
>> The chosen node in the DT would look like:
>>
>> chosen {
>>     domU1 {
>>         compatible = "xen,domain";
>>         #address-cells = <0x2>;
>>         #size-cells = <0x1>;
>>         memory = <0 0x8000000>;
>>         cpus = <2>;
>>
>>         module@1 {
>>             compatible = "multiboot,kernel", "multiboot,module";
>>             uefi,binary = "domu-kernel";
>>             bootargs = "console=ttyAMA0 init=/bin/sh";
>>         };
>>
>>         module@2 {
>>             compatible = "multiboot,ramdisk", "multiboot,module";
>>             uefi,binary = "domA-ramdisk";
>>         };
>>     };
>>
>>     domU2 {
>>         compatible = "xen,domain";
>>         #address-cells = <0x3>;
>>         #size-cells = <0x1>;
>>         memory = <0 0x20000000>;
>>         cpus = <3>;
>>
>>         module@1 {
>>             compatible = "multiboot,kernel", "multiboot,module";
>>             uefi,binary = "domu-kernel";
>>             bootargs = "console=ttyAMA0 init=/bin/sh";
>>         };
>>
>>         module@2 {
>>             compatible = "multiboot,ramdisk", "multiboot,module";
>>             uefi,binary = "domA-ramdisk";
>>         };
>>     };
>> };
>>
>> With this approach, the change is quite minimal to move between an classic U-boot boot and EFI boot.
> 
> Ok now I see, yes this approach can work and can save some code, in the current code we have that if
> a "multiboot,module” is found in the dtb, the Xen EFI configuration file is skipped, but if we use the
> module@XX {} without the compatible it can work, the UEFI stub will load the binary and update all
> the needed properties (compatible, reg).
With my proposal, you don't know whether the binary is a kernel, 
ramdisk... So you wouldn't be able to recreate the compatible properly.

But the behavior of the UEFI stub can be modified. We could say that if 
there is a "xen,domain" then use the configuration file to fetch the 
binaries.

Cheers,

-- 
Julien Grall

