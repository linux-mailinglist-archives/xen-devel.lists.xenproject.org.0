Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23F9A27C8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 18:01:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820737.1234330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Svs-0001EV-KX; Thu, 17 Oct 2024 16:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820737.1234330; Thu, 17 Oct 2024 16:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1Svs-0001Ct-HE; Thu, 17 Oct 2024 16:01:00 +0000
Received: by outflank-mailman (input) for mailman id 820737;
 Thu, 17 Oct 2024 16:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=soIK=RN=bounce.vates.tech=bounce-md_30504962.671134b6.v1-3269ddf0e1504209a556bf261eed95cc@srs-se1.protection.inumbo.net>)
 id 1t1Svq-0001Cn-Sc
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 16:00:59 +0000
Received: from mail186-28.suw21.mandrillapp.com
 (mail186-28.suw21.mandrillapp.com [198.2.186.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe180603-8ca0-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 18:00:56 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-28.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4XTsxy6RqXzMQxdJL
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 16:00:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3269ddf0e1504209a556bf261eed95cc; Thu, 17 Oct 2024 16:00:54 +0000
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
X-Inumbo-ID: fe180603-8ca0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729180854; x=1729441354;
	bh=sBknxU3qx6lJYsXJtc0shHOmOTxFkXuKMSShxe3dFks=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XDI3hlHshQqfziBDv8LD5czS9yA5zqhLcFs90uDhIfFz/srdabdZbTRLh7/G/jOd/
	 JgnoEe1+IqWCl/pVFuBgigIjd+Eeq+Zl8Im560LoQ82/2dblFKZKA9xQVjJ1Yb7i6d
	 /BBGWwsE4t3VQUq3uXj/OSPTd+vg101H0AltjAGSPVxehujNcz2tREeEbZ1s4ltruf
	 O5ylErSvP4FFQpMtFL/et5WEHhPC9aq9ge+KcYraISmGpix0aSERisyuUzpNed71pQ
	 fodnbsNqIkCy83aEsfEFHtryOo5WhGv7MaUuNqFlew2EcicIjGETWb4bzBMjjrZL1u
	 P3pfQpu058CFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729180854; x=1729441354; i=anthony.perard@vates.tech;
	bh=sBknxU3qx6lJYsXJtc0shHOmOTxFkXuKMSShxe3dFks=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Clx9Ufm0pf7fPXNHzpAfRoTukxjUuZOwVp9grodQLjcR0/GB+eFpzPfd8RRIw4Mx2
	 UtBkRp8e7RVcCseMTAVtKNRzN+sH+J0qJwGeFEVJtbtT1FWfwUsEU/T4QVmR1GH1hD
	 jis/oqECphCCcGN9gX+qnc2d2sNNfuljjjkeR8NcRFbJG9xGcVr9M5yp1KilEXebDe
	 HO+oibzNfvoPXfLbF2sNQknD7tFfje3Sjp4+Ossfc/t63PhfRTwEXHlWsS0M8mH49v
	 mdagw9qylX6f3ZxhwsWNZ+psYmerhSm8xuYusYwRe6vzo0nQ8WCu5sa9JGCG6A+GqX
	 wN+70DoWEKHpQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v6=201/5]=20x86/boot:=20create=20a=20C=20bundle=20for=2032=20bit=20boot=20code=20and=20use=20it?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729180851602
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZxE0slUwETDK83PD@l14>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com> <20241017133123.1946204-2-frediano.ziglio@cloud.com>
In-Reply-To: <20241017133123.1946204-2-frediano.ziglio@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3269ddf0e1504209a556bf261eed95cc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241017:md
Date: Thu, 17 Oct 2024 16:00:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> +$(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
> +$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL

I was somehow expecting "base" and "offset" to be the other way around,
but that's fine. And by the way, -DFINAL cancel changes to GAP and
TEXT_DIFF ;-).

But overall, the changes looks nice as is,
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

