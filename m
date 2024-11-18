Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD649D10EC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 13:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839354.1255162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD1BE-0000aD-Jn; Mon, 18 Nov 2024 12:48:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839354.1255162; Mon, 18 Nov 2024 12:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD1BE-0000YP-Ge; Mon, 18 Nov 2024 12:48:36 +0000
Received: by outflank-mailman (input) for mailman id 839354;
 Mon, 18 Nov 2024 12:48:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaFt=SN=bounce.vates.tech=bounce-md_30504962.673b3799.v1-98e9700a6e124f5fb03d5735e3097f68@srs-se1.protection.inumbo.net>)
 id 1tD1BC-0000YJ-H5
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 12:48:34 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6717950c-a5ab-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 13:48:26 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4XsS951wqLz3sP85g
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2024 12:48:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 98e9700a6e124f5fb03d5735e3097f68; Mon, 18 Nov 2024 12:48:25 +0000
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
X-Inumbo-ID: 6717950c-a5ab-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjY3MTc5NTBjLWE1YWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTM0MTA2Ljk0OTQ2OCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2IzNzk5LnYxLTk4ZTk3MDBhNmUxMjRmNWZiMDNkNTczNWUzMDk3ZjY4QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731934105; x=1732194605;
	bh=8vYYwPVnYrqp1IvllwtQwcL4cuHYAA14DbeNu4DeYkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Vbq3O+GFsLH4Q5/LG2GhRcK3/G7GKc2m7HnQ5TY8K6Ibf3KTSGCgovXIOjPqlJUeq
	 DtC8OHiXUgiQAOGUK3b8s2IfMls43c56L8PT4142OTdVK14KPB8C1jrxKFBc8NEO56
	 SB0Iiq7nYSYVHYr/rURSnzh0UZPmj++ISSJGdvptk+jvoinn3auspDKF9yfuVoyBb/
	 gZXS1U5sDV+ImhopPZ6m7LX7oP9pW/IctdFG9L0FfvOoPdInGjXgVGxoggy2gYmOol
	 /ve3/3uRx5lJxR+VJwKKOeqsvQxRZDlsfhlIdRoxZ+oKr7Nv1fAz1ZExuK6bq9Wkwx
	 Q29Nom7amSMug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731934105; x=1732194605; i=anthony.perard@vates.tech;
	bh=8vYYwPVnYrqp1IvllwtQwcL4cuHYAA14DbeNu4DeYkI=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RtdWHgAEpvq5/Ix432dn4olIFms1iyxqOIkipuw7KQltbb47B0cmxlO0dYe2ng4IQ
	 xI/nEOKGKXR8oxtiJAroIpaWO6r6rMJYWGnvNrm5wMucXrBxYeuOSn7/XxsK68B2Zq
	 3s9qrwZw5RlTd8iBDzq5xeFGg7OFpeb+Lym53oAW694fjZcbmPE0aHax/5e6pC3T/u
	 +pKJf5t7WGA6Qns/AUhs+IVpIl/dcAJFQgvhNoNt+L4HX91K3TBkgWsyRAKBN9aXmq
	 uH2jawwbZCOf8vWMHvNdiAYSp55slVkw9T4poSE9f9TblH4OliOwYxv/A9ZlG2I27x
	 V5a/csvoBvtUw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=200/3]=20CI:=20Allow=20automatic=20rebuild=20of=20rolling=20release=20containers?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731934104136
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Zzs3l_8qkLWzUzw_@l14>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <6344f8f9-5e02-4018-9646-a2b0734da9a2@citrix.com>
In-Reply-To: <6344f8f9-5e02-4018-9646-a2b0734da9a2@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.98e9700a6e124f5fb03d5735e3097f68?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241118:md
Date: Mon, 18 Nov 2024 12:48:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 05:13:13PM +0000, Andrew Cooper wrote:
> On 15/11/2024 5:07 pm, Anthony PERARD wrote:
> > Patch series available in this git branch:
> > https://xenbits.xenproject.org/git-http/people/aperard/xen-unstable.git=
 br.gitlab-ci-rebuild-arch-container-v1
> >
> > Hi,
> >
> > This patch series would allow to setup a scheduled pipeline on GitLab w=
hich
> > would rebuild containers and run a test on them immediately (the contai=
ner is
> > updated even if the test fail, but at least we can find out about it so=
oner
> > rather than later).
> >
> > To enable this, just running a pipeline with XEN_CI_REBUILD_CONTAINERS=
=3D1 will
> > do.
> >
> > I intend to add a scheduled pipeline to run once a month.
> 
> Oh excellent.=C2=A0 Thanks for looking into this.
> 
> One thing I was going to look into doing was to push the new containers
> to a temporary repository (or a temp name in the main repository), kick
> off a regular pipeline overriding image:, and on success doing a rename.
> 
> That would avoid pushing a container with problems into main CI.

I tried something like that before, but I probably didn't approch the
problem from the right angle:

    [RFC XEN PATCH 0/7] automation, RFC prototype, Have GitLab CI built its=
 own containers
    https://lore.kernel.org/xen-devel/20230302175332.56052-1-anthony.perard=
@citrix.com/#r

I was trying to automatically rebuild container whose Dockerfile had
changed, while also having logic to rebuild containers based on
rolling-release distributions. But I did end-up duplicating
"build.yaml".

There's logic in that old series to test a container before "renaming
it" (which involve pulling then pushing the container with a new tag)

With this new series, I've introduced XEN_REGISTRY, so we could schedule
a pipeline by setting XEN_REGISTRY variable to a staging area, and
finish the pipeline by pushing to the main location.

But, the two containers been updated in this series are used in jobs
that are allowed to fail, so updating them don't have any consequence.
Also, there's no value in keeping to test with outdated container as
that mean we test with an environment that doesn't exist anymore.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


