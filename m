Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JasGPA6j2nHNAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:53:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0141B137479
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 15:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231148.1536429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vquXe-0000F7-82; Fri, 13 Feb 2026 14:53:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231148.1536429; Fri, 13 Feb 2026 14:53:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vquXe-0000DP-4k; Fri, 13 Feb 2026 14:53:10 +0000
Received: by outflank-mailman (input) for mailman id 1231148;
 Fri, 13 Feb 2026 14:53:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vquXc-0000DJ-QD
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 14:53:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b45ea372-08eb-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 15:53:06 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48370174e18so7010325e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 06:53:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483740be167sm35551195e9.15.2026.02.13.06.53.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 06:53:04 -0800 (PST)
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
X-Inumbo-ID: b45ea372-08eb-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770994385; x=1771599185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GW9BhnUi+3GSO+VDvDPMk6DYvpd7M20lrZfgxz4mOPk=;
        b=dYW/Au+YsshNT+m8SrUtwztEtRxwkGt3pmo3MRf/d0uwdvO78wTzdhuRxl1ijwYSGM
         hoKgkwr46OxpTQ4kgTjb74fBNZ1xCf4LatNRuY/7ZmO38J63sXOiy2+vzWBlTwYcNWZZ
         lm8UYllHxk3RX0FqSIpuZw1pa5CrIa2ZBiM3IcjLk51RfT0Yf3rOvYEUv7PX1JTDUIw8
         Cf1MhnzeonHkdM2EDeeh5bGRPm1JeNdOUp5Wjzj8lR4e08wgCICeUziQ/6r0GSNKSGpD
         2vXdfZ8dd3x7utVe2rcWyq6a/GqBXaWETtk5iLFaJZ3Hg9C0XRn1nND3pLNrSEPoGuRL
         C3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994385; x=1771599185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GW9BhnUi+3GSO+VDvDPMk6DYvpd7M20lrZfgxz4mOPk=;
        b=nY+Rc7CxkX79gLGYh5Jot/1D6ImF+IweZiyzW3Fo3B+ls279Ov2MVj6MuTwth56tP/
         p3AOZbaRt1zst9p5iEkC7cYqULIdOWtme6JqDIMBhoU7LNS3NsWCmScvkj/X7O8FI9FN
         D2S47aDJO4SKGTRGBvJ2NaD+tAkxASZvuGRA75KN9PNmrFOPTHV/g4WSM5NUvFvyOVcQ
         XOwvJHqJqB2AT7n2Mk5pn3V0ByigcKcA/9nptemqOVxePz93kq2cUO+5lUHCbDOrXLK6
         +OJJ7QdylEwjVh4tS/GWtt/+5LrFJX7mqiH1MtgxCG/nS/W6k0zkH7SNiOj58R70IW3W
         IxBw==
X-Forwarded-Encrypted: i=1; AJvYcCWAKpm84rnNyY5cYaQJ9K9GTtlAYhmCPnJs0bQWjFVEnCHZaYIaJOfibpgQ/j7WwkqnS3Jx2lzIBv8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYByinHn5NbV9ze7dNK9lBqDx+DyIleu0G8UMcZqU8vJQe773V
	jUk38yE4/Zdo8Vw+qxJlgY6cvwTLCRZLF7V9o9UHoHHl8Zr2LzAtXQyqnOUluBdJVw==
X-Gm-Gg: AZuq6aKPjCRcT4hF/40c2CQuOc5/aHKnT72C3pjlY+hEzLOHD2Xlq+UFlYNZSGOnbYm
	RdWgsvqUd2XLa8oH4O1hW2uR2OGgD/4WjaKaI4cMY7Nx1NNP3zVJL+7K7JWgZst8ZvX1iiBfRL7
	CJm4jJ0lb+tFHFmPUTTXkh/czYr6PBAPkso3P7LCBC3Y+YUFMYwf9+Bi7+a/9qa+u82YHGh1Y+4
	dwTEWyvGZFjb+Y6/8NlxWlqOVwTO8HCMeI+bYdRWGgGJUUQT/B9jFAhCcB6pvhPiIfsqpljL+m+
	Fo33p+YOVeJFxFtUGridL+DlDenQprKokbF6CZXW5Qqgl4Lhwz0+yTLC3he2VAbX6fdEoQUYDGz
	PBWoRkccWGQUPpeFKl1IEHvRljKkH2hwXKRf1GriWB1Dv0le4UdA1FFMLrtusmx6YpGyQEmNcII
	7K34mvZlnR4s0FdTT7LKCcw4EK1Tvn1kU3VcS3VA0H5a4NLbk3mnoTEuynJ6Qdh9QyzTEzywjK1
	NPPkUG1Xf82BEZRLanOqzN0CA==
X-Received: by 2002:a05:600c:b85:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-48373a11cedmr34991545e9.16.1770994385466;
        Fri, 13 Feb 2026 06:53:05 -0800 (PST)
Message-ID: <54db82ee-0746-4490-82aa-7ddf03c38942@suse.com>
Date: Fri, 13 Feb 2026 15:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] x86/darwin: two extra fixes to placate build warnings
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260213135614.25842-1-roger.pau@citrix.com>
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
In-Reply-To: <20260213135614.25842-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0141B137479
X-Rspamd-Action: no action

On 13.02.2026 14:56, Roger Pau Monne wrote:
> Hello,
> 
> Following two patches fix the remaining two warnings seen on the x86
> Darwin build of Xen.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (2):
>   xen/x86: fix usage of [[:blank:]] with BSD grep
>   xen: add non-executable stack note uniformly

Acked-by: Jan Beulich <jbeulich@suse.com>


