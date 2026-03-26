Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCcmI/juxGnv5AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:31:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1218331618
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263482.1555405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g7z-0007ZV-0J; Thu, 26 Mar 2026 08:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263482.1555405; Thu, 26 Mar 2026 08:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5g7y-0007WS-TO; Thu, 26 Mar 2026 08:31:42 +0000
Received: by outflank-mailman (input) for mailman id 1263482;
 Thu, 26 Mar 2026 08:31:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5g7x-0007WM-KP
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:31:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5g7x-001qW9-0Q
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:31:41 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4eee9-e002-0a2a0a5209dd-0a2a4508af60-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:31:40 +0100
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4eeec-1950-0a2a45080019-d155dd29a890-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:31:40 +0100
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43b949bf4easo297448f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 01:31:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9506dsm14138515e9.7.2026.03.26.01.31.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 01:31:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1774513900; x=1775118700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=av+gvpjR/nCmoEj2BaymoTmNoYKonXosNcZGwmll6WQ=;
        b=EK6N2bK3oFBoQjHrQLxvtcBj+OTK6xNVt2nhYpYnlFbjoXiMbiy0oOXD+whUa/DBdh
         NhUA3VN51mwe2qageIyN+1BeZKQM0hj750OMpfeKQ2unVtLKrSlNygcvn3DPblwLU5Se
         DaarhLfOJ5Gf0uNBCpdaYNITh6IZ+Ka+j8plLk8pYuDOvPcM/cMzFTfaWAFGY2Y8iB0I
         st6ZmsZnROLahoXfHgjpuU52gI/h+gi+NPziOXVKmANLbgh4JOqw0HC5UQ9eyXEsIO2X
         rApPB9RSNPxJP3AWdpSQQR+dv5SLOPJyBa9yXbCECh1roYedvus3NOpV5SLkLv5KhIjQ
         n+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513900; x=1775118700;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=av+gvpjR/nCmoEj2BaymoTmNoYKonXosNcZGwmll6WQ=;
        b=iUUymfSVtLMQvu3p+162qxO1BPKoX0Oz9/SekNoVm6O9kZU7PfA15Jd+Y1EZE5/0BY
         gDshmeA/KP1FKNt9RYqQv7RicRHLa732itup2LxP3v68zYDM5P2OBfolVOFdjAHjGWj+
         ry4t2nkMm5/vc/DJxA+F8p6ymG27KQQ1FY9SBQNu4VLrzJHEZEMAF/tv7viyEFiUzmxH
         dWK1CATIBMUu1rmrJ2DIqZHtirA1TRYlpP8J8ZJVdtBptxH4VK8FVAxj5r2x8yXNaXvu
         QQ1BUUytoqj0O6Y7beKsu6HN7ZtTimH9SMoPKPKEnJsEmTHColVDdFcsZcwr198bClcI
         kbPw==
X-Forwarded-Encrypted: i=1; AJvYcCXuMGtSbhBdqPD4nLs6GR4Hp6dJhRapSsPs66hPffL7giU6rGFoU4RFySFPE7UGMV+79dsd9QnuzvQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrjzPkqwOU50Bonv+fM74U6UOgjtMUKvhPIOPB18xrj26fZuwu
	9wjwUFpHeGDg03M4+JiMhWw7TIQisCraYRopSUcNNnDQ4gvcWw8fpTfwSOEVPFLSQYPex4jH0Gd
	BeDpanA==
X-Gm-Gg: ATEYQzzZ7fErA3QXXktON8iUVY0WvzNShW4/oybUKqCemhiegAjdjDzdn9CrPgL0X75
	GmXuCQ9yhf/eMoB0Twq+CxVhZRM9Od45cWxrc3dulAMLKnLrtiJjVOiX4w7+JSRMOVax9aIF3/i
	RtNaBkkW+guR6eMcqefWhJaa8OJlIbEZlQWyeIkZ9naq0SWYfhWtniYO9r9rjg5KmThe20Kt1rp
	J5PyCpZlHbDY4JrmV36Ju8+3h+4Z4cAtrOM5hejJeZIWUyibq5N2DJkUlsdC4UlOHaTxXldsHM9
	iefIz9ALahPErGtYgZkJGIS++PeKVDIp8FH734QrApy1izi4i9tI9Ddq/7A9M3PDOyI8NXskN1T
	6UAFYgs6IWGngUX5qgyr2+rVuo2uWJnZxml9wqoHePHBfIGbvSRSDMqptE5FQ1I+4C52LbxM13c
	ZHODOon3dQYsKad10xqB4hZ1XNHR4DK+53GE44V8Y/WKYFnb25arY7CEHbw2LzidAuDUh4CD8a+
	jnXlZVg3abqC6g=
X-Received: by 2002:a05:600c:4e4f:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48722ad3f0fmr11003765e9.0.1774513900278;
        Thu, 26 Mar 2026 01:31:40 -0700 (PDT)
Message-ID: <8091ec6d-1ac0-49b2-9159-bb06d813731c@suse.com>
Date: Thu, 26 Mar 2026 09:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/fred: Fix FRED name in comments
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260325170208.1115832-1-andrew.cooper3@citrix.com>
 <20260325170208.1115832-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260325170208.1115832-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774513900-F26E7726-7835E3B2/0/0
X-purgate-type: clean
X-purgate-size: 230
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: F1218331618
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 25.03.2026 18:02, Andrew Cooper wrote:
> The patch introducing these constants predate the feature being renamed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


