Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GttLv3fcWk+MgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:29:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A86311F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 09:29:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210498.1522150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viq4O-0002yv-J8; Thu, 22 Jan 2026 08:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210498.1522150; Thu, 22 Jan 2026 08:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viq4O-0002w2-GF; Thu, 22 Jan 2026 08:29:36 +0000
Received: by outflank-mailman (input) for mailman id 1210498;
 Thu, 22 Jan 2026 08:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hT5e=73=gmail.com=wangjunxiao045@srs-se1.protection.inumbo.net>)
 id 1viq4M-0002vw-PQ
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 08:29:35 +0000
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [2607:f8b0:4864:20::72f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a49b83b-f76c-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 09:29:33 +0100 (CET)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-8c52c1d2a7bso200367285a.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 00:29:33 -0800 (PST)
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
X-Inumbo-ID: 7a49b83b-f76c-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1769070572; cv=none;
        d=google.com; s=arc-20240605;
        b=avXR1E9lz6o8AjEMeuC9cOTKIpdsP/FC6k1rQcbyY3KFW5qIyikb3NOZT7Ru+bj8Hg
         P804ItQ1bRxXC/D3DrgzrMf6m86RjAG2wlk+KIz2X1PFIUdrxo6ZJnfb27H56nRhJgIS
         CKu5A5gzypat7WbIk/qx0IPc458BxeqZ4K7u8tsi/5wLJ3KPN9uQyXj9jbQ7u8u897KY
         cKyWGthC748n2u0H4UtCL2sia3ajJN/SZ7kbsgLHnkFMVbuB6363afSQyYC1dok3jbH8
         4mQ9pbGK2Qh1PETBSMTgZg0J44MOxxE2mvnGAY3S4HnJcIZwj4/gkBl5BR7inBz9PwFS
         YTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/tzrRzNe1Oo179OoUJ9uBcIR8npvWm7/ge/DfccjyDI=;
        fh=quJY5mN2l4ZorNvEoO9ngNXalhEvTdq/+W8CvHWhECs=;
        b=GvSQFFbJfcXTQIbkTgRGQIrm8OGiaRez64B6L+2mB05B2A/A++A66HDxar4jDAXS+o
         rdEdtxagbqVt57mf0DcsG9iDJhWvpRgxKiOG50lQpqosfaMXWWFl271zyOQxqJ9Z3ihM
         0wgScb4wzAsUzHAUJsRjJQYJE/OvGBxYDWD2SH08dciWtJ+B0qPu+HguMeB3gO/Mo1yy
         Ky5qmtmhwbZkyh4r5Tqrvz1kfJHLNfBfaTuY9ltbiVejG/4ahCcNqX7L7iFHUxh7FMrV
         5n5rrop2VpsU5mvXvVSDe04khrLRJF6kBkI+a2+8q7tYivctcDWADHN+Lc63yMzA00O2
         C1Xw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769070572; x=1769675372; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/tzrRzNe1Oo179OoUJ9uBcIR8npvWm7/ge/DfccjyDI=;
        b=IkW6/ar7pWaJSwLg58kk78kUApZ/SDq+wbo7lNEb9BTGeasHHrHRexS+E4120cYseG
         jFfkFEURcUSOF2KvgeiSjVmXOFC1nZpBLsF1/DW6DRwQf77GQFNKlinb51YSgw7sLGEj
         GT2+JJBKtrt8a3MDhhwFkYwwE4EItqsJaW0AMUCoSmfBO05dwtWLTkALUt83btrhdxtB
         JO6ZoYxiILVcQoY2uFikJizyA2J+fy3BChhJJHLR1ZpMp/U45pT/z1KwSH5ZqLTVPlYt
         DHuKuCtSR+Ix8r2rUVemDyX/cQdAeS7nyeykKCh3bXT4T8tA8SpO5R3+EOqpwwAVlsvG
         fS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769070572; x=1769675372;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/tzrRzNe1Oo179OoUJ9uBcIR8npvWm7/ge/DfccjyDI=;
        b=N5sYxw7YtQ4kB5ZXI32DL0sfhF0BFtApD4WePUVNtuPSB78mBPLBrOmv8dbCRUm/yv
         6uj7y7p9ixdy38lgldmdVDd7w6nPP0DdbO434F/00DcLuxI40/U/GeP9yXiChAZ+9ssF
         4TrXSxRadbvfU05/nVZjm1m+0Nnf+rc01qSvGSnAH3fYyYfEHD0KFNozXAbbxu9b3TMZ
         zn0pzEFNyZQmSC4bFYtcsF8UWFMcxudHJwCzAjeHp4iwe7X09n2bMEeQlaioZ8MCsx+x
         /oPNzVWTOa3xxZwQzYLwAh2Rm/a+IVlvvaifALYpp6ZkeCqdOpvjm6TJEl/sEg5l4Iy6
         WEow==
X-Gm-Message-State: AOJu0Yx66qsl2htcUe92vTM41D82h4uBDi3IFZX6pRHygjwi2q73ihPN
	S3GRKCZO0BNztxzwU7MbOn88nr+qfk5pjglrHdhenGD193doNj73blDSJft+sPLzseAJRzwQBn8
	/iyrujc6yiRXs+jsCF8tLTlZYmp7nQTj/gWUi9SI=
X-Gm-Gg: AZuq6aIvl5oMNcNQ5So37NWpy+NSa7X7GzbiSNKTo7xweAlPOX2My/nUTJvzoZIFnGj
	AQYKbTuFa/5UZ9fmM3B4bZm1noqtJCvn2tmO6ryzDhS/GZIyom9WJtZ4hZueyGkmjw91L3Nydcx
	6r5WiEAff4PbMFX0KQKmFiDlJxyPQzCXNp8tsJMCMsX+7MCwz8aRYXBYUj4ZbZR2zObYCwFdzk/
	bXMnbH9Kq6/FoOsBzrOe3YekVY85LFbp2KFFS1Rj9JRuc/7V/qA65jD2CajLFxACEgUfQ==
X-Received: by 2002:a05:620a:1a0f:b0:88e:1be9:cf65 with SMTP id
 af79cd13be357-8c6da8f7ba4mr298937885a.39.1769070572184; Thu, 22 Jan 2026
 00:29:32 -0800 (PST)
MIME-Version: 1.0
From: junxiao wang <wangjunxiao045@gmail.com>
Date: Thu, 22 Jan 2026 16:29:20 +0800
X-Gm-Features: AZwV_QjZwnAYb_jjm-IIETxsYSuRNw5RUypPs2NUttAkdOFZpWxS34TFkjSk4DU
Message-ID: <CALwfMWvTmJrdsW5iz_K46CZqaxJmuL4+WWDrMQhGSF4rk0ZUpA@mail.gmail.com>
Subject: [ANNOUNCE] minivmi: Zero-dependency, minimal Xen VMI learning project
 (<500 lines C)
To: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[wangjunxiao045@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangjunxiao045@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 714A86311F
X-Rspamd-Action: no action

Hi everyone,

I would like to share a small open-source project I've been working
on, called minivmi.

Repo: https://github.com/ania0-art/minivmi

Why I built this:
While learning Xen Virtual Machine Introspection (VMI), I identified a
gap in the available resources for beginners. Existing production
libraries like LibVMI, while powerful, utilize heavy abstraction
layers that can obscure the underlying mechanisms.

On the other hand, while Xen includes a test utility (xen-access.c)
within its source tree, it is tightly coupled with the Xen build
system and lacks educational documentation.

minivmi extracts these core concepts into a standalone,
zero-dependency project based on Xen 4.11 and Ubuntu 20.04. It allows
students to build with a single `make` command, serving as the "Hello
World" that the ecosystem has been missing.

What it is:
minivmi is a "bare-metal" style VMI implementation written in pure C
(< 500 lines). It intentionally bypasses high-level wrappers and
interacts directly with libxc, xenstore, and xenevtchn.

It demonstrates the minimal viable path to:
1. Enumerate domains using libxc.
2. Enable vm_event via xc_monitor_enable.
3. Monitor CR3 (Context Switch) events by manually handling the shared
ring buffer (req_prod/rsp_prod) and event channels.

Current Limitations:
Currently, the project focuses strictly on the event interception
mechanism (Hypercalls & Ring Buffer). It does not yet implement
software page-table walking or memory introspection, keeping the
codebase minimal for understanding the control flow first.

Goal:
This project is strictly educational. It aims to serve as a white-box
reference for anyone teaching or learning Xen internals, bridging the
gap between theory and implementation.

I hope this might be useful for the community's educational resources.
Feedback is welcome!

Best regards,

Junxiao Wang

