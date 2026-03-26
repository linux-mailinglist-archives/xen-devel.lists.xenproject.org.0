Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BxTIcAdxWnr6QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:51:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6F334BB4
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 12:51:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263837.1555667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jF9-0003Tt-8V; Thu, 26 Mar 2026 11:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263837.1555667; Thu, 26 Mar 2026 11:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5jF9-0003R2-4Z; Thu, 26 Mar 2026 11:51:19 +0000
Received: by outflank-mailman (input) for mailman id 1263837;
 Thu, 26 Mar 2026 11:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5jF8-0003Qq-0q
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 11:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5jF7-00DOti-CQ
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:51:17 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c51db4-2eae-0a2a0a5409dd-0a2a4506a0b2-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:51:17 +0100
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c51db5-3034-0a2a45060019-d1558035d0fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 12:51:17 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-48702d51cd0so10510215e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 04:51:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487209204d5sm20941055e9.5.2026.03.26.04.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 04:51:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1774525877; x=1775130677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cgHbPY3il4fs7BpLDmBoNuMQOBUOgqBVYMOk11OJRik=;
        b=MrEp1w6y6ZG67a7DgnwkgaSCXYVv8hiSTGPbEZsbYrwCvEq0RUP1mds9rr842MbZ3v
         52ITDIafRDB8M8JjQmWcYg689DF4XF7my650PbtsWW0n5bqSK936n7LGwrWg829Gu0Vg
         br+HFSGO459OBocXLRq15Fw/WtVgbNYkd5KyK0f647hO5v/rWKkemsOZ99j18IEv6CXC
         9upLQp/IYpCTp21Dm1F4cebA0Yac/WTmppzxVXlqYRCklZ/YNa3qjsb7ylFfehNrddEi
         NQqM8lvevd/1er4rJ1nQ3iCzXlhKoX1I2q0QyuTq24idUAnFzRUObsAHoRUvPzD6T07x
         gSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525877; x=1775130677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgHbPY3il4fs7BpLDmBoNuMQOBUOgqBVYMOk11OJRik=;
        b=DkOgdZixlVe9YTa7GTBC7wKLSszXXeNRhos+ptX2CLaw8/zO9VdV9gEs8JlbjKmNRD
         AOBZDimndfOCCT9wtDB9U1MFfm4m3SPq144ztGHH8xdSpbKgNQlmSeM8cN27qyRIJb1l
         pePrwsT5nE5fDSFTGS7kWG96OG6aovsZgGj0O6VfNlwcRpsHmh2VlXd4TTMqLP00s/aR
         b5A697wNpPQThu7zvf0W9Dv3AYugAIUrHfC7MPqDdqtmfPSxZdsXwzz/F8Bg1dpw5L03
         pjKEK47LC8kfaHIgdSRj9MIVrVeRWTNzkIDYPXjRcgsu4dC9Oqo6nER51dNs1xWx61Tp
         Gxfg==
X-Forwarded-Encrypted: i=1; AJvYcCXlNp0Z1Y2neEMsNOLVSlpepxTrUGzhHEUf+0eoag1acbtpsdUtV0uXEFsjqvIsCKjrq8qXqtSdebg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBiMScvNGTYtCUfsharW08rvb8VpgskwOIEwamS592HeagnwiK
	IICV987JhrCxZvPf99sJcqPvrbDKHT3BwkJw2+ODWdpUk3UpmTdXx+LAXz0afRpdGYoafE0UDC9
	In+9klg==
X-Gm-Gg: ATEYQzxD6oQ48NBPiPezzgMC20zedmjtnM0oZmN6XAVfyZquAPF8BfI7TgbsXKJl1u+
	QT0vb7lbVtginpzgkwx3zAK+XHvJK39Ij03zqWDAye47V7y7r8GQGRfkgtmNom0TKBhrpHrOFTn
	rr+zjA2gF8Y9RN7hESUKP5hODmbKS20I8rt5FfLJu3sUV0tWYda8UWCZwJCKAfr7QwrtmdcBrBS
	DSSJFla2ru6TgyRoWFuq0EJ83/4wCfzMDxLV39+0zFlNIyzZMAIgYJwMpa0KzzdhFJr9ImITRPz
	38VLuaciC57Mv4cdMUViuuM1vL9FbqIZ5q4jWptwQnQC0XQonyCmDdETe6LT1+/KuuN6ZjIVWnz
	Qt8/PMRQtyZP7eQLCWsFqOCrHDwTHZz235IbXVSR8delS/lom5mcxNle0cU8FFGY3zN9PgJacUB
	P2myMBnUg3FXVaAModII+BsrPnnnCbG6A0JLpOS/F35p332/LHdgVZruSnnaS1qnevRpc7xg1t9
	tCM+PY6VuiuTzM=
X-Received: by 2002:a05:600d:e:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-48723317f06mr17311475e9.12.1774525876588;
        Thu, 26 Mar 2026 04:51:16 -0700 (PDT)
Message-ID: <bf4a3db4-802d-4a97-a07e-ac5470fe90b8@suse.com>
Date: Thu, 26 Mar 2026 12:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/mm: do not assign pages to a domain until they
 are scrubbed
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260326085145.61380-1-roger.pau@citrix.com>
 <20260326085145.61380-3-roger.pau@citrix.com>
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
In-Reply-To: <20260326085145.61380-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774525877-B3C9F1C2-C84D0750/0/0
X-purgate-type: clean
X-purgate-size: 1440
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 19F6F334BB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 09:51, Roger Pau Monne wrote:
> Assigning pages to a domain make them the possible target of hypercalls
> like XENMEM_decrease_reservation ahead of such pages being scrubbed in
> populate_physmap() when the guest is running in PV mode.  This might allow
> pages to be freed ahead of being scrubbed for example, as a stubdomain
> already running could target them by guessing their MFNs.  It's also
> possible other action could set the page type ahead of scrubbing, which
> would be problematic.
> 
> Prevent the pages pending scrub from being assigned to the domain, and only
> do the assign once the scrubbing has finished.  This has the disadvantage
> that the allocated pages will be removed from the free pool, but not yet
> accounted towards the domain consumed page quota.  However there can only
> be one stashed page in that state, and it's maximum size is bounded by the
> memop-max-order option.  This is not too different from the current logic,
> where assigning pages to a domain (and thus checking whether such domain
> doesn't overflow it's quota) is also done after the memory has been
> allocated and removed from the pool of free pages.
> 
> Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


