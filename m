Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ORrHOtRxWmD9QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:34:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9307337A33
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 16:34:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264324.1555933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5miO-0005bP-Pc; Thu, 26 Mar 2026 15:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264324.1555933; Thu, 26 Mar 2026 15:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5miO-0005ZB-Me; Thu, 26 Mar 2026 15:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1264324;
 Thu, 26 Mar 2026 15:33:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5miM-0005Z0-Tf
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 15:33:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5miM-009Sm7-9a
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:33:42 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c551d1-bab6-0a2a0a5309dd-0a2a450bea4c-34
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:33:42 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c551d5-ef63-0a2a450b0019-d155802ebd61-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 16:33:42 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-486ff201041so10063565e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 08:33:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c7cec3sm34609535e9.6.2026.03.26.08.33.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 08:33:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1774539221; x=1775144021; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yxhh10+xfSURNBMCt1w28m6g5PjG/+lhGkZlOGF6vg0=;
        b=b0lj4je1BFTPajxjaKAUU1v4Cp98D3nqZPgkSncYudA+WyDm4RDHi1T3qdOwimrwnr
         LQDRaQqIWbS89Bq6+XLEpYw1mk1XEY2W6Sj4IX6HKN77sGYn2GGxHtGrjTLBHtJ2rior
         VJpfNIZ1tqtdk+wGsJCYv5bZr3/dtH4BJlats35XqnNT6AIzCyFoR12heBQLo0iIMHjh
         UiFpNf8/N3WjjDYqZEGixD+GcfVgiZUIuJs6Kuu3d9l8YGeGIlfNqWtgXQpbyFjGGgug
         hyHWm2i/wkqWbyPeKij+zW5APFsHdHe5nX1pwgLSJyMRGm+SrZeOt+6ugjUTuFSOuPhH
         eUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539221; x=1775144021;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxhh10+xfSURNBMCt1w28m6g5PjG/+lhGkZlOGF6vg0=;
        b=Sb8i/qaA87Kk81sb5uzte2gv7ebiSxuUERN0DD2IUV9/1Jjylhoq+QlBiKcScIKjVE
         DD2MmylOivqJGBf3m3TBJYYGwKD0Rya2DSppakb4sL3YOMB3dINPKjIlqU6HIc/mLAmM
         WOw9/hLppvKqkLjqjsCGu1Zk88QmrBTitzKfxeUfys05k+hgExUWRWvdSJQU8eFYBILS
         PyKbQXDILIO/T24sc8OQi7apo9BeTa72pEXz5TxOZj7Wm0+BWp/EHs7haUwbd7cmdWfr
         V2iGIJCZSljQJF1Ys/HvIVGY/DCOiVkD+77dmq+rah4S5i+BVRTyDCh9qUqHu+vCCrsY
         Dm/Q==
X-Gm-Message-State: AOJu0Yz5Vn2K2WXUQsMCuLWW2jBGWnzjqtNsT8GFtDHSPfMb+5F8wxwt
	Arfl6tTVpxeV1yItg3FT2tnHWapzI+CkTpg/NGBNwl76njSMxQcfBX5gMp5NcaoK6w==
X-Gm-Gg: ATEYQzzpIiyrAf+41g3w9E7weO0++Oo24qOtk0iez5Ef8DMAjwA+x4nEfrH7I/3gETh
	ocxJuwrvVQhrOOoUCB56vVdPfvPTbT7v9XKc/eUxvoMY7OJjrvJh0voyi0Ze7YoIluc9BIpcPH3
	FtPi+vq6M/MlTDoRZwFp2NfeY+I2gpPgmhqycaRpz75Fii9EBc+9XLDn/ZAoWm7acWIRzu9tugy
	RDLWbYRal09N0OBc80TbMWW5oCn2odTgf6oE3hnzM5tTo4pRytsWwl9JnuPo0U9XC+Ya4+C6m1m
	eeW2YvqImk90nMkprE6D9vGkacIWWmc0SXTddOW03iWpPa3x0SAC4la208BE5rrrthpMh7qL6qf
	jVTHrYQtzGBilZ60gM0uKCfKnUM+PSq5Pjl9hGnmdIYd8iQxCkuhEigKyr+VC9xV7Rqe8mH4Pm7
	4fMqQib5mpC01oSWB1O0omfqdIB2fYwQGbJEl29JmtK5AM+whr+YxjBkuP5LReWikH/WQ+SPeTW
	o2ir3r82g87FMQ=
X-Received: by 2002:a05:600c:4447:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-48715fd4d49mr115156695e9.10.1774539221341;
        Thu, 26 Mar 2026 08:33:41 -0700 (PDT)
Message-ID: <d55033ca-8525-4dec-be8b-32144ff6c521@suse.com>
Date: Thu, 26 Mar 2026 16:33:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: Xen 4.19.5 released
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
X-purgate-ID: tlsNG-42698a/1774539222-BBEA2112-FD92BCBA/0/0
X-purgate-type: clean
X-purgate-size: 544
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-announce@lists.xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:url];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C9307337A33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All,

we're pleased to announce the release of another bug fixing Xen version.

Xen 4.19.5 is available from its git repository
http://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=refs/heads/stable-4.19
(tag RELEASE-4.19.5) or from the XenProject download page
https://xenproject.org/resources/downloads/ (after entering 4.19 in the search
box there).

We recommend all users of the 4.19 stable series to update to this latest
point release. Note that the branch is now switching into security-only support
mode.

Regards, Jan

