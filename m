Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAh4LIBuymnG8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:37:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 104F335B205
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:37:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267580.1557042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Brb-0004AJ-Dk; Mon, 30 Mar 2026 12:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267580.1557042; Mon, 30 Mar 2026 12:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7Brb-00047k-Az; Mon, 30 Mar 2026 12:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1267580;
 Mon, 30 Mar 2026 12:37:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7BrZ-00047e-4e
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:37:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BrY-0041AB-Gk
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:37:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6e65-e002-0a2a0a5209dd-0a2a45048efc-24
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:37:00 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6e6c-c823-0a2a45040019-d155802ff1ac-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:37:00 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso58629945e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 05:37:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c845b8sm256351125e9.4.2026.03.30.05.36.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 05:36:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1774874220; x=1775479020; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wqbTovqReXLHlu4nksmlR9M7+VDsBy7ec+OQZw5Bb9U=;
        b=dBvkKpQz820VKJgMREfGMm7l8WKcsCeXgULh6QWN4SJKrLv+w+YpK7bcHWFlU5FeIj
         t4il94G73Bn1NVacnqoMjYI6xGoIW2IoRPND/SGY3QYNrqaSlJgKYuFCya7t9/687wXQ
         /F632AvwWOI1c4wnJ1tMym1E1MUPa8066oMBwurkjjpQQ0QPwo0o2ztKW5vBPmCmDe+x
         tUrZsV63A12EIABunKYFNwkaMusYMVkim3H4nPWHCY/RCX4+dKSq8doybYFGFHVzylx/
         jAA2SiI/rjPTxBGAUQp2/8I5Wwa9/zyamMr/RH69GTM9uHpCDHnmU/CG1Z6voJazONjB
         yQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874220; x=1775479020;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqbTovqReXLHlu4nksmlR9M7+VDsBy7ec+OQZw5Bb9U=;
        b=tUZbxRi3lX/ctVJMhZHNt5AGicMnyUlrhe4xkAwp7Oprgr/tjKzPL1Pj7Dx6YSNa+X
         Ix2HLhvACDvvdcVuv3hS2yK6yyI8H4jbwc3Yb6iDYBMbG5KKPBL/lo2sxnlL1PCmX9uO
         62gPLjyF9uHG+7JILLmO4LMHw3yafYEOP26a5ZFNFvzFgE6sH5CFsDzOAjbk7b6LIrZT
         J+P/5M20EqLQBZLuXNIsRdN1CY7SB9g1FvwxxCR/qpxeKF6bgqCCtnVMN/BpRawQ/TGy
         oC5lkcj5QF0qngyX6qMaIF4UnYAwQoBf80jSXCZU0ZRoaKpnwIAmB6cveoE8EzDBzJuG
         R22A==
X-Forwarded-Encrypted: i=1; AJvYcCVkHsgPW45gos8H6H3kvsXGjhKdNI1y4n9vyw0lHexhHf5z+ZVK4h/Fd7/AB/P3AOGsJbgWzCrRABE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxi5qcsT4gSd8NW1uvp8vo9Svjp8nJ7k0m6+o/OBG34ranDjHrK
	O+Yp+9j0hbyeVU4QhKPvdEjMG2DKrBN/cUFmnjL5/Yi5RMo8ciMORJAtOLfdHxA5MQ==
X-Gm-Gg: ATEYQzyRr1u5KRn4RGYDdY2qYJIrcSJrz+XugxJ49CY77A+RCSQAi0WcBo7GgzIQtot
	NdoGD6GvHVm5Dis+NdnDNTO0BSbobitFWz9rJMUIj3e4DXWJeuEQ7jNbynZoZ2VtK0Atv+mFnzX
	QQwYRiLKfk6EMUi5JXvmIJaooJDn9DGlK35kYCExdzNsRlNUVGGsbC7Khq67/1bmq4vZqHHqQe4
	jPnlNek4lC+6Ay0Vrpw6lrexwtmnKiBC/qKNS/H0W6JO1FYnKw3omBwlqcU8E5Q/XBcWOW0kFbb
	+gANOthBA6DreUei4r0oWT7em0HlPS0qSYLyXyIRzsREjFc4KBG6YQl9m01/AKkszZHI22sWxI7
	QjgyW5sDDBgIgUq7cv12TZoHKu37ccleRgt484gPjb+tT+vvW/rZ44rbPf0OoXVrAX0bxB/KG2Y
	Mio/KROrMSq8mHiUy3FCwCbLBWVp2H6GGHYJ/zvadRnpmCOp1iNwv7HTQKE+raLZfEACDnVC62Q
	W/dPUxVdKoV4DU=
X-Received: by 2002:a05:600c:6819:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-48727f238d9mr215317195e9.26.1774874219827;
        Mon, 30 Mar 2026 05:36:59 -0700 (PDT)
Message-ID: <c5cef874-b47c-4b18-a069-e6656fed6080@suse.com>
Date: Mon, 30 Mar 2026 14:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] docs: Document CPU hotplug
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <97ad7b68c5e42fc396b155ef1d0a69a738b28881.1774871881.git.mykyta_poturai@epam.com>
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
In-Reply-To: <97ad7b68c5e42fc396b155ef1d0a69a738b28881.1774871881.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1774874220-BB6949D1-5A0EA12F/0/0
X-purgate-type: clean
X-purgate-size: 358
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 104F335B205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 13:59, Mykyta Poturai wrote:
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -52,6 +52,7 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>  ### ACPI CPU Hotplug
>  
>      Status, x86: Experimental
> +    Status, Arm64: Experimental

Are you sure? I didn't spot an ACPI connection in the patches (in particular
in patch 4).

Jan

