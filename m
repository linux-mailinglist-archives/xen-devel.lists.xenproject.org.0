Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKj6KSsqBGrfEwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 09:37:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4B52EBFB
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 09:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307644.1579245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN49R-0004Rv-HV; Wed, 13 May 2026 07:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307644.1579245; Wed, 13 May 2026 07:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN49R-0004Px-Ec; Wed, 13 May 2026 07:37:05 +0000
Received: by outflank-mailman (input) for mailman id 1307644;
 Wed, 13 May 2026 07:37:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN49Q-0004Pr-LZ
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 07:37:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN49Q-00GtbJ-2P
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 09:37:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a042a1c-2eae-0a2a0a5409dd-0a2a45078024-10
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 09:37:03 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a042a1f-229c-0a2a45070019-d1558030c5b1-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 09:37:03 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so36431135e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 00:37:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8e566cf7sm60450735e9.0.2026.05.13.00.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 00:37:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778657823; x=1779262623; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m+FQHvz9kO7Kgw3skVSIRaX9Sm7rbHYwzhnzPm6IE8=;
        b=C7oiO3NIw3vJD+AU+CW6gYd7qzsSsZjoQ3GP3qTZhsgqKZ6WEiGWMHboM/YIzgRkZN
         Me51E5ZnMCDp+WXZ2Zp2IUWoNAIn3U9jG3xPrBMB4m6jHnFCjy5VPPqHeFUbu0R8FPEA
         g611NPHgo1e3GxD4BF+8vxvtUL988EU1tG2Tr66pMR18O5+BjszIQKojA3vbkOhmR1wu
         zr4K2yX4RXxKu9xUXTxcg+9jeFvAV/A7oX8sU/UEzvefbh+Uq5LHFKlFy42VilSIgtnY
         BUc2e/aKX9QjinUj07sBnl52L7ZBbtpqoPcQV20NvFVw3YZgY2n0OKfSyBCVHTp/LsH7
         1urQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778657823; x=1779262623;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7m+FQHvz9kO7Kgw3skVSIRaX9Sm7rbHYwzhnzPm6IE8=;
        b=cVVhhpv0k3drNNhQqcqHGMDS17v13NjA17JqY2jRsjmQ64oG3aLBA5xT4ucw1nRBKW
         Actyn/40UATIn3iirv0CJCZ0Wp//cEA+rS3goq9A4+SfgzPZ3p6pOPdOWLnSCkcrgQ3n
         rvZcC2btFIvVDyGWURxpEJ4+HxNw+NwCY7sc6K8ipXMx6QZAGKE4urxoOhAMboRk/RLW
         ZidKRnV57fPjhhKr73nNsmd6cL7ichD9fEJFx+lZdwJe+vxZckIIHOsvfrU3H1HKBJeY
         1DRgpvAIkQHTlSDgN+leuDvg5QiiNEqASTP/1kQcA+CjcfubSI+Co8lXTpRhWqux0vlX
         izRw==
X-Gm-Message-State: AOJu0YxpP3z6OEsBQ+Z5doe443khixSY/DeWAtyGHLGU590/YYZ0I2BX
	f2MAhV+d2FWGkNfKkwg1cV7VMgIroWya8WRrvWDeUzNFy2Ls/R75KgfV9NmAJ6Y3Emen/iZ5ucJ
	1BAY=
X-Gm-Gg: Acq92OFwzLQgQ5OyEltJfAJuikWIJfQeEnftgW914ypFcWKWDZrUEQGgVosHC0gL+Il
	2seYmjvdT3y3Gd9hyaGuk1sP1oDG4uYBnaRiVzUYzf+w9Rka4PUJAuPS+mzfRGnKTUSuRu3J5qZ
	TN0Sane5MfnQ5RfyCxkZcG5rUM9nn8kwVrt3EApy3LRuKz6odMPO0bYThOB4pzl8i4+1Yda8q9y
	JfYP8ITg6T7no4fIOOg30ZYQ/laSNXchIGvCspogxZu3kCsLNoOuj1jKc441+llYuZS7Y8Mv7Jd
	EOc/ZGNYAC+fvyBsCiyoamV37qL7S2Ch+WeQhYndKgfO97enGyJQvUf1dOKDuXzYvizPQI/K4lM
	eF3UHKfTsH8MNNy8WqmXdz6omIAm6RB88LTmV5ixbS5qw9mQDi4ps1FyGbpn44w+9jqpaCaMVPf
	uOZ0eM44+WNR28qwEwAuetmHXH6uxXZJddw0gMqsnPi5Ss4Ze2VvhLuMbeOo48oJTYF5+CeoBWY
	68PABZBL/Ix3qLcEkpksmcQzA==
X-Received: by 2002:a05:600c:4f54:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-48fc9a4b276mr29361245e9.27.1778657823436;
        Wed, 13 May 2026 00:37:03 -0700 (PDT)
Message-ID: <8d758429-8c2b-4578-a2fc-9ac7dac0a62f@suse.com>
Date: Wed, 13 May 2026 09:37:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xl/parse: mark as GNU source
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
X-purgate-ID: tlsNG-ef75cf/1778657823-28678C48-587E8332/0/0
X-purgate-type: clean
X-purgate-size: 608
X-Rspamd-Queue-Id: 11F4B52EBFB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Very old glibc (2.4 in the observed case) declares strndup() only when
_GNU_SOURCE is defined.

Fixes: ad860c6454ba ("tools/xl: add xl commands for xenstore quota operations")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This follows what xl_info.c and xl_utils.c already do. Question is whether
instead the Makefile would want to uniformly define _GNU_SOURCE.

--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -12,6 +12,8 @@
  * GNU Lesser General Public License for more details.
  */
 
+#define _GNU_SOURCE
+
 #include <ctype.h>
 #include <inttypes.h>
 #include <limits.h>

