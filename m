Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBB0A5F4FA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 13:54:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912076.1318415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsi4C-0000nd-2k; Thu, 13 Mar 2025 12:53:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912076.1318415; Thu, 13 Mar 2025 12:53:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsi4C-0000mD-06; Thu, 13 Mar 2025 12:53:40 +0000
Received: by outflank-mailman (input) for mailman id 912076;
 Thu, 13 Mar 2025 12:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcQu=WA=bounce.vates.tech=bounce-md_30504962.67d2d54e.v1-4b11ec04e3ad48b2a1d2efc1d2fa0355@srs-se1.protection.inumbo.net>)
 id 1tsi49-0000jj-S8
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 12:53:38 +0000
Received: from mail177-1.suw61.mandrillapp.com
 (mail177-1.suw61.mandrillapp.com [198.2.177.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cda48a4-000a-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 13:53:35 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-1.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4ZD6qy2lxkzBsThl8
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 12:53:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 4b11ec04e3ad48b2a1d2efc1d2fa0355; Thu, 13 Mar 2025 12:53:34 +0000
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
X-Inumbo-ID: 2cda48a4-000a-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741870414; x=1742140414;
	bh=nlw6syXGRu4/CSR+KHG0UoStDr8ILMMP04ktOJRAgbg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GmKui1GM6mbTESglJ10/J5RIkpnKIgxufvSruYiv/GExTJZiHQf5jMWRmydz3EfqG
	 DCPOcsnPTfB8jpVUae62d90oC8AK/0ECebAOCuGSQqos1FtuhhXIunaUQVs2SHOiS9
	 W3lgEKgc6UMQnqJTgCGNoUNWuutUjb6UJ3Fa6dD4vmtbS5DjhHlvsezS8Arhaiu/mg
	 2QiCylcE57qJUWc/1KLW0FksbJIxi0mPqVgmJ457RFOTwzEXqyZpcuDXarfUYatzQn
	 iqFBvU2ig9UtOFGAYeP79G0DuwMu/McQYR6+rek4ldIUTEcSd53kVh6SBPQwxCkQvU
	 ckp0pV6Brc5ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741870414; x=1742130914; i=anthony.perard@vates.tech;
	bh=nlw6syXGRu4/CSR+KHG0UoStDr8ILMMP04ktOJRAgbg=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=q1m4H8XsT3VzaNNElhHMYNvCZEzlaQUIfEN+rHVyait3iljltfWmNASbAIRCGjyxq
	 OMDtE7yksPanyFPNsCdCxFvQ+t7+Azbyt+q2pzxI4UrOYo8oIscvK7BZRD2F87hudn
	 Be3pE49l3yPk5HP6F5Df0vLmHPuhOHfD8S0e7SUkYGNu6pHGT3RLDzSxOUmv2ORnsI
	 FiRQIY0RYDC8fe/KFVYxcLO5jR7hRz0hsQUvyqKsDFr3eUZ6stV2LCO0Uh2PW16NwC
	 3thjQ9bNh1sf9WF31F9OcEqNvrSN6N9NVaBB5odHOjc4groARUHbrqyQfzRZSXJI1B
	 YDfFQ/aiOnnAw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4]=20docs:=20specify=20numerical=20values=20of=20Xenstore=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741870412826
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z9LVSxJYK5CohY7l@l14>
References: <20250313110640.4330-1-jgross@suse.com>
In-Reply-To: <20250313110640.4330-1-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.4b11ec04e3ad48b2a1d2efc1d2fa0355?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250313:md
Date: Thu, 13 Mar 2025 12:53:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 13, 2025 at 12:06:40PM +0100, Juergen Gross wrote:
> In docs/misc/xenstore.txt all Xenstore commands are specified, but
> the specifications lack the numerical values of the commands.
> 
> Add a table with all commands, their values, and a potential remark
> (e.g. whether the command is optional).
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - replace "=C5=95" with plain "r" (Jan Beulich)
> - replace hard tabs with blanks (Jan Beulich)
> - allow GET_FEATURES and GET_QUOTA support without SET_* (Jan Beulich)
> V3:
> - specify error code returned for unsupported commands (Julien Grall)
> - reword XS_DIRECTORY_PART related text (Julien Grall)
> V4:
> - drop "XS_" prefixes as they are language specific (Anthony Perard)

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


