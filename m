Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WHroKPJjT2pCfwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:03:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3572EA59
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:03:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=U+XcayY1;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357692.1612043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whkep-0004zD-HS; Thu, 09 Jul 2026 09:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357692.1612043; Thu, 09 Jul 2026 09:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whkep-0004wV-Eb; Thu, 09 Jul 2026 09:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1357692;
 Thu, 09 Jul 2026 09:02:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whkeo-0004wP-FW
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:02:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whken-002s8U-KO
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:02:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f63b7-5cb7-0a2a0a5109dd-0a2a450ad78c-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:02:57 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4f63c1-e40e-0a2a450a0019-d1558034b07b-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:02:57 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-493b1710405so9522445e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 02:02:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3dcdsm45059925e9.3.2026.07.09.02.02.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jul 2026 02:02:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1783587777; x=1784192577; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+/+Kyb61LTEUm8Sxo2vibCznbnFnMTIBlp41EeI00O0=;
        b=U+XcayY1RBZf77FbH9DbzdvM/7OrRu5U8ScSQFHzqdzEW3Sge3fWx1qDJGk9GUlfkG
         Dej03zDd0J5BRoCBap6MTAsj4xPjX+r+7dqry0MJSGgXtZJmWYYHOG/16g5qi4mpKAmv
         oFtXtYcijFtiYg/0ztqX6a4Y4ZMdpNKD0bLZzsu2byhhhOL7y4CPL/y5mTLuHznE8bfB
         YdaCeio5xWZGvH1AyJsNGo85ZNECnqkIFBiH1Wmaiwy51KgknW1Kb88C4VZzxmZ/whBu
         lQMifKjm234ISjNOpjAvUfcapjK7Oj+8S+ZPDQd0Hy1KxkZVNsCrWZMCsCE1vQecz9nc
         QHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587777; x=1784192577;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+/+Kyb61LTEUm8Sxo2vibCznbnFnMTIBlp41EeI00O0=;
        b=klrb7w/Hsfqn+I+AJ5cu6uynJtf3WobTwee82FwX0zj+CiUAy+97ANAAPgQiUraBmz
         vr3R6c6KAfKUk2h8T9H6o/Qf56gAX5KPachhO+PXkvWxnDqZyxVXPFiBvkCC0IBPtior
         MeihSIAWqtOVvKqp9DigfHpBg2Hn6ZHC5jh8QYqNPJ2QIlg6MKVd5Vw/+TykdCVvqYTP
         SKpX+kO3QWSccX5Oe+FSMqW5elilPW5ivYI27Q+UMBzFNxdC8Pe1yP7xSorIWiZW6Ewa
         w+9XiDpOMUhz0FCmJY8PD64eYBa0s/EY7YnN4FJ5+1gV284408r3+lvS8Jj27XRgUW18
         CiFg==
X-Forwarded-Encrypted: i=1; AHgh+RpHFH6E8ChPC5oVp5uE+9gJqp5C5hTxlE1v9A8VOo1Ci+3/l0bbmkE3pi1GgBIeqEHkqMlcFkplIFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzaPIJCy8PqWTWH3YuWg6wpTBP9VLmF3kUzQFKR8RjA2TDu5gIq
	eLAyTOk4/4gPGofrsfjJJTI/h38WWebh+BFYe41jzVTi1YVD5YBOtpNzZSbAr+49Uw==
X-Gm-Gg: AfdE7cmWQvAjx+IEFf40vLnPC9uVxBHeAsFeWAedvy8np+WanfC1hLy3PJjaJanD+xi
	20ZaRYdnJfTZSkSELgMY7WdHnK1U+tJ6S1iVVXrUye1jraHYU5nOyEDCfJlx9Y6bRZ6CeL5NVrU
	GnQBHozf5AS9MEru8ULc4RoV+TtYQNOxCWhBWJ7WHwE+EyZ1BCx3PBIocEu1MnsnCVSHFwu+5qo
	I1OiCXvYz9psD+gLT+mBuotvEOrvS+XdQPkWE43uAqghdt0MFG+broYiNJzZE1lUPLaF6cYmh20
	Y4AvUc17qMQFWrQgzhhzs6EwbSOb7fhga6G9ZLAOLEqBDND5gAWyRfQBATisptRtTKpl4d9ehco
	lwCMAnKsYHtwevaRyhgnnhXWV4VRYdYDD/uSt1QZvkYPt3MoS0TThou+FPT7Xh8/yVwqkeoAkrw
	3UAZjdlZ0h2Em5PhWkrKRQt5eU3qZhzeDQNJ3vZkC8f+QF+t6rdBCH/oDKBO42abp73zh1CFhs0
	hYO
X-Received: by 2002:a05:600c:4fd4:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493e6878b65mr58160965e9.32.1783587776915;
        Thu, 09 Jul 2026 02:02:56 -0700 (PDT)
Message-ID: <f3404b9c-df8b-4f97-a2cb-50e3402d781c@suse.com>
Date: Thu, 9 Jul 2026 11:02:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] update struct member
To: Ryoji Okamoto <okamoto@valinux.co.jp>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20260709083850.214088-1-okamoto@valinux.co.jp>
 <20260709083850.214088-2-okamoto@valinux.co.jp>
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
In-Reply-To: <20260709083850.214088-2-okamoto@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1783587777-D6121DDE-8E33F7B8/0/0
X-purgate-type: clean
X-purgate-size: 909
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:okamoto@valinux.co.jp,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09A3572EA59

On 09.07.2026 10:38, Ryoji Okamoto wrote:

Fixes: 463b95831778 ("xen:rtds: towards work conserving RTDS")

> Signed-off-by: Ryoji Okamoto <okamoto@valinux.co.jp>
> ---
>  tools/xentrace/xenalyze.c | 1 +
>  1 file changed, 1 insertion(+)

This kind of change also almost certainly wants to come with a non-empty
description, and its subject also wants to be less generic (plus have a
component prefix, e.g. "xenalyze: " here.

> --- a/tools/xentrace/xenalyze.c
> +++ b/tools/xentrace/xenalyze.c
> @@ -8039,6 +8039,7 @@ void sched_process(struct pcpu_info *p)
>              if(opt.dump_all) {
>                  struct {
>                      unsigned int vcpuid:16, domid:16;
> +                    uint32_t priority;
>                      uint64_t cur_dl, cur_bg;
>                  } __attribute__((packed)) *r = (typeof(r))ri->d;
>  

The code change looks entirely okay.

Jan

