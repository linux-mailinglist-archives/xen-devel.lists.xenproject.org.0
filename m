Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0E0A5E12E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 16:55:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910507.1317207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsOPj-0004Zw-Cc; Wed, 12 Mar 2025 15:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910507.1317207; Wed, 12 Mar 2025 15:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsOPj-0004Xo-9I; Wed, 12 Mar 2025 15:54:35 +0000
Received: by outflank-mailman (input) for mailman id 910507;
 Wed, 12 Mar 2025 15:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t9Zb=V7=bounce.vates.tech=bounce-md_30504962.67d1ae35.v1-d3d4728f068e4480832a594fde000b53@srs-se1.protection.inumbo.net>)
 id 1tsOPh-0004Xi-0E
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 15:54:33 +0000
Received: from mail186-3.suw21.mandrillapp.com
 (mail186-3.suw21.mandrillapp.com [198.2.186.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48d7218b-ff5a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 16:54:31 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-3.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZCZv96njFzDRHxk3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 15:54:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d3d4728f068e4480832a594fde000b53; Wed, 12 Mar 2025 15:54:29 +0000
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
X-Inumbo-ID: 48d7218b-ff5a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741794869; x=1742064869;
	bh=3QnwQtI/I43l2qvbwrwq9ZzcdxjaS1h7Qa3H114oHNw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BVK8G9ALKw4316XmDAO6GBml30H96kEB1MDQD1TOhjv0wIm3DZKyTFBsZM5dxWjQ+
	 g6RvRWZBs9T9dg4pQWhvTnids0wUv+uOvsRJLpUj7sidcqF19sjMZlGz7Aq5UELx9P
	 klVelmdXhOZz6vm9UnV82Iqdg4xJb9UYer8qXk3XMRdBYRoWZWMECQn8Wo/NXbP+57
	 uKe/oODPdwE16dLy7e5kjkB+HqhknjoBozOO6hstr8D4LDrgZGY889ShmsQbGidy3c
	 2k+6vTPUXVBAGJ7QuInqiguVMYu2QkU+1Au43JlKNoSBpUeh9JWp1Up9tTWyWmfyXf
	 ITQhy0qsJwGtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741794869; x=1742055369; i=anthony.perard@vates.tech;
	bh=3QnwQtI/I43l2qvbwrwq9ZzcdxjaS1h7Qa3H114oHNw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VUQJIRI0rF3ZmKbxo8SdOfEMemdcK2khYOs+qAAahW9jNcEcN3YuSEx3AsEhc+M0R
	 jzGFhUfRTIQP+sCXYZI7L1Cf8ddlpJWqTnFJd9IKsRUurjUL0jD7e9bZcwH0gbB7Xg
	 7Vve4uFWeLzwBDHkdGSCK7ori+Y3734gg6dFjcl6QLQtFmkctUevgfDzsKNTCxgsc+
	 XHcrSl4eXA3R68XWeVsUsNxHrhKcJ1QmyyOlO9eoZWUgSJb4L69fc315f49PEaIcsz
	 jDwqfwuCEk9KsCHYaLw7OpZMe1TfWrl99rMZTsR5/kZ2oScgzATiDrvnJDQxmRlfqf
	 N7EMLWyr1czlg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=201/2]=20tools/ctrl:=20Silence=20missing=20GSI=20in=20xc=5Fpcidev=5Fget=5Fgsi()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741794868836
To: "Jason Andryuk" <jason.andryuk@amd.com>
Cc: xen-devel@lists.xenproject.org, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Juergen Gross" <jgross@suse.com>
Message-Id: <Z9GuNH4h1HY7Ajne@l14>
References: <20250308001711.18746-1-jason.andryuk@amd.com> <20250308001711.18746-2-jason.andryuk@amd.com>
In-Reply-To: <20250308001711.18746-2-jason.andryuk@amd.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d3d4728f068e4480832a594fde000b53?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250312:md
Date: Wed, 12 Mar 2025 15:54:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 07, 2025 at 07:17:10PM -0500, Jason Andryuk wrote:
> It is valid for a PCI device to not have a legacy IRQ.  In that case, do
> not print an error to keep the lgs clean.
> 
> This relies on pciback being updated to return -ENOENT for a missing
> GSI.
> 
> Fixes: b93e5981d258 ("tools: Add new function to get gsi from dev")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

