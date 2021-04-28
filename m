Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F1236D60B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 13:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119218.225625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhz9-00029b-QS; Wed, 28 Apr 2021 11:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119218.225625; Wed, 28 Apr 2021 11:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbhz9-00029E-N1; Wed, 28 Apr 2021 11:04:03 +0000
Received: by outflank-mailman (input) for mailman id 119218;
 Wed, 28 Apr 2021 11:04:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSVs=JZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lbhz7-00028t-PI
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 11:04:02 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9812885-e5e9-449f-98ad-f3506912a14a;
 Wed, 28 Apr 2021 11:04:00 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.25.2 AUTH)
 with ESMTPSA id D0155dx3SB3x4vw
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 28 Apr 2021 13:03:59 +0200 (CEST)
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
X-Inumbo-ID: f9812885-e5e9-449f-98ad-f3506912a14a
ARC-Seal: i=1; a=rsa-sha256; t=1619607839; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=BV4m9YABiwArQ+YcLdS9A6E79UsxIPgCu4DoZ31VGwhQd37gR6sUoqVWWVX6zmetF5
    TGah1M0qqU2gXhKFojVYHGMk2HfG/sB4R7cp4qjwUMIHXBIvoVkEQZw+mQTeM0foUgtI
    aGeNRGNyruZ/lXbw1X7T/L8JONHOmobCVzJH3t0w1UQP0chZgur7DH261gwCwUmOAVjX
    DmMqJBzyOMZhNLd0pDzSr40vAsjowpK1L4p3N1mOOY+HmEw8iezZryPvD7C14GgrBzsD
    gq9enmwgm5LtsK5M5t7shOtyip4FIiA5M1EneRB0x7eJeWHmw6kPprIMEoG1A3ngtXJc
    RJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1619607839;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CJKpLB6He3yiYcrruXOeknmH/h0X8Q5MiiC/wF/SVsI=;
    b=WLxCt5tAWaskRX0spMTlo355PRMsg9ZbgqY4ZmGOuXtKI4ozixBaTSlxrQ7z308ec8
    /1GLfVLsgw2jRtByEDjJzWW2eOlZR0CfwCu4Pw0xD91o5GFEWwFgFsyis6ANfUVv8/uM
    2/LGXs1d1x9KfO+xlO02Z6noc3+xgFCAj/Urhi/tT/Y/Ks3I/fJGwX9Y3jizE9gxUEqo
    rPNcwotypIbw497Uo8xVrt/rhTBCiII8594THbNu3HWI2UZvBIxFl4FlpqtEAxx8QssE
    8FTDf0Bg1opHS7JuPP90CRwJD5YZT70BfdwhmInBbNJnFRDDx/kVDmUxe1EYOZDIgQ2f
    Gd4A==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1619607839;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=CJKpLB6He3yiYcrruXOeknmH/h0X8Q5MiiC/wF/SVsI=;
    b=L1hEdCdwCJ23JnJbA28HIzRLJMYA+Hu2VLn5XkES1nHHz5lyQcNxHcP2SusA22p8P/
    9R4MwINGOQmiX7SefOwmSuL1pXlQ9eQfxER4BGW1mmbw9D6N2tej9pjesBOQpLNFB/AO
    GKSRqhmylbpltQRID3pgJGXZid0R5l/8aT8LJag+8AwKLvfDXnGPMpCEScjLpcefmEW/
    DVEbjQnBKscKgZ+3tBOmIsdNPJYloQPscA50p9I6HhYM0N9fG+f6FFiHUxmEk8eRYNq8
    RcumFsPCbWSzDdUbTMHpLIsPan8HZv9x3xINhvvpYV0q/5lwBf1Nu8DDAuzb1VOImRRA
    yOXA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisEsVR6GbU3svGYLiH9zFD0wpO7hNb2D/K88Gfjs"
X-RZG-CLASS-ID: mo00
Date: Wed, 28 Apr 2021 13:03:46 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: obtain a list of granttable PFNs from toolstack
Message-ID: <20210428130346.2477ffda.olaf@aepfle.de>
In-Reply-To: <d508af0b-dd4a-7c13-f33e-bc60a4fb7272@suse.com>
References: <20210428095049.14a8272b.olaf@aepfle.de>
	<8427397f-0953-94df-04f6-8dfe2a4ceee8@suse.com>
	<20210428121701.3272b369.olaf@aepfle.de>
	<d508af0b-dd4a-7c13-f33e-bc60a4fb7272@suse.com>
X-Mailer: Claws Mail 2021.04.23 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sqePbG.ExxylZ16qgiB28K=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/sqePbG.ExxylZ16qgiB28K=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 28 Apr 2021 12:42:54 +0200
schrieb Jan Beulich <jbeulich@suse.com>:

> It might help if you would outline what you're actually after by
> knowing a domain's active grants.

There is REC_TYPE_VERIFY, which will re-transmit all memory of a paused dom=
U and compare what was previously transferred. Last time I used it a large =
number of pages are different. I did not spent time to dig further into it,=
 what pfns are affected, how the pages differ. I suspect the backends do st=
ill write into the granted pages, hence the question.

I think the domU may undo all grants during its suspend anyway, that is som=
ething to explore as well.


Olaf

--Sig_/sqePbG.ExxylZ16qgiB28K=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmCJQRIACgkQ86SN7mm1
DoAmrhAAiSnuk4q+fVLzLd/yaw3pPXQXDPveClVE68p7VwoRGiWqktWdaqJelhLt
7rIgs+YxAOPaaazhPphQungs1HyyEjdcH7J9YWsk20xSqMTmRUMEmQaFRR+aDsBB
Gk6AtdzP5JM9iMSJcN1lBxR7y74nvvynj7Ahq0QsKJhodUQuBAYG/JUHN8PgoWKf
eqS2xFLt8ZF9+s6FbmDbT1PLY+948Xdno1zlSe88gW+F5pYL6I8UKEj1vEqsQc+3
wGtr3EGp8tKVaCjjWh1hfFgitR+1HtWrJwFQKxofY1EdOqLd8u1Kv0CnvxpkV61R
EQjDkbAdS+B8aY8u8PO4dtqrifBvkU/qs6hQ+ex+5t3j5MVa0ZCYyRmxxjxg70uO
sffcVh9zhQ6lUTUIPgAya1VafOOXIV1wiLMAESBWELmBUp9N4XmowOfBU5WuOHNt
3HpHThcGT7lEqKQ07SN1c5IMjtL4SdTbZ0/Nhg+3cSaBgh5mutx9ZPUkf78eSAZY
dEQePugIUnkpcqZM26uf5LXdT3xRydxA69lPuvTyOPHNnfoymlYLe/eU3GNca5dn
fh8kaoXXpt8snQxGnV43MkxZK0S/HvTvYCVBrxP6bTGEJQkQL9oGail+p9qMJ2f3
G+8YUE2FV7eGn3RokVRz26bOq/xjo2wyPlEJ1DsagHSPewhtYMU=
=jBFO
-----END PGP SIGNATURE-----

--Sig_/sqePbG.ExxylZ16qgiB28K=--

