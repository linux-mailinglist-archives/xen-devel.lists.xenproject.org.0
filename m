Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP8PETxky2kUHQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:05:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD173645BC
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 08:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268479.1557743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7SDC-0004ll-6I; Tue, 31 Mar 2026 06:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268479.1557743; Tue, 31 Mar 2026 06:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7SDC-0004kG-2R; Tue, 31 Mar 2026 06:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1268479;
 Tue, 31 Mar 2026 06:04:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7SDB-0004jB-6M
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 06:04:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7SD9-005yWs-Ot
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:04:23 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb63db-bab6-0a2a0a5309dd-0a2a4509acf6-28
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:04:23 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb63e7-e484-0a2a45090019-d1558031d54c-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 08:04:23 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fb112c09so49262645e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 23:04:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887a630922sm23957315e9.0.2026.03.30.23.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 23:04:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1774937063; x=1775541863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fjtgZ5sveKE9p5oWiQH4gh9W7PlvjIx93un87WwFBoo=;
        b=E6nQzmJNrrGd/nrLd08AthtNJ7BnMZ460k15lyxzgyCoR1Sf+0OzeHOPtGUyAMm0uE
         QN/Neo/umQ2ShEVraPfo+9Tv68sy0J+3YjvoyEz3NQUsGgS5tlIk+rPdCjXMQR+buVPw
         lCWFTVtwShk7bLB9rPnez6dVIuZhB69e0RLi0YOWqcIVdAqPYLXJebbNnPCzFX8HS3gq
         b3Nd+nzQQFHybyQwlhlDCL1L8+eyRkS3UipN/LLCbTT2eS38uiTPpIyivZ9Y+V4EdOwI
         jiaNqxg1Iot3j05vHxFOqPPXnoS1caC1ZId8eTIpDta/fxgZQH8mo2Uarb4Lz0hV2qGK
         CMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774937063; x=1775541863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjtgZ5sveKE9p5oWiQH4gh9W7PlvjIx93un87WwFBoo=;
        b=q9M254MBLXJ67E03qPoVPwmuWcF7g7FeHC4gzjSUdnem5JPuWOtNLTxATtzRxTf5a/
         p7uwCPtJeIXRgbPRwx79ztgG/pudpHXBTAJa+Sb76BBel8izdcFTl8ToprHd1ASHsIGf
         wOXqehvvr98EryPPegQGEBGJiERz8vq94LJ5al990ecl678ehXsMNcMSEWSsxL5zVGGr
         1CiZRSxYnWtlo1zQv0K140aygsQG9VQwIqGVPIgt/0YDgA2XGI3Y3RfgLUoUCag8GtuX
         1FUysVzrZgQeUrKCvck3RY2ShldSni3JJchYte6Agx1viHQzGvzD1d87WHYngb0X1g9/
         EIFA==
X-Forwarded-Encrypted: i=1; AJvYcCWi2XTt1hILuKWjqpOSEo6zv2tHMQ+8P+OJZWhgg9JxXMoHEQY7jMgJGgnP0I9vg3Gix3YR0lFxfq0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyE9QeFbzy/uHe45wrHIeITht38mcUpPrqYReh9cF3yNlehU5rJ
	d1XzHvkqbb/B1VOytZ5m7B39L8HA0FHBylEklCcZvFxSeLjMQj2b33xX//LQSp4i9g==
X-Gm-Gg: ATEYQzwRcwjSzYC+aG6dPGZ66Er7N9NYyOEHFt8LfdznfbUuVATZsAMe/kAqJ360viR
	Lq3ve02SLbJGOzOYdNmIMasEuYt9Oq7qHMteTa0mLyZj92MpGXV6q5H50m45bYyzg40XSZe8e0x
	fF3KuPNWDyunVfDIibmt+4RF9ZBmy1gPRbAVf9450xwWaIXRaCz96WSzPUz+rYUGF6X6/OhU4Vv
	ZVbaZXYKzXYeVr4S5aiKPAcezAZUs9PJFSlekyhZ5xaS7XpV2u3/U83s5HyqXQQnxdlIj0O5d2P
	bJWI+n9OPW0fxTRL8gpKvdU7eDeZUMKSdiDC2/ktl3MMQO5dnRCSdTxCMeXT41LeDc/yTRL/nLd
	jmvzFZE5pezDqLAphTxuWd3jMsL1Ox9dFk4OPKUM6EJyr56Ko2SK679YZtCzMVKN6WWI7mJ3e7R
	6u+1P52fDgn+IV47FXU18jPXaXZwieYdexrlYeBYNycnz0ts9ZSJEVzvxBHduKfpex2+m6VCNeo
	BAgU/Q6Pdt4Ps4=
X-Received: by 2002:a05:600c:1d1e:b0:486:fe46:b647 with SMTP id 5b1f17b1804b1-48727f00d8fmr248355015e9.10.1774937062813;
        Mon, 30 Mar 2026 23:04:22 -0700 (PDT)
Message-ID: <0664a324-a0c8-43b5-a92f-81bda9803ede@suse.com>
Date: Tue, 31 Mar 2026 08:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xenstored: remove unneeded check in create_node()
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, Anthony PERARD
 <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260330163153.676464-1-jgross@suse.com>
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
In-Reply-To: <20260330163153.676464-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774937063-5B0A9A73-926D90C7/0/0
X-purgate-type: clean
X-purgate-size: 797
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9FD173645BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 18:31, Juergen Gross wrote:
> create_node() is called only for issued xenstore commands. This means
> that the "conn" parameter is never NULL.
> 
> Remove checking whether "conn" is not NULL.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Should Coverity ID 1690859 perhaps be mentioned, as presumably addressed
by this? (If it is addressed by the change, the question of possibly
backporting would then also arise.)

Jan

> --- a/tools/xenstored/core.c
> +++ b/tools/xenstored/core.c
> @@ -1524,7 +1524,7 @@ static struct node *create_node(struct connection *conn, const void *ctx,
>  	if (!node)
>  		return NULL;
>  
> -	if (conn && conn->transaction)
> +	if (conn->transaction)
>  		ta_node_created(conn->transaction);
>  
>  	node->data = data;


