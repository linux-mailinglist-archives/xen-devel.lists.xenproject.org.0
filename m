Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNHwCMoVxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:17:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3C334450
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263767.1555622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ii6-0004GA-Qe; Thu, 26 Mar 2026 11:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263767.1555622; Thu, 26 Mar 2026 11:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5ii6-0004E1-NF; Thu, 26 Mar 2026 11:17:10 +0000
Received: by outflank-mailman (input) for mailman id 1263767;
 Thu, 26 Mar 2026 11:17:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5ii5-0004Dv-JK
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:17:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5ii3-00G5gV-65
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:17:08 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c515b3-2eae-0a2a0a5409dd-0a2a450c9756-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:17:08 +0100
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c515b4-f93d-0a2a450c0019-d155802adc61-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:17:08 +0100
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48557c8ad47so6416175e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 04:17:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872091241asm13266325e9.21.2026.03.26.04.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 04:17:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774523828; x=1775128628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vxo/uj/Sm5xOQ2gq8IdB8hKXP+VsV7fEz3Z90js26YQ=;
        b=I2IGIcuJK1K5QqeuVKD5dovJ0XnSo5SOYKdKh8GtZQEpUPytMqecm0waZvTF3kBuQa
         p88SeX5o8I1B7CfR0nna8J2lTcmisBtA1hZGhrmmQjt7PhY7knBOQ4D+O/Yc1/ZN/KNi
         57UIiI+JZTaqaN59BYjQiBYsTqsZYdR7Rcjr1UngpYMsPqclG5lt23qOQTibd1swuxwF
         lYnfs3XE7K6nY4KYdWJBpMjfUHxJ46fiwnCcZa+7krlxtHZ7ATGSdrlF2Jcs5e8DjYCA
         zewuihInyykfJQNuES0LEuW5UmRw/zEPOa1s9by3F5mbBiBHuZCyDzw7FEIMSR5JQbP7
         TNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774523828; x=1775128628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vxo/uj/Sm5xOQ2gq8IdB8hKXP+VsV7fEz3Z90js26YQ=;
        b=iRMXzjOaS9LXB6kofRkeiarsqZisXzYGaNdZJl0CkcOYb37gU7Ii08qlEzb8uicfA3
         PM1bH9V3D3kazFiDaPKYtb6pVTc8IOCnLkVEwclJne0tiGgQghir0LlGTJ+aJvRTPEd/
         gVaSI9NMpRZ9vjx5j/VYNobmkE07bT1HnHs0sm0QsUNE7RRub6+Ou+0Y1b512sHaP+bo
         PALmMJnh+TCiyzqSddTtIaVDdp4FDgiQTihQsxfOV0YP24nEfyiMbN7PoFAl/Oge6Q2T
         aAWQiwIJ0jYqqOMmyowhkSbSuieBKfmkrY6A4lt1t5oIm0ETbE+YRSPwxMs0zm+XoSUY
         5Uug==
X-Forwarded-Encrypted: i=1; AJvYcCVDbp/IsGdX+AoYyYIbwRJ7z7tOVqQIvwqx0An9hGEmvjKbsyON3zBNGS3R4czAVm0Z/CBTVdui0R8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztM1idQCFJdeiL9F244wm/EtudpfwKxBNDCAv0TQpK8dkrnd/T
	4++zVNG2ljgCh1v5WAuuAyrimbBYqQmWYt+Z3SDjHwuTKlNaNGtF/bzenZmbr2/cLQ==
X-Gm-Gg: ATEYQzx1KaGG6eZz1NXMeFbNrKlGksa/ti6MweWLNm263YagSGmJHFUy9crLn7nu46Y
	nCG7K2EvxCOMagAdMgIo1sf8JSWDgGq6I9xQmGJ0wQYg42wTnuuYHYLykYsaUwauYNR4sniD07u
	zcRxcmqtrTxWngSm8402su6vJaPNJr0XDMKrg6VkoFV1CIG+hDV/AltDF/C/z326qOzsNAQzQL/
	RavkOzLrGc9yOzxF2h36E06OJ5WyfAbPOZkbgF5tDNBZiUzWROsLYiLP0Bnqos9eClHNMihBFJq
	1hcR3ts8qKpdjz0HBz5XCR0HDxF9B6GcoIWA2JBXcySLUXMYSscNLBfq7w++P9s8z/RY08kjjxx
	r+O0QKWd53qlRb542jCbsY5zr//Sv403jnYawxDJYfry2o8h9Khoe/+dxsmT58skP4lJNE2EuCf
	+pNi4k5BKRAgMSvZ990K2TwCWn79Dzfprrtcy3eruelLrtOat3pBnOY14gFHaYW7MN5X88+Zdr/
	zxr7wIgg7EQZ5Q=
X-Received: by 2002:a05:600c:4e87:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-48715fd463emr103602525e9.7.1774523827917;
        Thu, 26 Mar 2026 04:17:07 -0700 (PDT)
Message-ID: <07b82f49-4827-4e92-b552-9860e61881c9@suse.com>
Date: Thu, 26 Mar 2026 12:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libacpi: Pass missing --dm_version to mk_dsdt
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260326104012.2649454-1-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20260326104012.2649454-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1774523828-F5CB2734-F4502FB4/0/0
X-purgate-type: clean
X-purgate-size: 658
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5DC3C334450
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 11:40, Ross Lagerwall wrote:
> Commit 19ab8356abe4 ("tools: remove support for running a guest with
> qemu-traditional") made passing --dm_version to mk_dsdt mandatory on
> x86 but didn't fix all the invocations of it.
> 
> The previous default was qemu-xen-traditional so with that removed set
> the dm_version to qemu-xen for this invocation.
> 
> Without this change, Xen fails to build on x86 when using
> --enable-rombios.
> 
> Fixes: 19ab8356abe4 ("tools: remove support for running a guest with qemu-traditional")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


