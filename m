Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDJlEkGCnGnIIgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:37:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1F179E9B
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 17:37:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239254.1540698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYvj-0000Dp-CO; Mon, 23 Feb 2026 16:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239254.1540698; Mon, 23 Feb 2026 16:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuYvj-0000C2-9m; Mon, 23 Feb 2026 16:37:07 +0000
Received: by outflank-mailman (input) for mailman id 1239254;
 Mon, 23 Feb 2026 16:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuYvi-0000Bs-GH
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 16:37:06 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3242b20-10d5-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 17:37:05 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48372efa020so36131435e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 08:37:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31efe02sm298003075e9.10.2026.02.23.08.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 08:37:04 -0800 (PST)
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
X-Inumbo-ID: e3242b20-10d5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771864624; x=1772469424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESdbZ0LqhC1aaiFglWHHr5YoY3JF62PCZRV2GnvsJcA=;
        b=Cl/N2tcNBjrBVh4H8oBJ9W4IwQDcYe2srj4TYfHlnIUBAvJOgRi8ycCCFOczpPZdOu
         7oe/QOfVgNZA+DNHr/D4E1Rfxkny5UDVjmC8sGTRv9GtmLSKT7JS9niY4FUMH24dyDt5
         RdWHhaZSkPT4fJbYFUkW6L0aQIz82qIMumfEVM+zDDpi3xEidy992DWPH7PG7ohapCh6
         BuTttZ+XpxdM8/5W/iTNIApPIGwyh6Xl5EjW5dJfZHUR8E7ukv4/W4QerQunAjqbQ11+
         DrLx3Szd/Uops3/qQr/4f1KdcLx3RVnMweRyOgmXiXfX6qg8U359cbofgxaNnPeMZFoC
         IdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864624; x=1772469424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESdbZ0LqhC1aaiFglWHHr5YoY3JF62PCZRV2GnvsJcA=;
        b=TKP5qko4QogTftQ00gLa+3Mby/p1qZm0pPCeicCDPHLPPhW+0jiZ8tWuIIUNgYxVT6
         VHV2oEDfC+DapVp6cXc0vULgk+ssWDRG9CacbOAc65BEiuj1QoK6mAKCwrkSVprRec8t
         zm06uTq4w3s8Wr6XQpTOZY1ROzm+c5MjEIWzI1KRDuc5cLs17pUlzn+jRwEv9X4s+yGW
         7vi/FUrAq4vhVlfHWtnu1lipsYggD31pDUuyl4wzxNo7mEOCZxB2/5oteWpCq4ouvJPB
         N0TBLVMoVvB8CDr/lZmcnnZe/yMbZoFfdbWX9CgF6QCOzInYQkkprmnXU2BUCt9qQejQ
         qvxw==
X-Forwarded-Encrypted: i=1; AJvYcCUZYfy1qG7uND+zYBm8xsTHTY4P9jT39oWd7C8zeQqm7ci/0o37eOAEKjmWcNpzivc2B/5vAXGTK3w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyodXo6ZqFzqAYJalOYE5J8JNk4tsHrWri5kZg55Bh2xl3yIPBq
	IomtyNp2F19w9ZeB7qyYR7bFAeRRo+TdW8nVOAb1oBnUk/geUf6c/j5w/nd211YssA==
X-Gm-Gg: AZuq6aKWRAn5GEEaqZYqQDdWF0G9CxTxvOLVVXUJra9EpHQ/2fE5Y+XzkghEhKpm6UX
	WYX7iKOvPDFubGtgcnRc8UYLEaKD5jqIjMan5bsz5R5pFKExRP3VNXn2JOcTxzoAvQTBq+2AONJ
	QYBOSrKGvuQXCPlRBXallJ/ULyjr7lqy4fQbI1bO5ut31YNC96wZMgjvpoQATGfufDg+o3gj08P
	StJG+HCUVSdaFZ2dkdNNW4eZ+QzYHT+LFJrXmlJxcchNtdDW/NFC1atDN+Z1U6FRzc5sLUD4unp
	yzXwZIVYmKZwbk5cdCoIA07UcD7lDkaIP93oHfMv7Akde5G8LjLYuwUVflVL7KU7VZTPrY5XA5Y
	dioDV3CQppilgZ2kdNg0Xd3PRzNmUKx3y799V5fjsvP6+gHWCJghM1AHRelfO2N/8EFlGpo87Wt
	QZTR5Q9FSjr6V4VV6m0tg19Ek9TefBflpTiMqDB+RQFAgJnaCXknVq4b54NBetRUE+Ma68qjNJm
	CCyNpNcCtRE2A5nyY8Q6ndUFA==
X-Received: by 2002:a05:600c:c3cd:20b0:483:7020:864 with SMTP id 5b1f17b1804b1-483adc6b3d5mr84658575e9.25.1771864624588;
        Mon, 23 Feb 2026 08:37:04 -0800 (PST)
Message-ID: <20e3edf8-9aba-40e9-af57-e5eddf001a7b@suse.com>
Date: Mon, 23 Feb 2026 17:37:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tools/tests/*/Makefile: factor out common PHONY rules
 into Rules.mk
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
References: <cover.1771840831.git.edwin.torok@citrix.com>
 <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <6fa0d95dad3d223cf8aaa923ae59fd0b3a97d4a0.1771840831.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C5A1F179E9B
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> Introduce a new tools/tests/Rules.mk that must be included *last* in a
> Makefile, after TARGETS is defined.

Requiring inclusion after TARGETS is defined is certainly okay. Requiring it to
be included absolutely last is imo going too far. There surely are going to be
cases where something wants overriding or adding to.

> --- /dev/null
> +++ b/tools/tests/Rules.mk
> @@ -0,0 +1,48 @@
> +# Usage: include this last in your Makefile.
> +#
> +# For example:
> +#
> +# XEN_ROOT = $(CURDIR)/../../..
> +# include $(XEN_ROOT)/tools/Rules.mk
> +#
> +# TARGETS := ...
> +# ...
> +# include $(XEN_ROOT)/tools/tests/Rules.mk
> +
> +ifndef XEN_ROOT
> +$(error XEN_ROOT is not defined)
> +endif
> +
> +.PHONY: all
> +all: $(TARGETS)
> +.DEFAULT_GOAL: all

Make 3.80, which ./README still says we support, doesn't look to know this.

Jan

