Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC910968B50
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:50:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788201.1197670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9Ji-0004W4-IJ; Mon, 02 Sep 2024 15:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788201.1197670; Mon, 02 Sep 2024 15:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl9Ji-0004UX-Ej; Mon, 02 Sep 2024 15:50:10 +0000
Received: by outflank-mailman (input) for mailman id 788201;
 Mon, 02 Sep 2024 15:50:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16YU=QA=bounce.vates.tech=bounce-md_30504962.66d5dead.v1-0943501080d44665b9ae7fe1a2d242cd@srs-se1.protection.inumbo.net>)
 id 1sl9Jg-0004UR-Aa
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:50:08 +0000
Received: from mail177-17.suw61.mandrillapp.com
 (mail177-17.suw61.mandrillapp.com [198.2.177.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06501e02-6943-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 17:50:06 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-17.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4WyCrF46pbzRKLds6
 for <xen-devel@lists.xenproject.org>; Mon,  2 Sep 2024 15:50:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0943501080d44665b9ae7fe1a2d242cd; Mon, 02 Sep 2024 15:50:05 +0000
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
X-Inumbo-ID: 06501e02-6943-11ef-a0b2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1725292205; x=1725552705;
	bh=IZnmT7BRlyIMYTBWZVcIRGk1aqkBr3FLzDrqpAVS3Yg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ei51+gQ+So0vE3WIPCE+3hGq7CJ0Rt9mSnXhGACheYAu4uz69U0n2TzCFz0ZGDQrB
	 R7ew13o3eOo2HEZRUBvpB9NKWlEdPcyI2rfUTSaTgCKUmJCKvnpNudH556xB+eZd3p
	 SDFt2+zEbViAzPP0+bCdHaVCxVMW3+ENewxAlHuPFU9VPIvWjOYMJ0zynkkfwoARei
	 mdhsOmdQDA4uV3hV0h1Ro+tSjRgNwyBy/lj5GpqwSOMXIz1N1H94InYTvIjiCmh4Ur
	 TcHpKHxpfFskNEp0RdNx3IC63v1Mqwp+hca624aLMn3nCcJb1zPXOjE8s4/7C/0wqh
	 qFIkKLkw67noA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1725292205; x=1725552705; i=anthony.perard@vates.tech;
	bh=IZnmT7BRlyIMYTBWZVcIRGk1aqkBr3FLzDrqpAVS3Yg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ORl7nSzk9HlpjaMWh3C/K2+695TUs2IuHF/WHvAlhPyQZbU34WYEes7dsOoIUZkh6
	 vcBcFpO7wFkLntqWlHuQ9Fx3ZEUS+t7dvmg9GtjejLr0eWcRZA4D2TF8w3w4seuNI9
	 LG+p15b9IAYU/2GB+HRaGynNHTQagFf29kBH4wRYYWnT5w5myLlJKkCxVJpqV8AEFp
	 LIM1++LB2lZVmbmfy9+RCrOt1j7q93b1Qt7hOcDBIPSfoa5SXnrt03uiyh27Bh0aOz
	 sr8B5XuG4g/agyvU5oQLlJTZBzZW3/GgmU9cfUbjlULKnNkwA2AptWMkeS51SwS1GT
	 BTinBOkU5bmaQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Block=20protocol=20incompatibilities=20with=204K=20logical=20sector=20size=20disks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1725292204233
To: =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: paul@xen.org, xen-devel@lists.xenproject.org, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <ZtXeq8F2BLTk2USB@l14>
References: <ZtBUnzH4sIrFAo0f@macbook.local> <ZtB0fMRCGajdcfap@l14> <ZtCW9Qq9k8UQ-jJC@macbook.local> <ZtHus/ytlA1UnHEI@l14> <ZtV9hteu_sVyvnih@macbook.local> <13d84592-64c5-4e34-93be-3f8ecb7afb15@xen.org> <ZtXYeaKp-ug8oFjX@macbook.local>
In-Reply-To: <ZtXYeaKp-ug8oFjX@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0943501080d44665b9ae7fe1a2d242cd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240902:md
Date: Mon, 02 Sep 2024 15:50:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 05:23:37PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 02, 2024 at 03:19:56PM +0100, Paul Durrant wrote:
> > On 02/09/2024 09:55, Roger Pau Monn=C3=A9 wrote:
> > [snip]
> > > 
> > > Thanks for your input.  I would also like to hear from the blktap and
> > > Windows PV drivers maintainers, as the change that I'm proposing here
> > > will require changes to their implementations.
> > > 
> > 
> > So IIUC you are proposing to refuse to connect to a frontend that sets
> > feature-large-sector-size if sector-size !=3D 512? Is that right?
> 
> Is is worth retrofitting this into existing backends?  My suggestion
> would be to make `feature-large-sector-size` not mandatory to expose a
> sector-size !=3D 512, but I wouldn't go as far as refusing to connect to
> frontends that expose the feature.  I have no idea which frontends
> might expose `feature-large-sector-size` but still be compatible with
> Linux blkback regarding sector-size !=3D 512 (I know the Windows one
> isn't).

The frontend exposing "feature-large-sector-size" are not going to work
with Linux's backend if it set "sector-size" to a value different from
512.

From blkif.h:
    feature-large-sector-size
         A value of "1" indicates that the frontend will correctly supply a=
nd
         interpret all sector-based quantities in terms of the "sector-size=
"
         value supplied in the backend info, whatever that may be set to.
         ...

But Linux interprets "sector-based quantities" as 512 bytes. This is
incompatible with "feature-large-sector-size".

This is why I proposed to mark "feature-large-sector-size" as broken or
incompatible with your proposal to use 512B for all sector-based
quantities.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


