Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FgyuN70ZQmq/0AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:07:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FB6D6BB3
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:07:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SvzaLncN;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347254.1605126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we65U-0002o2-Bz; Mon, 29 Jun 2026 07:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347254.1605126; Mon, 29 Jun 2026 07:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we65U-0002m1-96; Mon, 29 Jun 2026 07:07:24 +0000
Received: by outflank-mailman (input) for mailman id 1347254;
 Mon, 29 Jun 2026 07:07:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we65T-0002lt-A8
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:07:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we65S-00Dxx4-Mf
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:07:22 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42199c-5cb7-0a2a0a5109dd-0a2a450cec40-42
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:07:22 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4219aa-f399-0a2a450c0019-d155dd2ccd19-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:07:22 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-473ba028d46so527592f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 00:07:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-472de944719sm12668085f8f.2.2026.06.29.00.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 00:07:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1782716842; x=1783321642; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yAMaYcFCIVn6vc18ORBsfBP+JXkS13B56M6z0ZUCU0o=;
        b=SvzaLncNrWkODjT1m02YA2luw/K+sxxVBwA6FZxfqJQHSjixZFgfg8AvaosrpCqds4
         XNRFmKQLHmmJ3nwMguK3SF2b/mCyNIbCD6IZg5VYGWXkrkSCu2NaKCjde6ropZdXtKiw
         /GOAmkHgqmXUDTauR4y+G5oVAf4ZMIxzA6k6QTQ0prj3adP+D5zhe3/CV8mj4ugpR5x7
         GoG2Kn4LoBKODWR0xfaSHGp5kBniQ2NRVFFzocMqqKqA7clcdriWH7DEUBEV+BAY/ZqL
         5AXmZlHkUEzVNr5u3OXg0tHYqKSGmqEiRSp1QMpdWgpyJ6VjIuklUkt+xhS6D4jwtxKT
         xNBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782716842; x=1783321642;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAMaYcFCIVn6vc18ORBsfBP+JXkS13B56M6z0ZUCU0o=;
        b=TftIBq9QPtL+1AzNUqcEkmcWaVCtqyB8fyDhWmc51W3eDzXRbqnskAwTRxVlAvqZph
         LyuT32kKANpOT6nF21eit5wUncWm5DMyvYsCcT2b444pcWcr3YLq457ROC/NHf7YHs+/
         +x3ae48gRvzf+6w50zr6Z7tz5CufXlVliChkSnFYcyq/fLCMYXFuhHwVAuTHd0jqCglJ
         ifq4aU9bYR9HO6yveUS2R4fS3RFMTF4YeR8szGi1gn8bEFJKI9uVil3aWqOvju5rrCO4
         li8RDu1Jd54CpyOMG2QzNe0SuX/G/wVGr9d+kIt920IxKLTfrqX+jCKwu/wgEid5wVVS
         WRzA==
X-Forwarded-Encrypted: i=1; AHgh+RrownoVFRhrMO8UV6F7KXYTslvTuDW/RjBL007a2pWdE5PqoOSUV5NkWCoKnB9B81pNYkhOQSbH/gI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxiaNegW9PS4FXGfyfDJ/a+scW/lut2k5+rhDHmxnGDMX6G8Oqs
	IW7gWoeJkIExhT6nvG+8Fc+/sStD/FZ4u//yFerWjPuxEC3y/Sp90gyvlecmIkh8WA==
X-Gm-Gg: AfdE7ckj1Yb99jvUPSF5vcy/KXFPD6r6EICSEhj8hv6gPtIXf3MaFzqsni25s3a+3Kt
	mJtt5KnVoc+jPjbYsOz4uC1XWH9aPDJBt9XYvjIIQjtroJs3evULEM0Bis8Xab211+9p0jy7grY
	4J5GO9+8+FHgk8uuiYN5YMCobzqUH9P66ytOHcjzs9WC8/aDsHoIEYSZ+qwqcjuYnxxXtLc2SV9
	JQaYRidX0MGu17qRO5yPV52qSC2BucZFcNLkhOc5eRTFdiQplfwF2aRlTfla/GEGygSCO1cs2Sg
	DYL+d2F2ivUAAdn5SbFK1za6sLKmj9rrmNxYL6ggb93KoLTN5LNHgWwOv1H4FdtMbuKiTqK8TPC
	+dmXWCaupRFtWMSFrfQZBFtaPa8sJd+UQKqEx94Wdr8my/ccftSnvUqAbQ+JvQBj3esMHIz49dR
	ABCngwUH9G9toenlTgw+yCUNQjqaQFMdTzOpgzlM4xRaYO5Fq4MSNAs4HN7hipZDEBLJzOCcZEK
	UJG
X-Received: by 2002:a05:6000:430e:b0:472:90af:e406 with SMTP id ffacd0b85a97d-47290afe5f5mr7013168f8f.37.1782716841963;
        Mon, 29 Jun 2026 00:07:21 -0700 (PDT)
Message-ID: <b68297e1-bf69-40e8-b67b-48926bfdd6b9@suse.com>
Date: Mon, 29 Jun 2026 09:07:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/25] xen/riscv: implement make_arch_nodes()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <7b35f8da6b35920c012c56d5790584e237b2fe4b.1782487661.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7b35f8da6b35920c012c56d5790584e237b2fe4b.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782716842-0D329D51-E60EFB86/10/73395122804
X-purgate-type: spam
X-purgate-size: 555
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 458FB6D6BB3

On 26.06.2026 17:46, Oleksii Kurochko wrote:
> No RISC-V-specific nodes need to be created at the moment,
> so make_arch_nodes() is implemented to simply return 0.
> 
> It is placed in dom0less-build.c as make_arch_nodes() is
> only used in the dom0less code path. In the future, it will
> be extended to create an emulated UART node.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Add Acked-by: Jan Beulich <jbeulich@suse.com>

Please. This again requires the committer to remember to do (however
minor) editing.

Jan

