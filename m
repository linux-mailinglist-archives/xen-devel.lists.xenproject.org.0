Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFC0KZZQn2n+ZwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:14 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4832919CD38
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:42:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241059.1542298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKlm-0005eh-3s; Wed, 25 Feb 2026 19:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241059.1542298; Wed, 25 Feb 2026 19:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKlm-0005d4-16; Wed, 25 Feb 2026 19:42:02 +0000
Received: by outflank-mailman (input) for mailman id 1241059;
 Wed, 25 Feb 2026 19:42:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gY1=A5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vvKll-0005cy-Ch
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 19:42:01 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0be9bc0d-1282-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 20:41:58 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2aaf9191da3so122005ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 11:41:59 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb6b9b32sm113825ad.66.2026.02.25.11.41.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 11:41:57 -0800 (PST)
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
X-Inumbo-ID: 0be9bc0d-1282-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772048518; x=1772653318; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+fBflHpWcOkIAca/ewhCzxrxnxZcU7j3YRsoFPNFwM0=;
        b=ogwZXWJxlzum/Ci/+yRlreo8ocUmFFm+grc1h4F3RQ+tOIEQiVAXxfjD7nKpnRxK5I
         dmDkhBiibpebCyUQM4z+IHBqL1o82I837V3XPQVMSRQAVptVdOCYy+laGof1TOGpjGlj
         ht5XeZIGgxMrlQcqrIMx9zJ1D/eNyRiCxZJ4ia08YKBgUi/u4Ica7SjeyzTg6VMnG/R3
         VoO0XjvgL2/1lMo2AwkT5JizhbnoE4rJ+Tna2i5iVSGwBsii0YyUavTiTlQohaNT7ETc
         1C5Zsw/a5D5lE0yzxokYxDToFJn2AMEGcieQ8N1U9ERSweRYBcJUvw1hloUhKVupSNXf
         pYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048518; x=1772653318;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fBflHpWcOkIAca/ewhCzxrxnxZcU7j3YRsoFPNFwM0=;
        b=U6xrBY2OSBgs9zlBZST3EOjp4h9qGV0AvEPvXstw9Gs0gVyZji68DM/rh3cUTA58yN
         vQr0ppeEHTQ9pfbd7GPLsr+k4tjIBQL0A83t1XETypYQ6XZwfk3nPqR3kzzOqhhHgdoK
         XFNse4ufiYq+utjol90XfU3qjcj6LUCWvQAftSAZYUXZeX+4QblwMrC8aWoVsBuS+f10
         8gqyE242fiSSLrj7zJRIwEvPzXLLMN17qoK7rsNxvc9BIj6iHJ1n1jMHNyKAZ7CsfZPc
         iXJr+PsPPBVs0K856bCvuC/KmrSqmXtbjFhecv+cKsKRWdGkCB7/DfKeubZqOc3Ex1Fs
         Qnew==
X-Forwarded-Encrypted: i=1; AJvYcCWy8tuPUEn2VDDaFiMTGGzrGN9J4baP/6Ru5yR4R02Dygv3gsnIjk9V6cufOsxvjKT0RPLBghpVnVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxvn0r6pGmPO/VBjV+cIHiK6CTpe12Ch7uPzAECaL0tjHagUaf2
	BwWlxzihbhdGq7A2cp1CjQ1BNjobp5/86CJkMH2qsluThw/9wBUWYUilRCO7rh3JFjU=
X-Gm-Gg: ATEYQzzN1gnXpOxzhBKt2+I3ljrz+q8VXxWDdEAyi0IBWaRrerszhrvYVHZKh5JYKvC
	jgIZ/ye6Vc2izEyK/vzhKyoFMy1vs3rK09nRGXCVumwLH41uxOqOIk/QIzzaAaqUpW3ox9nr1tw
	cSn2n7ltbKLcsM6oj305j/s/Kk2gJvTrH/mpvMpY7FdrEBDz7UPgf4BoCnRKuT6XJY3Qd0ALkLi
	gqk7qaEx28oFVzfFGX0iVKqLhOUE9PxMgGYNdHGYrX9kH9KnzMXpttd0rPA0g2j+RMB6f6dzdUi
	yfVeakJlv9Ojo121Bpul3d+AlzKxldDInmCET/NjyBWFaoOKXAHO0/OBBI81EKC7sIxz8fRwH95
	WFhb15Bju/kRb/rdD1/fGVBFcEXSp5OKN1dleaJSnii1euGGjb3TQRU0pfKs3pSOpQUmWS+YxSH
	F2Wqq/230+5CqhxWAHekuvIbjcmwRCY5JH/twjMbqQy0rg9C4l8ufGhADCclKu7bHsa6OqnLzWz
	hTOocc=
X-Received: by 2002:a17:903:18d:b0:2ad:ebfb:fee1 with SMTP id d9443c01a7336-2adebfc00c0mr11743705ad.41.1772048517580;
        Wed, 25 Feb 2026 11:41:57 -0800 (PST)
Message-ID: <25191af9-bcfe-491f-850e-d5a43fa89c6c@linaro.org>
Date: Wed, 25 Feb 2026 11:41:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] accel/hvf: Build without target-specific knowledge
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan <phil@philjordan.eu>
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260225051303.91614-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:dirty@apple.com,m:rbolshakov@ddn.com,m:phil@philjordan.eu,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4832919CD38
X-Rspamd-Action: no action

On 2/24/26 9:13 PM, Philippe Mathieu-Daudé wrote:
> Code in accel/ aims to be target-agnostic. Enforce that
> by moving the MSHV file units to system_ss[], which is
> target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/hvf/meson.build | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

