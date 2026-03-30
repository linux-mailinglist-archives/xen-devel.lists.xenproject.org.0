Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iB/GMuaTymnF+AUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:16:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBBB35DA15
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 17:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267806.1557292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EM5-0008Qr-VI; Mon, 30 Mar 2026 15:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267806.1557292; Mon, 30 Mar 2026 15:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7EM5-0008Oa-SW; Mon, 30 Mar 2026 15:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1267806;
 Mon, 30 Mar 2026 15:16:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7EM4-0008OU-Kg
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:16:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7EM4-0048A0-0a
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 17:16:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca93d1-5cb7-0a2a0a5109dd-0a2a4508bc50-16
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:16:39 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca93d7-1950-0a2a45080019-d155dd34b5a4-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 17:16:39 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43b8e8e7432so3840949f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 08:16:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf245f87esm18928826f8f.22.2026.03.30.08.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 08:16:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1774883799; x=1775488599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bc/rE4qH/6KZTScNENcv6A/Mmu46KFFRY4Zf+9qK/G8=;
        b=UnZcYktGPvmeHuArEYJh45pixHdYZzEICapZ+8ee0Mxs6jhwMG3YR93a4X8inQB2ZL
         ALeTrwAbhNxlBEmN88KlX9Q6pN97OwsL/ynM8bPDPqY80SVRdCaMiss3mbqD8ZaFE3Ua
         vFT8I9gTtqiF73IKTiq6N+GFZLjcJWFNcj7WEtHTgFwPxvecTDJOvzAyvwpqL3FSpmTA
         r8DmdkJAXuraG8bakFJHYF8ndJJw3OwqwDTCE+RiLaGDoMDKnOCPKKsu75XVXZf1yfQM
         EFkJUpYyzxrPgMyRYQ2UVUcYtwgOfq1CXL/3YZ+eE5QqrE1x1whSniQDWPz31mGkK9dl
         Mlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774883799; x=1775488599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bc/rE4qH/6KZTScNENcv6A/Mmu46KFFRY4Zf+9qK/G8=;
        b=SvN+SGmp9+QBsOyi5R2pOCyFBUpsBj9dZUSqNOdHMf7NxTokm+/lkahm51Ky0gGmLv
         BaKfPu8n8uoQ/VkB1l7GS76nA4yoQmqjnx2QsbyppuAPGSy75A7O46iTss6fUU/kp9qz
         RZ3hgQHYxbOKZuvDOMn8yECBGWL+GxTuWuHvztQakGIaSsDmG3/y/7VVw/ZEb45GnsJM
         V2ZA5YM5pa3DPbagOkCcDjZ2OHlJM+U91MoX/4YgSZxlXjQIE3eDHVISylvM7eFa5Ege
         /Ccohx1I7ocX0t6y+YXvC08BKE973Gc/Vr4TDRTh4QdkkAL4eYDL/Mod0s2OCiFjnyda
         JNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW+bjslE38IT9d7YTZSxIfS/x93vjgC1GgwsffZ/eg9j5K5AmJG4LhWT3nky627NE6b8PS0a5AoSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzub4KJ3i7F+PSoeqkqmsUvJ+14zK7RP+X0A6/RZeTBSu5gKdPk
	6d4mJeQQwyQSC4PM5YAUtRU5dbZHyQnN8VpuSuEj5XSk4oqj2nETFex2pp9eoQqqDQ==
X-Gm-Gg: ATEYQzxhzrkCu8AB6VfFEvSf+W/sN9HgmHPPRjSemYUvyyjaz6SAIkhTRMzwU1wpnsR
	SaHm871UGCDbm6aLnFCrwMpprV4nJbKdtZlf8QVTKMvksiktaDDo4IsWgY29YAPncbm6chbXlmU
	MX9gztNcoTbJJdgbowcbGB5a9bZPFl0yUWZl0NJMPYCODEiSWUCe5B6ds52BuNeypHBMYGuYfkV
	8xzRBIgcg6IUji0MPlrXozyMtd4gtx2jwnkJDkuUyyoc0pfiLUmO8S94AyhXvxPQv1FB5uGa8hL
	cKmoVnYG8hcR/ZeRYN7CDB8nVMMmFxEzWK6quiuipZJauiPy6lf9jcKeAd5bsbIAjAyavfQMcm4
	/e0LCTW8m2qBzdfPOhKQNSp2mSPPxQXQ6inrlV6c5YeXFNx0hGYN4ZzwwKwUSs0xSZ6ywXaHPXu
	MCxsSVvlDpNaLYDMzZ3VgSPsIOvyEnKnu8yCNfQCgGWiIHmHV73SzxzBxKYrb7gaFE0N+tfL06G
	VUxyVoKTRMxs0c=
X-Received: by 2002:a05:6000:1889:b0:43b:4273:a6d1 with SMTP id ffacd0b85a97d-43b9e987aecmr22654964f8f.7.1774883799316;
        Mon, 30 Mar 2026 08:16:39 -0700 (PDT)
Message-ID: <7a10da47-1e5d-4911-8731-f20ae48a8d04@suse.com>
Date: Mon, 30 Mar 2026 17:16:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <05365c2b70147f30fd97a2fe5b7ab66d773c0f32.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <05365c2b70147f30fd97a2fe5b7ab66d773c0f32.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774883799-F0818726-25792027/0/0
X-purgate-type: clean
X-purgate-size: 567
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:rahul.singh@arm.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.985];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3DBBB35DA15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
> p2m_gpa_bits to use architecture-neutral naming.

This desire is limited to xen/common/device-tree/, which could do with
saying. I don't know whether Arm folks mind the renaming and the involved
churn. An alternative maybe to have

#define p2m_gpa_bits p2m_ipa_bits

in a suitable Arm header.

> No functional changes.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in v2:
>  - New patch

Missing your S-o-b.

Jan

