Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3559318D9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 18:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759136.1168810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOxV-0001ji-6F; Mon, 15 Jul 2024 16:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759136.1168810; Mon, 15 Jul 2024 16:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTOxV-0001hZ-3i; Mon, 15 Jul 2024 16:53:53 +0000
Received: by outflank-mailman (input) for mailman id 759136;
 Mon, 15 Jul 2024 16:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzxU=OP=bounce.vates.tech=bounce-md_30504962.6695541b.v1-1b53374b6cbb4c9c80dff4ce05751766@srs-se1.protection.inumbo.net>)
 id 1sTOxT-0001hT-BT
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 16:53:51 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce42bb31-42ca-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 18:53:49 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WN7ZM4lQPz6CPyKp
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 16:53:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1b53374b6cbb4c9c80dff4ce05751766; Mon, 15 Jul 2024 16:53:47 +0000
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
X-Inumbo-ID: ce42bb31-42ca-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721062427; x=1721322927;
	bh=P6SEnbZd/odoYl5abbfmQNDDIlQVEao/1tXgtnbaZpw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hbFj4j8bAxoDE/dxkp8OAZBGCFQ3qG+29uVc0LqqvPNakaBJHWWfzVrDPqdPWXvqO
	 fFpXOryExG13CxdXUmAxlzW0pnHC7hl9ep5c2oO6d0ZMyT4Qxai0nYwHOQQ/H6mqKo
	 0sk2Ycz0kMMvrzaTitpsRuBuOY5X/Vncpt/9JiXNmfLSzTNxzo1mT/CgYHHFOsF0nY
	 rTZumaLFKsEEYWiXWViMPVn94TmJTxZiq4ABTpR5kDoF4KO71E82vlHzoIm03LwWAZ
	 KeIsu40gdqs53zFI6Ol4t+n9ctiL/gCHRUyPbwnIWqpHzEScD36LrQH4GHvH9+SghN
	 05MfpQw9I67vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721062427; x=1721322927; i=anthony.perard@vates.tech;
	bh=P6SEnbZd/odoYl5abbfmQNDDIlQVEao/1tXgtnbaZpw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PPenwSiVieQjZ6h+XHqadqWCRG98xU9WSQ8xVtx6ppzcx3JN0szY1l3nMrkFu2XoH
	 No1Q6qsYoHdFojkb+jo2nOEhDfg/YDVjWPzLC3NVBl0TtM47wpGpgeoQnWOqjwr1JJ
	 cSDDqHre7APyo39F3eQ75WO04O4Ia6d/e3NGVZL2ws+osDQhNufitwMEo1c5SNN2MA
	 2PWxmTdWgp5uZmIPzlTqS9JtX/eGfZa7z2Uj9PRf5+/+il5/QP+Iq6UHa4iOKf0Zmo
	 9bQHRiN8gsBg4NE9Nac9FkPOhWa4EiUzKNwN62eOa7578444UZ2MRi4gzMPZ9nJsGr
	 QHTP8op27grlg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2022/12]=20tools/examples:=20Remove=20more=20obsolete=20content?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721062426302
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZpVUGYOHHekE+zMh@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240715151640.3374005-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240715151640.3374005-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1b53374b6cbb4c9c80dff4ce05751766?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240715:md
Date: Mon, 15 Jul 2024 16:53:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 15, 2024 at 04:16:40PM +0100, Andrew Cooper wrote:
> xeninfo.pl was introduced in commit 1b0a8bb57e3e ("Added xeninfo.pl, a script
> for collecting statistics from Xen hosts using the Xen-API") and has been
> touched exactly twice since to remove hardcoded IP addresses and paths.

Xen-API, is that xapi?

> The configuration files in vnc/* date from when we had a vendered version of
> Qemu living in the tree.

I guess QEMU at that time didn't have VNC support? Because looks like
the vnc config was supposed to be put in a guest, and `xm` had support
for it.

> These have never (AFAICT) been wired into the `make install` rule.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Anyway, patch looks good:
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

