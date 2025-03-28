Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BE2A74BFE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 15:06:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930851.1333405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyAL7-0002qh-Qz; Fri, 28 Mar 2025 14:05:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930851.1333405; Fri, 28 Mar 2025 14:05:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyAL7-0002pF-OC; Fri, 28 Mar 2025 14:05:41 +0000
Received: by outflank-mailman (input) for mailman id 930851;
 Fri, 28 Mar 2025 14:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ULsg=WP=bounce.vates.tech=bounce-md_30504962.67e6acaf.v1-40f914e8a9b4441b934ace9a05736ea7@srs-se1.protection.inumbo.net>)
 id 1tyAL5-0002p9-RL
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 14:05:40 +0000
Received: from mail187-9.suw11.mandrillapp.com
 (mail187-9.suw11.mandrillapp.com [198.2.187.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8dc65fe-0bdd-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 15:05:37 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-9.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZPMk76gy8zK5vgTF
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 14:05:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 40f914e8a9b4441b934ace9a05736ea7; Fri, 28 Mar 2025 14:05:35 +0000
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
X-Inumbo-ID: b8dc65fe-0bdd-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743170735; x=1743440735;
	bh=+7/yrXPCmk4SQlg+1Z7K/AhR8Yvg9xZwFTZo8UyerQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=FJjA6ek/7+h7e+ynVpM8QLnu0i1dvii4ES/mLMn830o/5aT8DVLOlNVP2fATnnYGp
	 h62xkgQlVYj2Ku5s4uBSti0jIfcVBB1FV+q8l4juZUMbw3gYi+c44COGGCwhmt3TDn
	 JZAz1HBzV0f8hE4v3/pujxh8Gy0JLcOs95vLZn+V7ZhRHO8D3jQNVQF6J3Xo/fKuLR
	 4WdgRxb6ng8aaPJjtz6RssPbNwTaMBArm0zZMPXiB2lCYVLU9nFr+rdiuYQlGxRuJZ
	 1PYIB/9HhIN9ieJHXM80iJsJB6JqqEa9huArqzKATtMBrmpZdx4zlFbSo6YDvwiW+Q
	 mY2fz42QlA9sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743170735; x=1743431235; i=anthony.perard@vates.tech;
	bh=+7/yrXPCmk4SQlg+1Z7K/AhR8Yvg9xZwFTZo8UyerQE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1NW0eEW5RNfeE2l8A/nkSPaobLoUbE44t0VnRdb80Crl/pE4xB+zb3xUkDAlnOh5Q
	 5ZNxRld2zZY/g6OoWHlVepA3vAdWhC3u996Pki4nfENeDxuMXwT3f8P3yB93jiAuZv
	 pZxyRza4CMe+hnhdUIauT0KqMUV4YXtu3/77erwM4idTX4PxqZhr6dRY647ZaVjDlP
	 x4MAtjQY5YlufxW4ECr25UT9v5EKGWVKTGBsZfmT3aEl5O/ob3612IANWO8ytMY9ES
	 u5OAdvrM2eXT8MVT4Deu8/jBhfu+vnMqapVN+eznx3xqbDDWM6T6cQBuC1zKBua4wj
	 YgUlRrAFgDlcw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20Xen:=20Update=20compiler=20checks?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743170734410
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z-asrZ6OuK2lHJ_C@l14>
References: <20250327174302.412821-1-andrew.cooper3@citrix.com>
In-Reply-To: <20250327174302.412821-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.40f914e8a9b4441b934ace9a05736ea7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250328:md
Date: Fri, 28 Mar 2025 14:05:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Mar 27, 2025 at 05:43:02PM +0000, Andrew Cooper wrote:
> The $(eval $(check-y)) is badly positioned:
> 
>   xen.git/xen$ make
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>     HOSTCC  tools/fixdep
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   make[1]: *** [scripts/Makefile.host:108: tools/fixdep] Error 1
>     HOSTCC  tools/symbols
>   *** FATAL BUILD ERROR: Xen requires at least GCC 0x150100
>   make[1]: *** [scripts/Makefile.host:108: tools/symbols] Error 1
>   make: *** [Makefile:610: xen] Error 2
> 
> It is involved every time Config.mk is included, rather than once per `make`
> invocation.

It's worth than that ;-). $(eval $(check-y)) doesn't print anything, it
actually replace $(CC) by something that just print this error message
and thus refuse to build anything. So even if the eval was only done
once, you'll still have this stream of error message.

Anyway, is this check still useful somehow? Or could we replace it by a
check in ./configure for the tools and one in either Kconfig or
"xen/Makefile" for the hypervisor?

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

