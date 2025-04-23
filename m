Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DDA99B06
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:53:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965565.1356093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7i1u-0006yM-44; Wed, 23 Apr 2025 21:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965565.1356093; Wed, 23 Apr 2025 21:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7i1u-0006w0-17; Wed, 23 Apr 2025 21:53:18 +0000
Received: by outflank-mailman (input) for mailman id 965565;
 Wed, 23 Apr 2025 21:53:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oonq=XJ=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7i1r-0006uX-O6
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:53:16 +0000
Received: from 17.mo582.mail-out.ovh.net (17.mo582.mail-out.ovh.net
 [46.105.36.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b35ad35-208d-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:53:14 +0200 (CEST)
Received: from director6.ghost.mail-out.ovh.net (unknown [10.108.9.3])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4ZjXsj56X6z1SMh
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 21:53:13 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-jxcsh (unknown [10.110.188.95])
 by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 03C851FD68;
 Wed, 23 Apr 2025 21:53:11 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-jxcsh with ESMTPSA
 id /6ebMUdhCWhq4jwAs7p+7Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 23 Apr 2025 21:53:11 +0000
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
X-Inumbo-ID: 5b35ad35-208d-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-113S00744fc18b7-f4d7-4280-9c1d-f8d924156787,
                    E44920665798B4DCDE3BF656E3E0060933CCD35A) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Thu, 24 Apr 2025 00:53:02 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?iso-8859-1?Q?M=F3wka?= <mateusz.mowka@intel.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH 00/21] x86: Trenchboot Secure Launch DRTM (Xen)
Message-ID: <aAlhPtx8sBvmF5mh@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
 <aAk1ZBw8GtoVYoL8@MjU3Nj>
 <a48a0c03f151d960254c65f538141836@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a48a0c03f151d960254c65f538141836@bugseng.com>
X-Ovh-Tracer-Id: 7010134298581251228
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejjeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepuedutdeltdffteffleeuudeltedvgfevuefhvdelhfefheetgeejfeeuudeiveefnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdptghirhhruhhsqdgtihdrtghomhdpvggtlhgrihhrihhtrdgtohhmnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekvdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=hSvZRkGXTwkcu/KgjQBwQniw1dbYtkxOZZKiTDVmfZo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745445193; v=1;
 b=EGy3GNZE/pt5/rMuHs6wQjX6KYFgNXm0TmD+5QqGyQSxojjE653ludAeMYNJoF5+OH99Bwtu
 MdL8f1zl/38VbbGUb/nS9f/hBhIqOhas07XYjtoMrb5m7v9Dd0dBC3DvXkEZNmyZVYVAC2b6KcD
 kiVJeDQx+rF0fYt/F6mUiqpUuP88OlxhNC8NAUpNY2GX15aS/wdtRXj1dgn4l/+rUiHpkKZaNA0
 PJZUqldAcGEaK4ZOIzU+4tPvN+AHwYRnjYkmSZe2gaxb6Qa7APy5vobzNVqQmRSQh3MdarKTgPe
 +f6TXYJxv97FOx8WEaACrr8UE5bmQStiWThHUIGxaRGrQ==

On Wed, Apr 23, 2025 at 10:11:35PM +0200, Nicola Vetrini wrote:
> On 2025-04-23 20:45, Sergii Dmytruk wrote:
> > On Wed, Apr 23, 2025 at 02:38:37PM +0100, Andrew Cooper wrote:
> > > On 22/04/2025 6:14 pm, Andrew Cooper wrote:
> > > > I've stripped out the sha2 patch and fixed up to use the existing sha2,
> > > > then kicked off some CI testing:
> > > >
> > > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> > > > https://cirrus-ci.com/build/5452335868018688
> > > >
> > > > When the dust has settled, I'll talk you through the failures.
> > >
> > > And here we go.  Interestingly, the FreeBSD testing was entirely
> > > happy,
> > > and that is the rare way around.
> > >
> > > For Gitlab, there are several areas.
> > >
> > > First, for MISRA.  In the job logs, you want the "Browse current
> > > reports:" link which will give you full details, but it's all pretty
> > > simple stuff.
> >
> > Thanks, but that link gives me a list of 5096 failures all over the code
> > base.  Is there any way to see a diff against master?
> >
>
> Hi,
>
> yes, you can define selections of violations introduced on previously clean
> guidelines by clicking on the "ECLAIR" button on the upper right. See [1]
> which is the result of defining the "clean_added" selection shown in the
> attached screenshot. If you have other questions please let me know.

Hi,

not sure why, but using "added" left 4861 violations.  Picking `_NO_TAG`
instead seemingly left only new violations.  Maybe that's something
specific to this particular run.  Either way, I can go through the list
now and know how to adjust it.  Thank you for the instructions.

> Thanks,
>  Nicola
>
> [1] https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/tb-v1.1/ARM64/9791028027/PROJECT.ecd;/by_service.html#service&kind{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":1,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"clean","inputs":[{"enabled":true,"text":"added"}]}]}}}

