Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7003A5F068
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 11:16:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911813.1318209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfcH-0002Ig-OE; Thu, 13 Mar 2025 10:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911813.1318209; Thu, 13 Mar 2025 10:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsfcH-0002H2-LS; Thu, 13 Mar 2025 10:16:41 +0000
Received: by outflank-mailman (input) for mailman id 911813;
 Thu, 13 Mar 2025 10:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VRv=WA=bounce.vates.tech=bounce-md_30504962.67d2b084.v1-d96656fc4bef4c46a67b20849d138f86@srs-se1.protection.inumbo.net>)
 id 1tsfcF-0002Gw-G9
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 10:16:39 +0000
Received: from mail128-10.atl41.mandrillapp.com
 (mail128-10.atl41.mandrillapp.com [198.2.128.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4f883e-fff4-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 11:16:37 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-10.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4ZD3Lr2QTMzLfHTDM
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:16:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d96656fc4bef4c46a67b20849d138f86; Thu, 13 Mar 2025 10:16:36 +0000
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
X-Inumbo-ID: 3f4f883e-fff4-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741860996; x=1742130996;
	bh=9OLHqGV56y1iWNtM4YA49so3Lpe1f8FMl65Ei94dkao=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U/GlslXtcnLPKmODogomWnYEBesd0WJxIzutbah4YoL5jye6COSHUT4fvBAYvoUps
	 2Cgm7omOupCpM6ACz7aGUVHYpaoMevA8uQwY8/Av8oU3YOiDgFlV5m0F6sY0uPOmZJ
	 UFfUHzEf8qyaeL07u4bLq94O7ms9evN0Zif26GwZFtUTeiZ3ITXAgmRNrxOhyPbvUd
	 KNQW1t1Vun1HG1cvDGEohtreGBbOl8JGKaIEAYq0oY3XVd2YwogYIoEZRCH7M/lrYA
	 RFJ90mRZSDdgrO2nUTDP2fWhcJN4JpjaUBivT4iVhUmSIFKJtR6jIvTDPlaW5suJ0z
	 10LXMWXkDid9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741860996; x=1742121496; i=anthony.perard@vates.tech;
	bh=9OLHqGV56y1iWNtM4YA49so3Lpe1f8FMl65Ei94dkao=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=h8tIiW59Z9bTtud3IPzgnD6wwJ+9t6h91BLOq1Ku7qFMuY0gl6kwioh71kph6rdw+
	 aIeFTfPlJYfKBsADH3E3FczYLQYP6nvuVJ7uKF8ivCYwBgOhRF9voNyQMOMOYYb6uq
	 Wzv5NdtJriHrgVcXpMdaNBcSnGHSiw34eoJJrBoWiKfGV0tDrJUajm90V6uTPgCfSa
	 gH6A+Fg/rK6NnMwoT8DrdszmoUnrGLUs5rWAJx4HezgRwDrCcZ1f3SNe13Bxt8JDUt
	 2RCZpdLimGFOUgeOz8Oytvo+nfgsj88QeMt18auR5WPuODbSMIXYLhB7ZEFUZRk+jX
	 YHlzIWTH9WNdA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20docs:=20specify=20numerical=20values=20of=20Xenstore=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741860994568
To: "=?utf-8?Q?J=C3=BCrgen=20Gro=C3=9F?=" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z9Kwgqe9FUgrpSUs@l14>
References: <20250312084143.14045-1-jgross@suse.com> <Z9G6dXyhM01MFD_q@l14> <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com>
In-Reply-To: <ade9e905-f9d5-468c-bad6-acc996378f06@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d96656fc4bef4c46a67b20849d138f86?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250313:md
Date: Thu, 13 Mar 2025 10:16:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 10:51:06AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 12.03.25 17:46, Anthony PERARD wrote:
> > On Wed, Mar 12, 2025 at 09:41:43AM +0100, Juergen Gross wrote:
> > > diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> > > index 7e1f031520..72db73deef 100644
> > > --- a/docs/misc/xenstore.txt
> > > +++ b/docs/misc/xenstore.txt
> > > @@ -86,6 +86,67 @@ parts of xenstore inaccessible to some clients.  I=
n any case passing
> > > +XS_CONTROL               0    optional
> > > +    If not supported, xenstore-control command will not work.
> > > +    XS_DEBUG is a deprecated alias of XS_CONTROL.
> > > +XS_DIRECTORY             1
> > > +XS_READ                  2
> > > +XS_GET_PERMS             3
> > 
> > This new table prefix message type names with "XS_", but the rest of th=
e
> > document describe each type without the prefix. Isn't it going to be
> > confusing, and make it slightly harder to link this table to rest of th=
e
> > document? (I often search by full word, like '\<GET_PERMS\>', because
> > that one key stroke in vim '*', so having different prefix makes it
> > harder to search)
> 
> Question is, should I change the table to drop "XS_", or the rest documen=
t
> to add "XS_" instead? After all xs_wire.h is defining the names with "XS_=
".
> 
> I'm slightly leaning towards a preparatory patch adding "XS_".

Well, I'm actually for dropping the prefix from the table. The prefix is
more of a C specific namespace than anything else. The ocaml
implementation in tree doesn't use this prefix, but a different one (if
we ignore the different case:
> Xenbus.Xb.Op.Watch
https://elixir.bootlin.com/xen/v4.20.0/source/tools/ocaml/xenstored/process=
.ml#L632
And have a link to a string without the prefix:
> | Watch=09=09=09-> "WATCH"
https://elixir.bootlin.com/xen/v4.20.0/source/tools/ocaml/libs/xb/op.ml#L49

There's also a version in Rust which also use a different prefix,
"XsMessageType::".
https://github.com/Wenzel/xenstore/blob/f82bd45cbcd1aa98306c57d35847e3d77f7=
cc8ee/src/wire.rs#L55

So the prefix is really programming language specific and I don't think
introducing it to this document would be useful.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


