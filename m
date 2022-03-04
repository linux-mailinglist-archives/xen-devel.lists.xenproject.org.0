Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37BD4CD717
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 16:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284347.483566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ9V7-0007qc-NE; Fri, 04 Mar 2022 15:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284347.483566; Fri, 04 Mar 2022 15:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ9V7-0007oh-JX; Fri, 04 Mar 2022 15:05:49 +0000
Received: by outflank-mailman (input) for mailman id 284347;
 Fri, 04 Mar 2022 15:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=86Qk=TP=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nQ9V5-0007ob-SM
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 15:05:47 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91a023f8-9bcc-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 16:05:46 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id f8so11109952edf.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Mar 2022 07:05:46 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a170906771200b006d2a835ac30sm1837863ejm.151.2022.03.04.07.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 07:05:44 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A0ABC1FFB7;
 Fri,  4 Mar 2022 15:05:43 +0000 (GMT)
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
X-Inumbo-ID: 91a023f8-9bcc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=pbZW5PHE71bnKFtyV5BRDeRiJEy5SXR48g9puf6/Cqo=;
        b=jcJ0tt8uOfk7WEymu8lA1FySybnit9tdOZkU6wRpHQk+eCHYr3t6jFAnof3T0aNG2W
         oqXYBdk/sZ0qwf/jALVdWRfHXHLUt8sJNRiafz+ws1Dvhv7iAKOL6oTjJBDunUj6Ahll
         Lhc/H1lKcHLpjO5+ZvltSXEyi5IXJ4DWMWQmJhX2H58b8y1yDUuZG1IfZwggadV1zXgO
         c8Q8PQbROrYXVWbpVrfZSTIPlv86mX+NgsCCF6NIL83JpV1Q8Zbym5jcB3bMtwoDEEoj
         b0ZiV/c4p7OEok8oxipklZXeTHR8BhWnigEVc45p1fhCqfvIybrsXT41HV5Ga7yrbelX
         K1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=pbZW5PHE71bnKFtyV5BRDeRiJEy5SXR48g9puf6/Cqo=;
        b=BcxZM1BFK8tU7LApQ08KEcFPqSuijWXgqqz+H2+snpKI5cq3sqNmNrJDlLcEXoiE/K
         XcD3nHwqxixlSGsMIH8y12e8WjRFNsDxM8QpZKhjDNs+GlRP7w5x4IoZSB0pZfVwuXmg
         CrLgF0jVyoYdYHLvlu2Cm3HFQ1CaTy1nU29kNzA4/6VbqqRoK85JbJrzzl3IAFT2tchm
         ge7dAG1mdYej+jj/lbBOTnzHKsEOsSKTUHkswr88uHcOYyoALw4t7vEmOjfyw/IO6tYR
         ejYo7CCGHpProqqO+E26Zn5YZ635krWuMzqbqYSsfVmJ+s5YL85i0uNyJS9VlIP2VlcF
         Azkw==
X-Gm-Message-State: AOAM531QEp7EMWqJUpqAxSK3+dKBjqLDYwxPNJN6dTLF2nojqLHgRvJy
	phfLVFTJJNwCYCRrfA34Jgzn3kl8fMCRzw==
X-Google-Smtp-Source: ABdhPJzrqwduPjpyp6QKKOuiYhxWIiDbVG6unEBf+YvMuFMRKV1Uzuj8EFOREtz7t3isiWoUWrhTrw==
X-Received: by 2002:a05:6402:34d1:b0:410:fede:429b with SMTP id w17-20020a05640234d100b00410fede429bmr39226383edc.250.1646406345651;
        Fri, 04 Mar 2022 07:05:45 -0800 (PST)
References: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
User-agent: mu4e 1.7.9; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Trigger Huang <trigger.huang@gmail.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: How to create and start Xen guest VM by qemu-system-x86_64
 command line
Date: Fri, 04 Mar 2022 15:04:27 +0000
In-reply-to: <CANH0Q9k6SJQ+EXNZz+-ZPnPtsxHXthYcx1E6z8euSDEt7XhLQg@mail.gmail.com>
Message-ID: <871qzhiwqg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Trigger Huang <trigger.huang@gmail.com> writes:

> Hello,
>
> I have built & installed Xen 4.15 onto my Ubuntu20.04 platform successful=
ly according to
> https://wiki.xenproject.org/wiki/Compiling_Xen_From_Source=20
> After reboot, I entered Domain 0 successfully. The command xl info shows =
the right version string.
> host                   : xvg
> release                : 5.13.0-30-generic
> version                : #33~20.04.1-Ubuntu SMP Mon Feb 7 14:25:10 UTC 20=
22
> machine                : x86_64
> nr_cpus                : 16
> max_cpu_id             : 31
> nr_nodes               : 1
> cores_per_socket       : 8
> threads_per_core       : 2
> cpu_mhz                : 2994.377
> hw_caps                : 178bf3ff:76d8320b:2e500800:244037ff:0000000f:219=
c91a9:00400004:00000500
> virt_caps              : pv hvm hvm_directio pv_directio hap shadow
> total_memory           : 15719
> free_memory            : 11425
> sharing_freed_memory   : 0
> sharing_used_memory    : 0
> outstanding_claims     : 0
> free_cpus              : 0
> xen_major              : 4
> xen_minor              : 15
> xen_extra              : .3-pre-atg08
> xen_version            : 4.15.3-pre-atg08
> xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hv=
m-3.0-x86_64
> xen_scheduler          : credit2
> xen_pagesize           : 4096
> platform_params        : virt_start=3D0xffff800000000000
> xen_changeset          : Fri Mar 4 13:33:49 2022 +0800 git:6aa4cdbc31
> xen_commandline        : placeholder dom0_mem=3D4096M,max:8192M no-real-m=
ode edd=3Doff
> cc_compiler            : gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
> cc_compile_by          : xvg
> cc_compile_domain      :
> cc_compile_date        : Fri Mar  4 14:21:33 CST 2022
> build_id               : 234929adcb7588b1414c2b6e5477fa95052b4ded
> xend_config_format     : 4
>
> Then my next step is to create ubuntu guest VM(sudo or use root user):
>    /usr/local/lib/xen/bin/qemu-system-x86_64 -smp 1 -xen-domid 4 -machine=
 xenfv -m 4G -net nic,model=3Dvirtio -net
> user,hostfwd=3Dtcp::2222-:22 -hda ./u2004.qcow2 -boot d -cdrom ./ubuntu-2=
0.04-desktop-amd64.iso
> However, I always failed with the following error:
>     qemu-system-x86_64: failed to map ioreq server resources: error 3 han=
dle=3D0x55eeb1f6c0b0
>     qemu-system-x86_64: xen hardware virtual machine initialisation failed
> After debugging, the error is caused by osdep_xenforeignmemory_map_resour=
ce failed to invoke IOCTL_PRIVCMD_MMAP_RESOURCE. And
> this IOCTL will return -1.

Why are you not launching your guests with the xl commands?=20

>
> So my question is, am I using the right qemu command? Anything else is ne=
eded to set/config?
> Note, if I didn't specify the option ' -xen-domid 4 -machine xenfv ', I c=
an start qemu successfully
>
> Would you please help with it?


--=20
Alex Benn=C3=A9e

