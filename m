Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEE7704B20
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 12:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535113.832736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pysHs-0004us-CZ; Tue, 16 May 2023 10:52:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535113.832736; Tue, 16 May 2023 10:52:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pysHs-0004t1-9m; Tue, 16 May 2023 10:52:12 +0000
Received: by outflank-mailman (input) for mailman id 535113;
 Tue, 16 May 2023 10:52:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pysHr-0004sv-AW
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 10:52:11 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4741303-f3d7-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 12:52:09 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4GAq4WXG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 12:52:04 +0200 (CEST)
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
X-Inumbo-ID: b4741303-f3d7-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1684234325; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=sB+Mj/0JYa57s0dH0pytNxN9x78tWqosoTB+23lYduhh3nEJmk8CbATrgSwuStHCEh
    hRYKgy6ypxhhQnsLgqUlmvTMTgLV+/53MdjRLezTny69VKe8wFl8nm5pB2l0Lltz6lQ8
    hGByzOarLZvSj+1kRIyHYg10JT5Q01k+ANXPbRcFK+UWewK3odXUSekyoqOmf40ak6ZT
    JEahKi1KtgVuPHx5qCjHjNTE7vp1YYRpMptPikm+4xMxMcz1XgpJv15JuCgv/fqaEnQX
    5gLOs9tvl9n76SMpXTIhRncPxa1n59MVsorauY96f8iiaHdGNWditd/mHBcDsNaHrzQw
    SJNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684234325;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6KfPESJ94Q7Wjf1uwsvrcxu+19Ysz4hcoZIgWyUOic=;
    b=FxaKO96Xwvw88TubWqlEhkKuZ6TKHl25OSCfLmZROBdI23ywAklO1mK08D771u21SN
    ssYAuFt+/BJQLayESMTLgHXkOZo0Vr95w8eqRbonFfp3TfKZ/RIShTarUwt2HyTYvoYz
    K51hhPkYne8zJyZafS09CgDeKRuLvnYT3LmwrpcbvjzXG0a2NRYp9TyagQ74Fix+gsts
    lWDmjDIHIu7F7cgIpzJsW+GxUJF7kQ+bWt1LxWH03hbFdSMpdqsB/7I9twZ0TZgLxP6u
    +GAClTujesCDFbSxZbY2riPIy6f3gQ0MI4Rj7W1aB/kmPQeqpx8zQQqi+JvD5vaxilJJ
    jwQg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684234325;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6KfPESJ94Q7Wjf1uwsvrcxu+19Ysz4hcoZIgWyUOic=;
    b=UtUn7BkSqIeYmJef20+/or9DzgHd7C5MiAoDjp3lt09Yn6n6C4jhvBCIWVzcLK9M8z
    bfJc+jGU/5u1HtrO+HeCDnDItEEt1Y7w5Y9Pdc5tRvt+UxYYBsw3BuwZMtnltzjVb7hN
    71cX1gxlj/xpdQcY0VPWJq/2xF8n9Kv6EzN4VLVQYWypEDeSqwVnRoSkKXO1NJHUrKxY
    hCj1WJ0E3ZyGNVBVPE2Jr/afj3VivKGfEhzHyoQK7c3Zv0bHmOzfmi3kmRM0uVp+ADq2
    ++pvP2HO944iLycRtxcNt+F/Xq48CpCEvo9ejqQYI7LJBndF20HiXnXTo15mif9yTqUZ
    VIQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684234324;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=v6KfPESJ94Q7Wjf1uwsvrcxu+19Ysz4hcoZIgWyUOic=;
    b=ix2G6CxGDGI1lOczXnumWQFTRJQAbo6YJ6Z5znGofNseG0n898BF4LvLPtbN8DfyvS
    5hGvitc8Ju4laShNJ/CQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Tue, 16 May 2023 10:51:55 +0000
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v1] automation: provide example for downloading an
 existing container
Message-ID: <20230516105155.0c59143a@sender>
In-Reply-To: <alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
References: <20230502201444.6532-1-olaf@aepfle.de>
	<alpine.DEB.2.22.394.2305151533320.4125828@ubuntu-linux-20-04-desktop>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3N4AkxyLAJ0de+qo.mFApG0";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/3N4AkxyLAJ0de+qo.mFApG0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 15 May 2023 16:03:01 -0700 (PDT)
schrieb Stefano Stabellini <sstabellini@kernel.org>:

> Given that opensuse-tumbleweed is still broken (doesn't complete the
> Xen build successfully) even after these patches, I suggest we use a
> different example?

I think the example in automation/build/README.md needs to be fixed.
Right now it does something different than the Gitlab CI.

The CI runs automation/scripts/build with some environment variables
set, the example runs automation/scripts/containerize.


For me qemu-xen builds, I assume it is supposed to be 'master =3D=3D
"8c51cd9705 (HEAD -> dummy, origin/staging, origin/master, origin/HEAD,
master) hw/xen/xen_pt: fix uninitialized variable", but we do not know
what GI tests, because scripts/git-checkout.sh does not show what HEAD
actually is. I think it needs to run "$GIT --no-pager log --oneline
-n1" at the end, so everyone knows what 'dummy' actually is.


I think it is perfectly fine that both examples refer to Tumbleweed,
because one may need to fix future build errors, not test on something
from which we already know that it works.


Olaf

--Sig_/3N4AkxyLAJ0de+qo.mFApG0
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGNgSwAKCRBdQqD6ppg2
fmrEAJ94nlngjTejzdC9xC8fKwFh7B+JsQCfb+K7d26Ckh+5PjMBnEt/qoy/P7Q=
=1j8c
-----END PGP SIGNATURE-----

--Sig_/3N4AkxyLAJ0de+qo.mFApG0--

