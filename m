Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA5VLVx9w2mwrAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:14:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17328320184
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 07:14:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261699.1554514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HVq-0002xn-P7; Wed, 25 Mar 2026 06:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261699.1554514; Wed, 25 Mar 2026 06:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5HVq-0002va-L8; Wed, 25 Mar 2026 06:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1261699;
 Wed, 25 Mar 2026 06:14:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5HVp-0002vU-Ar
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 06:14:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5HVo-00BF7G-Mx
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 07:14:40 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c37d24-2eae-0a2a0a5409dd-0a2a4504a80e-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:14:40 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c37d50-c823-0a2a45040019-d155802ee01d-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 07:14:40 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486b96760easo17999055e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 23:14:40 -0700 (PDT)
Received: from ?IPV6:2003:ca:b744:7ebf:2977:bdbf:7f63:e225?
 (p200300cab7447ebf2977bdbf7f63e225.dip0.t-ipconnect.de.
 [2003:ca:b744:7ebf:2977:bdbf:7f63:e225])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871174f39dsm91805965e9.11.2026.03.24.23.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 23:14:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1774419280; x=1775024080; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/HlyRX+r/IDkbsHeStt90nsR1iHgeC2rDxiFV9PRqYg=;
        b=gJFEJg/gimyvDB4TPV+vmb4rpHo+UNlDJWjcgl9PyeUlFCQysfypNS8krN152l+zJ8
         K91YFRtlCrzZCE7M4mGqtLXyrUbym/kinh2KkeLDFH2iVXv2nq+bO0yeNTHsu+sWJc7T
         MT5j5MqVGlia1bkz3U1LDYkQX36Y9eFc5IMTy0MlEgdiOuQkza2779ldcS0hCHuj5oBV
         QE98+a7bBB1gW+CWESydcYcF/ox2JrFJ256+ej1ELPLEGTg+epNqM6g3M5hosEk2Vjj/
         PUzjvuHc4nnDICtFywkR42bXuhjny1VIGLCNpQ8qClp2KkA5YSfrmel3RXfCQJG5AtjS
         hK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774419280; x=1775024080;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HlyRX+r/IDkbsHeStt90nsR1iHgeC2rDxiFV9PRqYg=;
        b=rdENaeuWpiaPXvbBSjODvKyyVw09nJLlqIUY5joqJEAvymXcLGSbCPsYMBaKLQru5U
         J2Q8beG7k4GwQxt/Wp1IYggZaj8e0CaKTbc/f0UwEKgqyJC5sSHdp8mTLoukw9O2ewbW
         ktAUJ/7gZ+fH6Gv53itG8yp2HQ7maxwzt4UDi3AZm2Kb45/f2t7+gYdjTDyuYfkl7ma4
         HGFzLaajllzjnWzn2hWaO8/e3xwBcOlUWq1YgH08iROLipvnHfKG+KZCbWV+HrOvfCjY
         1jHSBPjFED/cxq/74hPY7yx8fQlVI7DnZn1jcRBjhZeGEd+qgtkwg7CitpOuBt/e5R5m
         J2Ng==
X-Gm-Message-State: AOJu0YzaI5ss06YkwMXUWOLZB/MuMntfy8z6y9Li/m1VUsHDX1zO4heT
	6MpSH2YIwjzONbwjVStN4U6Pa6WzsyM0OrYTi9XG2k2on3FT+b8VpBJqOv4olvY/wQ==
X-Gm-Gg: ATEYQzz9+KzosI89bclQ4Y4NgNUb2sIBsoCpkBVug26hYCm0Iib8oC+BpoMWoTR9NFU
	9YoqMn4Ctw4CqqaB2tiT/77SNQ3YO48UwjWl/A1nrgrY5M1FW2ecq3E6Ocq06kr5NucsJw+XDNB
	0Mx3DYBp3cniFdHv8b3RGyzzjz7a5MfuV/WV7kPL6wlIc552KZUf0NEexYHHxJ42MgqjDEo1vDa
	mUfa6dfp65ekvOxfoMYjmdPMEk7qGDQK4c+QzloQLtdUqC+oh8rxnHAijvPAqLtjqPktMbJUheN
	fH4oyrhWAaOJYP21wVahNYUiGSapdz/ED0oRaEheYYUdb1sYNQOGBh/z4E+CSwmdhJHBNLC02Mq
	ymXWcUmOEkc66p00OckL53UpvZLKrwxVgBdQwqMPZGF1R1LNrNNeSpmLS5xAb4c8k1nr5pDBQ65
	Yozi5NyJLTexxd06pJLNVD794FJbu1FzDtMH5C7lIw/YhrniAXjFmOW96pw8SjhyGtTtyIRZp00
	ilU9ysusk0gely+LVAec2zYECLYCJ4mlrJk9Y+Hp+cBJp0jAU3zStD+Xk7y
X-Received: by 2002:a05:600c:4705:b0:485:a4de:f4f9 with SMTP id 5b1f17b1804b1-4871608406dmr32918685e9.27.1774419279842;
        Tue, 24 Mar 2026 23:14:39 -0700 (PDT)
Message-ID: <f27fc3a2-77a3-4b14-99fd-a4d4dcb17585@suse.com>
Date: Wed, 25 Mar 2026 07:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] llc-coloring: improve checking while parsing
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
 <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
 <CAGeoDV-zPfn5iDN6gcwq2bA5vcG0SUsgZbQufDWpux1rugXFEg@mail.gmail.com>
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
In-Reply-To: <CAGeoDV-zPfn5iDN6gcwq2bA5vcG0SUsgZbQufDWpux1rugXFEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1774419280-1227B9D1-B8C1DCDA/0/0
X-purgate-type: clean
X-purgate-size: 1349
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,cert.pl:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 17328320184
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 17:51, Mykola Kvach wrote:
> On Tue, Mar 24, 2026 at 6:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
>> check against the compile-time-constant maximum number of colors.
>>
>> Additionally the overflow checks suffered from an off-by-1, as the parsed
>> ranges are inclusive (e.g. end == start being possible, requiring 1 array
>> slot, while availability of 0 slots was checked in that case).
>>
>> Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
>> Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
> 
> For reference, I previously reported the UINT_MAX wraparound aspect here [1]
> and later also here [2].

I've added another Reported-by, yet I wonder (in particular wrt [2]): Why did
you not simply send patches? They likely would long have gone in.

Jan

> The off-by-1 in the inclusive-range accounting looks
> like a separate issue.
> 
> Those threads also mention a few other related corner cases.
> 
> 
> Best regards,
> Mykola
> 
> 
> [1] https://patchew.org/Xen/20241217170637.233097-1-carlo.nonato@minervasys.tech/20241217170637.233097-5-carlo.nonato@minervasys.tech/#db5d6a67-61d9-48d3-b6c4-213c1cbbda21@gmail.com
> [2] https://lists.xen.org/archives/html/xen-devel/2026-01/msg00369.html

