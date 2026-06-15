Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lo+KBxIIMGp3MAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:11:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BD4686F7A
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 16:11:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=OCfm3nTa;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338254.1599256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ820-00006W-2n; Mon, 15 Jun 2026 14:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338254.1599256; Mon, 15 Jun 2026 14:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ81z-00004y-Vz; Mon, 15 Jun 2026 14:11:15 +0000
Received: by outflank-mailman (input) for mailman id 1338254;
 Mon, 15 Jun 2026 14:11:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ81y-00004s-03
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 14:11:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ81x-000vV0-D3
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 16:11:13 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3007f8-5cb7-0a2a0a5109dd-0a2a4504abf4-18
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:11:09 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3007fd-1dec-0a2a45040019-d155dd2cac90-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 16:11:09 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ef6565cfdso1581550f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 07:11:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c3fcfsm30864787f8f.26.2026.06.15.07.11.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 07:11:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1781532669; x=1782137469; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTVwg+1rtjOErQ0xcrTdPPHqNAYwMKSCfLxEt6Ho6zA=;
        b=OCfm3nTauY7FbnbAeE8bUxwMIwtt+QJGL+F/MVvBRxvmFLi6zA290c+d1sdlQYT7tm
         j9YzGEb7oEkGFivgDUnJUwpU4z2hCma3DR0h9ykA/QuESOTdD5BIrvvNKt4sa6pZdc1o
         OHaehhICFuygRVzW0EMtAbGmwTHWTBhsHl9WuxNYi355TBQkwdVMOP40EHyc+OLvICXv
         zYCTIYAvKjVMXssz7gdolf+sju38tP3OTwDhA7rlYepQ3wMBCP637EkRiprKopxHCcx3
         Jr28Mj+2AOV+Sd8xU8dBuufrOyudtx8j3lUjgmKfUtso9KRiPoEGKm8Psy8CJmrtjEsb
         ODqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532669; x=1782137469;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VTVwg+1rtjOErQ0xcrTdPPHqNAYwMKSCfLxEt6Ho6zA=;
        b=hgujl8Ey7nb60uYtdu+z0TeZNqdqZ4wdl4TrYhLBhpzJ4omxMYBpvVCXkOxRUHMIuQ
         0SZZCI1dG5UBR9GgGMTi+jYaaJNNajKd7qgbXzmQc3Q9a2XLgYtSNL55FMWBtbKvD2Jn
         t/xhY2ffONLhbvmYd6BTEtVtNgXm2kWZGzSjdDRZGrbtYLgLY9A9pPJSYzeG7U3AdxWr
         yEgCcp8VVZ+Q2W4n2yzoImyPnGOygeyaDJPnadPa0AVKmaYwOK3Q7Co8BPq65ba+ZQkZ
         20mL/Bl8qqiEMYZnv7WhuzUQsOCpQ9IX60V+ke+E70UXSSpmEpXSqt/mRQd5fUr1Bqvz
         O1ZA==
X-Gm-Message-State: AOJu0YzJapfmfjP0K9nekXE5XiO3zgV4/1uZ/+rCHMfi/9CfspLm/Cl0
	aKlFJbWJqAmt//p+/GIcrN7Ugm/yFKEpBbCQbEjnbJDFIvNHNtr2HOKZixuusZtWNRMRdp8Rzzu
	uJpg=
X-Gm-Gg: Acq92OHIWBZgFcZ2kbBMPVZp9c3pAc06AMqoupZWhJypYqFwZAGbH7mOoVfnqf5P058
	cDuNYo1Y7Fug+InxUDQadEJ/lUzlls79F3ELOdHNBy/FSGbL+eWNx1fLWr0ET3lnHuv3hTY/qyU
	sS1B8E/UtyGa+dyjuMiNwhdYUJxe5S83j1f6QLiziWXd3e7FSz2dvhlNDMChZKwTelqpWZxBRuN
	iXnjmybW8XltCm7YYLrpDovr7yLcDjkZnjjsJ/71L7nLOhIyiGugIEHPfZzwgNGpmXpw0BA5yRI
	b/7RqFh6tTZDkLASOMS81hkKJ2B4WEEes8X1cjtpapsxpAPYnUuBywtjeMaeYPnp7OL99Mmr4Ad
	NwpzQzkGzmX72ZfB1py8v0Zh2svM11/f9qvwkaMKnyP5h/m/Ud1eTwdqDftQyN26rbOp/XBqwWq
	7nDv8JyMWU08m2/aBbUsM7uy23rPp4kpNjRVwUfiO+RE5KILoEy10p0MU3pF2YjlqFOF+N15S76
	RWJicUvmWV/6Nk=
X-Received: by 2002:a05:6000:2dc2:b0:45e:779a:302c with SMTP id ffacd0b85a97d-4606dba03d8mr22259094f8f.29.1781532668607;
        Mon, 15 Jun 2026 07:11:08 -0700 (PDT)
Message-ID: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
Date: Mon, 15 Jun 2026 16:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.22? 0/9] domctl: XSA-492 and -491 follow-on
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
X-purgate-ID: tlsNG-ebf023/1781532669-40D743FF-D7E12183/0/0
X-purgate-type: clean
X-purgate-size: 991
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74BD4686F7A

A number of further possible improvements were identified when putting
together the patches for these XSAs; some therefore already have acks or
alike. Some of these may want considering to take for 4.22.

Many of the patches here are largely independent, but the last one
(following on to XSA-491, while all others are XSA-492 related) really
depends on the 2nd to last one. Or else bigger changes would be
necessary there.

1: sched: introduce specialization of "running only" vcpu_runstate_get()
2: domctl: move XEN_DOMCTL_irq_permission handling to x86 code
3: domctl: rename a label
4: domctl: error code adjustment for unpriv callers
5: domctl/XSM: avoid XSM_OTHER with xsm_domctl()
6: domctl: handle XEN_DOMCTL_getvcpuinfo without acquiring domctl lock
7: domctl: restrict permission check for XEN_DOMCTL_memory_mapping's remove form
8: x86/domctl: don't imply I/O port permissions from I/O port mapping
9: x86/HVM: more checking for XEN_DOMCTL_ioport_mapping

Jan

