Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C9297AD80
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 11:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799872.1209860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqU78-0000Pv-TG; Tue, 17 Sep 2024 09:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799872.1209860; Tue, 17 Sep 2024 09:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqU78-0000NC-Pq; Tue, 17 Sep 2024 09:03:14 +0000
Received: by outflank-mailman (input) for mailman id 799872;
 Tue, 17 Sep 2024 09:03:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bhme=QP=bounce.vates.tech=bounce-md_30504962.66e945cd.v1-bd552a1c261847c58dea007cd434e263@srs-se1.protection.inumbo.net>)
 id 1sqU76-0000N6-U4
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 09:03:13 +0000
Received: from mail178-25.suw51.mandrillapp.com
 (mail178-25.suw51.mandrillapp.com [198.2.178.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a99dafcd-74d3-11ef-a0b7-8be0dac302b0;
 Tue, 17 Sep 2024 11:03:11 +0200 (CEST)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-25.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4X7G5n4W6Wz4f3jsg
 for <xen-devel@lists.xenproject.org>; Tue, 17 Sep 2024 09:03:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bd552a1c261847c58dea007cd434e263; Tue, 17 Sep 2024 09:03:09 +0000
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
X-Inumbo-ID: a99dafcd-74d3-11ef-a0b7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1726563789; x=1726824289;
	bh=idgHq/67RwTh/JAU2CY11c6P488Cq/ZprPkWSuRtEWo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y7DvJs4Hxsn4JLVmNpGcS/U68XfUaF8rrreQqaMyfsWr57x51w/gZOLnSHh9FYoLq
	 v0El7OYZSv3dYXZQ84yqoQKLXsMDq+ABBYs4JWvmTAAC/yBE7Ts9QERAyvQtHQ9xVU
	 +RSEUsnJ0/m5RtsqUsa4onkOBdlhRfWiSTfIYr0jlIEAplxWaRJyX/ixNLBfgfuIn7
	 TIPloBhIno21jULq+Kyf0WZ85zc/JuK4qGUx1998+0i4jSRd3SL1kDfhic5vxJY9IQ
	 mbwFqGLoE4MomzdHg4Tv03iM+UtcoETYIwLHf6wxRv5pyBaSbQ568Kr/beW4sznpCZ
	 dgBjw6ZpngKgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1726563789; x=1726824289; i=anthony.perard@vates.tech;
	bh=idgHq/67RwTh/JAU2CY11c6P488Cq/ZprPkWSuRtEWo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=IdHoTxLALCDT2E/JIVanYcU0kZrwAIq3s4sQ426OmJa8dqMs2lBFidjd5tsQUkpl7
	 adqVy9U8nUVDL32KENv3qqr9F7G7KhUCOL2rPHXOKRwWHfeji777GlCVsi6UQGGi8T
	 +4E5l7nFqUE6E5+bDgUn3ht33YRssqhJwJKcU+o9n2UJfDiZ3YlqLJauV+bTDr/0l7
	 Q1mxwbz9BXMir0N012B0C+DbI2T8EiG98bO49fnXLBUTf//AH8yxX0q68O5r1uxQu9
	 Eoc3TxIpHq97xxM9l31sesKU+JRisOzYremWi7vSHyLuQESlsL+wDy5YQCYmo2Uahg
	 L5xP2ulOKd3yw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20hw/xen:=20Remove=20deadcode?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1726563788336
To: dave@treblig.org
Cc: sstabellini@kernel.org, paul@xen.org, edgar.iglesias@gmail.com, xen-devel@lists.xenproject.org, qemu-devel@nongnu.org, anthony@xenproject.org
Message-Id: <ZulFy+S9b243+EQy@l14>
References: <20240917002212.330893-1-dave@treblig.org>
In-Reply-To: <20240917002212.330893-1-dave@treblig.org>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bd552a1c261847c58dea007cd434e263?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240917:md
Date: Tue, 17 Sep 2024 09:03:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Sep 17, 2024 at 01:22:12AM +0100, dave@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <dave@treblig.org>
> 
> xen_be_copy_grant_refs is unused since 2019's
>   19f87870ba ("xen: remove the legacy 'xen_disk' backend")
> 
> xen_config_dev_console is unused since 2018's
>   6d7c06c213 ("Remove broken Xen PV domain builder")
> 
> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <dave@treblig.org>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

