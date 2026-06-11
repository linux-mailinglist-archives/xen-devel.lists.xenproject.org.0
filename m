Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lvw7HUPdKmpwyQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:07:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E4A6734E8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 18:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=aoUA7DUu;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1335874.1598027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhwA-0005Zv-Pi; Thu, 11 Jun 2026 16:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335874.1598027; Thu, 11 Jun 2026 16:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXhwA-0005Xh-Md; Thu, 11 Jun 2026 16:07:22 +0000
Received: by outflank-mailman (input) for mailman id 1335874;
 Thu, 11 Jun 2026 16:07:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXhw8-0005XZ-KF
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:07:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXhw7-00BIl0-U2
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 18:07:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2add33-2eae-0a2a0a5409dd-0a2a450198ca-8
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:07:19 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2add37-c1f2-0a2a45010019-d155dd31c8ea-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 18:07:19 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45f3cf907ceso4332606f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 09:07:19 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70d:3054:345c:e2ed:ca23:72c4?
 (p200300cab70d3054345ce2edca2372c4.dip0.t-ipconnect.de.
 [2003:ca:b70d:3054:345c:e2ed:ca23:72c4])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f360bd6sm89393001f8f.36.2026.06.11.09.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2026 09:07:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1781194039; x=1781798839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fJHr+noQUffWgdiWOWSpKnjCaCxzCs7rjTswS+tVvdE=;
        b=aoUA7DUupo9a4vJF7rHQ0hwEmV/D9Er4mU8pdxAfFPh91cuF9IObLyh48ybi5PawOD
         9ydLrohNGIUzg8YWOUgljIVknC3KqosEvw5/7uORuOFoQ+6c62SK71Kf9qsLcS3PeAwF
         qsNZ2R/pivRPGZRpVgJBGrgLz5/tSxJQSm7m3o28exsFyrJmXVuWccyydHr+VyCvt+mK
         UU74jaCat4P/RO9MriPjyf5RhOfttTud8F9JKigaFkNlzAoPEMyKqtBKYrbEcha2M45+
         65fADtuyLNlS3wo/wgF9v7Pz3KxI6zpwnpbMBu2DSQCaIiuyoTPm/pwRmuvCDiv0LJk0
         TXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194039; x=1781798839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJHr+noQUffWgdiWOWSpKnjCaCxzCs7rjTswS+tVvdE=;
        b=CFaYNTcPkWjhQtrzg9QcdInHjxiaEgvkNDh4pP9jbzQ7lUXB0IayOkp37+JtaTTO4J
         jyb50Ld8xT1Hc2rDtgQqIjU75VZmVvztdakTLmMgw+S13HdJfOSouBwcQnebd0cGxs8x
         1GqGwHuLzG7ZA1togwATxlmHTrrxdDvXGMYHDJMC1Lw35CiVqckuX55UCayxFlyl07I/
         005XnQwz3VI7q02a49+6/s1TF/AX9gvQvq8Rl6v3ZHaKNTazKnXdO1gw4P7pmJL1fwV2
         h3iy8sX3Hb9ilGFrcF5sixsXdZKhbP8DuPGv7X9wW8iaHr2VURkP/ut2BdOoOkionbiX
         lOAw==
X-Forwarded-Encrypted: i=1; AFNElJ+u5La8EvgixkJgkD5RLe65/MApzhvCkChKCwUEmb43+w/izvpPDnVpczR3arQvU1pcGDgJ9rtEBbU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxE3HRUolrvwD/0s/M0zkkBjrhHu3k3HsNq2c4HmgpWgWG0T3Km
	Gb6gf1fi8gswz2HLW9GEmMRZGOi7X8yBVWvkHzv+CgLC+Z69Ha1UF+ypb3gg8kQ6rA==
X-Gm-Gg: Acq92OG6TW3J7xHIjCgiOuj6HtOnR/ApVv+tn8sBBZBeoiLwj+fQafTKDGxJJK9uhCx
	4X+Z6jJpDb9Aou76J8Ba0UWhS685hT5nHcHlrkZS/FcS8VCEmNp23Bhjx5IbkkdE6VXQk3vKYzW
	ljeb8zAurU6xMEIenjCldgbAqE+AOGfxRNoGeJG0P71kePwksd2fZJGPRu7KujhQWkp0oDp5ZE7
	F8SQlHsREAmHoDU+7D7XIwL6CwcijdsJyw1xIeTOV6iCVpp9I7SsPCEWBLi9/4aBUL6MT7oxS3h
	74EsbxH8DKCJ/sltOnHcrATmmYBPa1qkZxievHH0LhbCHdPQNeDzAxxNwzZhu0ltpEmqL/1eGDT
	GKpJBxcGFNliz/WiOrnLPk4zgDvbbzyXEDEJkFtcO7auflQ89noybGgWQIUrAf9MybRp3ZvHJp8
	hQnJUN3icUD2n0MwFX9DEQZC7Dx+9c1xwloKZFkz5wqB7xao6ojCLikAyRldZ4G6sVKJOYKfZDj
	hUR3wScX3RnMY5oAVdtg5FMRM8fFbubROe4FdrBP2gt0dACZleQRmeX/L2gsZtJZtwf1cw=
X-Received: by 2002:adf:f48b:0:b0:45e:eec6:500c with SMTP id ffacd0b85a97d-460677e19a6mr4168123f8f.39.1781194039325;
        Thu, 11 Jun 2026 09:07:19 -0700 (PDT)
Message-ID: <9d59cf76-f0e0-4e6e-9413-6c7d70a4594b@suse.com>
Date: Thu, 11 Jun 2026 18:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] Align some sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260611153257.650054-1-frediano.ziglio@cloud.com>
 <20260611153257.650054-2-frediano.ziglio@cloud.com>
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
In-Reply-To: <20260611153257.650054-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781194039-B6143FF4-3FEDA38E/0/0
X-purgate-type: clean
X-purgate-size: 626
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C4E4A6734E8

On 11.06.2026 17:32, Frediano Ziglio wrote:
> Required by UEFI CA memory mitigation.
> 
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
> 
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> --
> Changes since v2:
> - Change subject.

Did you? The description also doesn't look to have had any detail added.

Jan

