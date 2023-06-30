Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C386A743AE1
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 13:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557435.870778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCN6-0008V6-Mx; Fri, 30 Jun 2023 11:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557435.870778; Fri, 30 Jun 2023 11:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFCN6-0008T6-JI; Fri, 30 Jun 2023 11:33:04 +0000
Received: by outflank-mailman (input) for mailman id 557435;
 Fri, 30 Jun 2023 11:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=M6/y=CS=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qFCN4-0008T0-P8
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 11:33:02 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de52788a-1739-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 13:33:00 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5UBWpyNP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 30 Jun 2023 13:32:51 +0200 (CEST)
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
X-Inumbo-ID: de52788a-1739-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1688124771; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=cRcjtAI/VOG4+GoSH9C6eYFR+KTj/0suAWOkzfHgw1F7QpXsrqGMdD/SpNzFmO5wso
    mvWJRlxXMDh9Ae09lMsj1cDB3o3R9pXdC06gQPl8IwfVmrA1pKTe8wrMuUfiRpagfBSG
    euMRvIw4YfxaWcJkRnqSlLzs365RGN8mD3k71YLEyAplZKe7GNxCmDwQJDwKbwrn9N4f
    AjAN6Zu8qUOcGF07MmpZ4swbZTMIkp33cVHLP2xUS6Y+gJCvgqsjzqrSgw9ArLDViyX7
    ga9xDpIYqhBhAlFEfPQvNom0Uflmt6ZaIhGSl7uftKn2QBWS2sGEImb81CTBcN1hvXhH
    Vmlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1688124771;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/gk7lMpgzNECZCi+/gCLLwKmUN3PQkb6jMH9TC2m/MQ=;
    b=a7+sFiEgWoGvMgdiSq+qGYdiqYp2/RLHA6/cJM/4muZ5zWLijBe8ASnOPp4ii2uIjV
    sayusVaiYLrdFOb4P+mmzOJmO0MvC+iNHhY3pMbMuHnNpryw+cvDBFlb2OWVEj+WThCQ
    m7mwTaWKc/0gQYZ4o62NXUI477OnhE+7KlsV/t4m/CN9NTOnok33avX6P6OoWdQE/JgT
    6rdHmZ2zgbSnszNBQziljCN4k1o1/+tKeO+eNkAVaKmMgc2PlJ4qpqn+yvvBxxlj89UY
    0XxNoFJfoZ1XvWuYFlmaNn9GI8OkiSfKzNyzlmuc7Hdi30xKhH1eaM/UhgsPNJMeUGmY
    0L+A==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1688124771;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/gk7lMpgzNECZCi+/gCLLwKmUN3PQkb6jMH9TC2m/MQ=;
    b=fYBN01q30vZeqh2Frh9iN/k7steP4RJ2Az4vC1H/ZAFrn6NrnnpBDKy1UY8IQYYAZ3
    z6YbnP5TsXsS+MujV478r/Dj6D7LXM+zikAjmQnWM+fReZCXHKVo0Rg2hFuS+wUD/fnw
    KjoEB9WSj9NgNgnCr9ryWbm8oRoZI0yv85nooLUwOqmmm/+x3DAyGmwcnhomgiYzDbli
    wksRGExpHZTv2ld5iDbVYukb0+Yja40kBzp/uzJtxQKt0RdtSD5d1EeGe4MYq12skQlQ
    AdVLvNap7x9Zc9C22KzzjTmEbprXUyNWE3CdjX+1Vh5MWuqimfUSY2g1fDFoUQg8UR/Q
    gc+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1688124771;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=/gk7lMpgzNECZCi+/gCLLwKmUN3PQkb6jMH9TC2m/MQ=;
    b=hEf6aYcS9lS1cIrxjvszx8GUI7WptFij09TxonfrZJm/Xt6yRBByhoEi2TfJpIKat5
    3LgbSlsr96ERdDYZbbDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR4VReIOE3s+xIC8HZ8TOtjelmE6SkKgUS6xMby0Q=="
Date: Fri, 30 Jun 2023 13:32:42 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, John Snow
 <jsnow@redhat.com>, xen-devel@lists.xenproject.org, Stefano Stabellini
 <sstabellini@kernel.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230630133242.58e6d9ed.olaf@aepfle.de>
In-Reply-To: <367317C5-DB65-40EF-B45B-97E0E802A994@gmail.com>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
	<20210325121219.7b5daf76.olaf@aepfle.de>
	<dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
	<20230509225818.GA16290@aepfle.de>
	<20230626231901.5b5d11c1.olaf@aepfle.de>
	<c939b695-2b68-085a-0f19-108ecdcc1a05@redhat.com>
	<5DB37FA5-41DF-4ED6-8C8A-CDDD6F276F42@gmail.com>
	<20230627140740.2736f6e8.olaf@aepfle.de>
	<4F5609FD-4A89-4450-89E2-3311CC5A9317@gmail.com>
	<20230630092921.392b302d.olaf@aepfle.de>
	<367317C5-DB65-40EF-B45B-97E0E802A994@gmail.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WOYyKbs1pq2/gEoXAojnkkq";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/WOYyKbs1pq2/gEoXAojnkkq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Fri, 30 Jun 2023 08:05:29 +0000 Bernhard Beschow <shentey@gmail.com>:

> Yes. Have a look for piix3/piix4 here: https://www.intel.com/design/archi=
ves/chipsets/440/index.htm

This is hidden behind a login or whatever.

I should be able to come up with a commit message without hardware specs be=
ing available.


Olaf

--Sig_/WOYyKbs1pq2/gEoXAojnkkq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSevVoACgkQ86SN7mm1
DoAoiA/+Nac1y4FAslYKcs5MbXKeAht0YipykhnZnjEs5GFr1xmFi8cKvrPrzyaB
EYjjXoosax8+YJJM/GDKaXyHx68piIf5YdMvA8Zdkp4mQ+HuAZIQa0zit9ONA+gS
WHs154Zf/RqcQMVDjf74GcptgPP2YOmc/MPbZ6UV3GhXD+irdu8bqBnBeNqOV69q
w/irUkAV/tBym8DHacToeoD0KB7c/aGq/6SJHlDSCYcWJElG0midU5E5dMPzNEGz
+w97vAZ6LHcM0NVfa/lwUiXEntM6rDpPNwTyCP2todWEfUZsT+Jn8s8q+H8R6r/O
5FIXltIRH/fl5TEIJsYYEyWYWM4cMxhcVGuTJSeNI0mjxMgqg1OMrg25YgZUNKFK
qmALpYbLZkcLPzIG9YMFwEwAUTdU3zVCinTmuhfTUQc/SStu1I6j7UfVSmSZaScx
sOEWkXzRlr5MbUt/HZ8NTjI2FA+WW3CF428nNFdz1Un+l7Ftq61wkDzsfJ6G6Rqj
xQPe9W98WmaORotynCq+itxUHEzJVFXgG92Lf6/zihB4bqGZes/LXT7NiLRUUUq0
73EOEMZ4fQuxHhsuC0M/S3UeF9I43ONbgAwksZSBOQZY8q6hnTGH5vSvzf8igd0Q
swEhq8zVVLlvihWAHLqx2Ck8LZO8CIFRzBz/0hAHHzCJBC0QQYU=
=8PAh
-----END PGP SIGNATURE-----

--Sig_/WOYyKbs1pq2/gEoXAojnkkq--

