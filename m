Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE61A5E1F9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 17:47:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910560.1317246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPEL-0006q3-Oo; Wed, 12 Mar 2025 16:46:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910560.1317246; Wed, 12 Mar 2025 16:46:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsPEL-0006o4-M6; Wed, 12 Mar 2025 16:46:53 +0000
Received: by outflank-mailman (input) for mailman id 910560;
 Wed, 12 Mar 2025 16:46:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YQsd=V7=bounce.vates.tech=bounce-md_30504962.67d1ba77.v1-e0804d302d9b4b7f9f559396a3e1c854@srs-se1.protection.inumbo.net>)
 id 1tsPEJ-0006ny-MO
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 16:46:51 +0000
Received: from mail186-3.suw21.mandrillapp.com
 (mail186-3.suw21.mandrillapp.com [198.2.186.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a2b4bc-ff61-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 17:46:48 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-3.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4ZCc3W0tMJzDRJ8cX
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 16:46:47 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e0804d302d9b4b7f9f559396a3e1c854; Wed, 12 Mar 2025 16:46:47 +0000
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
X-Inumbo-ID: 96a2b4bc-ff61-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1741798007; x=1742068007;
	bh=DYD/u7Cxos1/6qORTQD07+ge20uJb2bttIU6+tU7KoE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WIDrfWcbUWSSAKBrNf1i4ScxZtfPYCrPAKdwZ5b1ca8kSzqXXA/xGkm2RPPzS1e2F
	 zaR8Is0ApdbNXjpsEmxOvUl5Ddt5UWgVJt6wB8YJlRRbQLpvdHgyvB8xMdqamdeKXR
	 4leknYHuywDL+1kpbzogCPT4C6ecKXNEqOftfVJDsd8tFkeYWTj0ub1P7HHinfusZ3
	 56N6/AKGpqILmjFyz/42ywBkLG4VsnCjPqfBpaFk3NSBo/zGcj5SonicvNNcKs3RqG
	 0WCqs1C8c2tE40eMviFN85uvJcvXFt7qIJRZTF6z8t5xlvF7hyxtjIbY+V0lzueBfa
	 RcMqQnB2ypuiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1741798007; x=1742058507; i=anthony.perard@vates.tech;
	bh=DYD/u7Cxos1/6qORTQD07+ge20uJb2bttIU6+tU7KoE=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MYfNTzzEtSw+Z/1T14Glr/stJiRzEdDS2ShobjKdFIozyFTCf39u/eeBipfkrNYpK
	 xK5/sheC2kj82q/tDGgliyc8imrj+1KzA4cFw2oYYMaR4WV19k6SKE69/iu1WWEiPw
	 M8DhRFqOpThoxJ9476u6sV4Elifa3LA+du2Tu3JIuU9GCKCoMgvsFNeWobEThLIkYo
	 LRFDytQnq1+cfNBK4XwRWs20t+yKbRXWDnRg+v0rOVPJlIybNYS5MHCBYX8qi+qD6Q
	 zcRGWHO6T/8/LBlamiY9fBAJGNkTgI3Z6G/qraFJxYSpx3MhvjXc6BLVRVDjv68vUD
	 XlIyEEkLCEgig==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20docs:=20specify=20numerical=20values=20of=20Xenstore=20commands?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1741798005702
To: "Juergen Gross" <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <Z9G6dXyhM01MFD_q@l14>
References: <20250312084143.14045-1-jgross@suse.com>
In-Reply-To: <20250312084143.14045-1-jgross@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e0804d302d9b4b7f9f559396a3e1c854?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250312:md
Date: Wed, 12 Mar 2025 16:46:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Wed, Mar 12, 2025 at 09:41:43AM +0100, Juergen Gross wrote:
> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
> index 7e1f031520..72db73deef 100644
> --- a/docs/misc/xenstore.txt
> +++ b/docs/misc/xenstore.txt
> @@ -86,6 +86,67 @@ parts of xenstore inaccessible to some clients.  In any case passing
> +XS_CONTROL               0    optional
> +    If not supported, xenstore-control command will not work.
> +    XS_DEBUG is a deprecated alias of XS_CONTROL.
> +XS_DIRECTORY             1
> +XS_READ                  2
> +XS_GET_PERMS             3

This new table prefix message type names with "XS_", but the rest of the
document describe each type without the prefix. Isn't it going to be
confusing, and make it slightly harder to link this table to rest of the
document? (I often search by full word, like '\<GET_PERMS\>', because
that one key stroke in vim '*', so having different prefix makes it
harder to search)

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

