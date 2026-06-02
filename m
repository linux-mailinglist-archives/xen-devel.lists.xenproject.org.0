Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e4s9NjDAHmrGUAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:36:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D2262D965
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:36:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Q8uKkehv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324782.1590287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNPW-00046Q-Uu; Tue, 02 Jun 2026 11:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324782.1590287; Tue, 02 Jun 2026 11:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNPW-00044d-S1; Tue, 02 Jun 2026 11:35:54 +0000
Received: by outflank-mailman (input) for mailman id 1324782;
 Tue, 02 Jun 2026 11:35:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNPV-00044X-VL
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:35:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNPV-00344N-4z
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:35:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec010-2eae-0a2a0a5409dd-0a2a450c9eee-38
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:35:53 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec018-62f1-0a2a450c0019-d155802cd841-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:35:53 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490a7678b2dso21259545e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:35:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ab55d39csm37075475e9.35.2026.06.02.04.35.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:35:52 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780400152; x=1781004952; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jj8xIdwH6J+t/+Au8CpxojqoV9SMt/RvknfyCiSl2s4=;
        b=Q8uKkehvVAXCjL/lQ5m6nWXC73S+fqxMnKe6X1dDLBArBA7oU2DvGxqmviWmZqDbTg
         ax1Rb0wy1dOhdx9jpJzWMN9pRA4g3PdHFbAfQqt76TlXXUbOIx7YL6a9nERmZ+mCgG/a
         2VjD5cSXLRP8UDW2twDStniCjNyWMEjd/C3euJDSct5L7KledAqX6MF8P0wB1+NzD3//
         M0WiF6pNRMImSabb5NpLewzj4OQjXwUoSJLQlmuuuDBA+mGNhicSppamCXJlp/8IDDPC
         c1Utj5JgIpvw87Zw4Zx8IVIf6HREUO0crn7n1DUpCrQoFymleF9MMofOJX1Mki1qukCE
         rqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400152; x=1781004952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jj8xIdwH6J+t/+Au8CpxojqoV9SMt/RvknfyCiSl2s4=;
        b=T9/gdpFQPN1ekMdm2c7sp93RmWeUy8luG/jIvlGm9jLK/xv6c5bIqse2Rklwrom9th
         YB8UzEVBx9u+eKbhf+C6AqiuoPiY1MxpPlmfxj694F533drwKKPnuHFdZeD8Rul3CVeW
         YC90oA8b86vMD4PlnAisXDTNsx2RRkpctqsNOGsjk9I+qilAcPj8aizKDhBa/LTM6B5S
         uFQScNRqBm0jZrQncCMkgELzf5VlFBdwGhgig3jkdBTaMk2YnIAJml1N4JWbtGovevH1
         OOgP+VnIwSXDuQJYQlRFlCwMfKQ+839gSsYy6xeRurJna6VDJpq7NT2iCDtZ62vlCWgf
         CwDA==
X-Forwarded-Encrypted: i=1; AFNElJ/dyn9tSH4elh5kFiNfzlSoZ5vbj7bwfbEsStz2T/pi/HABWYw0Pl+Y+ph+1z+r1SIjCC+EfqRo1EA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxR5jdaHjH065B1GQg2JHYG/6OA3N+UQEQlWj3xj+kN4vLjGhm
	Oun8niREqNqi4ZUL4lwnV1r9/h8TKQfP/Hsl8ADntRgnRXSF+LVoxwEDJFcTackRWg==
X-Gm-Gg: Acq92OHlfi47MaFdMlRxjyWVdG8MnJHeok3hpMYUsdxCVGJcXYXlyr13VI1oEX42TQX
	Y+XjHsm95N2R6D3Nq70rysytiRE4J3o2k3AumqbCbisnWmH8qFYHgi0OJF320H9eF1ostN/12qI
	tWN+JQzNNuqGY48xGY5ONTjaR1LPZlGfraRXx2gE/xDyiUN6Mz3KXqMXs8/GnFmDmVdm3WlBVcu
	PqVm6aOPwIPi5CeYGkI0vhzvOiD2Qtf+qPpe8c7sYdPD3e5Qy+c7P5GUkBqCkEDOyO/+YTBGCdB
	AoENCANOfziAVeIMgAE+C/0ePSYevHPJTebrShvYifAvWD4Kc/KjpjDS5E0H71I0tEEAhnedlEF
	G4UBwV0zMOshFwAmxJp5QX/h+mq925me/ZY+STVEYvWFvl+sqS56KMVBVEXXnI/mAigkxxOJsCQ
	o8kF54joz57/7R554Dz+mzxWJRl8uXtR/V52Le5zjfX5N66nUkKbkh9zhl8goI34SAzLnlpo9Mq
	PVXGg7aQDU/3cTtxYt11t3glw==
X-Received: by 2002:a05:600c:5309:b0:490:b280:9fe with SMTP id 5b1f17b1804b1-490b2800c3emr32529065e9.26.1780400152489;
        Tue, 02 Jun 2026 04:35:52 -0700 (PDT)
Message-ID: <bb0f007e-697e-4501-97ea-3b59cf494ec6@suse.com>
Date: Tue, 2 Jun 2026 13:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski_=28accek=29?=
 <accek@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
 <a456446d-3dc2-414d-bc33-b5c50c088741@suse.com>
 <2a8ec9b9-7dd0-444a-9a5c-60d979940b62@invisiblethingslab.com>
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
In-Reply-To: <2a8ec9b9-7dd0-444a-9a5c-60d979940b62@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780400153-E2368CF5-EB9BAA58/0/0
X-purgate-type: clean
X-purgate-size: 591
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 41D2262D965

On 02.06.2026 13:25, Szymon Acedański (accek) wrote:
> On 6/2/26 12:04, Jan Beulich wrote:
>> Hmm, did either/both of you try out what happens if you use BUG() or BUG_ON()
>> in pre-ExitBootServices() code? Xen's exception handling isn't hooked up yet.
>> The crash will likely be rather hard to analyze this way.
> 
> Well, that's a good question. Just tested and indeed BUG() so early
> results in a hang with no useful output.
> 
> I'll replace BUG_ON() with blexit() in v4 in a moment.

Well, that'll now need to be an incremental patch, as v3 was committed already.

Jan

