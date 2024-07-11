Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E45392ECFA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 18:43:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757647.1166714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwse-0002Io-Ip; Thu, 11 Jul 2024 16:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757647.1166714; Thu, 11 Jul 2024 16:42:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRwse-0002G9-GA; Thu, 11 Jul 2024 16:42:52 +0000
Received: by outflank-mailman (input) for mailman id 757647;
 Thu, 11 Jul 2024 16:42:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jxuc=OL=bounce.vates.tech=bounce-md_30504962.66900b88.v1-43623664dd02461398a2b2ebac11d0c7@srs-se1.protection.inumbo.net>)
 id 1sRwsd-0002G3-DF
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 16:42:51 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b8efa27-3fa4-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 18:42:49 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKgWX1qWKzB5p8b5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 16:42:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 43623664dd02461398a2b2ebac11d0c7; Thu, 11 Jul 2024 16:42:48 +0000
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
X-Inumbo-ID: 9b8efa27-3fa4-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720716168; x=1720976668;
	bh=bynxZK2homNllH9R4jLqjU7kZXnvPx41cnDtNtpcWm8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hvBOZNbRvtZvUALRuU7+tr0iuQyMS5oAH3WY5G4Ul3SN9LRlg0UQU+aINw6BiwDv6
	 nAMBU83WfNJODjXbcQQ6gr8+2LT97BHm1MW/Tq+U4toekRjagKmz+ZTeWQmG0DB2UX
	 +O/ZB6aB1oMyE3g+PJX6WL9PTz/GcXY9HVjA8wCSfkkkrXJpIS3y3KnybEtUMyvq+R
	 c8FSVIi6RU2dtmlbBMk4J56jxZsMXKfWNIlQk1X8rRFhYQJ99K8zdS2G7qsIZ+KhcE
	 y06LeaWwOQins/NU8R3wmB6jYrH0ULnpwcsFRrjHdoGqesrOTiqwZPiwpubkvWPFnA
	 vkw/3swDmq3gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720716168; x=1720976668; i=anthony.perard@vates.tech;
	bh=bynxZK2homNllH9R4jLqjU7kZXnvPx41cnDtNtpcWm8=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zDso/dsOa4dLFbAgIngRC/X0Kq3tz9ygPeLdxNXsWHJsSbdZCbxODvEvW/gQWdp6K
	 X3U/ey1UOoaJNDY9jq/9Vh1w3APtrPQep0ONVDaIylfiLUCYyPcaKiPp8wq8hq4Qxv
	 OdYnx1cUQTiECLZLD6qXiL+h1K9JOroGkVL+RP0lcoEBhSvxGMBv/9xSPH+00lGe9k
	 pSyiuA6BWWKDPh0mfuewUl3WVHpd3cScBe4oalZl+0YMvx7MmdsB4Al8/yHHearfEd
	 7re4FFHZ7Axy1EEFpxkzj92f/gvTcPPytTjjpeYmENFSwZonfhBU0+1DWDuEIk9zI1
	 j7HbEzhHVrcXg==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2012/12]=20CI:=20Refresh=20and=20upgrade=20the=20GCC-IBT=20container?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720716166694
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <ZpALhn9Rq41N8Qv9@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-13-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-13-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.43623664dd02461398a2b2ebac11d0c7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 16:42:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:17PM +0100, Andrew Cooper wrote:
> Upgrade from Debian buster to bookworm, GCC 11.3 to 11.4 and to be a non-root
> container.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

