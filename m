Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53735962DCE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 18:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785016.1194442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLgs-0003sS-7p; Wed, 28 Aug 2024 16:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785016.1194442; Wed, 28 Aug 2024 16:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjLgs-0003pA-4I; Wed, 28 Aug 2024 16:38:38 +0000
Received: by outflank-mailman (input) for mailman id 785016;
 Wed, 28 Aug 2024 16:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXF/=P3=bounce.vates.tech=bounce-md_30504962.66cf5289.v1-da54c3286194458496dd3f8169c1f6be@srs-se1.protection.inumbo.net>)
 id 1sjLgq-0003op-6O
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 16:38:36 +0000
Received: from mail187-32.suw11.mandrillapp.com
 (mail187-32.suw11.mandrillapp.com [198.2.187.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77c76f2-655b-11ef-a0b0-8be0dac302b0;
 Wed, 28 Aug 2024 18:38:34 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-32.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Wv98T2sbBzQXg3by
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 16:38:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 da54c3286194458496dd3f8169c1f6be; Wed, 28 Aug 2024 16:38:33 +0000
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
X-Inumbo-ID: f77c76f2-655b-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1724863113; x=1725123613;
	bh=Vfw4UjiIvn5BMezQQ2ACcscxr03OJTFE65zr3iU6S+U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aMc0CDJmaQ1h6U0J5Qre0/9oXdv+RvLrY/VggU1Ep1dpvVObpsMUKirD+6POSSDMR
	 2DuxfWEOhkurBxclqMGbER1bQ3flrG7Gp+/9joU5ijyCtbqmOyfU7uCYEQtyzwLCWL
	 kl1L1vdxXg+/8CG5gwIbEXlMOcypWrDJ6pzT7Ekswb3WqEcGsCC+fw55xoi1X2pbXq
	 noPm8UvevbPrx7VFNu4Yhd0uVOfswAIYTr4SHc+kFhHLPOti3iWI5rfeJqrHvZjlM5
	 0FOruUoCUwamFcJ37GRejictd3mP7OYKqxHzkOY0n1xVSFKytTBk/6e6wldmuX6wVS
	 07Xy8WqGWu4IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1724863113; x=1725123613; i=anthony.perard@vates.tech;
	bh=Vfw4UjiIvn5BMezQQ2ACcscxr03OJTFE65zr3iU6S+U=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=JBXGOSxSgEljhpXduvKLV7lAr5IJTcXAEDItqnyEZkKLqKulr7YM8hf+OThrcjIYl
	 M9V6FPzysiZNm5gZDgV/wv9RHQS30Bw/K9FHNrUSh6CQTkw/DR6og0pC8nEOhZse8R
	 1YdXKXj7XMcdiM999rNI8iSD96BQQdNn3BVBd12iaODJEVzWP9DcrCbgNU8B3mORNH
	 Dk+D9dNK9rHr29I+yDMNeUJwnr2UUAVTRpQ5sCfF4EL9b+0I0EKk/oVjPwCnyDI+Hq
	 9CmHYUV8SXenrmtGpHDD6oShMxBHC6/vLwlNZcT9lQxbRGKgadO79ZlDgrHLIvjzyt
	 utlXLPCI2+k9A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/3]=20Update=20Xen's=20features.h=20header?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1724863112535
To: =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Message-Id: <Zs9SiEQtWIsvlhXk@l14>
References: <cover.f5d45e3c2fb87552abfaf80982b0b724fca2134c.1714955598.git-series.marmarek@invisiblethingslab.com> <e167b362448dc3abc677f3b925a58c55d6158da7.1714955598.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <e167b362448dc3abc677f3b925a58c55d6158da7.1714955598.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.da54c3286194458496dd3f8169c1f6be?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240828:md
Date: Wed, 28 Aug 2024 16:38:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2024 at 02:33:21AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Update it to get XENFEAT_dm_msix_all_writes for the next patch.
> 
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


