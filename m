Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UJjiOGvNTGrppwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 11:56:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177A371A060
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 11:56:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JQ6h5cDa;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356150.1610815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2Xq-0000Ts-1Q; Tue, 07 Jul 2026 09:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356150.1610815; Tue, 07 Jul 2026 09:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh2Xp-0000SU-Uu; Tue, 07 Jul 2026 09:56:49 +0000
Received: by outflank-mailman (input) for mailman id 1356150;
 Tue, 07 Jul 2026 09:56:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh2Xo-0000SO-D3
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 09:56:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh2Xn-006ozN-D4
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 11:56:47 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ccd5f-bab6-0a2a0a5309dd-0a2a4502a5f0-0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 11:56:47 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4ccd5f-5a27-0a2a45020019-d1558030d8dd-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 11:56:47 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so21363185e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 02:56:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0ec6e64sm73332605e9.0.2026.07.07.02.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 02:56:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1783418207; x=1784023007; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OVGRKbjKvyB6WbymRKlxadAa+3cdAcOeZwhKYDz53Rk=;
        b=JQ6h5cDaWjiAxAs2dn2cIW+QC7dGLBkP6tD2LFes5k0rqft/MknVvpXbPzWmuzhWbN
         hFnMOZ622YZazzHX3oLTwIg9AZ/blCU7YIwRDQVUl8rGraOB9Bjfyo1bbOuJkcBS4u2c
         zGvGe4ZA5XGUKya0QZ7czjXDKFZS+FvJu39b/YucD1LyX+4ZJ444/b2ray4ruP0+1bnO
         AEhaK8HX9THZi2TFOZiF324CzdPj8E91Zxl+1qWoQq4h2B3N6gzGhmnMaaN/v9phCs/R
         8XuqcNfQbyWGP3Y3cJWJYL0/KaEQASR7ees13XPQJIZHoMqPS1K/xA+bvVBoq7sNngcB
         tYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783418207; x=1784023007;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVGRKbjKvyB6WbymRKlxadAa+3cdAcOeZwhKYDz53Rk=;
        b=SkAZVd+nPX+DUXOvKSz05OnJ49JocjTol/QyCCDKQt2jIhxf7HHrYxB+QTKly9gR+1
         asPBzy+SD4uK8dC+9cML8BlQuEsSQ7smOAuLxcYiJwsitJTKFRv/dWpyZ0MqjNrvexyI
         LFrCDXRTp2WVsSWnYjhFFH/Qh+cEO4RI1tX+TpMpELMdmHBB8T+7xdgmGmN9OZ5VGnSV
         5YhGJ5WQ5WMziv+A8vwyVbWmB9MJoR9SPwgqBUKNoU1YM683EUqpkc9MCLPkFeaE03DN
         tl7yH1wvUgOxVcSd4UQEmIobp3lgeIn9rvPpW2SWYJy0578kBzpEByoD6nm1hcxgShMR
         EdAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtRdtuE56umyx61urb6A4nIxltIRcq6jB1Ny6iL1NYmXLCIXjMmlKzh2TveRMgmRdwejYSJdedP+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNzPrBN6CkZqAIA3v6dtOQicD/TzKj/T8uy5eZi0Gg8WOH9Sr6
	+oeDvv2KGfhbVXT+tiVvJIsfDRO5tc47H/tbmqeJJpmRIIIhzX2UNSU1X50pFw9aFA==
X-Gm-Gg: AfdE7cl7bsNNOcgBu9zAqGKWs+1KDk0h7yoRrJ2LG9sciQrnK1apDPduRsFBkWekjE8
	Sa8fil2aFiYYrbRC83WnwnaB/F2onI8YDKPu42KU0hVHMJj3vt1bhgD8mwo+EvNop+rusN8ESXY
	U2lq162IE0NdTdGktKL7cUzc9nJkuKCaylwTL4TUIO8RRcNZu3qZHp0dI5uuDcu45VYec8/A+P4
	zyz/aQsieWcSJVF4aDYZ1GmZnWEY1kZ+0taO6LcUMeFdrRmC0b48lOhj9VSPGqPH7Ic52rqYBpY
	kR+jL7lVCISe6bKvaBparTyMYT52x4hJ5YSCYXxg1Gnqpe53cirEJvWFxEnCHvS6anI1R0fjTF2
	NoQvfwIvxcfCBLIPv9sh+sdgb/bAgRCqCn93wIUSTS1PHDuEqvAtLhT5b0Sf1S0LiD5BIHFziqj
	C0Dvmu4hCxROREohWRYIfvv2Ld6TBhTapkpBYVxwLGll6esHjn9I3hjBBOfMz062hMuxLM4BVHJ
	wGF
X-Received: by 2002:a05:600c:82c3:b0:493:a976:5c6e with SMTP id 5b1f17b1804b1-493df1c958emr42509605e9.16.1783418206804;
        Tue, 07 Jul 2026 02:56:46 -0700 (PDT)
Message-ID: <0e09a987-e701-4ee1-9125-8a9f7cbf72de@suse.com>
Date: Tue, 7 Jul 2026 11:56:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] stubdom: remove grub-pv
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260707083459.226297-1-jgross@suse.com>
 <eac4528a-f9b3-476e-adea-63d317ef30fe@suse.com>
 <5edc7c12-8563-4369-bb9a-2f614b74eb31@suse.com>
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
In-Reply-To: <5edc7c12-8563-4369-bb9a-2f614b74eb31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1783418207-4E5147C5-B6FA9139/0/0
X-purgate-type: clean
X-purgate-size: 1231
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:samuel.thibault@ens-lyon.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 177A371A060

On 07.07.2026 10:44, Juergen Gross wrote:
> On 07.07.26 10:39, Jan Beulich wrote:
>> On 07.07.2026 10:34, Juergen Gross wrote:
>>> The grub-pv stubdoms (32- and 64-bit) are disabled by default since
>>> several years now.
>>>
>>> Remove them in order to enable removing quite some more code from Xen.
>>> In case someone is really depending on grub-pv, they can easily take it
>>> from an older Xen build, as there is no Xen version dependency in
>>> grub-pv (a version built 3 years ago has been tested to still work
>>> with current 4.23 staging Xen).
>>
>> What guarantees this to remain this way, when ...
>>
>>> Juergen Gross (5):
>>>    stubdom: remove support for grub-pv
>>>    stubdom: remove support for building in 32-bit mode
>>>    stubdom: remove building of libxenguest and libxenctrl
>>
>> ... there was this dependency on (unstable) libraries?
> 
> Only stable hypercalls are being used. Otherwise the domctl version
> check would fail, right?

Of course, but the libraries offer more than just wrappers around domctl.
Yet then ...

> I did a review of the stubdom specific grub code and didn't spot any
> use of an unstable hypercall, BTW.

... this is of course reassuring.

Jan

