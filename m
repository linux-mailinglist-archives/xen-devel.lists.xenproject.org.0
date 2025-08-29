Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F9B3BD05
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 16:00:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101457.1454526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urze5-0001xl-B2; Fri, 29 Aug 2025 14:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101457.1454526; Fri, 29 Aug 2025 14:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urze5-0001vh-7H; Fri, 29 Aug 2025 14:00:01 +0000
Received: by outflank-mailman (input) for mailman id 1101457;
 Fri, 29 Aug 2025 13:59:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybbg=3J=bounce.vates.tech=bounce-md_30504962.68b1b25c.v1-ddf99863b663417988695163812732b3@srs-se1.protection.inumbo.net>)
 id 1urze3-0001vZ-Md
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:59:59 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e5366b-84e0-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 15:59:57 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cD0JX0nKczKsbXM9
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 13:59:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ddf99863b663417988695163812732b3; Fri, 29 Aug 2025 13:59:56 +0000
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
X-Inumbo-ID: 71e5366b-84e0-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756475996; x=1756745996;
	bh=Qh6Kj/etTCT+4I4zZbOCaJjPaHBfztd3pkvoO9utYqg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eeHG2c7iC0yt+5rRJI5Rohb4J6yJH9nJLFsLcbnna/h2tW1BzLaDOA+PKv86dUMR1
	 fiEDw3+hoToVVXpvIxBjkVjJCiNSgWrludg5/qyQ/aAV2ZwZDDNYih0PtUv56SJXTl
	 os5/wwc9qAgG1whAhj5vTN+CVsd0r4cJn3qjeilJYClNYIAGDW/3xj6m3OH9AEIXl6
	 dQ+vvm53YPKpCsAuCUpc2Kx5tBJwChJUbPnMAU7BoQRZT7P0p0Hl3EzKTUJCpjjT/P
	 JBO+vczSYncdyEEm/acI3glYlqZnUvvZUBaRtCmUDXJ0kaDIYeBd9sVWyCE+GVAp6H
	 CN2H/YmshQkUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756475996; x=1756736496; i=teddy.astie@vates.tech;
	bh=Qh6Kj/etTCT+4I4zZbOCaJjPaHBfztd3pkvoO9utYqg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=mPLDiPZmsuvVZs9OjZbU4K+fGHA+S6k5dl7M41iaEtYJMJqluZuzm3pCuoNKST0bQ
	 K1AaRt6tYSb6IGP78TfJDn5Tty+YqNl8wekeTmmHkUxejIXSlIaDjVgKkBKHWq9pxr
	 HysbTHIThpsbwhgfKFGiPO+OBuClebaB3xM+/YIp1H4Cu4b866o2Z534p2eEhaXF0j
	 B45vPDGdX3cGdtVYM9cftEccV7FVrWiwtTzF0JJTAaPk4kyLBZjSQQWuNEvFvehOX1
	 jNOr8TwbiGY8xgEwN56XLpSIMtBWifB5+xrGb+mXD0ukjXY0PnyepZO/pR5bYvSbX2
	 SrJohSthLyFSA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=205/9]=20docs/x86:=20Introduce=20FastABI?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756475994874
Message-Id: <c5e62944-d519-4931-af20-1a737099148b@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1755785258.git.teddy.astie@vates.tech> <64800d22220f31bf052713ce61ecedeaa8a36b6f.1755785258.git.teddy.astie@vates.tech> <2fcdb264-15a3-47f7-915d-83d1c1e06765@suse.com>
In-Reply-To: <2fcdb264-15a3-47f7-915d-83d1c1e06765@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ddf99863b663417988695163812732b3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250829:md
Date: Fri, 29 Aug 2025 13:59:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 28/08/2025 =C3=A0 14:35, Jan Beulich a =C3=A9crit=C2=A0:
> On 21.08.2025 17:25, Teddy Astie wrote:
>> FastABI is a alternative ABI designed with performance and coco-enabled
>> guest in mind. It is register-oriented instead of refering to C structur=
es
>> in the guest memory (through a virtual memory pointer).
>>
>> It only focuses on kernel-side hypercalls, it doesn't aim to provide too=
lstack
>> operations.
> 
> And even there it excludes certain pretty relevant ones, like many of the
> gnttabop sub-ops. As alluded to by a reply to an earlier patch, I don't
> think having an ABI for just a subset of the hypercalls is going to help.
> 

Many hypercalls are missing in current RFC, including the grant 
map/unmap ones. But a part of the idea is to still having some 
hypercalls out of scope (mainly legacy and toolstack-specific ones) to 
reduce the complexity.

> Jan
> 



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



