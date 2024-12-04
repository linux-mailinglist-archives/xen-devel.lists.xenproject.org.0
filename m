Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EA89E3C2F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 15:08:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848576.1263425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIq2h-0002F9-SO; Wed, 04 Dec 2024 14:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848576.1263425; Wed, 04 Dec 2024 14:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIq2h-0002Cn-PM; Wed, 04 Dec 2024 14:07:51 +0000
Received: by outflank-mailman (input) for mailman id 848576;
 Wed, 04 Dec 2024 14:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jaeH=S5=bounce.vates.tech=bounce-md_30504962.67506230.v1-c9fb72217ccc4995aaeed03a349a81c1@srs-se1.protection.inumbo.net>)
 id 1tIq2f-0002Ch-Rm
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 14:07:50 +0000
Received: from mail180-27.suw31.mandrillapp.com
 (mail180-27.suw31.mandrillapp.com [198.2.180.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22315ec5-b249-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 15:07:45 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-27.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4Y3K9D0fBJz6CQQJm
 for <xen-devel@lists.xenproject.org>; Wed,  4 Dec 2024 14:07:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c9fb72217ccc4995aaeed03a349a81c1; Wed, 04 Dec 2024 14:07:44 +0000
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
X-Inumbo-ID: 22315ec5-b249-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1733321264; x=1733581764;
	bh=8t8U+zgJZtjkj5kbEmTvYvbrqtJ0B+UOcaKS+uPHTwA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Kkq+WcAxE1t0ekfNV9Rpx1E3Am0kypqX1/X/mm+soY/9j2sKGMjj0tk+ZhzQXtzpm
	 /Ogca7bH6ndLDZMuxCz7JdTRB/nQbx/A+TA0KSCx2MLx5gDibNssvtz5I29ZkGI3H2
	 1MTXCe/n+C84ZrqTI3ZslZhf9tl0qM9tKUPsTb3zsm0y3lNy3AjvdhwHSTLvJ/7deJ
	 mNO99CIV04PS0jXfq3ujzR/jk40D6WIINOIMAiyzBdw8IaHkZThboEkNjXz701HL9U
	 7xfUqHk1/srvtzxIWCozEDbxFZUDuQdP3n47KMoxYZVka+7ZhTJClWSncDTiTE4p1d
	 zjVThhG7SFT/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1733321264; x=1733581764; i=anthony.perard@vates.tech;
	bh=8t8U+zgJZtjkj5kbEmTvYvbrqtJ0B+UOcaKS+uPHTwA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1EeQIKbXBQmeDGzGukAJ+aesdDpasHBCrOo9sO8/TZfEGPyXU3/3t2HDMWYqPI3QY
	 R3zMGVeVplqL9Cy0pK8y2+kRHD8z3r2cpnXNnMs0ZbxDZGKLeLt68eK4k5tJPCfJZU
	 B3wjCxUBqTaysTIiWzrB5JUY7mTdaY3FDsBnA08tzeCO5SpX/p2Ms6JvFQOynir3A7
	 OD9y967/+/CVyS4q0wEeT/8Ua2s5tUTyD3n/dEBqnLKMr9dlnXne8WgMs7Ul4AtTB/
	 Tv2UTpGooaH+c+OJ6KPoG1XoCKYdT5mYYEF3SSVFuZOnTAf0ovycrbOslEwba7Y9lA
	 OE2dpVqLQLv8Q==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v11=2006/12]=20tools:=20add=20support=20for=20cache=20coloring=20configuration?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1733321263150
To: "Carlo Nonato" <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org, andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech, "Nick Rosbrook" <rosbrookn@gmail.com>, "George Dunlap" <gwd@xenproject.org>, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z1BiLvkBxgoPgl7F@l14>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech> <20241202165921.249585-7-carlo.nonato@minervasys.tech>
In-Reply-To: <20241202165921.249585-7-carlo.nonato@minervasys.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c9fb72217ccc4995aaeed03a349a81c1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241204:md
Date: Wed, 04 Dec 2024 14:07:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Dec 02, 2024 at 05:59:15PM +0100, Carlo Nonato wrote:
> Add a new "llc_colors" parameter that defines the LLC color assignment for
> a domain. The user can specify one or more color ranges using the same
> syntax used everywhere else for color config described in the
> documentation.
> The parameter is defined as a list of strings that represent the color
> ranges.
> 
> Documentation is also added.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

