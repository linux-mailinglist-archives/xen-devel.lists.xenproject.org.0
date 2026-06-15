Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 49XMJdYOMGqMMgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:40:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073FD687444
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:40:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=B6J6wjfL;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338333.1599355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8TK-0000zc-D0; Mon, 15 Jun 2026 14:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338333.1599355; Mon, 15 Jun 2026 14:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ8TK-0000xt-AH; Mon, 15 Jun 2026 14:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1338333;
 Mon, 15 Jun 2026 14:39:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ8TI-0000xn-UO
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:39:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ8TH-006Yni-Ol
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:39:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300e9a-5cb7-0a2a0a5109dd-0a2a450bd286-2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:39:24 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a300e9c-212f-0a2a450b0019-d155dd2fbdeb-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:39:24 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso1823620f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:39:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2cd6c2sm35151354f8f.30.2026.06.15.07.39.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:39:23 -0700 (PDT)
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
        d=suse.com; s=google; t=1781534364; x=1782139164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jAFoDPIzdLSenYNKrvBMxLxR7ZJSo+vbh/DtyZLMQMk=;
        b=B6J6wjfLhXtVJpTOULNvQ2s6PQpEPtdDHGoUg4cHQc2/SeRCiahKHnfYoih1PtmWGF
         K/Q1hH805nsR4raLsSBCfemX9qNLOcNF2wrnWkx9KoC7xNF9Mje4jS3C94DvIdkMfFeo
         Ls8T55Nal75sfDheIiYDR8TWjROi+FQE9kB7e8y7CFza7fcnpstQpiIxqdxIMTFaVe18
         9/q+c42zQXTP3tekVQWaA+u1Jts7EKmgIBXodKdMfgW9XrHH9EMQve9DAZ7ze3ssrvV1
         mys7y4S2pMu5LYx4tb8qN3QI/u99u3a3f68uQrInk5utXW8gLiyxrJV11hyUR6IekcQl
         1iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534364; x=1782139164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAFoDPIzdLSenYNKrvBMxLxR7ZJSo+vbh/DtyZLMQMk=;
        b=rnrE2fQd6BfsOh65ObhXSOCZU4koB1VlE7WSHmLqYQd6KotoWZc6LyaXh9Epo4NDMa
         cAfCGuORFmKpAAlN89uYJkFtZWTrx3cBK3oQr/BIRAmhq8oLStjQPneeUjKhwfIstnnu
         bNBXJ9hoLS4OrDbIDcBwAjFhkq+XBwhsnI8uO0HuEkptPo3nKkMWT7LA8RGTsk4CfbDZ
         1NLOdMUNoOjpsx85SMYtiEtgG2wZa9eTXPHpg1kMUVzTC+gfh+PGNPCTIHOiYQHoW64g
         503lnT5UsGJqEI/mPNt0UR5amTjT0p8tGOKPz0z8ODGxB+gNfFk+LeTek1Fl7zeadvhl
         wT8w==
X-Forwarded-Encrypted: i=1; AFNElJ+mWo9iVniylgKx+YZnuE23pO6MqVQYf19SEsWqC9bluupAuAp6mxVlxWBfRNj7/J/2b/1fLBH57ns=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYR7HTYZhpO+VUhpCdZV/WYvRl8yF6iTl9ffh9N+rpq6gWHDwA
	pvG/eJLysWcGheRQq+FUZpFQRb9UJT0fjrxbptJaZbAXlEtKemJ/NS+7OKQNeVcCzA==
X-Gm-Gg: Acq92OHoOQpHcifMekoy/F895ZZClQEMc3VxaEYJWToPnmwvxzNw7q6WzCF0NgSK9rG
	kEWXq31DnK65eQwKJ/cuc3WB+9JNQ0l7eTarA3xfdEppq3gWjRTmbUjd5KOiviKpP1SqztOiTOq
	5hb9yCC9CVj3KFK+Aa3TwxH9089D5nVQ1ELdy34vLjoDh9ZcnbPa1nmN10BgfMp2cEP8wSdqoca
	4FVoB4tw5r6beiLSa/1M6nCg7d/C1LYFigrwSOHZOJr4tUAA4JWTGnj6bLguA8T3mJQzzX8JVv0
	Pa1z7yDSoNYTxzNQJWZRAf+dArqPrTIU3136lwYpjgBLJC3EuxRO2yyM6KqvLjxklAvsS84ESFz
	3vLIR1jnlG7NlAEHVG8D7E12HAaId7Cq6d20LDADBDKpDE/nYcHFaMOXw905WHsgdyh4e/YiTac
	FtvAuOk/RPWY1E9NAD2YV8G5CefCc3UA0Ii3NBl2j00u1Jx90e67i92tIaSdbG3a8FUaO0cHnc9
	SZRJs85EWNYuPg=
X-Received: by 2002:a05:6000:2683:b0:43d:1c4a:37c with SMTP id ffacd0b85a97d-4606da5a4bamr21007148f8f.4.1781534364323;
        Mon, 15 Jun 2026 07:39:24 -0700 (PDT)
Message-ID: <75133630-97f1-41b2-889c-9d43bbe767c7@suse.com>
Date: Mon, 15 Jun 2026 16:39:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <accc9b61dc46281289a303155653d48d5fde2084.1780643643.git.mykola_kvach@epam.com>
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
In-Reply-To: <accc9b61dc46281289a303155653d48d5fde2084.1780643643.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781534364-21183F3B-DCFDA23D/0/0
X-purgate-type: clean
X-purgate-size: 1105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,epam.com:email];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073FD687444

On 05.06.2026 09:39, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The shutdown flow currently uses is_shutting_down and is_shut_down to
> represent the domain shutdown lifecycle. The two flags are not mutually
> exclusive: after shutdown completion is_shutting_down remains set until
> domain_resume() clears both flags.
> 
> Replace the two booleans with an enum domain_shutdown_state. Keep
> domain_shutting_down() as the direct replacement for the old
> is_shutting_down flag: it is true once shutdown has been initiated and
> remains true after completion, until domain_resume(). Add
> domain_shutdown_completed() for users that need the final completed
> state.
> 
> This makes the state transition explicit while avoiding a semantic split
> between "in progress" and "completed" at call sites where the old code
> only cared that shutdown had started and had not yet been reset by
> domain_resume().
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


