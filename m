Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6104B39E1F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 15:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1098774.1452744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcJm-0007HU-MI; Thu, 28 Aug 2025 13:05:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1098774.1452744; Thu, 28 Aug 2025 13:05:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urcJm-0007FR-Jm; Thu, 28 Aug 2025 13:05:30 +0000
Received: by outflank-mailman (input) for mailman id 1098774;
 Thu, 28 Aug 2025 13:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzUP=3I=bounce.vates.tech=bounce-md_30504962.68b05415.v1-bb730c600fb745a18f24acc3e53d69ed@srs-se1.protection.inumbo.net>)
 id 1urcJl-0007FL-Gk
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 13:05:29 +0000
Received: from mail187-26.suw11.mandrillapp.com
 (mail187-26.suw11.mandrillapp.com [198.2.187.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa2f069a-840f-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 15:05:27 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-26.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4cCM855CslzKsbJFY
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 13:05:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 bb730c600fb745a18f24acc3e53d69ed; Thu, 28 Aug 2025 13:05:25 +0000
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
X-Inumbo-ID: aa2f069a-840f-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1756386325; x=1756656325;
	bh=bLf4NKVOUkSqKMIgZHeiAJLxmQjpcJ5xR/S//EIkS48=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=g8HOdoayQH6npFCmb8Hp65leuKoGgJZ8fj3zyGumJHzwCPoxzb7LcYszc2e2pKkuW
	 PN0BdYeS+boLXob7uiZKZRA32OSN+AAMbZQf8J0wIUWTZ3sX7uG5Nb3EEbB/7lpSJ8
	 bSFCDVIBtXnFzbnwU+/RNdyoGZHKiWAXwLIDFB/MFes7Zsj/iARg/lmqTB/ekrmS/G
	 zDFYZ+jnhRQFvqvJ29/+JFpliYUZokKUXsQfNrr4PSD03gLAUT4CYRZbLBiZ16fxSl
	 vAVRIMjcOZkLt53D4++5Goq8Ox3oE79rTWTunbAwNN6POBKU0JoiySSXXrTGq/a2pj
	 DFV/PXEYS71gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1756386325; x=1756646825; i=anthony.perard@vates.tech;
	bh=bLf4NKVOUkSqKMIgZHeiAJLxmQjpcJ5xR/S//EIkS48=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=saoBxs9L0ga9/iQxXoMTOcuDNCiAviCoe5VACEOthI3iK1H859njKt2s/qhaPwQQ/
	 IvGcU5hKavxdfwX+IfU/Glote+cKu/3jR0rJp1/ZKhrIrncEFW/Nr0fFTrMtA8zZo7
	 kqVI4qYvQZ4LjTdf5/FfXRX3hOUGTk2rOz6fcT4oBxFvJ4CajlZhPycHENQnADYRfq
	 CY7xUcJZh9rH262C4iuyx8Rwp7M0BbDMAWW1/G8LdFryWlYjYjZgzNlG114bzZiVfO
	 5HRt/y1vQa/BMt0u0x7HK1FySwA9sp/aruhCfSN5ZiBcZvFnOosKfXqFQxPt2cXhPc
	 cRhVd7dd4Xvyw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v8=207/8]=20xen/cpufreq:=20bypass=20governor-related=20para=20for=20amd-cppc-epp?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1756386324425
To: "Penny Zheng" <Penny.Zheng@amd.com>
Cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, "Jan Beulich" <jbeulich@suse.com>
Message-Id: <aLBUFCXg_6k503nm@l14>
References: <20250828100534.1777023-1-Penny.Zheng@amd.com>
In-Reply-To: <20250828100534.1777023-1-Penny.Zheng@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.bb730c600fb745a18f24acc3e53d69ed?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250828:md
Date: Thu, 28 Aug 2025 13:05:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Aug 28, 2025 at 06:05:34PM +0800, Penny Zheng wrote:
> HWP and amd-cppc-epp are both governor-less driver, so we introduce
> "is_governor_less" flag and cpufreq_is_governorless() to help bypass
> governor-related info on dealing with cpufreq para.
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



