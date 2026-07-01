Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DP/ONCAoRWrW7woAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:45:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 383A36EEEB3
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 16:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="ACry/BGe";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1350054.1607639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewC7-0000pi-Rg; Wed, 01 Jul 2026 14:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350054.1607639; Wed, 01 Jul 2026 14:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wewC7-0000nR-Oj; Wed, 01 Jul 2026 14:45:43 +0000
Received: by outflank-mailman (input) for mailman id 1350054;
 Wed, 01 Jul 2026 14:45:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wewC6-0000mG-FC
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 14:45:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wewC5-003l9Q-Dz
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 16:45:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a452803-2eae-0a2a0a5409dd-0a2a450be7a6-32
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:45:41 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a452815-ac48-0a2a450b0019-d155dd2cb49a-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 16:45:41 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so709657f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 07:45:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477db8a450bsm390780f8f.10.2026.07.01.07.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2026 07:45:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1782917141; x=1783521941; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=irMRNbgKvuqITnobG7iDWOXfBogQaMWuiiyBaILdGAQ=;
        b=ACry/BGewSTOVcBOT1L21q4RoFjtXYIqYeZUJGUNjUY/Gy9/wklliU3OZaqsfu2g4B
         xtmcogaaIJq2TawIJAPskuZNjrESwzErnHQ1P3d92pNyfHBSnKkp4dTgJJjsqZnjcXRt
         NerTPJ9wS9DO6j7wA9xDmr/SFbabZRdduMaVF2lW+2wMXHlptFjWSsfAODCY7ON6MH+u
         QU5iTSs4jFUyI+lbldC/hJS8WaCllSAeTLKX/kKlKeY2G5RwsXXG4XdoR/aCkzg9e+gx
         BTCpBFtw1rEAzCIzYDertiYZMBbt6+XmYe3+WKRQZvYYE+PQAaIj5TNMft+Na23dqNk+
         7PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782917141; x=1783521941;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=irMRNbgKvuqITnobG7iDWOXfBogQaMWuiiyBaILdGAQ=;
        b=gTtay7kt2dI582wH6XEZRIfMKYPzTDXiKI9QhF1kzA99B7/Tml+fEVjm+taL8jKv/o
         JEj+9ON7TTDE4cBdArrhG54vntM1CDWiqaRt7aF/vhQytgUdInfSGkeRfClu5keau1+Q
         YMRA+2kEgtJzbBRrPx3Bv4LVA/wuFS8KEe4UBCqq3R+oh2jzONXHYvplv6zVMyPhXkyx
         65U7r6W2+sAEqdHTHmiD8/ZIns54HMqYxnr5MtAd7Li03qpVMbyFpUaPeldaUAOl5nkB
         wjNjVcy4AfzZNYzOE2R/dnnQJOldZ3HrHjZkUDSCl+FlbdOeclBxV+Amfwdp1L/YCAA/
         t1Og==
X-Gm-Message-State: AOJu0Yw3lcNbbsewqeNLFcE4nN58asq3sGkti7U/xbPgXJMdbRqGCq+l
	V1Xk4o3TkZNyYkHAwT1B4Xs+FbdQiY8x/PHGrLxWd56c2gTRzq1fLbbRq8rX8akgL81sE0J5cMy
	D4NTO+w==
X-Gm-Gg: AfdE7ckdN5nEq1iBR3pcukPUNqpiPywXwoGA9v83sTO96jYVjMegAa0A/EynzDK1JJq
	C9IHOxy/wejNieR8fRCj2KT3mbmfLgkfGxPeJN++/YcwwJGdCS+cSDCE1s4W4vuB2Z+6PRPZZik
	TrFlNmrXNZT0u76PS8bCoQSoM45ADvPTRwHQjKq/OktLxMzw7/xSJSQmbWeiDoay9EsMGHmi/Xb
	VTyjjBWXfkrkUuwjfnH8eJCTqmdP521WGxXbiv/XqcDHAIoMf9EyLBQMrkyBo0k6wgc2hM/NCv4
	oj4kehBEJL5do+mGpjysGtKfG0LTOO8m9XjdRWEIFm0FKr9CvScZOim38sjxu4Tk+HNzsb0xWzz
	YwFFcMB34WmeUTWs2QK2Vf9SmzWnncAtheUfDV7wBEDB6TVhO9UwH0N/sXVQVO23+sLZOOtH/xv
	TrWiMcm4oiqGp+lSGYlFqAxSFqg4CfZj9fUcA5WQvO8n261uvKlsUWNlq5x0clPg+GaIaCvn0zw
	+aAorMyTUuph0c=
X-Received: by 2002:a05:600c:570f:b0:493:ad1b:b38d with SMTP id 5b1f17b1804b1-493c2ba7db3mr22090225e9.37.1782917140681;
        Wed, 01 Jul 2026 07:45:40 -0700 (PDT)
Message-ID: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
Date: Wed, 1 Jul 2026 16:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] hypercall string inputs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
Content-Language: en-US
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1782917141-3A125220-A9F24B94/0/0
X-purgate-type: clean
X-purgate-size: 573
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:jgross@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 383A36EEEB3

While doing the XSA-492 work I further noticed an inefficiency with
safe_copy_string_from_guest(). All callers pass PAGE_SIZE as the maximum
buffer size, and with the function adding 1 to append a nul terminator
the resulting allocations are all order-1 ones. Which we'd better avoid.
Require respective callers of hypercalls to nul-terminate the strings
within the buffer supplied. While an ABI change, I think it's an
acceptable one.

1: libxc: drop size parameter from xc_flask_context_to_sid()
2: lib: make safe_copy_string_from_guest() validate input

Jan

