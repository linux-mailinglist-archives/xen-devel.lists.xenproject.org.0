Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC7705838
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 22:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535685.833630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0qU-0000p1-0D; Tue, 16 May 2023 20:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535685.833630; Tue, 16 May 2023 20:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pz0qT-0000mx-TW; Tue, 16 May 2023 20:00:29 +0000
Received: by outflank-mailman (input) for mailman id 535685;
 Tue, 16 May 2023 20:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tkax=BF=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1pz0qS-0000mr-Lw
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 20:00:28 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cc9d0c5-f424-11ed-8611-37d641c3527e;
 Tue, 16 May 2023 22:00:26 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz4GK0DYiy
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 May 2023 22:00:13 +0200 (CEST)
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
X-Inumbo-ID: 4cc9d0c5-f424-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1684267214; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=oYjAOuo5XrCuEQR1W6/l+gMe8iW0/pRObAz3AXMdbMBAntXrf7eR3xWdGCEDgd5ejv
    8luHseiXq2JYMjo6BbNsglvWUioUorZ/XaMfsQWvp5ICJUPL2RO1xodEJyHR129K1yD1
    zoGe9NRN391Q+qXpMprXqEmK4n2iqaG8BwlX9sWTi8uznAD0DPksWP8RTa2oq0s2v9gn
    696rv2N8tmh/nGqGWobPJv1XoS+8nkf8oVPii2wp7FUwgZxBF2BwgIoFAgBPMJMzzE1S
    Tz5YwRhIqw4rOjEhAkABqrzraxm2i6xPuM5addxLuDimkwMqwEq6TidN4X+2vzld2qQs
    JbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1684267214;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pS0Z4id9fKm2g4HFIaP4cyA8REoB+fljOJamATQiIKg=;
    b=NkTEOOvUULIQHeKXD/qBlLdSUlymDYKgU2w3ld2/D95sks4e1qYP8VPVq4UBrIIr63
    vE94G3LG07MnxIJ/1EZa8W1bMsfltVELjyAsi6wU/bLdppBbaBoehgvJr0TQhINESyg4
    weWFPYUkel/Cw8E2IbUZrZKxiTr8wVBL2fpTIjg2Hku6Wf3OOygon1Ih0DmmghrE3eWJ
    ejW8rajtT4YH1pCyqELfXSDu0NhnoGhSMnwZE/ubU4BAf1lgHE6QuUWLfqjdFTaF6In7
    BJdIRm7xJLdx3lxDudGbo/VoCHVNNdY+Bw0wSVaqcqETpiR6xDKU/WXOlJ67haX4HZWP
    rI1w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1684267214;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pS0Z4id9fKm2g4HFIaP4cyA8REoB+fljOJamATQiIKg=;
    b=LyXWqaWgSuG1JKysX34wy0K6ONnQlBaVJHC97d9voPDy8UJpk3QvOx27tV+Mqm1Yyj
    pbW8qfbpUrVRwBNM5lkL6gTPTPBOY9Y0tOlPE6ShOOCbJnDL8y5CmRqZ2bqHlbCMTpRX
    uqVwj9HHcBiFNxkKAEAkxI/iZke1GHRgkyH9qkj32ikXmLyNG9ARFIIFy07rAvwWN0bC
    axXKdHjZXxHS9nRh8WWJHeogvVJmkH619asQFMMFNnP5XG3WzXAOfMbSA1fltMCfzGMh
    MfMzrDRrLtGJx5nSTGpBr3dQ9IYFlllkx1EKYfJopQozQXA5dUoEQnE2QJXiY/atxVRI
    eqfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1684267214;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=pS0Z4id9fKm2g4HFIaP4cyA8REoB+fljOJamATQiIKg=;
    b=iVQJE14B1+56+wIw3G/ijmiRqUwL5q4Qd8Ue4aef6lOkHfwWhc2Z3y3afylkQkcFT0
    MtU+ri5Yn6x8XxH0KZBg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX/0jCNVp4ivfSTHw=="
Date: Tue, 16 May 2023 20:00:07 +0000
From: Olaf Hering <olaf@aepfle.de>
To: John Snow <jsnow@redhat.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Message-ID: <20230516200007.4fa87c6a@sender>
In-Reply-To: <CAFn=p-aFa_jFYuaYLMumkX=5zpn228ctBcV=Gch=BhmQs6i2dA@mail.gmail.com>
References: <20210317070046.17860-1-olaf@aepfle.de>
	<4441d32f-bd52-9408-cabc-146b59f0e4dc@redhat.com>
	<20210325121219.7b5daf76.olaf@aepfle.de>
	<dae251e1-f808-708e-902c-05cfcbbea9cf@redhat.com>
	<20230509225818.GA16290@aepfle.de>
	<20230510094719.26fb79e5.olaf@aepfle.de>
	<alpine.DEB.2.22.394.2305121411310.3748626@ubuntu-linux-20-04-desktop>
	<CAFn=p-aFa_jFYuaYLMumkX=5zpn228ctBcV=Gch=BhmQs6i2dA@mail.gmail.com>
X-Mailer: Claws Mail 2023.04.19 (GTK 3.24.34; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/11aB=ufI14REGukuAgcfB1H";
 protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit

--Sig_/11aB=ufI14REGukuAgcfB1H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 16 May 2023 13:38:42 -0400
schrieb John Snow <jsnow@redhat.com>:

> I haven't touched IDE or block code in quite a long while now -- I
> don't think I can help land this fix, but I won't get in anyone's way,
> either. Maybe just re-submit the patches with an improved commit
> message / cover letter that helps collect the info from the previous
> thread, the core issue, etc.

I poked at it some more in the past days. Paolo was right in 2019, this
issue needs to be debugged more to really understand why fiddling
with one PCI devices breaks another, apparently unrelated PCI device.

Once I know more, I will suggest a new change. The old one is
stale, and needs to be rebased anyway.


Olaf

--Sig_/11aB=ufI14REGukuAgcfB1H
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCZGPgxwAKCRBdQqD6ppg2
fqLiAJ46FKHEwF2tggdoStt1IxPQ76JRyQCfZMuVO4l+1/a61bf/j2kZyfqYQlk=
=aXMf
-----END PGP SIGNATURE-----

--Sig_/11aB=ufI14REGukuAgcfB1H--

