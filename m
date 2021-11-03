Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBF34448B0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 19:58:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221143.382699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLSE-00028k-Gq; Wed, 03 Nov 2021 18:57:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221143.382699; Wed, 03 Nov 2021 18:57:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLSE-00026J-Dj; Wed, 03 Nov 2021 18:57:46 +0000
Received: by outflank-mailman (input) for mailman id 221143;
 Wed, 03 Nov 2021 18:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1miLSC-00026D-Nh
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1miLSC-0007SC-Dn; Wed, 03 Nov 2021 18:57:44 +0000
Received: from [54.239.6.186] (helo=[192.168.4.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1miLSC-00017d-7P; Wed, 03 Nov 2021 18:57:44 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=qZlAdGIcpw0bvP4NYJYm+JVlaFPs4whD1YUrtf25hFc=; b=B28KZAIKFLF0bhReK79F6vMSEz
	1nsMipqqmVF8AqDsnOFqyjSo/xQCHmLK4apl5ZAYcoJZtWdxpke95K0Mt0bDQOfNDP5AQIUNx3nvQ
	TQ3XfPhuPCFoAjjwOGdg0dZHUfqHNhcUK4qr5q0SsxLiXUnDHe0Ltiv+5qZPiELz6KMQ=;
Message-ID: <f4daf916-06bd-e002-8b74-be6fb45ef257@xen.org>
Date: Wed, 3 Nov 2021 18:57:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: Arm EFI boot issue for Dom0 module listed inside subnode of
 chosen
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com
References: <8A60FA62-2BAA-400B-BB53-AB3E8CCA67F1@arm.com>
 <alpine.DEB.2.21.2111021625160.18170@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2111021625160.18170@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca and Stefano,

On 02/11/2021 23:36, Stefano Stabellini wrote:
> On Tue, 2 Nov 2021, Luca Fancellu wrote:
>> Hi all,
>>
>> We recently discovered that there is a way to list Dom0 modules that is not supported by the EFI boot,
>> It’s happened browsing some Wiki pages like this one:
>> https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensions/Lager
>>
>> In that page the Dom0 modules are listed inside a subnode of the /chosen node:
>>
>> chosen {
>>
>>      modules {
>>          #address-cells = <1>;
>>          #size-cells = <1>;
>>
>>          module@0x72000000 {
>>              compatible = "multiboot,kernel", "multiboot,module";
>>              reg = <0x72000000 0x2fd158>;
>>          };
>>
>>          module@0x74000000 {
>>              compatible = "xen,xsm-policy", "multiboot,module";
>>              reg = <0x74000000 0x2559>;
>>          };
>>      };
>> };
>>
>> Instead for how it is implemented now in the EFI code and described in:
>> 1) https://xenbits.xen.org/docs/unstable/misc/arm/device-tree/booting.txt
>> 2) https://xenbits.xen.org/docs/unstable/misc/efi.html
>>
>> Only the following approach is supported, so Dom0 modules must be a direct child of /chosen:

Do you mean this is not supported after your changes or this was never 
supported? (see more below).

>>
>> chosen {
>>      #address-cells = <1>;
>>      #size-cells = <1>;
>>
>>      module@0x72000000 {
>>          compatible = "multiboot,kernel", "multiboot,module";
>>          reg = <0x72000000 0x2fd158>;
>>      };
>>
>>      module@0x74000000 {
>>          compatible = "xen,xsm-policy", "multiboot,module";
>>          reg = <0x74000000 0x2559>;
>>      };
>> };
>>
>> Is this a problem that needs a fix?
> 
> 
> Let me start by saying that I don't feel strongly either way, so I am
> happy to go with other people's opinion on this one.
> 
> In this kind of situations I usually look at two things:
> - what the specification says
> - what the existing code actually does
> 
> In general, I try to follow the specification unless obviously
> production code relies on something that contradicts the spec, in which
> case I'd say to update the spec.
> 
> In this case, although it is true that "modules" could be nice to have,
> it is missing a compatible string,

There are a few nodes in the DT without compatible (e.g. cpus, memory, 
chosen, soc). So I am a bit confused why this is a problem.

> it is not described in arm/device-tree/booting.txt,

Up until Xen 4.4, we had the following sentence:

"
Each node has the form /chosen/modules/module@<N> and contains the 
following properties:
"

This was removed by commit af82a77f3abc "xen: arm: remove innaccurate 
statement about multiboot module path". But, IMHO, the new wording still 
doesn't explicit says the module should be directly in /chosen.

> and it is only rarely used.

Hmmm... We have quite a few examples on the wiki that create 'module' 
under 'modules'. In fact, we have provided U-boot script [2] that can be 
easily re-used. So I would not call it rare.

> 
> For these reasons, I don't think it is a problem that we need to fix.
> Especially considering that the EFI case is the only case not working
> and it was never supported until now.

Hmmm... Looking at the implementation of efi_arch_use_config_file() in 
4.12, we are looking for the compatible "mutiboot,module". So I would 
say this is supported.

> If we want to add support for "modules", that could be fine, but I think
> we should describe it in arm/device-tree/booting.txt and also add a
> compatible string for it. For 4.16 

I think the first question we need to resolved is whether this has ever 
been supported in EFI. I think it was and therefore this is technically 
a regression.

That said, outside of the dom0less case, I don't expect any UEFI users 
will bother to create the nodes manually and instead rely on GRUB to 
create them. So I think breaking it would be OK.

I am less convinced about breaking it for non-UEFI case. That said, I 
think the documentation should be updated either way for 4.16 (the more 
if this has been broken as part of recent changes).

> I'd just update the wikipage.

There are quite a few places to update on the wiki page. AFAICT, they 
are all related to U-boot, so I don't think there is an action needed here.

Cheers,

[1]
[2] https://xenbits.xen.org/people/julieng/load-xen-tftp.scr.txt


-- 
Julien Grall

