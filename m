Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B02292EC91
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757628.1166675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwYx-0005iZ-AQ; Thu, 11 Jul 2024 16:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757628.1166675; Thu, 11 Jul 2024 16:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwYx-0005gs-7Q; Thu, 11 Jul 2024 16:22:31 +0000
Received: by outflank-mailman (input) for mailman id 757628;
 Thu, 11 Jul 2024 16:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1/V=OL=bounce.vates.tech=bounce-md_30504962.669006c1.v1-0806c7d338d74e60a5ef1291969144f0@srs-se1.protection.inumbo.net>)
 id 1sRwYv-0005gm-Ca
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:22:29 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2bb38b0-3fa1-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 18:22:26 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKg411LVbzB5p56t
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 16:22:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0806c7d338d74e60a5ef1291969144f0; Thu, 11 Jul 2024 16:22:25 +0000
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
X-Inumbo-ID: c2bb38b0-3fa1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720714945; x=1720975445;
	bh=kySeyb3PB9foaro1xW0ZTVDBARCwihV1yBAAPQjo7tQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1f2y6BPGAwAAkAYt/1DLmtnsGBdXRTk0uvvLi2YOuCMTMmB/s5h3CXmYYxAaN9MuF
	 5LklYcBx/i8K9Q/bPebnCO5+c9rCE12VL56iRBs9gmI+VfFjHsMW+51ZFsi8hcE/8r
	 iZT+5QLGVwXr9nJm7Nvpvo1rbBALeUgewkv+kibLNzhlcdbfcCcPqcn7D0+nCzi2L3
	 v9zHFRPUrSn74y4IUIpDaq40D3x0pkGbbl5OWW40z7GWzJZK7a4p2aR/Pkc793mE9+
	 X3TiBwYamp6wVfIDmDruHbVInTjOcx+ZI6GAih8aZMmiEEZ5GD6aBuB63UNTn5T7qO
	 ZWScZVSPWh9SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720714945; x=1720975445; i=anthony.perard@vates.tech;
	bh=kySeyb3PB9foaro1xW0ZTVDBARCwihV1yBAAPQjo7tQ=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qyl8oAJETiA0kvWKXQjroPi/CSkwJLOf5Dv7JmPf9TCMCsREkTDr1U8XPR3WTYX92
	 tfZEwPDXPZteXVKn2/vJWklCbsVSsdqeJ6LSEPI4LvnrDKnIreFlblodCQx3GMadAw
	 lVSEYiGf6rgtYrKUCN9Q+aKMSfmScA68u++UfZprWSBS/A8YKmM4be6wq+fW/p7ZtU
	 /HQrZFtMkoLr5fQmqdPaeSQN+yES5pVQwbr2Uf6QHdEJQ+3meA1WPq21EiFKyMX6eT
	 SgZh0kI7AGM6DY3Ns03xi1ICVp9ei3sVceC0Y1rXQ1wllWWCb8AsfRouCuIhlqKWgS
	 gFmelgrBwc38A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2008/12]=20CI:=20Use=20debian:12-ppc64le=20for=20both=20build=20and=20test?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720714943737
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpAGv4J+GWzNfz6F@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-9-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-9-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0806c7d338d74e60a5ef1291969144f0?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 16:22:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:13PM +0100, Andrew Cooper wrote:
> qemu-system-ppc64/8.1.0-ppc64 was added because bullseye's Qemu didn't

QEMU is normally spelled "QEMU" unless we are in camel case context, or
lower case context.

> understand the powernv9 machine.
> 
> However, bookworm's Qemu does, and this is preforable to maintaining a random

"preforable", that's an intended mispell right? :-)

> build of Qemu ourselves.
> 
> Add bookworm builds, and retain bullseye to keep our lower-bound toolchain
> testing.
> 
> Rename the jobs to follow to sort coherently ($DISTRO-$VERSION-$ARCH-*) and

There's no renamed jobs in this patch, but the new jobs does follow the
new naming schema. Did you intend to rename both
"debian-bullseye-gcc-ppc64le*" jobs?

> reposition the jobs to optimise starting the smoke test.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Patch is mostly ok, so:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

