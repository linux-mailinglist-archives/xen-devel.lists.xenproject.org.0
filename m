Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C6892FC93
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758126.1167431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSHHT-0004bF-Ee; Fri, 12 Jul 2024 14:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758126.1167431; Fri, 12 Jul 2024 14:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSHHT-0004Zv-Bw; Fri, 12 Jul 2024 14:29:51 +0000
Received: by outflank-mailman (input) for mailman id 758126;
 Fri, 12 Jul 2024 14:29:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHna=OM=bounce.vates.tech=bounce-md_30504962.66913dd9.v1-9ecc3683380a45bba81631d608415142@srs-se1.protection.inumbo.net>)
 id 1sSHHR-0004Zp-DN
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:29:49 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fff1bc1-405b-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 16:29:47 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLDWY59zsz6CQ4ym
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 14:29:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 9ecc3683380a45bba81631d608415142; Fri, 12 Jul 2024 14:29:45 +0000
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
X-Inumbo-ID: 2fff1bc1-405b-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720794585; x=1721055085;
	bh=ku9BL4RPIFRRrZi7gv0uTHbpKe3ZpYLVxFZXHC0394w=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KWHFKzoTt1wromDad025AjmZjVYjEGd45GEvV/Q8bvpEnuBkhZ6N4L9RbWTInw9Eo
	 R/n846u1wYEXYa3qaP/xxj57W4Slp+kzRJdxOQ7OKMX94SDl2PcWGe42mUXgzQGaym
	 VenYZGLOPpC70swbYw/X1y1q3p49qkjjBAJTerFcIeAtc/RFO7QpHIprgUsHtvMCbz
	 ncZltOAwdC3wTXDvanvs3CRe7skUP1G6CLOj3xeF0JQjOm1ZBEKVMaAjuK6v7woh4O
	 X3rwR3sNsy5+ehFZ+4KJF10aSsotBsiizd34sudxmIenm/cw7cJT0Yg54ukmcNFesB
	 QBrTSK0uwEhQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720794585; x=1721055085; i=anthony.perard@vates.tech;
	bh=ku9BL4RPIFRRrZi7gv0uTHbpKe3ZpYLVxFZXHC0394w=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yn4lf4JNTic4yNQtsIdDqNUMxrZp++m0qcIwvFxHZbO29w9eg6S0ylygtVagaxXP/
	 nh7nat/khg7bYFIWNEEopWs7T8UN7pOVDg5E/FOH/IYbrvJ61j9GhtIH1nuh0JI6Lf
	 q+kvDF0KppQKbV00BPO4CLe7wcD5cissX4JtjN0Rx2JnDQHLlckUPyFdZ810JWU3r2
	 N6yjxeN36dqhry2EygS5+w1l0raVWIOV+i/7u5FQbkAR7A2jliCb9B0G/E9XnK+CUF
	 fgtpwIwCbJM0Gnt5ATWwB5ZMt9T6Epy0UrdXciF8MVFBJvHdjw6I4ss5NxgEN7vJDV
	 R+Bd8Gt4Od/cA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2015/12]=20CI:=20Refresh=20Ubuntu=20Xenial=20container=20as=2016.04-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720794584501
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpE915dPhH1tgrua@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104829.3237296-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104829.3237296-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.9ecc3683380a45bba81631d608415142?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 14:29:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:48:29AM +0100, Andrew Cooper wrote:
> diff --git a/automation/build/ubuntu/16.04-x86_64.dockerfile b/automation/build/ubuntu/16.04-x86_64.dockerfile
> new file mode 100644
> +        python3-setuptools

Another thing,

I've just notice that "python3-setuptools" was originally only introduced
to focal container on purpose, by:
bbc72a7877d8 ("automation: Add python3's setuptools to some containers")

But now this patch series is introducing it to xenial and bionic. It
might be worth mentioning, or removing the deps.

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

