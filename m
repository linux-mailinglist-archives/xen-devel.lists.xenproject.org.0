Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBbNGchJA2r+2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:39:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FCF523D8A
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307053.1578795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpCy-0007d6-Ad; Tue, 12 May 2026 15:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307053.1578795; Tue, 12 May 2026 15:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpCy-0007aV-70; Tue, 12 May 2026 15:39:44 +0000
Received: by outflank-mailman (input) for mailman id 1307053;
 Tue, 12 May 2026 15:39:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMpCw-0007aL-LQ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:39:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpCw-00AMT0-2C
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:39:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0349a6-bab6-0a2a0a5309dd-0a2a4501e428-36
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:39:42 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0349bd-c1f2-0a2a45010019-d155802acc0b-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:39:41 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48984d29fe3so60580955e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:39:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548e4bbebdsm36877386f8f.5.2026.05.12.08.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:39:41 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778600381; x=1779205181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DL8Q7t2XncyxaDtSAnCnBT1mRwgenE/2U9CE4qm6meI=;
        b=XSNuRN0bzCN75x1vo3WGV8XF4XRr7tGjC8b1t63N0KzmyYaTyGLc/zQy+Oi5TS5/Tq
         MmP3Z2GpLIq/f99/NYaso2eezco4D8UxbDBcARqSgSTXSUrjrN3BFAY9Z7F68oYBBlGo
         /DWKjeyn3WNmhRAFWH3mBDxJSr0PevM67DpkraSaGDvHr3iRJwep31EOIWykLgSMOO1F
         Na2Xfb+YgF3LO4o+O8PbhfCu2DnUE9pxnuaVJS+MgjF7k7Wb3s7ktWjUdQpFgpHoNUWv
         fojpQrMUFGZf0Li8jswWEzi4tB6gOyVg3mGr4RncKbuPbgtBa/fsx9GLU2dIhrIV+IsT
         QZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600381; x=1779205181;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DL8Q7t2XncyxaDtSAnCnBT1mRwgenE/2U9CE4qm6meI=;
        b=jhtkgcO2zvPYGQSWJXL2+KXa7/kEahYaSoNF8nNQzugjXvSKLVdyfQGIkvHprLqygj
         MNICvnipSKtpnNdz+Pk+rL0dUcRa0+3B8D8MKxVcEzDxO8eHg9P7CY0V2tHARXAg/yS8
         r5zZJ585dH4zLosp+YdiBu+5ExYtFrDPSvPNhBlRBZF1lPJf+R1Fm9O4fwEekPOOhgxw
         pKUDXEHF/YPRyeIHuUeHhuKrJttUmZsyDus32mQEgRnckWLz2xwTSImYZ+WQJKww0nnM
         qyHqXtLcKkXuqfBij8iGktJGWJW1P6IbBA12gMEOfqRws7jXYpu7mjAD/HcZKIQg7nMj
         KTxQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R5tOT9sOwhZi6ofzrT1fgrDaPYKjcygCQ2c2rbeu1J5Y5/EJeq5a0vAiYTanSxE/jr5l/6tyExIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YznSHd/6NBgOBX4RpBVGhwImgI/xauD6BTCLd82ZV2dbU3jAON+
	rUBom3BS2lEmYmNKiYMvpoRgB+WMRkXju8hQW1sL+JPP3KouNs90E3/eVl6+peNopeVniKzlKUH
	JGfA=
X-Gm-Gg: Acq92OFslkTxoULKOhGSz9Yi+mBO+qAEpK2GzH74/sj5PxrD/KC4VDzNnXTWUcuqjPt
	1DBEm88630XnAw4ZoPUq1UJF1yITxNQpvPOu6JE8ey4W45MESCoaO39TZWxzLe8uVLkAxUaRCEr
	NGnZeMBAXzB8Ehkk2wQ08SoXpg2sy2NEgnHLQb9rlbnPEtOsg9LN9gP0XHGpbzNbrEv0maOCHBl
	PFPzuJiAP55r9PXf2HbjB5bpf4ejvcWhaDbC/jajIPRrDpHqImUAc51sXdqXK/nPEr0FEaWAsj5
	MmeeZRIBqiv7U57BsCzmpCPr7PkLoV+6ebNlPd+1HOYeMcWZ2FdeglaPrBH2qbn/rRijUT5g8gz
	S//vDPAB1CUGRBBlx5QcOZNbHf4unAXwJUgpd/5kl+R3zAmDnfKeO2/Zj6b3dRhL1wG6LykS3Tu
	2q2P/USmUcKH7I4UV+3rrZGLBpA8ivBxQ0ogqsvaa6N7FfZ7oiVP1T02sBB8XkUTlAOYOA7rQZM
	xUwOIAhB63rLMY=
X-Received: by 2002:a05:600c:8b77:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48e8fe59c3amr56201575e9.12.1778600381495;
        Tue, 12 May 2026 08:39:41 -0700 (PDT)
Message-ID: <13ca8476-1164-4436-89ba-d4da52d3c8c3@suse.com>
Date: Tue, 12 May 2026 17:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 0/8] x86/mwait-idle: sync up with Linux 7.0-rc
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
Content-Language: en-US
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
In-Reply-To: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1778600382-AE342FF4-B284F238/0/0
X-purgate-type: clean
X-purgate-size: 516
X-Rspamd-Queue-Id: D3FCF523D8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 12.05.2026 17:34, Jan Beulich wrote:
> Includes a few custom changes, too.
> 
> 1: arrange for BSP MSR adjustments during S3 resume
> 2: clean up BYT/CHT auto demotion disable
> 3: latch struct idle_cpu contents
> 4: move pre-initialized struct idle_cpu instances
> 5: Remove the 'preferred_cstates' parameter
> 6: drop const from struct cpuidle_state arrays
> 7: Add cmdline option to adjust C-states table
> 8: Add C-states validation

I probably should have Cc-ed you on the v2 submission.

Jan

