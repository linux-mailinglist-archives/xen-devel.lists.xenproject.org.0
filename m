Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A283EAA26
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 20:20:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166555.303993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEFJp-0000L6-H9; Thu, 12 Aug 2021 18:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166555.303993; Thu, 12 Aug 2021 18:20:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEFJp-0000Hy-Cy; Thu, 12 Aug 2021 18:20:41 +0000
Received: by outflank-mailman (input) for mailman id 166555;
 Thu, 12 Aug 2021 18:20:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4db+=ND=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mEFJo-0000Hq-3f
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 18:20:40 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8491edd4-efec-4a8c-9dc9-59c1230e9439;
 Thu, 12 Aug 2021 18:20:39 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h2so11845391lji.6
 for <xen-devel@lists.xenproject.org>; Thu, 12 Aug 2021 11:20:39 -0700 (PDT)
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
X-Inumbo-ID: 8491edd4-efec-4a8c-9dc9-59c1230e9439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=vWKiQ3ZNZNwQK3mX4sb/Ko9XjGPRK0bLeasj+2svlnA=;
        b=ZJK/rk05MS1EBZ34y6PAURX+5/Yo/iE0e5VMvJvPr2I6pFoXoCVmWymMyY6UOINEaA
         7VN5n/KdnsyoC+Rye/ZKQ6qrVokaXwq591+WRFOFoVO8LfCcHctIkkP6cawLFc0Ge9/z
         40lx78EIDpD4XRAMe4/SzGUJqP43wCa/ip1/j8DvWi8qZJVNVEl8FYOrABOf/RAAgdxD
         43S17yjrPj2FVtYn/7J/enTjQ7dAF8PY2G02dnjgdsbn3hibMX/RXLtZhgGnhOVjJIoS
         iThfzX1QdCy+8/g6rW6G436yXqIcWimyZkMedH4zQ6GLyzz07f9EbRhojL7EFbrmzuCL
         dGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vWKiQ3ZNZNwQK3mX4sb/Ko9XjGPRK0bLeasj+2svlnA=;
        b=arBMh0ooXTFKh9xXZ/440vToCz0GQ3kLwg44lqiSa3EJpOyF4WfLAUYmQOLB8ttHWF
         Dhte4+YgImfDzIRhLogSPw2FwjicYvE/nrZQ9qPmJs6g0pEXHZGl3SlvPmJFmyW/PGzQ
         7VntWCoOhf0jXgAyOMrZMMbWn8BlkKj8AyP0MKTCyBd8pFmV1wI723cvQ6FvtyzqZi54
         nmmSup86iSUavHg6h5ftRk+GxD3gXx9FNblqzK/Hgtv4I+Wmu6s0IpVozNJXSNobdxmq
         1CFlb3nfGaZdyKG5cMexYdY+uDcrfhFzOpJL9KYDQbn5nesWgM6i35ULaEPZuv5FSi87
         w3EQ==
X-Gm-Message-State: AOAM5334N7dxxZQaUI4w6z54Qy4yNAYT47IRWrwZmGyGb9HB2gZRYi2A
	x8hZogd+bq1bAQVa4tZ3gVi31j6YfTAxjmRgmaxwEHdgnP8=
X-Google-Smtp-Source: ABdhPJwKv+pGRIm+TgEQ1j0iO+INuhUpNbLEtirz5JBEGMnawpXB+QKfVC5Aq3r3JS2aXUWoJhc2zUcgWXh+vmWUweI=
X-Received: by 2002:a05:651c:2127:: with SMTP id a39mr987609ljq.378.1628792438163;
 Thu, 12 Aug 2021 11:20:38 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 12 Aug 2021 14:20:27 -0400
Message-ID: <CAKf6xpuFEhyrhk8N3mDP=F4jmpN=EHxw47e+PPAuJ15+XZL7xw@mail.gmail.com>
Subject: Issue with waitqueues and Intel CET-SS
To: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

I was reviewing xen/common/wait.c:__prepare_to_wait() and I think I've
identified an incompatibility with shadow stacks like Intel CET-SS.

The inline asm does:

        "call 1f;"
        "1: addq $2f-1b,(%%rsp);"
        "sub %%esp,%%ecx;"
        "cmp %3,%%ecx;"
        "ja 3f;"
        "mov %%rsp,%%rsi;"

        /* check_wakeup_from_wait() longjmp()'s to this point. */
        "2: rep movsb;"
        "mov %%rsp,%%rsi;"
        "3: pop %%rax;"

`call 1f` gets the address of the code, but the address is popped off
without ret.  This will leave the shadow stack out-of-sync which will
trigger the protection.  Is my analysis correct?

Regards,
Jason

