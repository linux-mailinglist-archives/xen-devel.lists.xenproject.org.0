Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB8iMoY6sGlbhQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:36:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B527253B22
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 16:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250222.1547702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz8B-0007Hr-Po; Tue, 10 Mar 2026 15:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250222.1547702; Tue, 10 Mar 2026 15:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzz8B-0007FC-Mf; Tue, 10 Mar 2026 15:36:23 +0000
Received: by outflank-mailman (input) for mailman id 1250222;
 Tue, 10 Mar 2026 15:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzz89-0007Eq-RF
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 15:36:21 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2c59489-1c96-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 16:36:20 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4852c9b4158so27902375e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 08:36:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b7f3cdsm94249015e9.14.2026.03.10.08.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 08:36:19 -0700 (PDT)
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
X-Inumbo-ID: e2c59489-1c96-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773156979; x=1773761779; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ChPtLyUjSlXIN1qUGMITksg94TOXzdsCupOaSiQ6YKM=;
        b=Lk+lFEJNwGT+klcpA78Onv1G4LhwjEeP/hskYVNt0tTPOzjuqJHTAxoyJNHYczC3Qt
         h+1M11lCh/NJKRF7vuZlKM15ic4yhhibdr87tu8G5po3c5SoQ4IUoCps6nWRceTTJgRD
         3dg5Cq86/Xy5C8hqcFpfGH3mNg0bf5xFFr/W3C0xcOmKHn6ZjWWil/TmiSIlnMhVVAdS
         qREhzpaGRAZaXWeFPeNmpxoBM7pInOPEaP94+KxKz9uZiryzPG9slsv2S5ykmDX9lMa5
         sHcUaGRrCKAih2KH1I86Rmddn92xSaMWb1J3M1Q80qV6uqSEOSSPUfK/RVvAC61eDeZC
         5dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156979; x=1773761779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChPtLyUjSlXIN1qUGMITksg94TOXzdsCupOaSiQ6YKM=;
        b=GA8EXTcpmZqJoT05rnoRW5l3uLYz3HwC6Ao1hj5ojFpK7vOz0QZnI5G17DMc+lrF6O
         GVDMslIDMb3I8ednHSmKUw55R2gd5RYxzE6v0KD7nH8zKcPY8gPmpEYq53yV/uEW4NKU
         i5zB+f9iYeaCcdz8K1/8SGtHaeZi9wm5bpnrbTTJdygWj4BES8/2fO5yZ6IsDT+PIOp6
         8GXd6SZbTDcn7Vka35L64tN1VF+qrUHuLhq6j4Sw7ly1fGILXokwBPJ4cIiIDjVJg2hL
         s4RQHfdDZ1ysH7FrdyD68NRhjjRei2uRps4Tp5mJ/t7OiqEQG02h5yt1JIdMEoQK8fOw
         yn0w==
X-Forwarded-Encrypted: i=1; AJvYcCU8t7fDSuC7CeZvwWiFLo3PckgpPOZxoFEWA7bpEFspXlSWh2CZX977qkalnjXX/sauqqWNygVVK6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxm1XDBwsbmVKM1u/5b4OpPK8b8mdOIgP5t0CLxtebco3EGZsA1
	xrBUWVYFTomCq0X+oBis7dxOA/FiuZ0SmdM14sQU9e3hi+eDU7zWAOSUxBnrFxjD4Q==
X-Gm-Gg: ATEYQzyzk6ALo2C7E9H8cwwK7Obe+nkc9WKvdCFNVvCL32WknpdvS8Qi+RIZNdSXwdu
	BtMxgA/VS0fqRtGn3ndA1lqO0x8ZwEpCFr2yVF/r1hQG67EBUYJMmsT3+Cyfi46/TczmNHJGheS
	SanuvQuesgWSlRIQIL2TNp6cB3avQgv95wPUzw3C2jFqZUJkIBgB+8rWUpQ0aYXhbzDVGjfaAYe
	wO/irysdfdlvv0b9+1KVq3SGRSVI5AT5tokRs27t5+UhglgM13NMby13KrjEAm/k3JkdTFO8XHi
	Swx2TPO9YGCt4zrSUhJmWbGRq5LYBq2HjE9GN9isEgL6Ph7p3RcWQRggWzMfrhubiPeO1dNg89z
	vY1m4PorM2E/OeaEgsZmLEctP66KfbdRZeKcTsWHEyeJcvemJHbLEPeYSCS3HGyi05784/meHiD
	fUE1Z8DJpfVUfmdj1LcB6OVtKj1bDCAvDNcLdDqdewckRWbBauKGN2KQP4B2xiHQuIe+JOWu+Jb
	bKqUsncwVVmuIg=
X-Received: by 2002:a05:600c:4751:b0:485:3ae3:b394 with SMTP id 5b1f17b1804b1-4853ae3b587mr141608455e9.31.1773156979432;
        Tue, 10 Mar 2026 08:36:19 -0700 (PDT)
Message-ID: <c73afb52-e39c-48c8-bf2c-41b509ca0dd0@suse.com>
Date: Tue, 10 Mar 2026 16:36:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260305130434.635276-1-julian.vetter@vates.tech>
 <20260305130434.635276-2-julian.vetter@vates.tech>
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
In-Reply-To: <20260305130434.635276-2-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3B527253B22
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 14:04, Julian Vetter wrote:
> @@ -45,7 +52,8 @@ struct ioreq_server {
>      /* Lock to serialize toolstack modifications */
>      spinlock_t             lock;
>  
> -    struct ioreq_page      ioreq;
> +    ioreq_t                *ioreq;
> +    gfn_t                  ioreq_gfn;
>      struct list_head       ioreq_vcpu_list;
>      struct ioreq_page      bufioreq;

This change in data arrangement should in principle be independent of the
step to supporting multiple pages. Hence it should be possible to separate
out. Problem being that just by looking here and at hvm_{,un}map_ioreq_gfn()
I can't conclude how you get away without the "page" field that struct
ioreq_page had. If you can get away without, it's not quite clear why the
field exists in the first place. If it's not needed, dropping it would be
yet another separate, prereq change. At which point the remaining pair of
fields could continue to be used, i.e. the change above then wouldn't be
needed; va could be renamed if need be, and its type changed.

And if the "page" field is still needed, then even more so you would imo
want to retain the present data layout.

In any event, if at all possible a goal imo ought to be to avoid
duplication of logic, like what is happening in the two named functions.
I.e. preferably the bufio case would continue to be as similar as possible,
just known to be single-page.

Jan

