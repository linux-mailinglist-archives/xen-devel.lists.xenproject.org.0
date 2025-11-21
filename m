Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CCC7B1DE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Nov 2025 18:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169380.1495126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMVD5-0002iD-UC; Fri, 21 Nov 2025 17:46:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169380.1495126; Fri, 21 Nov 2025 17:46:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMVD5-0002g3-R4; Fri, 21 Nov 2025 17:46:15 +0000
Received: by outflank-mailman (input) for mailman id 1169380;
 Fri, 21 Nov 2025 17:46:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZKoZ=55=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMVD4-0002fx-49
 for xen-devel@lists.xenproject.org; Fri, 21 Nov 2025 17:46:14 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f525e56b-c701-11f0-980a-7dc792cee155;
 Fri, 21 Nov 2025 18:46:09 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMVCi-00000005pJs-2dXP;
 Fri, 21 Nov 2025 17:45:52 +0000
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
X-Inumbo-ID: f525e56b-c701-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=xZBmjOGSZoa+2aL5x4woIrYjfLg3sU220QEFMHUTJpM=; b=hlMINAeetPLPFGP9
	DCXVzhiePadQthcnxsCXyVmnW6VwsN1f99YyTIMGXBLFzlLAwQCCfRhohhA8JHQw9WopgvmlZSNe9
	ChraoHtEO7/JtJnq3fVoHZSpK0yD4PJlxvZ3fXI/CMaLqwdygqlojLOxzQicqgvH6rEKIaYV5q+dC
	9fF4budUObNUXPneqDI13Oa2zg4oAEkUQwrwYAbtWiuXFycihblAtcYwuw9rIQQxGhcvtCahj4M19
	h+hB/OQXLls/7hLaOzXx6U9CGb2mAaDDOK7VGfvA3Pz2jzo1yj5RRGthzOR1lOLnIa/nKutnvrU+1
	aFYpkjxx4ViSutOaLw==;
Date: Fri, 21 Nov 2025 17:45:52 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, arei.gonglei@huawei.com, pizhenwei@bytedance.com,
	alistair.francis@wdc.com, stefanb@linux.vnet.ibm.com,
	kwolf@redhat.com, hreitz@redhat.com, sw@weilnetz.de,
	qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
	imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
	shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com,
	jag.raman@oracle.com, sgarzare@redhat.com, pbonzini@redhat.com,
	fam@euphon.net, philmd@linaro.org, alex@shazbot.org, clg@redhat.com,
	peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
	jasowang@redhat.com, samuel.thibault@ens-lyon.org,
	michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
	mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
	liwei1518@gmail.com, dbarboza@ventanamicro.com,
	zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
	qemu-block@nongnu.org, qemu-ppc@nongnu.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	qemu-riscv@nongnu.org
Subject: Re: [PATCH 09/14] error: Use error_setg_file_open() for simplicity
 and consistency
Message-ID: <aSClUIvI2W-PVv6B@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-10-armbru@redhat.com>
 <aR-q2YeegIEPmk2R@gallifrey>
 <87see8q6qm.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87see8q6qm.fsf@pond.sub.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 17:44:26 up 25 days, 17:20,  2 users,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* Markus Armbruster (armbru@redhat.com) wrote:
> "Dr. David Alan Gilbert" <dave@treblig.org> writes:
>=20
> > * Markus Armbruster (armbru@redhat.com) wrote:
> >> Replace
> >>=20
> >>     error_setg_errno(errp, errno, MSG, FNAME);
> >>=20
> >> by
> >>=20
> >>     error_setg_file_open(errp, errno, FNAME);
> >>=20
> >> where MSG is "Could not open '%s'" or similar.
> >>=20
> >> Also replace equivalent uses of error_setg().
> >>=20
> >> A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
> >> We could put them back with error_prepend().  Not worth the bother.
> >
> > Yeh, I guess you could just do it with another macro using
> > the same internal function just with string concatenation.
>=20
> I'm no fan of such prefixes.  A sign of developers not caring enough to
> craft a good error message for *users*.  *Especially* in the case of
> __func__.
>=20
> The error messages changes in question are:
>=20
>     net dump: can't open DUMP-FILE: REASON
>     Could not open 'DUMP-FILE': REASON
>=20
>     SEV: Failed to open SEV-DEVICE: REASON
>     Could not open 'SEV-DEVICE': REASON
>=20
>     sev_common_kvm_init: Failed to open SEV_DEVICE 'REASON'
>     Could not open 'SEV-DEVICE': REASON
>=20
> I think these are all improvements, and the loss of the prefix is fine.

Yeh, although I find the error messages aren't just for users;
they're often for the first dev to see it to guess which other
dev to pass the problem to, so a hint about where it's coming
=66rom can be useful.

Dave

> >> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> >
> > Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
>=20
> Thanks!
>=20
--=20
 -----Open up your eyes, open up your mind, open up your code -------  =20
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \=20
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

