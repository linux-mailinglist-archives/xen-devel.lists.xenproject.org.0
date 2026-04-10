Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEtRBobX2GnHjAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:57:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC03D5E1D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278747.1563500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9Xe-0000nV-9T; Fri, 10 Apr 2026 10:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278747.1563500; Fri, 10 Apr 2026 10:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9Xe-0000lk-6k; Fri, 10 Apr 2026 10:56:50 +0000
Received: by outflank-mailman (input) for mailman id 1278747;
 Fri, 10 Apr 2026 10:56:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB9Xd-0000le-3R
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:56:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9Xc-00FLlY-2H
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:56:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d768-e002-0a2a0a5209dd-0a2a45059b16-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:56:47 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d8d76f-3760-0a2a45050019-d155802de8e9-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:56:47 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488c21c636dso11085195e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 03:56:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e50015sm7087570f8f.27.2026.04.10.03.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2026 03:56:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1775818607; x=1776423407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=THSy4Zb1Kagw3dQg2/Wk7y0MCZejmxuh1uOt5CLvbEI=;
        b=gZJVtEMnygidYzBFreoA1PGFeqw+abg7hCcZyHhdpFV8LwY0q80NZEEuAzJK1KL80m
         0gXixT2f6mWyT00roGtlh+1ofPMOydFbySrcHzrp3NMxe+8nTGw3DBg3cJBtwhEPVB4L
         92nKqMNVu3meLUykw4GxykxRBd9dm3C/72jrEqwj7Tr+JTvS8lta/j8nrT66HMV3Yt9i
         75f6YOKjO18IyvgVg2Jv5w5HuqHwtSrAmVlsyadKfsdqJk3tV3yUE4PIWjeUR3cQbQXT
         40QjQCDEO9g+gzd4xqeYJXds30iEgDyYrLsV/hqbpcyl4hTx3vpGoIy4BysuHKHDAfiX
         nxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775818607; x=1776423407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THSy4Zb1Kagw3dQg2/Wk7y0MCZejmxuh1uOt5CLvbEI=;
        b=Z1fsx5THuWDFtQUUG5gPn1LZ9sqBLLn5ksbpi+TK0DlR9xcJ0DtUctP3sPZzoUPSqW
         IOZY4Jqd65WKThEzIq/IId9MEgIx4dhcnjj/K51TbJteGb2GPOfHCszCNC9AGJMPAxoN
         zi2VDJTJ2njtOhZF5IIdezuOJlXvbPy6Udwmq8fTcQHImKQTYDxMeRuEt+Z/MBN07HLm
         UYSXxNKVP96JMKAzUlLi2dlHaF8FB5fLnSEfONFyXhLC7iSZUmLvrLpqhIRvsZG3E4uY
         vkmzwpjCTW1uYo+16/GEMc2B/lX0YcUncR6g6FYFDxxaonYMQ43TIG1I6aXIhRGegUxS
         zvSw==
X-Forwarded-Encrypted: i=1; AJvYcCVyN8FcE+lCuXkXZvSuOq8odh1ccYG1SjYDLbt2YQwLZ+VZMpKzqIsl2rBB5dDsoYoY5FJ4e4LytQg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywxnlxm0/loMOv7aOJBxea0sVqSnPbMuxpPpg1K0Qix4mjL36yX
	ow6gfSx/pO6FiJ+13kmfznkHexppBBpx7uMhAb7G7Z2kgm+/EVo1zx6yx56fuUgUdw==
X-Gm-Gg: AeBDietSGY4JZmQTGJNmvLkOEG5rMJADABHmTljEgbrJ0UCrxZqwBfRmrKOFjyhyulf
	SXitLlwF7SFRd3N74bv3MglEs5ZdQxfUEi9zQUq9jwCx+Jz3n7zHimXj5fPAeuZOWfErp/ry3z1
	GWA9SzP3fMkKYrcZHMjXsejzUMXIWeES4m/sgv9QXv6cizR2PC0HqNfrw20/3F4OsVjCVx8UZ63
	m+QL47my5RNEQh1n8fbao/zIBDPd9SKKwvcNeGPkoKX7zM35sYTegwusw1+TI8koy5Hkbi6J9xe
	0sf7wZstino/YiJxFu8j9IQb+lhOGToRy0D3dRiNjgsGLdGOyJ23rJy/jhGaOo4+0d0rNUuww4k
	bp4C0Au3IyV1whq+EwjBaEjp4pPJB6f2xuayQNpuPtAHVPAxULO6XARX5CLfQbMnTw4JvCTFtna
	1rFRRAMjfcasLAHqqHlD38QhSyEcArtLzq1l6fSkzyeBkcixTWLwwxGMp4fU7aEwsw15joxnKtc
	mYmiF3bF4xh4JU=
X-Received: by 2002:a05:600c:8b27:b0:486:f634:ef1 with SMTP id 5b1f17b1804b1-488d687664emr29959055e9.17.1775818607284;
        Fri, 10 Apr 2026 03:56:47 -0700 (PDT)
Message-ID: <0aaca0d3-c5e0-4344-9679-2c03a96bbdfd@suse.com>
Date: Fri, 10 Apr 2026 12:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20260410082955.42038-1-michal.orzel@amd.com>
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
In-Reply-To: <20260410082955.42038-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775818607-3312596F-917F87C8/0/0
X-purgate-type: clean
X-purgate-size: 775
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:luca.fancellu@arm.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7CEC03D5E1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.04.2026 10:29, Michal Orzel wrote:
> The check uses (*num_colors + (end - start + 1)) >= max_num_colors, which
> rejects a configuration where exactly max_num_colors colors are specified.
> For example, if max_num_colors is 4 and *num_colors is 0, a range "0-3"
> gives (end - start + 1) = 4, and (0 + 4) >= 4 is true, incorrectly
> returning -EINVAL.
> 
> Fix this by switching the overflow condition to the state before commit
> cba8a584de17 that regressed the behavior (i.e. don't add 1).
> 
> Fixes: cba8a584de17 ("llc-coloring: improve checking while parsing")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

I'm sorry for the breakage:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

