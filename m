Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46CF92E93A
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 15:21:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757479.1166433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtjB-0005Ip-G0; Thu, 11 Jul 2024 13:20:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757479.1166433; Thu, 11 Jul 2024 13:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRtjB-0005Ff-CQ; Thu, 11 Jul 2024 13:20:53 +0000
Received: by outflank-mailman (input) for mailman id 757479;
 Thu, 11 Jul 2024 13:20:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ThD5=OL=bounce.vates.tech=bounce-md_30504962.668fdc30.v1-687fe2ad804a4dd3b7fb87159e8ef3ec@srs-se1.protection.inumbo.net>)
 id 1sRtj9-0005FX-HA
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 13:20:51 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63df3261-3f88-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 15:20:50 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WKb2S68N1z6CQMYQ
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 13:20:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 687fe2ad804a4dd3b7fb87159e8ef3ec; Thu, 11 Jul 2024 13:20:48 +0000
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
X-Inumbo-ID: 63df3261-3f88-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720704048; x=1720964548;
	bh=YLCnh0nIqnjhpyLZj1fQ1fYPnVqonWyQ2BThCNYtEIU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=H4arvWB12kQxIFSJDnbxIdhtSD86S/vEO0taYOjuNG2QeqUxn6L56sFYLTLvARFsH
	 wPr30meaKGn1gqh7ziCZgKimkJiA0QIufjG95zUBAWkzMYha9BIUNReEaK8gpNlWm0
	 EVRTJVciV4idvr2AWZyGyWxDwV6M1wynQqSRrpM3JPfJ3UH83p3aASEoPjzfx4Zf2P
	 omVevSET5JeKsZWEVQmnLWnj4HFKoKuQtOs4XtQ52B4ZIAQnZUrOJUejRsQEP8mH//
	 07j8NSpuxXtPpNr5VQbw1BeAxSWCKKBdyInCvRAewun/Um9Tj4UdlGhp++cLjUCGPE
	 nDyyNyo4hhO+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720704048; x=1720964548; i=anthony.perard@vates.tech;
	bh=YLCnh0nIqnjhpyLZj1fQ1fYPnVqonWyQ2BThCNYtEIU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=OTqtm5C1Q5vwkhYmfpumFXQg34uE0s5oSfnvzZ4VDC12xpG3S+lAcKBTJjKhFRPvx
	 Eu6VtxFMsPeELqEUrHyW8ky21DDQoNDikHnwsYonG3y8F32yw745QL4oIDpxEhj7YT
	 iDFi26ru0wPYnEj8QLt2V/PdhEO+t+B6toC8SN1o7ubb9jaYV0CddGrmXPZtdqwlTy
	 vJbz/taIQsGcVZm/KaWl46Vv4CpEIryavZJD+lb4HK53Wyt4pmB3E7KOO/05/2d2er
	 DTJ94chgq2MQnmvBxGmg6vbaUdgIn+vcTJg1z4+AP3Qw31o4feoefQok7OHiQex1od
	 YZ3ph/Zq4tamA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2004/12]=20CI:=20Drop=20Debian=20Stretch=20testing?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720704047318
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo/cLupdQA8uvrRd@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-5-andrew.cooper3@citrix.com>
In-Reply-To: <20240711111517.3064810-5-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.687fe2ad804a4dd3b7fb87159e8ef3ec?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 13:20:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Jul 11, 2024 at 12:15:09PM +0100, Andrew Cooper wrote:
> Debian stretch is also End of Life.  Update a couple of test steps to use
> bookworm instead.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

