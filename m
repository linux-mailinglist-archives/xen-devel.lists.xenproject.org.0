Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB06A13A7A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 14:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873567.1284570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPat-0007Of-Bb; Thu, 16 Jan 2025 13:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873567.1284570; Thu, 16 Jan 2025 13:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYPat-0007N9-8x; Thu, 16 Jan 2025 13:07:31 +0000
Received: by outflank-mailman (input) for mailman id 873567;
 Thu, 16 Jan 2025 13:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kd1b=UI=bounce.vates.tech=bounce-md_30504962.6789048d.v1-1127180d23774829bb59a9e75bd419e9@srs-se1.protection.inumbo.net>)
 id 1tYPas-0007N3-2B
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 13:07:30 +0000
Received: from mail187-43.suw11.mandrillapp.com
 (mail187-43.suw11.mandrillapp.com [198.2.187.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4ca28c4-d40a-11ef-99a4-01e77a169b0f;
 Thu, 16 Jan 2025 14:07:26 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-43.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4YYjnn29D8zLfHXMv
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 13:07:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1127180d23774829bb59a9e75bd419e9; Thu, 16 Jan 2025 13:07:25 +0000
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
X-Inumbo-ID: d4ca28c4-d40a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737032845; x=1737302845;
	bh=U4zJKnHETDSGpbyfc8Xor+pecEkKp2yPxoCKuDdLEQM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nq9cXfmjNlvnTPh/9FzYjVRRWg2dtzs2QMpVP06Wpl9yE+eUNxpRoYO/zFfzUPK8/
	 haUsrQ2yqwulqRYrP9OvAgTTGf8RGIl4IYCQfK+chmbbrHhvNWpWyqil1k3acme19U
	 fFQP3WOlqlpyjqxBlvZMTuAsAi+qES1N8B7ZmK2H2d1YnnScYuRmBfifLRdXBlAnRv
	 9AT7+liYcZ7IF+5kDd1m7bnTMX2NAei18huXSq7FPTkgFEqf7jU7dxFCTCzGs3gZAi
	 dKRi0M+V4pD0iw5YP5/weh7SW25rrIxvtE5hUqclgD38RHdnfGBqd3Wq8yolkCR6JV
	 cFbskirINImfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737032845; x=1737293345; i=anthony.perard@vates.tech;
	bh=U4zJKnHETDSGpbyfc8Xor+pecEkKp2yPxoCKuDdLEQM=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=E/3uIscUUCy4Ot74CfomRs5xP9WEFCPuqVS0/M1W8ulFBqAnWscXaQ1pmjAvpXzyV
	 WGbMCUu4vgwjl8RkeQL8w6gOF97n7hPPDr/4qksQnq7Od1jvX53GGnN8uCPe0MS9zM
	 eXx+DVmzFT+GPF86BLAtbrsCK7mbajR7jwZVLxW3tIiY20uAagWtYuxmDhejbuhy4o
	 T5fU0Puxzr15LA2DmZ+8O/LODfC2dBORX39EDfdG58TLOb6sjSn9qpYtgVYp+tmszF
	 eqgqFioSqhIDyiQmgSMguEThl1RSKgcXNWL8Z/MBCz+1Ce0dOiVpLOqzA89cUyTN2u
	 lJ0kDc23g3LeA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xentrace:=20free=20CPU=20mask=20string=20before=20overwriting=20pointer?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737032844354
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Oleksii Kurochko" <oleksii.kurochko@gmail.com>
Message-Id: <Z4kEi-qPzRQpAwsC@l14>
References: <fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com>
In-Reply-To: <fedf2b9d-a475-4062-b8a4-5e33c7dd6305@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1127180d23774829bb59a9e75bd419e9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250116:md
Date: Thu, 16 Jan 2025 13:07:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Jan 14, 2025 at 09:12:37AM +0100, Jan Beulich wrote:
> While multiple -c options may be unexpected, we'd still better deal with
> them properly.
> 
> Also restore the blank line that was bogusly zapped by the same commit.
> 
> Coverity-ID: 1638723
> Fixes: e4ad2836842a ("xentrace: Implement cpu mask range parsing of human values (-c)")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

