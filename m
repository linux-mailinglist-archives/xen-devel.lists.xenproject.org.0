Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D731987096
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:47:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805122.1216164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stl5F-0007zc-Co; Thu, 26 Sep 2024 09:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805122.1216164; Thu, 26 Sep 2024 09:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stl5F-0007x5-93; Thu, 26 Sep 2024 09:46:49 +0000
Received: by outflank-mailman (input) for mailman id 805122;
 Thu, 26 Sep 2024 09:46:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sAY=QY=bounce.vates.tech=bounce-md_30504962.66f52d84.v1-24c4758e2bdc4eb3b65e9c2a82b6fbbc@srs-se1.protection.inumbo.net>)
 id 1stl5D-0007vn-N9
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:46:48 +0000
Received: from mail177-9.suw61.mandrillapp.com
 (mail177-9.suw61.mandrillapp.com [198.2.177.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d97c04b-7bec-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:46:45 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-9.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4XDpdw17V2zK5vgFb
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:46:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 24c4758e2bdc4eb3b65e9c2a82b6fbbc; Thu, 26 Sep 2024 09:46:44 +0000
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
X-Inumbo-ID: 3d97c04b-7bec-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727344004; x=1727604504;
	bh=YtIL0J2kKwJutGbmEryyKzx2GDPO51JWhKwEjZO/ahw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LOBaRqNjFZfK+LUmjcnLpx2VzknW2VMeQGvfvHiDwRKZobkWrlIBHxPJwtA3O68gU
	 rggT7zDwh6TBJT03JY3YxBDEwF+Jdeja4Z4MeNM4F2ugaezrOH0FuZO5G0RUCy9Ha9
	 cozwv9axdfgwubx2yhDlXiBXCvTX/37OMohBgT6NAgJS8NtMSNh8l37pUy0wkQKA5g
	 m0rpFa3o4NRYpe9ZcL5oaHET+AIGV/RlLl+ghLxNMyDy6WHCRMDC9XLsCasoAZwenY
	 WtxY1e4HFSOupJ17trOa37Os+1B7RHpXBDjrjpNqMrbYpsaIgVwVfK5z4Tdvy2TxeJ
	 NKq7A9m5twgJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727344004; x=1727604504; i=anthony.perard@vates.tech;
	bh=YtIL0J2kKwJutGbmEryyKzx2GDPO51JWhKwEjZO/ahw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l+ZG5xNPfyVLTuY6PEcaRQ/U/YRvhaE8W0dF3RfUM/acEn+MUcm34NRBoIIz/6g7h
	 a8r8FOpNlsXagdmKpSg+Mn91564L/NUcA/v04JTIM1GwVTwqeufOty/FrYnmDTEpaT
	 Xw508rV3FscPDt1Klw5Z9T+oWWQJEZR6iQdTXP5GibHxt8GMvR8g2hX61qegfIdUW6
	 eKjUQ/ypssW5QZlB2CG7Q65Vpx8DgO6JWdel/JGhHnZV12eLkQK9XIcC+Y6LAmWvsl
	 oyLqF9YkZ0yZ3f/YP23hfem1lXWrfwIKqRMoFUTzKMBzGHg9/SFYQMRfCBBdrvUQAk
	 tL3EB9MyV0NaQ==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3]=20blkif:=20reconcile=20protocol=20specification=20with=20in-use=20implementations?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727344002865
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Message-Id: <ZvUtgqY4gWGS0I8K@l14>
References: <20240912095729.25927-1-roger.pau@citrix.com>
In-Reply-To: <20240912095729.25927-1-roger.pau@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.24c4758e2bdc4eb3b65e9c2a82b6fbbc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 09:46:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024 at 11:57:29AM +0200, Roger Pau Monne wrote:
>  /*
>   * Cast to this structure when blkif_request.operation == BLKIF_OP_DISCARD
>   * sizeof(struct blkif_request_discard) <= sizeof(struct blkif_request)
> + *
> + * The 'sector_number' field is in units of 512b, despite the value of the
> + * 'sector-size' xenstore node.  Note however that the offset in
> + * 'sector_number' must be aligned to 'sector-size'.

For discard request, there's "discard-granularity", and I think
`sector_number` should be aligned to it. See "discard-granularity" and
note 4.

>   */
>  struct blkif_request_discard {
>      uint8_t        operation;    /* BLKIF_OP_DISCARD                     */

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

