Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zky5IZMQMWo2bAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:00:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02F568D596
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:00:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="QYaFRl/g";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338821.1599877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPeB-0006x3-Ov; Tue, 16 Jun 2026 08:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338821.1599877; Tue, 16 Jun 2026 08:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPeB-0006vZ-Kw; Tue, 16 Jun 2026 08:59:51 +0000
Received: by outflank-mailman (input) for mailman id 1338821;
 Tue, 16 Jun 2026 08:59:50 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPeA-0006uL-BK
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:59:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPe9-003rZZ-7E
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:59:49 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311062-5cb7-0a2a0a5109dd-0a2a450bbad4-46
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:59:49 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311084-212f-0a2a450b0019-d1558032e0ca-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:59:49 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490be29c1c5so47118685e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 01:59:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4fd31sm43245565e9.4.2026.06.16.01.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 01:59:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1781600388; x=1782205188; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nurJDa/+cduzPTcAaGzvFsiIXKoctAlrlCQFUVpz8R0=;
        b=QYaFRl/gBG8cd8bkdLEVXMjE1sorUI/G3pBfdPw8uz0e4T1Q1ZNZ1+GomPEvw0lEzZ
         SxTiJcJYWwEqbsSETPZhizCO5XV2dQq1kx+WmpEBZPc/RQbQ3kt1hx9QccM+ccH8gGE4
         OfF9CNuhY9NVbU+8t/1t8YomgzUOUNk3QDRu+/wzlFOqZcRLtTOiTi5wZP/t7MohBsL/
         Xwg7FbN5diIueW1TYONzQf6wqQsdKmwTEOIITv0cw1PdwqgGD6a+wNlEgtMJEB9am7+1
         sICCb/OzA0d35bpF0xfDJ94HiScyxifDdK+kUQmJgYma89/jpoD7iEt3moGXHex8JjrR
         OWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781600388; x=1782205188;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nurJDa/+cduzPTcAaGzvFsiIXKoctAlrlCQFUVpz8R0=;
        b=eT1Jk4dHwWKRR20sR7PX1164FV93jGOqwvliZX71/6g3SynU72jakI2zoQGnX72oG+
         D+Er6muE6mmCzRc7WWC+yaBKxy1EJNLkYT3mLn3z68rCoPqiStXSWInhRXs7XaXYtNJv
         N6mx1t3LspYIodsaSR+Ql6dO0anYzn6p/cmv8311JBlj+VQLHnn0QZ0D1eMx0Y+LOKfl
         BTy2jGAU1gSHM9POXoUfhgymO/W0TsabCEbN0XCLmSiz3R5bD5KwC0eKeuquxLrAEsm6
         ZIcu0AhBZfZszhkvNnSiamoJxEkFoL9+8putPRZaNe6Bo7AuoppVLpdMRSFjiQ3AYU5u
         +cEg==
X-Gm-Message-State: AOJu0YwYMzptoKD9zuVqlUtkbgTNv7BR0dED4Uofjo6d6H7EhtECCGn6
	oLb6huhCx4GCFNhPIKTqGuMmw6HMtS9jK0NIoEiPhft/vV6Wyuo7ejEDphxFO4k5ncoq1WzNhqk
	uuoc=
X-Gm-Gg: Acq92OHeqfgrynHOXUK02EX+SsGEb5fSHQzF96i+DZBOw5dCWvPXkAGXN6Yd44h6b4g
	vk+578TNwn/vzlfzdoWCR64xqF53UcUrnibr2xa3AxxVfxYCHHo6U2/B+3KOW2aNlpkWYkbf3Ci
	HZY3wmZCr2WTPKCEStKsMxuWcZejFc6xUwRZzWZ1NHW4eOKtoPgarChwnnLqiZPVGi23R1C/XHM
	sEuvzsYIckaqsHrubxFhHe8FHkb7VwdhIEifo4HYJl/Cwmo66/CTQUqcPnyh3OEDtjZa1E20etm
	+7ea9WTGHejp5/dqPekcBbvaaNGkZz09OZrQDEN19yszukTsVcH/XNDm6ioxDbZT7H4nv6VZ4/y
	3SHQ958hFDFjazrPLKA9G5FkVYkPkg06OhnkEKE+b9cWPjbn2pQ9Tg4F4HScTuNzBGO0UQ1cWTG
	0aCBkL3nrtv5Ueq6Hoj6vLQcPwEePFJ+Kp/NUqMuq5W4Msnn6ysQG6AF/dB/TRwr535XN0lu/gV
	g+Vp7rvm7hQfqPHhA8cs3znVw==
X-Received: by 2002:a05:600c:1f89:b0:490:da12:f1fa with SMTP id 5b1f17b1804b1-4922ffa09a0mr44192025e9.31.1781600388518;
        Tue, 16 Jun 2026 01:59:48 -0700 (PDT)
Message-ID: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
Date: Tue, 16 Jun 2026 10:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/4] hypercall string inputs
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
X-purgate-ID: tlsNG-42698a/1781600389-12D77F3B-369C01B0/0/0
X-purgate-type: clean
X-purgate-size: 734
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: E02F568D596

While doing the XSA-492 work I further noticed an inefficiency with
safe_copy_string_from_guest(). All callers pass PAGE_SIZE as the maximum
buffer size, and with the function adding 1 to append a nul terminator
the resulting allocations are all order-1 ones. Which we'd better avoid.
Require respective callers of hypercalls to nul-terminate the strings
within the buffer supplied. While an ABI change, I think it's an
acceptable one.

1: libxc: adjust string size calculations in xc_{,de,test_}assign_dt_device()
2: libxc: drop size parameter from xc_flask_context_to_sid()
3: libxc: adjust string size calculations in xc_flask_{getbool_byname,setbool}()
4: lib: make safe_copy_string_from_guest() validate input

Jan

