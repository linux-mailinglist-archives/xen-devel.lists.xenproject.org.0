Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDRgKpqa4GlMkAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:15:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88840B66D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 10:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283066.1565363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHs7-00063j-Ud; Thu, 16 Apr 2026 08:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283066.1565363; Thu, 16 Apr 2026 08:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDHs7-00060g-Rm; Thu, 16 Apr 2026 08:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1283066;
 Thu, 16 Apr 2026 08:14:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDHs6-00060a-O5
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 08:14:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDHs5-004zU6-Eb
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 10:14:45 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09a70-bab6-0a2a0a5309dd-0a2a4507d11c-26
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:14:45 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e09a75-229c-0a2a45070019-d1558031c0eb-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 10:14:45 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso92682475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 01:14:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f0ad1e4fsm71315205e9.1.2026.04.16.01.14.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:14:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1776327285; x=1776932085; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p1QIm5E603AZnHs17+I/8L71jgSjY7rjOHGih7nazO0=;
        b=OlHuIlEJzqrRnk/Ql7uHITgur9AbFjcNfiGiks9xsUzgkg3qy85QoKnNFhjEyICQr8
         Ez5axEXMSHQn980IYglT/2G9okL5RVLH+vXkxUqZeBKNSSfe49WQvS4MlIQdWD8esFMd
         PxaD+eH3H1Yix6aDxjTw3bw63Twvga3cEn1k+rkv58d6oQwycfywYFZKYYC15LeuOu1w
         pB9vLGnaI+kIhHEPU8/7/SRXipFJplNH3iyyTg747zEbDTZahqBFgx+fGesXYyPZDscL
         q3x/t+pz31kr51/Y568N+5vgAoHnnUDX/UrPww08hrnoldyJZqxSr6QxKpIYxly+kY0A
         hdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776327285; x=1776932085;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1QIm5E603AZnHs17+I/8L71jgSjY7rjOHGih7nazO0=;
        b=qqL1TEdXecK/GX1I4/3Uqwm1Ap3/GLp1vilA36890ay4Gy7GBSarfHCJATfUxESPrI
         +7FMUE2skqXu7CgqDrRs71lK2Hu38Agn70NVmei+Ue3cy3Akmvj6LvLeuzONxiev+Inh
         NjeAAVQYR9OZjJan5m3/w2q5gp6/rHryVXZx/PvShy4pdKo7WDR9ZEIOwYifzwqZhT7O
         5a0BECacNWhCi2S5vWIfM1jB8Q/gZrawIV2RjeVBT/k2WXyYnEaz++vceHTV0sE38Z2B
         5tXvBC3vWzjjhpSW03qdV5OcSTC6qvB49+jI6sjob1Ek1PgSr8w5ZRe/PMbGUC0HhVNB
         /cRg==
X-Gm-Message-State: AOJu0YxtlA3HxfAj22GH16ZM9FaI+VD565xVjk2hCJdSBn4kS4rBfeeM
	KbYma1VQ3F9CLxmeV8fSqGg7dMGoC0gk6pc9FZIcoxMicRRm9LHg+tV6vvT3Hk8ayQ==
X-Gm-Gg: AeBDietdYQ0/rFtrFasXMofRufFMmoQoIr4UiH/zWh2cw+z5HX1RlJa/GOuh9kI0fnE
	L6YH0sFaSiEh7Fsz7uPaLH9wI1rVnl7PWUd58K7eNHKoDF4vutzZmHIB6NeMYG9FHd7JQyxSZS9
	Xaf3Jj1+HAdCmNTg2ZEsDCBiQDwBUXxp8F87Twg1tFGTNsO5t4wAX9zAGbdeqTPFrLlp3a6a4hg
	PYHom17Oi6Hv9P0W/neSbXfNHP/GBURf/Vf+nxp/PHghp2g3jLQTIOUkVeCfyKbZddZjxL6Jfj2
	cdgnuIxFqjbfXAMgRbO2DmpMtMrbNb6B6zVJo7j38M2FP8d9DlKUBcE8kuN7IZwoD7fMhawrCxo
	QrQGskNnnktcF2LCe315UL467FA55vYoAV0AmFS6lwg2lYETWZyune1yKhPt74lSB60Yen1LgS1
	SElSinf8pSO8BRl7HC81JT6/mUcaazccrSyfWphqUFfpJtZoE8+IiN2I1qq5kxn8z+MnsDwujf9
	S74B5vCt52adfYOJnFZ1XKgQg==
X-Received: by 2002:a05:600c:a109:b0:488:a977:8de with SMTP id 5b1f17b1804b1-488d6839866mr238187375e9.16.1776327284666;
        Thu, 16 Apr 2026 01:14:44 -0700 (PDT)
Message-ID: <3f832c12-5a02-418d-b420-23ed3cf798db@suse.com>
Date: Thu, 16 Apr 2026 10:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hypfs: remove unreachable statement in the
 'hypfs_get_entry_rel()'
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Juergen Gross <jgross@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <341811ced2943fb79d0235c27781c564c7bdaf02.1775749146.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1776327285-AE573C48-5BD032FD/0/0
X-purgate-type: clean
X-purgate-size: 631
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[10];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ASN_FAIL(0.00)[120.175.237.192.asn.rspamd.com:server fail];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 8A88840B66D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 17:55, Dmytro Prokopchuk1 wrote:
> --- a/xen/common/hypfs.c
> +++ b/xen/common/hypfs.c
> @@ -347,8 +347,6 @@ static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
>          path = end + 1;
>          dir = container_of(entry, struct hypfs_entry_dir, e);
>      }
> -
> -    return ERR_PTR(-ENOENT);
>  }

How certain are we that no supported compiler in any mode of compilation might
issue a diagnostic for the then missing "return" at the end of a function
returning non-void? Imo we might be better off adding ASSERT_UNREACHABLE() and
keeping the "return" that's there.

Jan

