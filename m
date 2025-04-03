Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC923A7A340
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 15:00:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936807.1337963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0KBP-0007ti-VD; Thu, 03 Apr 2025 13:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936807.1337963; Thu, 03 Apr 2025 13:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0KBP-0007rS-SR; Thu, 03 Apr 2025 13:00:35 +0000
Received: by outflank-mailman (input) for mailman id 936807;
 Thu, 03 Apr 2025 13:00:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cGow=WV=bounce.vates.tech=bounce-md_30504962.67ee866f.v1-1f748e6c7f4c4a6c8618dfa17ce7b8a8@srs-se1.protection.inumbo.net>)
 id 1u0KBO-0007rM-AH
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 13:00:34 +0000
Received: from mail180-44.suw31.mandrillapp.com
 (mail180-44.suw31.mandrillapp.com [198.2.180.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff7d80d-108b-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 15:00:32 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-44.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4ZT20H0W9Vz705bZH
 for <xen-devel@lists.xenproject.org>; Thu,  3 Apr 2025 13:00:31 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1f748e6c7f4c4a6c8618dfa17ce7b8a8; Thu, 03 Apr 2025 13:00:31 +0000
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
X-Inumbo-ID: 9ff7d80d-108b-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1743685231; x=1743955231;
	bh=PtWh1hVlkS5h3kJsg3a8eQ616S5HQJRll+KdsJj75oE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AqSV5kMjyzO63F04rzzSsMIVZQPGdqbeGk6m7JHh3HBUXyASlzgQh4niSGbp3+zed
	 SUFt4KtIvOC5yl5cs469gotkdIq9CFIgzQBoiXFjTiMtFJp1VwCfKrQU+MqpTQWyFQ
	 yYx1rJbEEmH33jEZttVndMQ8MYKeJwKyRArrUJv1nT7MTE88x6svx1T69Q9nO1uIzh
	 MCQzbtpn5hOlkFJYM4QCjsLYvbdg5dZ+2PAuKKDFLdFAmYs0EMb3apiRRRjEkkbtL4
	 5w3mmTnHzGYsCcj6mUE01sDM84k8HPN6zZxVI2rh1K4nZs3bbI1sB2xE5Grukb7tNv
	 VZ+7M3BXrM6oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1743685231; x=1743945731; i=anthony.perard@vates.tech;
	bh=PtWh1hVlkS5h3kJsg3a8eQ616S5HQJRll+KdsJj75oE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jcl4unUa/oe2vYQkJ30Iwe4nQLfX6BOTEwq7v5XyE817lJwOLpypSD7civAq05Q4J
	 tb9WYJKuHjSPMB9wXb10NzvByte3E32D7PeDu+86esy+NAyw2PQ7yKnM1cQentsr7N
	 yGSIdGw7JaRy8nf7AHGootXkd7aLtrjF9+8jhht/6w5s2to+k7IFRVqGBjqPM1+p31
	 DOiE0nAcpKWEQMjRfUe1aivqKoVjCNYFkD0mjYPGxuBctOF4nNVjkoxXl0/hfhx0WJ
	 H093QEsqELs4P9+GW1j5P+VeGos/f4AC+8Qu/B6w3ZLuxj4hJ4MVq1hwQw9FLGxwV1
	 K9dLRTkGmvEhQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86emul:=20replace=20=5FBYTES=5FPER=5FLONG?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1743685229930
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <Z-6GbdlgaZ7fDPPs@l14>
References: <09082f8f-5c1a-43c9-9b84-19d832e0849d@suse.com>
In-Reply-To: <09082f8f-5c1a-43c9-9b84-19d832e0849d@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1f748e6c7f4c4a6c8618dfa17ce7b8a8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250403:md
Date: Thu, 03 Apr 2025 13:00:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Mar 31, 2025 at 05:52:27PM +0200, Jan Beulich wrote:
> We can now easily use __SIZEOF_LONG__ instead. For this to also work in
> the test harness, move hvmloader's STR() to common-macros.h.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

> Quite likely libxl{,u}_internal.h's STRINGIFY() could then also be
> replaced.

Sounds good. It seems the different between STR() and TOSTRING() is that
a comma can be use as well with STR, so not really a useful difference.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

