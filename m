Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EmUFh9SxWmD9QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:34:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0335B337A70
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264334.1555942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5mjM-000667-4G; Thu, 26 Mar 2026 15:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264334.1555942; Thu, 26 Mar 2026 15:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5mjM-00064I-07; Thu, 26 Mar 2026 15:34:44 +0000
Received: by outflank-mailman (input) for mailman id 1264334;
 Thu, 26 Mar 2026 15:34:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5mjK-000641-Lw
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:34:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5mjK-00AFsZ-1O
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:34:42 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c55211-5cb7-0a2a0a5109dd-0a2a450acf84-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:34:41 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c55211-1772-0a2a450a0019-d1558036a5a4-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:34:41 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-486fc4725f0so9900945e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:34:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871fbca47dsm31284155e9.1.2026.03.26.08.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 08:34:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774539281; x=1775144081; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SxePKm9MA9Ww0nfWWjfwiW1VHF/AI1OJVgyRpuDvdvE=;
        b=aystEFJvKBBCD0rnYI5XydbF0SyB4gOcLFcgOLaDCG2pDQBzxRp/sAh8NvlM8AXe0U
         dbCD5E29AhEMU7riKj/4qaaWXC4cOqC6NY7HILj1f4CgykS+pyY6D60vmqCTI2YBKmfz
         dUR/BTv0puncW4CFiGxiwaHKrpmYRQXNA7H9ORTgAd1GFUxFYi5oYqUsfrqKCY3EdCru
         QViQo01APY9BmicvSlUqfYaaAgxJUY3kVQgLGfVglHJsydXNjrws+nQ1xmoF3yp6GF+s
         2CNndyUXf1fWvOnDZ75MBt1jdXgwWMjpyGbqpXoGDZs9DKwMQMRVNwl9L3u/C7rvZVDK
         AbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539281; x=1775144081;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxePKm9MA9Ww0nfWWjfwiW1VHF/AI1OJVgyRpuDvdvE=;
        b=WB1M35eavp+oG3r70rzCqth8TviQN2ECJ094/ZLa4nLA9dlnQC1kFVcHJF58o01z1o
         wREeI5KvZ5JYpw7XXFtD7izzcrHg1lMRlO4RJ3iVN1dq+9l/bFCBoUgqaN1yyCr8tPev
         vtGWh0SGQYChzwQqnJ/zmZkOQA5g0fzn5jEOcXG89rdaR2YIgTculXTUO6s7q4gNq6Rx
         TZtbxGDquY4OTkq3P4jP9gZNhHdvo+M5K9sAZrW4HEBZd+doFVUJDLC1Gq0ag+8H4pO1
         S8EDtktq3eOVITJ9tg/7I6vjOI87RdnxFxAKEJHy7TN8I/efcKEeEvbwRAP7FPTKddk5
         9JTw==
X-Gm-Message-State: AOJu0YzJmfhZiXcCgrJMgdkrpA5UJqToTMUF65Wqftxohols1Ex3ggMN
	7h6R/igVXhD5WG9Ec6i4yN7I7FV9Ul/WCrI0gh5WxlAWgUyWEJze1lQQ6ommiacKIM0ct4Eeu/1
	zgCXaIA==
X-Gm-Gg: ATEYQzwh4eU8RqvvincoGwTAdKwCzcKla8jKwoP9nr7TnQypvZDjLskp69oA92BxmNS
	MZDwLvEUHvbgygvBplYltm357mUiKy9rz2c7JFNJuAoEFpk9YcE+pHxeMfPxyA6Qrf8/Px7UwfM
	RTWqEynf+XDelQDF5gLbcU6GA7V/G0ghPk0Wm5zEbqMjtfWQJAnOLeOLz9NS9z/wYcCgnQ81yET
	fyv6JOJgAFGHyr8Qz2+GOpwNjyfxx0Eh6TnMXzAexyTYLbxTuJy+ql2Wg/qYfhp5nMQvxq/bSwP
	ou3voSU9oA4sHI09RLfMS795T8AC7E72IdKeIDAuopxUQIR3HgCwhqDeQkxdqtMtS2AoS3pzIxL
	brJqUaTWhkeGX9uuV0G/KXGhQSNhmawPba8924SCUip/j8uouwwYTqlExW5FevX4TSu5utqmX+J
	xvL33SwL3NP9X4xYpjUnb/TZtXr1+a0imxvbMTLm4i2FuwKIsJr3LWkE5xiNYT8A7Zefpk/jn6M
	e/q85CUVxi1+aI=
X-Received: by 2002:a05:600c:3ba1:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-48722bdfeebmr35611965e9.11.1774539281284;
        Thu, 26 Mar 2026 08:34:41 -0700 (PDT)
Message-ID: <cf604fdc-0818-4d23-80e3-dffd9fa224bd@suse.com>
Date: Thu, 26 Mar 2026 16:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.20.3 released
To: xen-announce@lists.xenproject.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
X-purgate-ID: tlsNG-4011c0/1774539281-BD689900-D1274B7F/0/0
X-purgate-type: clean
X-purgate-size: 425
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid,xen.org:url,xenproject.org:url];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0335B337A70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All,

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.20.3 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.20
(tag RELEASE-4.20.3) or from the XenProject download page
https://xenproject.org/resources/downloads/.

We recommend all users of the 4.20 stable series to update to this latest
point release.

Regards, Jan

