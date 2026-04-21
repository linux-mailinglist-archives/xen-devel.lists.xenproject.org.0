Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCorDtU252mg5QEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:35:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9770C4383CC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2026 10:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1288600.1568855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Zj-0004Su-NQ; Tue, 21 Apr 2026 08:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1288600.1568855; Tue, 21 Apr 2026 08:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wF6Zj-0004QQ-Kn; Tue, 21 Apr 2026 08:35:19 +0000
Received: by outflank-mailman (input) for mailman id 1288600;
 Tue, 21 Apr 2026 08:35:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wF6Zh-0004QK-Qu
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 08:35:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wF6Zf-00Awwt-BL
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2026 10:35:16 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e736c4-bab6-0a2a0a5309dd-0a2a4506980e-2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:35:16 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e736c4-7371-0a2a45060019-d1558030ad3d-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 10:35:16 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso15119105e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Apr 2026 01:35:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb735d3dsm228452835e9.2.2026.04.21.01.35.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2026 01:35:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1776760516; x=1777365316; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZD1nJ9q+stpFZ0eRmdPtYY2X3vn6OBKJxCf41nTR9w=;
        b=C6JvRyDDKb2E4D9X2eJomd8YejolLh36GZbqbEGzNAjlknHGTFr8bONxcDXDUmvLq5
         X0B+yiSpKJ7D0nLocLhyDL5d1cf4uKrHRR6K/wt7wZt97CMICawDEo6Gpj/7KYsV3FiD
         ldVfh6f0Shar0+9E535Gz4mnHx5WMk6q9BYR8Bw435c67rhgC/uABAWAJm3GaYbwSU1w
         Gh5jN6ddk7fP5Im7Kqzner2DrUL5D+7HFURUr62hL//XBWj2QX0GpLbIsO0gvc4Ah5dy
         jk8oaZQLxCw5ANkZgt66OPgv+/Wifz+bHM4Rx9dyUKgL515zihRT/7hCI9JfLz8jbeFr
         uxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776760516; x=1777365316;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZD1nJ9q+stpFZ0eRmdPtYY2X3vn6OBKJxCf41nTR9w=;
        b=UQqjjkGlFs7JPWwv5yshBJP6lQ+VGvm9ugrjLZywld83IpoV7s1b0vi7iPcPFMi548
         CuUp0Kt+d31BjXKp3NVL5QqbPlEjfn8Bq73pVUGOwbaWUTZDQkzwMS7W3YOVUwHczLGX
         CezU12HqHz7YdmC/dfFB2tgJUNzWuDXfXkHfz7GXGZvqqOoL7aLCy2gd2dC/O2IBIHzx
         KVIDHR/WhqcXFfZN8aI+mXvNvyuWtIuH80UAwaYatifJOgWsbDR39rXL+mPTCAxHK7CY
         hb5R6YXlMrQUXl//qdy+pLX8bp56EqpBZ6x7Qu5LzVxJNiYtk2eEdM678Bwa6bgY8frw
         uEiQ==
X-Gm-Message-State: AOJu0Yw6Ic/W1oEUjGzvb+wJHDGFCud5vo4LFf9eK1k+vgmZZzI2qBRf
	pSXGlvbs4KqjhU4vq6WpHByLftGkfJBiJAmSCwg6NSd3i5ux4OwWPyGmCIAW2sLel5aLogSlikI
	lHF3Qzw==
X-Gm-Gg: AeBDiesuh4OKlhZto9E7bqyON3HetrVMl3umuaBDpfLFzXfu4fpzKv6XIYC/Zl3TvZe
	2c/iDhMISR0g4f/sOawzAGSn/6otei53Lir8qCvPeWPLkiq1nSPON8GSgQpXwzL2vex6twjjSQg
	6bJE0TtrRQ6EYjhU3SWorsgOL3PKWUPP5TfYAS/Qa7g5G8OTU+Bt6UCSnUYeI0pNN/6QRZXauzZ
	HatSHL4xuT4ZfTcnKLWMmcxCAU7plFnQ879FYQDfuLwyZ8iZaLrQb/VBaNPNsApBhwQ22WCf5Tl
	S1N4xa88jH5gZvl/iFUN4dOFnm7bN7cPzZ1PpyLQQToBb9CZ1siwJNx/8lljP1IRe9FNApa9nB1
	JH8Dja1ZSJs4MXDNQALS7n3xkoTmV4DwEzl+enXWDPFlHeGKgGH+nIUyMQ7kGhMIaYryAfd6wHy
	lt70Gz+qtc7RpXadC0wLEik8e+VY4BdMTWZZU93eOjsoc6RtqqM1p4E5IXn8dNnt18fn7fW6BOd
	TGR67pMbxrLAUn0gZ11TTtv1g==
X-Received: by 2002:a05:600c:64c8:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-488fb7a0d24mr277009105e9.30.1776760515939;
        Tue, 21 Apr 2026 01:35:15 -0700 (PDT)
Message-ID: <5f299d7a-be1b-4bdb-a10b-37c334606bdf@suse.com>
Date: Tue, 21 Apr 2026 10:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] move KB() etc to make it usable by x86'es mkelf32
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
X-purgate-ID: tlsNG-16d1c6/1776760516-90E7CD75-177690B2/0/0
X-purgate-type: clean
X-purgate-size: 210
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 9770C4383CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

mkelf32.c doesn't want to include config.h; if anything, it would probably be
autoconf.h which it might include if so needed.

1: include: move KB() etc to macros.h
2: x86/mkelf32: use xen/macros.h

Jan

