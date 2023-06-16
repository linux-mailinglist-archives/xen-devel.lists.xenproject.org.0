Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E81733057
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 13:47:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550111.859017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7vG-0005wE-Nb; Fri, 16 Jun 2023 11:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550111.859017; Fri, 16 Jun 2023 11:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7vG-0005tG-KV; Fri, 16 Jun 2023 11:47:22 +0000
Received: by outflank-mailman (input) for mailman id 550111;
 Fri, 16 Jun 2023 11:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2CY=CE=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1qA7vE-0005qE-Os
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 11:47:20 +0000
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af9993f-0c3b-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 13:47:17 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.6.0 AUTH)
 with ESMTPSA id y5401az5GBlF7vV
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 16 Jun 2023 13:47:15 +0200 (CEST)
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
X-Inumbo-ID: 8af9993f-0c3b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1686916035; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=PZ2xoQ75y+NvZPgMj1QKuR01CKimrB6vhbJBOxf2Igs4jMqkhL+EDo7oOPYg56wofC
    RomLuyQ/KYlTH6QTKQPBdc1Tj8lYfxGINd3qzQas6SDqHqCbJ8B4929T11hfK5kkLidF
    QzclO+D/hRRya7h8JZJl8P8SwEySKnorDR1Z6adYixaCLtlISaEQCG5d/dob7TutOTGn
    xzxbI9aHywWvcmVFsqfwbS0DNFTTR6kTeE7a8GDGkCz1hQYXE6jwDGrhYun0ysstxhgI
    dbeFRVuz1B0MXeBABFTa7n7Mm/aZ9OXsefU5/phUeDeWlRAimQzJmGZPtEN2GdZccFJV
    /e/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1686916035;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+JAwBarfPfVRONQKvkhvJMNBYqOxNfnw0XkD4Q9Kc8E=;
    b=EXXhg35WtDESm0ZG+YayhD1rPVxNCqmu3YbQ3Bl9YS8iIJ5yEINNQ5JNHPVMQoC8IP
    54wURqwNTtt3He9fLSyAOhMFIFO9XjEjHcUP7jQRoZPFVjkX2KCR87taK/d3Cjm+xnRA
    GefoNMWccjL/JHDwL//JIxzjM/QXp34T9SiIQnoK4/WUJZxSMAE1emCnwgw+w5TzT4OL
    WxGv98c5toVtVOdwiFkVZ9FHCkxuS/sV8xwnvTXUtXf6ADN11K+0RmTptS4kWlwJtgJN
    fkcMlqyc4qJqAk3KV2BXSdC/ed5xsQGUXwK6ZB/QivHupcX0fikxKQcLacbwDcxEIXlI
    EJfQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1686916035;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+JAwBarfPfVRONQKvkhvJMNBYqOxNfnw0XkD4Q9Kc8E=;
    b=SPb3A+WiZUk4zfu1c6OXehfKquNBcRPpBQ0qps2i63sd0yRNblmM5rrYyHACFR0RCZ
    phDfrftu4Wa7UG+7aDXikagIhCUxtdHMFzKcXpjFOKYdohk4W6wxCYYpeyilRlWMcw0h
    DSRb5OiAAYifBqADhZv3PVlYfhtpuiTc/4zWZDpUluBovFufhlSBN8Ykq42TQJehAjHI
    Ilv4xfrSdYAY9FfLlhHMmsM0Fx6hajUm6RDQWUtd21lQz04laTSsbZBwWpLcIMzUZ7yX
    qalwjwKvHbkZBiTZg00q/hJTfNlBDYRU+OlHKxO3VIl0uCkCQlws0LWRVaPs+jvsWN4X
    6Umg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1686916035;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=+JAwBarfPfVRONQKvkhvJMNBYqOxNfnw0XkD4Q9Kc8E=;
    b=HNAsr7fTuRl10iviU30Zdmfj9Gq3gWgaWa3Bg2h3mpwjcDOaaUwYB7CQHLURKPh0X7
    kSvq3n81ZTR7zJ2hpkDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AB2Ibh3sRFQAfajHZ8Hr2i7N1ImBUHmXWy0PQg=="
Date: Fri, 16 Jun 2023 13:47:08 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: xentrace buffer size, maxcpus and online cpus
Message-ID: <20230616134708.6b3c6964.olaf@aepfle.de>
In-Reply-To: <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
	<578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
	<20230530220613.4c4da5cc.olaf@aepfle.de>
	<1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
X-Mailer: Claws Mail 20230601T090920.68bc28c0 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3I7OyAD8F5DuDB8umA8hwSZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/3I7OyAD8F5DuDB8umA8hwSZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Wed, 31 May 2023 11:05:52 +0200 Jan Beulich <jbeulich@suse.com>:

> As said before, num_online_cpus() will under-report for the purpose
> here, as CPUs may have been brought offline, and may be brought online
> again later (independent of the use of "maxcpus=3D").

It turned out, commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39 broke
the expected behavior. But to me it is unclear what bug was fixed by
this commit.

If I read alloc_trace_bufs correctly, it already operates on online
cpus. And __trace_var will do nothing if called on a cpu which was
not online, t_bufs will likely be NULL.

To me it looks like commit 74584a367051bc0d6f4b96fd360fa7bc6538fc39
could be reverted.


Olaf

--Sig_/3I7OyAD8F5DuDB8umA8hwSZ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmSMS7wACgkQ86SN7mm1
DoDMVQ//UZ26hDCqxGCcfRQ2uhYOFvNfQUQ9KFgIrRp1mDun2SxpHn0jzLvWvVv5
aSlSV1SaNutZEwYA8z3+aZhfxpq9ORA4EZGfFv+zVpxS4ZYnb4fuM82FaMvmZx5D
8qw1KfmU0v36jI8IqUg4KGtnkl0jxgLEWfCNaS9GC1u/rOE6wRita+i6eERm/nYK
ZebY37Z1kF4mOCPjtDrtrGliWqBcjr4D/yy3HGK2rNw/uEYNycj44HtuXDszmT4O
DtGB2zIo/35KbK+IDeVCTvMTg6Vixtj3chRfUCrzezsDQEjfNPSw31D99d9Gm7FG
2QzR3My2Q5WEetejeK24XaODyGS6gfhThegwjknzKDfygwEumRcjfYE1g/rNTlth
o1nQHQ8iKLTujzi1tPQzPkL/UslkHX5MUQ/wn2P/DuvGzMn23sKvkXiPA+79e9Yq
HN8fISAz6TDNGnR2HflHN15Je4kADh9Qe1qerWGwJJ9TCGTsfz41JwqeZ8v4nWeq
JfWp2gUOQ5qXGVuR9vvf/ZUPBvGGEFkzfp52MLwLVJs/fq1titC5/1E8yEGaBxmj
iCrqLDaTPVVGn7TOSoHXitnkPlCHpCGTN7sQVi3tn3CeghNcdc6E5CVXKd2Qikl9
EBEDqisLV+LV0f8UWy86KM7epLbvT5tX4O7KpzIAb0G84PdfLN8=
=nCS6
-----END PGP SIGNATURE-----

--Sig_/3I7OyAD8F5DuDB8umA8hwSZ--

