Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E663A13A9E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 14:13:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873583.1284590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPgi-0001Ev-60; Thu, 16 Jan 2025 13:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873583.1284590; Thu, 16 Jan 2025 13:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPgi-0001DI-2u; Thu, 16 Jan 2025 13:13:32 +0000
Received: by outflank-mailman (input) for mailman id 873583;
 Thu, 16 Jan 2025 13:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Vl/=UI=bounce.vates.tech=bounce-md_30504962.678905f6.v1-b58ca62c75f04763b5700872826744ff@srs-se1.protection.inumbo.net>)
 id 1tYPgf-0001DA-VK
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 13:13:29 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac507679-d40b-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 14:13:28 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YYjwk4tNBzBsV52b
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 13:13:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b58ca62c75f04763b5700872826744ff; Thu, 16 Jan 2025 13:13:26 +0000
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
X-Inumbo-ID: ac507679-d40b-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737033206; x=1737303206;
	bh=JV/iMG/hrEsDwBsWn+9dUNxeR47ZvBedy3wUovrLXPE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yL0oVFxH9+kL0HK7o/8TUJdEaEpTGV2Ywml1OyIis638YfxJLKxDXll8O0HBfSsP5
	 EnRnRKCAhH/dbA7jFx5sWgmI/9r0sx0cQ1BU8ErUV+JKrlPTFYwSlgBIT4zSV8rGf9
	 gCpEmpq5s9XL1lDQTzG+Y4S26azuQIA2zBA0BHsJ+PSbRxwUPIlGbMJuCfc/ixkcbJ
	 6GyDYl6FZzwKRt3J9IAmt8nB+515RJolLJ0DYlcG5U6uspfclDomXV7h8E9bNaj3MN
	 +Z33ukupEQ6k37oDf/baLRpfNpLzSaRhTlSp/pZsp+ck+pjSp3dfHws8hajbkHYmtT
	 YxhUeE049KjzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737033206; x=1737293706; i=anthony.perard@vates.tech;
	bh=JV/iMG/hrEsDwBsWn+9dUNxeR47ZvBedy3wUovrLXPE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nDSMxCNRbOJkgHFW6f7Big76UEIsUNP7OtGf7aHgXYVw6NjdbuWP4fZ/VGhdqMOXA
	 7VaPQllCB1mCS/xhbcwe4uiEdxZT5KVVBOEgUV6Lk6Pfwq4lO9wE4jA6Uvco194nlX
	 o0CCfLdubevptp99V2BC1WgMMxz88Lnp1oOrnJwr7SsBlhIuHFFPgq8oDWskCl98ZI
	 kmlo7SmMS2Z9ATTXRRQWOjVWwRzIbzzfafbYqyFd+eLNmmxQ84D67Gw4MI+gw078R5
	 +qsL78+8yz8zIwkLLLzudRjN9NKkQDYwN/PZf7NwZ+Xaj3jmHReA9YyOfBiD+3OCFD
	 NyJA8TazXlVQg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20xl:=20properly=20dispose=20of=20libxl=5Fdominfo=20struct=20instances?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737033205722
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z4kF9aniy2JoP1ie@l14>
References: <4460f13b-03bc-4ca0-aa97-facde3122be4@suse.com>
In-Reply-To: <4460f13b-03bc-4ca0-aa97-facde3122be4@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b58ca62c75f04763b5700872826744ff?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250116:md
Date: Thu, 16 Jan 2025 13:13:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jan 14, 2025 at 02:29:12PM +0100, Jan Beulich wrote:
> The ssid_label field requires separate freeing; make sure to call
> libxl_dominfo_dispose() as well as libxl_dominfo_init(). Since vcpuset()
> calls only the former, add a call to the latter there at the same time.
> 
> Coverity-ID: 1638727
> Coverity-ID: 1638728
> Fixes: c458c404da16 ("xl: use libxl_domain_info to get the uuid in printf_info")
> Fixes: 48dab9767d2e ("tools/xl: use libxl_domain_info to get domain type for vcpu-pin")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

