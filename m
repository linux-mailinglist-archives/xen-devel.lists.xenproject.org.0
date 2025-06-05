Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0C9ACF304
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 17:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007054.1386336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCWK-00020g-T2; Thu, 05 Jun 2025 15:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007054.1386336; Thu, 05 Jun 2025 15:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNCWK-0001xs-Q7; Thu, 05 Jun 2025 15:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1007054;
 Thu, 05 Jun 2025 15:28:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EkoY=YU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uNCWI-0001xm-Td
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 15:28:42 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28a11df-4221-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 17:28:41 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ad55d6aeb07so218276266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 08:28:41 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82e80csm1268335166b.71.2025.06.05.08.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 08:28:40 -0700 (PDT)
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
X-Inumbo-ID: c28a11df-4221-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137321; x=1749742121; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naWYKSBtQ22zr2K7a/qTHaVSdY1rJpbHlyY2oi2V+A8=;
        b=MyYI8h6kYE+L0ifPJ3HUvMXsXE9Not03mG2LT6vrTIg9nTsaWE2CXdsfEGjwjPn8M9
         Y8Bx0oBcDTrzR3frn3hL4GPuVyMSuUU/akpGd8OxaHdpehpibuYNETk9DW7/TpZtYL0v
         AnQVuTkKOfUOyYaDlpKxelXWSaVVQESIcSoOtPPF6uObeceTOXYB1mfbnP21s/55G9z0
         nwHCaLhvxctlzevSy+c6FOxXQQWeX5zyHWcv46SjPkTx6SRj0rcM4Kwf2kRKk5S54A6e
         fuO/aC7kPWLPXpq/QyDqAG1pUyPpQ6mQ00PAYm0aUenfzNfvS8yVh9tcYDggoJ5G1Ofz
         E6Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137321; x=1749742121;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=naWYKSBtQ22zr2K7a/qTHaVSdY1rJpbHlyY2oi2V+A8=;
        b=WYolicQGSkgz9pNUT3fXxxkCP1HEmUj1b7VxhXPI7qAHazVeCU09J9MBmYGmXBzRUB
         5GeI9DGYkfZNiYOZNuX6/XxO3KUyPtB0qUbKAeesg+6i83MhAEPqHjvs55uZtefzwvRq
         v0n3/S8kRE9x4r6xs/VviUsyRzBU+kykBHL10JPkv44eX+PozjT1g8R2zviQ3Zc3HWIX
         e+/VGybgaaLon969ezr8pj5rcBo+lKWo25hhrwsMPxGNjSxgSTUHywEVvp4DhYgnNr6K
         7Dzar4jDW/Cj9JolNibG+/JOJ/PJ+5+JJP6S4S8rF1Jhv5R+QNNe6K8M5Pv5NpJwaP1r
         WJPA==
X-Forwarded-Encrypted: i=1; AJvYcCXmT0excWGyLgelh4tptbibOtTjb9klbFhs/udce3VF3wCtgGc2BITdlh6IvP2kmnPH/qf1Iz401gA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSKEn7rmglSCYQCsSuBLiQkctcaX9IzxTpeJoIh37eG9GAUjge
	XZhePcHcEt5E4R3mxV0mdnPq7i1dZedpn9iDQ1I4SuhePxJAVnD+D9vL
X-Gm-Gg: ASbGnctmh/dYvhSRb3cESECpdIyUQ3X5HJUpeycsEBgnYnVueLC169/6Nfof3gBst4Q
	W18cHf2hDb47QXls+iAhL4SKhC7n/LtwIf124wA6I/R73D9pDpUn9Sap2EywLhuBxYulH+cqHzD
	xkH/PHshYo9DsyEwyQAiy64I2yUookx4OVXVfJYxvUeFGHbaOIvm74BH+18iX6T7HuSrqxwZA3C
	4QSqX6YItnUwt9i6t+aYL0gJwbDs9eSTH+RfAjmkXzUPFjWiITDh7F1SCEmYrzM+BWPRoihAzlz
	uRZ8l+G3pHhlJZa3VMwjginx8qnATCreUL8ZhW76Y+gFrFDcQnrzdy/MkEYRN+/1BDGBfvgsWQK
	q1np5pkkdb48Y5qnX+RZkuLei
X-Google-Smtp-Source: AGHT+IHt0r1gaqCjFbx7fM7HXI6oTurJr7q0SsI/jolLLMyzWCdITG9hHkt7FdyGVFG1oODgk2W14A==
X-Received: by 2002:a17:907:971d:b0:ad2:2d75:d7fb with SMTP id a640c23a62f3a-addf8fe231amr728388666b.55.1749137320666;
        Thu, 05 Jun 2025 08:28:40 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------SZafocSQkPor6gFtp0QTPQEF"
Message-ID: <3b9cc332-5b39-40dc-afc4-40f790abd0ed@gmail.com>
Date: Thu, 5 Jun 2025 17:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/6] xen/riscv: introduce things necessary for p2m
 initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1746805907.git.oleksii.kurochko@gmail.com>
 <0a03d1f38649cfd8656147f209652dff0f9d170c.1746805907.git.oleksii.kurochko@gmail.com>
 <7ef3ca26-05f5-4e86-b7c7-852b6c74a3d0@suse.com>
 <1a0d3084-9e77-4df5-936a-c1a1317c0f18@gmail.com>
 <ab4b0ba8-4a81-4059-94b0-aae8bda3fbfe@suse.com>
 <b9ea4b4c-c21d-4414-8c37-9447821ece8d@gmail.com>
 <0175c281-b669-4412-971a-545e29077b34@suse.com>
 <a91e8f71-5793-4c27-92fe-a4c1707ea6dc@gmail.com>
 <c06d8833-dafb-430e-a9d5-f9baedecea40@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c06d8833-dafb-430e-a9d5-f9baedecea40@suse.com>

This is a multi-part message in MIME format.
--------------SZafocSQkPor6gFtp0QTPQEF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/5/25 4:19 PM, Jan Beulich wrote:
>>>> Won't be enough to flushing of guest TLB only during context switch?
>>> "only" is interesting here. Context switches are a relatively frequent
>>> operation, which in addition you want to be fast. If a flush is necessary
>>> there for correctness (e.g. when VMIDs aren't in use), you have to do it
>>> there. But if you can flush less frequently without violating correctness,
>>> you'd almost always want to use such an opportunity.
>> Then it is better to introduce VMID now, it seems it's only one place where
>> it should be set, when hgatp is initialized.
>>
>> Does Xen have some framework to work with VMID?
> That's all arch-specific, I think.

Probably, I used incorrect words to express what I want. I wrote about allocation/freeing
of VMIDs. Basically something similar to what Arm has (|p2m_vmid_allocator_init(), ||p2m_alloc_vmid(), ||p2m_free_vmid|):
   https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c?ref_type=heads#L271

It seems like it is not very arch-specific, at the moment.

But, likely, RISC-V will need to do an update|p2m_alloc_vmid(), which will do p2m's TLB flush when overflow of VMIDs 
happen. ~ Oleksii |

--------------SZafocSQkPor6gFtp0QTPQEF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/5/25 4:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:c06d8833-dafb-430e-a9d5-f9baedecea40@suse.com">
      <pre class="moz-quote-pre" wrap=""><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><blockquote type="cite"
      style="color: #007cff;"><pre wrap="" class="moz-quote-pre">Won't be enough to flushing of guest TLB only during context switch?
</pre></blockquote><pre wrap="" class="moz-quote-pre">"only" is interesting here. Context switches are a relatively frequent
operation, which in addition you want to be fast. If a flush is necessary
there for correctness (e.g. when VMIDs aren't in use), you have to do it
there. But if you can flush less frequently without violating correctness,
you'd almost always want to use such an opportunity.
</pre></blockquote><pre wrap="" class="moz-quote-pre">Then it is better to introduce VMID now, it seems it's only one place where
it should be set, when hgatp is initialized.

Does Xen have some framework to work with VMID?
</pre></blockquote><pre wrap="" class="moz-quote-pre">That's all arch-specific, I think.</pre></pre>
    </blockquote>
    <pre>Probably, I used incorrect words to express what I want. I wrote about allocation/freeing
of VMIDs. Basically something similar to what Arm has (<code>p2m_vmid_allocator_init(), </code><code>p2m_alloc_vmid(), </code><code>p2m_free_vmid</code>):
  <a class="moz-txt-link-freetext" href="https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c?ref_type=heads#L271">https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/p2m.c?ref_type=heads#L271</a>

It seems like it is not very arch-specific, at the moment.

But, likely, RISC-V will need to do an update <code>p2m_alloc_vmid(), which will do p2m's TLB flush when overflow of
VMIDs happen.

~ Oleksii
</code></pre>
  </body>
</html>

--------------SZafocSQkPor6gFtp0QTPQEF--

