Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DUljGfhYqGlxtgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8587203C37
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 17:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245722.1545080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxolO-0006Ng-OU; Wed, 04 Mar 2026 16:07:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245722.1545080; Wed, 04 Mar 2026 16:07:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxolO-0006LX-LF; Wed, 04 Mar 2026 16:07:54 +0000
Received: by outflank-mailman (input) for mailman id 1245722;
 Wed, 04 Mar 2026 16:07:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxolN-0006LR-8U
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 16:07:53 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4be01a62-17e4-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 17:07:51 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so82580055e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 08:07:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b3cc2e65sm28542085f8f.2.2026.03.04.08.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:07:50 -0800 (PST)
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
X-Inumbo-ID: 4be01a62-17e4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772640471; x=1773245271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lIanfJHGJrbMTqrVwQVmc0FAWMVR3HjKHqqvv6oPTxo=;
        b=dkrB8AXvUuriCg8Kkpiy2fowo77wUub/w9yr8K0csXWcwiTotG763saBxxPn6ThtJh
         PqUBE/87Pz39kLkpSlHErm46PNe+SAYvw0m28EmRl8a80muedP3RcNZkKam5J41NaGzK
         9Qhegziu1YElVYHcdi/+HvoXGRNeQ9XbfQYRglou0c7xEKdPgUz8f5PoBT3MFAK3OaGg
         4Yas/caTLiy6MFdxL234o/L7BWObNl7tnXk0saFHaamVXc8/VPAW9RcNndKa9K/3ZOvZ
         b//kZzycT8vsUGK4ghOn8eKdsxqU/U0V3fdY0rvPjVk4Mt2UyhXvc5WPhIDImC2F3vsL
         5ZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640471; x=1773245271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIanfJHGJrbMTqrVwQVmc0FAWMVR3HjKHqqvv6oPTxo=;
        b=FVz88ilwiKFUT2Lq12gfYdRwJRkarB3RMXZIsPvS5e61dWbxLyEfe2Nmcr9zVcLpNA
         RUjawgMoPsaBuTo1NdwoTaT8ZFYov3tn+NInNpQ6tYbVEmQM6ejyWMxfm2YRKR+H5HrP
         pE576BfebwhSEqHofbYfZtZxmO2oSWakEV4EksP6uazUPoHH+mDGUK9RDrN3f4o02cA3
         l3AG/chDoRe931mdIJVHrgTDGGAkG9QGb/bW014wsBd4WsEpnqtaYl9Ma2l6yoCtlE03
         lKJOHUwEED6cHAmFYbUvh60SHrMsBX+DN7kg914q2hvvJGoLW9MSrGPmmX06lg63mgRT
         UE+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWdRiI3gntVKHtuImqxf8ZfLBqvW2/+hxhSqt5hgPjTnN0VPb7TfOEzCikTnXL952FbLAORyJUjtOo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwjJw13sjb9NynmvNKAEkKSWIswW9fodzVJyB/k5poHVjWwiaZu
	IIfHrDagqzzzxDuYxlzM6Skgh95/SSWeNcyDpfIMewKJyUA8lUpvvdkM+yQ03WSPzg==
X-Gm-Gg: ATEYQzzisECuOHf4KmoB4hk1kM2EYfWPQbRhOAs3fujmNmABBN00NhWFjYDRrXNUaz5
	fRgoEv6q5IrddNiPuLZzblspgg84lYR1ShK2rvh7EuU/Lc5C+T6Fxxr0UBYr2SZUdpInGgLD0cI
	Ibw+gxrfBZrmZ55NRTRdXevDGJcOkfspGTQBETsitmDDpTKGILrd1mzfAjUg5jLYY6Ojr1+luzf
	P903Z+cbsJBs9OIJz5dHShi1WXz66RgPTHz56JhF3to8TSMGX6s2LWG/nZPNpEu7RhIngHgrFxx
	MhbCepw1S4jXIm5mjPszNLbbzaRqNqEEjLznSsfKSrRfld3A6B/8ofEG5toELjs7AVBDh6XFcmd
	sHw8qduBpY/fhfEwa0gfhEACFSwW3FnRRhS0mCqHjZD605d+EvgvsCqruHsFzFGxqHlCoYEvCYl
	qviytomAF8fGJ4r5j0B3Vyy+PcqTHsjQEhRNzxikDEDWKm1ercfhfEjlGfPVophVAQCK1+A7ymU
	kVz7StztMVe6xs=
X-Received: by 2002:a05:600c:a51:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48519889928mr39855335e9.25.1772640471280;
        Wed, 04 Mar 2026 08:07:51 -0800 (PST)
Message-ID: <b1e6f37e-9d77-4aef-b088-73bba27382b9@suse.com>
Date: Wed, 4 Mar 2026 17:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/10] xen: Add NUMA-aware memory claims for domains
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, xen-devel@lists.xenproject.org
References: <cover.1772098423.git.bernhard.kaindl@citrix.com>
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
In-Reply-To: <cover.1772098423.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C8587203C37
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 26.02.2026 15:29, Bernhard Kaindl wrote:
> Credits:
> 
> - Alejandro Vallejo developed the initial version
> - Roger Pau Monné updated the implementation and upstreamed key improvements
> - Marcus Granado contributed analysis and suggestions during development

Despite any of this, ...

> - Bernhard Kaindl developed the new domctl API, extended tests and documentation
>   and developed the refactored handler for consuming claims on allocation.
> 
> Comments and feedback welcome.
> 
> Bernhard Kaindl (10):
>   xen/page_alloc: Extract code for consuming claims into inline function
>   xen/page_alloc: Optimize getting per-NUMA-node free page counts
>   xen/page_alloc: Implement NUMA-node-specific claims
>   xen/page_alloc: Consolidate per-node counters into avail[] array
>   xen/domain: Add DOMCTL handler for claiming memory with NUMA awareness
>   xsm/flask: Add XEN_DOMCTL_claim_memory to flask
>   tools/lib/ctrl/xc: Add xc_domain_claim_memory() to libxenctrl
>   tools/ocaml/libs/xc: add OCaml domain_claim_memory binding
>   tools/tests: Update the claims test to test claim_memory hypercall
>   docs/guest-guide: document the memory claim hypercalls

... only a single patch has an S-o-b other than yours. Is this a correct
representation of authorship?

Jan

