Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2JZKLfyEHmqhkQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:23:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D906299C1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 09:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324502.1590047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJT3-0007No-F8; Tue, 02 Jun 2026 07:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324502.1590047; Tue, 02 Jun 2026 07:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUJT3-0007M6-C0; Tue, 02 Jun 2026 07:23:17 +0000
Received: by outflank-mailman (input) for mailman id 1324502;
 Tue, 02 Jun 2026 07:23:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUJT1-0007M0-Oc
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:23:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUJT1-006vv4-1w
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 09:23:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1e84de-bab6-0a2a0a5309dd-0a2a45058958-14
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:23:15 +0200
Received: from [209.85.208.45] (helo=mail-ed1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1e84e2-aaa8-0a2a45050019-d155d02de082-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 09:23:14 +0200
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-68c19f1f3ceso5910612a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 00:23:14 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-68ceb8448e1sm3035981a12.18.2026.06.02.00.23.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 00:23:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780384994; x=1780989794; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gNMI6ZX4idVklgcWy/dki2qy+rhHFdeWdB+RD9vVz1s=;
        b=D4WZJgLiz2Rz0pJYtZLJWEfFYKAqvu9ewZhozfUgiIwP/0S+vsodBHe5Iu16koIVxT
         W45vLeMHaBl2HIZoV4ZOHuzsrWCv6r95tnFSceuyKxSNvL2xjzrO5ga12E3qz/XN5JYN
         M6vwyjK5aklnNBPSjyAp+PIp7/5BIvUEWSpstpZfaFV4M20coLqNjyGja1KAS2mSP4rH
         3vgqZPb0qUmGZN8pmYEkcQu0r8RDq16X0KFAsFpAg/OmgDY46Cck6Y+nfaEfODphJ+XE
         i0qQAvfbCOeqRONy7gyQcgbEfmv4L+PkCGCklQAvCF7+42z3vah9mTI7PgOudJD+FAne
         7jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384994; x=1780989794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNMI6ZX4idVklgcWy/dki2qy+rhHFdeWdB+RD9vVz1s=;
        b=nIycZpvS15+G8sUh0gz70h3DK0o5gtqTmNwV3YkJBfCgdeNP0ZnSa7J1euUMQBbcfb
         GgrL4+Q6xmsmqWPHWAs4VC8If+cS9mtz8PT4I5qAZKONtK7Auh0RZJYu1ju9ZOGt0g1b
         KiGawvBmLIx9rXUnctxAxYEST0dwY5JshcsqSF4kjJvM3TgSTKqEyOfj4V6atTkcdSQC
         7Qwpds7SGX340kyrB4gAw0Gb+Am7v800Kpqc0YgACi5ylRD2aN9lLfh93Acu03KqZ2dw
         OsGQzUJKpma6pPfytgh6MCqc3q36UcM87ia19eBwS/CyvZL+6TbZEt4MXJ/61Ue3fyAO
         9evQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sSEUCJbg+/cj31szH51Q5h1lDouvn5BL+9UcWVtRiQP0C83WFK1piJRR688cohtUu9KMCB2N1a4Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwvDVlSuIpjhQemh0fwFO0HNBFFWyTGHMy+rOTN6egVnkkJhh32
	rf8cjRftpKn35Jt4zy/0CKa/pswSeGFPpysmdn762es9MqkQ6Z0pN+ji
X-Gm-Gg: Acq92OEg+kxJ3mudYIGqSZea98xUwH/CBM4kcpAfKJEjTZ+vbZzt2Ms6/B+GGvepoQs
	8Ykg7MN3JziuZdMtbt3gMdL9fmz8pfv8fPYPbHeqBxHrCMkQXqaunSxFdU6O2e2FWO9TPArouPn
	yP09+GpOdlRFt0hb8uzhjbyH+9bkQN6npc6Thb+qFZsvJx/zNohfgagZooP5OgSTRZNn39SO7Gl
	W1DH3Q00oYyUkUn2biXq7m+JFtaaPv6Vqlei9JCePm4/xiRBpXGaxiV5mGZyzK01oC1iaPMgaIz
	whlQVEh51NrPkbX+Mz6+pdM+N32tldaxh3DfrGJEi6TKpj6vFewfIzfFwHuzAFcIQwyiSSzDRFz
	FJY58jCSXge9d2oiZOJYpedsvqseYdLmFJr4nA3tmblu0v++yp2PhNxcT7GbbCkZiBJWpO1Nw5R
	ETC8PYp1iwTl9ysbEwDdzG3j4YsgUh9R//GlLN9CgKaOsUFpSkmmgCmCe1422PyzxmrtFqsJxWh
	d+Y8uO+b5SHtzgyqNwKp0fyXPk=
X-Received: by 2002:a05:6402:2112:b0:67c:2e9f:3193 with SMTP id 4fb4d7f45d1cf-68c8ae12c90mr8136674a12.9.1780384994060;
        Tue, 02 Jun 2026 00:23:14 -0700 (PDT)
Message-ID: <ec21556c-dca4-4e84-8977-f858a6fca735@gmail.com>
Date: Tue, 2 Jun 2026 09:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/5] numa: add unit testing plus fix regression
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780384994-D877A443-1A61CC28/10/73395122804
X-purgate-type: spam
X-purgate-size: 2830
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 28D906299C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 6/1/26 5:43 PM, Roger Pau Monne wrote:
> Hello,
> 
> The first 4 patches add some basic unit testing for the NUMA setup
> logic.  The last patch expands the test cases and fixes an issue the new
> test-cases would otherwise trigger.
> 
> Thanks, Roger.
> 
> Roger Pau Monne (5):
>    tools/bitops: adjust bitmap_or() interface to match hypervisor
>    tools/macros: adjust ROUNDUP() interface to match hypervisor
>    xen/numa: prepare NUMA setup code for unit testing
>    tests/numa: add unit tests for NUMA setup logic
>    xen/numa: fix setup of non-aligned memory affinity ranges
> 
>   tools/console/daemon/io.c                 |   2 +-
>   tools/include/xen-tools/bitops.h          |   7 +-
>   tools/include/xen-tools/common-macros.h   |   5 +-
>   tools/libs/call/buffer.c                  |   3 +-
>   tools/libs/foreignmemory/linux.c          |   2 +-
>   tools/libs/gnttab/freebsd.c               |   2 +-
>   tools/libs/gnttab/linux.c                 |   2 +-
>   tools/libs/guest/xg_core.c                |   2 +-
>   tools/libs/guest/xg_dom_arm.c             |   6 +-
>   tools/libs/guest/xg_dom_x86.c             |   2 +-
>   tools/libs/guest/xg_private.h             |   4 +-
>   tools/libs/guest/xg_sr_common.c           |   6 +-
>   tools/libs/guest/xg_sr_save.c             |   3 +-
>   tools/libs/guest/xg_sr_stream_format.h    |   2 +-
>   tools/libs/light/libxl_arm_acpi.c         |  24 +-
>   tools/libs/light/libxl_create.c           |   2 +-
>   tools/libs/light/libxl_sr_stream_format.h |   2 +-
>   tools/libs/light/libxl_stream_read.c      |   2 +-
>   tools/libs/light/libxl_stream_write.c     |   4 +-
>   tools/misc/xen-mfndump.c                  |   2 +-
>   tools/ocaml/libs/xc/xenctrl_stubs.c       |   2 +-
>   tools/tests/Makefile                      |   1 +
>   tools/tests/numa/.gitignore               |   2 +
>   tools/tests/numa/Makefile                 |  47 ++++
>   tools/tests/numa/harness.h                | 184 +++++++++++++++
>   tools/tests/numa/test-numa.c              | 267 ++++++++++++++++++++++
>   tools/xenstored/core.c                    |   4 +-
>   tools/xenstored/domain.c                  |   9 +-
>   tools/xenstored/watch.c                   |   2 +-
>   xen/common/numa.c                         |  22 +-
>   30 files changed, 569 insertions(+), 55 deletions(-)
>   create mode 100644 tools/tests/numa/.gitignore
>   create mode 100644 tools/tests/numa/Makefile
>   create mode 100644 tools/tests/numa/harness.h
>   create mode 100644 tools/tests/numa/test-numa.c
> 

The changes do not appear to be too intrusive, so I am okay with 
including all of the patches in 4.22, provided they receive proper review.

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


