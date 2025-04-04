Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C4EA7BEE7
	for <lists+xen-devel@lfdr.de>; Fri,  4 Apr 2025 16:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938301.1339208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hsD-0007f4-PH; Fri, 04 Apr 2025 14:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938301.1339208; Fri, 04 Apr 2025 14:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0hsD-0007c4-ME; Fri, 04 Apr 2025 14:18:21 +0000
Received: by outflank-mailman (input) for mailman id 938301;
 Fri, 04 Apr 2025 14:18:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6wpM=WW=bounce.vates.tech=bounce-md_30504962.67efea2a.v1-dc29fee23a8a4deea8cb57c07c22a9f1@srs-se1.protection.inumbo.net>)
 id 1u0hsC-0007by-Qd
 for xen-devel@lists.xenproject.org; Fri, 04 Apr 2025 14:18:20 +0000
Received: from mail186-2.suw21.mandrillapp.com
 (mail186-2.suw21.mandrillapp.com [198.2.186.2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8151cf7-115f-11f0-9eaa-5ba50f476ded;
 Fri, 04 Apr 2025 16:18:19 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-2.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZTggZ0xqQzS62H91
 for <xen-devel@lists.xenproject.org>; Fri,  4 Apr 2025 14:18:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dc29fee23a8a4deea8cb57c07c22a9f1; Fri, 04 Apr 2025 14:18:18 +0000
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
X-Inumbo-ID: a8151cf7-115f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743776298; x=1744046298;
	bh=Cn875ock7pUwwTBxNchYfc2TYuKpcgLI6hStnDIs6T8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DvxmMN2eaH+IKnQUsypwqiZaQpte/riYgyTWOiTguHBa78bjit+caIW7LQHhzlg7H
	 bNMnkxvykjSzssnddM8SL6reYMmK7GPYd+w9L3FGTkRoHHBBRm1UIQBDBFRcBqtkSg
	 vg8PVgz16pfgmw8RdrZ27lf3pQWvknh43iuipS31NKpFso7hA9eZ7MQ+gLhtWpXqCy
	 hg0TcoCGklk/TJ2L6N6Yf4gMmr3F3gNQgcix3GAIKedLlVl+6+6tnPX+beGhswNH+g
	 0mn8Kv5GThD3963R4vOU/dnvlYCgLbOvk+E7QjiaIH8uFDCszchhfU3Q7xttoW2QaI
	 SPPGZcmU0KzkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743776298; x=1744036798; i=anthony.perard@vates.tech;
	bh=Cn875ock7pUwwTBxNchYfc2TYuKpcgLI6hStnDIs6T8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=dSqtietuI8cslY+FhMY8TAEAILlbkXJUFik8c00yEi3RvIrfYy3KXRrNHv9L61K9i
	 NaIK/cDPOBwoc0OperuhL1L+W/QVaLNYLUX7HO1TM4rFEYvMhouAqfLGTNdAxyLYMI
	 LoMnc2TpNbZeGrGk5jdw2VvsiNQpXTTjX4/VKfCZymOkx75jpuVDudeABmUlBZehzu
	 J2ti1z8GNx18o9Cjs1pc93eUNLN3DY+5rz1nxted6YLJCiedaJxpouWswEMXq3KCzb
	 hqN90h+yu37dp/SCivkQJCC0MWjabWnbXOMM4/hrxS9m+Orc9PwbykKCR7X2bfmsqd
	 GzJHUed7miv9g==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20automation:=20Avoid=20changing=20source=20files=20for=20randconfig=20tests?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743776295428
To: "Stefano Stabellini" <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <Z-_qJ4eIDpGvfRFL@l14>
References: <20250326142754.5441-1-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2503261910100.563920@ubuntu-linux-20-04-desktop> <Z-UvUUwUToTr5OgD@l14> <alpine.DEB.2.22.394.2503271554250.563920@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2503271554250.563920@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dc29fee23a8a4deea8cb57c07c22a9f1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250404:md
Date: Fri, 04 Apr 2025 14:18:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 27, 2025 at 03:59:16PM -0700, Stefano Stabellini wrote:
> I was suggesting to create a file under /tmp instead to keep the source
> directory cleaner,

There's an easy way to keep the source directory *extra clean* when
doing hypervisor build, like we are doing here for randoconfig, that is:
out-of-tree build!

> and also because I don't think it is an issue to add
> files to /tmp and not clean them because they get removed when the
> container exits. Isn't it the case? Locally it looks like each
> containers gets its own /tmp that is cleaned after exit.

Sorry, I tend to think that those script could be use outside of the CI
or containers, and /tmp can have a lot of different configuration, so
it's better to clean after oneself when possible.

As for running containers locally, maybe it's faster to reuse a
container instead of creating a new one from an image, which mean /tmp
is probably not cleaned on exit. But I guess people usuasly do `docker
run --rm` or use `containerize` which does the same.

> So my preference is to use mktemp and *not* clean the tmp file on exit.
> 
> If you think we have to clean the tmp file on exit, then let's go with
> your xen/allrandom.config.tmp approach as I would prefer to avoid the
> "trap" command to keep the sources simpler.

So, is that an Ack on my original patch?

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



