Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAHqFBQRzWmMZwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:35:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7FA37A835
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 14:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270211.1558942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7umr-0002j3-3Z; Wed, 01 Apr 2026 12:35:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270211.1558942; Wed, 01 Apr 2026 12:35:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7umr-0002hb-0y; Wed, 01 Apr 2026 12:35:09 +0000
Received: by outflank-mailman (input) for mailman id 1270211;
 Wed, 01 Apr 2026 12:35:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7ump-0002hV-Px
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 12:35:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7ump-002sCg-5k
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 14:35:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cd10f9-e002-0a2a0a5209dd-0a2a450a8aa4-6
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:35:07 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69cd10fa-ee98-0a2a450a0019-d155802ae90b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 14:35:07 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso69026615e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 05:35:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e93c014sm132146815e9.10.2026.04.01.05.35.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 05:35:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775046906; x=1775651706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4NvExuADLXgRx3FYtwj2Q29e0ezRqq7EWmr7qMj9xUI=;
        b=BFDb98GmIBEkn62Bf1G1uBj2LzLXlRbWsUiI9VM3mGG8Stx7mMzE0LcGv2nhiCKTd+
         HircMga866EJG4SGJtEKjKoXPcdzmnmdtsG1JmMYWnnRlLxp+p5r8GNdp4R+hdlPmXX7
         TMcMH8HRmzRcjVyKlZRUmST4rPd44AQsT/WgNIpYe8IRyjidHlG3Q89XCijtG8mXBqwJ
         IhRqxiOWKG8BT1ogLw+WJBdshOCrSc467CeKjjv/Ce/8iLdaRDUpnm/Tih3HpXKc/6wH
         QWheccRj9gO2U6ZAnlZut1gBZeEvTYiuxBSNKK+BgesSwwMgHeezDziaZZlpoBkcQSW6
         59wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775046906; x=1775651706;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NvExuADLXgRx3FYtwj2Q29e0ezRqq7EWmr7qMj9xUI=;
        b=Gcz7WGPP98f4C662FgqFzrMahxG0IZceSdmmKh9mBRBMMgQqqqxurwfbYKOYpi+ccC
         p2v8RP5B46EQ7ErpYzMbCjRKxLt1pdzx9n4YHoxd2F4ErGpn1AoU0+kMynL45/Z5dgsa
         WOWLY1butEChEnHv2V89bpZWB1thZEtxtZ/uvcyH1oBk2kz2RGsTZjFduCN7x0ux/V5X
         kzEcs8kcPzQnzNOGq+PjOh5ICXkQ+AUQe8KzzOD6Lw4cbZYSlACUQAbouhPaaeNP3ueT
         HBqGX6WfJHrftJxzR7xVQ+RgXNaKptkYu92sDHheVt9uh5y65+G53Rq3co70WjHI11DI
         Cmpg==
X-Forwarded-Encrypted: i=1; AJvYcCWk7Cglr2g/Q6ZmsuX/IL6rmk8KxBg1o55fVws4OJFfhloEfnrYArniwj8ybonm6hm2rcMRdznpA9k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEOCvCXqQY2qQT29326hG9VO9AUwIf/W2MkEpmZjSPfpfAF2s4
	Td8SbEjsd1EXO8Vxgslm7Mi5uo7J0o81Vr9K7SLdmDSDf+Me7D6RTCcE/h4FinS6Hg==
X-Gm-Gg: ATEYQzy+yKaIe10IkU/7Us9fvG9VK5yUt5vu+EWmCf53n4japXwEuG5YopuaFi2F0xy
	htgrjXtKoOuLVwqf7ErDBJVXdVZg7odOSpxV65bieaPy+asvvyi8CvFGvOaTnuFCGuLcmEgbdNQ
	O8uX8UiNOztqnSeTZH8LIWv7SRAsKh9OzecbZCd1yLTpIcWL1rhkASXmicWZ/YwGthvsYiyRt1R
	QUA2xCpY4cL6jtcF81bSc9fqY41WBLzItYEuND0M0yn/VtP8KbWZ5xyFoh3Hyc/rdKmrfXbIM38
	jFd+1AbyaRMSglyPa5lg7Hl2TzTh0HFgYm4P17z99Il0nF6XisgcjJF2lwwQSbWvl6GuNE37qFM
	aLaqyhsOiO9qHhvoB/ClsbmpBbyM47neoovITvD/S9eBc1IJ3jCb7vM95VvCNQA+N6FQ4OZiTyq
	Wbw6SARukvkmwKHto1DG4RsbSqbh4lmwOi04r5kWaQ+dMEQXHp/hfBDsnDuN29qZwjP8h96YMRk
	NJ+fGhys7Qtudc=
X-Received: by 2002:a05:600c:a016:b0:485:3f30:6250 with SMTP id 5b1f17b1804b1-4888359d87amr57279975e9.20.1775046906452;
        Wed, 01 Apr 2026 05:35:06 -0700 (PDT)
Message-ID: <52f3cc91-5b5f-4cc7-b445-313704ed8563@suse.com>
Date: Wed, 1 Apr 2026 14:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Ping: [PATCH 0/5] input (mainly cmdline) parsing corrections
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Kamil Frankowicz <kamil.frankowicz@cert.pl>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Language: en-US
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
In-Reply-To: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775046907-0FB450B1-86594997/0/0
X-purgate-type: clean
X-purgate-size: 508
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: BA7FA37A835
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 17:34, Jan Beulich wrote:
> A number of issues were identified by Kamil, by way of fuzzing.
> 
> 1: EFI: avoid OOB config file reads

Leaving aside this one, which was redone quite differently (and re-submitted
independently), ...

> 2: llc-coloring: improve checking while parsing
> 3: ns16550: harden name/value pair parsing
> 4: ns16550: harden positional parsing
> 5: video/vesa: harden font height parsing

... may I ask for acks (or otherwise) on these ones?

Thanks, Jan

