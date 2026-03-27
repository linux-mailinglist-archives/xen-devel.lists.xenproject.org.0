Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIVuLtpWxmmMIwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:07:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8A3422BC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 11:07:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265300.1556296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w645s-0002QV-HH; Fri, 27 Mar 2026 10:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265300.1556296; Fri, 27 Mar 2026 10:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w645s-0002OO-DB; Fri, 27 Mar 2026 10:07:08 +0000
Received: by outflank-mailman (input) for mailman id 1265300;
 Fri, 27 Mar 2026 10:07:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w645r-0002OH-3g
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 10:07:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w645q-003oWk-Fu
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:07:06 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c656c2-5cb7-0a2a0a5109dd-0a2a4505addc-36
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:07:06 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c656ca-5aeb-0a2a45050019-d155dd2cbc8d-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 11:07:06 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-439d8df7620so1351134f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 03:07:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919e708asm12623004f8f.36.2026.03.27.03.07.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 03:07:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1774606026; x=1775210826; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nI6PQH0I1xNlel60JvN/8kkpWj4Kr3ZernyupuEs5gE=;
        b=Ak2bicar0tv0psYhIDKgn6WSpdVRv8oU9XIbpV/CzGVn/3ikPUglgiWmjtdR0Oh3No
         MAsyq75AZ+53Bjbn0hGTKaM05vNmKQcElQlr12iwdEmxpdwUMX9CafysgNMH65frn/4Q
         lnsuYWtAqOwUtc3MJT/NiouzaXnwRDUL+KdOVnjhiHJtPhv+0L8pcIZLcoU9SlqImE/5
         T/5MQJCootldE30FDAOUMBMx6ecyBY4WWtTfXtFEu2zILJ6/El1lVyNMVQ6DhXqt8bij
         qAva+7AF610MM7h0VTTqPdTpGCn21OwO86RcvbLz1MFil+8a5VRt9IEH4wFLcMezRM17
         bM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606026; x=1775210826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nI6PQH0I1xNlel60JvN/8kkpWj4Kr3ZernyupuEs5gE=;
        b=Us1KfmkrWpnB+6BjGOGV9PQ0keGmDZ73jdpantBeR1M8eZTpQwLQ9W06+rU6bxpGW0
         9LRu3lYd5TzHPEIJJsBopc6bTO2xOoVbBwjLlpU2HqfYC3i8XUOJMSbYcYxnn1rtZEpa
         0+TeMsMhZPZfBqXslIum/81YF8fIBUwoRcIGIG4SOxRwWBqfcZU8k8xyElW9eeVknTSy
         eZ5mnMVAY+ab2tkGeAQXc42PDsWWAO1apG5E1pELZrCgjKVKcso9cRqBRNjKhvJq/Deb
         aam0EgZ4F6rBSts9AVvXw6v8SDXgIeChXwek9BhGxBJ2P01vdu6EAMBjSBUHCGJ7Jxa5
         4Tiw==
X-Forwarded-Encrypted: i=1; AJvYcCWjVlnSOg5cC0ZK5nXZyYg+mVpcvtG/XCw0DyQ0VHwY3VwD2SPn2FGRHHIRKBzrOREJfNdYa/T3oXg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxInXvxaNxPn0mDR1/S3k53V+MMrA9zv3LWnYUhtPPeqt+Vg1gk
	XrFxtbFtbo2VyODuuC73/JgYVx7lCW9g22HJgx+pFH0TSu5bzQY9uqRVRc78ujCBdA==
X-Gm-Gg: ATEYQzxwsqIoiKjeLZTMhWMEZ3WX4H9sUCTAWoREeWlUG3uvfa41oPB9fU5H9Ycrqr+
	L7OOGmoZ5VvmZ/toiGR4gR/4msXZPo3gwWKTsa8312nK17cNaQ/Uhrf01m4QofqbmunkNRLT7Jk
	xmfemhulXHifiF7kmTaKLqiGinywhh3kGsAXhzhB68HEokq02hUFzUnNs2qvQbwCH4D9CeUAeCC
	gfynY3qJe1cejm948ye/OsE+rzu7f2vOsdgiEcPR1F3eY53xhBPWCmI/kFDCmr07YC2ClP2Xflc
	MfqTJDv+XwbrVMLolkmQp+wQv/PVsOm2osfsjjCPwptSklyK5SyX6lE2wj4xjNBcl9hTAD1yZxn
	FXuEGX2YkqKp83tRNSZ2hQAYhQjf3b6ehcJS95JsXWh51QceQmcv5arrnh7ARs0SHaoGOV6EkS6
	duNbVdYgWl+0qgOKUsx/9PPjXFxmbp1LO/y+Wm0bzFAtDzGB+mibEZK7do7HkfW5xQCTbKMTj2I
	oX0q6runf7WEkI=
X-Received: by 2002:a05:6000:2406:b0:439:c550:d920 with SMTP id ffacd0b85a97d-43b9ea77410mr2889184f8f.47.1774606025683;
        Fri, 27 Mar 2026 03:07:05 -0700 (PDT)
Message-ID: <0c4143b1-730e-4078-b2a4-e180d0437450@suse.com>
Date: Fri, 27 Mar 2026 11:07:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/fpu: Initialise FTW as well as FCW in
 xstate_alloc_save_area()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260326190429.1156367-1-andrew.cooper3@citrix.com>
 <20260326190429.1156367-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260326190429.1156367-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774606026-9F68D488-016246B2/0/0
X-purgate-type: clean
X-purgate-size: 952
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2DC8A3422BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 20:04, Andrew Cooper wrote:
> xstate_alloc_save_area() configures FCW and MXCSR to #RESET values but misses
> FTW.  Fixing this means that the backing memory always has an architecturally
> correct value.
> 
> Adjust the comment to state that it's the #RESET values which we care about.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

The title using "as well as" reads to me as if both are being fixed, when
really you bring FTW in line with FCW. Preferably with this adjusted to be
unambiguous:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> I don't understand what the rest of the comment is trying to say, so have left
> it alone.  There's still a lot of cleanup to be done to merge i387 and xstate.

I think it tries to say that the values put in memory aren't actually going
to be used by a subsequent XRSTOR, by it putting the respective registers
into init-state without reading memory.

Jan

