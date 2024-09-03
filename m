Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E539699B2
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 12:04:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788917.1198425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQOT-0000Es-TV; Tue, 03 Sep 2024 10:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788917.1198425; Tue, 03 Sep 2024 10:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slQOT-0000Da-QG; Tue, 03 Sep 2024 10:04:13 +0000
Received: by outflank-mailman (input) for mailman id 788917;
 Tue, 03 Sep 2024 10:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dg68=QB=bounce.vates.tech=bounce-md_30504962.66d6df17.v1-cc65731259ce4dcdb66d9d1ad6ebef1b@srs-se1.protection.inumbo.net>)
 id 1slQOR-0000Cj-VI
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 10:04:12 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc1c7e1a-69db-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 12:04:09 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4Wyh6b5WqGzRKLh70
 for <xen-devel@lists.xenproject.org>; Tue,  3 Sep 2024 10:04:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cc65731259ce4dcdb66d9d1ad6ebef1b; Tue, 03 Sep 2024 10:04:07 +0000
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
X-Inumbo-ID: dc1c7e1a-69db-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725357847; x=1725618347;
	bh=9DlAs+eivbH8mpYonrPMWN9M2M+wRA8qsbZyTT4HPSQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PPlBR3ytVn1R+EUilzry4+XYugd+C0n8BE6T0Y/jQJ1NOET40c1KGEkV3D+mkGsBz
	 /tKFvsOyRFD4h3veef8jEoup7tGdsteumlFIPsVEdgrNpiObJP9efJFh5eTtu6krZu
	 2FKFJ2h/Md6QoNWjCztj5b9JiTmqI1tyBg0JfArm0PDs7EAWVA8ps/HmeczzPT8QEs
	 MSpvTvbLa4kXV698rLxZlBW9R69EXbQ4vDJtR6mjd2fn2idkO9NVCjTik+NcGO6cG9
	 7ycv8B+3UG7Y3ma9rExxSyeH27HebJ5UcAN/PLkLhcVSWG/GxLD/1AM7qKBDTNqHig
	 fbusB5tIqYR5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725357847; x=1725618347; i=anthony.perard@vates.tech;
	bh=9DlAs+eivbH8mpYonrPMWN9M2M+wRA8qsbZyTT4HPSQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vrEj+7unRhA3B67UGB8UwMZUGPrVf+vi5/S6YIHGdtXubaqoCic/ddYfGEmm5klpC
	 kUcWbHsodkIVhqMI9OxlIeajkPQ0McG9GWN6QyzHKXmKe5lfE+5hQ5d71DOkBqCj53
	 L4n4Hf51yQ69WRdg2d6Lswe1suTNhCLseCuifju590lQ4jpSEsCQiAr87jOtlxcwK/
	 f4KLvwBSI06g7MSpZB8OF3l4Nmzgcg3VShOxP4bcY27mYse+Y1K/Uz2nVR0d9E1lVa
	 ctL3LflV/5qdxCTeEM++mg/493oWe4qBa91R7XiyyetOzSAnnMt3pWjaWmGj2bPrBc
	 0AYQJ0KvrbECA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20CHANGELOG:=20Update=20after=20fixing=20dm=5Frestrict?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725357846856
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager <community.manager@xenproject.org>, xen-devel@lists.xenproject.org
Message-Id: <ZtbfFlXZVfiMA8Zg@l14>
References: <20240903085311.49818-1-anthony.perard@vates.tech> <d4ed5e07-c938-4d38-a49c-5c451c0c3a89@suse.com>
In-Reply-To: <d4ed5e07-c938-4d38-a49c-5c451c0c3a89@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cc65731259ce4dcdb66d9d1ad6ebef1b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240903:md
Date: Tue, 03 Sep 2024 10:04:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 03, 2024 at 11:20:37AM +0200, Jan Beulich wrote:
> On 03.09.2024 10:54, Anthony PERARD wrote:
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -16,6 +16,10 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >   - On x86:
> >     - Support for running on Xeon Phi processors.
> >  
> > +### Fixed
> > + - Fixed xl/libxl dm\_restrict feature with QEMU 9.0.
> > +
> > +
> >  ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
> >  
> >  ### Changed
> 
> We had no "### Fixed" so far, and I think we also shouldn't gain any. Imo
> this wants expressing in term of "### Changed", also wording the text
> accordingly (needing to adapt to qemu changes isn't a bug fix, strictly
> speaking, but more an enhancement in my view).

From our CHANGELOG.md:
> The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)

following the link, there is:

> Types of changes
> 
> - `Added` for new features.
> - `Changed` for changes in existing functionality.
> - `Deprecated` for soon-to-be removed features.
> - `Removed` for now removed features.
> - `Fixed` for any bug fixes.
> - `Security` in case of vulnerabilities.

So, are we not following keepachangelog.com format? Is there another
document/email/discussion describing which category are allowed?

Been compatible with newer version of dependencies doesn't feels like an
existing functionality have changed. It feels more like a fix to the bug
"can't start guest with newer QEMU".

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

