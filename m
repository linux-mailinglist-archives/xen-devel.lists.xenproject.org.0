Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F328A28A065
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 14:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5414.14140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRE91-0004vr-H7; Sat, 10 Oct 2020 12:38:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5414.14140; Sat, 10 Oct 2020 12:38:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kRE91-0004vS-E5; Sat, 10 Oct 2020 12:38:39 +0000
Received: by outflank-mailman (input) for mailman id 5414;
 Sat, 10 Oct 2020 12:38:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kRE8z-0004vN-33
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:38:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c870a2c5-7b5d-4cca-b04c-5505e36d1f94;
 Sat, 10 Oct 2020 12:38:35 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRE8t-00035p-W7; Sat, 10 Oct 2020 12:38:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kRE8t-0005nb-Kq; Sat, 10 Oct 2020 12:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rChQ=DR=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kRE8z-0004vN-33
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 12:38:37 +0000
X-Inumbo-ID: c870a2c5-7b5d-4cca-b04c-5505e36d1f94
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c870a2c5-7b5d-4cca-b04c-5505e36d1f94;
	Sat, 10 Oct 2020 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=NLURfznbn98vTc2vw79KDivcTsMqB4j59h8RmSjK4zM=; b=OqvltKQh8+bWdRvkuiwZr7ltcG
	MyQDAqrpaGLnr/FMhTo4nWYnsfsxlASFe8Hn7Lmgv8KZz9h9FaPHRqnx+g4kwvVf7wsKES/EEA8ms
	a2gDf/iYnpRwBMwXAi2I/Oa+Ee7ISJefwT+xas9gtHhmud99O4hMex/kQU0ucFmmuLj4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRE8t-00035p-W7; Sat, 10 Oct 2020 12:38:31 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kRE8t-0005nb-Kq; Sat, 10 Oct 2020 12:38:31 +0000
Subject: Re: [xen-unstable-smoke test] 155612: regressions - FAIL
To: Trammell Hudson <hudson@trmm.net>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <osstest-155612-mainreport@xen.org>
 <0d3766f0-a1a4-bc86-9372-79b1b65eae47@citrix.com>
 <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
From: Julien Grall <julien@xen.org>
Message-ID: <01c8b669-d77e-75c4-7317-213e32eb2b73@xen.org>
Date: Sat, 10 Oct 2020 13:38:29 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <l13ej-jSgj1tw6_awkBjUgauf1oh4k3PIQavoWsHdhhiH0qLc1hI4x0lK1Sx4S6DseYE2JQ4w1uFwuEgF325BDawQcpOe5sDX95C3MyqXlQ=@trmm.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 10/10/2020 12:42, Trammell Hudson wrote:
> On Friday, October 9, 2020 10:27 PM, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>> [...]
>> Looks like arm64 is crashing fairly early on boot.
>>
>> This is probably caused by "efi: Enable booting unified
>> hypervisor/kernel/initrd images".
> 
> Darn it.  I'm working out how to build and boot qemu aarch64 so
> that I can figure out what is going on.

FWIW, in OSSTest, we are chainloading Xen from GRUB. I have tried to 
chainloading on QEMU but couldn't get to work so far (even without your 
series).

Although, I have no trouble to boot using the GRUB way (i.e. via multiboot).

> 
> Also, I'm not sure that it is possible to build a unified arm
> image right now; objcopy (and all of the obj* tools) say
> "File format not recognized" on the xen.efi file.  The MZ file
> is not what they are expecting for ARM executables.

IIUC, you are trying to add section into the EFI binary and not the ELF. 
Is it correct?

I don't know what x86 is doing but for Arm, xen.efi (and Linux Image) is 
custom built. So it may lack information to be recognized by objdump.

My knowledge of objdump is fairly limited. If you are interested to fix 
it, then I would suggest to ask the binutils community what they expect.

We could then adapt so objdump can recognize it.

Cheers,

-- 
Julien Grall

