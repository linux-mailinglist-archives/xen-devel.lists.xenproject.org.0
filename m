Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMU6K0ha52l87AEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:06:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E5D439E78
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 13:06:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288890.1569130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8vy-0000Jy-ES; Tue, 21 Apr 2026 11:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288890.1569130; Tue, 21 Apr 2026 11:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF8vy-0000IW-Bg; Tue, 21 Apr 2026 11:06:26 +0000
Received: by outflank-mailman (input) for mailman id 1288890;
 Tue, 21 Apr 2026 11:06:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wF8vw-0000IQ-Ix
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 11:06:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF8vv-00AmrS-Vl
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 13:06:23 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e75a29-5cb7-0a2a0a5109dd-0a2a450195d4-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:06:23 +0200
Received: from [209.85.208.171] (helo=mail-lj1-f171.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e75a2f-c1f2-0a2a45010019-d155d0abc4a5-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 13:06:23 +0200
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-38e8292423fso35634001fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 04:06:23 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187ebf2asm3606031e87.80.2026.04.21.04.06.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 04:06:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776769583; x=1777374383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KiEvJ8H1MuAp/gg1BGQo5ANPAKcmffzYcWPbz/6DG30=;
        b=a5/B9rONnNCMGSGFZU2NSko36BdU4ld5cMDJo9VwIwio9F1C0O/scVBX4EAnhd4DcB
         r4UeX0RZEaxUVb9xxfVNWm4XEKl1jSg5dU3xFuyMCrfkrcM0ZyzCLpg4Ir1B2loygzT3
         VA9/ha4XjBR08R5oJslDw3u+kQ7RFY7GK4M18iihhW1n6jEcXj9JZPO8XIYSLxUlGIr4
         i3+Nw8V6bRQDlNdotXzRdJhw9khnQgPovlZLN9xHqTqGDa0hJUlUVBkgqp3/W05UTUin
         x1+klaIQMgF8FMe7l3W4lcY4B4EIfIkhJQzjnuAZzJ5v2T3oEOxZkrjeikLPIiMlEU2o
         ZO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769583; x=1777374383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KiEvJ8H1MuAp/gg1BGQo5ANPAKcmffzYcWPbz/6DG30=;
        b=U0mNvu/74wbFJXVbdN7+8GQrVBzFXB2gcdIPj2FUOM8QujqUeU2P8ZpVl8wWOh1xgr
         +D0WzVwibto1XQBsAeH1WATNsWe3RLFSpxX4UDVGk+tq+mxCPJv3KmlmnWn3V/ZxF9FJ
         EbHSRsYnz5feRg5WPpSfN4VhVLh2w5EGSiRH2e4JBgeBs6VYrGI2xZ6ot3hM9FUB3Q2d
         MHBLOyqkWT3ygxojPCDYOi7xOHaECXnGfRmymCNhvs8nGr/dYmepshx+uZGHeQW7iTD/
         j660bDScGCEovJ10Pz2roPZDikq16Unu+yD85dwEy2kXwC0bSLiqDvxrrmxc5MhwI0to
         NtYw==
X-Forwarded-Encrypted: i=1; AFNElJ/FU0tYDTgdtZZOXjDV2mqoWsqMWV63vCQ+WHuzj6IUDb/9WNrB3aA+HW2PtvbcXoMOZW5cjMPKj+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwHxDULyens6jXBye1zVc3jy/6r06Fb3kFuMldDeCOIQ3n2LZc
	s3yMg5JtJj3a3iSDZ0LKcYIfkLtm5RrDJNf2NDBjqBgeNwPK0XokV6Tg
X-Gm-Gg: AeBDiev7AXadjBhaGXrl6ebaz3yj8+txBg/l6ysAgZukCzSe9gwA6e13Yy8PsQy7C2G
	M9t9MJx5zUqAHAxxHLtdCMNCb/y+Dgxl6K7R9sZ2vU4o+O2O2PaM9w12DcNbDOAif354DLqIH0k
	1n4gY3JJzt8njI6eThNk6BOrFDLzfB+DVovVOC1ticqab1EheODVShX6OuJNoZlSvNLyUX6PBH4
	ILMXMOqMcL3PslUSi+IqE6k6uHI6KoLXNw2S62dsb63TjF9KW5zEtuggKMlYtdIcWcl8i3hWMWZ
	sIDs8rkRH8j1/7rl6CrYptgxCr9KDxp8Iqp4Ob2IpUjMpndLvImOpeWBtQ9nSO7VHn4zav0Mj0K
	e+ZAQayi5JojI2LMJfh+YvR1uZpE7vWrgYIQZRxUuGLpBVstT3qttAqpX26yR6cjApx7Ln6GhU2
	qHzgwsJXeVAwDgiIHkts+s4bKu8O4q2WnGHra76IVmJNdtGUoSde8+zOUXJbAeeirYaBzu8/0Q0
	+Gfe+n12AcJXA==
X-Received: by 2002:a05:6512:31d6:b0:5a4:6a5:9904 with SMTP id 2adb3069b0e04-5a4172e4778mr6608234e87.31.1776769582738;
        Tue, 21 Apr 2026 04:06:22 -0700 (PDT)
Message-ID: <aa51f23b-0e2f-4666-93ee-038430f661ab@gmail.com>
Date: Tue, 21 Apr 2026 13:06:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: "Orzel, Michal" <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1776340422.git.oleksii.kurochko@gmail.com>
 <e5ffcdecb0ca3c87b46965449601ff20116fecc0.1776340422.git.oleksii.kurochko@gmail.com>
 <c5003b0c-04e1-4081-b931-bfcb9ab1b739@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <c5003b0c-04e1-4081-b931-bfcb9ab1b739@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776769583-BDA69FF4-114C7F1D/10/73395122804
X-purgate-type: spam
X-purgate-size: 875
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 56E5D439E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 10:03 AM, Orzel, Michal wrote:
> 
> 
> On 16/04/2026 16:21, Oleksii Kurochko wrote:
>> As domain type is part of common code now there is no any reason
>> to have architecture-specific set_domain_type() functions so
>> it is dropped.
>>
>> The CONFIG_ARM_64 guard in xen/arch/arm/domain_build.c is intentionally
>> left unchanged: it is ARM-specific code, and ARM_64 selects
>> HAS_DOMAIN_TYPE, so the semantics are identical.
>>
>> x86 with CONFIG_64BIT=y shouldn't use is_{32,64}bit_domain() as
>> x86 doesn't have support of CONFIG_HAS_DOMAIN_TYPE. For x86_32
>> it is fine to follow generic is_{32,64}_bit_domain() implementations.
> I thought x86_32 Xen no longer builds. This means the fallback is only for arm32.

Will you be okay with
   Since x86_32 Xen no longer builds, the fallback is currently only 
relevant for arm32.

?


