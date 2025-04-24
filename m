Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08B9A9B609
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 20:15:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966781.1356889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u815h-00061z-MV; Thu, 24 Apr 2025 18:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966781.1356889; Thu, 24 Apr 2025 18:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u815h-0005yr-JK; Thu, 24 Apr 2025 18:14:29 +0000
Received: by outflank-mailman (input) for mailman id 966781;
 Thu, 24 Apr 2025 18:14:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8hq=XK=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u815f-0005yl-W1
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 18:14:28 +0000
Received: from 7.mo582.mail-out.ovh.net (7.mo582.mail-out.ovh.net
 [46.105.59.196]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f38ac5ff-2137-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 20:14:24 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.108.25.156])
 by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4Zk3yl6HhZz1TgP
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 18:14:23 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-zrnsh (unknown [10.111.174.174])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 39C541FE87;
 Thu, 24 Apr 2025 18:14:21 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-zrnsh with ESMTPSA
 id vcS3M3x/CmgQKQAADFPD6Q
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 24 Apr 2025 18:14:21 +0000
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
X-Inumbo-ID: f38ac5ff-2137-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-99G003a321d7d8-e962-4723-8755-cd239566492b,
                    6AF2A11B8D4EBDE9D9447A7514DB0FF9F8FB9007) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
Date: Thu, 24 Apr 2025 21:14:11 +0300
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
Message-ID: <aAp_c7m7DBLwqjwP@MjU3Nj>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
 <744934f4-f56f-4dc7-bccb-c32f2829d1da@citrix.com>
 <010709d8-7784-41bf-bcb6-bf04803a75fc@citrix.com>
 <aAk1ZBw8GtoVYoL8@MjU3Nj>
 <a48a0c03f151d960254c65f538141836@bugseng.com>
 <aAlhPtx8sBvmF5mh@MjU3Nj>
 <c79a4654-50d7-44f6-94b1-5a8f3fbe9b84@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c79a4654-50d7-44f6-94b1-5a8f3fbe9b84@bugseng.com>
X-Ovh-Tracer-Id: 9187061767043200156
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepuedutdeltdffteffleeuudeltedvgfevuefhvdelhfefheetgeejfeeuudeiveefnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdptghirhhruhhsqdgtihdrtghomhdpvggtlhgrihhrihhtrdgtohhmnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedvmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=9IPkYx3xfLze8zi0+PWUiBKEarN11QDto97JLIYYcss=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745518463; v=1;
 b=Iq9BQmv+CxuEw2iKDVYYUa7yPeI9zjd3P/X9BOSrNChvBPW7yzmRBVEF6t/Y5fUMOCnXi64H
 //ZxbJx7ILLzLFLnhITsXhKbYjtyZhRVpKo9aDgxIuyzKRL6vlYVHoIUPMnqhYXxYVYpxxO7coe
 FtPCzABHwE+ZugbowMHEYGEohV4ab8frhKeQlENPAL8WXRWUXwcEtP/WgQCFhOvP6HllfyHJGLa
 /okZljeFfyzCBAEcqpZEyUAH2ekcMG2fq5S0f2E37jfUUUMRJk7D1xasIzZhNTBc8BdhouvXN24
 UURkp1FKO/CrJXLrkzZ9x9sLEgkOta3oPU6U5UioOBCpg==

On Thu, Apr 24, 2025 at 12:54:41PM +0200, Nicola Vetrini wrote:
>
> On 4/23/25 23:53, Sergii Dmytruk wrote:
> > On Wed, Apr 23, 2025 at 10:11:35PM +0200, Nicola Vetrini wrote:
> > > On 2025-04-23 20:45, Sergii Dmytruk wrote:
> > > > On Wed, Apr 23, 2025 at 02:38:37PM +0100, Andrew Cooper wrote:
> > > > > On 22/04/2025 6:14 pm, Andrew Cooper wrote:
> > > > > > I've stripped out the sha2 patch and fixed up to use the existing sha2,
> > > > > > then kicked off some CI testing:
> > > > > >
> > > > > > https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1780285393
> > > > > > https://cirrus-ci.com/build/5452335868018688
> > > > > >
> > > > > > When the dust has settled, I'll talk you through the failures.
> > > > > And here we go.  Interestingly, the FreeBSD testing was entirely
> > > > > happy,
> > > > > and that is the rare way around.
> > > > >
> > > > > For Gitlab, there are several areas.
> > > > >
> > > > > First, for MISRA.  In the job logs, you want the "Browse current
> > > > > reports:" link which will give you full details, but it's all pretty
> > > > > simple stuff.
> > > > Thanks, but that link gives me a list of 5096 failures all over the code
> > > > base.  Is there any way to see a diff against master?
> > > >
> > > Hi,
> > >
> > > yes, you can define selections of violations introduced on previously clean
> > > guidelines by clicking on the "ECLAIR" button on the upper right. See [1]
> > > which is the result of defining the "clean_added" selection shown in the
> > > attached screenshot. If you have other questions please let me know.
> > Hi,
> >
> > not sure why, but using "added" left 4861 violations.  Picking `_NO_TAG`
> > instead seemingly left only new violations.  Maybe that's something
> > specific to this particular run.  Either way, I can go through the list
> > now and know how to adjust it.  Thank you for the instructions.
> >
> I'm not sure I fully understand this. This is what I see on x86: the ones
> still shown are those rules where the CI is blocking and new issues have
> been introduced by that pipeline run (of course a different pipeline may
> yield different results). Only new violations are blocking, so that is why I
> filtered out the rest in this case.

My bad, I still had "Hide" instead of "Show" in the selection.  Other
comboboxes are also hard to see but I wasn't even looking for one in
the title.  Thanks again.

> > > Thanks,
> > >   Nicola
> > >
> > > [1] https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/hardware/xen-staging/ECLAIR_normal/andrew/tb-v1.1/ARM64/9791028027/PROJECT.ecd;/by_service.html#service&kind{"select":true,"selection":{"hiddenAreaKinds":[],"hiddenSubareaKinds":[],"show":true,"selector":{"enabled":true,"negated":false,"kind":1,"children":[{"enabled":true,"negated":false,"kind":0,"domain":"clean","inputs":[{"enabled":true,"text":"added"}]}]}}}


