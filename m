Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +7LwHGvlH2r1rwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:27:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0D1635B1B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 10:27:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=QPOi3FkY;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325870.1591212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgwR-0006Fo-Ft; Wed, 03 Jun 2026 08:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325870.1591212; Wed, 03 Jun 2026 08:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgwR-0006DJ-C6; Wed, 03 Jun 2026 08:27:11 +0000
Received: by outflank-mailman (input) for mailman id 1325870;
 Wed, 03 Jun 2026 08:27:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUgwP-0006DD-Uq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:27:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgwP-00F0Z1-Aq
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 10:27:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe55d-5cb7-0a2a0a5109dd-0a2a450cb512-0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:27:09 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fe55d-62f1-0a2a450c0019-d155802dc162-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 10:27:09 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so13672965e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 01:27:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f344762sm6224785f8f.23.2026.06.03.01.27.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 01:27:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1780475229; x=1781080029; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/3r7Zav/qGPrntpg1Bb8n2ktOqsNlPllv678HpmkbSo=;
        b=QPOi3FkYG/XB4S2ReCZz0FQIHcM66uCfwxPZ3lEeHoFxrZMN0M31oIKnUOI4PMFGJb
         lo1ZPg9IWZJMpzJii/XVw9dDUtOOYSlKZlp5x8x7Thv6xTM+VDm3KPDk33Ki93Owx5J1
         S995XiIYrUycZpL57gQip5+xL/UoyQMZabxn24Ghks09dn8gPLDPHGT6ZHxG6vBBhxCQ
         AkLIJoPa/qLliH4y6vKLdGu8I1p5TRtj0mQa9y7f5qvJaN9rvybjS/rlHq0jBDYH66+c
         LI+l/6ztOKClAlGGeeqtnRvUyx112po9FDIYLP7P2CSIaa9UqLd4iTzJFDfxp/Nf4lss
         ju6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780475229; x=1781080029;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3r7Zav/qGPrntpg1Bb8n2ktOqsNlPllv678HpmkbSo=;
        b=MttOzBykaPPSQGor87y3a0m3XNzj2diye99M5gxG9UG7Ys4Y62cypYPFtyppV6NotA
         CIDAyOezszn02wD2wBsod8Ck1b8vS3j0p0d1VbBOUq7zhF+o2TY1ofr5BQFtPlrVgp4Y
         Zm0l8MtN6cr/m3pBPWQPdiRCVYe4u5C/z0QYYj5EYZDBGo2YSSdln1FcDvxvynX5IDE4
         XeupV0p2VamaBx7OeAlnB1LcdtM1TMBajdeFZQkyK6BmPOxFoUE+RD6BFknVlWmFZhw0
         5+X3zT2eT31q6ubG52b8X6iAkT4jLLFwIN9AL2eWJYWeI7SBuSS2jTz32CPoLEqzW5HY
         5Xeg==
X-Forwarded-Encrypted: i=1; AFNElJ+nXV/ixqToHAxgYPjZdp4lo+zIw25XIeSFzYX5Oc2zHp3Sfk5V4nS3vGqKOfPIclnztOQfRhn+KTA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF713hnF0abcwLRbIfMug9H5ZYIhqsxpx1qq+AkCxt2uRs2q16
	CCtvpvyvkLzMlIAKF8D8JGIAmmyP+9qbueG91ALCaillsDkIo+ojMisCShKjEwzCOg==
X-Gm-Gg: Acq92OHhXmsomDRax9dxZfnXmCuOGQwpS2zxkNVfU4WJfmWSKLbmvD84WNcjTMV24aE
	th5BI8738O6SL8fNtoFtCgzCR3Q7VmyRprS5lZCvEZv7nnro9+3h5UXh0DQu6R3BXW+dJshDh88
	hherayN4Gl/3hb/95nx7NJQgwEcGMasXkn0y24Hc1I1xpZGZ7EaLPFAcf9pMx+ulrFLgaP/7yTy
	IUkgwbf8j/n9WcANCjt41fKo9TOBzyT99t5ASsDSK199JtYr4Uc1rrdGxbxdSwzuTrlTNwsX9fa
	9zO1F/ZOST/735JHsRmOGPOFz2DyFVWUitAjIFNIqjZTR84Ll2Pp2Q9957b9D63TvBp+92+r8UW
	pTZu4lPWOBnq6esAInAelz3E+/fOVdHIYjVj7sgbOsRN43dQQzrI1tnW+Sbo3jCuCs51HhJGQFq
	If/5QtKsxO3DjlnMpEBV9SxWywvYoawSAOl45GxCZo6bW029AoOj5Db/Q0UaLeNvtIpHZCtz+AX
	uXw0J7rQusoc/ubovSSjnup3g==
X-Received: by 2002:a05:600c:5288:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490b5ecb911mr37941125e9.11.1780475228712;
        Wed, 03 Jun 2026 01:27:08 -0700 (PDT)
Message-ID: <87ce9028-2654-40bc-9026-84e17440dc6d@suse.com>
Date: Wed, 3 Jun 2026 10:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 3/5] xen/numa: prepare NUMA setup code for unit
 testing
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-4-roger.pau@citrix.com>
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
In-Reply-To: <20260601154332.30797-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1780475229-F5585CF5-6CDC521D/0/0
X-purgate-type: clean
X-purgate-size: 340
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: CA0D1635B1B

On 01.06.2026 17:43, Roger Pau Monne wrote:
> Introduce __XEN__ guards to differentiate between hypervisor vs unit test
> builds.  Also move numa_set_node() so it's outside the __XEN__ guards.  No
> functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


