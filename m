Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB20236D2B9
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 09:00:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119027.225352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeAt-0003Xl-7j; Wed, 28 Apr 2021 06:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119027.225352; Wed, 28 Apr 2021 06:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbeAt-0003XL-3Z; Wed, 28 Apr 2021 06:59:55 +0000
Received: by outflank-mailman (input) for mailman id 119027;
 Wed, 28 Apr 2021 06:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yQaW=JZ=invisiblethingslab.com=demi@srs-us1.protection.inumbo.net>)
 id 1lbe0H-0002Yv-8u
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 06:48:57 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea6d6ba8-da56-492e-8d60-2fb9099017cc;
 Wed, 28 Apr 2021 06:48:56 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8DA2FD72;
 Wed, 28 Apr 2021 02:48:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 28 Apr 2021 02:48:54 -0400
Received: from [10.139.255.254] (unknown [66.115.173.166])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 28 Apr 2021 02:48:53 -0400 (EDT)
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
X-Inumbo-ID: ea6d6ba8-da56-492e-8d60-2fb9099017cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=n+NkJe
	fZdFCSii+qnQS0wALGULSVUtTiSpLmzmY/7jo=; b=gA98iOA2LLxpEkvq+L9Rf6
	Of5TnBsgXw2i3ZZaXHxDOQNIDIgPDkkVgDLRpwXKNTur//bX/Aa2yVCbR72a4NSg
	b+Q5FxQNL13L3WVIxlYo78CIZEQFsic71+qb7vf4zvQrQWO/2caUhWMtqtLz2jxo
	x8mX4hWWGIA49TORyRU5Rx4UuhJsNLL0flULk24tQAya4/x3uwxPabh7ULJj7zdF
	MDJT3c/zsMqBUeP89GzUgZfTypCLyOK49qSh3cxG+OJTMhdTvwtavBiV7ixmsuaI
	URlSyUhuZJ7LtXmHfClLYHhc1p3v/RHtzHvRZRVGzUCDhPybUyIUwzFysOxmSHMA
	==
X-ME-Sender: <xms:VgWJYGf_qy2UgJxcueWkkHtnmnJEDrRZjAxZ0cxLup9pbY39xcEcUg>
    <xme:VgWJYANlnAb5F4mIYEFQKiUxaAXx_ICbUpy2P7bZWKsOnFp4S7VmmwHlG-GhtixAR
    gPp2DGxTy-sTeU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvuddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefvfhfhuffkffgfgggjtgesghdtrefotdefjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepffeutdevlefghfehheekheegieel
    gfeffffhudduueduhfevhfejteehffehueevnecukfhppeeiiedrudduhedrudejfedrud
    eiieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:VgWJYHgMfAMs4ErI0U3WOefSrZ03Nd3KlSpoVfkWQeN-sPOFJxhbpw>
    <xmx:VgWJYD-LiMKv9e4j3y4Fg9ZX5icD8nKcIgt-E7T_8wQUtjFdrSgd9Q>
    <xmx:VgWJYCuolb2xGhNW313C6ldcSJRhfps9v1GBu8dJ3yhyYREOPXvnPw>
    <xmx:VgWJYHUfiD63xFokX4COScfW17bXg4Bmfe2MoEcOSjiohkpiSLpZig>
To: =?UTF-8?Q?Marek_Marczycowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [RFC PATCH 0/2] libxl: support common cases without block script
Message-ID: <41538969-c59d-acc5-9eee-0dffca50d6ac@invisiblethingslab.com>
Date: Wed, 28 Apr 2021 02:48:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QuSxHp8sqUgk0op65Pzl6XtmQMEDuaDN3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QuSxHp8sqUgk0op65Pzl6XtmQMEDuaDN3
Content-Type: multipart/mixed; boundary="rtxUu6I7pPr2GiYXoLWVbrSlSu6ESUvqI";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: =?UTF-8?Q?Marek_Marczycowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <41538969-c59d-acc5-9eee-0dffca50d6ac@invisiblethingslab.com>
Subject: Re: [RFC PATCH 0/2] libxl: support common cases without block script
References: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>

--rtxUu6I7pPr2GiYXoLWVbrSlSu6ESUvqI
Content-Type: multipart/mixed;
 boundary="------------B5CDC002198864B3CFD74116"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B5CDC002198864B3CFD74116
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

When it comes to file-based block devices, the major difficulty is
the extremely bad kernel API.  The only fully safe way to use loop
devices is to use LOOP_CONFIGURE with LO_FLAGS_AUTOCLEAR and hold a
file descriptor open to the device until another piece of code (either
another userspace program or the kernel) has grabbed a reference to it.
Everything else risks either using a freed loop device (that might now
be attached to a different file) or risks leaking them on unclean exit.
The only exception is if one can make certain assumptions, such as no
other program freeing loop devices for the file in question.  This is
a reasonable assumption for Qubes dom0, but neither for Qubes domU nor
for Xen dom0 in general.  Nevertheless, this is effectively what the
current block script does: if I understand the code correctly, there
is a race where badly timed calls to losetup by another process could
result in the block script freeing the wrong loop device.

Worse, writes to XenStore only cause Linux to take a reference to
the device at some unspecified point in the future, rather than
synchronously.  It takes a major and minor number, which means we
need to hold a reference to the relevant loop device ourselves.
FreeBSD solves this by having XenStore include a path to the device
and/or regular file, but on Linux this leads to awkward issues with
namespaces.  Instead, I recommend that Linux gain an ioctl-based
interface in the future, which takes a file descriptor to the device
to use.  The kernel would then do the writes itself.

Thankfully, not all hope is lost, even with the current kernel API.
We can use sd_pid_notify_with_fds to stash the file descriptors in PID
1, which will never exit.  We can give those file descriptors a name,
so that we know which is which if we are restarted.  And we can close
devices that we know are not in use by any VMs.  The cache will allow
us to avoid duplicating devices, which is actually quite important =E2=80=
=95
QubesOS doesn=E2=80=99t want each qube to have a separate file descriptor=20
for
its kernel, for example.

Initially, I recommend focusing on handle the case where the process
using libxl is not restarted.  That is the simpler case, by far.
I suggest starting by just setting up a loop device prior to attaching
it, and destroying it when the device is detached.  Caching can be
added as the next step.
--=20
Demi Marie Obenour
she/her/hers
QubesOS Developer, Invisible Things Lab

--------------B5CDC002198864B3CFD74116
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB288B55FFF9C22C1.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipda=
q+4
Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSVZ7GeN=
W1U
nzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ=
3js
sesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL=
4Po
fBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS=
1pJ
5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXsBtDQb=
abt
7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r6bTBswMBXVJ5H44Qf=
0+e
KeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C9a1P1MYVysLvkLvS4H+crmxA/i08T=
c1h
+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaS=
twO
DNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmllIE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgP=
GRl
bWlvYmVub3VyQGdtYWlsLmNvbT7CwXgEEwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWA=
gMB
Ah4BAheAAAoJELKItV//nCLBhr8QAK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFj=
c6y
MUjOb1H/hJVxx+yo5gsSj5LS9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwA=
w4B
57ZEJoMM6egm57TV19kzPMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erw=
Ik6
gha/Hp9yZlCnPTX+VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3b=
ZU5
aoaRQRDzkFIR6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9T=
kH9
0kkBTG+aEWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1se=
eQD
jEYPtqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd=
1Ny
2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJi=
tfR
P7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4xXd3iV=
/uD
8JLGJfYZIR7oGWFLP4uZ3tkneDfYzTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhd=
Ghl
bmFAaW52aXNpYmxldGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/=
5wi
wQUCX6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0YR+YYC=
5Kd
uv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkBoY6n/5lSJdfnuGd2U=
agZ
/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3Szk1OwFx2lzY1EnnconPLfPBc6rWG2=
moA
6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDVrGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQr=
qFD
A7nBNiIVFDJTmQzuEqIyJl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1H=
L5V
QCNQdqEc/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQhr=
a2u
8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XIFl7aM2d6/GJiq=
6LC
9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsNxaQJH6VRK3NOuBUGeL+iQEVF5=
Xs6
Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCufudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVN=
KyD
P7lYpwc4nCCGNKCj622ZSocHAcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM1ARGVta=
SBN
YXJpZSBPYmVub3VyIChJVEwgRW1haWwgS2V5KSA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY=
29t
PsLBjgQTAQgAOBYhBHaHTZ8TNroiWQcccbKItV//nCLBBQJgOEV+AhsDBQsJCAcCBhUKCQgLA=
gQW
AgMBAh4BAheAAAoJELKItV//nCLBKwoP/1WSnFdvSAD0g7fD0WlF+oi7ISFT7oqJnchFLOwVH=
K4J
g0e4hGn1ekWsF3Ha5tFLh4V/7UUuobYJpTfBAA2CckspYBqLtKGjFxcaqjjpO1I2W/jeNELVt=
SYu
COZICjdNGw2Hl9yHKRZiBkqc9u8lQcHDZKq4LIpVJj6ZQV/nxttDX90ax2No1nLLQXFbr5wb4=
65L
APpUlXwunYDij7xJGye+VUASQh9datye6orZYuJvNo8Tr3mAQxxkfR46LzWgxFCPEAZJ5P56N=
c0I
MHdJZj0Uc9+1jxERhOGppp5jlLgYGK7faGB/jTV6LaRQ4Ad+xiqokDWpmUOZsmA+bMbtPfYjD=
ZBz
5mlyHcIRKIFpE1l3Y8F7PhJuzzMUKkJi90CYakCV4x/aZs4pzk5E96c2VQx01RIEJ7fzHF7lw=
Fdt
fTS4YsLtAbQFsKayqwkGcVv2B1AHeqdoTMX+cgDvjd1ZganGlWA8Sv9RkNSMchn1hMuTwERTy=
FTr
2dKPnQdA1F480+jUap41ClXgn227WkCIMrNhQGNyJsnwyzi5wS8rBVRQ3BOTMyvGM07j3axUO=
Yae
jEpg7wKiwTPZGLGH1sz5GljD/916v5+v2xLbOo5606j9dWf5/tAhbPuqrQgWv41wuKDi+dDDE=
KkO
DF7DHes8No+QcHTDyETMn1RYm7t0RKR4zsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/8VFkC=
JQP
QZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJvVqGlObI2D=
EG8
TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+MkD0Hy5JH/0qgF=
mba
SegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVOtxEfgewsQtCWi8H1S=
oir
akIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJriwoaRIS8N2C8/nEM53jb=
1sH
0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcNfRAIUrNlatj9TxwivQrKnC9aI=
FFH
Ey/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6dCxN0GNAORIVVFxjx9Vn7OqYPgwio=
fZ6
SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfArnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li=
/8o
eYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCjkTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlp=
X2n
I9no/ugPrrTVoVZAgrrnNz0iZG2DVx46x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKA=
hsM
AAoJELKItV//nCLBwNIP/AiIHE8boIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2=
V3i
EzxMHbgyTCGA67+Bo/d5aQGjgn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9d=
iAm
3VeNqchtcMpoehETH8frRHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0Bra=
HOB
yy9LEDCLhQiCmr+2E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8=
ecU
2q50zgHWPdHMOBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbO=
JP2
G/q1wT1oGkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ=
/rY
Z9+51yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3X=
nbO
vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8H=
Qja
PM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E+MYSf=
kEj
Bz0E8CLOcAw7JIwAaeBT
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------B5CDC002198864B3CFD74116--

--rtxUu6I7pPr2GiYXoLWVbrSlSu6ESUvqI--

--QuSxHp8sqUgk0op65Pzl6XtmQMEDuaDN3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmCJBVQACgkQsoi1X/+c
IsEB6xAA3NaPsDQNhy9DCjozQ8lR1uGp12su5Sl0Wmd86OQg1TVLjMqx0JiGFTYw
iwcuPY3QjyEG5gsAIN5rL7ujx8/aurNBD9ca+SdDVHA6ofjlseXN4z9kZtO4gsGd
v+pqzzntzAJ5QXIelKibyxh1mmMeQHASOnC7GBOmlw+6deHc1yNIDsUm0zftWJwH
InLa/aap8yOXMv+rIhMWkQd0ukiSgiL0APtj+UrfhPCAN75sVmmuFSP5mpdYOUC9
nvgpOMEi8BEXwJi7pXTvgf2dh4r6MJHypIa8pIgoxALA5eHwxFX0I4xhd2Fs4iBo
rHiCyoE5mfb9smcR1S2RBS0qgSnI5A2vjWhtfmKhMuHiB3Xqanu5+SZua12dhHAd
mEulIiiX8xhohJizPJ++m4DxJhjTSCVaWf5qaQ6JN2w0uQhEC06LMgdKWGlkEEcl
mueBAsvP6O84ZuzrWGxTM4Jx+MWliQdAG0m/tetRVPb0pLJr9YCpBvHKpriN3ih7
Q5v2legcKMjk522ihLSkqu9gabh8qYzs/IeTvdbasS2MPX6dJ8xREmq1GIFsImcl
p+EOOl8xNXfRclNfr1t6RJkTUhI8LMBfw0MvhE7atNmKIPVo5P02KqZh1eLhfPFx
1tr6w5sby26u2eR8zpZ2zo42BZS9Zv3Ouhm9aQejfuY4RxvlkfQ=
=nPfN
-----END PGP SIGNATURE-----

--QuSxHp8sqUgk0op65Pzl6XtmQMEDuaDN3--

