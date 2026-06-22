Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +JOyMLIeOWqInAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:38:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A1E6AF274
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 13:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=GeF6n6Ke;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1343665.1602910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcye-0008IC-QG; Mon, 22 Jun 2026 11:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343665.1602910; Mon, 22 Jun 2026 11:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbcye-0008Ft-NK; Mon, 22 Jun 2026 11:38:08 +0000
Received: by outflank-mailman (input) for mailman id 1343665;
 Mon, 22 Jun 2026 11:38:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbcyd-0008Fn-KZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 11:38:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbcyc-00AlOr-Qh
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 13:38:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a391e8c-5cb7-0a2a0a5109dd-0a2a4501b35e-30
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:38:06 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a391e9e-e031-0a2a45010019-d1558029c552-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 13:38:06 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso25847385e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 04:38:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd30078sm288146645e9.7.2026.06.22.04.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2026 04:38:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1782128286; x=1782733086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yIafG5Z20Vh+E/oJYF660pEjNiFntX2HGWppGanY4o=;
        b=GeF6n6KeZCvatTX5Pfqs7UQ10At1Ch2GK5XbUnCUwuowY+2MKMYaNBM9ayGbdg8sKR
         vnf0fvj2YoqtLjkdxUoR+Na4x590B9zKJwYEOKXKl6/1aZ9BYkiOokJESV9EjScl2g6A
         YMaPSFhSFNxaBoLO44cWlqhQC+c6LfQl32kD4eaUV1q4O+v2j8WSDTI2SM9mkGEvdsnA
         ColwHojrYA34PjxPfbFdX/E2GYsQ1XilvJsGQk6qfEbhpRYQN01bf0/dQD/SUxBeybUI
         0KBsiZdLB9JC42mVrA2Y3VrYVFrQjfNEemJjIv9nTySU60hWClIrWAu7CqZ8OeL15XWU
         IeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128286; x=1782733086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yIafG5Z20Vh+E/oJYF660pEjNiFntX2HGWppGanY4o=;
        b=F/y6Bd20dA3LxGvVY6Yn7Ikwpb+cKau/xI07QTVouZCBbbcm+QITsdA53IcV1w5V0h
         m7vHs9/uHaTngbnga0lAhtyFI84pIJojwIxzOcOQzLtSkjfddMPLspNuFcUvHfkGSoTt
         BEB6+ejatnjHKs4w02esvNZ7DHFN2DtB1jA71+Qj5o0czE/WU3EOX6iN0cNXaU2qcwFI
         PsDY2zzEt8ZYYtOwgfYYfFxmxLzOIJ49vzP2JbOhV3L2M2fC1bd5oPxTED48u0TYd7wI
         LWJjOFxOUBhfWMHbjCWFVt1gQVVdRy/fMRbwef6oVF1EgDeM4Gss+u7OlzriEPRbq8ed
         s51g==
X-Forwarded-Encrypted: i=1; AFNElJ/PcZo0mbufwy6bVrEIbD+ftRqu39S/t/CL31PbD6Cj/RhpgzW+YlcEzqSIaqhVIY+6nZjJT/P7oy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywgfv7hnW8G0Oc+JV3VGTlauzBa3YSmNs6Yt/hrm42+8HXS/sqi
	6HXtEax8KIiA22n9H9rRoWu8/Fx2XBy1idqSHI7UpVCP7FMpzUKt4YOy7SsXOZ7oHQ==
X-Gm-Gg: AfdE7cmHCoBrPSw5iRFJYMbnRBIWWui5uKo0/RHuk7fHtUpZA+L7GcGKGmEHgK1wMK0
	ApF0G6ylMXZ2hXzqHlOlIUbKmvzI1mnl5etBlvsMJbjkLtqeWjXkNHImgmdkZt8qvNA6vl59+ol
	xQFjcZqJZzE8q/srOKJnufY0wH5uDzXW/zHkbbKQk6DfV+ScxyVnr7Wg+65Yx7po9RxnCIRXhUN
	Y673xV3Hk1K/irsF8GwlqRd0DQJ7NPjLDlsqn+ezxnmyXBpM/LxTfFa5TbXeD3Y6pMWbh57otBW
	WS3aBpHV4/7zrsCmMqJXCzD0Pl0vofhXSlQQuSanhgrh1jGKoCheWX5aIFwL+2CVXA7bz3xeYDq
	y9vE5PYTe6sgOx7Rxa+I0pgJ+i44F9N45lr4pUS4UnFvzPRZw3TNmkC63suHViT23uWC8GPugEW
	yoKyTTxrc9aoYd0bl7YGxS4+V1WFx/Z+OQwhXvOsHb4T1VwiGR/ovoU+2rJj4qocZ+M0ZlD7ip6
	bW0
X-Received: by 2002:a05:600c:4e48:b0:492:4a7a:e41c with SMTP id 5b1f17b1804b1-4924a7ae517mr127263295e9.6.1782128286218;
        Mon, 22 Jun 2026 04:38:06 -0700 (PDT)
Message-ID: <2d2164f0-9edc-41d5-9d88-b0a5e3fdbc06@suse.com>
Date: Mon, 22 Jun 2026 13:38:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/15] pci: Drop parse_pci{_seg}()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@vates.tech>
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
In-Reply-To: <1781794560.8631fc262581453bbf619ec5b2062170.19edb3b5812000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1782128286-70FF4E30-C8D738C9/0/0
X-purgate-type: clean
X-purgate-size: 1083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28A1E6AF274

On 18.06.2026 16:50, Teddy Astie wrote:
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -273,12 +273,6 @@ unsigned int pci_find_ext_capability(const struct pci_dev *pdev,
>  unsigned int pci_find_next_ext_capability(const struct pci_dev *pdev,
>                                            unsigned int start,
>                                            unsigned int cap);
> -const char *parse_pci(const char *s, unsigned int *seg_p, unsigned int *bus_p,
> -                      unsigned int *dev_p, unsigned int *func_p);
> -const char *parse_pci_seg(const char *s, unsigned int *seg_p,
> -                          unsigned int *bus_p, unsigned int *dev_p,
> -                          unsigned int *func_p, bool *def_seg);
> -
>  const char *parse_pci_sbdf(const char *s, pci_sbdf_t *sbdf);
>  const char *parse_pci_sbdf_seg(const char *s, pci_sbdf_t *sbdf, bool *def_seg);

Could I talk you into adding yet another cleanup patch on top, to drop the
_sbdf again from these new functions? They really only serve an intermediate
purpose.

Jan

