Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFC492FADA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 15:03:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758020.1167223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFv5-0004Je-HX; Fri, 12 Jul 2024 13:02:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758020.1167223; Fri, 12 Jul 2024 13:02:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFv5-0004H1-Eh; Fri, 12 Jul 2024 13:02:39 +0000
Received: by outflank-mailman (input) for mailman id 758020;
 Fri, 12 Jul 2024 13:02:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9lvJ=OM=bounce.vates.tech=bounce-md_30504962.6691296b.v1-2350af86716246c1b8839ef21358bd15@srs-se1.protection.inumbo.net>)
 id 1sSFv4-0004Gv-B9
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 13:02:38 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c89ac9-404f-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 15:02:37 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLBZz6tmLz6CQ50G
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 13:02:35 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2350af86716246c1b8839ef21358bd15; Fri, 12 Jul 2024 13:02:35 +0000
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
X-Inumbo-ID: 02c89ac9-404f-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720789356; x=1721049856;
	bh=J2eajCKSO+EbMlbYqikWZk4lLpbB5rVDfYdGE1afar4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=UZyjciQ0delnl/do8WSKrJQsu0lJ0DSR8El1FjLQQL8UVewOFTo9q8mRaxb/7Pse5
	 YTEBTPDaGTRdz9zesOgJfcrA3+2rSF5+/YSxUwZU5YpckNcG2g484fGTUFaPNY5KhU
	 Fsc7KYrONltdUcEN7fOm3tmgOQzvaJ5KdTRDLx72qQ1jVtnIVrckc08ZQ8DMVurI8s
	 MSTXGlLlNM8kzm6IMl0ww+BRKO1EpTNQqkkV6XLboS/1AK+gYAy6tkgHU8AOnHSqN3
	 szA9gOMFjPw3mq+522GBo/wlpa9h/hJJGyjlRmqeba7MM20gyFeH9nWKOASyNxzilt
	 q/DqFLQBog5ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720789356; x=1721049856; i=anthony.perard@vates.tech;
	bh=J2eajCKSO+EbMlbYqikWZk4lLpbB5rVDfYdGE1afar4=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vEFRIZPkMRZpQXhQBDHq2YBYE0OSeSOhAA3TLGqMsh4NhVu/U2sh+UB4SGy0pSI1u
	 W9IHqW6hH/XS9M9dpgS2AQNyt4FplP/Ipx4koZkl2mG80jCruTcGxMl75S/YzCGx+g
	 mgSlDj1yYS5KchAUJtJ9kbp8TO1Rp5hAWywTmkk5aLo3Ug5LH672iXR43+cwqk/OuT
	 Doajzave127KSDYJXrdu09VviPjbljRJMisH5Kc0VfloQBatbt9YVDG8W1GmzERBO1
	 rQKMRL4fblG4/LebPUSU53Y/i/XekZiKQlNwIJGppGyWMObsUnOgwukms2JRHXfm6i
	 Z1UYyuIP2tQLw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2014/12]=20CI:=20Refresh=20OpenSUSE=20Leap=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720789354475
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>, Olaf Hering <olaf@aepfle.de>
Message-Id: <ZpEpaVCC7KHvkIwK@l14>
References: <20240711210534.3141725-1-andrew.cooper3@citrix.com> <20240712125538.3246947-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240712125538.3246947-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2350af86716246c1b8839ef21358bd15?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 13:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Jul 12, 2024 at 01:55:38PM +0100, Andrew Cooper wrote:
> See prior patch for most discussion.
> 
> Despite appearing to be a fixed release (and therefore not marked as permitted
> failure), the dockerfile references the `leap` tag which is rolling in
> practice.  Switch to 15.6 explicitly, for better test stability.
> 
> Vs tumbleweed, use `zypper update` rather than dist-upgrade, and retain the
> RomBIOS dependencies; bin86 and dev86.
> 
> In terms of size, this saves ~700M:
> 
>   registry.gitlab.com/xen-project/xen/opensuse  leap-15.6-x86_64       1.33GB
>   registry.gitlab.com/xen-project/xen/suse      opensuse-leap          2.05GB
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

