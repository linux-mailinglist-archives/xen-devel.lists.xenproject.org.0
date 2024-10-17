Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3A9A2A06
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 19:03:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820820.1234441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TuB-0006F6-F0; Thu, 17 Oct 2024 17:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820820.1234441; Thu, 17 Oct 2024 17:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1TuB-0006CL-Bt; Thu, 17 Oct 2024 17:03:19 +0000
Received: by outflank-mailman (input) for mailman id 820820;
 Thu, 17 Oct 2024 17:03:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mMIn=RN=bounce.vates.tech=bounce-md_30504962.67114354.v1-ca06631e087c4c96a937f8f6e5a5c153@srs-se1.protection.inumbo.net>)
 id 1t1TuA-0005np-7c
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 17:03:18 +0000
Received: from mail187-33.suw11.mandrillapp.com
 (mail187-33.suw11.mandrillapp.com [198.2.187.33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3d5db19-8ca9-11ef-a0be-8be0dac302b0;
 Thu, 17 Oct 2024 19:03:17 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-33.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4XTvKw1GBGzBsThdd
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 17:03:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ca06631e087c4c96a937f8f6e5a5c153; Thu, 17 Oct 2024 17:03:16 +0000
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
X-Inumbo-ID: b3d5db19-8ca9-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729184596; x=1729445096;
	bh=Dp1aMJniWX6oCPINvn4tAgg/ci6dO3dy+/T+6RmcpKU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ok50UhxUXMgp3zdC/X+UnvFuVxwwv5uqKueQJnkqy0wsS0QiB9IhTNM8eoUlQKk3t
	 I5Whu8upIF7YB/AFVi3W1BktI1BevbgadXcGaOAS4zjb/JxA9gkqSrpmeiFOuSRG9X
	 0MPG9aBZBVpQeQVvgoALrUd2YWsGUWqc48OKqzWgy6YglaMhiLzOk0JKOXVxEm4UFW
	 oIo57Wm10eQOhTaGctfO22pSmWwWQ4eCHhyUyYGKafVU4d+FctMU8kpd6sm0YewYRA
	 We0jRILRS6kT7/rAnV1U80/sU2rHfobkmdVR/3NPYekfoaACH0uAX1PA5elHCCnB29
	 g5KzHS8YkSldA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729184596; x=1729445096; i=anthony.perard@vates.tech;
	bh=Dp1aMJniWX6oCPINvn4tAgg/ci6dO3dy+/T+6RmcpKU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WGj/GFZ9Dll2lcZgqCUH8WOJr/hJbTAzIvN0mzcZqWnEp+BZphn9FB+33kCN8nMZe
	 CTyroeidy9New/El63Ngv7Lgl51YhCy15DsS3upreEAmO8m91qTmNCTxPod8tXKiue
	 EVGVW3KzMHTc+SIWg/88e2fM4guhB6bBDeyLVKJwPMjVZWIw6NvUiOuhz21OwxH7kB
	 exfeDZ2uLTYxSOGWWS5GW6C12Tug6EQtne+lov/qrlhJRlLp/V+7pGy3mvf9qslN9B
	 gLV3amGtxaQ8TDWemEHhg9cLxklu1RAklzR26r+a8ttFRpXKGlDfpApHvjyFXmv/qd
	 8aLVrqdCcCj+A==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v1=203/3]=20CI:=20Refresh=20and=20upgrade=20the=20Fedora=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729184594407
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Message-Id: <ZxFDUf2zYE1Qzr6v@l14>
References: <cover.1729170005.git.javi.merino@cloud.com> <178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com>
In-Reply-To: <178560672106e37648304f5e597cc0b16c8db6db.1729170005.git.javi.merino@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ca06631e087c4c96a937f8f6e5a5c153?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241017:md
Date: Thu, 17 Oct 2024 17:03:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Oct 17, 2024 at 05:20:21PM +0100, Javi Merino wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Fedora 29 is long out of date.  Move forward 5 years to Fedora 40.
> 
> Include all the usual improvements.  Rework the container to be non-root, use
> heredocs for legibility, and switch to the new naming scheme.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

