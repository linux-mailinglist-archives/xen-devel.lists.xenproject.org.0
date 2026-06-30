Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZWR1GrlqQ2qEYAoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:05:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26586E0F5F
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 09:05:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="WNDcrdD/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1348365.1606155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSWy-0006Yj-Kq; Tue, 30 Jun 2026 07:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348365.1606155; Tue, 30 Jun 2026 07:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weSWy-0006WU-Hx; Tue, 30 Jun 2026 07:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1348365;
 Tue, 30 Jun 2026 07:05:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weSWx-0006WO-LR
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 07:05:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weSWw-00GMTZ-7D
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 09:05:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436aa5-5cb7-0a2a0a5109dd-0a2a4506e31a-18
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:05:14 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a436aa9-08de-0a2a45060019-d155dd29e447-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 09:05:14 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-470174001a0so2039445f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 00:05:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4659sm5294683f8f.12.2026.06.30.00.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 00:05:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1782803113; x=1783407913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xpzR7yVEezUEihiK1FYYQZ/sS3oNNVENqiIioCM/ams=;
        b=WNDcrdD/eZu2m8AAiCLNwr0VCIDaZFnsR6Osxk4VhPmIjcvC4j2Y55mTppf3FyYB04
         Ev/r9xKldBM2ppfu1kt+5b3zTh8UA2z9jsMOqCUQTj5tEHzy4s+LQFhFtljx9VK0HtQr
         uvoA09xsjM4d6adokAnHg/u0bn/Fn8iGFiQfDwguZCRu0zSzbiq+XckxtUTsP9xI4gz8
         XH+vAyQTMwt8jpGFGorK25W8orev8Gcss7DWaB1BKp2++ppoPWi7oY2LrIVvL5VsPGs0
         sqdC9inzpTWHRzOjfh2U0gxRknXlo6vqt4MB9zemcPTcjXkRng87r3TSUJgGVIZjy1p2
         Wscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803113; x=1783407913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpzR7yVEezUEihiK1FYYQZ/sS3oNNVENqiIioCM/ams=;
        b=QVyobNFPYxui81bsgavOZb/1nO2SfSUmWGeZJzLjI+kNdlglh1I+rEQOBfB0HX+max
         hSgPXkMYbabdQeNiSBcRNvYMaXxI+0wZhMVongHIpQjii4u0Ksc0SbrUz7+cLXkWTYWA
         CJHBJ4umJw5rdsp5WCqv/bhkD+XWauDRG1J3w0I8lnO6czhaC7KCoxvhOHhfYrXEKP8Y
         ZBvXtJxfqC4M9De0EyKGHo64fiUSnN+3nUZYJI3hHaA60sf3uuvvmYFeJQaeSBjC2Nrn
         e0EKAMJOEp6LiTRHUIWconzQUFsK5kRjyiw5Et0u1PrX65HH2iHH4VbS4tc1V4gWlZVl
         FJ6w==
X-Forwarded-Encrypted: i=1; AHgh+Rq6VPNBFDvRhKKGfw82Jd9Ygd+hsGUitFX4s4M5+FPGDq10qCV/d22jcz1uwqgaqKf81AMnbLvmT20=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNfGWWYqc/TPEKa7vBgiNr1NqRM2lXXafMMpFLr06KPTxW7BgA
	bLROYjXRoGoxt8jzyP0KNWXmCBls8p7JtMQjDUJa4DhotNCbGj4Y/KTWdYlcrHFvbg==
X-Gm-Gg: AfdE7cmJMvkjOkW/1q2abwA+45RfQ0OvzSVHkoNnLIAkordVYM/O5b+6SPrOEeycngp
	lEIrc8f8z3komK8TrxZf8UcCcIBNW6vIeAuuiEHJuyAPrYBuUMfzmh/+1HnXo1FDn6lBhTDj4hd
	Oej51wdAbxssFXZlDbX7L528XusyGV9k2rSmdjFb5KQ4xhFEAhDp+jHSRQDzhDmugbWiL3SfjXa
	R1ANC5nBEsvI4FQx9oIQMuYhRexHpF3YF8piKS1tyGA8K0EixQqMpHLgTTONJxv1u+LJ5ngV/f1
	0Cb/9gBCTE2g2A/v9sjHXHmowpxJvuoVHxCclXlrtyS7qAc8kIIojfo9bk1yH55y1PUgPeLoYzB
	KqiCli3lZDJkZ1htjxzYU7bq5pHJQqgaZEKMCmx+hCRbXonzrzJd0O5fa1mkNu39FeI/SEviWtr
	k3Nts3cTbtWsp/LgnTRN39Ju3eOovsnApJyvHNjiQBqfL8tu02IXt2MgiNMttwsZVpHW1nr2smU
	j6F
X-Received: by 2002:adf:f2cd:0:b0:473:d65d:49c1 with SMTP id ffacd0b85a97d-47552788cf0mr2310066f8f.32.1782803113451;
        Tue, 30 Jun 2026 00:05:13 -0700 (PDT)
Message-ID: <0fabe355-8837-410a-af9e-42ad8614d886@suse.com>
Date: Tue, 30 Jun 2026 09:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] xen/sched: Make cpu_nr_siblings()
 architecture-specific
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <20260629215806.11610-1-taka@valinux.co.jp>
 <20260629215806.11610-4-taka@valinux.co.jp>
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
In-Reply-To: <20260629215806.11610-4-taka@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782803114-C712768D-392B7F1B/0/0
X-purgate-type: clean
X-purgate-size: 329
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C26586E0F5F

On 29.06.2026 23:58, Hirokazu Takahashi wrote:
> Make cpu_nr_siblings() an architecture-specific function.
> This patch provides the implementation for x86 and a common
> version for Device Tree-based architectures.
> 
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>

Acked-by: Jan Beulich <jbeulich@suse.com>


