Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9591D944FD2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 18:00:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769845.1180726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYEB-00015e-Nl; Thu, 01 Aug 2024 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769845.1180726; Thu, 01 Aug 2024 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZYEB-00013e-KS; Thu, 01 Aug 2024 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 769845;
 Thu, 01 Aug 2024 16:00:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaX7=PA=bounce.vates.tech=bounce-md_30504962.66abb11b.v1-dbd45be96c39428d9f318541a8674454@srs-se1.protection.inumbo.net>)
 id 1sZYEA-00013Y-CQ
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 16:00:30 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bbb76c8-501f-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 18:00:29 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4WZYZz1zTqzK5x1YM
 for <xen-devel@lists.xenproject.org>; Thu,  1 Aug 2024 16:00:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dbd45be96c39428d9f318541a8674454; Thu, 01 Aug 2024 16:00:27 +0000
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
X-Inumbo-ID: 2bbb76c8-501f-11ef-bc02-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1722528027; x=1722788527;
	bh=TFxzfvgw/uxxsVRwFTYa9keFpJOQlhgX0hgRntzEWCc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=v/FVzIdDTwMwlwtgKFqUGvXtiM0WixaPxcWGGrTrOCOtSQOT81BGPdeq7/apNZoau
	 cboSeeIwdTjb4GzYf6zOSyAAk/RIPgajkAftSJjTuyb0WEd0FBQAGIap+pjC76nzJx
	 UPxcSsjwwKaR8YXHZ+O4Tk0jNqb8D6BaXR7jnFJo4XfMz9lBxG+b3ERjtGjtxsNe6A
	 +FMDbGDaWyOpIYxYP0KH8tshyCvoiUZMFZTLmbvNozc9qkt6jjpcHKoO2+OAv29hVc
	 vC2EhKYkmOq+Hos/sls/my+Gno11ZZITNiM9wulu9Lqd9FQ8USSG6PZdEOOJ7LcD6s
	 6Hbtnrj531hpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1722528027; x=1722788527; i=anthony.perard@vates.tech;
	bh=TFxzfvgw/uxxsVRwFTYa9keFpJOQlhgX0hgRntzEWCc=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iJjIbBuc8F1/v0tpo/7yyI9ZO+jDaOOLfVtwh3AmA/MyaDXOZUvHlfTSYike2kTKF
	 DkZEwRnlrDBrjz3mZoONFLpP1JZxZLAkDO9jf95+P/FUYQQ6ja3r1++Vf3caHhlt1v
	 bg8TzJMHpdue3jUTKgx7v4zMX23gY0hEyHke+Qcu9A4jHGUGPxOXrajUgVaA05bGbK
	 fR5qTpTUnalHKt0/3MCNS2mCAljZwC6OIx44+sJDGO1LSdi+KCPZ7OUipxXKavXOVC
	 YrZKS9g3roSJXUqz1V28peswH7S4VMY3wW33m1laGe2T6hQjbkXblPJIUfkJi2GWzi
	 fnZ23F07dWQYQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH=20v7]=20tools/lsevtchn:=20Use=20errno=20macro=20to=20handle=20hypercall=20error=20cases?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1722528026043
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <ZquxGS2USjSsI9/i@l14>
References: <1240a14dea2f75d2e5b8d8e8bb685fac956629c6.1722442563.git.matthew.barnes@cloud.com>
In-Reply-To: <1240a14dea2f75d2e5b8d8e8bb685fac956629c6.1722442563.git.matthew.barnes@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dbd45be96c39428d9f318541a8674454?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240801:md
Date: Thu, 01 Aug 2024 16:00:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 31, 2024 at 05:18:44PM +0100, Matthew Barnes wrote:
> Currently, lsevtchn aborts its event channel enumeration when it hits
> an event channel that is owned by Xen.
> 
> lsevtchn does not distinguish between different hypercall errors, which
> results in lsevtchn missing potential relevant event channels with
> higher port numbers.
> 
> Use the errno macro to distinguish between hypercall errors, and
> continue event channel enumeration if the hypercall error is not
> critical to enumeration.
> 
> Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

