Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AFCAD7E42
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 00:12:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013610.1391988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPq9S-0002nS-Jb; Thu, 12 Jun 2025 22:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013610.1391988; Thu, 12 Jun 2025 22:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPq9S-0002kp-Gf; Thu, 12 Jun 2025 22:12:02 +0000
Received: by outflank-mailman (input) for mailman id 1013610;
 Thu, 12 Jun 2025 22:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4xt=Y3=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uPq9R-0002ki-1v
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 22:12:01 +0000
Received: from 16.mo550.mail-out.ovh.net (16.mo550.mail-out.ovh.net
 [178.33.104.224]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4118bb2a-47da-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 00:11:57 +0200 (CEST)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.17.189])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bJGwD5VjQz1VMt
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 22:11:56 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-7wmqs (unknown [10.108.54.10])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 15419C0240;
 Thu, 12 Jun 2025 22:11:54 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-5b5ff79f4f-7wmqs with ESMTPSA
 id bYetLqpQS2gewwQA6EkgDQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Thu, 12 Jun 2025 22:11:54 +0000
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
X-Inumbo-ID: 4118bb2a-47da-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-99G003dc92a0d6-1ece-43c2-8554-779af2054e88,
                    8533DEE15F76005A048BC18D4BF0E94304C9A0EA) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Fri, 13 Jun 2025 01:11:30 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	trenchboot-devel@googlegroups.com, ross.philipson@oracle.com
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
Message-ID: <aEtQkuVMxcoVv2Pu@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5792bec7-cd2f-4d27-aa3b-f417b07c8ea8@oracle.com>
 <aEn_3U3YxdeUXC6p@MjU3Nj>
 <031338df-8f6b-4c6f-86b9-aa0b7c808bfc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031338df-8f6b-4c6f-86b9-aa0b7c808bfc@suse.com>
X-Ovh-Tracer-Id: 5813021220693914839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdduiedvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehhedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=zrzcCC97woji16ezpz8QjrgMhuztpT+CBf4oVh4wvkc=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1749766316; v=1;
 b=HeMSb2O18I+C8b1Cluqh/ZK+TKXlhE7IMHhXCS1g6Xd6kaBDVqAPo5L3qkH+gHbw9e9RBAlw
 htcmzTtMKbFgq3lQiEzv7nW79qVBDmxmRryN4LbW7Ydz0MNBcyIkxKPcPiM4/PfQ31uw4Jaji87
 bOF9pe8fYqnEmkF+9K+PDQt53lbPiHReYIPcliRqLCCEBrwJRA/3Y4jC2ZB2aujy88ID/GS8FZs
 CVvLKcMLe4moAJCe0MduKhxAbTtHyRQsiLtyzkGpmfc74YOqBpn9KRrLh4r3+0hs3l7Esp3kWZP
 x75eB4tfmUD456pqL6vC6p0mn8uQSwwecEIdjNUeQ00+w==

On Thu, Jun 12, 2025 at 10:02:33AM +0200, Jan Beulich wrote:
> On 12.06.2025 00:14, Sergii Dmytruk wrote:
> > On Tue, Jun 03, 2025 at 09:17:29AM -0700, ross.philipson@oracle.com wrote:
> >>> +static inline void *txt_init(void)
> >>> +{
> >>> +    void *txt_heap;
> >>> +
> >>> +    /* Clear the TXT error register for a clean start of the day. */
> >>> +    txt_write(TXTCR_ERRORCODE, 0);
> >>> +
> >>> +    txt_heap = _p(txt_read(TXTCR_HEAP_BASE));
> >>> +
> >>> +    if ( txt_os_mle_data_size(txt_heap) < sizeof(struct txt_os_mle_data) ||
> >>> +         txt_os_sinit_data_size(txt_heap) < sizeof(struct txt_os_sinit_data) )
> >>> +        txt_reset(SLAUNCH_ERROR_GENERIC);
> >>
> >> I know the list of error codes pulled in are from the patches for Linux
> >> Secure Launch which seems right. The Xen work is free to add more specific
> >> error codes e.g. somewhere like here. We could even consider using regions
> >> in the vendor error code space for different things like generic errors vs
> >> architecture specific ones vs etc.
> >
> > I think some codes were already added and this is the only place where
> > SLAUNCH_ERROR_GENERIC is used, not really sure why, will add a couple
> > more.  By the way, the new errors were inserted in the middle making
> > about half of the errors out of sync with Linux, should Xen and Linux be
> > in sync?
>
> As the uses isolated to Xen and Linux respectively, or are the values
> propagated between the two in some way? In the former case there's no
> need for them to stay in sync, I think. Whereas in the latter case them
> staying in sync would want enforcing somehow, if at all possible.
>
> Jan

The uses are independent, the error list was copied probably because
error conditions are similar.  I'll remove errors unused in Xen.

Regards

