Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBq/IN69wmlflQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:37:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06303191F2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 17:37:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261110.1554229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54l9-0001nJ-At; Tue, 24 Mar 2026 16:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261110.1554229; Tue, 24 Mar 2026 16:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w54l9-0001kX-8H; Tue, 24 Mar 2026 16:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1261110;
 Tue, 24 Mar 2026 16:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w54l7-0001kN-SS
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 16:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w54l7-00BRGv-8M
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 17:37:37 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bdb6-bab6-0a2a0a5309dd-0a2a450a8d16-38
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:37:37 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c2bdd1-1772-0a2a450a0019-d155dd32c58e-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 17:37:37 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-439b7c2788dso2683636f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:37:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b64703c7fsm39269135f8f.23.2026.03.24.09.37.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 09:37:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1774370256; x=1774975056; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XnNfB1/2AyY2UunH96rDhznb/JdhQ9aY7JCKKR0Fvo0=;
        b=ZQ8DTCrSwQv1HLQL4sChiMAn4CWS/WvlUz1ijtilZJL1hduUy0vPxEUPMrsrvqMBge
         GNod/sLm4Fpy0UQcSBRpkj0pKmI+DXeFTxN/d2BsQv0V2uASUBHYyMccvcEAMcfEw147
         WfgLpBdC218mrADLDyBYnENx/eGcuB0SFAY3aRjYD+fR/0WKw78wbxsmfHJpzeeEP6je
         XVYrCUxoMTJkTR212BQgvanxOnPP2z2IPuEbbygPo2jw4d5FjJrR1WYvu0XAd9PZNgBt
         TTDLG7m++pXD1z4iJpcc/idAPah/vdDF0V3q4uLzb7l1bb1EDo4i3ovXA936ThPigyg7
         NKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774370256; x=1774975056;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnNfB1/2AyY2UunH96rDhznb/JdhQ9aY7JCKKR0Fvo0=;
        b=rI2kvSbZbRJFZNZThOatMhkqzooOxBSXfcFKprPodmCnchZINm3RC0866g0USjMQMT
         HhY/z96WYBWcsDQ5G31C6ThxiZRc+toSr+bX89mdzG2gtCarf2MMYKMQAHVHk/fHDc7u
         /INYwYUSl4qnpaXAivENbOEuJ2q2yv4C/CWqUuU47LE+m54soHd4acBVjwPTBupZn3M/
         xzx8XHm/beM93MXdnR4C8BbfTii6fQOnOlXR7tVZJOXgiSDIUCrHe/RbxBQj11oSQSMy
         LSoWznqrNG3o18GTr9HX4J9+CtV8HxT5e+fMuQecnWjHsCEaEvoZR/Hkbx3/lYyZfugF
         BPbA==
X-Gm-Message-State: AOJu0YxPAspzVx/fjC8K+hdM81H39kvAqkwvTU6MQ5l1JkPCtvP9tea5
	E2nWxoBh7105SxwwXge01NE7NcfTSkaSvyiQoa/bpZhcH6sqXBZDdm1P+pzDujf5eGdRWjTZcl5
	2FTBidg==
X-Gm-Gg: ATEYQzyvsn7JHGQtU9e0KBmjhX91S2Zr5RwPYTY3sBrBsCl+KGL0FKGK0H86ewlLqIW
	OcLW9rObJAErpB685fEuuJO5d3aqyQn3p10mK2veGnTGycKERWjTNGUp8Y2nw+jp24/53Xfdb8+
	wB77TnSJhqHXbnjPOPgVTC+DRT8tuRNWzaRWHVjDZIp3ditY6GmSfa0DVGjMrJ9jXHIPjzfGuwq
	Ago3QwSH4RiHh48IjcNGMYN3E+c3h3XLHmAfsd763roh0HcmF8ECI80GbqUG4NOb5naK/AAV8Cp
	cjxr2FRw8BjCxSQC7R170UfnGnW2iGc3mFjBMkG/+6VNLIWj/yXgIZXDqFsH//O5Ek7oszatd3Y
	D3IVZo2iSZ+vjs2kOuLpQmazvoTrl6drYS+s1Eugvqzd9B1qKkaLvAcuVYzcRWoh5EymFv327CK
	qghCaD9Z22zl8QlEMoPiKzeWkpbxjCK7q7cf9wzP8IhN9R3Dr7L4s50jJJve2piQwETv7x8CXtu
	F7kfkiGmrpOoRVuBuJeO6xFhA==
X-Received: by 2002:a05:6000:26c3:b0:43b:42af:75b with SMTP id ffacd0b85a97d-43b88a3a379mr178235f8f.55.1774370256476;
        Tue, 24 Mar 2026 09:37:36 -0700 (PDT)
Message-ID: <97d6ba6c-4ffe-4e1b-814a-d51a0bcf363e@suse.com>
Date: Tue, 24 Mar 2026 17:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] llc-coloring: improve checking while parsing
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
X-purgate-ID: tlsNG-4011c0/1774370257-BFE9D900-DD563593/0/0
X-purgate-type: clean
X-purgate-size: 1151
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: E06303191F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We can easily avoid the risk of wrapping UINT_MAX <-> 0 by applying a
check against the compile-time-constant maximum number of colors.

Additionally the overflow checks suffered from an off-by-1, as the parsed
ranges are inclusive (e.g. end == start being possible, requiring 1 array
slot, while availability of 0 slots was checked in that case).

Fixes: 6cdea3444eaf ("xen/arm: add Dom0 cache coloring support")
Reported-by: Kamil Frankowicz <kamil.frankowicz@cert.pl>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -76,8 +76,9 @@ static int __init parse_color_config(con
         else                /* Single value */
             end = start;
 
-        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
-             (*num_colors + (end - start)) >= max_num_colors )
+        if ( end >= NR_LLC_COLORS || start > end ||
+             (end - start) >= (UINT_MAX - *num_colors) ||
+             (*num_colors + (end - start + 1)) >= max_num_colors )
             return -EINVAL;
 
         /* Colors are range checked in check_colors() */


