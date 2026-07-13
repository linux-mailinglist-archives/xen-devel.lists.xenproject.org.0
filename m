Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PGM8AguNVGrlnAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:00:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA86747C16
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:00:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dW3SnYas;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361417.1613653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAe9-0005TH-Cy; Mon, 13 Jul 2026 07:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361417.1613653; Mon, 13 Jul 2026 07:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAe9-0005R7-A5; Mon, 13 Jul 2026 07:00:09 +0000
Received: by outflank-mailman (input) for mailman id 1361417;
 Mon, 13 Jul 2026 07:00:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAe7-0005O4-Sl
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:00:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAe6-00E1Vh-JW
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:00:06 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a548cf4-bab6-0a2a0a5309dd-0a2a4506c8da-22
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:00:06 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a548cf6-0835-0a2a45060019-d155802ef05d-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:00:06 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-493b77b150aso23378935e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6d53absm337552655e9.6.2026.07.13.00.00.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:00:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1783926006; x=1784530806; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ykb3U8Qe8uE8oPMdyrkRVkKPcIMWbzFuSoRegICdfM=;
        b=dW3SnYasgv57T3ZULQFMfeLkgMi0LnamCJoq0rRVsHxiz2iH+YsgvUOO1VfBoSkaGR
         zD4wnXcNYIrEC09gPxIfkyBMPWxegi2goRekuMdBKvPiDg3E5DH2geIW3pWK7GOAFp2o
         lfjAPQCqlOhtS/tQagPsW0Ev+A5XUvWpKZqPUES1Df2TGeMCa/aKBmGRT4YnK2gmwjFt
         vjn13uoSqEoF5mqCe2K/QJgyJ6U5N08B1GQZUMdh61Dx9dM/YFevCwuWgMyN4XejVoMg
         aunmqlsc+Zo7gkezNdE4j6SuJpVn+5dwGImFxILaGomf5XZLAhIGnw8pt9sKTf9WNSAE
         nTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926006; x=1784530806;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ykb3U8Qe8uE8oPMdyrkRVkKPcIMWbzFuSoRegICdfM=;
        b=Fit65saqpw7xqAAJ3/QBogg3mfluehrEcacWkZT4hJy2QUaxNnjeDjH3aVwUjx+0Xm
         DOMDpBsYghqqx5h5NsK3u23FlHugbIscUzasqtCtVOXpxTeLpXnjPckZhrjj98t1u/6e
         ceADGDNdlum7FMEC5ZAkpD5+VXpoimXKXnOLAMc1mKf28MNbo0lC6cwbSj2UADkT00r3
         XCTD9uPq03J91snwDqwrpvze4Spl1OZmpQjpgZAqbRXT/WazW5hJ3OXn4k/2rjOwfLwf
         nrjXu9eGwoFz3Hqx/6rjZXiDS/63STxJbopSthfnPoS527oGOsR4Zz3stjinI28IWwJX
         wMpA==
X-Forwarded-Encrypted: i=1; AHgh+RokZlc7ihzpVKZaw2fKxGANdcREPkNZeuc0hVSe1PQfMVsWuReKJVWxtjdC+IvjlGl305sjPLFDumo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw9IBnYKliRHvnITlrDIuGAvoGN3+OPi6Sg86VmughHL/YnW5ko
	URvqjy4YIkg5AHtrLRhQ6Y9fVRPuLjBOQ4FRHA3JoCfrw7TeExbKR6AHX/Wrds7t6w==
X-Gm-Gg: AfdE7cn2psYbTBrmi7M7+2ojWoz7kiwMtjN9lclv2fvyQIRJvTkG3ETeG7iT7MpdSaW
	Qp09zrLv/ejQn2VQdfX8+gmep8wVIeIcC6CYfQsov/z19BqTRXicb4EXFQreW4EqEzgOms6KH5X
	BiDTGVznjWHIyj3WQf+OrOJm78S55B9pJk7kTp3liTUl5IbM9mJTlkFXQsfxS0obR8KrnRH3oRK
	eDfWRRD0NgQWqimdu13itfVZt8XGbOVPijoUhzQttUcd0IfsfbB/lKfRMSsZYRo4W3UfVphazuK
	v9X9YCzAd0zFU1mcfhxxNwJBX0guRx1tAa75ZJCs5T4QMgDIWgG3+jD/L0ebtrPNx9ggY5UCBKd
	QF6Be48fHCPb4kf04KO150pRow+O+VttYx83l41BPqkoA8ELcG9FEt3um7q1ZoI8LQ+dJFv+8u9
	JYzXqtIKLDbQYnIxBhLV31t3EHbpSQ/W431ReJQ6rvOLFrd2UhjO13vHQEVZM73ONc8DDugQS57
	c97
X-Received: by 2002:a05:600c:8b63:b0:493:ee2b:c876 with SMTP id 5b1f17b1804b1-493fd59b878mr58790025e9.35.1783926005596;
        Mon, 13 Jul 2026 00:00:05 -0700 (PDT)
Message-ID: <3fbd0a74-62fb-4c98-9d48-84703719aa19@suse.com>
Date: Mon, 13 Jul 2026 09:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] xen: make config argument const
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
 <1783691847.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@vates.tech>
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
In-Reply-To: <1783691847.8631fc262581453bbf619ec5b2062170.19f4c51a755000edb5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1783926006-512BF617-D0388BCF/0/0
X-purgate-type: clean
X-purgate-size: 1239
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
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
X-Rspamd-Queue-Id: 4FA86747C16

On 10.07.2026 15:57, Julian Vetter wrote:
> arch_sanitise_domain_config() validates the configuration requested by
> the toolstack, and should not fill anything in. The config struct passed
> to createdomain is supposed to be pure input. ARM used to abuse this
> (GIC_NATIVE resolution, now removed) to smuggle output back to the
> toolstack. Making the parameter const stops that type of abuse from
> happening on any architecture.
> 
> The x86 implementation turned out to have its own instance of the same
> issue. It set XEN_DOMCTL_CDF_oos_off into config->flags for non-HVM
> guests. Since The sanitisation runs before the function domain_create()
> copies config->flags into d->options, this relied on mutating the
> toolstack's config to take effect. Move the default onto d->options
> directly in arch_domain_create() (which runs after d->options is
> populated), where all the remaining domain options are resolved. This
> has the same effect and no mutation of the input config is required.
> 
> ARM, PPC and RISC-V need no equivalent change, Their implementations
> were already read-only.
> 
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com> # x86


