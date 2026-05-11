Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFGmE86jAWpKhAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:39:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABB50B12C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 11:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305933.1578040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN6W-0007ws-8u; Mon, 11 May 2026 09:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305933.1578040; Mon, 11 May 2026 09:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMN6W-0007uW-5s; Mon, 11 May 2026 09:39:12 +0000
Received: by outflank-mailman (input) for mailman id 1305933;
 Mon, 11 May 2026 09:39:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMN6U-0007uQ-SL
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:39:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMN6U-005lBz-9L
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 11:39:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a3b7-e002-0a2a0a5209dd-0a2a450cc314-42
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:39:10 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a01a3be-62f1-0a2a450c0019-d155dd33d5be-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 11:39:10 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso2175959f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 02:39:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548bb51d40sm23488806f8f.0.2026.05.11.02.39.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 02:39:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1778492350; x=1779097150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O48vKOkh4FXLBWarD/c9ETg3W1blsY9p5bn1qnH/PQc=;
        b=Kkp4VXNL1QeSCctcOyhtSAupN25l+crJg4AMWs2xQd7fOq0s0e0tS5l7jk32tbi424
         /bav1lTy2FPapHJARj4U2GWIdjermcVYd4bEgn6CtGvnXjEIiz70l5HVa1DYvNCpry++
         HhnQrqb5v2oBg7W59QKGEJxfI3cLdgjY83B4+JQAwm69kHJF/0kGegF8XcgjuCWPHA4O
         l8kE7GBkPqEeXvwDkegEBtZY1F+6QcyZmtERufmXc1xyE3rWp8Gzyhb4ralZ+x4jzpDp
         y4wK0+76O5wejatwyQN8C2jFu4hD1hMBr7I8UIVXztyC/tDKGvxiy0zYBVGe26iyqnbA
         3PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778492350; x=1779097150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O48vKOkh4FXLBWarD/c9ETg3W1blsY9p5bn1qnH/PQc=;
        b=XR7pIWhZzOSaOM6pyCMVwy82sj7NvU3WIFM2lMs/Ontx46UWHv1yH+tsfVDDHKj0cQ
         v6rHN+RiLlmWY4pQ2Hmt2Q++uqQyyccadb24bFOz4yOLfgvlg8pblJdULW7a7B2alJsx
         pb8OPQkof1bdxc1c1V5YQUDbviW4Jrrcy41qsfpO7eMqCVh7V5PMuigsJT+emRp6YTds
         cL04twqu7gFR457Erds9h3TSUS1gb6rBfyWimXLeOVc3pzdz++5jhS7/apSd0ueJ2xSz
         kZhnpH1TDy6oouyfAyHctoUEXYdwoWhXmaQ4HIwoPHKQP/BgZTXKAFb5fMzf3bM3JAF8
         Vd1w==
X-Forwarded-Encrypted: i=1; AFNElJ/gG2BTYaTTweB0Mo/SFB79BaCkaSr1692Ynl0Siy210oWeTXkmsPp1OWoxdeyiEINMZFDUpjnXzAU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDJu4Omx8UO2Laz1ltmCsdooFM7Y4e6HWVzcmqoAC5sVtba0l2
	HHqb9D3J7oPxeDlTJ995gH8nmeqB55Kv2e7+jISgevbGx/u2rrlARzefeLqCda6FOQ==
X-Gm-Gg: Acq92OGgeRAf8VBGMMp1xj0YRDtn4j7Os6sDUBXqw/3un4nDExhGKadUk3Mb7ngwN4m
	VpWG1Jmz5FeiWPQlkOtIdkESkrQRj0/qTwSXA9KmSd/jD1e4kYO5mjJJlHjSFIhlG/cuQE5KAj2
	hmCi65J0WIxKUkWtLVwRN7EbUaCn+66beGeg5L2xgLhGGrPKIB51CMb38RF1pz5xSrl9KYixWAq
	v/5CuATdvU/noZhBrCVnI+OvMpPfhyKqg0ockB3/5+Dv/1P01TBLwc+cO5RQ6w4/a1UfvpvXiuV
	R8NMOOZ3RcTfPplgHvdfGvY+oeFeVIbAxCqGm8tYY64Py4u9YaY+IICP/iWg7I+m4qhXPbX0fm3
	AF58ujLSm0rafF5og9QoUcdc6xXNXSw9811J1y2oKEXTOGnNOFyZRaR1b3BL8hQJoj8YuazQwJI
	e9f1mXz8l8kluW5kH9qH792RwYb+i3RFwa05mgWUYigX884zKRh8u0izFvWgo02Hkwskm5FdMXm
	IFLgTiCKjrZCyVlSV16ZIwFVQ==
X-Received: by 2002:a5d:6942:0:b0:452:2bb2:9dbe with SMTP id ffacd0b85a97d-4522bb29e31mr25210913f8f.1.1778492349473;
        Mon, 11 May 2026 02:39:09 -0700 (PDT)
Message-ID: <b60c1209-fdaf-4e9a-b93a-878a3aeb64fc@suse.com>
Date: Mon, 11 May 2026 11:39:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] tools/ocaml: Add OCaml binding for NUMA claim sets
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Christian Lindig <christian.lindig@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1778272036.git.bernhard.kaindl@citrix.com>
 <10726c7afb43856a1014c6b6e24700442ff8740e.1778272036.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <10726c7afb43856a1014c6b6e24700442ff8740e.1778272036.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1778492350-DB97DCF5-304221DF/0/0
X-purgate-type: clean
X-purgate-size: 693
X-Rspamd-Queue-Id: AEABB50B12C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,cloud.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:anthony.perard@vates.tech,m:christian.lindig@cloud.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 08.05.2026 22:27, Bernhard Kaindl wrote:
> Add an OCaml binding for xc_domain_claim_memory():
> 
> - tools/ocaml/libs/xc/xenctrl.ml/mli:
>   Add claim record type and domain_claim_memory external.
> 
> - tools/ocaml/libs/xc/xenctrl_stubs.c:
>   Marshal the OCaml claim array into a xen_memory_claim_t array.
>   Map nodes of -1 to XEN_DOMCTL_CLAIM_MEMORY_HOST for host-wide claims.
> 
> Acked-by: Christian Lindig <christian.lindig@cloud.com>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>

Nit: Chronologically order tags, please: Christian can't have ack-ed
this before you signed off on it.

Jan

