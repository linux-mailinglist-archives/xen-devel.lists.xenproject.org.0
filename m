Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wLzDCvy9wmmOlQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:38:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E431922F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261117.1554239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54le-0002MQ-K6; Tue, 24 Mar 2026 16:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261117.1554239; Tue, 24 Mar 2026 16:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54le-0002Kd-FS; Tue, 24 Mar 2026 16:38:10 +0000
Received: by outflank-mailman (input) for mailman id 1261117;
 Tue, 24 Mar 2026 16:38:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54ld-0002KT-5K
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:38:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54lc-002tLY-HE
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:38:08 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bdd6-e002-0a2a0a5209dd-0a2a4501d79a-44
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:38:08 +0100
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bdf0-6400-0a2a45010019-d155dd2dc40c-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:38:08 +0100
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43b4f48c47cso3012782f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:38:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b644bd0dcsm38781283f8f.11.2026.03.24.09.38.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:38:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774370288; x=1774975088; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xSea3csxQK27kPKZBEWvJfLuReO04l6n0dzZu3l9za4=;
        b=STgvz5zz0blYFZ6IjCfecpjZQWGK4DDQOdSYLZhqP2+x9fWI8OoJ7Eg0sBQMc3MEBM
         XtNfMMd4J2VrrL+r7IjcXUewsoss8JhN6sX4QkPjPTKKwokB7PWPM+xHiJlVhXPH11FG
         2zBh5E+zRX6+0tC4EHTgZ0FZ6eaSNYf6A30y/L0Ubx8zyNB8qZOqassb40qfB3jGsCNU
         sjPecOHhjUq/oXnMDs1TQYv0KuX/cx4ej5owuPZTi8JNzWhuejS6D+1I2+4EMlubjs5L
         wVOdWIldeHAF+8/g6Eq/slyqIeGexCwvvhEL7AKzBJ41fOTtWWN2ZSzm2o8UmtVAM7UP
         kIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370288; x=1774975088;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSea3csxQK27kPKZBEWvJfLuReO04l6n0dzZu3l9za4=;
        b=IJRzvvYMG8Vb8bqO/TXqeaI+RjMep7pHABCCp7H5Nh8wQc+MoRK/W+qJqTDdaHSqrb
         uoLzCQuLkmiw0YbDfk1eRN2DwX98hVOD7etV6zJ85qOMI3+apo5h9aHKEwb242gu6tPq
         cs3Nv7QxWuwbrU1jgWSMECpUmwjQuY+CLqqjPqx5q5Z2aiIdFXTzR0FHH3l0EUL0eLYs
         mb4VPt4HGerCcV3yLxg0oBzW5zx2NrR3chAnGcuBY67J6C6+W2NG6SZQONT7HD0vw0ni
         yT7qn/yMqRxiaaIwqsuTSmf4yoOYr2Tg7AKHhIbaxYV6cYK+K2ZTBsmV2RWBFpCHKbNE
         2veQ==
X-Gm-Message-State: AOJu0YzU/4nUmsgAvJU31uoOgirzZyxPjBvq+m+F6NOEQwmcuoFQzcgu
	xZkRWfGZw4WxQuMyW2n2RQELCpGo6oN2quCbzj+IKBok/h0fDCYi5EKjhVXDDouLf/HHv4jtJ52
	Uu2D3pw==
X-Gm-Gg: ATEYQzyrJ1Z8NkTHkgr59YiAn+CQswvrU5RI4Bal1AXqcnxfwEavpDE+WtezfsqkXxc
	i1/H2y1C5tClK5VNJKZAlnLlhFJ4wRItxcCXYWl/SHzywwL1N1Q2dR5XfthURTldw6USREJlL4x
	OgrVvKtUn5hYEXMQJuoTreHkk+NT54OCrghRhsQCZt8FbjPjn8MlZXfQS+KY1mc0ufgI671vL/k
	oVb8PFk86OPfF/awvDLp2eH7/KCFsKic4SlnZM+0/iPELGAblkUMtH1LA7fKEGQg9AYKW6GrI+W
	8rDv6wIxG5OGw3EfwOnhVEhrTprAJKlrdbcTSRj5IqLsHNO5X8QLpU1Aw2RB1o3nkjWYPb7E3X3
	Md4auWmzEjjD2Tb1z5/lcGnR+na2eEXSWExjknPOpKFIS9Y5fja7aIpYHS+bYovTFF7QSlRmVkk
	Du6AuzVvR32TSrBnW5I/aYhTNbkwpbZSdQQDRUMEAWe70kKMic8u8rROe/ZN0eP/+ZS+lSRVAt5
	uET+GrjQs1b9rI=
X-Received: by 2002:a05:6000:2dc7:b0:439:b6d6:723 with SMTP id ffacd0b85a97d-43b88a1bcc5mr226529f8f.42.1774370287775;
        Tue, 24 Mar 2026 09:38:07 -0700 (PDT)
Message-ID: <66135036-b516-4665-b875-996456a34640@suse.com>
Date: Tue, 24 Mar 2026 17:38:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] ns16550: harden name/value pair parsing
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kamil Frankowicz <kamil.frankowicz@cert.pl>
References: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
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
In-Reply-To: <63284ab7-8e38-4448-a789-1b9c23c4d95c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774370288-48E12DF3-01D664D8/0/0
X-purgate-type: clean
X-purgate-size: 957
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:kamil.frankowicz@cert.pl,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
X-Rspamd-Queue-Id: 984E431922F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

strsep(), unless passed a 1st argument which itself points at a NULL
pointer, won't return NULL. Instead if the separator(s) looked for isn't
found, that pointed-to field would be updated to hold NULL. Hence the
important check in get_token() is for token to be non-NULL after the call
(which get_token()'s callers rely upon), while the checking of param_name
is left there just in case.

Fixes: 97fd49a7e074 ("ns16550: add support for UART parameters to be specifed with name-value pairs")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1466,7 +1466,7 @@ static enum __init serial_param_type get
     unsigned int i;
 
     param_name = strsep(&token, "=");
-    if ( param_name == NULL )
+    if ( !param_name || !token )
         return num_serial_params;
 
     /* Linear search for the parameter. */


