Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF4C011A3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 14:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149055.1480819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBuMB-0001tq-2c; Thu, 23 Oct 2025 12:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149055.1480819; Thu, 23 Oct 2025 12:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBuMA-0001rU-VD; Thu, 23 Oct 2025 12:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1149055;
 Thu, 23 Oct 2025 12:23:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0HOo=5A=bounce.vates.tech=bounce-md_30504962.68fa1e52.v1-f859c87c39984a608cb3f710fa939246@srs-se1.protection.inumbo.net>)
 id 1vBuM9-0001rO-6K
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 12:23:49 +0000
Received: from mail187-3.suw11.mandrillapp.com
 (mail187-3.suw11.mandrillapp.com [198.2.187.3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f73aee5-b00b-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 14:23:47 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-3.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4cslZB1DlKzDRJFks
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 12:23:46 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f859c87c39984a608cb3f710fa939246; Thu, 23 Oct 2025 12:23:46 +0000
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
X-Inumbo-ID: 1f73aee5-b00b-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761222226; x=1761492226;
	bh=0M2vauzDWHp/fmdcCzvBeXqQQx/Xrz5K7xA6hVscK8w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hWJBtpsOHWLA8bOudRvobMHYkGcBABdXJUImEdO1yTxKXnDbRfSm8KyJIopWJic99
	 RF5m6CecGhSkXE/ywxmk7mJmKwWHtcFWylLB2WK4sI9TrhzdZ85FZkJq6YwXvD8olj
	 Fn66y7oELCFwyM99YT/g6bO8HI4I7kST44ltPZPRT1fZH77cDg3Xs2a4Sij9QHHZZd
	 5cIvwMh7UaTQO32s+875iXV/JxkrQzgwHxhfqtcxHU61u/g/ZPGB4uN/KV5C3kVDfD
	 kkdDQMXt6DNw+Qtdg7BG4HmWLMrGjD6dWbBTnE+3mY2INwT7880G6hbSfqtlDwmbre
	 h28KCMlB52c1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761222226; x=1761482726; i=teddy.astie@vates.tech;
	bh=0M2vauzDWHp/fmdcCzvBeXqQQx/Xrz5K7xA6hVscK8w=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=EYA1JY9JK20w+L5efWex4Rsjsqr59sWKVEeKXvbx1rRsGWZLmeOd5tgiuqwMnG7Vt
	 07hped/ard0hc+8IaiItFiMGVbotbTdvp9LXDVUbPgJMZ6AoETJMQjMPkb65FjPVlX
	 /oD08/rCYnciZjzRQmBEFyi3whJDNlnM+X2HwCE1bnOjX5PMnQOYXyDFk7K9PNDyhn
	 X5ygh1pPx7xIhdbr5XSbpkbCPAKIooT1mk1w8lf/g1IeqxoLEN2DMpI2hq76mZxXtC
	 FKBlufeXQ3YF6EIRoedLoKIYF4QXhz2NINJsZeVASKTNpSQBAKRCNiZaVQdP9/vcUt
	 xvskp/sOg2wXA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=203/5]=20vtd:=20Collapse=20x86=20subdirectory?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761222225407
Message-Id: <53649137-a6bd-485b-9499-7fbf429714b2@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, "Jason Andryuk" <jason.andryuk@amd.com>
References: <cover.1761209564.git.teddy.astie@vates.tech> <3e9e5ea80bb534b69bd315099da6b5d049852823.1761209564.git.teddy.astie@vates.tech> <63e5addb-d109-4c57-a94f-88968c6d9382@suse.com>
In-Reply-To: <63e5addb-d109-4c57-a94f-88968c6d9382@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f859c87c39984a608cb3f710fa939246?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251023:md
Date: Thu, 23 Oct 2025 12:23:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 23/10/2025 =C3=A0 12:20, Jan Beulich a =C3=A9crit=C2=A0:
> On 23.10.2025 11:12, Teddy Astie wrote:
>> The x86 subdirectory was originally meant to split x86-specific logic fr=
om
>> general VT-d code. Today, Xen only supports VT-d on x86 and the code act=
ually
>> implemented in this subdirectory isn't x86-specific (e.g ATS code is not=
 x86
>> specific).
>>
>> As ats.c is the only remaining file in this directory, and isn't x86 spe=
cific,
>> move it up to vtd directory and remove the now empty x86 subdirectory.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> v2:
>>   - reviewed commit description
>>
>>   xen/drivers/passthrough/vtd/Makefile        |  3 +--
>>   xen/drivers/passthrough/vtd/{x86 =3D> }/ats.c | 10 +++++-----
>>   xen/drivers/passthrough/vtd/x86/Makefile    |  1 -
>>   3 files changed, 6 insertions(+), 8 deletions(-)
>>   rename xen/drivers/passthrough/vtd/{x86 =3D> }/ats.c (97%)
>>   delete mode 100644 xen/drivers/passthrough/vtd/x86/Makefile
> 
> I should have remembered this when looking at v1 already: While some of y=
our
> other changes go farther (and hence are likely preferable), this one I'd =
rather
> not see go in. I'd favor respective pieces of what's still pending from
> https://lists.xen.org/archives/html/xen-devel/2024-02/msg00983.html. Firs=
t and
> foremost because ATS really is not only not x86-specific - it's not VT-d-
> specific either.

CC-ing Jason Andryuk now reviewer of AMD-Vi code and likely interested 
with https://lists.xen.org/archives/html/xen-devel/2024-02/msg00983.html 
at least for the AMD part.

I wasn't aware of this pending series. And some of my patches overlap 
with some of these ones, so I guess we need to complete it and then I 
rebase mine on top of it.

> 
> Jan
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



