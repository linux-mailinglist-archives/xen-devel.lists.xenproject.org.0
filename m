Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id O9V+FCaLVGp8nAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:52:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE43747B4B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 08:52:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TWPEORfS;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361406.1613644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAWM-0003pf-L8; Mon, 13 Jul 2026 06:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361406.1613644; Mon, 13 Jul 2026 06:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAWM-0003n7-Hp; Mon, 13 Jul 2026 06:52:06 +0000
Received: by outflank-mailman (input) for mailman id 1361406;
 Mon, 13 Jul 2026 06:52:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAWK-0003mv-Ii
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 06:52:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAWJ-00DyvY-VT
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 08:52:03 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a548b0e-5cb7-0a2a0a5109dd-0a2a4501c5d8-24
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:52:03 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a548b13-3ea4-0a2a45010019-d155802edcd3-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 08:52:03 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493f431e317so26573575e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 12 Jul 2026 23:52:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f21543sm76876459f8f.35.2026.07.12.23.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Jul 2026 23:52:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1783925523; x=1784530323; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S18dqNgpy/YfQrOtaaEGkpZaetwQIxuXVt5wf32ZvIQ=;
        b=TWPEORfS3NdGfOnEW4EU0b57RlNLHNTbly+V+xRu4b/31pG5/pr2v/hK1Dy19yKUw9
         NsPuFaaiQAxTopJ+SHSdJpFaXSRr8DIbppL5S1uVGh9Au5kAXUFwWX73WKFggOoWPYNj
         ZPGqfVgb+XKISKyC+UdPyiSAd9UkeWPDYpEcQo3R+K0Ac8CLEZM1sgssimCX+RDpKEdC
         bjfEYwbnZYEHf70WlBnJqlAZfEFVKAQgiwfBCxo6Y+mxFs7C1aJhX00If1vIiTSNpzcY
         lMXQwjmZeu8DzGjQoqy5WKD9tkGihcHXXHlXJMN5ZGw4MKf1+cojwjZXHbRwpQLK0OTr
         csJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783925523; x=1784530323;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S18dqNgpy/YfQrOtaaEGkpZaetwQIxuXVt5wf32ZvIQ=;
        b=fVTvVP4R3OsOVbI3oJ5RLBG0GaGbkQNPUhMPFLencwOrlMMtxDExWlT4JdohrrvmfF
         8g2Fde4gaXgsfoomdmYA1w1u5jAiytaVZFTmSk2h9Dri+2dGqIzBwN97WTbSZ4gA2KRP
         0suqp8L5grGj/xV3coU1ztFIz09ib/wJ+13gI8U5Hj9xGBteX3E84j4/fwz24IVlN5Xg
         Oe+1Qe4avuaxwuNwIBYjj+l0lG9Orqd009n2z1Djt4vibIMismcLuK0L/DKgUo66739F
         jcMJi52f87qJnkP6SDmNkLVWpBVNQJkYOo8KqMHfgH3GdU66XjcbwzqY+KcipQRzK3fW
         LzFQ==
X-Forwarded-Encrypted: i=1; AHgh+RraWBUZOxWJ2Tja3f2HnoSs8SVoWhQgUc2zzAwnfPxgymO+fANJbpcxg/qmLx9U1yIo1ZPmoM+6a88=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDNqV8Et60n261ROOBW8bGs4WiDpvYY5PqSeXY3QI0gVZeqf3q
	02pv8fcumwtVb2jid3KSwwhsUHdfg1n6QfKnB/+jBUdWzneeVVm5n4z3kG3ZLwW1Xw==
X-Gm-Gg: AfdE7cmEEPB6i/za7hAf0AYzfQjiiD0UntAoIyF+yJMzUyjFDYFv8O3wLNQDOkce6+q
	CXwHxkhaFkmR/4cO3E0DPdE18t36IU6f9S6W3HxvL7U5QfMCPKk7S8EzedoVsiwD8gi6vUIyJ6p
	FoHh+a6kLkWslnn2x1+BN7u3ECbn230ClKjXnUrusMTNu5CXdeW+Neu+qBOFR+xmimc1+k43WJs
	vl0ZRHmV/eWmCHtn5jvPyPSSLKaVAmFEoQ9I8agUcscAcIqPGYFx7TJeYstw5++rchLWoPro7r8
	ygibk/5m4+4rAZG2oW7zZTM6ND8ZoNkNvo+WYCxl2YEjeke+kKQWFkeNCuzuRwpgGdXuVBErd+l
	nj6NkszeAZsCM189j90I/EUp5Qz03pfTwu0gpuvReAxEDFc1YJHVGVXPrc7yxVRb74yTVrpVyJk
	Xi8mYg62dGMBDij9Ui3xZg+CDckOcpqaVQHKEErp509lqTuD7SDgd5IgFuiXXKcfTPiL+EvKXIv
	B9F
X-Received: by 2002:a05:600c:e557:20b0:493:f822:ac5e with SMTP id 5b1f17b1804b1-493f8818052mr54556485e9.23.1783925522871;
        Sun, 12 Jul 2026 23:52:02 -0700 (PDT)
Message-ID: <fbbadb1e-8c5b-4f6f-831f-7b6ba1cec8aa@suse.com>
Date: Mon, 13 Jul 2026 08:52:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] xen/arm: report clock_frequency via sysctl
 physinfo, not createdomain
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Andrii Sultanov <andriy.sultanov@vates.tech>,
 Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260710135503.301746-1-julian.vetter@vates.tech>
 <20260710135711.301993-1-julian.vetter@vates.tech>
 <1783691845.8631fc262581453bbf619ec5b2062170.19f4c519ec3000edb5@vates.tech>
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
In-Reply-To: <1783691845.8631fc262581453bbf619ec5b2062170.19f4c519ec3000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783925523-3E2EC0A8-461440FF/0/0
X-purgate-type: clean
X-purgate-size: 1074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FREEMAIL_CC(0.00)[vates.tech,citrix.com,amd.com,xen.org,kernel.org,suse.com,invisiblethingslab.com,arm.com,epam.com,raptorengineering.com,wdc.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:andriy.sultanov@vates.tech,m:guillaume.thouvenin@vates.tech,m:marmarek@invisiblethingslab.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:oleksii_moisieiev@epam.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
X-Rspamd-Queue-Id: 9AE43747B4B

On 10.07.2026 15:57, Julian Vetter wrote:
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -120,7 +120,18 @@ struct xen_sysctl_physinfo {
>      uint32_t cpu_khz;
>      uint32_t capabilities;/* XEN_SYSCTL_PHYSCAP_??? */
>      uint32_t arch_capabilities;/* XEN_SYSCTL_PHYSCAP_{X86,ARM,...}_??? */
> -    uint32_t pad;
> +    /*
> +     * ARM only. Based on the property clock-frequency in the DT timer node.

What is the behavior then when using ACPI instead of DT?

> +     * The property may be present when the bootloader/firmware doesn't
> +     * correctly set CNTFRQ to hold the timer frequency.
> +     *
> +     * As it's not possible to trap this register, we have to replicate the
> +     * value in the guest DT.
> +     *
> +     * = 0 => property not present, or non-ARM
> +     * > 0 => Value of the property
> +     */

All fine, but ...

> +    uint32_t arch_clock_frequency;

... not even the name says what the granularity is. Certainly not Hz, or a
32-bit value could easily be too narrow.

Jan

