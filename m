Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DF960767B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 13:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427632.676908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olqYW-00042i-84; Fri, 21 Oct 2022 11:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427632.676908; Fri, 21 Oct 2022 11:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olqYW-0003zy-4J; Fri, 21 Oct 2022 11:51:16 +0000
Received: by outflank-mailman (input) for mailman id 427632;
 Fri, 21 Oct 2022 11:51:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yW2F=2W=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1olqYT-0003zs-JS
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 11:51:14 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1098b96-5136-11ed-8fd0-01056ac49cbb;
 Fri, 21 Oct 2022 13:51:05 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso3918048wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Oct 2022 04:50:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003b4868eb6bbsm2833399wmc.23.2022.10.21.04.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 04:50:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0F351FFB7;
 Fri, 21 Oct 2022 12:50:57 +0100 (BST)
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
X-Inumbo-ID: a1098b96-5136-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mSZUsrqSSadkGkHHFnqrEyoSiIuzQvl8N+m4auRe10=;
        b=de/4B7OR1i5Ot62hL7rwTo79MIkjbcNmnGSGOgBykNJx+l9T4V0MrNWEB5xR3rUVDY
         U1DEvVmorZXJ0RY0WSAhUGQEsEf7slHBEryHPiSrUVijQgiE3y4LBs/IxK7xkxTa2T1C
         lOH5UskzfU7NNJWew/A3ToOpwZafMuJmgfw7SCvZ9n8EavjQx45f9a+7opy2WKQTvKuI
         V+OvDaddAu78FRt0b4tD3osbYhXtUWlKC+VW/DpNycvbDSD+CNWlAs7Tk4sHPCOAvFyV
         rxS3MM6sAKwbZTx5CA3zgdFInkUVX7f8At1FP43x+41lxmDlOJxcgbevb3p2o0bTc/S7
         aotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mSZUsrqSSadkGkHHFnqrEyoSiIuzQvl8N+m4auRe10=;
        b=3euHJwVF3aLbDm2zqQK0hhyC/iXe7/aqzJyODR7PyNf6QbmodFB09RtwoWXzR89z3y
         nwcikMe8JOVdV7//4OhsMf+WkhfrbzFkDjFpWUyiHrQ2YJry5TFokpDa822x09ENZIYU
         cO83okp9hbpiV9Dgp+tCGKwwtLgTL6Bbv7Jx/9WmAgVDHMW6ILVssAjcbAS7P2Z2B8qQ
         yFWsYg6d64/UoenVe2Arblay1zKQh19kcqBhfIVdH1Empl9DD3betl4igo/4PNle0anR
         3xz8s2EdZs8RbcvryeBQ8H+XeoQsbJMkIKGUVgpdPWeqxaz1RffF+FDqDGnzz33VzP6s
         UrAg==
X-Gm-Message-State: ACrzQf11qEBV9+iMkHsS36Bhl4LUkpcLFyfC3aOOlA+X002RTiU3wTjl
	HLoM4Pspu0EvEjG/+C15qLVg8A==
X-Google-Smtp-Source: AMsMyM4oR5TFW4/6DiOciJaRtY8e7fiqQ+pp18OB9d8iuF5paztNN48vLjQbmjeA3EDZJPvB0KlRvQ==
X-Received: by 2002:a1c:5446:0:b0:3c4:1854:abc0 with SMTP id p6-20020a1c5446000000b003c41854abc0mr13041585wmi.7.1666353058697;
        Fri, 21 Oct 2022 04:50:58 -0700 (PDT)
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-7-lvivier@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>, David Gibson
 <david@gibson.dropbear.id.au>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Eric Blake
 <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>, =?utf-8?Q?Dan?=
 =?utf-8?Q?iel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefano Brivio
 <sbrivio@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v14 06/17] qapi: net: add stream and dgram netdevs
Date: Fri, 21 Oct 2022 12:43:33 +0100
In-reply-to: <20221021090922.170074-7-lvivier@redhat.com>
Message-ID: <87fsfh75um.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
<snip>
> index eb38e5dc40bc..396c1d11e1e2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2772,6 +2772,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=3Dstr[,fd=3Dh][,udp=3Dhost:port][,localaddr=3Dhos=
t:port]\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dinet,addr.hos=
t=3Dhost,addr.port=3Dport\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dfd,addr.str=
=3Dfile-descriptor\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using a socket connection in stream mode.\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dfile-descriptor]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use ``local.host=3Daddr`` to specify the host addre=
ss to send packets from\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Daddr,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Daddr,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dfile-descriptor\=
n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"
>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"

While the option documentation is good it might be worth taking some
additional time to document the wider networking stack. It is a topic
that often sees confusion amongst users and is a complex area of
functionality.

At a minimum a bit of preamble around DEFHEADING(Network option:) to
explain how devices and backends interact might help users understand
the context for the individual options themselves before launching
directly into explaining each one.

We also have some stuff on the wiki:

  https://wiki.qemu.org/Documentation/Networking
  https://wiki.qemu.org/Documentation/Networking/NAT

that might be worth sanitising and transcribing into a section of the
system emulation manual. We can then point to :ref:`networking` in the
options documentation so the user doesn't have to piece together
disparate bits of online information themselves.

--=20
Alex Benn=C3=A9e

