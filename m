Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AD8907BAE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 20:43:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740183.1147200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHpPj-0001sd-S9; Thu, 13 Jun 2024 18:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740183.1147200; Thu, 13 Jun 2024 18:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHpPj-0001qD-Pb; Thu, 13 Jun 2024 18:43:11 +0000
Received: by outflank-mailman (input) for mailman id 740183;
 Thu, 13 Jun 2024 18:43:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=efIH=NP=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1sHpPh-0001q7-DL
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 18:43:09 +0000
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c521ca8f-29b4-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 20:43:05 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 77E1713800C3;
 Thu, 13 Jun 2024 14:43:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 13 Jun 2024 14:43:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jun 2024 14:43:03 -0400 (EDT)
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
X-Inumbo-ID: c521ca8f-29b4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1718304184; x=1718390584; bh=qW
	oUrAUWWgJn8eusZ6A5J29EQ7L6X0sMAPMummShSfY=; b=rNzD6g0o9huEoCLXWl
	nz5Vpl4BKz3pOznlI6sBsr7Cta1R9pcsbGnXBLX4fae9DOvXIG910XWiofk+Eaex
	pNHx9EwWFQquJBU9QDXgc4Mfe1dWibzxolfRrnFP+MsLwVNUjdbuDyi9IjbORunV
	UzhOkaVz5KvMuamxtrGSlAfBQVxyd9+FDtA03uSeYWGLlv5WulSqm4eNoKSe2mNe
	s/JkR/+/lSSs4NYlWInS++vuqOWqA49cvbx9RlCieCZ2jVBNTKakcWbfOBpscXjQ
	KaMuHZHmKSkPkaExJD4G9owOTohM7SHiULefFASDF41550/q4MDdnYRUMiFxeBvz
	hIyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1718304184; x=1718390584; bh=qWoUrAUWWgJn8eusZ6A5J29EQ7L6X0sMAPM
	ummShSfY=; b=E8EsXK02QsLFiEN3HTQbh5324EG2qMAxbu3ElBTy3QuvWB9V4ca
	CNBdTnqGHmvLexTF2SWNC4ZLJLkLOheu65scha4Acxk4WJ1id0V4dzEKXVewVAvP
	CfTKnaBY/H98fZdW2NQLNNWiIjeZClnWtj4VAlcuVGH1FUf956+T1+CFrGbFzD4F
	81GzmSB30fOrSZsdq1lnPuBLEE5mNuIdbRka2YFrmSla6MKfNGsFfqiCb2nTfrQH
	1Lbcl3/YzKAk/IuWkGRQwJpO6NZlQjp8uxPKEvuD4q/S3AkcmCe6Wk0H1fZVeAUT
	WcjTUNmEh5G3AgiyTLtdM942U04MjKJe/Vg==
X-ME-Sender: <xms:uD1rZo7RpyxgCF0zy1u_c_idfWSJfl7HfZWsqfT6U_FiOeZewYLHBw>
    <xme:uD1rZp7pl2TwDPUz7v7FMO3gY6raIwaV7ctuDXbx587B2hygG1wKkogQtQVZNkR2x
    QnRqdKQVhVyiwU>
X-ME-Received: <xmr:uD1rZnfEmqkwIhSasKimraN6aPTX5TedShLRfWr8BO-PlhQSja_-owoKPbHEM9oTV4MpDzGSRlnujKyAILMabZbxBJPHMl_zGzcqlvvdZd8aNvAu>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfedujedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiiedvfeevvddtgfduvdekieekieeg
    heelkeetffefjeekfedvgffgtdejveeljeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:uD1rZtL8_9e73UwN82bUQXlN6yifkkEmdz4JunohWP0gp5nNLcKdNA>
    <xmx:uD1rZsIV_14LQxXqfPqgJoRo39kl6MwkeSQZRD_GBM4HSLONr3l9Pg>
    <xmx:uD1rZuwr52uLtBQ5AjA88RuaIMCQca8lQmo3xU5srhdSFlWkKwLZEw>
    <xmx:uD1rZgJNETtiG09ogGFmS7yqLppIW4xeipNWXHixH9xasOvUtQs8mg>
    <xmx:uD1rZhG6ShCUlsqjahClr3uo6Zfy1Vj-cuBHvM7yoXo8eenDN1O3jqq2>
Feedback-ID: iac594737:Fastmail
Date: Thu, 13 Jun 2024 14:43:00 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper@citrix.com>,
	Ray Huang <ray.huang@amd.com>
Subject: Design session notes: GPU acceleration in Xen
Message-ID: <Zms9tjtg06kKtI_8@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0xB0yhqWj3EK5xsf"
Content-Disposition: inline


--0xB0yhqWj3EK5xsf
Content-Type: text/plain; charset=us-ascii; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Jun 2024 14:43:00 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper@citrix.com>,
	Ray Huang <ray.huang@amd.com>
Subject: Design session notes: GPU acceleration in Xen

GPU acceleration requires that pageable host memory be able to be mapped
into a guest.  This requires changes to all of the Xen hypervisor, Linux
kernel, and userspace device model.

### Goals

 - Allow any userspace pages to be mapped into a guest.
 - Support deprivileged operation: this API must not be usable for privileg=
e escalation.
 - Use MMU notifiers to ensure safety with respect to use-after-free.

### Hypervisor changes

There are at least two Xen changes required:

1. Add a new flag to IOREQ that means "retry this instruction".

   An IOREQ server can set this flag after having successfully handled a
   page fault.  It is expected that the IOREQ server has successfully
   mapped a page into the guest at the location of the fault.
   Otherwise, the same fault will likely happen again.

2. Add support for `XEN_DOMCTL_memory_mapping` to use system RAM, not
   just IOMEM.  Mappings made with `XEN_DOMCTL_memory_mapping` are
   guaranteed to be able to be successfully revoked with
   `XEN_DOMCTL_memory_mapping`, so all operations that would create
   extra references to the mapped memory must be forbidden.  These
   include, but may not be limited to:

   1. Granting the pages to the same or other domains.
   2. Mapping into another domain using `XEN_DOMCTL_memory_mapping`.
   3. Another domain accessing the pages using the foreign memory APIs,
      unless it is privileged over the domain that owns the pages.

   Open question: what if the other domain goes away?  Ideally,
   unmapping would (vacuously) succeed in this case.  Qubes OS doesn't
   care about domid reuse but others might.

### Kernel changes

Linux will add support for mapping userspace memory into an emulated PCI
BAR.  This requires Linux to automatically revoke access when needed.

There will be an IOREQ server that handles page faults.  The discussion
assumed that this handling will happen in kernel mode, but if handling
in user mode is simpler that is also an option.

There is no async #PF in Xen (yet), so the entire vCPU will be blocked
while the fault is handled.  This is not great for performance, but
correctness comes first.

There will be a new kernel ioctl to perform the mapping.  A possible C
prototype (presented at design session, but not discussed there):

    struct xen_linux_register_memory {
        uint64_t pointer;
        uint64_t size;
        uint64_t gpa;
        uint32_t id;
        uint32_t guest_domid;
    };
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--0xB0yhqWj3EK5xsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmZrPbYACgkQsoi1X/+c
IsEM+hAAsL7zoAFjhARxX0DWluGmir2SX3Q8fdbxBy/O0kT72u1kUhsnk1IFs1TQ
bFWJLywYbMsYT6UJQjlH/zGdU9vE4jpsWiwbj8b/wd9oRPsxktHo3aGD/nNxRouE
5MCOQB+S+1Vng7JQU8ESdIxiUzwwCNfwxGalmfCTbMDJ5BBHXe7x3Egh5Ni1yENz
aP5QFYd2LBjLA1iCYIq6PDGewrdIKSfOU3SZ17sfrqhpwNLOd5y5PQKhGoRDpwwp
gzEkPvVj7dX4nMTHRr9QaAa42awq7dGNh7fQ3jtJ8DeUkk2kSgKzDFkH5D96ytn9
ntLlPl7ROWsXq0hNpt6LwR2GTiE4LMtiE2eexXg7ZckXEtSo1HZ379v/dAe/ZBhp
2/Y+UsZ0rDGnesPHv9eIPeLPLcg8+ZUatDB3/SjZWygMzeFr++VwBAMjhqZv1V1j
mfWZ+QJ1/wGq8bEir53SjAkRzfmBk7g8W/7rRrhiI8DufubgrhO5U5MOXuLnfzH/
l33aBquc1sII4JxbDnA1bFOGHuFaiVEA+scJT3l9gAgN+Vkk1NVVrCvGkZSugMxb
oaxWr3I2PG9lekRDMq5/3DYP3XHdUDZuoAZlXegtM38Z8uOclBj5jc0XbTFCsSN7
19FU2IfQPmX+ZjiMcQMNv2OOH66dySFwatW01xZH45Ovdi8qRBw=
=1fuv
-----END PGP SIGNATURE-----

--0xB0yhqWj3EK5xsf--

