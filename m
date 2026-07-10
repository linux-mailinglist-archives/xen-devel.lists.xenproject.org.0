Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DpE8EKb4UGr+9AIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:50:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB9C73B6CE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 15:50:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=NlVlgy9D;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359384.1612970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBcE-0003JX-RU; Fri, 10 Jul 2026 13:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359384.1612970; Fri, 10 Jul 2026 13:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiBcE-0003Gx-OH; Fri, 10 Jul 2026 13:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1359384;
 Fri, 10 Jul 2026 13:50:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wiBcD-00034y-D7
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 13:50:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiBcC-0076fj-Q7
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:50:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a50f880-5cb7-0a2a0a5109dd-0a2a4509c9a0-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:50:04 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <jbeulich@suse.com>)
 id 6a50f88c-b440-0a2a45090019-d155dd34c0da-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 15:50:04 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-4758b2a9e2aso611696f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 06:50:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm64612322f8f.37.2026.07.10.06.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2026 06:50:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1783691404; x=1784296204; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r26+NBOBwU7YOyCJCnIp2HtD+ClZUs25nbebhmcB+xQ=;
        b=NlVlgy9D8pFJv1GsxijFOzLK2rDN3D0DBViNWeBpdNW0zhzlRunDKlM1Oe0ZbrdIwI
         MutDlR9cUvgtQhtAh6DHQnjqs9OgqGLm5ECGH3UEER7crNk4e63E4DEqVGCt7o0xKA/B
         TkLEGlZWqVPcQVmEF7s2EGDTHTm6NQ3+eYWXq47st3vsBdGLsjolTQvS4cNKtkPZtUwJ
         91fd61ka/Ww5yncsCY8mwq0D7k/MSDYRxxWpi1IIhgPvjxNJ/xasWB+uD10zClSK6WP3
         uPnMCyKInyPgPsSmhUJ6+HL/82fSoUdsfUQStzt8TupzS01CKheBlI2ZrHN3oxMh+lPl
         2ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691404; x=1784296204;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r26+NBOBwU7YOyCJCnIp2HtD+ClZUs25nbebhmcB+xQ=;
        b=NIQ+G31I9VdLJP+EAdGtuS0JbgA1FFrNFko8UHEtNwODcMp0gmCozE8Lbk5ETbhSqU
         eRFQ3vvR85f5Av6IgwsJRAL3gmAYlUznELciGDTcAduSRP3LVJDbA9Ngvt/2yDG59okX
         6yAiruvt0IPpc9W73YAMSMMBwDATCm0J4ll2ghrRNo22zQKpb9QOGlk3YBq5uA9sC9SM
         4CNX8QTRtMh7q+STNUoj14uYbx8uS306+Ie6g/zAlvvmj3M8gb4N0azdRWuwmFAGyq2x
         jKStF4jdD9VZs5yg0C8sR+F3Bd1fHKOer2xicXCac4dmy4IpLmZe+12z0ESHCHgf8hbl
         IHwg==
X-Forwarded-Encrypted: i=1; AHgh+RolzkqkPKLzQml9rAr7zvXyiNP3aD5j0rEjwie1hzAcRqFSyXHVH14dZBKGn7e03OMBKvwgNpVw7mA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/8lErHjhneIqa04nHRI8vqTc61F1Hl9sKdxhqvpK082givMYX
	z6fKcBrxNsuItz4TGwtpNPE2xaKYMC5tTffDLGYhmx2+pdlcjwxRhNVso8GZs7c7eg==
X-Gm-Gg: AfdE7cm4zB+MLvdOp3lUpPR3VBmoG1O6lj25+HQxzZu6WaoxXLhBF6X0m9m3SSbXaGU
	XbcQrQ0Rlyoz3ye1t9NMUY5hpDvvm+9UUMgJmyS++cV2EA13RcmDA1Fg0P+5qSVW694rNRAaSLw
	i2nvNqHgAAvUQoFDHTdMXFvfq4Sqv/Ypoan361V3NT7L/kQFyEm194sDgGed/paDvZHvavyQnEy
	z3Nj/p2sUF52SpYIYwUYEGiS64EMGu6tW9xNr3whfEY2bNgUd+QAQIMxpbXeaQKmpCIOhlCMqPe
	jIVWXRS7HecBxQlPtSfXAnQwtBA4lK4cmizAjV6YmE9+TVpjfcpWcGJmAg7kuFha/aL9WybGyWL
	QFSFA/mvkUhA59AQjOJ6kmkb3Fiy9Sce3D9eEvzd9ysgaW0m2wivpK6SgrxGUfirAtbmw2Z7U1o
	A4bGXTHovmx/zzAMyJFm1Fp31GSiBvIfx5oFF9xIdQ1XabWviUT9bpvd5YtSfWHI4XlTlqNbPMC
	Esu
X-Received: by 2002:a05:6000:220f:b0:475:cb71:a344 with SMTP id ffacd0b85a97d-47df075e31amr12998000f8f.37.1783691404136;
        Fri, 10 Jul 2026 06:50:04 -0700 (PDT)
Message-ID: <05743e4a-f71c-4883-9e5f-e91e749061e0@suse.com>
Date: Fri, 10 Jul 2026 15:50:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <6948fb2823ffa41cf2eabbd87952b236e4f379bf.1783085655.git.oleksii.kurochko@gmail.com>
 <2853c8c1-ea7f-46ba-ac65-a7473e9d3689@suse.com>
 <b1c039e3-d955-4708-a805-e136bc73b6f5@gmail.com>
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
In-Reply-To: <b1c039e3-d955-4708-a805-e136bc73b6f5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783691404-5ED6FA0B-BBF0E1B1/0/0
X-purgate-type: clean
X-purgate-size: 2065
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 7FB9C73B6CE

On 10.07.2026 15:31, Oleksii Kurochko wrote:
> On 7/8/26 12:52 PM, Jan Beulich wrote:
>>> +#ifndef CONFIG_HAS_SHARED_INFO
>>> +/*
>>> + * Placeholder ops for domains with neither a shared_info page nor (yet)
>>> + * a FIFO control block.  None of these are ever reachable in practice;
>>> + * they only exist to keep d->evtchn_port_ops non-NULL.
>>> + */
>>> +static void cf_check evtchn_none_set_pending(
>>> +    struct vcpu *v, struct evtchn *evtchn) {}
>>> +static void cf_check evtchn_none_noop(
>>> +    struct domain *d, struct evtchn *evtchn) {}
>>> +static bool cf_check evtchn_none_false(
>>> +    const struct domain *d, const struct evtchn *evtchn) { return false; }
>>> +static void cf_check evtchn_none_print_state(
>>> +    struct domain *d, const struct evtchn *evtchn) {}
>>> +
>>> +static const struct evtchn_port_ops evtchn_port_ops_none = {
>>> +    .set_pending   = evtchn_none_set_pending,
>>> +    .clear_pending = evtchn_none_noop,
>>> +    .unmask        = evtchn_none_noop,
>>> +    .is_pending    = evtchn_none_false,
>>> +    .is_masked     = evtchn_none_false,
>>> +    .print_state   = evtchn_none_print_state,
>>> +};
>>> +
>>> +void evtchn_none_init(struct domain *d)
>>> +{
>>> +    d->evtchn_port_ops = &evtchn_port_ops_none;
>>> +}
>>> +#endif /* !CONFIG_HAS_SHARED_INFO */
>> ... we wondering whether any of this is needed when FIFO is available. In
>> v4 all that was noticed was that SHARED_INFO=n together with EVTCHN_FIFO=n
>> is a problem. And having fewer cf_check functions in the build is always a
>> win (I think).
> 
> I thought an opposite that it is good to have cf_check when pointer to 
> function is used. So why we have to make an exception in this case?

I didn't ask to drop the cf_check (and you can't really as long as these
functions may be used by x86). I asked to limit the number of them we have
(in a particular configuration) as much as possible. I.e. I was merely
trying to explain why it is relevant to have the #if around this as tight
as possible.

Jan

