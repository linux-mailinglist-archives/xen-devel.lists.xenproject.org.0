Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Skl/DWK1O2qcbggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:45:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D63996BD7AE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2026 12:45:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=emc2f40z;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344788.1603832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL75-0005HG-9S; Wed, 24 Jun 2026 10:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344788.1603832; Wed, 24 Jun 2026 10:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcL75-0005FB-5a; Wed, 24 Jun 2026 10:45:47 +0000
Received: by outflank-mailman (input) for mailman id 1344788;
 Wed, 24 Jun 2026 10:45:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcL74-0005EN-1n
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 10:45:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcL73-001VnZ-Ee
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2026 12:45:45 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb54e-e002-0a2a0a5209dd-0a2a4509a15a-38
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:45:45 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3bb558-4999-0a2a45090019-d155802ac57a-3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 12:45:45 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso9520665e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 03:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49261063d6esm29108665e9.2.2026.06.24.03.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 03:45:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1782297944; x=1782902744; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dAuKB2xy7Yv2Fd6V6Usoj59Lmv/gKYJBe63+80Xj9qA=;
        b=emc2f40zbGA3FAgnhdLXgTal2a2xaf0a6rV3bq6rl9TlDRF3urkhShQIgpvmTFs9mt
         oVXXwSp878hbx3TJgZyeggiuERIx44bXfStE84TRT0Sn618XvaLtKgIwMxH3IVOdgk21
         L+mB2bvNwR0u5AXmnxGR5M+SePaC4ic95UJp6uroYDa8J9ydApc3sLjw/wcMI3ArMRRA
         VsdPzxRPnLvueKCmCxshRhHwdtZKdll8yyPOS/eBENDJLinCGvF0gyCOQMnxZ6mEIAS5
         fsNTMyuhmHbvbsJpRjLXCQD8rg1jwU2WyG65JT216JcxvQ8NwLfHZkrMonlHwqMoG4lF
         MJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782297944; x=1782902744;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAuKB2xy7Yv2Fd6V6Usoj59Lmv/gKYJBe63+80Xj9qA=;
        b=SYyyg9RxBXvYaZaKg3WnaPmmcOwlEDpfSFRRXhN0Olfh/zw4q5otjmgd7+96aJc6+R
         +KA5xo3v9JVAtHXzPz9XrAI2ZPpCHPWLrAaFiYlZtwEVYjdWPHdj1RIn36bQS6Ur0rXj
         qfgfA/Qb9GeoZpRX5AnJxnOxuBHLMIEWN7FCIE+Bn8gAzp3w4XuRvs0c/SVQW00L7iz/
         RhPrpppci29sjAmh1ZCTMKXB9xrLVkhMdJ3jSb+HcDI/hGpW+klLdTjNcB5vpotRZiyN
         vh1VY4R+phhZijRogQd6vOD7uyOhtIrJZ+/Xeu2Zo5GDOVKThCyche9UkTJm6TCR/17Y
         ZH6w==
X-Gm-Message-State: AOJu0YxdkzKjH3DlDJ7MoS/w0S8sTLenBczc6f+9+uXgYsp4lur8rTEs
	kw+jojlfJJLc2h++Dz8V8vvA4Fh/YYOPyYiPvjwyqizIaO1CnUg3IgZMgHsOqmw4Vw==
X-Gm-Gg: AfdE7ck/fFlXHdt0JZP/2iqDBjEYldn8vX10FQFf6ONi2/9dcOGu/s+jI1Vizqsc5yc
	YcIIkWDP0ewHHdBgHRNXP7iQytSjs4MFGG7vB48uC3kBsKY2PzYGIwaGAuuO3uT2ZmamuBjrZgT
	QBVAlz2X43IugoWdmWJ9DIehuY8cC00aF/KGU2gRHujnKkpGW3b3QUDCRvdC6FPF9KAZPl/wduO
	cmBi32qQDMUh5YbzRTeVwvcRJzZy7YlhDRXNq029QPARDdn4jECxap2/j5QU0Hf0g5vphEIwCw3
	CiC1ilqtMhc9BwfYtA0yeX0y3bhXK07RzBy1IpwiMjMU76Yfph7+zCmupnfPgD6pfOmhWOxP9L+
	+whw+aqcmDorodNQQ0iApOAax6Dgt9s9BUy8vqaVY9nyvjM6z9q27BqoOdy7At2QxCPhECbhp3u
	4weT41XEfT43xzoOQjuY8oxqj4QXE5Y7Vlb1vqr0sU+w0+Sbml/WCDFMjAVXAge8do2WFknkgwq
	n33
X-Received: by 2002:a05:600d:844f:10b0:492:5e20:3ee9 with SMTP id 5b1f17b1804b1-49260840bbemr29367005e9.6.1782297944506;
        Wed, 24 Jun 2026 03:45:44 -0700 (PDT)
Message-ID: <51e4bad3-251c-4dfd-b487-a760a102a08a@suse.com>
Date: Wed, 24 Jun 2026 12:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: sort obj-<...> list of main Makefile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <fe611607-c4d4-4db0-85a2-445bbec5fc47@suse.com>
 <1e3b36a6-1970-4376-97fa-621899ae2ad4@citrix.com>
 <d2d794a4-dfd3-45c3-b5fe-836d0a0c2244@suse.com>
 <0ccf8786-3460-4500-848c-2f0058c8a269@citrix.com>
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
In-Reply-To: <0ccf8786-3460-4500-848c-2f0058c8a269@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1782297945-F57FC744-3A5CC3CB/0/0
X-purgate-type: clean
X-purgate-size: 1221
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D63996BD7AE

On 24.06.2026 12:40, Andrew Cooper wrote:
> On 24/06/2026 11:37 am, Jan Beulich wrote:
>> On 24.06.2026 11:10, Andrew Cooper wrote:
>>> On 24/06/2026 8:50 am, Jan Beulich wrote:
>>>> x86_emulate.o coming rather late in the list may want considering to make
>>>> an exception for: It takes comparably long to build, and hence it may be
>>>> best if it got scheduled as early as possible in a parallel make.
>>> Move it to the front with a comment saying "Really a subdir, but not
>>> expressed in that way" or something?
>> We have
>>
>> obj-y += x86_emulate/
>>
>> there, so excusing this by what you say would feel somewhat wrong.
> 
> Wait, we've got both that and the higher level x86_emulate.c reaching
> into that subdir?
> 
> Can't we just fix that?  The higher x86_emulate.c is almost empty, and
> lost it's main purpose when you started splitting decode out.

It's emptier for you than for me, as I've put some AMX stuff there which
otherwise would require #ifdef-ary elsewhere. I guess I can see about
moving that and then indeed ...

> That way we no longer have a special case, and no need to excuse it. 
> Subdirs always get entered first.

... try to get to this state.

Jan

