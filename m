Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E592ECE5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:38:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757642.1166705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwni-0000oE-1k; Thu, 11 Jul 2024 16:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757642.1166705; Thu, 11 Jul 2024 16:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwnh-0000mR-U6; Thu, 11 Jul 2024 16:37:45 +0000
Received: by outflank-mailman (input) for mailman id 757642;
 Thu, 11 Jul 2024 16:37:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sMyr=OL=bounce.vates.tech=bounce-md_30504962.66900a57.v1-dc0647c5c21d4c2b8c86e460f83e5a4b@srs-se1.protection.inumbo.net>)
 id 1sRwnh-0000mL-1S
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:37:45 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5799fbd-3fa3-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 18:37:44 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WKgPg1Kq0z6CQ3ny
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 16:37:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dc0647c5c21d4c2b8c86e460f83e5a4b; Thu, 11 Jul 2024 16:37:43 +0000
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
X-Inumbo-ID: e5799fbd-3fa3-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720715863; x=1720976363;
	bh=XzqzJLY87M4ZYLRo3AYCtT9uBYsqsNa71UbiJ5+Kel0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ycsg6kCaN4fmrInzetJSxVEvwQ1OO4VzCdKaxAFGdIttTZHh0rlGUtxH09sW9ZV0y
	 /m103sdeq56n9ex29ALCPmljHmpzZ6rzCKaGmPXkdWZAU2cEVVDClUCAUBDhsNxoOH
	 QKroFd8ASgo9y6XHO1gWKsRNopRV4J4FS1z2sHkDGpma5/sV07ovOei6PKLZCCO7be
	 PJei7JZPJOpYG00XTCbx3veFke0CPRL4VaaNt3Y1c5HA3JwWrj7sGa9p5YXh7sX76Q
	 hwXJ2CcCO9mb3S3HP+dIDc2NdJfTZqVjLXUXq/ISBhFr7NYUXkKnBkpUAWZ8y04H0e
	 lNfn9G0ErByqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720715863; x=1720976363; i=anthony.perard@vates.tech;
	bh=XzqzJLY87M4ZYLRo3AYCtT9uBYsqsNa71UbiJ5+Kel0=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PW8xMBZsgHIfWB0OotNDbi60mDGUIxxErmXyXzr5EbKSW3nq0LV2ljzehpNfKA2qD
	 ANRicEm3PORQTI5TKk0QZRFCFE/xuOU2rFythFyPH6EonCIOy+sr9TepIEj4bb97Y2
	 aZW263SZK9g88k5jbF+ikHf4QGrTzvcvdyq95g7xHzRnxwKNDZAB1YSVb0gQ7KyKMg
	 XzLDwjPsSdqaJaggQIbZ91K3puq4mKZBFEtkMFF9TRS5+Qs4glKmkgJBLI2GPYDTfv
	 mrNZ/lorGFFr6u0OtqLK924aQbeq3Xx9A7QI60mgS6KmByH7YHOBUOiiIFrGgIMR7I
	 f4MgvVaL2frNg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2011/12]=20CI:=20Swap=20to=20debian=20for=20riscv64=20build=20and=20test?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720715861959
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpAKVX1B+jAxnNmI@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-12-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-12-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dc0647c5c21d4c2b8c86e460f83e5a4b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 16:37:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:16PM +0100, Andrew Cooper wrote:
> The containers are both much smaller, with stable toolchains over time, and
> this at least means we're not doing all testing with a single compiler.
> 
> Rename the jobs to follow to sort coherently ($DISTRO-$VERSION-$ARCH-*) and
> reposition the jobs to optimise starting the smoke test.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

