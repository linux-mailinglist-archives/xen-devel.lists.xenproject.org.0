Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759C1A8447F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 15:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945743.1343874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rnl-0007rp-6n; Thu, 10 Apr 2025 13:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945743.1343874; Thu, 10 Apr 2025 13:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2rnl-0007oh-44; Thu, 10 Apr 2025 13:18:41 +0000
Received: by outflank-mailman (input) for mailman id 945743;
 Thu, 10 Apr 2025 13:18:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JM3A=W4=bounce.vates.tech=bounce-md_30504962.67f7c528.v1-165dad14e1c64a94bc5d8010f40c8b49@srs-se1.protection.inumbo.net>)
 id 1u2rnj-0007oL-0a
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 13:18:39 +0000
Received: from mail177-19.suw61.mandrillapp.com
 (mail177-19.suw61.mandrillapp.com [198.2.177.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d35ec4d-160e-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 15:18:33 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-19.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZYL3r1dMgzC1l
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 13:18:32 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 165dad14e1c64a94bc5d8010f40c8b49; Thu, 10 Apr 2025 13:18:32 +0000
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
X-Inumbo-ID: 4d35ec4d-160e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1744291112; x=1744561112;
	bh=/yGmZoN0z6V/sePjciCXauSVwQvj2yNmrkLbjlUZOjk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=aCqmPeUDwFn3/xVJG0gD2OUZD+q1KNx8gbC9TN6PdbCyPUFuo/o62Xm55ExIU6jeM
	 faZNNKIg4i0Qy5W7OCQW2KAaHNWFVNcur3bqBkrjp26LZsHDIMCU+d2Sc1Yuk0dx3+
	 8arMveZGgJrPQf/uB91omJbhX8R8UufcwuNO3z2IdPkNEctofizfRJTNTRIDTZ+BSy
	 PZZY3F+EyOs3RiL2/6y35i4Z3VoPNXJvjSlKTEojZApGXOBNF1eQrJHHXnQWpvlRe5
	 SyKNuWoQaZeHwfCrcE0ZezFtjMYjH3ATVaprtczPPTW0CubTkUghn3gTrNHoV59foh
	 eAO8KhBj1k5fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1744291112; x=1744551612; i=anthony.perard@vates.tech;
	bh=/yGmZoN0z6V/sePjciCXauSVwQvj2yNmrkLbjlUZOjk=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gypWrjgXMzDuLRSkssMVMeE15xaF20mXoa3dIKW+nZK+chGuOt3uuxg4F7dm5akTk
	 f/g+Jgn+q7YzExg3SUWHU0dh8Z6cRIdUuGwEos7QJREaaxewlm96YFIlmd4VI7kELw
	 dvMxHDUMcrm5HXiWSuQnf9AiIBKAEpQwlk9UDfpNKtz10nWk2YzN/7R4w0hp0O5jdp
	 dfY/QW155ok1l4vNX6yd8AVZr0cA5WfKpwdTsI3e5DjLIuwSNKURKfcRfmt5HLFNEQ
	 LKCenz9/eYJSQ0g8YdYMPQToFW1vPX5PznKeJJo/sS21nRwlBJCvZ7328r92SZjf4T
	 6YdrwxRJQOhzQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/6]=20Port=20containerise?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1744291110608
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Michal Orzel" <michal.orzel@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <Z_fFJncpp9_25JSV@l14>
References: <20250410114628.2060072-1-andrew.cooper3@citrix.com> <20250410114628.2060072-2-andrew.cooper3@citrix.com>
In-Reply-To: <20250410114628.2060072-2-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.165dad14e1c64a94bc5d8010f40c8b49?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250410:md
Date: Thu, 10 Apr 2025 13:18:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Apr 10, 2025 at 12:46:23PM +0100, Andrew Cooper wrote:
> While it pains me to keep the wrong spelling, do so for consistency.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



