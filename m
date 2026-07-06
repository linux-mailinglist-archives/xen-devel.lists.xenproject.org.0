Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CzjMOUzSS2qQawEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:05:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E53712FF6
	for <lists+xen-devel@lfdr.de>; Mon, 06 Jul 2026 18:05:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=XJVGBC8S;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355736.1610511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglou-0004ly-6N; Mon, 06 Jul 2026 16:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355736.1610511; Mon, 06 Jul 2026 16:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wglou-0004jq-3d; Mon, 06 Jul 2026 16:05:20 +0000
Received: by outflank-mailman (input) for mailman id 1355736;
 Mon, 06 Jul 2026 16:05:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wglos-0004jk-H7
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 16:05:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wglor-00AeWW-Te
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 18:05:17 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4bd22e-e002-0a2a0a5209dd-0a2a450b8162-18
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:05:17 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4bd23d-ac48-0a2a450b0019-d155dd2bb463-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 18:05:17 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so2698468f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 09:05:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm369530015e9.12.2026.07.06.09.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 09:05:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1783353917; x=1783958717; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0NyIbcnKYzPvUZy6YEDC90XztMoJYC6r0R0CbBatUiw=;
        b=XJVGBC8SuSDHU90qsrnc9EAug3yc6jtcj/0tUGAYHB5t5i29Yf/i971Y8WqV3L7snd
         Efz+8cpkYP8rp5mw4T+g1sU/yaDLfyNJYmdJD1LdKXrOZ0jBA86lKgwdu5atz8ixOat1
         dGzlZtAQocjzt4a1RON6AUUrp9IBfthT4T/7nUniI40EJMpbQwdqCmmmX9FogBPjHGZg
         DQHnrbzl4u1yRgv4ML2cqMCxFU/bNb6sByvvktyekA5zCdAtcW4/jQ2uIuc53XafzWTF
         46qGsxFZGybMRYUQt259xZRu92CqeRA81hYFbNwS3kk5ek0IJ2LAcwphPgey0PHWtyhp
         CUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353917; x=1783958717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NyIbcnKYzPvUZy6YEDC90XztMoJYC6r0R0CbBatUiw=;
        b=iGrlya3edNEe1/Cdc00jco6Tq0w5kt0TuatTdsyVFv/tvOIYSJLO6MYhwFJCFtSp2I
         fDFxPjq2qO6i73spClZsKN4S/atFkuAjcN+t9TlfIxqe5JCk8D1E/+XuWEXE1Ace+kGu
         eu7ud+2T0jZfXNzCpkDH7E/Ujf8FQpW7+ey3ezTiskzGrIqPSQyloznBx8B2+22XZymP
         mLGGLODqLP+BAHfUuYZo1ot3jQuOSfkKGn2PYy27F+lGjlZKJj3D5hxYeaTxDna7OEiZ
         8vbLq64DWQ+5VjSSDZ4VjVWb2XvTdcEllwb+euj3y9t5vRqndWBjTOSzDF7eYA56zSx8
         5tYw==
X-Forwarded-Encrypted: i=1; AHgh+RoMAbYoRESQZayv3HfiPVDg36vxllQWjI+ME1VuJbNd5tAKG3vQ6EX+7al8wn4VOPuQcori/bc0Q2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNK7wek71TZZOzC0KvjVgT1OKsnbVCRlui56dxjtgoOBSYyQRq
	QlqOiNVt5eMyOB20MrmUL6AP30zqK15WOScFRMSrhCW1r8uE0NVwQC9oJRLm0tHGwA==
X-Gm-Gg: AfdE7ckky+vLPH7TpAuHFz0oLpaF2DZOcG6jo/I9JDk0Cxbu4DqqZNQgQcXCNyVpsdw
	u/gqYjXCWuCKaR03Hwpk9JWUGSfONvY5acDnxYBRLQjqo/Vasdg8F5V1VledvK7KK178Wd5tn+/
	xkIFnvOfAxAMRi0fZaTrymMRzfTGuT/FXgh89fndt+JJQ1U2iIq0IuWHf55NpOy8/BJ/uxh+Hsh
	0aI4HmZw4Q4K0UcTB54yCx8wXYQkhT1+x9VcRQIzFredZWJKT7jo4XbAve272jBZLT3Fmpnb5pi
	ivcvnCUDPpc8xosStnBEkEC9wePLT0ErMu78jKGWzeMGGgAs5omvKCbiMVxraCXEL0WD7XumG29
	+bMO96TNSp+rG2Of1t1xEQJ1S9Vs6ngHeyfFrdrUBwlsjHPWt2dQzKhVbCPVVoodeWaGA+pcSPG
	iG5A7qNRRkIJELchnM9PV5diP6U1HtpriP9u1jqf6/AyOZK7jnluh2F6iCx7O13IVw7fhWttEzq
	pYY
X-Received: by 2002:a05:600c:620b:b0:493:c984:db9c with SMTP id 5b1f17b1804b1-493df062ba9mr12133255e9.2.1783353913143;
        Mon, 06 Jul 2026 09:05:13 -0700 (PDT)
Message-ID: <89ec62aa-dbcd-496c-8d0b-28bc395d63cf@suse.com>
Date: Mon, 6 Jul 2026 18:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/26] xen/riscv: rename enum intc_version to
 intc_variant
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1783331040.git.oleksii.kurochko@gmail.com>
 <d8a27698b82abc2044ae33887af8132aa749c1f2.1783331040.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d8a27698b82abc2044ae33887af8132aa749c1f2.1783331040.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1783353917-3BB30220-53EF3790/10/73395122804
X-purgate-type: spam
X-purgate-size: 500
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49E53712FF6

On 06.07.2026 17:57, Oleksii Kurochko wrote:
> Rename the enum to intc_variant and the structure member from hw_version
> to hw_variant to better reflect that these values select between
> different controller variants, not versions of the same one.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Didn't you say you'd drop this if already committed by the posting of v5?

Jan

