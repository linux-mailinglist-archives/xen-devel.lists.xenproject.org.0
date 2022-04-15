Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F0650274E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Apr 2022 11:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305659.520746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfIAh-0006tz-Gq; Fri, 15 Apr 2022 09:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305659.520746; Fri, 15 Apr 2022 09:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nfIAh-0006s5-Cv; Fri, 15 Apr 2022 09:23:19 +0000
Received: by outflank-mailman (input) for mailman id 305659;
 Fri, 15 Apr 2022 09:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bOrE=UZ=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1nfIAg-0006hY-I9
 for xen-devel@lists.xenproject.org; Fri, 15 Apr 2022 09:23:18 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aef3a49e-bc9d-11ec-a405-831a346695d4;
 Fri, 15 Apr 2022 11:23:17 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id k23so14484173ejd.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Apr 2022 02:23:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ck5-20020a0564021c0500b00420b49ba80fsm2423370edb.24.2022.04.15.02.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 02:23:15 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B279B1FFB7;
 Fri, 15 Apr 2022 10:23:14 +0100 (BST)
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
X-Inumbo-ID: aef3a49e-bc9d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=w667gKYBbDBTMCfXxJDqMeQkVCc8+IrorrB4oS1oJ5E=;
        b=a1GWJXNhyAXH5ruzAaxXwsuOH1eqRjJ2MKQAhRi/ipCf16gTMLgrPbZOhNKePB24Pf
         5z9Om4c2T6IDo78fsg/z08IDdB40iGCMN2YeXLaIKrg1Fj/G23HI463LKAiwvFgTQRqP
         eJzHWYKGIr3jR0zbeVtIiGY53hVBuQ1I5CKaknhuzQIprb+fZyHxuMfD9mL32g9QbVHD
         2kCYr8j+kTuH7NkE5D7cxwS8r3rJbGqVSfkoNJQ2y9HtndrWcEKX63X+n17IPPIO6BCs
         /8taSqZvn0E3yaSCWZP9/0FOSQTcWekteBTpolr69ddPZOVdY6BSh+8K2UXVm38Px7kh
         RaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=w667gKYBbDBTMCfXxJDqMeQkVCc8+IrorrB4oS1oJ5E=;
        b=HXkcrdn5zKRuTP/kBJjCYiNR3w0IfFa8+woZEKsVidxnyLHUHDHp/3jpyTY7M0oGe6
         xlDnuARrYKtdR90ObyJZFzc6r2CRQYhrXb0jXTxd3wGdL747qmrN8k6n5gZqRTIen3fu
         vLK4L+5T8UkeH5bvJaROORoj5oG+d9yaI5Zg5OO7He6dfEKGlcseLEnOzJi+3lsF/Xrs
         Bao0Bh8j+S3B5XBCD6CZu0H05CE7+HvhRs5TYN+DcSQx0dg0vK/e/Nm2BCfmgmv0SLQC
         xDr3Ven2ijNuMjS4vF9khwDEyaYTdv6YVvD+oCLfAz0QbOo6parqndexcLMZ/bDv+yOf
         J4kA==
X-Gm-Message-State: AOAM532riNQPTcndSdxK0IgaUp9IQRFx0bJBYjvxkfGLMcq7UDCruhPT
	is/+955/DKR+Kw3pXWrlPIq7MA==
X-Google-Smtp-Source: ABdhPJxUyhO5yAboBwLOcBNkKmseAjK+8zK18o9n0eLHUP9gS4AfNzZPnXiso3pb9aw5D1JuttK3+Q==
X-Received: by 2002:a17:906:704f:b0:6e0:2ce5:131e with SMTP id r15-20020a170906704f00b006e02ce5131emr5321502ejj.246.1650014596978;
        Fri, 15 Apr 2022 02:23:16 -0700 (PDT)
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org>
 <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
 <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
 <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
 <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s>
 <1d6382b6-ddf8-494c-4f7b-afc50a4269a4@gmail.com>
 <CAPD2p-nftmTXQTaOw1kmkBDn96i8sgcaH21o7bsGK-fA+fYbaw@mail.gmail.com>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Rust-VMM Mailing List
 <rust-vmm@lists.opendev.org>, Stratos Mailing List
 <stratos-dev@op-lists.linaro.org>, Christopher Clark
 <christopher.w.clark@gmail.com>, Marek =?utf-8?Q?Marczykowski-G=C3=B3reck?=
 =?utf-8?Q?i?=
 <marmarek@invisiblethingslab.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, Stefan Hajnoczi
 <stefanha@gmail.com>, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd.bergmann@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Rich Persaud <persaur@gmail.com>,
 Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>,
 openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
Date: Fri, 15 Apr 2022 10:07:09 +0100
In-reply-to: <CAPD2p-nftmTXQTaOw1kmkBDn96i8sgcaH21o7bsGK-fA+fYbaw@mail.gmail.com>
Message-ID: <87pmlisnst.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> Hello all.
>
> [Sorry for the possible format issues]
>
> I have an update regarding (valid) concern which has been also raised in =
current thread which is the virtio backend's ability (when using
> Xen foreign mapping) to map any guest pages without guest "agreement" on =
that.
> There is a PoC (with virtio-mmio on Arm) which is based on Juergen Gross=
=E2=80=99  work to reuse secure Xen grant mapping for the virtio
> communications.
> All details are at:
> https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-oleks=
tysh@gmail.com/
> https://lore.kernel.org/xen-devel/1649964960-24864-1-git-send-email-oleks=
tysh@gmail.com/

Thanks for that. I shall try and find some time to have a look at it.

Did you see Viresh's post about getting our rust-vmm vhost-user backends
working on Xen?

One thing that came up during that work was how guest pages are mapped
into the dom0 domain where Xen needs to use kernel allocated pages via
privcmd rather than then normal shared mmap that is used on KVM. As I
understand it this is to avoid the situation where dom0 may invalidate a
user PTE causing issues for the hypervisor itself. At some point we
would like to fix that wrinkle so we can remove the (minor) hack in
rust-vmm's mmap code to be truly hypervisor agnostic.=20

Anyway I hope you and your team are safe and well.

--=20
Alex Benn=C3=A9e

