Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2At3GNfQu2k4owIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:32:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF982C984E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 11:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256926.1551390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Ag6-0005BX-KX; Thu, 19 Mar 2026 10:32:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256926.1551390; Thu, 19 Mar 2026 10:32:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3Ag6-0005A5-Hj; Thu, 19 Mar 2026 10:32:34 +0000
Received: by outflank-mailman (input) for mailman id 1256926;
 Thu, 19 Mar 2026 10:32:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3Ag4-00059x-HY
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 10:32:32 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5cc244a-237e-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 11:32:15 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-439b94a19fdso629338f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 03:32:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51892273sm12617905f8f.19.2026.03.19.03.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 03:32:13 -0700 (PDT)
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
X-Inumbo-ID: e5cc244a-237e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773916335; x=1774521135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5VAcHaLINKkbo7TpgOVCHEQc5j00POVMOlPE9q9U70=;
        b=DoZAzlQsxHEZnuZh7L7We0l56ZR+No8/Tn9MwSJERxi6GH5Xc84R/bhwQZzTNFdBgI
         MtJvpgetdobWZhwyGJdyXsomih3QyRJCtMUpaG/RnYETshR0oKlSjkUPxKYzVQvD3oK1
         +e1sQHymIWgHu/m09zlddAldjB/hUkThd8HPhPqIFJrWW6/V5iFWlI+opBNcxgh8pmZK
         sOuMYPJ6qnY2oiNC04nBrGDVZ4DwNfBJu60p1zG8qg2wMYUCR4dFbPwIdddbwEY8+Zpn
         wEUR70UIVeFigz58X5h1e1zirD+dC2VT8diQ8wsrFAjxSCqqsAPLG4Z5IdyNeKPXdus8
         Wn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773916335; x=1774521135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5VAcHaLINKkbo7TpgOVCHEQc5j00POVMOlPE9q9U70=;
        b=cmeMxqQWBHp/DYo/1sSsXI28NYCbpPfEDqKDFvoBvTbzd3GOV5QPDgMmMGOzuGvlBh
         xc/QLH6pVQs1h0Z0O7Vrii9/nV1Pq4lRUakxN+udR85zAjCzAbNJz7Yo1c9Ao3dRwjGx
         JB2D2gyQOgRP+FRxqHHZHqrwNe4cnvC4+kRoEoXnP+IfC/9NXufDYFo9ySXoXsH32YOl
         TnmIXzu0jKyu+tixvhRt2giLLgleBsgOpbkGJJ+CoxfnV2jLAjpfyziXF7SzFGHLPn8C
         p2+9nHawlccXg3AR0jhdfoxesyzGJE9ShB8raKk76iym3JT6mAnVmZYJ0va4tn2kZX94
         99fA==
X-Forwarded-Encrypted: i=1; AJvYcCVR8leWGs0vzsm/bZfTQpH32YOCPBDHz3B81JueFkc+pM3vuqnNElPTcTG10jzLYjubu059mkko3RQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyieLZGdMFpBMCg9lslMJa4fUHiQOzS+uxF4Y3K3oW1p5VJ45Bk
	e7opv2RopuB4d6UgWSNMx1zCXvNvoYneUJlcMHmxa5Y0MnFRXRoQyx2CQxJmMuaHrQ==
X-Gm-Gg: ATEYQzxRzGE6unn1pfwyvq0g/GjSYdBWcOPcPBGT7vgRzZ3VWfA6sDkCadmrvsHzdMp
	jW049LZuZB8Kn9DB5pG7FuQDNAA6GVU7v+5uN03WUIWLPkoigs8LYJ0N/GKmvjI47BGmHRfcagL
	aEUlwqDhAMGjDjAdbsCBG5vQFETTD4tEwdGnTQ81BW/FbawfFJAKzwom8EGX52GhQe3I+cG1S1b
	o5QkC5x3lCFyX82PBUI0yhhvZAK6nAVDkXsZk0CpcffaKUIEE4lObjYHfR5sBunHgyLwB3gwT8h
	mrBizzkxioHeSjgKU1IT91+aomrVDUvFf8v2oaDQhpvSw6D+h3M632jGNeQza5o0BRya+h4QByU
	vhvAZFJGvk2B94X9Hy8qeptMZflduwfWymXvPnlWZ07ZC0/l8fE5t7HyhOjzZJ7B47iSlqWULx2
	bqVKL5zb59nFnFsdbg3zAB04ww/NJ0nDfRjf/oiLuG5jFNTLsaRq0fTr3If1B1ukNi7IaFqKL+L
	mK7HWsN40ggrGU=
X-Received: by 2002:a05:6000:288a:b0:43b:41b5:e023 with SMTP id ffacd0b85a97d-43b527a50dbmr12461039f8f.1.1773916334208;
        Thu, 19 Mar 2026 03:32:14 -0700 (PDT)
Message-ID: <c37859f7-bac6-4394-ae12-83e054a1743e@suse.com>
Date: Thu, 19 Mar 2026 11:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: make shutdown state explicit
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, xen-devel@lists.xenproject.org
References: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
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
In-Reply-To: <2004584dbbe393c9de4b3231bf91a24f6e5de5de.1773875416.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:paul@xen.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tim@xen.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,epam.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BFF982C984E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 00:25, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The domain shutdown flow currently overloads is_shutting_down and
> is_shut_down to represent multiple phases of the shutdown lifecycle,
> while some users treat is_shutting_down as a broader "domain is no
> longer normal" condition.
> 
> Make the shutdown lifecycle explicit by introducing
> enum domain_shutdown_state and converting the existing users to helper
> predicates describing whether shutdown is in progress, complete, or
> active.

Mind me asking what the distinction is between "active" and "in progress"?
They feel like synonyms to me. To me "is shutting down" vs "was shut down"
would be the clearer distinction (i.e. domain_shutting_down() and
domain_shut_down() or some such, albeit for the latter I could also live
with domain_shutdown_complete() as you have it, or maybe slightly less
ambiguously domain_shutdown_completed()). Yet then I'm not a native
speaker.

Further, I can't quite derive upon what criteria you chose whether
->is_shutting_down checks are to be converted to domain_shutdown_active()
vs domain_shutdown_in_progress(). This could do with writing down. (It
also might be easier with the suggested alternative naming.)

> @@ -1444,9 +1458,17 @@ void domain_resume(struct domain *d)
>          v->paused_for_shutdown = 0;
>      }
>  
> +out_unlock:

Nit (style): Labels indented by at least one blank please.

Jan

