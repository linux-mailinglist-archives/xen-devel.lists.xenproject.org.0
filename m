Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D22F6B26E9E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 20:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082275.1442223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcOI-0005RD-OZ; Thu, 14 Aug 2025 18:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082275.1442223; Thu, 14 Aug 2025 18:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umcOI-0005Ol-L3; Thu, 14 Aug 2025 18:09:30 +0000
Received: by outflank-mailman (input) for mailman id 1082275;
 Thu, 14 Aug 2025 18:09:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umcOH-0005Of-F4
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 18:09:29 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f18594-7939-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 20:09:27 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b9e418ba08so629630f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 11:09:27 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b916394937sm7802792f8f.6.2025.08.14.11.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 11:09:26 -0700 (PDT)
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
X-Inumbo-ID: d0f18594-7939-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755194967; x=1755799767; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dUa4vDDKtXY0mKXKKCqtXMoCQIMztx30JacTWlz2leY=;
        b=EHLXrhAM2P9jwM9MMIa96L016Y3be6QofHFHQK6EYgV/Nqo1fWgl3T3HjfqWEzP1qJ
         MGnG/HSGz7o68avTOIq73pfDPFVcsFDwKP9J5YmQPqfQB2eKGgbTbH5UEtpFlEuK/uPD
         AwteTaSHwhNm+zFBmcDHuuJh/M0A72zZR5lqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755194967; x=1755799767;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUa4vDDKtXY0mKXKKCqtXMoCQIMztx30JacTWlz2leY=;
        b=SeUG6Hs4sAZw8jz6Reg9BY133FPRY3aEI0PK4vLWvZXOo3Lf+lV+uM/ycm0nhzxcyo
         /txl7qOGpkk441piH+uplMuRY7UXcmDR15d/7PmnX1+IFdWCicsdFixfMQW3HlonYPG1
         6pSTiUtp3kOzRrlsHilY6b4JHSqy4p27t5/QveUmuW9zgNp6Z2Nk5YCcaQwPa48z6WpM
         /vxeXIcx85EjEGKs4NT9ka8/WJyjd+v3A5whVw0KFr9aAp3xPQOAuMBkO+MvBzfUpa08
         PhYlI3+Bj2BP9xtwJByQAUAQGMOQ14GzIqxOSJsn/LPcAQE9If+YhxS4xovvRLqUVJ7U
         vtPw==
X-Forwarded-Encrypted: i=1; AJvYcCXjhLhBc7TkK6AYo7+0fvoSxZRhdzxeezjESoTEPlGToVMNrZrmtnVQB4FbPkzgzN+0iPPp71pWjSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEsX+8fTK/6Asxa14ZEpc9BxxPzITRhyUC3FEDP80FiOaHUpgD
	qUU3fwD7g7tJZ6dbxQWwStQPPp4mFeKbXHSMCvDvuelRrXlivW0CbldXTSKn0XuKoNX6uUGSQkd
	TOLSu
X-Gm-Gg: ASbGncvr7WnT2uf5cGGP/p3VqArnxB8Pf3Pb76NHTsqt3jzhuY7QIipSxJvn+zhw5M0
	eG/SKPK1lhOTSsWVOiV53AaU1s7DWZOj9dwzeZscazlcOAuZ3E6cEwZEt2E9HbFpyHnFp7H0IWE
	OytE8K7k9yuvA0986nhslwhdCPFh+qZIXE9KPszzaKQ/4arkH8c7YIz88upn3kEerMQZCdB5Skv
	lMgqFBtzBIxRTgWy64DQ2h/fDJxwQ+sC5++7krknVrvTXCJ/cr/xuVQReTevZyKLU8VTvVhP9tE
	EcUE1FA96pJoqbgEct0X/cNYxzePKU3K6Qt652V739RFoPF9tuVsuFEDHDOy85UNX5Z3x6HcCM9
	qwYxo4ZcpeAkFHtkxbOhFk4+74clNseJtoiUgWp4ztL5jxFowpy4i1b/8/l3S2hW4pait
X-Google-Smtp-Source: AGHT+IGdGMx8ZxuX+02H+n0fNLqhclXVTwQ9P+CYBwNKcc6zv7Y6aMQZuvRcSe8kRtjj7HrmA0j+4w==
X-Received: by 2002:a5d:5d88:0:b0:3b8:dabe:bd78 with SMTP id ffacd0b85a97d-3b9edfd625amr3623365f8f.54.1755194966904;
        Thu, 14 Aug 2025 11:09:26 -0700 (PDT)
Message-ID: <5def44a3-4139-4870-94f2-cb895078f968@citrix.com>
Date: Thu, 14 Aug 2025 19:09:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
 <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
 <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2025 9:55 am, Jan Beulich wrote:
> On 13.08.2025 13:25, Andrew Cooper wrote:
>> On 12/08/2025 10:19 am, Jan Beulich wrote:
>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>>>> simplify setup"), load_system_tables() is called later on the BSP, so the
>>>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>>>
>>>> Move the BUILD_BUG_ON() into build_assertions(),
>>> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
>>> and BUG_ON() next to each other would seem better to me.
>> I don't see a specific reason for them to be together, and the comment
>> explains what's going on.
>>
>> With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
>> BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.
> That BUILD_BUG_ON() could then sit next to the MSR write? Unless of course
> that ends up sitting in an assembly source.

It's the bottom hunk in patch 14, which you've looked at now.

Personally, I think both BUILD_BUG_ON()'s should be together, because
they are related.

~Andrew

