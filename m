Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBVYGQH6DmoSDwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:26:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2285A4C2B
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 14:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315132.1584990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2TU-0004Rh-BN; Thu, 21 May 2026 12:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315132.1584990; Thu, 21 May 2026 12:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ2TU-0004P4-8l; Thu, 21 May 2026 12:26:04 +0000
Received: by outflank-mailman (input) for mailman id 1315132;
 Thu, 21 May 2026 12:26:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ2TS-0004Ox-TR
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 12:26:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ2TS-00BBJa-9G
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 14:26:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef9d4-2eae-0a2a0a5409dd-0a2a4501a88c-30
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:26:02 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ef9d9-c1f2-0a2a45010019-d155dd35d85c-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 14:26:02 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so3700868f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 05:26:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa92f622sm2773425f8f.24.2026.05.21.05.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 05:26:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1779366361; x=1779971161; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eVrVi1QZkBKSzOhKxEdqYODdn4cdGHZ057kaRooKYA=;
        b=NAht9OmsBA9necJpgtoOTFPLTzPKHM7W4r0tGVFB6NtHkPmUfexKC549RrLFp1qUMo
         R8QajhmFYz9L3iEl0YMJiI6OMu9EntfJB5fV0XvmbD0IwNuzQN6nk7jk3iabxjhzZqQG
         7TvwW0BDtCK46hiyg4zlsUWBTtmX7EHXtnTdjVosLICCVWRJJp/dq2mrQGvUTskYfduk
         b4Rwm+W6x/vS/Of4BvsQHgyrRlaWUhPC75BCtDyvcQYmTIw8n4E27hm1wltWu+m5eAgg
         WsF/61zrnZqgMiOjgBFAoumtxaRPI9dixYLL/KrbkbWdGYSP+1Eh/LCeDLhaahqOVLCz
         y3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366361; x=1779971161;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3eVrVi1QZkBKSzOhKxEdqYODdn4cdGHZ057kaRooKYA=;
        b=TM4VF3rRTE3r3026fNgy83GpuXjJzi27mYkT02bwLmFMWiGaKDfW800uc+4XjOhqOf
         a0TfcKVHBXObbrjeqwlADVaR0RhYNcGlv6eJByVSP9iiaphyefIiwSLoavoYsT1jQlHr
         zl0M0CMyjSac70ZK7EoS2gHCmNjR3bEQkOEnuGpjJP1C+xxt4knOfeI8RkfPo6cB24qA
         2Uu6jPfcU8fZvH0dyVcYy3wbEq33jyQbbVTle3e/mwsA4y1l9VVfSUMP6J8+l3ebLbcM
         lz4RGp1Cnmc/pz+/YgwD7gKHy202N5B/Wc/z3DYvGRvYvK4t1/KCdYPDNCd1f1QH1Fjh
         g+ug==
X-Gm-Message-State: AOJu0YzS6Iwe1jLb2QfQf4dUcvOtOMdv04PrGAGLHzPBfFTSNbb5QGhT
	YGr1Fe2qy3afgIPJ8tQnnFtfGgjNHXa/TYlVlk+Nj2QvQIz322JNFGUfqFsLzrUWTahxdxYQ5jP
	YG1w=
X-Gm-Gg: Acq92OEuZBkb5kttpGqfnF72Itg99JZ33npMSA7UeSA4BPFkCr3g6rL6xGXzkjWQG2y
	NiH5FEd3RjoVgTKX16ZMZPmaef8jK5BeFkNLyU8pyM61ifW++ztkbSq1Vhj/uCx4C0FO+SymtPI
	a2vNG8n1/OdVlfbBt3Jv7S8zRqDAQgkCK5bdnoN5gojJwNSIHFKjY9UofjH9vUlP/Q7dJqGT48r
	oyFdUOUx46eE0+v7Y06NYI0dnDVRju5YGJxkxhkm2tfEGasHRmfx0M6oWXHB3fFUu5AZoZmraxp
	0Ys1sSbUgUSlEZj9u8KTaeGmE1yLACVkB4v/d9lO0mA+jzvvyy5FaPW7k58wwWwCZJnIRoZa7cC
	rBSfx3LKSvSNYPvhaBYWAe1MX3VyrEyOYPpxy+jqLNH9EWwe+BpDfayqDYOIQE67RlMG0/qoaky
	qOcA2ZNTLGXjIPJ5njDnJgfuvaEkXvrsx4ZqFMp1jqAMArvjb+iHCp4A032aHhlMlUeXWCH8rJW
	AyGVaVpLvmUe88=
X-Received: by 2002:a05:6000:178b:b0:450:e5fd:e1a1 with SMTP id ffacd0b85a97d-45ea38d1c8dmr4454823f8f.3.1779366360787;
        Thu, 21 May 2026 05:26:00 -0700 (PDT)
Message-ID: <2ad2b572-45b4-42a5-9b7a-80eebfacc80e@suse.com>
Date: Thu, 21 May 2026 14:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: don't exclude time.c from scanning
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
X-purgate-ID: tlsNG-d62444/1779366362-AE95FFF4-419EB3F7/0/0
X-purgate-type: clean
X-purgate-size: 178
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,suse.com:mid,suse.com:dkim];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 0F2285A4C2B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

1: x86/time: address Misra C:2012 rule 8.3
2: x86/time: don't exclude from Eclair scanning

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2543286982

Jan

