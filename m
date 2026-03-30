Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICBwO8c9ymnD6gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:09:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601E4357DB8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 11:09:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267355.1556871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78cS-0005fc-93; Mon, 30 Mar 2026 09:09:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267355.1556871; Mon, 30 Mar 2026 09:09:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w78cS-0005dP-6A; Mon, 30 Mar 2026 09:09:12 +0000
Received: by outflank-mailman (input) for mailman id 1267355;
 Mon, 30 Mar 2026 09:09:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w78cR-0005dC-2m
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 09:09:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w78cQ-00C14Q-Eh
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 11:09:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca3daf-2eae-0a2a0a5409dd-0a2a450ad574-40
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:09:10 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca3db6-1772-0a2a450a0019-d155dd2be5c2-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 11:09:10 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43b9144790dso2255812f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 02:09:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21f173dsm20114921f8f.15.2026.03.30.02.09.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 02:09:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1774861750; x=1775466550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GU2484/kukHHI0UlzrGXhBPzV320Q3raj1dQLV1TsKQ=;
        b=YFo76r6JAf/CwsMQzbgCJpu9HKX92sz2rFZMojhxFLPSyIEYLFiWk7u94lTQCtKmxI
         xGTPo4FGK43uIMVuRwNkQ1Xzwe5MX62ewKOWzS2y1N+TCz8/LWrxHPseWG4GQusidbLP
         v/4ThHe/OXo4r1h93xBsdNnQOjsbtVNwiJ3wcMaNXtHYz1VnZfldiUKbqSPykeZ3FVkh
         TOWdc9juFNpUjtt23tG6rbLDiTo3iw6IevawgXMA+c3QxI2kDzRze/dcwEn4A59GmQGB
         4/lUmNhjgS/3x6+NyekEe+z4Y8T8UdnANyatnxm7pDDd+EUAoJM/fwKdgRTLIvjmkR+o
         8fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861750; x=1775466550;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GU2484/kukHHI0UlzrGXhBPzV320Q3raj1dQLV1TsKQ=;
        b=CE6UDAS9VtSMUxsgDDWpIODtN+PA3VdUjeJjVJhNzw+wQmzvpcQ1E2TgozZJvMNIuo
         MiWmffratHdBfxaWGDzoQ3Io9uOjrsH5jRDWRC/FiJdxjlSxK+/sLWpb5mKyApa34SIs
         cEaw4rvGvOmYPavvXvlFu98SjtXQ4zcHiLLh0Pv4dMnTeq0IH67NOJ6taVDJzsNbVhSP
         kKdMLw86OpBB31qLdUFPjBOWc7hZmHceP+ZibmZHmc+rh/Oyu75/wce7le/h19rj+MJw
         Q9hg6B7SRFhfq8lx4XPpQKHkiwZv7qVAZ0BZaKf89QzmZgJP/H70Es8MFMrkvMdDbP/u
         uJsg==
X-Forwarded-Encrypted: i=1; AJvYcCVhOCcPqTxuRn0obERhWkn2KziX4cfIq61pj2TCfMIh7veqkpTao2Kmm0UZmd5oxk1UmXGgo56OXCw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWY/9YxoXZyJTiUjYL6fenAeReIoCmQGK2jBm0BrUB4eGumgCs
	jjtAySX8TFNJa4vhkYIE3oEzFlW+VscCUJN+Y25Qzgh/0P1zgeokCSKFSBed/AZcUQ==
X-Gm-Gg: ATEYQzzJ4gfPoyo7YXmeCrpl/QGwBJchQMP0tHl9MO/aoufvOdOc2T9MJtvhUvPHFbq
	AV4pZx0XeN2xyVf/nJpraW7WogYtmVeBfe5MNj/i01igV2G5Ni3QcqBsiCGz1E+oUy0rNWq1YxO
	7Dya8nQsMTHUhi9mqG7hjd1Z7IW5oHJ7mb5YdVJvoDUCqOzZ0+oT+ImXSxOC2TfywjD9OJ0JdUm
	06uaKNJLh4nOnZLaQVqmsAz9B+QASUw33/H8OKkQi2NdC4foNhM5P5OD+uhpJOFpnXmOr15hfyR
	9kbIMWNRsx4Aqx2GWNKHQl4BblPOCOSi2Rcw3O9pBboGWidowzPX/IXgcoSo+Bhjb6h9hmRPLWl
	h40Gewk1Aeisf01ZvVFMVEFxZaRE6k0M/PWSWvgB59XYDwwV6GN7UTa4JMyx3Mk54BIDHLAzjph
	bSt3Nh+tjPqbtA1NHRybrT62ZQzoDl9BYdDLveQhzEWi4Qv+6+4CXKTNUVLI/r5bZETyXzzTFwy
	bJJdmPJBgT8rHeW22DqyonO+g==
X-Received: by 2002:a05:6000:1ac8:b0:43b:8858:1146 with SMTP id ffacd0b85a97d-43b9e9fad6dmr19160672f8f.41.1774861749629;
        Mon, 30 Mar 2026 02:09:09 -0700 (PDT)
Message-ID: <ad18bddf-9cc5-469c-8b8e-d5cf39840660@suse.com>
Date: Mon, 30 Mar 2026 11:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/uart: be more careful with changes to the PCI
 command register
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260327135420.7246-1-roger.pau@citrix.com>
 <20260327135420.7246-3-roger.pau@citrix.com>
 <93a09dbb-0a8c-4eeb-b544-c9409b9f85ce@suse.com>
 <aco8-8hc5xJCZeal@macbook.local>
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
In-Reply-To: <aco8-8hc5xJCZeal@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1774861750-BE28F900-BE64D2A3/0/0
X-purgate-type: clean
X-purgate-size: 1838
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 601E4357DB8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 11:06, Roger Pau Monné wrote:
> On Mon, Mar 30, 2026 at 10:00:05AM +0200, Jan Beulich wrote:
>> On 27.03.2026 14:54, Roger Pau Monne wrote:
>>> Read the existing PCI command register and only add the required bits to
>>> it, as to avoid clearing bits that might be possibly set by the firmware
>>> already, which might put the device into a non-working state.
>>>
>>> Fixes: f2ff5d6628b3 ("ns16550: enable PCI serial card usage")
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I would have preferred if the description mentioned the particular case,
>> turning this more into a workaround than an apparent bugfix. 
> 
> It turns out that the console does seem to work fine, even with memory
> decoding disabled on the device (as expected).  I've updated the
> firmware in the meantime, so I'm unsure whether that update has
> changed the behavior of the device, or it simply was some other
> instability that was causing the issue in the past.  This SOL AMT
> device is not reliable at all I'm afraid.
> 
>> As mentioned,
>> us driving the device generally means we're free to do whatever we want to
>> the command register, as long as resulting device state is consistent
>> overall (or else we may indeed have a non-working device). Having to keep
>> memory decoding enabled in order for I/O ports to function is pretty
>> clearly a bug in the device, and hence us "violating" that requirement
>> isn't really o bug of ours.
> 
> I think given the fragility of some of those SOL devices it's best to
> limit the number of bits Xen changes, as to having a bigger chances of
> getting output working.

That's okay(ish); I merely would wish the patch description was less
suggesting that Xen was actually buggy.

Jan

