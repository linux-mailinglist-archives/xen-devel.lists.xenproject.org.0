Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E142C7D1FD
	for <lists+xen-devel@lfdr.de>; Sat, 22 Nov 2025 14:59:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1169774.1495181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMo8P-0007uy-5r; Sat, 22 Nov 2025 13:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1169774.1495181; Sat, 22 Nov 2025 13:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMo8P-0007sg-2d; Sat, 22 Nov 2025 13:58:41 +0000
Received: by outflank-mailman (input) for mailman id 1169774;
 Sat, 22 Nov 2025 13:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1jDc=56=treblig.org=dg@srs-se1.protection.inumbo.net>)
 id 1vMo8O-0007sa-8z
 for xen-devel@lists.xenproject.org; Sat, 22 Nov 2025 13:58:40 +0000
Received: from mx.treblig.org (mx.treblig.org [2a00:1098:5b::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57b82732-c7ab-11f0-9d18-b5c5bf9af7f9;
 Sat, 22 Nov 2025 14:58:38 +0100 (CET)
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
 (envelope-from <dg@treblig.org>) id 1vMo83-00000005wUV-2FTG;
 Sat, 22 Nov 2025 13:58:19 +0000
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
X-Inumbo-ID: 57b82732-c7ab-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=AEXZEuTJIE85z2nUo6vGRF6C9CDHEnZEtlKMj8CbeT4=; b=boN+E0WV5PWDs4yp
	E5QiNikBwzcKxOr9y3ErKBosKi8VqQlyUK8FcpSwKZRZIklWGivPv0b8RSW0Md0mlLqwACbhBB1vJ
	2xtO1APz5QqCPj2IB1son8z6yI2JWKjc/YisVf8Akz0AYURhVUPEbxbNHOCoqog6ksbOEZ8nbt3AA
	M8nUp+/I6opgxD3kBK/3L9z07BOWIsUllEtVyMmhMVILtJ3RsJeXEUUUC+EDFUwvaSRJ+Fe7/WWD/
	ixd0MwL2lJiyApfAIlZlIVvw0uVu6nd+S9a1CmPOP6ZRlcoooeZB+4RWIRymF57ys85smCTeDjJKH
	Z3Kd2MYnSTr6//8Edg==;
Date: Sat, 22 Nov 2025 13:58:19 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	arei.gonglei@huawei.com, pizhenwei@bytedance.com,
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
Message-ID: <aSHBez6kYRagEL1K@gallifrey>
References: <20251120191339.756429-1-armbru@redhat.com>
 <20251120191339.756429-10-armbru@redhat.com>
 <aR-q2YeegIEPmk2R@gallifrey>
 <87see8q6qm.fsf@pond.sub.org>
 <aSClUIvI2W-PVv6B@gallifrey>
 <87ecpqtt6f.fsf@pond.sub.org>
 <05ef43e5-cc42-8e1c-2619-eb1dea12b02b@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <05ef43e5-cc42-8e1c-2619-eb1dea12b02b@eik.bme.hu>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 13:56:00 up 26 days, 13:32,  2 users,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)

* BALATON Zoltan (balaton@eik.bme.hu) wrote:
> On Sat, 22 Nov 2025, Markus Armbruster wrote:
> > "Dr. David Alan Gilbert" <dave@treblig.org> writes:
> > 
> > > * Markus Armbruster (armbru@redhat.com) wrote:
> > > > "Dr. David Alan Gilbert" <dave@treblig.org> writes:
> > > > 
> > > > > * Markus Armbruster (armbru@redhat.com) wrote:
> > > > > > Replace
> > > > > > 
> > > > > >     error_setg_errno(errp, errno, MSG, FNAME);
> > > > > > 
> > > > > > by
> > > > > > 
> > > > > >     error_setg_file_open(errp, errno, FNAME);
> > > > > > 
> > > > > > where MSG is "Could not open '%s'" or similar.
> > > > > > 
> > > > > > Also replace equivalent uses of error_setg().
> > > > > > 
> > > > > > A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
> > > > > > We could put them back with error_prepend().  Not worth the bother.
> > > > > 
> > > > > Yeh, I guess you could just do it with another macro using
> > > > > the same internal function just with string concatenation.
> > > > 
> > > > I'm no fan of such prefixes.  A sign of developers not caring enough to
> > > > craft a good error message for *users*.  *Especially* in the case of
> > > > __func__.
> > > > 
> > > > The error messages changes in question are:
> > > > 
> > > >     net dump: can't open DUMP-FILE: REASON
> > > >     Could not open 'DUMP-FILE': REASON
> > > > 
> > > >     SEV: Failed to open SEV-DEVICE: REASON
> > > >     Could not open 'SEV-DEVICE': REASON
> > > > 
> > > >     sev_common_kvm_init: Failed to open SEV_DEVICE 'REASON'
> > > >     Could not open 'SEV-DEVICE': REASON
> > > > 
> > > > I think these are all improvements, and the loss of the prefix is fine.
> > > 
> > > Yeh, although I find the error messages aren't just for users;
> > > they're often for the first dev to see it to guess which other
> > > dev to pass the problem to, so a hint about where it's coming
> > > from can be useful.
> > 
> > I agree!  But I think an error message must be make sense to users
> > *first* and help developers second, and once they make sense to users,
> > they're often good enough for developers.
> > 
> > The common failures I see happen when developers remain caught in the
> > developer's perspective, and write something that makes sense to *them*.
> > Strawman form:
> > 
> >    prefix: failed op[: reason]
> > 
> > where "prefix" is a subsystem tag, or even __func__, and "reason" is
> > strerror() or similar.
> > 
> > To users, this tends to read as
> > 
> >    gobbledygook: techbabble[: reason]
> > 
> > When we care to replace "failed op" (developer's perspective) by
> > something that actually makes sense to users, "prefix" often becomes
> > redundant.
> > 
> > The error messages shown above aren't bad to begin with.  "failed to
> > open FILE", where FILE is something the user specified, should make
> > sense to the user.  It should also be good enough for developers even
> > without a prefix: connecting trouble with the DUMP-FILE to dump /
> > trouble with the SEV-DEVICE to SEV should be straightforward.
> > 
> > [...]
> 
> I think that
> 
> net dump: can't open random-filename: because of some error
> 
> shows better where to look for the problem than just
> 
> Could not open 'random-filename': because of some error
> 
> as the latter does not tell where the file name comes from or what is it. It
> could be added by a management application or added by the users randomly
> without really knowing what they are doing so repeating the option or part
> in the message that the error comes from can help to find out where to
> correct it. Otherwise it might be difficult to guess what random-filename is
> related to if it's not named something you'd expect.

Yeh agreed.  It very much depends if you think of a 'user' as the person
who typed a qemu command line, or pressed a button on a GUI that triggered
15 levels of abstraction that eventually ran a qemu.

Or for the support person who has a customer saying 'help I've got this error',
and now needs to route it to the network person rather than something else.

Dave

> Regards,
> BALATON Zoltan
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

