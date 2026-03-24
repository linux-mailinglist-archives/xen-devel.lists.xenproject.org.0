Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAfjELVNwmnvbAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:39:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57F7304CA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260136.1553497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xHz-0000ri-UB; Tue, 24 Mar 2026 08:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260136.1553497; Tue, 24 Mar 2026 08:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xHz-0000p0-RK; Tue, 24 Mar 2026 08:39:03 +0000
Received: by outflank-mailman (input) for mailman id 1260136;
 Tue, 24 Mar 2026 08:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iLjC=BY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w4xHy-0000ou-3J
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 08:39:02 +0000
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e72bc813-275c-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 09:38:59 +0100 (CET)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-43b4915161fso3511142f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:38:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116abe8esm36738445e9.4.2026.03.24.01.38.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 01:38:58 -0700 (PDT)
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
X-Inumbo-ID: e72bc813-275c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774341539; x=1774946339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yrIK0cH18caRAYklj3a6M1/C8j/72dYRV5JOC1qRuBs=;
        b=e9DVRgD2pvT2UEVPEU+AFjZ5/NafpGZtX6lV9yyC2pf8qoA+CbNKUKjC0+F6VM1zuK
         2JdHvtxaYrNnwi6sijvel4hVTmaVbRavAwxx4kdhCW6fwD3OxeGQUF0SNVJ4Y5BXaLnm
         Y2758se05K4rarfh2C3Uylt6ex/9sO5QBnX3xFHZT6CVnWLHDCt3pP3Nw4h+ENKvI2bn
         nbWjrSuZIXawmBfFxY0+LeZDsw3Xfj+qeEL6bkN2Oajgt0Cc95WU78D7tn4yoUEv1TZO
         PRXR8Crxboy4j1ij4B6wH5HXU1b2qhYZO/TRKQNtuybSf3MHuAy3oBWSvNsv9bJkMSjp
         04sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774341539; x=1774946339;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrIK0cH18caRAYklj3a6M1/C8j/72dYRV5JOC1qRuBs=;
        b=kBOA7Mmf1fkfNujeDsyFbObmK11jwXDdZqnlGx1V/ZwFHBUBZ6xIwhWOjs+4IbsYB/
         /AzhKeVwqr7cMjRn3iXlfRDfRsgSKBGy/1Pufo+RV+jzeY2iLGTGa2bCDVj0PlOXglQp
         BSeb944G7tl/Ned+MyH1fo09kHbXbOYKtRjqilsI56NNRL/3s6getJLRaIR60qK6MnET
         tsJdIndSCZDI43B6OA6HAqESVBzi1yjgYkXQ0zNBkjeqhwi50bEwZtvngyomZ1fumEbg
         ScGSSEhEXrr192LC/W66l681MImtnOPLVQTTTOMahxFShsFNHmVP6OPf4dCcv0uLin9i
         pfKw==
X-Forwarded-Encrypted: i=1; AJvYcCUIjHu2/sxZizXrNjvUXIgJ2QGN+PyCsZU3ztQkrQxBSo4V2h/R5hklenCrr5WLrxZvy6QABGLIWZw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqPE5QDhG9fU5zzMXB8y7Xyups2bNNK8LmcdydQv8SebHypeIT
	QLvMjFeZnAJntceoptnkrGBExZqnwOIdsOWn6GD+hpyHiyUdNeymb5Sv/F0M+AQmOQ==
X-Gm-Gg: ATEYQzztl6bSnFrJ1gzvDV8k/4Xa5iBAXk31whDWJBRnv1T6AOtSR9u3C3WMvlX3dYl
	jgk1gYAKzj2jOqk/ylJON8GQz5mkpygjURgL7namQga+TMVmMRlCWsptJFnrtndU7n3gWC7VCyO
	jYvKbg0A6T96gagkJ2CWSTmJKjTTCYw2uWenLN3sRljnPZDcgDM0Z7+gSW2TicnqFSbWmY2nLD2
	ow2l2ESmpLbUk9ckeKCiGtkK2uazfZ3fTo+48zXAD+RIaXX36zlC12CDmViPDUZMfZ/iL67HZDV
	zSBTpi7ZSjukc+iUkWSEOXhdUxLipMx9JNmvM++VD87wT6vwii9XLHCikbyVY7KxsPFnuhdSHtq
	LYoHB7Dm5271LHkJoY+P5fJkK0UxpLPufiDH/3Z33TAwPVRDZDtzXkVc9fhq9bfFkOvo1Hrw5G9
	HfmvlmtU/ShdgnVMULExoo1KDOHMtSmvzSytypIXBD/2/k2pN7SB3PQsyKCoIczn4ec4a00bHkJ
	ziteZub4fzKNlI=
X-Received: by 2002:a05:600c:3b23:b0:486:fdc6:1c0d with SMTP id 5b1f17b1804b1-486ff02da9emr223643025e9.22.1774341538867;
        Tue, 24 Mar 2026 01:38:58 -0700 (PDT)
Message-ID: <aee68296-4a99-4c9b-8bf8-58477ed19d82@suse.com>
Date: Tue, 24 Mar 2026 09:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/23] libxl/arm: Introduce domctl command for IOMMU
 vSID/vRID mapping
To: Milan Djokic <milan_djokic@epam.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <9f722baf917fd47227b636287dd825fa1d695ca1.1774305918.git.milan_djokic@epam.com>
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
In-Reply-To: <9f722baf917fd47227b636287dd825fa1d695ca1.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A57F7304CA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 23:51, Milan Djokic wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1276,6 +1276,22 @@ struct xen_domctl_get_domain_state {
>      uint64_t unique_id;      /* Unique domain identifier. */
>  };
>  
> +/*
> + * XEN_DOMCTL_viommu_alloc_vsid_range
> + *
> + * Allocate guest vSID range and
> + * establish pSID->vSID mapping for target range.
> + * Allocated range is continous
> + */
> +struct xen_domctl_viommu_alloc_vsid_range {
> +    /* IN: Range first pSID  */
> +    uint32_t first_psid;
> +    /* IN: Number of vSIDs to allocate */
> +    uint16_t nr_sids;
> +    /* OUT: Mapped range first vSID */
> +    uint32_t first_vsid;
> +};

Padding fields want making explicit, and want checking to be zero on
input.

Jan

