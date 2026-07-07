Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G6cwGLAhTWppvgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:56:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9ACF71D8F0
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 17:56:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gUzsC19O;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356389.1611029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh89d-0007eH-1W; Tue, 07 Jul 2026 15:56:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356389.1611029; Tue, 07 Jul 2026 15:56:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh89c-0007bZ-U9; Tue, 07 Jul 2026 15:56:12 +0000
Received: by outflank-mailman (input) for mailman id 1356389;
 Tue, 07 Jul 2026 15:56:11 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh89b-0007bT-51
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 15:56:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh89a-004nBN-D7
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 17:56:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d217f-2eae-0a2a0a5409dd-0a2a450a9280-42
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:56:10 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d219a-e40e-0a2a450a0019-d1558030d558-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 17:56:10 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so29069675e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:56:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0960634sm36272555f8f.26.2026.07.07.08.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 08:56:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1783439770; x=1784044570; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrrGB8wokcEXn1q4hh7rH5X9oqZWe7NmfRo/YeCUTvU=;
        b=gUzsC19OkcHoVAebXnw40dVy+3rwucPrasZbFBHN0FIkJefKcNHLfpwDn+Gb0QqllM
         W2kKWfWByA4Qe1/Iq52SZey7z05p3A7OEZquPXgPF9435D5OnTwD+HZjc6lVmzXwmqs8
         kab62a188mPdL8+tCqmmfkYbfxtxHclhyQXE4pwvPq+c5GAJxW2oE8quCYH3ulKAhY2z
         L1yU6Nu2OW98kTtyIMMlHP5fkP5PZhNERK8YNFurdBfCpu5FReIlOFQX9jw/p1ldsI9p
         T1V1tzywfyYNJxsahbNk+5tfl1E1bQ7r1Mcua6+pbMt7+gWCaGJnq0JbMT5R1i7/8Mo1
         +XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439770; x=1784044570;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrrGB8wokcEXn1q4hh7rH5X9oqZWe7NmfRo/YeCUTvU=;
        b=qJDNo3cWsCk93txzSMYJijbGjLBlOEML86H1UPIeywJORCv8GCSNoeaSbKgDF4olMK
         BRgDR8DEE218AagAW8RQDA1kaP3B8uMtokkOnYUIF+3KOwcXC78ZF0AS/MBdZ10v75Wf
         aGxtUBN6nYYHBkZvrXRz7TEcSZhr6VHmB13o+L0K6FN1XQF/1A2ddGkDWapSJJQf+MoJ
         0z+LrgLmDL7kKuLo3M3hwDmyTk2crgkN8uE3YCcIlg2HtKYhMlAO5TBoDA17Mq7Tsxld
         tMVok4f0MPUxUEuml/9vJlQOa2HdGkhxrFz0SdSpa/+ihZTKrilPwpWKovoxc/SjE0G8
         iewg==
X-Forwarded-Encrypted: i=1; AHgh+RrV76CmfV7oPB9nPCYDo9tnF/s7FCF2E11n4BNbkgO/f29GnrWbXscydedeEauDhWDIH4dtVHVq4X0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydFTSMlsuQo8EJ8uLTc5RDDAfPlqT8reanpy3jm/bYTpB4Yo/R
	j4iAcHkBkfIZeSI1RoR2wFcTSPLkxDmcScVqyOU5SXsu2Po5693pq+3F+w0tpuNCbQ==
X-Gm-Gg: AfdE7ckXa1Z09S5zHd1UdF3s0AceIC0rvDcEw3jttoiLIekskcpJk49by4EE3GkiR9M
	baxpsDuPxKVtabFPqzifLTFyP3vX6jQdO9+Eu7i7E9WcZ8yFffN4qH1/GQB0OZV3GTvnEcS2EQL
	iYyVDvZtx0kxEtCaO/AgP8ItDfuGZXuQgjkg8HHM1wD4G8/04GuFwx3eHO+elqtEHVN83eDUQ1V
	JzxIWxOt/qLzo8m+e7jVDnsnFbFgo9+auuVPEdljjq8GmKw2q25iIj32h3o4RpE6kO1TGMTq4bL
	nleUY52Fh4wzjNBE2/jGxr6Fj54IW3Q5JBp3eZN12Og+kbXrucpIHCl9paKpdzoDsJM8bT/KumG
	qvgW87rOVgvD5vznm4AvmC2lgCKKn6+xnuH1c4Jx8Ptcjh0ibJCEw349ykodHOmSZM5ounFU2yw
	9yPU+aWYN8CFzgoov+Zeloz45oimtX3nmXiaV0pO6DEiZBFxb9bilS3inCwktZ3TZ8BuZgy60th
	qIM
X-Received: by 2002:a05:600c:6092:b0:493:e52f:6ee1 with SMTP id 5b1f17b1804b1-493e52f7199mr2554335e9.0.1783439769782;
        Tue, 07 Jul 2026 08:56:09 -0700 (PDT)
Message-ID: <9a526751-b6cf-4aa6-a98c-9e2e8db1ecfd@suse.com>
Date: Tue, 7 Jul 2026 17:56:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/18] ehci-dbgp: Use pci_sbdf_t instead of (bus, slot,
 func)
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1782747421.git.teddy.astie@vates.tech>
 <1782753822.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@vates.tech>
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
In-Reply-To: <1782753822.8631fc262581453bbf619ec5b2062170.19f146888c6000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783439770-CF139DDE-B40BF43F/0/0
X-purgate-type: clean
X-purgate-size: 713
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B9ACF71D8F0

On 29.06.2026 19:21, Teddy Astie wrote:
> We also take the opportunity to allow the device to exist outside
> of segment 0 (only when specified with pci@ syntax), since it's
> not hardcoded anymore.

While at least the description isn't empty here, the downsides of the
behavioral change aren't put out. This is even more so that now we end
up with inconsistent behavior (being a downside imo), as ...

> @@ -704,27 +703,25 @@ static unsigned int __init find_dbgp(struct ehci_dbgp *dbgp,
>          {
>              for ( func = 0; func < 8; func++ )
>              {
> +                pci_sbdf_t sbdf = PCI_SBDF(0, bus, slot, func);

... we're still limiting ourselves to segment 0 here.

Jan

