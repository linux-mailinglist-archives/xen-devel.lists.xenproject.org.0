Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAF29D016
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 14:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13604.34301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXldo-0003VR-Qc; Wed, 28 Oct 2020 13:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13604.34301; Wed, 28 Oct 2020 13:37:28 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXldo-0003V2-Mc; Wed, 28 Oct 2020 13:37:28 +0000
Received: by outflank-mailman (input) for mailman id 13604;
 Wed, 28 Oct 2020 13:37:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yaoe=ED=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kXldn-0003Ux-F8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 13:37:27 +0000
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 017a2eb0-f926-4a18-b5ee-9b58adfed154;
 Wed, 28 Oct 2020 13:37:26 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d24so6322643ljg.10
 for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 06:37:26 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Yaoe=ED=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kXldn-0003Ux-F8
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 13:37:27 +0000
X-Inumbo-ID: 017a2eb0-f926-4a18-b5ee-9b58adfed154
Received: from mail-lj1-x236.google.com (unknown [2a00:1450:4864:20::236])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 017a2eb0-f926-4a18-b5ee-9b58adfed154;
	Wed, 28 Oct 2020 13:37:26 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d24so6322643ljg.10
        for <xen-devel@lists.xenproject.org>; Wed, 28 Oct 2020 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rw0OYPBFNZd2tEP7bWM6jD1sR09uy1QGHtTVG6KW0hw=;
        b=rcWTg/Snfdn5n+xpyhmynduNv1INw26BugYY+VC5STB5LZ+lEyNl6fwtQKioPJ1D1V
         yzjemPVpHiVgTdMjyNR6Ec/oXI0osHaNGBvL5Yub1/GCaSiJg//FjCG7VTL+9EI4/tLn
         gR2DTrsVA9uqsa1rGG5fq1HpxYkmQPCgWxxMTZpfR6dsca0slIS70j1HVasgapNw2WWA
         9yVxl/Pem5aWaWfY0FhAAdsixViP916FwKFZnz1hJAl9X8RtH/aKIvyBkcjv2VZgIu+b
         w2SdF5TRWzl8ZjmttybZ56jVbiDd/mo8P8fiPgNwo+YGe9lKAwnERyXsRjxnuK4ccZnO
         EMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rw0OYPBFNZd2tEP7bWM6jD1sR09uy1QGHtTVG6KW0hw=;
        b=XLmV4TTDcSzuPOrLCeyBr9I7VO73j74mU0qNPwPSBTLc4dbyZYneC2tsp6z37Xy4q3
         oLhitecCexOL2Yt6wdS7iQqYDJqkDAMhv27r38tqiF49Jbo6Ns+i1a+p3NMxLy5AW3ln
         KcwmvN2AADVyJBNDn9qnuRDy52qRZWpZKAW07mXjMlmf7ete66jHtF2h6ai7j9zW2Ieq
         wDJQX4zdSnOWOFQQ4Jy45V6WLncD24SqDM1zI4bWNBeRJXk1nA7Ky3g7OvR9fMnjPCr8
         PKhAq/FygTlqloZ9NK22uW3KpHJhpO6xQA8ocC/7X45PPF2y3ZwWgml5QWYOH7hYy3RZ
         M6VQ==
X-Gm-Message-State: AOAM531I+WCk3onqpMfDWDX3n9jrMYm8w3JkE4giFSYLKRKo0nkP0dY0
	Sa07qw57yJAdDqoeHwh5sdH2EJqzusierqhstvM=
X-Google-Smtp-Source: ABdhPJyEYWQunCUOsoarp2GTbfrOB+KD3P0u+eRm6s0cZVyYnpzWMs6RfFLPDpVzOhboCnjHOflaGfCHpSlvUKoCprg=
X-Received: by 2002:a2e:b0c7:: with SMTP id g7mr3095654ljl.433.1603892245345;
 Wed, 28 Oct 2020 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <osstest-156257-mainreport@xen.org>
In-Reply-To: <osstest-156257-mainreport@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 28 Oct 2020 09:37:13 -0400
Message-ID: <CAKf6xpss8KpGOvZrKiTPz63bhBVbjxRTYWdHEkzUo2q1KEMjhg@mail.gmail.com>
Subject: Re: [qemu-mainline test] 156257: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 27, 2020 at 5:23 PM osstest service owner
<osstest-admin@xenproject.org> wrote:
>
> flight 156257 qemu-mainline real [real]
> flight 156266 qemu-mainline real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156257/
> http://logs.test-lab.xenproject.org/osstest/logs/156266/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-arm64-arm64-libvirt-xsm 14 guest-start              fail REGR. vs. 152631

QEMU doesn't start with "qemu-system-i386: -xen-domid 1: Option not
supported for this target"

This happens if CONFIG_XEN isn't set.

QEMU is built with:
                  host CPU: aarch64
           host endianness: little
               target list: i386-softmmu

commit 8a19980e3fc4 "configure: move accelerator logic to meson"
introduced this logic:
+accelerator_targets = { 'CONFIG_KVM': kvm_targets }
+if cpu in ['x86', 'x86_64']
+  accelerator_targets += {
+    'CONFIG_HAX': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_XEN': ['i386-softmmu', 'x86_64-softmmu'],
+    'CONFIG_HVF': ['x86_64-softmmu'],
+    'CONFIG_WHPX': ['i386-softmmu', 'x86_64-softmmu'],
+  }
+endif

I guess something like this would fix it:
if cpu in ['aarch64', 'arm']
  accelerator_targets += { 'CONFIG_XEN': ['i386-softmmu'], }
endif

I don't have an arm setup to test this.

>  test-armhf-armhf-xl-vhd      12 debian-di-install        fail REGR. vs. 152631
>  test-armhf-armhf-libvirt     14 guest-start              fail REGR. vs. 152631
>  test-amd64-amd64-libvirt-vhd 19 guest-start/debian.repeat fail REGR. vs. 152631

2020-10-27 14:08:29 Z lvdisplay output says device is still open:
/dev/fiano1-vg/test-amd64-amd64-xl-qcow2_debian.buster.guest.osstest-disk:fiano1-vg:3:1:-1:1:20504576:2503:-1:0:-1:253:2

It's unclear to me why the disk is still in use.  Looks like QEMU exited.

-Jason

