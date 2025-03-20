Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD8A6A8B4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:36:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922271.1326158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH0F-0005rE-Q1; Thu, 20 Mar 2025 14:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922271.1326158; Thu, 20 Mar 2025 14:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvH0F-0005pm-MX; Thu, 20 Mar 2025 14:36:11 +0000
Received: by outflank-mailman (input) for mailman id 922271;
 Thu, 20 Mar 2025 14:36:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZTlE=WH=bounce.vates.tech=bounce-md_30504962.67dc27d0.v1-6782a46338fb43b9b1b6cc2c7709487a@srs-se1.protection.inumbo.net>)
 id 1tvH0E-0005Ci-3E
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:36:10 +0000
Received: from mail132-31.atl131.mandrillapp.com
 (mail132-31.atl131.mandrillapp.com [198.2.132.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ddbd87-0598-11f0-9ea0-5ba50f476ded;
 Thu, 20 Mar 2025 15:36:01 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-31.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4ZJSmw1fBdz9K7SHZ
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 14:36:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 6782a46338fb43b9b1b6cc2c7709487a; Thu, 20 Mar 2025 14:36:00 +0000
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
X-Inumbo-ID: a4ddbd87-0598-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1742481360; x=1742751360;
	bh=79bcBAv25T+Qlj2Z6zTFmDcntBtvpVdS+d7L9SWT9sY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qPqJQbdDlvJfU+u51SmuSgT9+jDS0uZlpACwgtf4n5tKo3LCNYMbrv/dpiUK2OiRv
	 tyNFkgwSC5WbXcC+xqE/Nt++d8UrAsINfx69afxol+Jtl5cq8kmINgqHPECa9zS8iO
	 VQm1ms9DctZU/dfN1IQ17bS0I372aRG3ByLI/r7iT1yjIQcHDYF+YYLRz9XBC/5xIS
	 xLOClLZwRCiYTD/u18SsOeNz1EnuGs48uIvVoBrdy3k48DTP6Vr1sw8MOdOVLRifbQ
	 KM+7S39hQD6mfEj3AStZUTKjAK921dXiPG2+/v36E+3AvfnqptVBLc832ur7W5jHLk
	 s1+nS6tV88Vsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1742481360; x=1742741860; i=anthony.perard@vates.tech;
	bh=79bcBAv25T+Qlj2Z6zTFmDcntBtvpVdS+d7L9SWT9sY=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KruZEoii1J7Vp3ViJWAPN47WNBr8z4rwfrtkaAB9DBR97biFwoS89ghO4tUlEtX8a
	 HrI/HHAPLGrez0AZDDCAuW3WMGLd3guBnQnVf7n4ES7WxSLsJzUhDlxl4EaCELppTB
	 bLluZnPCLbHxTZI4UWVORtJUo4jZ8erOlWxEBrjfa4wyh9kw1YZdjKAH43gYIar6Ej
	 24flWIe+gNt16yTlpksQke2PNFUBctCV4of76cHmgrPLv7qzYacP9yTo2POymTxoY1
	 Ppvh13dXSdla63snI7yR4F3O4qG0JsEddfEoj46gfSKzul57Y2Df5DkZf1ysIGEI+/
	 b1U2R0aW3ITqw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v1=202/2]=20Strip=20build=20path=20directories=20in=20tools,=20xen=20and=20xen/arch/x86?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1742481358496
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Fr=C3=A9d=C3=A9ric=20Pierret=20(fepitre)?=" <frederic.pierret@qubes-os.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Z9wnzRbwb3HQaSMu@l14>
References: <0370c0eb1fd9ac00acab016792132fa0b943d384.1742317309.git-series.marmarek@invisiblethingslab.com> <017d5c41-d4ea-4d91-b6ec-b4660e7325ae@suse.com> <e112ecca-b891-4c23-ace1-8128e586cb94@suse.com> <Z9qxcRtap-k-wW8B@mail-itl> <943644a3-45f2-46ef-a54b-6dd0bc6171ed@suse.com> <Z9rJUWCARMQYqNXr@mail-itl> <Z9vrc1Xvm5OEy8rM@l14> <Z9wPVGd0fEsbaO_s@mail-itl> <a9831a95-2828-4b46-8cae-58b2c531f507@suse.com> <Z9wfKB0vdngn3xXX@mail-itl>
In-Reply-To: <Z9wfKB0vdngn3xXX@mail-itl>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.6782a46338fb43b9b1b6cc2c7709487a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250320:md
Date: Thu, 20 Mar 2025 14:36:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 20, 2025 at 02:59:04PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Mar 20, 2025 at 02:49:27PM +0100, Jan Beulich wrote:
> > On 20.03.2025 13:51, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Thu, Mar 20, 2025 at 10:18:28AM +0000, Anthony PERARD wrote:
> > >> On Wed, Mar 19, 2025 at 02:40:33PM +0100, Marek Marczykowski-G=C3=B3=
recki wrote:
> > >>> There are clearly some build path embedding left. And
> > >>> -ffile-prefix-map=3D/-fdebug-prefix-map=3D doesn't work correctly w=
ith
> > >>> XEN_ROOT having xen/.. at the end.
> > >>> BTW, would it be acceptable to have this?
> > >>>
> > >>>     $(call cc-option-add,CFLAGS,CC,-fdebug-prefix-map=3D$(realpath =
$(XEN_ROOT))=3D.)
> > >>
> > >> Hi,
> > >>
> > >> Could you avoid using $(XEN_ROOT) in hypervisor build system? (It's =
fine
> > >> in "tools/"). In "xen/", there's a few variables you can use if they=
 are
> > >> needed: $(abs_objtree) $(abs_srctree) for absolutes path, and $(srct=
ree)
> > >> $(objtree) for relative path. That also should avoid the need to use
> > >> $(realpath ).
> > > 
> > > XEN_ROOT is literally "$(abs_srctree)/..". And I need to resolve it t=
o
> > > not have /.. for prefix-map to work correctly. Would it be better to =
use
> > > literal $(realpath $(abs_srctree)/..)? Or use just $(abs_srctree) and
> > > have paths in debug symbols relative to hypervisor source dir, instea=
d
> > > of xen repo root? I'm not sure if that wouldn't confuse some tools...
> > 
> > abs_srctree being computed using realpath, can't we replace
> > 
> > export XEN_ROOT :=3D $(abs_srctree)/..
> > 
> > by something as simpl{e,istic} as
> > 
> > export XEN_ROOT :=3D $(patsubst %/xen,%,$(abs_srctree))
> > 
> > ?
> 
> That works too. It's slightly less robust, but I don't expect "xen"
> directory to be renamed, so shouldn't be an issue. I'll leave also a
> comment there why not /.. .

I don't think $(XEN_ROOT) is present in the binaries produce by the
hypervisor's build system. There's only a few use if that variable: to
load some makefile, to execute makefile that build xsm policy and to
generate cpuid-autogen.h. Otherwise I don't think the compile have this
path in the command line. What is going to be in the binary is
$(abs_srctree), which you can replace by "./xen" if you want; which mean
it doesn't matter if the directory is renamed or not. You might want to
also take care of $(abs_objtree) which seems to also be in `xen-syms`
when doing out-of-tree build.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


