Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGHfI3pVnWk2OgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:38:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4203C18320F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 08:38:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239471.1540878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumzw-00052T-Lf; Tue, 24 Feb 2026 07:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239471.1540878; Tue, 24 Feb 2026 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vumzw-0004zj-Is; Tue, 24 Feb 2026 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 1239471;
 Tue, 24 Feb 2026 07:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1N/p=A4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vumzv-0004zd-9H
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 07:38:23 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8efe04-1153-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 08:38:22 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4836f363d0dso44401415e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 23:38:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b820def3sm30283675e9.2.2026.02.23.23.38.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 23:38:21 -0800 (PST)
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
X-Inumbo-ID: cb8efe04-1153-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771918701; x=1772523501; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BKBgP8QEOB59HnlM/s/QjLqDZ4/w/4sv8iO4bJHu1Gg=;
        b=Qc2SV+FVSEfKCviJ3vB6uzQxreQL5V9qbSJuWs1sgYJO3++jGRcG9/BWr/JNa4oYqc
         YBxL+xgWmLgc8YzVNzvIv0WHc7Say9ZGlvEM5SnD5ypKe79VnC0hAvlRqIrira2QYTs8
         kHVDSnW5PIwOzFiuegOgTsvYpH6l5Q5exSizOT+GvpZdp0toIanxsMTDMOaEFfbYYmr3
         M3NpIaIxiEhTg6lQUUxHMGH3m/NjXdLEz8YQa7Agul7e/yW+6ZWBuiOD24pUfDt5gY2P
         JrJ8wQv+guDNJR3ys5kdDAe4WtB34T9AZkYsZklBMZRyf3JmYvtS2d53mxQ11b7WG7wE
         4lVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771918701; x=1772523501;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKBgP8QEOB59HnlM/s/QjLqDZ4/w/4sv8iO4bJHu1Gg=;
        b=JmzazNyx5z2TnygYpT1JJomu7Dw75CZ4qenBz3KPImw6B+0I+ttIUTX7yCTk3z/WD/
         0N3XKu8hCLxYbcaWKto8cKpnwzrtWxwDy8pNviKZ8tH6LRZ3XzcOgQaHIFpFCsdv5OOh
         977SeyvoqLLc2Nm5n/ua8SJowVE7mjRfpNPniJlgNM83d0tlUKnoh1FYaL4x6Ift4GR9
         ik/fcVwT+5964dm5WoqU0V56A1OLM7l/E/jy6Ufu4wvUuROyMbEnWbaT2INHdPySs+Eb
         liRYCzVuBd3XG7ruJHEKP0gAiqPFJNPP1YZ+kwHFvi8iTAzmFU2K104jIJjuDWlZfX1A
         mBcA==
X-Forwarded-Encrypted: i=1; AJvYcCUVFkJYsRjkuNgjfNLKfVOvVtOsjW05Qt7kwc5mXl+vg3FkKOb05h4+fPr04jFKm9r3ixG2ZP6q1WI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMGy0/ANtm4ZDnQdIGYAh/iBDexo+jasBh4BLZJPPCT9wsF8UG
	ukMzT8BTJf2BAoP5bZMcdY80NDFj+d3sRCTVkzKiaTt8i+9pcrlMBr/EeHtrKfbUHw==
X-Gm-Gg: AZuq6aKAK2ibYp2+22iw4UC6Ue2tsPVskDRPYv7T5XBokMeByc+9lM1K21UQjrGoyoq
	IfoZK54MrhN/eHKpzZ9hptpcOQQzoWSBdrOutAsxLuY6NNxc1IPOuQazklUsXjyFDmKSOUpaM4j
	Vz2hg8lmC99QWmwO8iaq6ggqXoPUYix4PEOxUoE80nWpbA54A4QEdSKHBiL6jWbNWa/fXH70chC
	95NYvFaLvHCeTc34c4kJibrCHqbIbxLqxMmRGKKBrROJLZs0KEVUa7wLSCstgfmnpCfKlUzEkem
	QoqnUKsmHZaKCWXD5craVNWmytbVK5YkzmvG9de6/Vr87ntwuzEP1on5DkeBZ7h+114EANHshjn
	3J+DhS4v/Gwxvn2Wx7UW6CxChh4hRc/HxyQx+NA+YhFjnz/s+Jzdg3OPG6D9h3wsgkg+tWXbDH4
	pYhDSwAPvg+/kCeozfalkdm89L5V7w+zZi9hJYX8FkqqSQ++ONtPdnhUTdpKdBR7q7hsApzQ64E
	OExGBxqjmfdbU0=
X-Received: by 2002:a05:600c:1386:b0:477:55ce:f3c2 with SMTP id 5b1f17b1804b1-483a9605a62mr212454355e9.14.1771918701517;
        Mon, 23 Feb 2026 23:38:21 -0800 (PST)
Message-ID: <01807a5b-089b-4c79-a38a-529b7707587b@suse.com>
Date: Tue, 24 Feb 2026 08:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Support discrete modules being CPIO archives
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260223185054.3598305-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260223185054.3598305-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4203C18320F
X-Rspamd-Action: no action

On 23.02.2026 19:50, Andrew Cooper wrote:
> Multiple downstream distros have tried passing discrete CPIO archives and
> tripped over this not working.  It turns out to be easy to support, so do so.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


