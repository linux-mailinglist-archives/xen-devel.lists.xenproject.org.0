Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHV/JGo152mg5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:29:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F8438285
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288579.1568837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Td-0002Mq-Pj; Tue, 21 Apr 2026 08:29:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288579.1568837; Tue, 21 Apr 2026 08:29:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Td-0002KY-Mx; Tue, 21 Apr 2026 08:29:01 +0000
Received: by outflank-mailman (input) for mailman id 1288579;
 Tue, 21 Apr 2026 08:29:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6Tc-0002KS-KW
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:29:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6Tc-00AC0U-1G
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:29:00 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e73545-2eae-0a2a0a5409dd-0a2a4501d61c-18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:28:59 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e7354b-c1f2-0a2a45010019-d155dd2fd113-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:28:59 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so4218328f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:28:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4412150a092sm321039f8f.23.2026.04.21.01.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:28:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1776760139; x=1777364939; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=85i4+D4XuG2N74nELiTnewZVfDe3DHqAOGZqYhoI43o=;
        b=CB7x8yb9XBcu5JhrcNGbhMW/EAdsl89IjUiAHgj6pwgdIV+1kTltQJjWnoXbVSfSw3
         qm2rs+ahV+UoP7ECFl1sV/sd61QlRoIl/YBgLc7pwe7sf48mGbJP/xGis95bHIwSRtFZ
         weq68Yrdm1AWE/AaMl7cl28uFlia5i3l39SIAXPGO/DEKAy40IuSiS3ABo7JSpHpyMYj
         xUiD4+2l3GjG7xIG21/vKF2p71y3zBKIJ1FTDGSqFrQoHWDOvhAgQ1d+ZdMR06TYunsg
         UshlO4IYMqr43pt9M/oPr5z8oKo4iIHX8+97xeZJHxrFl9KHjoxo7T3Isc6KK0blyc0x
         GPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760139; x=1777364939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85i4+D4XuG2N74nELiTnewZVfDe3DHqAOGZqYhoI43o=;
        b=BvfXEpntO22u/R5nipzDAAPHHBcYJ9gtladX6PR/VHkWDVe78VEGhkJ5Ij382SZ6aO
         FtXhttwpusygo6meTKkwl2dIJZZElUHigXuy8snxADvDIP87eG5KMRxE+Cdb+oftWrnF
         By9RZOB1K2SLoKb34TMGufzHQfSEDQafoFcbaGB8r4efB4EbEcP35ztK53DZKaSPzv3D
         6MC2qATxs6m4kXwYzjkERbIcRWhGTF/gW6/Lb1vPbMg7TMS1xXrMkrNenrYBr3Kw9Qpk
         +oxnHkcNrWi7Jih/rjy2iiSYGquyf3rpmt8YKEP6aLSPxKyfKvjks+1ojIC11hpoqsDE
         BGVA==
X-Forwarded-Encrypted: i=1; AFNElJ//8OXRhzb+pEUTEV/hGmNX69XLqN9s9pW1YOIaIzvZCd9WawwNqcpbzR8OAYH7QvC+xHrq3JyTJog=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yze6sLIFv1gnwTH9fEtReKH3Sd/CCBk+Hk9/yxrIRr3vSKhS9nX
	WyY3bnZv326VF64BWuzmbxSTceMm/jilmHnVPQW/ANbqHWXYVD3k06lPpJRs7vvGww==
X-Gm-Gg: AeBDievu4l8iRWdn5l/G5DWlBxh8K3zkqHVJNGop4IDxw1R2yKmsGg7Z1cXtc1ieuFL
	tVJ9emC8mTWMe3cnSshE+JPxJ/GqMPJtrgykG7VoUdSrmXVJFFf5jtJ632IHrJVxo3wktsuSchj
	McS3YWPYMVJBJIYEjKz5BbNAYdcMLmdKuhYRavdjr2cFaF87/l5H6OADUf50jN3DEMilP+eQM+Y
	tqJuq9Wrh7YewQDnWahimlofSoFdjknwHe9seNuUJVEB4jF5OvmY1M5wMw/eIeipdYfxR8SwOrU
	Z8NRW78POayPDarmagkQXugs9fVk3VirAMhlh6dKMWz6XQoHAfneFmov/RaUl69f31JDji9ZvuI
	IqXUoopQ/rJFlolo1SDqIpsRJAQ56qHhDJDLvG/zZeIKfL4fAAibukczbaEp/lnZ9F/zlIi4Y0z
	XmuOsT4BXLnbQYLbVOndetgFjkbZw8kziSMppp1IlKHui+Yuaq7vXAGz9FoHnUVm5FqPeig49oF
	QMyA/1Qoy6jW0csCCtl+Frl/w==
X-Received: by 2002:a05:6000:230c:b0:43d:303f:f358 with SMTP id ffacd0b85a97d-43fe3dc5981mr27376756f8f.2.1776760139178;
        Tue, 21 Apr 2026 01:28:59 -0700 (PDT)
Message-ID: <cb1b4892-7a7f-4ed9-bb73-d43d72db99c8@suse.com>
Date: Tue, 21 Apr 2026 10:28:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] plat/rcar: Add region id support for PCI
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1776756291.git.mykyta_poturai@epam.com>
 <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
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
In-Reply-To: <ad5caa92e36b0e0f104a14b46396037505080f4f.1776756291.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776760139-BE460FF4-6463BE8B/0/0
X-purgate-type: clean
X-purgate-size: 478
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 043F8438285
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.04.2026 09:57, Mykyta Poturai wrote:
> With Region ID enabled, all CPU memory accesses need to have rgid bits
> set in the physical address. This creates a problem for PCI BAR
> accesses, as it would require all BARs to be 64bit.

I don't understand this. CPU accesses of addresses read / derived from
BARs can be massaged in any way the OS likes. That doesn't require the
BARs to be 64-bit. Are you trying to arrange for RGID to be transparent
to guests?

Jan

