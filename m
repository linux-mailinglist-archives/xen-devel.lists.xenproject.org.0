Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E996980C8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 17:22:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496114.766680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKXY-0002pJ-Kj; Wed, 15 Feb 2023 16:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496114.766680; Wed, 15 Feb 2023 16:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSKXY-0002n7-Hr; Wed, 15 Feb 2023 16:21:52 +0000
Received: by outflank-mailman (input) for mailman id 496114;
 Wed, 15 Feb 2023 16:21:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LhbV=6L=citrix.com=prvs=4037f5ffb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pSKXW-0002n1-Uu
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 16:21:51 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6f72dcd-ad4c-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 17:21:48 +0100 (CET)
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
X-Inumbo-ID: d6f72dcd-ad4c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676478108;
  h=date:from:to:cc:subject:message-id:reply-to:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6uwc1AQrOxLfk+9nw0OPLHBiC7hZ2w514oUfVGWijuw=;
  b=XCKNWlweEqhODHMHDx3KLNm4hL4Mx2xHsGsgUs2XsU+qFAUIqwfOmvrx
   WgSRVBD0+5OxGZllfLKF0l9fCz2k4+JDGd50IS2mD+2TN2hUSnqCSy479
   EAzV77uzxJ6LuZLNUik3Zu61rXKYCyc391H0n7nR9NRIfpBntHSTEFLm7
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 97578988
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ehFjWqnSIOx5XrhIqQtRlTno5gy4JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfCD3Xb/aNN2L1KYoiaIm1/U8Ou5aEm9RgTAVsrCEzQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eMGNh0dTkiJvuuz/a+na+tFhNgjLPC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfH+
 z2WrjSpav0cHIWwwiOK+C6ev9DsnwjbQ7JRTLigrMc/1TV/wURMUUZLBDNXu8KRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQqWaJpBcGV/JMEucx70eGza+8yw2QHGQDQxZKYcYqs8JwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRt3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgAhmas+ne5T3Zyy+G3anxOuj5rVTg4Ms1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj02wYHInU3y9i6F5dPl6h06So2GkpmO91sldTBM
 B6K4lM5CHO+0RKXgU5Lj2CZUZ9CIUvIT46NuhXogjxmOMAZmOivoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9gnjKCG8qqlUT9uVZ7WJJzYe1dWLdpRrpkhJ5oXS2Pq
 4oPXyd040s3vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtNv0SI/cFzN/8T5mOt7E6Q8xvQ9qws91
 i3lMqOu4Aal1CKvxMTjQiwLVY4Dqr4u/S5qbHB1bQ7ANrpKSd/H0ZrzvqAfJdEPnNGPB9YuJ
 xXZU61s2shydwk=
IronPort-HdrOrdr: A9a23:odaSdak4IFR6HcpZwlAI69Wcgq3pDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.97,300,1669093200"; 
   d="scan'208";a="97578988"
Date: Wed, 15 Feb 2023 16:21:34 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 2/4] automation: Ignore package authentification
 issue in Jessie container
Message-ID: <Y+0GjhO521VPJCVk@l14>
Reply-To: <anthony.perard@gmail.com>
References: <20230215120208.35807-1-anthony.perard@citrix.com>
 <20230215120208.35807-3-anthony.perard@citrix.com>
 <949bd6fb-a6b2-71bf-7eed-374939b54fb4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <949bd6fb-a6b2-71bf-7eed-374939b54fb4@citrix.com>

On Wed, Feb 15, 2023 at 12:36:30PM +0000, Andrew Cooper wrote:
> On 15/02/2023 12:02 pm, Anthony PERARD wrote:
> > We can't easily install package on Debian Jessie anymore, the release
> > keys seems to have expired without a way to get new ones. We have
> > these warning:
> >     W: GPG error: http://deb.debian.org jessie-updates InRelease: The following signatures were invalid: KEYEXPIRED 1668891673
> >     W: GPG error: http://deb.debian.org jessie Release: The following signatures were invalid: KEYEXPIRED 1668891673
> >
> > So, from now on, ignore the warning and force the installation of
> > packages that can't be authenticated.
> >
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >
> > Or, we could just not test on Jessie anymore.
> 
> Jessie fell out of support in 2020, so its certainly not reasonable to
> be testing it any more.
> 
> But on older branches, we do want to keep it around, so I guess we want
> to fix the containers to still be buildable...
> 
> But is this really the best option?  Some googling suggests that all we
> need is a properly up-to-date debian-keyring package.  Are the jessie
> docker tags really shipping with a broken base package?

I did try to find a better solution that "--force-yes", I did find out
about installaling the latest "debian-archive-keyring", but it is
already up-to-date. Installing "debian-keyring" instead doesn't change
the keys.

But it looks like there's another way. We could use "debian/eol:jessie"
as base image instead of "debian:jessie", and that works. I'll update
the patch with that.

-- 
Anthony PERARD

