Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A4A35308
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 01:38:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888233.1297625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tijib-0006R5-01; Fri, 14 Feb 2025 00:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888233.1297625; Fri, 14 Feb 2025 00:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tijia-0006Pa-Tc; Fri, 14 Feb 2025 00:38:08 +0000
Received: by outflank-mailman (input) for mailman id 888233;
 Fri, 14 Feb 2025 00:38:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vTB=VF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tijia-0006PS-BS
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 00:38:08 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f51a95ae-ea6b-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 01:38:07 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-38f2b7ce2f3so242599f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 16:38:07 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbe0sm3237131f8f.39.2025.02.13.16.38.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 16:38:05 -0800 (PST)
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
X-Inumbo-ID: f51a95ae-ea6b-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739493486; x=1740098286; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3je17fgFGvz7DofY2wzNcVsy5GmcTpCrsti6gBsfL4Q=;
        b=hH2aM0hqNFzCm90tPGDsq83xJDcSa1cyyE6YI9+tGzNnEeDbjuu+P41ODWbOqam30j
         irg8TY7BzeYpIskqVE+3mi2sgW1n0UTfW2XqxUHPfula/6+Z/1iqogs9owGBYuFJzBEW
         zazu1sedSxILoyfBnf2t+T8OaGGBBhm8v18us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739493486; x=1740098286;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3je17fgFGvz7DofY2wzNcVsy5GmcTpCrsti6gBsfL4Q=;
        b=QApu9RKspn8NinbyRkCUGdGwmBeJCtXi0B3GIVZVvZvxsTaolMUhzqLhCqMdiQk2ER
         KE0vTweI8vtYUgVmA8WuMNId5I4kYor+WIS2VcDFnofXMjJSmJTZoY1Sh7TTTwI/fjGD
         BmNB53DFHFdKVd0xqP/BjU2g9R+ZjJhO7D0B8gK42GOVHKSIkMnEljBg847wEUH7K6vO
         GDI+wZ/2PVuoCfFH5x2UXb6+XeEXvVnYeWJgTgB+Co7kjMund7hSVTwjkTBd/3Sahmo7
         FPtThPIsaIZXyvIKapFTLkediB8McgYDOdlM4udsYsyD2aFzas9zmQRFzYCk3r+ARVwW
         gyPg==
X-Gm-Message-State: AOJu0YwTjHWab4doixHWWEhPsVVzBs7mWIqg5tI10MNBGaZBz0IzU1Xm
	qGhvBU+CaNof4ogLgh7f2bvbNW9Q3f3VjHgjYgWCppCwGamPIimYHqKd/IjYJj0=
X-Gm-Gg: ASbGnct3e/Q913zD2Jeby8mndaoYiWpaDtTYDf5FXwBalivRQjyHGiB9TBGqxOmxdO1
	vYG4r/roBcWlUVZiGdxBfmwVlLjr78VOBnYwA2K/H6uv/JpyCF5vzBDMgfjAIX/CB/gu+KMe+HW
	I+tkMQYve/zuar/VfK82EViIzNDyrPnaxqpJKnHZMyq209SgXMMrLuOalusNsPXi2kPprpAlpq3
	QKf9yyo4k0wjAJDwyqJK9Pi3lL82RuOxleZ0PCUYlVqZ/6z2VbQdfQyuWl1FkrBfmG6ceC1lyKd
	WLQcL+fvpPYTkHqFjLb4M5eeE/rWkczneYRJf7bNyyhqgNL5NF8MjAw=
X-Google-Smtp-Source: AGHT+IHWS+KxvJA7/GXk2+LvWVr2wwwr3cKMtDh2u8iH/8v3879Lcr2eGpRkmnRnugJ6vfUu/h+vuQ==
X-Received: by 2002:a05:6000:d0e:b0:38f:2481:a6a3 with SMTP id ffacd0b85a97d-38f2481a8c3mr4413428f8f.18.1739493486229;
        Thu, 13 Feb 2025 16:38:06 -0800 (PST)
Message-ID: <b1af4f09-cdb4-48fa-bc17-b5bd724dc53e@citrix.com>
Date: Fri, 14 Feb 2025 00:38:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 for-4.20(?) 0/4] Add/enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
 <2af57b53-5b01-4435-a134-a3dc00a3d3a4@citrix.com> <87jz9tz7nn.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87jz9tz7nn.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/02/2025 12:34 am, Volodymyr Babchuk wrote:
> Hi Andrew,
>
> Andrew Cooper <andrew.cooper3@citrix.com> writes:
>
>> On 13/02/2025 10:00 pm, Volodymyr Babchuk wrote:
>>> Volodymyr Babchuk (4):
>>>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>   xen: common: add ability to enable stack protector
>>>   xen: arm: enable stack protector feature
>>>   CHANGELOG.md: Mention stack-protector feature
>> Given the last minute observation on v4, I ran this through GitlabCI
>> with STACK_PROTECTOR forced on.
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1670468808
>> is the full run.
> I noticed that you enabled both UBSAN and STACK_PROTECTOR for
> arm32. Have you tried to run arm32 test with UBSAN only?

No, but I'm also confident that the UBSAN failure is unrelated to
STACK_PROTECTOR.

It turns out it's very gnarly to fix.

~Andrew

