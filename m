Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oPmVNDVpzmmpngYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:03:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA773895D6
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 15:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271884.1559881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hi0-0001kh-94; Thu, 02 Apr 2026 13:03:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271884.1559881; Thu, 02 Apr 2026 13:03:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8Hi0-0001jG-6B; Thu, 02 Apr 2026 13:03:40 +0000
Received: by outflank-mailman (input) for mailman id 1271884;
 Thu, 02 Apr 2026 13:03:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8Hhy-0001j6-L3
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 13:03:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8Hhy-008CQ1-1C
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 15:03:38 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6923-5cb7-0a2a0a5109dd-0a2a4504edbe-18
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:03:37 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce6929-bb33-0a2a45040019-d155802cc582-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 15:03:37 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-486fd3a577eso7607815e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 06:03:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887c8d07cesm61446195e9.28.2026.04.02.06.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Apr 2026 06:03:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1775135017; x=1775739817; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QDQtcHnd3MirlEmo5DRIiY01a7CnSZ+4+yBBAAKQROM=;
        b=coLSVhWrmomnUmcsGIsy9vHIg6YFTut4+jHMKLTyZGcV5PBAy9f/Dl42tvV3AcsZMl
         qPr9CDZdeuUA5yPW9+TbCCu5D0S8pAsglGocrA3373FnsorKmQ+5/FylLlaipovBP8Gg
         AGO2PSEnM4mrFYd8py9N9VucAaxFEHhimHHIXY7WaZeEb/boWk6vBUbLLat+FlP4VtFT
         9xhOMYsXug2hfVFzEsvjPh/q3e19uslb4W464L7TWDArdtjN2yKCK9zZCfRm5nqltt8I
         uIleDs4nstqKyX2RZEIzofGY750RrVO4bDybl9EXGJqERcnzjwTH/CfQ516hhqNdLezs
         L5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775135017; x=1775739817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDQtcHnd3MirlEmo5DRIiY01a7CnSZ+4+yBBAAKQROM=;
        b=WHsd0ywuq2EVA0IP7z/VZxu34gXuYI8QE61cuZt609Y+NC1c1ZcMIjz+KTOrwIzRml
         M7vSuMIfZyORoriIuHJcA9k+e73FEmRVPYReY6f6+58jO/UGy+M5h/dDQ0iH+wjSnKqU
         Ls2JAnABo1YtYwVl6RBfPcCxtc/1usELYntC3hcM49YCssRXrdaAkgNJPOjT/dbZVCJk
         qiTlvf0Vkvy0/qvDa0sUJZR7P2boNIaiVUxsP0dpIeCkINTFvbgDC52mZDc8YTItP4gi
         /rN4s/fvSjPx8R1g+v/KPpVtvBVqni6j82J4s72BXZ6wgt3x7kqaqVTOqmQMDUIMURbs
         R/KA==
X-Gm-Message-State: AOJu0YwnAaM6MNi/BR9k9907iubgUg2VMxCfKSchTghGx28Ma4wFUmZk
	LvunT4R7k4NtproXv4jrwmeqxY1oY63Hl7j5wclXYAxaT8fu4YKZKyy+cCLC3U6TUg==
X-Gm-Gg: ATEYQzz4wBYn7zB9lAKjGce2rLCnqgnvYUN8J6br0a8NEw72OlKctHK7ceCwsFV6Sqy
	pW0gjTX6YhmFSRiDVi4oKN7Bm9ZTNe7TbLstTQEo+ZQCWqaUAfIiZHhyVw+w+HBCHn01pVVpxDY
	a4J1O8q2cW+dZcJCDum8Z3ci4KW0mBY8i+wZaQrN76ARb6O3w/xWovFW04QW1roxNkgSMAADHUn
	TutdFVkkNATdXFcYIyRWKz1ksRsYmBg7hJfTIwxgiU08DNZDir0twryNBdJNwEi4tGcGrJyZAP8
	E1NOnqCq7qJwC/EWjVfw3wQp+OZt7yEWHhK4MuUh5UrrWqSTjAFCusm3ife3s9WQ3Ioa7q9gQlF
	r5WZEFctGedaD377yODef3W+vzLj5/mD6aU9+FUeU5jSNVfAx05fEc6N1xnUf1moA+Td9NG7Duj
	qD4McNlZeYPsiPCZUBtyib0PZtuoU8MZzvJYj3cHq7eANEsPaoR1ReeD5LJmaAmWIyWm5DZ//Se
	/rwQ39ecHezpnGlaVvdsgzwyg==
X-Received: by 2002:a05:600c:4f91:b0:485:3b5b:eb8 with SMTP id 5b1f17b1804b1-488835cd541mr118149665e9.26.1775135017337;
        Thu, 02 Apr 2026 06:03:37 -0700 (PDT)
Message-ID: <5eb109ff-c786-4b05-a438-78a5b93193a5@suse.com>
Date: Thu, 2 Apr 2026 15:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?B?SsO8cmdlbiBHcm8=?=
 =?UTF-8?B?w58=?= <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <aPzBO_eW8mQHM66u@mail-itl> <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com> <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com> <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com> <acZ8ez4dmQay1JSw@mail-itl>
 <ac5l-HgbDRcVkiWb@mail-itl>
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
In-Reply-To: <ac5l-HgbDRcVkiWb@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1775135017-3373251B-757BA64C/0/0
X-purgate-type: clean
X-purgate-size: 502
X-Spamd-Result: default: False [-0.19 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3FA773895D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 15:02, Marek Marczykowski-Górecki wrote:
> On Fri, Mar 27, 2026 at 01:47:55PM +0100, Marek Marczykowski-Górecki wrote:
>> Some further observation, this time regarding timers:
> 
> In the meantime Roger suggested it might be about C-states. So, I just
> tried booting with max_cstate=0. I got this:
> 
>     [2026-04-02 11:41:57] (XEN) [    4.327519] mwait-idle: disabled
> 
> But then xenpm reports C1 is still used:

Of course, that represents use of the HLT insn.

Jan

