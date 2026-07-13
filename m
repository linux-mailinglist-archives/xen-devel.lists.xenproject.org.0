Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w39vNIiQVGqZnQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:15:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35097747E9E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2026 09:15:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=H1K+hwgs;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1361442.1613675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAse-0007uz-Ug; Mon, 13 Jul 2026 07:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1361442.1613675; Mon, 13 Jul 2026 07:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjAse-0007td-Ro; Mon, 13 Jul 2026 07:15:08 +0000
Received: by outflank-mailman (input) for mailman id 1361442;
 Mon, 13 Jul 2026 07:15:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wjAsd-0007tX-Gv
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 07:15:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjAsc-00DTp4-QA
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2026 09:15:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a549078-5cb7-0a2a0a5109dd-0a2a450b853c-10
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:15:06 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a54907a-b7da-0a2a450b0019-d1558036bda2-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 09:15:06 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-493bb510ce4so19210385e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2026 00:15:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493f4cbc620sm230777005e9.13.2026.07.13.00.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2026 00:15:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1783926906; x=1784531706; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEbmbu1kbKe7UA7Qg9AOu+uVEpuOknXXkgnOylzoBG0=;
        b=H1K+hwgsrgXoJaIOSL220Nq8DDifOAEBe5874eJCv8F5i4EQpyyz1k1lZgj8A7keEE
         2EGreR2FvDlfIjsMZwIBdbJltd16M4dc3qjmOtOdySwQ5HNKJ0JHVJeO8QreiXXmU58H
         gSqBwALL7vxHv4v3QldyI0NzfQZ5ZxCAB272ryOVFAXYoVfscTSNJV5e7BD+t5nKe3GR
         UBGdVIkcYH83B77nVJzPKKApoxEpKqWJT6Z66znHP/90R9oy4BWjjC4683e0zM3PD145
         ALcRuFWA3Ye8elt8hPGPABUSvWtjnaHqoylVi44dEEXcMKrf8V1XsDdB/sw52KEGIY0x
         H34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926906; x=1784531706;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :cc:content-language:references:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WEbmbu1kbKe7UA7Qg9AOu+uVEpuOknXXkgnOylzoBG0=;
        b=UgR4zbB3O8FonxG2Gz69knEpmSAVIAp3APlnnsunsBqiD17+k9LbZlPV2pq5tYFFWB
         N3WLitTCY4bpX/vMx7iEkuqq5KB4ca1PxRrxSNUiJq9CbZ/MDpC4V7O7rQXLjOK+2QMh
         IlI6cChmOOkZRDbxNodSzitvh87IImKiZ3GteOTvv9sc4O0g2b+I8ZOWTE5Cr8CEqWiI
         dEtfTOi6O11uCDqSZmZ6m37UO1MGMeWpZ/AaHvrqLmQGWd2Seo7veb7ATr6xtcOyFCXj
         Z+cMGPN4pCpef2M2ZqasX/XYk1VY4ao/qAy4JwZ+diJqfDzcy1W6J917gNZN4EyidWcY
         vhZA==
X-Forwarded-Encrypted: i=1; AHgh+RoBrV5K7RWY5zLGmaCLa56SZ+09YTi0cV6MNVCeYOWwagf9UXKnlYiI3a3tTgvi46OqnoOdlZUdq/s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNfFPydcDTtRr7+y+TtvmnfJ6NRfeP4PBF/ZZARgbYT3V8Cy02
	1DvTuUle90Nimj2wEL4BY58f51fCSSz0Q72N/K17Lk0vAdPDM8C7kporHcQgSN3Sug==
X-Gm-Gg: AfdE7cmPVk2XFY64JotInK+pUIDuVluhOZ7U7V0yXZbZYvh4az0dStHMJfh6a6OQpGP
	Tj9+7KnCbuKIg9SKLK2qYgYdlUVP56mEUhuZh1sGzuDnzEcE29KXQaJL6UWJvLmuRViVovycLAb
	yvuJnt+w4VYLl0k729GZt0zQGhNbAcSce0du7Rv+FiYlkxaxBz+6JyjYTjfOFjgQ9GKT9eC4/8n
	445zMG7XgZEMqWQ2uM1Mvsj/2RsoBYCOBIxXGHCFQtzN3r41o+bnPXNbynfMX+/0rbQZVY59P2S
	QkK6QRR21WyqUSCMSH/l1HgKrI4ibFL4x7wrZhZ1BsNC/Zs0xeuiOckTBakrpA9bQenqeumpc0b
	hzuqoRyqUKXbalXRvI/GPlNDpr0u9wLO3HPccOEge78IumhmNt2LUCuZwtLa4MbhcogX1A2rcEA
	LSQET+V1QEYmlW1ekCPn2QfQ/cekEgApgjWO+hQIn+8clSkDfgJLX4Gu5vA3qeiyc+n3wQCdGVE
	Hyb
X-Received: by 2002:a05:600c:c0c3:10b0:493:bfea:2780 with SMTP id 5b1f17b1804b1-493f8bd01e6mr58057415e9.9.1783926906214;
        Mon, 13 Jul 2026 00:15:06 -0700 (PDT)
Message-ID: <2819d042-bb88-4e6c-8c7a-bca016e99fd4@suse.com>
Date: Mon, 13 Jul 2026 09:15:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] misra: deviate MISRA C Rule 5.5 for
 'hypfs_alloc_dyndata()'
To: Bastian Blank <bblank@thinkmo.de>
References: <cover.1783864426.git.dmytro_prokopchuk1@epam.com>
 <365f750cfbc626e763819da2604bfccab2ac80f8.1783864426.git.dmytro_prokopchuk1@epam.com>
 <5hndddlv4aaa2szgnsfpor4shbfr3tolegiz7w6izqi26vche6@qnhcwjjiy5sc>
Content-Language: en-US
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
In-Reply-To: <5hndddlv4aaa2szgnsfpor4shbfr3tolegiz7w6izqi26vche6@qnhcwjjiy5sc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783926906-497729ED-0A6FE9D5/0/0
X-purgate-type: clean
X-purgate-size: 1105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bblank@thinkmo.de,m:dmytro_prokopchuk1@epam.com,m:xen-devel@lists.xenproject.org,m:nicola.vetrini@bugseng.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 35097747E9E

On 12.07.2026 18:17, Bastian Blank wrote:
> On Sun, Jul 12, 2026 at 02:04:44PM +0000, Dmytro Prokopchuk1 wrote:
>> +       Clash between hypfs_alloc_dyndata() function and macro names is allowed
>> +       because the macro is a typed convenience wrapper around the size-based
>> +       allocation function.
> 
> Is this really the whole reason for this?  The macro is a wrapper to the
> function, so it must be named the same?

Why "must"? It's still a choice we have. Imo a good one, to make accidental use
of the non-wrapper less likely. But opinions may vary there, and iirc there were
discussions around this when we settled on what rules to accept and what
exceptions to plan for right away.

> If there is a deeper meaning, this should be documented here.  Looking
> at the current code, there is no documention at least in the code
> directly.  And the function is used once?!?

More uses may appear at any time - it's a library-like function for hypfs, after
all. It's just that hypfs, after its introduction, hasn't seen much interest
(as in: further uses) anymore.

Jan

