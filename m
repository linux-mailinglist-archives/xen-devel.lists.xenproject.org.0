Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F849F7E4C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 16:44:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861328.1273270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIgw-0007zX-NM; Thu, 19 Dec 2024 15:43:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861328.1273270; Thu, 19 Dec 2024 15:43:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOIgw-0007wn-Jc; Thu, 19 Dec 2024 15:43:58 +0000
Received: by outflank-mailman (input) for mailman id 861328;
 Thu, 19 Dec 2024 15:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOAh=TM=bounce.vates.tech=bounce-md_30504962.67643f39.v1-99022c5046724ff6be180145348941cd@srs-se1.protection.inumbo.net>)
 id 1tOIgv-0006zr-0X
 for xen-devel@lists.xen.org; Thu, 19 Dec 2024 15:43:57 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d78e4ba-be20-11ef-99a3-01e77a169b0f;
 Thu, 19 Dec 2024 16:43:55 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4YDZbF5ghLz1XLG0y
 for <xen-devel@lists.xen.org>; Thu, 19 Dec 2024 15:43:53 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 99022c5046724ff6be180145348941cd; Thu, 19 Dec 2024 15:43:53 +0000
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
X-Inumbo-ID: 0d78e4ba-be20-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1734623033; x=1734883533;
	bh=qUDGz5E82gKROsWdV+bBULT6T54ZNSbNosmbh8YnBDA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VowfkQdbv9i4smeqCAnXPsWz3L34fjJqO0x48Zc+JiUcH5tnmnQ6NPYRGmf/OTjoD
	 XxSDFFqhZRfkBll4AEySzfXzU7L6nohBjp91kUDsR54LFN2qVrqF85tA+N04q/QUg4
	 k1eB33A2vfKFcFlsE+xMUw6bRdQ2tQQC8VUUampt9+ETsDtu1gw7ursR+H0MD4Rnmd
	 67AmOz877b+ghbIY2Iock1FETdTog0o9lk0w4Yy/M9eF/pPTDChALJlLUtNwib4fxR
	 ByEV9ygWz9bKX1iV/UiNVJoY1p727V/8o+y5QIBxlvT3bru1vNl6rXrCr3QaTAS9zd
	 tyHqoTo4DwM9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1734623033; x=1734883533; i=anthony.perard@vates.tech;
	bh=qUDGz5E82gKROsWdV+bBULT6T54ZNSbNosmbh8YnBDA=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=iLSB3QOK0OcQfyAjzD1EBvJ73nMSc6UDg4onlSBio83hreg9hPfK/M/QwDBq0EDJW
	 8CIlLaljbrhn8Rw4bBt2k62olm6OL+WPdNZZQ5we/hVnCKs37G/7DDL77r9IX6Jlvl
	 gHbbaa4cwinQm6GXY7pN75xlSsHjZ7fNJ9rGyNVzETdtDE+SwGhVaCUdubPtR6vMct
	 aFjmQPoLkwJyk1xEleM1B63p4VGXnX8fIuoiP1CsW01RQWqcKASoiWz8YYGcVM7XAw
	 dPJ4Dd6OfK3bhq47Hr97JWjhYlT+nw4IMONAhVmqXWAZAeTeXmFQMUFWDRpPrBO3tc
	 fClVFT2kry/XA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2]=20drop=20setting=20XEN=5FQEMU=5FCONSOLE=5FLIMIT=20in=20the=20environment?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1734623032984
To: "James Dingwall" <james-xen@dingwall.me.uk>
Cc: xen-devel@lists.xen.org, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <Z2Q_OH-HDjOliUlq@l14>
References: <ZyoTBgbGGYTyphH6@dingwall.me.uk> <a111a4d4-66cf-4270-ac53-0e18288ad9ee@suse.com> <Zyoc4t3RAS7sbVOv@dingwall.me.uk>
In-Reply-To: <Zyoc4t3RAS7sbVOv@dingwall.me.uk>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.99022c5046724ff6be180145348941cd?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241219:md
Date: Thu, 19 Dec 2024 15:43:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

> commit 7b89ea44dbcb965b6b67c8de5092ea2b95d4c6f9
> Author: James Dingwall <james@dingwall.me.uk>
> Date:   Tue Nov 5 11:16:20 2024 +0000
> 
>     libxl: drop setting XEN_QEMU_CONSOLE_LIMIT in the environment (XSA-180 / CVE-2014-3672)
>     
>     The corresponding code in the Xen qemu repository was not applied from
>     qemu-xen-4.18.0.
>     
>     Signed-off-by: James Dingwall <james@dingwall.me.uk>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

