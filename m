Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGxnOG6nfWk0TAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 07:55:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D54C1035
	for <lists+xen-devel@lfdr.de>; Sat, 31 Jan 2026 07:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218002.1527089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vm4sL-000244-Dw; Sat, 31 Jan 2026 06:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218002.1527089; Sat, 31 Jan 2026 06:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vm4sL-00021h-5v; Sat, 31 Jan 2026 06:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1218002;
 Sat, 31 Jan 2026 06:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wf6q=AE=gmail.com=zhangwt1997@srs-se1.protection.inumbo.net>)
 id 1vm4sK-00021b-9Z
 for xen-devel@lists.xenproject.org; Sat, 31 Jan 2026 06:54:32 +0000
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [2607:f8b0:4864:20::72c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b05957e7-fe71-11f0-9ccf-f158ae23cfc8;
 Sat, 31 Jan 2026 07:54:29 +0100 (CET)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-8c70ce93afaso310076385a.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jan 2026 22:54:29 -0800 (PST)
Received: from wirelessprv-10-195-209-164.near.illinois.edu
 (mobile-130-126-255-98.near.illinois.edu. [130.126.255.98])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c711b8b4d3sm788464185a.13.2026.01.30.22.54.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Jan 2026 22:54:27 -0800 (PST)
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
X-Inumbo-ID: b05957e7-fe71-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769842468; x=1770447268; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O5ls4XojzMaTTlDBbUfkrZhtU6PflT35+xKNQyIQTw=;
        b=ShNv/6QMD0qlLWyRJjwn49vbMN6lYyePTiByFAkOkVw+fAud8UQEpvytzFGa/ykqEV
         hysuw+gZFiJz0hQZdHK+2+3i4EhKQXjnDCi5fxUGAef+Zy//rOFH4oIoQc+kGIseMQaM
         CqIfeCWx9oUSsnGYHos97vaWpaiYvefHo4EoIfq36EXQo/rlTKiyvdhBMAXz8eqWn/aB
         uD5rrQs31Gv4hnRmMOfo25PfxkpmqMRIctgy7gx3PVOPZhsce1BDchzpQHEICaXY8F86
         JtYj19n3llNlG+H+dIEEbR/3/ZpkOIK9vshXjQVhQJjEa2Pb45dFHS8O06UQbRGPoome
         wr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769842468; x=1770447268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4O5ls4XojzMaTTlDBbUfkrZhtU6PflT35+xKNQyIQTw=;
        b=gjw9iN0OCSqwNbgLVXMX8kwvm4pRa6ji1zi4uRu4McDMOrz0aRDU4JAlVZl/jZNclj
         xuEQbUkjGkIKx7bh7IPjedRvRhyh+F4gh/dd5QLiYl9aETzUv+hhKG95rcmfuvR9N8W6
         WYxC68NtecNjR8EhKehwzEIYHGpepKdJgDKg9B2R2XTzXnw1eoRli9IzZV6ofxhHH4mE
         gHcJvVjfirsvoowOqaDg/WF2PkQ4ryKjOJrIjuuvZSaUJAD1LSK2+T7tHUTTnjqu/6OJ
         oyGnu35Bf3zEwFD6y9fqGFNgtEdRFT9MHSFXvcsZzGwwWcYo3fngzVOjNYEynj2+zhud
         vO5A==
X-Forwarded-Encrypted: i=1; AJvYcCUztKFWJPI4HbhOwpMFRyoqakDGdpgy+E40veCgQ+77qaG+qcOkBobw23exwJQt7Qlr+v0bMGX2+OI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw29QjHrrCp44ckQo4yCjKLO2dKBLWX84Weps9Ft6OXEJk8NEUb
	faptiKUToYywQIoCuaBHPmxzLJGt3akySR+cLl3FwvJVdrfl85n5+Q2R
X-Gm-Gg: AZuq6aLi9m3jAKaZfeKDWGXn6T4vfcKDdcXsjRjq5cSyPUfwvongpFON+hjdv0oPeYj
	uFRawZtp+KMKhy+1z6VCP08vJ6fqhKOZYOUkSnq+jmcXscN4zIah+baVQIWeG7J2UTnKg/X4zyY
	nf+2zjJ/JdFP4MpjbbxvkA9/9fNeVXAxKt1JOomoeuXOyKGvPcBmFpzlNPQblqCyXFUE+L2YP23
	ZgQEQkJAJI+oe78jQ6O8f/4k0oLbNBGAB5XsaaTC2x5MtFI9+nRUUptq3IsmlZhFCnwvGhD3lrw
	PVKui1opxCXY9Ikh5V4wJMZqrYtHVlr2SmMg5I8gxKv7tXoTkn/ACC+pH+VAh0F4iZVYQ9DCzBX
	JhdRy68O0HgZgDRGwWkMyBoE0GM5dHDc4mYafjXOd87Zx5/rtwW+R3WDiuInEoIj5oyMSwAMHJI
	mPqS3QYzXXvheg2bfkl4Kxk5E89MYBJuggd5qm1cQKEollAfKE2DrDz0PvEqe9pQjriTfdifAJU
	jy2oouRTHooyVVkpesnQcSWZUHR+SFUzL3TFqcBcg6xhhRMIw+r3QY=
X-Received: by 2002:a05:620a:2544:b0:8c7:995:b961 with SMTP id af79cd13be357-8c9eb2dffc6mr728698485a.58.1769842468447;
        Fri, 30 Jan 2026 22:54:28 -0800 (PST)
From: Wentao Zhang <zhangwt1997@gmail.com>
To: andrew.cooper3@citrix.com
Cc: anthony.perard@vates.tech,
	jbeulich@suse.com,
	julien@xen.org,
	michal.orzel@amd.com,
	nicola.vetrini@bugseng.com,
	roger.pau@citrix.com,
	sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	samaan.dehghan@gmail.com
Subject: Re: [PATCH] CI/randconfig: Disable CONFIG_CONDITION_COVERAGE
Date: Sat, 31 Jan 2026 00:54:07 -0600
Message-Id: <20260131065407.12992-1-zhangwt1997@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260112163827.1023401-1-andrew.cooper3@citrix.com>
References: <20260112163827.1023401-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:nicola.vetrini@bugseng.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samaan.dehghan@gmail.com,m:samaandehghan@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vates.tech,suse.com,xen.org,amd.com,bugseng.com,citrix.com,kernel.org,lists.xenproject.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[zhangwt1997@gmail.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhangwt1997@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 83D54C1035
X-Rspamd-Action: no action

> In addition to GCC not liking x86_emulate(), it turns out that Clang is still
> rather more a work in progress than a usable feature, causing failures in the
> FreeBSD builds:
>
>   https://cirrus-ci.com/task/5934059060199424
>
> Exclude CONFIG_CONDITION_COVERAGE from Ranconfig until it gets a bit more
> stable.

Hi Andrew,

Thanks for catching this. I can confirm it is reliably reproducible on
a FreeBSD host with LLVM toolchain, as long as CONFIG_COVERAGE is on
(regardless of CONFIG_CONDITION_COVERAGE). So this patch probably won't
avoid the failure in the future.

See also the report by Roger which predates the introduction of LLVM
condition coverage:

  https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=290381

The cause looks multifold:

1. Direct cause is null dereferences in LLVM linker

  https://github.com/llvm/llvm-project/blob/llvmorg-23-init/lld/ELF/OutputSections.cpp#L631
  https://github.com/llvm/llvm-project/blob/llvmorg-23-init/lld/ELF/InputSection.cpp#L419

2. The use of objcopy from elftoolchain on FreeBSD

  $ objcopy --version
  objcopy (elftoolchain r3769)

3. gnu_inline attribute of xen/include/xen/sort.h

On FreeBSD 14.2, the following sequence using small program reproduces the
crash:

```
cat > 1.c <<'EOF'
#include "h.h"
int fun1(int a, int b) { return add(a, b); }
EOF

cat > 2.c <<'EOF'
#include "h.h"
int func2(int a, int b) { return add(a+1, b+1); }
EOF

cat > h.h <<'EOF'
extern inline __attribute__((__gnu_inline__))
int add(int a, int b) { return a + b; }
EOF

# OBJCOPY=/usr/local/bin/objcopy # binutils -- fine
# OBJCOPY=/usr/bin/llvm-objcopy  # LLVM -- fine
# OBJCOPY=cp                     # skip -- fine
OBJCOPY=/usr/bin/objcopy       # elftoolchain -- X

CFLAGS='-O1 -fprofile-instr-generate -fcoverage-mapping'

clang $CFLAGS -c 1.c -o 1.o.tmp
clang $CFLAGS -c 2.c -o 2.o.tmp
$OBJCOPY 1.o.tmp 1.o
$OBJCOPY 2.o.tmp 2.o

ld.lld -o output.o -r 1.o 2.o
```

I will consider filing a report/patch to LLVM but I am frankly not sure
whether it will be accommodated given (1) this unusual combination of
toolchain to trigger the bug (2) elftoolchain is retiring in newer FreeBSD.

Thanks,
Wentao

>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

[snip]

