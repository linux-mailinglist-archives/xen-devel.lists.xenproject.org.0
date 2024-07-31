Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE029431AB
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 16:08:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768796.1179686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zz-0006R6-DF; Wed, 31 Jul 2024 14:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768796.1179686; Wed, 31 Jul 2024 14:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ9zz-0006PU-AF; Wed, 31 Jul 2024 14:08:15 +0000
Received: by outflank-mailman (input) for mailman id 768796;
 Wed, 31 Jul 2024 14:08:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMq9=O7=bounce.vates.tech=bounce-md_30504962.66aa454a.v1-20e20903defe45c494398ed9f0ea75b3@srs-se1.protection.inumbo.net>)
 id 1sZ9zx-000654-PV
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 14:08:13 +0000
Received: from mail177-18.suw61.mandrillapp.com
 (mail177-18.suw61.mandrillapp.com [198.2.177.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51c0e75a-4f46-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 16:08:11 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-18.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WYv7t38mszCf9KZf
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 14:08:10 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 20e20903defe45c494398ed9f0ea75b3; Wed, 31 Jul 2024 14:08:10 +0000
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
X-Inumbo-ID: 51c0e75a-4f46-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722434890; x=1722695390;
	bh=d5hMzHk4pWAM1gLVjbKxtNNqDiNqO+f+fnX3raXvsl0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RyDngBKYZrlySa+JmI9GqrQKNeWNulnOOYVS6oMFRD7iTqUXbYzEXGBbYNXRnT6jW
	 NSUL88OwZfeh4wmOSbfT+OfyFBe2WqOWAPqciIiP2IAkwJmCkFqMDWCk2OnQvIj3Y8
	 SS7Foke6RK3GaksHOlyDLGH53pmERyp3EVoJeSUxD6LEUMGeNQJ//f4gZMX9VlV2+V
	 wHe2Naqtb17gp/4bnoBRQGW3kA3Ev9Xo5cqWRi+f4ZTvB3eq4GIkJNT6DXa17fwndO
	 xQ5F7Y90oYlhvGLueRA6wD3ab2IS/YrrYQ82qQbjfyvCTozYgPm7Ua4uwNAFE2tROJ
	 aXFPxKa4btczQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722434890; x=1722695390; i=anthony.perard@vates.tech;
	bh=d5hMzHk4pWAM1gLVjbKxtNNqDiNqO+f+fnX3raXvsl0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l+KHbg9QGYbjNM9rW3I9XWFhm8jzFSu00RGvwrYWfFR5J/LJe6NikETSQUaRV03y6
	 S5GSuVuKtnvt3eJ2LvhxswKLj0oPIhYbI1FKRiZ256cQ0RzAzAAfS2vINRscasNKCE
	 F5NNsKcFe2kFM9o/s7xWq+vqWSsgK2qk1tWOmMcedVJZuy7NKhlfHFPTeLvlL7utq/
	 ZFwFWlyLjVhF1EZF5/S7Y+FLb/ORCT/VXAH3s+W4Q2K+6+/JU8H6BLgYOIRzuY9M2u
	 5wJlCkPj3KFo5familWAzS8xO5YIDg6XpvjYKCG8utdiqT6rN1rm9cqOtPA086VBI7
	 yFsnM6nm7+gww==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[OSSTEST=20PATCH]=20preseed=5Fbase:=20Use=20"keep"=20NIC=20NamePolicy=20when=20"force-mac-address"?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722434889236
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Luca Fancellu <luca.fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Message-Id: <ZqpFSCzWTMl8gxBS@l14>
References: <20240617144051.29547-1-anthony@xenproject.org> <a65a83be-1236-4699-8124-c0bd809c4b97@citrix.com> <ZnFXFjeakYBmBHSB@l14> <bb768c00-0a91-4e47-91b4-21ec31a71f13@citrix.com>
In-Reply-To: <bb768c00-0a91-4e47-91b4-21ec31a71f13@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.20e20903defe45c494398ed9f0ea75b3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240731:md
Date: Wed, 31 Jul 2024 14:08:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2024 at 12:04:05PM +0100, Andrew Cooper wrote:
> On 18/06/2024 10:44 am, Anthony PERARD wrote:
> > On Mon, Jun 17, 2024 at 04:34:09PM +0100, Andrew Cooper wrote:
> >> On 17/06/2024 3:40 pm, Anthony PERARD wrote:
> >>> diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
> >>> index 3545f3fd..d974fea5 100644
> >>> --- a/Osstest/Debian.pm
> >>> +++ b/Osstest/Debian.pm
> >>> @@ -972,7 +972,19 @@ END
> >>>          # is going to be added to dom0's initrd, which is used by so=
me guests
> >>>          # (created with ts-debian-install).
> >>>          preseed_hook_installscript($ho, $sfx,
> >>> -            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END')=
;
> >>> +            '/usr/lib/base-installer.d/', '05ifnamepolicy',
> >>> +            $ho->{Flags}{'force-mac-address'} ? <<'END' : <<'END');
> >> The conditional looks suspicious if both options are <<'END'.
> > That works fine, this pattern is already used in few places in osstest,
> > like here:
> > https://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3Dts-host-in=
stall;h=3D0b6aaeeae228551064618abfa624321992a2eb2d;hb=3DHEAD#l240
> >     >  $ho->{Flags}{'force-mac-address'} ? <<END : <<END);
> >
> > Or even here:
> > https://xenbits.xen.org/gitweb/?p=3Dosstest.git;a=3Dblob;f=3Dts-xen-bui=
ld;h=3Dc294a51eafc26e53b5417529b943224902870acf;hb=3DHEAD#l173
> >     > buildcmd_stamped_logged(600, 'xen', 'configure', <<END,<<END,<<EN=
D);
> >
> >> Doesn't this just write 70-eth-keep-policy.link unconditionally?
> > I've check that, on a different host, and the "mac" name policy is used
> > as expected, so the file "70-eth-keep-policy.link" isn't created on tha=
t
> > host.
> 
> This is horrifying.=C2=A0 Given a construct which specifically lets you
> choose a semantically meaningful name, using END for all options is rude.
> 
> Despite the pre-existing antipatterns, it would be better to turn this
> one into:
> 
> $ho->{Flags}{'force-mac-address'} ? <<'END_KEEP' : <<'END_MAC');

I've push the patch with this change.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


