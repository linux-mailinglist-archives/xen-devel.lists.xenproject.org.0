Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6151F67EB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 14:36:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjMRo-0004Tt-FB; Thu, 11 Jun 2020 12:36:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjMRm-0004Tn-O8
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 12:36:42 +0000
X-Inumbo-ID: 339b8696-abe0-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 339b8696-abe0-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 12:36:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h188so3416893lfd.7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 05:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=f9lcP7INmNDNWV+9/EdFziyLoY0jERPcqBsPG2jPz4k=;
 b=mTrFArQgTEK5TxijkWGetMewTWdUyWeluJseQAcwBmtVxnl+mNYMbfuWll6Cov6Gi5
 Ei1my7QqaQkbHT7+Y0If0S5Ij27srhh5ZZoI5ttRjc6i9H3H0F5TYKB2OW/30cPsmpGG
 glmEds4AgUilSW5OD8CLJfRnpJEiRPjuHiqsxOrXppKgz+d8e4MnqBX8mOD1HCRIptQ0
 092c9LgDmbV0hgyPHHwxhRosSLfuu+4LDIs9tbZHJFxbD6T+IHzIaQfWP72aopqaiii1
 anWJGDLe3VmSiO0cHBHbbdU6+5GhFrwUVzXcsO84gV17hiL0SbYSe6CVsqGbo0P87IsK
 q5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=f9lcP7INmNDNWV+9/EdFziyLoY0jERPcqBsPG2jPz4k=;
 b=D8uFS0j+sMuz2X+NtrVr9/ER3VoHEb6hpyJTUkmFvsfJZcXL1EPPNtkh56aF2D1zUi
 xTeV1LvqvPGoKku9xhCPO0BA/Czsy7XDDuQm9WVekt5BnFKCQwEU5c6hmzknL0FLYI0r
 hWQnVvuSHE0WhRqTZq9oqZGNrrqdXdvygoDl8KhsJmY2/sQPAoX3gW6eLQGC28+jb8ss
 GkwQlTZgVku3tpdETpmgIFGENSLhXPWERHP5u4FBTzwLvXetaOdsvEB1PoVfDU7K3qNY
 wbIpbdDl2IHv3TNAnazfde2RbeQgxxuSbYWpnQ1axZ7qbq1zjJeWK5WvBZAtKYEcOqKH
 jD8g==
X-Gm-Message-State: AOAM5312WIXetpqbi5ySiD2b51idQO8UL+rqgjQTE/s3UbZ5so210bzD
 IeMDqklvQJJuNeeXlogzbqUkpIHrK6TiBT0lfdA=
X-Google-Smtp-Source: ABdhPJxicqV7kqXyXip+N1tdyoE/Q0gwZiwZ/cAEedHNLI18xbdZTUosbdm8Gzpp7sEXBzCFSH+boSZmWd6i7Vt1b40=
X-Received: by 2002:a05:6512:31d1:: with SMTP id
 j17mr3967177lfe.148.1591879001060; 
 Thu, 11 Jun 2020 05:36:41 -0700 (PDT)
MIME-Version: 1.0
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 11 Jun 2020 08:36:29 -0400
Message-ID: <CAKf6xpvu6rMbBpxWUdDZ-W3ZL+6TTNad3tx6bwtieNkhjXeF6w@mail.gmail.com>
Subject: Seabios Xen TPM check
To: seabios@seabios.org
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Quan Xu <quan.xu@intel.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

SeaBIOS commit 67643955c746 (make SeaBios compatible with Xen vTPM.)
made tpm_start() exit before calling tpm_startup().  The commit
message has no explanation why this change was made.  Does anyone
remember why it was made?

The code today means SeaBIOS will not populate PCRs when running on
Xen.  If I revert the patch, SeaBIOS populates PCRs as one would
expect.  This is with a QEMU-emulated TPM backed by swtpm in TPM 1.2
mode (qemu & swtpm running in a linux stubdom).

Any insight is appreciated.

Thanks,
Jason

