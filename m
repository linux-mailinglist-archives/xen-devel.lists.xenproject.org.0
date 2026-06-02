Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id THhGHaLBHmrxUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:42:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A670A62DA36
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:42:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QHniAofO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324795.1590305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNVd-0006RX-T1; Tue, 02 Jun 2026 11:42:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324795.1590305; Tue, 02 Jun 2026 11:42:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNVd-0006Oj-QT; Tue, 02 Jun 2026 11:42:13 +0000
Received: by outflank-mailman (input) for mailman id 1324795;
 Tue, 02 Jun 2026 11:42:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUNVc-0006Nm-4F
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:42:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNVb-00EGVc-Gc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:42:11 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec184-bab6-0a2a0a5309dd-0a2a4509d42a-48
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:42:11 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ec193-2497-0a2a45090019-d155802ce0e1-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:42:11 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49050ff7cbdso103656675e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 04:42:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm105671295e9.0.2026.06.02.04.42.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 04:42:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1780400531; x=1781005331; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GVc0tX+OXPCkpJjmWlTtFc6FxKFLyyCjU+eV6tiptFM=;
        b=QHniAofOML8lf0t7IFg6oDvja8w/Q107377XYEEB6nPo13/QHiljdzLY9jzHoS118t
         sypIaJUbkFpVpFFmEHVfC+Wk8i0CFiMO4NdVj4T+GbRtUkyLtH4ecYpdeeV7Jur00KIc
         nei42CLw2PszfxeqiQFbWYg5CEQvl4RTjRMexaAZgJkCA4Carap/tTqlf+nTpIBjrVF1
         Io2RdTLDbPMbNViGao6Mh0vOCQsAuNceDnOxo7PoPy2LdXAgsNqRmPrL8aq5q16UiVVj
         NlAJcHm+Rd8UFH8TbEHE3ZIllQNg9ZpIb9YmOBDNNKU2loddKTSwCr28s6WYqc916KY2
         te1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780400531; x=1781005331;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVc0tX+OXPCkpJjmWlTtFc6FxKFLyyCjU+eV6tiptFM=;
        b=iHOxW4ri2U3hcf6bDg0tw14wOvPOylCjiGeLGo+ITrSybImi7VKMmSoFJCejNd3qd+
         KCChrHbl+TGmrXbbfXSFDdeOKAZ82bTr6R/3DtNQIZosqnQUtY7aCw4bsu31tdZzkOtE
         FbMgidffKMTIioHc3D15jc08ZAzo8GjJZNoWTV0KnOywp1tdRsDf6tXx6ImLSL1rqWSQ
         i8ZLFTT5MAmJ6W1APiC/GnZAhP8ZRPIklX/DdR7MRP/qq5vxlBVO7/dL0QK1RhO78R9X
         taKxOigghWAY1i6IEAqElMViCn9hFvq+lgJwqr6mtIib1Z5mMdHTMCjo4RJmX0V6N9Vv
         rqqw==
X-Forwarded-Encrypted: i=1; AFNElJ9eOqjM1bT2pI+vDACUbZ3GlD/xeo4UCMr7SEFuz74SwZFtb9hAqWT12LBhy0vs+NDHZPbF3D+vGRA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJAQ9jAy7aVC0VHFO9ytcsHN/Jw3Q/BqRnWWmAbrK4IugDbQ98
	o3C72u4XoYsnvO0Fsw4IiueuR/Ch7g/ht/udc7XQxWALpY+2aeXaGEPLDuodq0xuYw==
X-Gm-Gg: Acq92OFzi1dCn6WvAlQup1X9C1oXzHOBRsvNSAud0BJ7jn9lDcVFhoo3IZjUjOzoSkV
	LEWtN1lLvqdIrL/kGan5DbjDi3J6VqIhDPtprcSlezK0lqSOfwP7JwqTr6I1Cgp6B+LyOlRg01c
	dcD/khzBdJmjh4SFe14pOx2UfFTBtazpdez+7G6gIw5pBSyln3fvCKvI6QfhPAH7dF4qpthGjW8
	NF+izCc8PzBtyejXfd13o0GRbAOQOibsH51XqLNaUuXTA4/wKiLDMBip8afeAGwUfrx0Q3Zrbhr
	fNGxKMZogUxr/7D44y5jWh1bhwUHNJsluRjbYAlDzHFfaVh6RyVjMdL/2s/uwxbi8Sb1oL2rQN7
	ySYjDwxZ81BVKcpkQ6D6bw1wcUkJcIq0a6JeJV1RgaJVhWCZUvmMqWyH2QSAXXF3nGrIuQMjejt
	hnB/dzSFL/Jy/4Q1RIKpITUhCl8JObqNJjM9PehqSxmLZOoONMSWHVEO59HtXWXMgaX+KnMkGae
	xydcLdZAxg8ey/P6esdnDz1azd4ocYCqkvh
X-Received: by 2002:a05:600c:8582:b0:488:b187:3c with SMTP id 5b1f17b1804b1-490a29399fcmr223307725e9.14.1780400530783;
        Tue, 02 Jun 2026 04:42:10 -0700 (PDT)
Message-ID: <e3f22fa6-c497-4afc-9498-12449548acfd@suse.com>
Date: Tue, 2 Jun 2026 13:42:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Minor xenguest optimisations
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20260526094324.12286-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260526094324.12286-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780400531-40B60A53-523C632C/0/0
X-purgate-type: clean
X-purgate-size: 1760
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A670A62DA36

On 26.05.2026 11:43, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> Reduce some number of parts passed to writev.
> Avoid possible allocation sending data with writev.
> Reduce number of allocations sending memory state.
> 
> Changes since v1:
> - add commit to cache up to 4 pages in hypercall;
> - add other 2 commits reducing chunks passed to write/writev.
> 
> Changes since v2:
> - update patches commit prefixes;
> - add other 2 optisations.
> 
> Edwin Török (2):
>   libs/guest: allocate various migration arrays just once

Btw, in particular related to this one, see also
https://lists.xen.org/archives/html/xen-devel/2022-04/msg02037.html (and
maybe one or two others in the same series).

Jan

>   libs/call: cache up to 4 pages in hypercall bounce buffers
> 
> Frediano Ziglio (7):
>   libs/guest: Reduce number of parts in write_split_record
>   libs/guest: Reduce number of I/O vectors in write_batch
>   libs/guest: Reduce number of I/O vectors in write_batch
>   libs/guest: Use a single write_exact in write_headers
>   libs/guest: avoids using 2 indexes
>   libs/guest: fill directly iov structure
>   libs/ctrl: Allows writev_exact to change iov array
> 
>  tools/libs/call/buffer.c         |  28 +++--
>  tools/libs/call/core.c           |   3 +-
>  tools/libs/call/private.h        |   8 +-
>  tools/libs/ctrl/xc_private.c     |  26 +----
>  tools/libs/ctrl/xc_private.h     |   2 +-
>  tools/libs/guest/xg_sr_common.c  |   6 +-
>  tools/libs/guest/xg_sr_common.h  |  12 +++
>  tools/libs/guest/xg_sr_restore.c |  26 ++---
>  tools/libs/guest/xg_sr_save.c    | 169 +++++++++++++------------------
>  9 files changed, 128 insertions(+), 152 deletions(-)
> 


