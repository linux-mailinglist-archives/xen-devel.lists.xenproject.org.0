Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGcgJ+VOcmnpfAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:23:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D169D30
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:23:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211298.1522821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixSB-0002Xh-GT; Thu, 22 Jan 2026 16:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211298.1522821; Thu, 22 Jan 2026 16:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixSB-0002VU-Cn; Thu, 22 Jan 2026 16:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1211298;
 Thu, 22 Jan 2026 16:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vixS9-0002V9-M2
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:22:37 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fee6e51-f7ae-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 17:22:36 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b871cfb49e6so174280166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 08:22:36 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b884f07db73sm40271766b.23.2026.01.22.08.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 08:22:34 -0800 (PST)
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
X-Inumbo-ID: 8fee6e51-f7ae-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769098955; x=1769703755; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gT21tN79WcEssuBmR/ZOAcBk2DbZ2TjBGzC2/72cKMc=;
        b=h4NP6tpJ5joG4rLlxXzEOoUzuUNjDgSt6YVf7gSjKxQ1/x79nBKst9osIwIm7FbiN1
         wuXhG/rJ85UQ4rH4kxSBcEqRq94otstPcgw6LTSI/g9zsW29WRCcvJp4ip9+Jfag3ecI
         8aIeIfm1bl8L8opw7h+r0eebk5ZGrOPTmiFMzaNZc0z7471McUdBjguL9ExVgSRnIBuY
         pFBdzoAB9ZqYtShjJdlkuKNlGd7Jb4/dyJ/ugzkC8KH4WoKVCG+Ix9MC6rLMAiHWV1KD
         Lr5ZUwxN3hSOtnOFSzzQKv2kSB4f/033sj+36fVbtLbbtKnvjO/aVYoSprdzRUOM9jH/
         OQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769098955; x=1769703755;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gT21tN79WcEssuBmR/ZOAcBk2DbZ2TjBGzC2/72cKMc=;
        b=MO12j+dSyh8+WymJMapmkpNAYQF/w26CfkMEJq4ZZrf7GJ7vVNdyw3J5jDk9JnivxR
         HIH/2k9KVqK9Q7K4QywT/qGIN68jPN579DDkg2zPCNvO5yn8KxMtFCqUBuwrACeMjhhn
         L7Lg0Ds68LGfy+ey7D3xtAzgy0tGmGAyHtIotcIz/vpbG4dHnGL0t7OZu9Zeu7pyIjN6
         egJR4ikSbNn1x30bYxyrkg34c0/3YG0ua0WgYHuj8P2U0rq9AS3LuHNKWpI+zrqr6C3C
         YMBYPvF0XCDxOCehXqJjplioi4W/+8JWR9XAYiTwUD15eujdgc8Z/S0fJhj0TV0A/xPF
         zngA==
X-Forwarded-Encrypted: i=1; AJvYcCUYctOFF/ASWwYk35efe5gt1mCi6IiiLz+gooWc9j401YY+fTXsPVB9NHhXCL1lqJeRyqoRHVNjPOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx6WEsOvpQ/wELnrfr4RJ+quQcHrJ000ex0o5Ca0Cre4/cdhqqT
	AsTn+6STxzgHJkwNg1WNFv6avXllh7dvGn6GoyEVJgYZh3GDWZL0UQ0eSPlNRg==
X-Gm-Gg: AZuq6aJxVx7ivFlHPTV/DsAsAVvmrQuroU+WOMenmvTTYy20+s4AbmEtQHeGJA+ncU/
	yp2Na1VJqRIv61ed1QyZve1kpUcSldyGe3rYqlgvPhd4B1uf+2VlIm0vY2ywCngWTKK0HCFY0uT
	A1+7ePIeRniDVi6rDRQwjroIpvKXJ3eT/m6t3VUmbw4zRVSiR2OMWpe4mMcqEwLqukmmwC0kSWk
	hZmzUUNY/DJ6iOZCai6lwSAv3TVJS+4PylSfxSDeljEOu1UMXDLJsDvubpVjZWzPeJlMgxMVbCV
	S3LayBhcdr8CV9PKEaYcopt4QPMH7iOEZ4GtfbJY8mLnKcQDCsNNvRVEmsNrPH066GvXDqMCsKL
	HMOS7IA5JnhPB+mXbfklrWiU1NNhR9D59V/tweh8DhWeL7GwToJjjR/BUVNlgbXdFEZ4lD8Azhd
	j2winJWTmpaP3Lrrk/Hl3jXWjfaRRQu7mtQnguJ21JGwjFoxIEnZIgelvG2V43jm8=
X-Received: by 2002:a17:907:d8a:b0:b77:1d75:8b78 with SMTP id a640c23a62f3a-b8796b9dc30mr1825226766b.53.1769098955256;
        Thu, 22 Jan 2026 08:22:35 -0800 (PST)
Message-ID: <ccff8e5f-be87-44cb-97ca-2ae21f52294f@gmail.com>
Date: Thu, 22 Jan 2026 17:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: adjust NR_CPUS defaults
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1caed635-3d9b-47ed-b8fb-d6c391293059@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 471D169D30
X-Rspamd-Action: no action


On 1/14/26 12:33 PM, Jan Beulich wrote:
> Discussion of a RISC-V change revealed that for PPC and RISC-V we don't
> really set any default, but rather rely on internals of kconfig picking
> the lowest of the permitted values in such a case. Let's make this
> explicit, requiring architectures that mean to permit SMP by default to
> explicitly record some sensible value here.
>
> Leverage the adjustment to the "1" case to simplify all subsequent ones.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Now I have to drop the same patch from my list. Likely I checked my e-mail
before sending it.

~ Oleksii


