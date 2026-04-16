Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN17Jzah4GlukQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:43:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EC240BBBC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:43:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283139.1565425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIJk-0005E3-Ki; Thu, 16 Apr 2026 08:43:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283139.1565425; Thu, 16 Apr 2026 08:43:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDIJk-0005C2-I8; Thu, 16 Apr 2026 08:43:20 +0000
Received: by outflank-mailman (input) for mailman id 1283139;
 Thu, 16 Apr 2026 08:43:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDIJi-0005Bw-Kf
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:43:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDIJi-00CJFk-1N
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:43:18 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0a125-e002-0a2a0a5209dd-0a2a4507d454-2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:43:17 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0a125-229c-0a2a45070019-d155dd31a4e7-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:43:17 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so253404f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 01:43:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3e89ddsm11375423f8f.30.2026.04.16.01.43.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:43:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1776328997; x=1776933797; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s7WaZ5S/80xTLepQ4DIerA/mVaoR6XuIgF4YaOUbRFI=;
        b=ISE0uzZ5eGXlgJoXiDqZE8uVLat8Z4ZMp69x5Y+XYOlWOjoG8IG6jw6Ypnj6Na5QsS
         h264h+E+QaoNHa3AadgCexcTN58BpkyzCoYhTCjzUl+jaCjenx2h7nsE7I4JjllL9c2Q
         JbST9ze9tbENhZ1JmhrosZNHrzLv2q+2AsVfsUwi+vLWn32XaEGCGj0XHJgaBfl8TjlC
         gBYhbI85cDf/7BKQLjSVFIN180vxHp24y36Eq1em+z4DBRy0LqD5zJsjLZg2zzrcryCN
         ele2VwOZHbQH59cDTGzuFCHb7Tuq2+bpeOEc8HJ+GR/SjLNyRHRLTn5uskDlASAt/oi7
         VwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328997; x=1776933797;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7WaZ5S/80xTLepQ4DIerA/mVaoR6XuIgF4YaOUbRFI=;
        b=q5bHMaL1tN3qngtmfWiPtwddvCzipD3j74CKrndynPa3LycWPo1SNi5Sgk46qlAlu4
         kMvkQwXkkee0p73Ur4epYw9c62q49uKFt9NeH9p4k0TvQG4VZ7rcZU4KvrUgWMHyI+vy
         +WDV8WbF8AjjftT6Kb0Ey/JZCGiAEb5shOxpbgAse5FkW4mfDMzgnWFOujTh5m5saAbj
         DCPTPr9wfdWUlkvoKzltm6xCSv1SYrW9CJap+hzWihU+tauwNBz5ZlTFBkEvE1/7YjVM
         5y+ECnFxdY+QMz4MUh0lHmfRVcu3hiM13EbGepSmIdSTl5OYBWnssJmP1net7lAJk+bg
         XXtQ==
X-Gm-Message-State: AOJu0YxvYCqlNe+msGsFuLETS4FC1fn+Fucx0czCmuZSWhOaos2A/jrM
	1C27YDpvXv2zc11IONtA/w9Fx1a7/BDu8dstkc12nbSYs9ZCoJ0iyTkC7vHzQICTMQ==
X-Gm-Gg: AeBDiet/pSJjtHrFpUkQWDi6a6zJvSJcXPOCs++3bTM9fqEsLvspXEq6sIJqQTazLNm
	Pzj3KqPKsR2fUsVbwJjIG0i7f7d/H4AKGJMSZ8+mq4OW8wk1+VFPmRwC9sdOXt7ZwRQfbsMlydF
	+cWMqlqG+BveW/zqAVxLD/aXHLUIVRW65im44eVC+DKETm800L0Lx+KfxEcAL8ihVTAIolBSC1J
	E2O0coXX2jBIFKXS8wpKud7kI3Sk5QFIxTT94Vfqk0c43Xd7+5ZHEuE/Eona464F6ScZfKONoHD
	rw7URbQcjEw4Vd7cEVDHrwWjgXePOgOiexBgBxlQfyBdI9bl2x1vPkTkSGTnD06u97FbiLUu41u
	zHQcEGRIi0lygkChlFAxFfGV1NcbXl2DkI93W0YTLiCy3x1fXl3sTBK/e8RhLIm69d0ofH/84PB
	h4/A4z3R7XWOjrdbrm59L3xyBdBx0NYLuW23Ld4OsWojD1H3Q73RoOXWpjNO7i/d+Fm5oY+rJj+
	hfb1E8+IOkDW6wRQRd5edO9BA==
X-Received: by 2002:a05:6000:1889:b0:43d:2d34:8963 with SMTP id ffacd0b85a97d-43fdbb4cd6emr1504369f8f.17.1776328996921;
        Thu, 16 Apr 2026 01:43:16 -0700 (PDT)
Message-ID: <89b32645-fd5d-4ebc-a3e3-224cdeab11c2@suse.com>
Date: Thu, 16 Apr 2026 10:43:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/HPET: channel handling in hpet_broadcast_resume()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <a77822d8-08f4-4c4f-b291-cc44a213cf9f@suse.com>
 <aeCgABa95gZPw___@macbook.local>
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
In-Reply-To: <aeCgABa95gZPw___@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1776328997-AD364C48-CACC9A40/0/0
X-purgate-type: clean
X-purgate-size: 1219
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:email]
X-Rspamd-Queue-Id: 50EC240BBBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 10:38, Roger Pau Monné wrote:
> On Tue, Apr 07, 2026 at 03:33:12PM +0200, Jan Beulich wrote:
>> The per-channel ENABLE bit is to solely be driven by hpet_enable_channel()
>> and hpet_msi_{,un}mask(). It doesn't need setting immediately. Except for
>> the (possible) channel put in legacy mode we don't do so during boot
>> either.
>>
>> Instead reset ->arch.cpu_mask, to avoid msi_compose_msg() yielding an
>> all-zero message (when the passed in CPU mask has no online CPUs). Nothing
>> would later call msi_compose_msg() / hpet_msi_write(), and hence nothing
>> would later produce a well-formed message template in
>> hpet_events[].msi.msg.
>>
>> Fixes: 15aa6c67486c ("amd iommu: use base platform MSI implementation")
>> Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I think you can adjust the now redundant irq_to_desc() to use dist as
> Teddy noted?

Yes, I've already done so locally. I didn't think I would need to send a
v2 just for this.

Jan

