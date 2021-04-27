Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C875736C456
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 12:47:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118290.224351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbLFR-0006rN-G9; Tue, 27 Apr 2021 10:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118290.224351; Tue, 27 Apr 2021 10:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbLFR-0006qy-Co; Tue, 27 Apr 2021 10:47:21 +0000
Received: by outflank-mailman (input) for mailman id 118290;
 Tue, 27 Apr 2021 10:47:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sA9O=JY=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lbLFQ-0006qs-4c
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 10:47:20 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::7])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9d2cc11-f445-4603-bae6-e5d09ca95a1a;
 Tue, 27 Apr 2021 10:47:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 DYNA|AUTH)
 with ESMTPSA id D0155dx3RAlH09k
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 27 Apr 2021 12:47:17 +0200 (CEST)
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
X-Inumbo-ID: a9d2cc11-f445-4603-bae6-e5d09ca95a1a
ARC-Seal: i=1; a=rsa-sha256; t=1619520437; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Ki1Z7R1d0kzo95iq0M9E0a2tRSm9iXPqGzMNTMNh+LODZlhwdntXg0J74Ui7CGNQ+M
    chyVC+sNixSWbAUceTHZVqCsCtBxBmvlJSHAgJlGDyHhHjxN7SVwlHhRUMGQ/xpz2bFU
    TO59ebrnwh/sMoGfkcHwS6jksI0eD7dLSBiFaADSZqFOebaaEFs1KMjfctEC6Oz6Yip5
    yWYZjQK2u7x6C5KV0I4k2j1HpbzCLpmD2f8qybGhDeRhSxk9rBE/tB8m9kgnZ8QDTevz
    EKqGTJuxjtryCBndOIJXTkdMSoKZ599N+9GzNHobpgiroZf3ljwvDife1umB2CLnySUS
    kUkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619520437;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=Skn0ST4l/hyJtjamObmZL1MnfQrrqMO44BlAGZPozRU=;
    b=Vr7LvFy3LXJd2B5vAHgN7Qu/Q87PA4/dV0X462NgU7e04hgxdaIduWlftmbMZcJG8x
    TbTLBWN7LOcUMn9UKmoKUnGekUTB8lYrkq6gz7xcu9uOopU3w4yb2dY4zYV+jLFxZnwr
    +hBlDa6gT+nlt+1vYTzCllEbBU53PK0p7nadtvK4N0w9bYIWTUWT6e9hpI/VkWcbBmhT
    PtAZnvy76eA8hDtKYXR7pjSJ0dAAdqgjZwjM/PsBQphwTuPITK22fiGIiSv/b5HkNSzB
    y5SWDmhNUNDoABprC8Itq4L/pTB713vaiTtEcrDh+5TeL/s4dHzzjwkNdKgHeZufvFre
    Yx0g==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619520437;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-ID:Subject:To:From:Date:Cc:Date:From:Subject:Sender;
    bh=Skn0ST4l/hyJtjamObmZL1MnfQrrqMO44BlAGZPozRU=;
    b=pLmJ/SGquJaG6H6nW6mrKe+QbeUuaXV4Ql1R9wT87Vwv4X9qmxcA0LasqykWV41YUt
    Bhpcfg5evJ4R02HnwGyNxBa1dBXEP+blKGxCajm0m6Mq8hcPBuoboOzlavV+9eCXUuof
    f7EQYiaxjcCq78RDdCQ6fkPZxrRd6/1Bng0AJ4VKiWlQQc0/GoNFH0Vkmr+/FegSMiIn
    m/EaSF9OUAzqRferZIl3u8bdhHUYb3FLiWfSNxo3kxQiyDesOF4CQyVUiW29LaNmOAtr
    LI8+3g2KaZNxmMkcwKtlm+56CYLY+O7dEz4ztJHI6T0FYiHheREu3Ln9NUTy3cmL6sNe
    Wphg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXmEVBDI4vdCIUVoI+FPGA=="
X-RZG-CLASS-ID: mo00
Date: Tue, 27 Apr 2021 12:47:08 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: libxl uses wall clock to wait for backend devices
Message-ID: <20210427124708.47985c64.olaf@aepfle.de>
X-Mailer: Claws Mail 2021.04.21 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h1Oze/5M/4vh2r1PD6Ht_6W"; protocol="application/pgp-signature"

--Sig_/h1Oze/5M/4vh2r1PD6Ht_6W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Does anyone happen to know why libxl__wait_device_connection (via libxl__ev=
_time_register_rel) uses absolute time values, instead of relative monotoni=
c times, to wait for the expected state changes?

I think this can easily confuse libxl when the system time is corrected by =
some ntp daemon while libxl is launching domUs.


Olaf

--Sig_/h1Oze/5M/4vh2r1PD6Ht_6W
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCH66wACgkQ86SN7mm1
DoAVOg//W7dZqTCitS2K5zMNBs4byV20N+WpVzhxTr/LUK3s3EdxEOt3vFZ6i/1s
oHYPMHWugoKmsPV2XhoW5CdkFM/IUWHfJoVkaplWsImtq8tkwiCJvaQhEHnYya4v
KHv2NKXERcHDWPju5l2uWWJCfV44gHO3RLrzsxFko+mHW9nvvr0oeWG/RhahMxsG
WjROTAwm/YVbgRJHqXV3PKNCUlvQxLQb5aCJpUt08MavVRY2dWFuJFlCR3UOEC7n
mer5YWtEy2EQ1vkfD0ujXL9UxxDv2oRQ9l9B2wI8TNSSmIDpOpsBMaLA5bpvX15U
5Q29az21s8V9lp2A5lF4a5y6kM1WhUO65Ur8fLuoOEYR1voFrw6/RnuCm467gpCd
pl+rMR5ymBu+igGJgpHPRJ08o+FvklqyXGqWWLxuIAQBIYasWkuxLlNfJiF+4imQ
4h4TJGVh7JiRQ8AK1Im2rSUcMUFWNlYKdWyjxJpoJUNYetYcth7URouuStGa3Na6
REs3LG7JkzZY7y+AHlhGXuWUSnOedGd9FGYLCrqRYA5FTHXNIcflymx8l/QQoSKy
3oVFSY7j+Hz5Wdzr95CUC3c17R9oR2vq+/nO1QeQ3O+PRPYYo1A3+fybUpXiHm5G
EqClpBI1li6Pi8OZj26rzM/coDUwvBmkOh3YE+xPBRKpuKvi2eQ=
=4aOa
-----END PGP SIGNATURE-----

--Sig_/h1Oze/5M/4vh2r1PD6Ht_6W--

