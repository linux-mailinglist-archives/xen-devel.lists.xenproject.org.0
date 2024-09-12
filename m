Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997319765DC
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 11:40:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797161.1207002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogJ6-0003iI-E5; Thu, 12 Sep 2024 09:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797161.1207002; Thu, 12 Sep 2024 09:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sogJ6-0003gA-AD; Thu, 12 Sep 2024 09:40:08 +0000
Received: by outflank-mailman (input) for mailman id 797161;
 Thu, 12 Sep 2024 09:40:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xcg7=QK=bounce.vates.tech=bounce-md_30504962.66e2b6f4.v1-4359a728a4ed495d9f170988bfe90f58@srs-se1.protection.inumbo.net>)
 id 1sogJ5-0003fo-DB
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 09:40:07 +0000
Received: from mail145-28.atl61.mandrillapp.com
 (mail145-28.atl61.mandrillapp.com [198.2.145.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd317d72-70ea-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 11:40:05 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-28.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4X4C8h0wXPzKsbJG2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 09:40:04 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4359a728a4ed495d9f170988bfe90f58; Thu, 12 Sep 2024 09:40:04 +0000
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
X-Inumbo-ID: fd317d72-70ea-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1726134004; x=1726394504;
	bh=VbTlPe2QjU1eQx5/XweniK9kMdIBCIAx30cTEfDaatA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d9HQpkiSuJd+DIpgOp1axUYTfQJZD5uuzmweioxN0Z3CE6v6JCyb8DLMjWeOdMHNB
	 tZJBDYf/zZCk+k7dUVsSlzsMsyFtVe7xYJ8skHgJzZzCanvyO9nxClbk6H2RekhlWz
	 XpAqzwFkBNnnLM6RNOVaEoMGYEcGHE0B9BOdf26oSCucIJvUSbk5pCldLEXOu7fk32
	 wDDMbF+Wvx0FthgAo3ZCscqVzwI+DvGHtb1sSX/tVe3xEuy4oOeI3bJhAX5yz0aZ9f
	 CnMRRxg5IbEGsnGnKwoCB8/IBBoZ541LDcZ3pzhIEuMpwrxnq2mo9VKXKhBX43Pjn6
	 kN24iq1b1o3Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1726134004; x=1726394504; i=anthony.perard@vates.tech;
	bh=VbTlPe2QjU1eQx5/XweniK9kMdIBCIAx30cTEfDaatA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JjZGfnqSJtWOtnKsNbBlPZSsTh/AGNfnHJuLTzs3uRJQLIK/WFaylm2J5Bs1j4SJo
	 +JUoKLkLCojdSlqgqFL7qyyPKpb4fx19a+9o5mqcVAZeTLWUuwhAPEmlzd2aLI+veF
	 UbDQfc+ezc/FiXxW4Hw4MeUcIVMxS1OqtXGQareYLaPuRf9+pCTMu3R7gDFSO9PY7l
	 yjmPGVepRoEnpj1K7n6/q/td3Vn/ocm5ok5e1yKGxP4tA6TKP14v6zKDPiFUu8GvTo
	 jcheuQnNIpgEIosqPkCSduJUW5hz39Uk6iFi43kbmYWOdNTE/McRhN7xZ2unWp9LYf
	 Uah19FIQapadg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20blkif:=20reconcile=20protocol=20specification=20with=20in-use=20implementations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1726134002620
To: =?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZuK28S2Z4za9ZbsB@l14>
References: <20240910114604.13194-1-roger.pau@citrix.com> <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com> <ZuBQpkcutUgFxfnd@macbook.local> <22b48f13-8a5d-4005-aaec-32a76279bf2c@suse.com>
In-Reply-To: <22b48f13-8a5d-4005-aaec-32a76279bf2c@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4359a728a4ed495d9f170988bfe90f58?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240912:md
Date: Thu, 12 Sep 2024 09:40:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 10, 2024 at 04:01:50PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 10.09.24 15:59, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Sep 10, 2024 at 03:46:00PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 10.09.24 13:46, Roger Pau Monne wrote:
> > > > diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/=
blkif.h
> > > > index 22f1eef0c0ca..da893eb379db 100644
> > > > --- a/xen/include/public/io/blkif.h
> > > > +++ b/xen/include/public/io/blkif.h
> > > > @@ -237,12 +237,16 @@
> > > >     * sector-size
> > > >     *      Values:         <uint32_t>
> > > >     *
> > > > - *      The logical block size, in bytes, of the underlying storag=
e. This
> > > > - *      must be a power of two with a minimum value of 512.
> > > > + *      The logical block size, in bytes, of the underlying storag=
e. This must
> > > > + *      be a power of two with a minimum value of 512.  The sector=
 size should
> > > > + *      only be used for request segment length and alignment.
> > > >     *
> > > > - *      NOTE: Because of implementation bugs in some frontends thi=
s must be
> > > > - *            set to 512, unless the frontend advertizes a non-zer=
o value
> > > > - *            in its "feature-large-sector-size" xenbus node. (See=
 below).
> > > > + *      When exposing a device that uses 4096 logical sector sizes=
, the only
> > > 
> > > s/uses 4096 logical sector sizes/uses a logical sector size of 4096/
> > 
> > Yes, that's better.
> > 
> > > > + *      difference xenstore wise will be that 'sector-size' (and p=
ossibly
> > > > + *      'physical-sector-size' if supported by the backend) will b=
e 4096, but
> > > > + *      the 'sectors' node will still be calculated using 512 byte=
 units.  The
> > > > + *      sector base units in the ring requests fields will all be =
512 byte
> > > > + *      based despite the logical sector size exposed in 'sector-s=
ize'.
> > > >     *
> > > >     * physical-sector-size
> > > >     *      Values:         <uint32_t>
> > > > @@ -254,8 +258,8 @@
> > > >     * sectors
> > > >     *      Values:         <uint64_t>
> > > >     *
> > > > - *      The size of the backend device, expressed in units of "sec=
tor-size".
> > > > - *      The product of "sector-size" and "sectors" must also be an=
 integer
> > > > + *      The size of the backend device, expressed in units of 512b=
.
> > > > + *      The product of "sector-size" * 512 must also be an integer
> > > 
> > > DYM: The product of "sectors" * 512 must also be an integer ... ?
> > 
> > Indeed.
> 
> With those 2 changes applied you can add my:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


