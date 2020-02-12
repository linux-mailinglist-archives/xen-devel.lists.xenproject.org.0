Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B264615AAEE
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 15:26:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1suH-0002sY-TB; Wed, 12 Feb 2020 14:22:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1nZR=4A=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1j1suG-0002sT-7r
 for xen-devel@lists.xen.org; Wed, 12 Feb 2020 14:22:24 +0000
X-Inumbo-ID: 15370338-4da3-11ea-bc8e-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15370338-4da3-11ea-bc8e-bc764e2007e4;
 Wed, 12 Feb 2020 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581517341;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=6pjrgg5lrE1qtoNocF48okM4Hy2QxZ3n+GNC90Ul1UA=;
 b=HV14FrCYqlmb6nqwd4q/Zpcm34SKslQ4iQQrUKXdlPmXUeT0mZoGKmxOqalR9s6Yy5
 uc5+1RtK4lmM84rcUeMqz8o8RTIOC/6sUhL+riZyqfz+gND3Tr+EK1pGDGwbK4yUMAwT
 p7DRCVEkX5AODApRFyTsBHb0b/aJi2Q3n31K07D5GeIbLzDzKipIxGcLS+J11tBxDkdc
 BtJL8pq/JcH+nck+YX5tjZuqE+BcaaKBwf7xlhUJEbxPEsUL2eNFL97wlFMJUfu7JoVJ
 QJVDOe6LZicGv7Klt1AFAY2VSNNpCVRWSmoC71Zjfi7Z6zE+ka/7YyowapDyvnV8/re+
 mNNg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 605caew1CEMLpk2
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <xen-devel@lists.xen.org>;
 Wed, 12 Feb 2020 15:22:21 +0100 (CET)
Date: Wed, 12 Feb 2020 15:22:19 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xen.org
Message-ID: <20200212152219.38d1a43c.olaf@aepfle.de>
In-Reply-To: <20200212115325.12f2efc4.olaf@aepfle.de>
References: <20200212115325.12f2efc4.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] reported memory usage does not match real memory
 usage
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3346971395175814171=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3346971395175814171==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/54BgmaAkO2n+OTsIs0kl.rW"; protocol="application/pgp-signature"

--Sig_/54BgmaAkO2n+OTsIs0kl.rW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 12 Feb 2020 11:53:25 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> Is there a formula to calculate that amount of extra memory, is this beha=
vior documented somewhere?


With the script below, the formula may look like this:
- each vcpu needs 1MB extra memory
- each GB of a HVM domU memory needs 8MB extra memory
- each HVM domU needs 2MB extra memory

I assume these 8MB per GB is needed for the EPT page tables.

In case this extra memory is indeed some obvious static value, it would be =
better to allocate it from the value specified in 'memory=3D' to make sure =
a domU uses (almost) exactly the value that was configured.

Olaf


domU=3D'hvm'
free_memory=3D'125551'
for memory in {1024..102400}
do
        test "$(( ${memory} % (4*1024) ))" =3D "0" || continue
        xl destroy "${domU}" &> /dev/null
        while test "`xl info | awk '/^free_memory/{print $3}'`" -lt "${free=
_memory}"
        do
                sleep 0.2
        done
        xl create -q -f '/netshare/domU.cfg' "name=3D'${domU}'" "memory=3D'=
${memory}'" "vcpus=3D'1'"
        while sleep 0.1
        do
                state=3D"`xl list "${domU}" | awk "/^"${domU}'/{print $5}'`"
                case "${state}" in
                        r?????) break ;;
                        ?b????) break ;;
                        *) ;;
                esac
        done
        actual_free_memory=3D"`xl info | awk '/^free_memory/{print $3}'`"
        domU_used_memory=3D"$(( ${free_memory} - ${actual_free_memory} ))"
        extra_memory=3D"$(( ${domU_used_memory} - ${memory} ))"
        echo "${memory}/$((${memory}/1024)) ${domU_used_memory} ${extra_mem=
ory}: $((((${memory}/1024)*8)+2))"
done

--Sig_/54BgmaAkO2n+OTsIs0kl.rW
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl5EChsACgkQ86SN7mm1
DoDgPA/7Bxc96Ift8QxwwFSyozn5kl32n6NbhRx/3djbaOyrbNFlZmyEdWTZPn/h
0F3C+tK27imgcmc7b/CX0oZ3DLkHlqvCVmGBMcjCM/mYc80RRLHPwBB8iX2bRRv6
rK5GSw4VMpEq/QJ/iL2y20YwI4gFSN8qITT7FoPIiqS/i/fvgh4Qm/E3WzIPYLAi
xqPgB+0jDQQa368j4rm1wiyaRY1Y9vJeFTA3YMPDNtxA1arAYZ24OQDYmxpW2qrV
oEHwMduo6XGZuGlpThRVgIBR1CSl6hsrXufDwvp2krh+EM8Y6D8HmV452T+L34nC
4aGAqZhmrasv5R/zLf41w0B5UlGHRRPykQkiLHuD/q3Yl4arZbWlHaqpYRLc5nKJ
dSgC0H0BrH8fXZb2vcq1IdZH3MjcKhHfihoWyZydUDk3meTJkBmMhBH/m6nSqAW0
cAVSLdk7PboAGUqWc0mkYNxP7He3DhvWcSI7UFBpGcniLvrIc4gglz/t1IL/j2U3
DbERjj1VBMDlUWLsKEN4PvfeDishwaDIYJ8EYBzQtQgXOe5NbxGRZlGcSR+GUzkb
9KUqdBYRiaf/siaKqskNx6ZbCNIX9/2Ryt28KckkkJ9qQAosagxpot/6v/PbV6EP
9kETZcS762OaEB3+17DYBz84z6DABTD3ee3jyISr6f+Er+l3gaw=
=aZdk
-----END PGP SIGNATURE-----

--Sig_/54BgmaAkO2n+OTsIs0kl.rW--


--===============3346971395175814171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3346971395175814171==--

