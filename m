Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A960F959B43
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 14:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781060.1190617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgk70-0001Pg-BK; Wed, 21 Aug 2024 12:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781060.1190617; Wed, 21 Aug 2024 12:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgk70-0001NH-8e; Wed, 21 Aug 2024 12:06:50 +0000
Received: by outflank-mailman (input) for mailman id 781060;
 Wed, 21 Aug 2024 12:06:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D8aE=PU=bounce.vates.tech=bounce-md_30504962.66c5d855.v1-010acca1462e467092bdf3806c21acbf@srs-se1.protection.inumbo.net>)
 id 1sgk6y-0001NB-Rg
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 12:06:49 +0000
Received: from mail186-11.suw21.mandrillapp.com
 (mail186-11.suw21.mandrillapp.com [198.2.186.11])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d66994be-5fb5-11ef-a508-bb4a2ccca743;
 Wed, 21 Aug 2024 14:06:47 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-11.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WplS54dJ5zLfH3xH
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 12:06:45 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 010acca1462e467092bdf3806c21acbf; Wed, 21 Aug 2024 12:06:45 +0000
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
X-Inumbo-ID: d66994be-5fb5-11ef-a508-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724242005; x=1724502505;
	bh=X/tOv9o3a9iLxzCm/f3NpxTQqlbHR8gkWZnodPtLg+o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q40Vp8rfPrm4J4dUIe4ear5b94HwMENgwvUjZ4nraoaaGrv7nXxyztXjRoW3gqBD1
	 LeRsSOF7c+i6pT5YxDaunvn+wFKdMwmOuE/Qhwp5E48ZIMviCBRP50mY1t3S/zTTc1
	 waVTobfjMAZqQZ4YlOBBkFdLGzYujiQCFQqcJhh2jMtUcu3kSara1o8neEOOYf44hB
	 VeJbErF2CiXV7XhrEyh0WOTmb9fmwyEyJjRgN//we0ZDD6nI2XvHtaVDnxGt7gFxbK
	 KWoktNDU3Q3us/7NaEujjsEVrg0psl1n/TFu95i3hVl5RU3z12Ldl+6ghdWNLu3bS7
	 tne0BcHIl9DCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724242005; x=1724502505; i=anthony.perard@vates.tech;
	bh=X/tOv9o3a9iLxzCm/f3NpxTQqlbHR8gkWZnodPtLg+o=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qWFIKYhzmIHm4EQk2jXuC7I8rBnlPqu9yQX2g9iC6B8/KjhmJ2LfJk8/jzn3jRGN0
	 18OAeDG2Ia9fZIv5FowVuNGvz9lIDz9ZnxX5LKyoDVawoF4hCitxzkOGyeQJt0a78I
	 9q/Bci7l5ESFCKU+dB34QPhJnv3yrweLQgyMAh8aO1z3/6pfaIcqoOgIcwzDue3rJ+
	 z82kZ9A42pMiaGl70anmuRXbRqpJium3wmpaQA22JkVKwLK7pPohxjqnhS/L/CaeUL
	 nRve68ecxkzYPDjgj+kvqvZP7R2TboHorRtSriGhnoXCCKmB4BMABFNnDXQCZdqF4Q
	 4sLc7N4kbgLWw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20automation:=20restore=20CR=20filtering?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724242003868
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <ZsXYU33Ap9P/xC+R@l14>
References: <alpine.DEB.2.22.394.2408161642220.298534@ubuntu-linux-20-04-desktop> <6d2fbe22-8866-4769-95d0-a5a8613a5936@amd.com> <ZsNl7S1JOYQgQx87@l14> <alpine.DEB.2.22.394.2408191819580.298534@ubuntu-linux-20-04-desktop> <ZsSMVaoJlR4mn7Ig@l14> <alpine.DEB.2.22.394.2408201842090.298534@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2408201842090.298534@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.010acca1462e467092bdf3806c21acbf?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240821:md
Date: Wed, 21 Aug 2024 12:06:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Aug 20, 2024 at 08:48:55PM -0700, Stefano Stabellini wrote:
> On Tue, 20 Aug 2024, Anthony PERARD wrote:
> > So I guess `sed` the output of `expect` will do. Maybe put that in a
> > script that also call the expect script? (To avoid duplication, and help
> > with maintainability of the whole thing.)
> 
> I tried a couple more times with expect but couldn't get it to work.
> With sed it seems to behave correctly. Can you guys spot any issues with
> it? If not, I'll send the full patch.
> 
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/7627376496

That job looks fine to me.

> diff --git a/automation/scripts/qemu-smoke-dom0-arm64.sh b/automation/scripts/qemu-smoke-dom0-arm64.sh
> index 0094bfc8e1..e0cea742b0 100755
> --- a/automation/scripts/qemu-smoke-dom0-arm64.sh
> +++ b/automation/scripts/qemu-smoke-dom0-arm64.sh
> @@ -109,4 +109,4 @@ export QEMU_LOG="smoke.serial"
>  export LOG_MSG="Domain-0"
>  export PASSED="BusyBox"
>  
> -./automation/scripts/qemu-key.exp
> +./automation/scripts/qemu-key.exp | sed 's/\r\+$//'

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

