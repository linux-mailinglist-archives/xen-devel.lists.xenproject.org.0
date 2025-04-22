Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0FAA97508
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 21:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963421.1354428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Irt-0005o2-Te; Tue, 22 Apr 2025 19:01:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963421.1354428; Tue, 22 Apr 2025 19:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Irt-0005ma-Qi; Tue, 22 Apr 2025 19:01:17 +0000
Received: by outflank-mailman (input) for mailman id 963421;
 Tue, 22 Apr 2025 19:01:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pc5Z=XI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u7Irr-0005Df-9k
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 19:01:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 244364e8-1fac-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 21:01:05 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 119F84EE3BFD;
 Tue, 22 Apr 2025 21:01:04 +0200 (CEST)
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
X-Inumbo-ID: 244364e8-1fac-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1745348464;
	b=ZtuFp38PxVWP+1y0nRu7U88Qqc9SVOeFVYSwF1EH3lYyKI+5b1blxDFSGZKbejr46Gvc
	 SrK/KTISb1GUA7E3du2iZiqc9Zo12pe7HMN6DQm/b+7c7zljTilw4rS3euDK5hSd9NfUq
	 F59dbIZNbp+mOYibd4m6rk9609PYFzj3T240N7G7nuZEvVeO1JblrSG0jhPkHecolZgNG
	 dFqGEQvE6eLdbI2/Mu31ksgaZFHhWi4dTZNUvZ3NlYZbDam8N/hwu+LP1ycctwgBU4cXS
	 Py/FULIllmmDG7VZBPNt2Zvx/4odeB0w1rtsm/YBiR2OXILMBu/rKVJI/kcEbshJbQQ68
	 1Uwm96rF0m8K1A76deYIcRPBKgRiY3yOAcxxRyjJY/5eKbmh0o6fXoI5E5jT5evmL5yLA
	 2SbyNp8I8Opfq3CYP59kiQYo/f2ki1XKip6GxJEAszQc3OAZS3LdFvrUdCSGzxJkbG31Q
	 BQtcuMNG18BUy2B8dCcHRkwqYXvD8EkZfBVy6dhN8VlJpUjjn+kGq4uhLFjkWCzjrwPbr
	 4r7NOh1huhJ1O/FEn3uR2tsO7l7VKsANLgXndZWnsPGluxF6pwrSxB/jglmRwOAlaBSpA
	 NV3h8gsXrSDtfRr+Y788c4Nf2AwPDc6RuyjMP1nB0rcbCHGiHokeuZkJGaPLbDE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1745348464;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=+s+gggOC/GE1hGe36xVfHIlyY2icP3Fbq0H5LB/hC5Q=;
	b=TYQrR7Y2+vkZmdD281B0bUpNIP0+GED/sovi3SKb2XO21RG8xCJQdHzAryzy+rI2ayot
	 XazXkYaSzl/4PsyKTwFdLtKmXzyoSxCKYzbSqBMXW5ujhVbSVdObpVOe6v+HhUGnDKPre
	 70qWDItxCGgXUIAedqA4kPtkwYiUb2R7xergZNI2NrEInIf71c7gIRlL3Q/X47u/rMXCU
	 6484xcQ5ARp/rfiU5jCLAvDaCKl5RQ4IX4OUvBrL7TzdHRe2GHBhNOBi8wi6i2US8hNqN
	 ZseE/hBplJG/lnaO6fSIVSo1nUQekBrFnH03cSxb+vkd+u9lADeTBQje2Sep1gFOKAUF3
	 ahR8K6we9iGBoNsBiC5iN1uAXIE/+2iHmcES2h5wjjFrV9wsLZWjGbZwFbq6RkyLfwEDt
	 T76041sTGzT6oPSL1+TJ87Oc9KiYaI1Mk0JmNxTf08udHWfSSy8APloNmm6qeU8qghakV
	 t5wtZUZnRAw8gFhrFJxXgkdVnPwGBiA7pfKSUQjqELdxiEvePer7NimfZ8NOzwfOlTL60
	 98p9Y8ZP/UC2mE4R5g1MiNKN5uU3j+aCwNQHnQreQaxf/9pywoElbvP62EI7zD+RpA2C+
	 D2D47ALriB9I2Na5K7QYX5kmkafePt+CkIPtllpjayLXHC52g8wMPFaWEs/8ZJ8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1745348464; bh=RTBJSrqWoOgIb5vJwah0Okw40ejugbs8EuJ1F3sRGTc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=G4LInXVXQwuiK2m4uU8IM4M/f9bX6yQXANtIR6/h5jbydaNyrp2idjkdFNszmAfqZ
	 XJU9shU7yJyf3tNdiVphzbyuLKGvFP2bqqhz6WCPIFFkLnQgm7sYLUPAuOYoHiM60/
	 e1lJHoHo7hJ/3KNFq6iQWeL9RK1cIOT+qivYv+jlDun8yXpu2Fx9x8cN/eoJ7zhev8
	 vSk3SR7Jw0AGCRNWKWi+XIr8ahcFYWhUeU3K7mvHZ1zmRuwLWOO8zCSjvNNLh2GAiJ
	 rWYKu/GAfI1lLnEjdJekiHpG/J1fLlf16xzsQLDfourT+1D27E7t7LxjzG7Olt9qau
	 qeHKxDEX/wQjA==
MIME-Version: 1.0
Date: Tue, 22 Apr 2025 21:01:04 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko
 <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
In-Reply-To: <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
Message-ID: <a8193a5ef223a3d015f3d6ddbbbc2535@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-04-22 19:14, Andrew Cooper wrote:
> On 22/04/2025 4:06 pm, Sergii Dmytruk wrote:
>> The aim of the [TrenchBoot] project is to provide an implementation of
>> DRTM that is generic enough to cover various use cases:
>>  - Intel TXT and AMD SKINIT on x86 CPUs
>>  - legacy and UEFI boot
>>  - TPM1.2 and TPM2.0
>>  - (in the future) DRTM on Arm CPUs
>> 
>> DRTM is a version of a measured launch that starts on request rather
>> than at the start of a boot cycle.  One of its advantages is in not
>> including the firmware in the chain of trust.
>> 
>> Xen already supports DRTM via [tboot] which targets Intel TXT only.
>> tboot employs encapsulates some of the DRTM details within itself 
>> while
>> with TrenchBoot Xen (or Linux) is meant to be a self-contained payload
>> for a TrenchBoot-enabled bootloader (think GRUB).  The one exception 
>> is
>> that UEFI case requires calling back into bootloader to initiate DRTM,
>> which is necessary to give Xen a chance of querying all the 
>> information
>> it needs from the firmware before performing DRTM start.
>> 
>> From reading the above tboot might seem like a more abstracted, but 
>> the
>> reality is that the payload needs to have DRTM-specific knowledge 
>> either
>> way.  TrenchBoot in principle allows coming up with independent
>> implementations of bootloaders and payloads that are compatible with
>> each other.
>> 
>> The "x86/boot: choose AP stack based on APIC ID" patch is shared with
>> [Parallelize AP bring-up] series which is required here because Intel
>> TXT always releases all APs simultaneously.  The rest of the patches 
>> are
>> unique.
> 
> I've stripped out the sha2 patch and fixed up to use the existing sha2,
> then kicked off some CI testing:
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> https://cirrus-ci.com/build/5452335868018688
> 
> When the dust has settled, I'll talk you through the failures.
> 

Accidental use of C18 here

https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/tb-v1.1/X86_64/9791028023/PROJECT.ecd;/by_service/MC3A2.D1.1.html

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

