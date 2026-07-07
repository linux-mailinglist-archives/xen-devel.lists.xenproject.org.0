Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mgoOA5qfTGrbnAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:41:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873E7180D6
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 08:41:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=TqHyQAbL;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1355939.1610610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzUd-0006xY-W7; Tue, 07 Jul 2026 06:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355939.1610610; Tue, 07 Jul 2026 06:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wgzUd-0006vy-Su; Tue, 07 Jul 2026 06:41:19 +0000
Received: by outflank-mailman (input) for mailman id 1355939;
 Tue, 07 Jul 2026 06:41:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wgzUc-0006vr-Oe
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 06:41:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wgzUb-00CPL7-Sj
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:41:17 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9f8c-2eae-0a2a0a5409dd-0a2a4507ca38-4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:41:17 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4c9f8d-9c8e-0a2a45070019-d155dd29c802-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 08:41:17 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-475417f010dso2049192f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 23:41:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e3e2702sm31756806f8f.9.2026.07.06.23.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 23:41:16 -0700 (PDT)
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
        d=suse.com; s=google; t=1783406477; x=1784011277; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=slwjMIwuvJZ5o/P1hxggnrFkgok2n8+B6q7W7X5ATv8=;
        b=TqHyQAbLE75vTRMqZPwWmAa2rTgkyipjr1+szDmbeFuCk96aeuSPD47NnaOf3UDuCA
         zEibtBZxrtEaKRc3HhBAcsyFbY8EPBQTwCo4T6kNAk+Y8VuHJ8HrRPw8whCDYKo5Hphy
         fgT2a+Ck3Shpx7kVFkegPQ66y5CstPHGFc+OMjZs6qYE9IvZWFxj8OonNNp/CAYx41u2
         EaVXxjcZMMoIiCrPQNiQ8n4dFYqt1vkc+fb75kKg/PqBKjndROuKhpAPR/10fYcu04/B
         ARgyLKB9u7XXNg8KTmc5O29XT+e3THxWTMtHto5mv2A4aHbLAU+6wmPwVmSIs5HU42+F
         dIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783406477; x=1784011277;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slwjMIwuvJZ5o/P1hxggnrFkgok2n8+B6q7W7X5ATv8=;
        b=DPEbv2Ygx9fw7lvlkdEgOKrUto/5B+DAEQr6wXQzaFM0K9tyvbEpTGfQNmDGLuceTm
         itFHzPovInrmxVfTnpvDoYHq7jWkPIwxoRYTbzd5KHOVYrg3UO+afHXdvxVjoU4dTQA6
         yGjpZQthFo/VjMUcCPvk8q0AhEwITQRMLPh62YZS6yOTESGp4ip1b6FUr19OulxhlAp6
         aYnOskv3/0eikWxsnWS5KYLyS0IHmRdF2GP8RCWfYQBOCYTecDFxQkLmtDjT0VOnJtvv
         uGcwhiWtftg2fEMTDR2sn1CO4lYP1dp3uAKui2uD548kUdHvGxbgD2Q2MgFNxQg5Byg7
         uMUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqUYFjRilyKyEXEn6W4TTPubmCz5Az3lBBm8SvZ6kbHMOhF7/vdV1Bs/xTDQdKgOaEW8ZdSniPtvwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM0inJP496A89RwvCUSirTAksoCtVVEPJ19AkWVaciFEybplMT
	hx4Yoe/9hLKifLpw2Bg21QsRnxKjxPSvw+tNveAg6punxsxq2VkYavQ4UdRjljbFRw==
X-Gm-Gg: AfdE7cnwqN+hkrvFwWSUny+tOOfp8gVbMlhyMGltJiTWcvLps/3VK7n1mg0h+jRkuc0
	g/AMMKu46LJdZIfYaXIZ+qAigtV0VC2+kpR1NPdE2yVUrpXUNVXgW45vPVvYu4KVgHtnHbizgai
	QSer/F3e3hE0WnJYjBK4sMpEBKkQkrb0NlQzWLKZlEuyB0buX9Cfoq1VmLqB2oliyeSv8rLdxTc
	0YBQ+XIRRDEV16SwvqpyPpiO4Nmx3ff12hIC5qp0TMJn+3KU/1QVObVNiiGLs+ptga/A+q+dEsP
	gi/rxcZEqUd3j4JEfOXvSGCrTjJGkvEa6tirImcmbwndd9iwOKVeVCjOmw18MIOW3GVQse8LF61
	SwNGL4mGrexzs80dCvRCR7Sno3EwQw9gXwRf/Ne74KptoWxy+M0Q8+it2FVq3pRg3G7XtqkpEQt
	cewvPmx1zHEixRcc7CIW5g2kzQyutGBH7+0ZCYCw7HbbXYLdrhb66XeJlAPizzWcvJb/T8AIqLt
	N7l
X-Received: by 2002:adf:fc4d:0:b0:46e:8226:96a8 with SMTP id ffacd0b85a97d-47de667671fmr2970286f8f.17.1783406477300;
        Mon, 06 Jul 2026 23:41:17 -0700 (PDT)
Message-ID: <9623dfbc-d953-4abf-bba9-5a275af4c02d@suse.com>
Date: Tue, 7 Jul 2026 08:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Fix typo in comment (indicies -> indices)
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260706163750.445797-1-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260706163750.445797-1-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1783406477-7D52025E-05534CFC/0/0
X-purgate-type: clean
X-purgate-size: 827
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5873E7180D6

On 06.07.2026 18:37, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, I question such a change to be worthwhile the overhead. If this
was a widespread issue, sure. If there were many typos that are being
corrected in one go, perhaps. But otherwise best to correct when the
comment (or at least adjacent code) needs touching anyway.

Jan

> --- a/xen/arch/x86/traps-setup.c
> +++ b/xen/arch/x86/traps-setup.c
> @@ -245,7 +245,7 @@ static void __init init_ler(void)
>  
>      /*
>       * Intel Pentium 4 is the only known CPU to not use the architectural MSR
> -     * indicies.
> +     * indices.
>       */
>      switch ( boot_cpu_data.vendor )
>      {


