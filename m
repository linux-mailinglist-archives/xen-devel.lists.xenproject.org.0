Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E7FBFBE4C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 14:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148005.1480107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYAg-0004PY-1m; Wed, 22 Oct 2025 12:42:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148005.1480107; Wed, 22 Oct 2025 12:42:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBYAf-0004O8-VK; Wed, 22 Oct 2025 12:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1148005;
 Wed, 22 Oct 2025 12:42:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FE9=47=bounce.vates.tech=bounce-md_30504962.68f8d132.v1-627da90903c946b391e574425b8800ad@srs-se1.protection.inumbo.net>)
 id 1vBYAf-0004Nm-9O
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 12:42:29 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90f33503-af44-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 14:42:28 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cs82B3vlhzDRJLSq
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 12:42:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 627da90903c946b391e574425b8800ad; Wed, 22 Oct 2025 12:42:26 +0000
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
X-Inumbo-ID: 90f33503-af44-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761136946; x=1761406946;
	bh=/rkX5HTSOxOTVXicfvozm1aHvVL81p4Pe3Kw9VEmMHg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XRH9iiylyZq9L1o6jg5pSDKsVdMqmKd4qaaS/eXS1ES+QpWxqA8yJGBwUc7x+jCko
	 Cl7k+BvqLCwUNtoYvX419A7q0aw8iz5FOrQCxIABtqIaH542Zw+tNzx1UhhwFnYiMT
	 cJrH9J2O5KkxXMcSJ9sW9vlM7UJ1kLc/6bx93UQS/Ujm9f5iakSjNub0x9O4fmVs18
	 7tgbBwuknPzftWqIBGQhmM2ArvAjsFS0Kz5oRHhmZHInx8w7Lftxmof/oW+Mtx0iWG
	 /akbGKEf8eFhM92LdKEsmNO2aiWlHMzH2Fe3Ix2UV7i/g8qrZRN+F35ocSdP8xPgVz
	 R2t6hQwsTXNTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761136946; x=1761397446; i=teddy.astie@vates.tech;
	bh=/rkX5HTSOxOTVXicfvozm1aHvVL81p4Pe3Kw9VEmMHg=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WCTobzLpjTkr3nbojTYnc0nrDWHWvMtTNLZC+9+PAzbh5e1iZYpjJXQFsP4ZimGCc
	 WvZH3j64kBZ8yjz9GxFaJPD3moMicJ+JAMZOtgM1njPBgX+CEKgEnSYNcseLoINHta
	 k/ItCSry+MAzx70KwZygfzcDTO7MnO7HC11agBXfJpxgKaznpo1XhaHY8X44AtlnZX
	 uB6320KaZX6Egg+qwdDYdSBMdxpMJOgTqLHcHDJThTgQq6zkyPRS/tp45rhnJirOOJ
	 hurx3D42dGiCo62fmamExXeS/K9Aciqa0bfRoo7JjW+tlX1o88I7R2LHrc+y0/SgGg
	 uCLuQ/VJNCwgw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=201/4]=20vtd:=20Move=20(un)map=5Fvtd=5Fdomain=5Fpage=20to=20extern.h?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761136945591
Message-Id: <cc6aae2e-cbd4-4f5b-a558-5800a424e340@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1761124632.git.teddy.astie@vates.tech> <74ff3496afcc0a0b747f9ea203d10f51e6b4d00c.1761124632.git.teddy.astie@vates.tech> <e8765029-3a8d-496d-a409-8e576618c1b8@suse.com>
In-Reply-To: <e8765029-3a8d-496d-a409-8e576618c1b8@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.627da90903c946b391e574425b8800ad?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 12:42:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 22/10/2025 =C3=A0 12:28, Jan Beulich a =C3=A9crit=C2=A0:
> On 22.10.2025 11:51, Teddy Astie wrote:
>> These functions are basically wrappers of map_domain_page;
> 
> Given this, ...
> 
>> move
>> them to the shared extern.h and make them inline to help with code
>> generation.
> 
> ... rather than moving can't we just drop them?
> 

That would be better, but that's a larger set of changes 
(map_vtd_domain_page uses maddr instead of mfn).
Ideally, we would want to change the code to use mfn directly and avoid 
converting all around between mfn and maddr when refering to pages.

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



