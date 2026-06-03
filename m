Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aPX+HX7FH2rkpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:11:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76BA6348DC
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:11:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="bpRsgw/s";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325708.1591025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeoV-0002DV-76; Wed, 03 Jun 2026 06:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325708.1591025; Wed, 03 Jun 2026 06:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeoV-0002BY-4H; Wed, 03 Jun 2026 06:10:51 +0000
Received: by outflank-mailman (input) for mailman id 1325708;
 Wed, 03 Jun 2026 06:10:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUeoU-0002BS-6c
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:10:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeoT-005I7M-JU
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:10:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc569-e002-0a2a0a5209dd-0a2a45078588-2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:10:49 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc569-229c-0a2a45070019-d155dd2cd0d6-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:10:49 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so3774008f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:10:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f2dcb13sm4580839f8f.2.2026.06.02.23.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 23:10:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1780467049; x=1781071849; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=At7gW2K5BuNU33erqyfWrYHt/rykUeGgNjDeG/nowcY=;
        b=bpRsgw/s3yD8hfqnSO2kqK5j/BYZARcX5IyDCKs2t96sd4cGy15q5TAz6EOQTK0XU9
         I2070XoHB3qxOfS4r69A4D1BUQm3JR13Eb5okRfT5XraI8xo9ShqrVHUI8+I4ecZ3D2e
         7Xe3uJFUpbtciQn87jwmVxU6iwPWWsjs6LAobeIADxi+GaO9TgNwgTysctQCDTjm0sVg
         ENTI4fo/ng0SoNn5vx0c+pEvcBSnJI9aG1MHijOKUq4q41GjnH3Mk9FHT2zn3wfHREz0
         HMdicI9zo1YA6HYsL4cBBDULIWHRLe6WI6phCWNSVUE1Suw2W4JRIZ1rcDZ5xf72e3OU
         8cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780467049; x=1781071849;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=At7gW2K5BuNU33erqyfWrYHt/rykUeGgNjDeG/nowcY=;
        b=Ig0ghHGobG/0USpOpyIsHuNnlUXGI6SGmhp9ewCxxaZ96t5w+KbrMMwy9dyT6ytERb
         EBTId2E3Mv9OaQxL308Louro+FNlfP1EmdA3t4cPh61qb1jRcSo68b2zx2q4T2tSvfSf
         N5QlBQuvJ1deB9IRggSvxk44+PLyAS2Gjor0lypSze72WghNRZNJahFN0D6ECCHFc1OZ
         rkV+W4tLIt0DVR2MdRSCHmwTMErHBlp1kKzriUYsCVLQETKaAk6KMg7jAcfr5r49Zq8/
         apyl1ErbGrr1SL4n/cVEfsfdbdpqyDQoJ0bR2WdBDIck/QMX/rakAGS5g8RwfZvYlb2C
         E1Cw==
X-Forwarded-Encrypted: i=1; AFNElJ/wdLJp8fnBHypmsBIrQAZVJNoLSO8dQcQWvnN/D/fIpoT/YdqbQYQ+HUhtLWB2T7KD+rb3YtT04Cs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuzuyWm06jByy+rAHsHb0f/wNDx5Qzw3ps4I0YQ7UVomGKb1AD
	vm2nSpXdChfvCZ78BsZpnv+nhlvF9s8/7p3Sfo9jVh572R8m0IX/QgLstcJ4jys8ZA==
X-Gm-Gg: Acq92OG+q6LK/EPTQowLossDWDlTRpvlOTqTowaW+DdQuC/ZH5iDb55zPjmWx1QbWNr
	8Rhho6ve63PFAFtPzf1DOli6OxY48UqOToMFQYON4aZDQqWMVbgvFzs9QHMaGbvJWjwRWa0l7oW
	TnEPrz6Uk8DX0ZJ7Ud14JDxBYhEq50cxxuwjsVGtWrBfJGjVF7DaN2JG1/L+WFCGBBmoZwaYUM/
	XCWXShjvz90VtXrJ32zoPXi4tS9WuufH4IwRwqHhkUmVB/qz7dAo9PTzm7XVTeOwM/HTjhMIaw5
	RyDRo5RNiyh9aprzMhHpidZIE7lhMPm4Uzhv35L2/sSXC2241XMoK39M/9YZ3QHaqvwsG79CoK4
	Ot7MhZc17wi70DoHktV4S+jVApq2r0N13CQQb4ERkOcF+UPBPvaw1MN5/vM4KNo6HyAnEY4PZsj
	7ksoo9lbHimK+tBy5O8RizZ7BDYa5qc/70Lae+XMz8e95jiSd2zgEN0J+quWTUhTSOshkoo85bP
	ZeuyCNO3tYznEuvTOm/HKej7Q==
X-Received: by 2002:a05:600c:6211:b0:490:6e12:5418 with SMTP id 5b1f17b1804b1-490b5ed36b7mr31309075e9.23.1780467048962;
        Tue, 02 Jun 2026 23:10:48 -0700 (PDT)
Message-ID: <1511b245-fb6a-412c-bd9a-32ea341e983a@suse.com>
Date: Wed, 3 Jun 2026 08:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] argo: introduce CONFIG_ARGO_DEBUG
To: dmukhin@ford.com
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org
References: <20260603060539.1181809-1-dmukhin@ford.com>
 <20260603060539.1181809-6-dmukhin@ford.com>
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
In-Reply-To: <20260603060539.1181809-6-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1780467049-2176AC48-FD8D356A/0/0
X-purgate-type: clean
X-purgate-size: 584
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,ford.com:email,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D76BA6348DC

On 03.06.2026 08:05, dmukhin@ford.com wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -491,6 +491,11 @@ config ARGO
>  
>  	  If unsure, say N.
>  
> +config ARGO_DEBUG
> +	bool "Argo: enable debug traces (UNSUPPORTED)" if ARGO

I'm sorry, I should have spotted this in v3 already: This wants to be
"depends on ARGO". The way you have it you only suppress the prompt,
but not the option. Which has certain unwanted (here) effects. Can
surely be sorted while committing (once 4.23 is open and once proper
ARGO acks have arrived for the series).

Jan

