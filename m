Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDCqEESD/WlcfQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:31:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9897B4F279C
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:31:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303224.1576716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEjp-0000mn-JI; Fri, 08 May 2026 06:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303224.1576716; Fri, 08 May 2026 06:31:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEjp-0000kU-GS; Fri, 08 May 2026 06:31:05 +0000
Received: by outflank-mailman (input) for mailman id 1303224;
 Fri, 08 May 2026 06:31:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLEjn-0000kO-NN
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 06:31:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLEjj-004CNO-T8
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:30:59 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd831d-5cb7-0a2a0a5109dd-0a2a450ab96e-28
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:30:59 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd8323-56b3-0a2a450a0019-d1558031b4ca-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:30:59 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-488af96f6b2so18594815e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 23:30:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e68eaf073sm16860065e9.4.2026.05.07.23.30.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 23:30:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1778221859; x=1778826659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g1yVp0S+t7U+oa7bv+DoViHFftbRkyf1FYrRpiXFejk=;
        b=Bd/GSz4u7Bvsb8qplY30VKvEVik3F2FHi1pdYVKcWnqMF0m++6dLevZA4QcZwcbk2r
         FvPAG9RV3b1uVNw+/Gh+DXjBqow+SzrheKrwRLBDbzWqw4w7m5hGu9VvTkZN2O46tWNh
         5wMkh+JLnCB47NsTusWd1emBWYwMTWp+0mu4HfKFcrCGK/NReYFuJciwv5UFahhIJB5U
         oeGLhFsGSvQH+RB/Domky0SYFqnsON9FO0FSMlp+WQ6nkeUvOOTq+aRjwN36DOVf5rRu
         Hfm+FXxRn/F+LwCDzAba38224mZWkPbV8WyFfQkEIL250Yg0TU0FAeYXgMq0jgLnOtnc
         FtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221859; x=1778826659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1yVp0S+t7U+oa7bv+DoViHFftbRkyf1FYrRpiXFejk=;
        b=n7bGTkIsvOREZ30NcKaPKbe/11m8qVy3Fok7hBImZOxum6ghPuwGx3zugj8ABQCW25
         9he/XR86wB0v5k+sufJYbhSnFNykVMDqnU35w1VEBU3YWGN8S1ewByWuq37YKiGy30TD
         mX9/6oF+2FjO7E5PoOaVWTAzHFowSBWY9fzFWRTACyypetM2sUOD/s7rwp7/gqewxqRX
         u/2kI87pq+sD/bFUgBLnYPNeoeAQilivPo5hER27n42dxYHuVLbsReERc+OAfyaJYP0/
         hIWJpEkwQykeqVwxhUOGtD0T5StNjXckcW0Vfm5GnVnX10cwE/EEFpqcqhyxpYSGC7TA
         2sDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lKVlIyFV1BA9Q268mENSGuvBeWeKcG7EWbQWvWpMIB90kbqMFGUqc6+dAhy1s/pfWPKgeP3rp6JE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHnNleTWPG+t4gC+ZgwpEt3KcXs4uHlyFVm4Ol0l9VKxu5wXao
	7W7zB2+A7hTCBiwf/FpgLUrmEyGGtt2nk8YaPnAWlPnE2HEGp3pJSj1bQJ7CkE6ZbQ==
X-Gm-Gg: AeBDievi2Y1Sx2u1TldYXGVCMnDCe49K5S3K7VQvWg98RbjraOHoYOxD4WpHlvS1rew
	24QweNMUWys0EZPpDYYOW9Pp1IX8ZCII2rTREMEfYsJzy3Xig0J7/JU8s48xpePUaxeNZnC5t02
	M7y/uH3qV6TqlhLit2//8fe4kGjbj5UG6fFD5ONYUtWu5LYGon1F7uPaONq+8UaQ/Hr3WFsG+M6
	+w5fScADuT4z56ymJ2CdJuYgEC75KUnOIzadim/qYn3MotocVcPtFutK7ECIjozTprlxz50nVxl
	O8+enhjULgcMalqjOq8xX3ryCh29iClgIlreuwJf/4WgNn+b2uy8wi9JmXOvpw0Mi37SCsVvcZE
	BecVM1d5W8gDIH+5U6LwpKVwr/8XdFB0fsiUez+9ts6zTzs07Ms4q5sW7Ouse2s/bxqszRtBSRb
	Ylin269eYGZ6iz4VIMgtRS1wB+hJOoiqXa1Xx5pXAoVzq69izV0uoguzBc3+bdcoQmjje6+ImxY
	fQfvGtIsnpzROo=
X-Received: by 2002:a05:600c:4f92:b0:486:ff92:63e5 with SMTP id 5b1f17b1804b1-48e51e09711mr171067685e9.6.1778221859133;
        Thu, 07 May 2026 23:30:59 -0700 (PDT)
Message-ID: <fc8cab0a-288d-438d-9cc1-2606034b0a2d@suse.com>
Date: Fri, 8 May 2026 08:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Drop xenpaging
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260507171933.1573983-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260507171933.1573983-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1778221859-7216A8B7-32E0CAAD/10/73395122804
X-purgate-type: spam
X-purgate-size: 1102
X-Rspamd-Queue-Id: 9897B4F279C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,amd.com,xen.org,citrix.com,kernel.org,suse.com,tklengyel.com,apertussolutions.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,amd.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:email,tklengyel.com:email,xen.org:email];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:tamas@tklengyel.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 19:19, Andrew Cooper wrote:
> This capability is experimental, has seen no development since 2011, and these
> days only gets edited to fix the build.
> 
> While it can be compiled out (of Xen at least), it is a maintenance burden on
> surrounding code that we'd prefer to stop paying.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Slightly RFC.  I'm suspect I might be asked to split this up a bit, but if so,
> suggestions on where to draw the lines please.

tools, common, x86, xsm in (perhaps) this order? That would then also pretty
much isolate who each one needs acks from.

Jan

