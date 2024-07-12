Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8503692FC4F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 16:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758099.1167365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSH0K-00082d-3F; Fri, 12 Jul 2024 14:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758099.1167365; Fri, 12 Jul 2024 14:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSH0K-000809-0d; Fri, 12 Jul 2024 14:12:08 +0000
Received: by outflank-mailman (input) for mailman id 758099;
 Fri, 12 Jul 2024 14:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rKSG=OM=bounce.vates.tech=bounce-md_30504962.669139b3.v1-d250148758eb4f20a45a0fcaae91c8c4@srs-se1.protection.inumbo.net>)
 id 1sSH0I-0007zg-C2
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 14:12:06 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6cc0a9f-4058-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 16:12:04 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLD772SdBz6CQMXk
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 14:12:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d250148758eb4f20a45a0fcaae91c8c4; Fri, 12 Jul 2024 14:12:03 +0000
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
X-Inumbo-ID: b6cc0a9f-4058-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720793523; x=1721054023;
	bh=zUf8IJ98RBbfuL9bWmPkHqfQfO6wzPoBTwCCDGE9j40=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=StfktHdECR84defG4hyVkT4gwP9jEWpgEynCh+07B4stDJLLjRmrOjrVxaj33T0HF
	 XC62eNtU4uatojWcpEGhr63uRQPoQAqyb5Iqg4TlB5zE+uqPaHTGQVlZAj6/vtdnFV
	 Qgca3qZPf3h6UC5NugL0aHNMepkEhiNMuJl+ctF/1d4P8PmNO6GW3x2RY5ZlX2UQsn
	 PDL2MeD+aPjuyrmfTnZsK2b8kHP0erxusH1UrxhvLkbu35Zdn3tXolBaCu218ON1Nf
	 VuyrG/ujVdgVXRdJYWO7q67lDm2QV8GSmU8sEEcsoVCtm8/CezOjrb4Z1nKHASH5Oa
	 IPiyAIyODSW4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720793523; x=1721054023; i=anthony.perard@vates.tech;
	bh=zUf8IJ98RBbfuL9bWmPkHqfQfO6wzPoBTwCCDGE9j40=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Oxjkb7wNZkZv8yJB6S+hvgyVA2r/FIHmUW6g4a8T5r2JLDbRKg+KwNp6vFHLa0gSo
	 S2c+wlqIafOXYAPwm47vDmYONtnSpn/eqkqwZ609fEDZxgcKXpwIWW/vn0wWMXVOb5
	 2hUZOHykr/gmEztAj6sIcVYXogBjdjZoRxvviYQ3w8LYAUcbs9NwER8bIM4YqLugxG
	 g1sGEwnZyKVGV5FQdZSFE/tieckxuXPhXjMpR5P9Kk/GhL1Eq0yBJSwjkd6OTpNwHD
	 8W9Vtbqmiqwgs2Uw121IH9wMcBqC04zWIUubdpmte++e60ijjsO4rvsTSFpgWGXMqu
	 YMMV5Dpi6iwOw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2016/12]=20CI:=20Refresh=20Ubuntu=20Bionic=20container=20as=2018.04-x86=5F64?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720793521990
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpE5sSKfNaQmBQcc@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240712104842.3237603-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712104842.3237603-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d250148758eb4f20a45a0fcaae91c8c4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 14:12:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 11:48:42AM +0100, Andrew Cooper wrote:
> As with 16.04 (Focal), except that ninja-build is available so QEMU can be

                 ^ Xenial

These names all mixed up after a while :-)

> built.
> 
> This halves the size of the container:
> 
>   registry.gitlab.com/xen-project/xen/ubuntu    18.04-x86_64           860MB
>   registry.gitlab.com/xen-project/xen/ubuntu    bionic                 1.44GB
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

