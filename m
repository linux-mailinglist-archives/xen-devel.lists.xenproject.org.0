Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA9A30962
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 12:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885390.1295203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho3V-0008Kc-6p; Tue, 11 Feb 2025 11:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885390.1295203; Tue, 11 Feb 2025 11:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tho3V-0008Hc-3b; Tue, 11 Feb 2025 11:03:53 +0000
Received: by outflank-mailman (input) for mailman id 885390;
 Tue, 11 Feb 2025 11:03:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MerD=VC=bounce.vates.tech=bounce-md_30504962.67ab2e93.v1-5ba9b67d65a94744b02fb69050199186@srs-se1.protection.inumbo.net>)
 id 1tho3T-0008HQ-9I
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 11:03:51 +0000
Received: from mail180-4.suw31.mandrillapp.com
 (mail180-4.suw31.mandrillapp.com [198.2.180.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de6e92c0-e867-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 12:03:49 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-4.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Ysdq75TChzlfvS1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 11:03:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5ba9b67d65a94744b02fb69050199186; Tue, 11 Feb 2025 11:03:47 +0000
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
X-Inumbo-ID: de6e92c0-e867-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739271827; x=1739541827;
	bh=51nMD+kYzwA+1xGq7KMr1DFv6q0iBHVabAh1GmFK4ok=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qGhhqP7Flzub1xinHdUyTS5t75V5rWBKOhXa9dOanxOes5jyWH8G2K71fLZAOm3gC
	 uQ9RYa8TFmU9Z6jtLHZfkS7zYIl6SPZdSkHs3WcB9yAMlcE8Offu904RzqqY6LHtAw
	 OjZFJsxlYf5UjQCW/MRIT9uKLVqMbb3Csp6r57gt9H1Qq2UOJBrVwQLyv20BFDuwM4
	 hkTZdnjrcgVuJrx+QK9jMrqMIOFKSSCTIKrhsY3by9P/kRmP+bwWDbDwT8QfS8qNpu
	 OlcPh7BUIy7PkEKu74HhG8IXQXA1bjqM9C2svJL9OKQfVu+7jF210T1BiBVsTd1pcn
	 qYi/iJv11agZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739271827; x=1739532327; i=anthony.perard@vates.tech;
	bh=51nMD+kYzwA+1xGq7KMr1DFv6q0iBHVabAh1GmFK4ok=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hK2e9E6cVZzmtlDApyoDLBcHcvjN2qXzygFDyw5v/hxlxixcgOPW26JoZr2hiZdoR
	 fXTkEUTMU61p0jxplyVVRVI6juBxYjj+3ViGAg1MIyH5ohPTAA6ymijwF25q9IaJZ/
	 QZLa+r+SaTULDdyR6JnTvE/yjliP5MeEVuiFsFofcbsLFSA14rcBSZnNnVw4jP+yZu
	 nybEeAkGs4nH/KHhabypdbhabnofmocS80zSw53yLBFI7y2mzQt7IJz6uUBzndTqQX
	 O/Cokjb5lna/LlV2qL4Ot+ZXZoBFjD+Cerm3bwaNR5RkFTVyFSWS3lnNRwl9fAHMtD
	 cOXAygLr7B8dg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20Coding=20Style=20Review=20and=20Automation?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739271825460
To: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Cc: "Luca Fancellu" <Luca.Fancellu@arm.com>, "Jan Beulich" <jbeulich@suse.com>, "Bertrand Marquis" <Bertrand.Marquis@arm.com>, "Oleksandr Andrushchenko" <andr2000@gmail.com>, xen-devel@lists.xenproject.org, "Artem Mygaiev" <Artem_Mygaiev@epam.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julien Grall" <julien@xen.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>
Message-Id: <Z6suNGMPoTVg2ND8@l14>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com> <Z6sR87FrKcOhgEqX@macbook.local> <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com> <Z6sY_YsjJ6rGi8zS@macbook.local>
In-Reply-To: <Z6sY_YsjJ6rGi8zS@macbook.local>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5ba9b67d65a94744b02fb69050199186?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250211:md
Date: Tue, 11 Feb 2025 11:03:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 10:31:41AM +0100, Roger Pau Monn=C3=A9 wrote:
> One question that seems to have been dropped from my previous email:
> would it be feasible to apply the updated style to newly added chunks
> of code only, but not to the (unmodified) surrounding context?

There's a tool that can format only one patch, `git-clang-format`.

    https://clang.llvm.org/docs/ClangFormat.html#git-integration

This could help temporally, or as a way to format a patch under review
to get a better view of the new coding style (instead of having a whole
file been formatted which could make reviewing the new style harder).

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


