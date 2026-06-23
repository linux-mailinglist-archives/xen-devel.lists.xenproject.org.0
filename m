Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TCdoKK5AOmpc4wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:15:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18E6B5345
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:15:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=c9hu75tV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1344145.1603271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwI5-0007Bk-Ha; Tue, 23 Jun 2026 08:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344145.1603271; Tue, 23 Jun 2026 08:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwI5-00079F-Ez; Tue, 23 Jun 2026 08:15:29 +0000
Received: by outflank-mailman (input) for mailman id 1344145;
 Tue, 23 Jun 2026 08:15:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1wbwI3-000798-Nu
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:15:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbwI2-00ApjO-Ju
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:15:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a3a4099-5cb7-0a2a0a5109dd-0a2a450bcda8-24
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:15:26 +0200
Received: from [209.85.208.174] (helo=mail-lj1-f174.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6a3a409e-5e53-0a2a450b0019-d155d0aec477-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:15:26 +0200
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-3997a6196c5so35307571fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 01:15:26 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782202526; cv=none;
        d=google.com; s=arc-20240605;
        b=FFN6mjy3jQIXhDRIciFWGt0QuM84eOUdFWAv+95Op+vlfm2aMIcbfz+tiTFhlPQnkq
         EeEd3tCwZBIKxwfEVWlzXDtnccZn75+GuM19VKd7FLd1aK0IXTYYqiFQ+squMlm93fOs
         OZBnnhp5cLLtPHzLN0UBmTSiX1HcOFH+HQgdQ0Z/srwduWoip9ReMXIK+H1afLjFUtsP
         bSf5o8C5Vs2p2fQRWU49Bxwvxlav6kkPaodX0WmpbKpgDtd0600c4uSvcVTQosh4vk2O
         5YUwAFLp8ZoC+oHo5u4zzFsbMqVMWrrz/0IMRX98OpyhY3za86dRI4YMdXVgpSsNIC1r
         XHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nZyM20Y/Hzh/DVF8opMoFAb2fC/xYPMGctnCCvqWoqE=;
        fh=BxAOn7jMslPpxCh+ZwJ42wvijNvg8M+sVi4YM41sbzk=;
        b=h1ytZ0AMIKdNUpPYwwzGxqDWpSoCsJz8h45cgcK5oscoD8I9nVwvwcsQ6RO9O7k5lY
         oRI/B1WPF1wlJJwxcGY1eWCdDSyr/bS1RgZQGT0VENO9NKBeO3CplXYSg4xvrPhXlDom
         AX+6nwFwS7vDuzgT0UmGWTDeT6qrbIPnnneGkVwmxqDq7EkesMy2X+tPmeHczvrjhlLp
         w6i7yWCy/Da/uJ4Jgt8ILITw4N+ZXXQiXqUwZuJ5fYqwlMTPDD1VwjXD32IlI/dhEXBj
         AisCer2V435X08X7m+6pmqd0a7P3PQh7GL407m4P3xjFDRH2nn2o1HnSRQIcn6eQOJq2
         r+yg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782202526; x=1782807326; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nZyM20Y/Hzh/DVF8opMoFAb2fC/xYPMGctnCCvqWoqE=;
        b=c9hu75tV3MHk6s01pIQ/UXneOby9VVKEYI7kY+k/ieIlO8FUVc55dNHNe5CMRx5TKY
         VzLhrrHvWB2RH4PTkydANfn9aJ8olK0tdw/ecNGd3jC1aL78upB1MYUy8E8jsxgLC9Gv
         F6qPiN8zFZ9Cv7++QMxLal052N2XR5HYPEwqHMM10JJMg3CPjVo/YF80mr7KcH9iE+u2
         06WSk3nXb7aTMXTsAE3xNDQYmYvuKq/7UvGbde1933BlYad2mx4ys/NbCS2xA6ZquCa7
         SSx+WdszqXthm243p5+9cWfScPeuQFQDLIaFkCsBsluTc9aoesOmDviSMH5axb/WNWrn
         8Sig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782202526; x=1782807326;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nZyM20Y/Hzh/DVF8opMoFAb2fC/xYPMGctnCCvqWoqE=;
        b=UwM1Uik8dep7E8pP4f5LSoS1PA+lWL51g2NgaVCnaCbu9wm5adms7mkAR+14ylahY3
         RinMWzLJUkAVljtHm8PhNGbq/JpxV1I6MdujGZrwoR63OZMIQjtFJwkccZpH+crlSq72
         eK3iByvUjRbI/pXMdzKJWsE1A71GOrhfRFzoDj6YrOVU7zSAJ9svL/fmYYRDXN+Jq+kT
         ZIQcrMnBQxFDRX57JVLp+ZePJ3FGE7rvZp9c9uwouXjGRmkNRNy3wajfS9OB2F8IOGqo
         3034HmGqVEs1HZc7v2GQ5qMNGKaG7BtkNd4100f9xRMkpsE1OyAjeYCDXDRPd4co1seG
         930g==
X-Gm-Message-State: AOJu0YzLhRemfSzd/9kHAH0nppnv780CGdNRg/NDMsKkZFOgpVMHW4BS
	sI/0J9L2k6PPwMphKwM0GCuuNoXAwkpsS3csQ0iQ2GL2LC/H0WQF5id8Jtu9/Wzg9qbSMFnpgJj
	Ywk2dOqsqLSPWOVOdp1Cz8N4qYZZVmai4y0Buby4=
X-Gm-Gg: AfdE7cmut1wi4L+lAidvFkcF9li0Qodi0unEG/5OZY2OSi6Qb3MPnqhAT6g0jaTBOTb
	QMn6NgasDd/HdNuSuSfH7R9xQaAN+q9RLiaiIbeaTxGLOxisole8OEk8FH38NI+9xRW0QwXo1Ai
	OzbOrlJRxMHbI88XLELG7m2+ITvo039p3NkAllYj4nY6x5Akf22tsPxT/Xnx2vxV5bIn8HsjKHN
	Hq8BdJyu7CMAx+jd+ZfaPJ9zph/7G2O+B3OfVuUdXDHyYvy6If5aRY7WZaPzYB6Crty1nlzaTpr
	rCTF9Q==
X-Received: by 2002:a05:651c:1148:b0:396:375:aa7f with SMTP id
 38308e7fff4ca-39a251ece72mr4035951fa.10.1782202525487; Tue, 23 Jun 2026
 01:15:25 -0700 (PDT)
MIME-Version: 1.0
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 23 Jun 2026 11:15:13 +0300
X-Gm-Features: AVVi8Cdaf4yNSCIBITIz3uLXG0TKO7Ca2XAulCElZyuA8loU24X21zN2rxVHKHE
Message-ID: <CAGeoDV8j+yz7L7YA=hR8dj_=nJ6gWWRfaOzH10_wRKJdycu09g@mail.gmail.com>
Subject: [QUESTION] Credit2 wakeup latency in 1-pCPU/2-vCPU Arm test
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1782202526-4E5E400E-6CAD8F1D/0/0
X-purgate-type: clean
X-purgate-size: 2423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B18E6B5345

Hi all,

While running a wakeup-heavy Arm test, originally used for GICv4
doorbell testing, I noticed an interesting scheduler behavior on clean
Xen master.

The setup is synthetic on purpose:

1 physical CPU
2 Dom0 vCPUs
fio pinned to vCPU1
CPU stress pinned to vCPU0
4 KiB random read
iodepth=1
Credit2 scheduler

The goal is not to measure raw block throughput. The goal is to stress
the wakeup path where an I/O-bound vCPU is blocked, while another vCPU
is CPU-bound on the same pCPU.

On FVP with GICv3, the result is very sensitive to IRQ placement:

virtio IRQ pinned to the fio vCPU:
2223.939 IOPS, p99 = 1122.304 us
no IRQ pinning:
93.508 IOPS, p99 = 17170.432 us

I also ran the same test family on AWS c7g.metal with clean Xen master.
The same low-IOPS class is visible there as well:

normal run, 8 Dom0 vCPUs, Credit2:
about 1753 IOPS, p99 = 643 us
wakeup-heavy run, 2 Dom0 vCPUs, Credit2 default:
about 100 IOPS, p99 = 10158 us
wakeup-heavy run, 2 Dom0 vCPUs, Credit2 sched_ratelimit_us=100:
about 973 IOPS, p99 = 8454 us
wakeup-heavy run, 2 Dom0 vCPUs, Credit2 sched_ratelimit_us=0:
about 748 IOPS, p99 = 13435 us
wakeup-heavy run, 2 Dom0 vCPUs, RTDS:
about 999 IOPS, p99 = 6521 us

The AWS numbers above are medians from 5 repeats of the rr4k_qd1
workload.

I added debug counters around WFI, interrupt injection, vCPU kick, and
schedule-in. In the runs checked so far, the interrupt is delivered and
the target vCPU is kicked. The counter for entering WFI while a virtual
interrupt is already pending stays at zero. Most of the visible delay is
between the kick and the next schedule-in of the target vCPU.

My current interpretation is that this test is valid as a wakeup stress
test, but it is very sensitive to IRQ placement and scheduler preemption
behavior. I would not describe these numbers as raw storage throughput.

Since the same behavior is present on clean Xen master with GICv3, it
does not look specific to the GICv4 changes.

Question:

Does this match the expected Credit2 behavior for this kind of
overcommitted wakeup-heavy workload?

More specifically, when an interrupt wakes a blocked I/O-bound vCPU while
another vCPU is CPU-bound on the same pCPU, is the woken vCPU expected to
wait for the normal Credit2 scheduling/rate-limit window, or is there
an intended fast preemption path for this case?

Regards,
Mykola

