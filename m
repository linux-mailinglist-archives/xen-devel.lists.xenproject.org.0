Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E424BACC81
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 14:11:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134230.1472208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZCU-0004lb-1X; Tue, 30 Sep 2025 12:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134230.1472208; Tue, 30 Sep 2025 12:11:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3ZCT-0004iV-Om; Tue, 30 Sep 2025 12:11:21 +0000
Received: by outflank-mailman (input) for mailman id 1134230;
 Tue, 30 Sep 2025 12:11:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3bX=4J=bounce.vates.tech=bounce-md_30504962.68dbc8d9.v1-b5a69f1d6e7546c9a4382d1862fc4234@srs-se1.protection.inumbo.net>)
 id 1v3ZCS-0004Gq-1f
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 12:11:20 +0000
Received: from mail132-16.atl131.mandrillapp.com
 (mail132-16.atl131.mandrillapp.com [198.2.132.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b0bc642-9df6-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 14:11:07 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-16.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4cbcN96f75zB5pQln
 for <xen-devel@lists.xenproject.org>; Tue, 30 Sep 2025 12:11:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b5a69f1d6e7546c9a4382d1862fc4234; Tue, 30 Sep 2025 12:11:05 +0000
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
X-Inumbo-ID: 8b0bc642-9df6-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1759234265; x=1759504265;
	bh=83ZLDzu48SQMzbwyIInIAjLwAJRjMElgY51Xi1AYFGc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ywsTRpx+e76zfRkAKwD25i3fPgVWP/5uj/d4M/J57hBjszUJA5QZ/0VYe3gNAQCjX
	 2UUEohPqQ+zsZUTkD+NwvSvTTksjKfccfGwcKX5aNeonNJufGitM8DLyqOmaAM3Hp1
	 a3my5/WR+lAaf4oNKj9LYzjF8aoBEXVVhQQM/dmXLXmqg5PmRhYneGw+M1qFyHkiyg
	 aVRFZLbVJgyT4pakvH8hoqr8b6fZKwb0VVpDQKTZTV9/D7a4gHe27V1FrVmsCF9Lz9
	 fsT4lMk8YGP517rkxrUCDi43eLqbYq+notCE36duL3Qegamb4ozV3dtleGApeIiUDc
	 QLaHTrfPIHfuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1759234265; x=1759494765; i=teddy.astie@vates.tech;
	bh=83ZLDzu48SQMzbwyIInIAjLwAJRjMElgY51Xi1AYFGc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WshO0K/7YlVHWTh9XOXQqfCh/zCSjX9C6HsKHyrIKL00A24G3VWT//wQ5EzStGfsT
	 RQzYnCczBwnHA3E4aWEhXEmW5vTM1GPwqY6uhsra/+4y3VLMgNiSEfSyVeya3zht82
	 J27h3LiGH/5NJqYEqDZNE/jxnponiZ98Uv71Oa9SiV+j7JEAZk6GhTZ7fTqp5nh3PT
	 8pA3qJE1h/dlEYuldpfUfohTRU5NwK7MrBkTGps+kQYMfwkNAXBDuNf/XELweFRaAL
	 5nSMyCcdJYK++ZaZ6iLqTW6jCn+4l3SJX2aJgixjInDkzUe5TPtKZ26/zizo4Pwg2b
	 0ppGIXvfKN87A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20x86/hap:=20Inline=20"flush=5Fvcpu"=20in=20"flush=5Ftlb"?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1759234264943
Message-Id: <d2f57f25-6101-48f9-a1c2-975f45e93985@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <bb570008f237cb77f2c74c5f025375ca6c4f140a.1759148418.git.teddy.astie@vates.tech> <45afdc14-7337-4786-b3ff-e3c07a6b5f71@citrix.com>
In-Reply-To: <45afdc14-7337-4786-b3ff-e3c07a6b5f71@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b5a69f1d6e7546c9a4382d1862fc4234?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250930:md
Date: Tue, 30 Sep 2025 12:11:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 29/09/2025 =C3=A0 21:41, Andrew Cooper a =C3=A9crit=C2=A0:
> On 29/09/2025 1:36 pm, Teddy Astie wrote:
>> flush_vcpu static function here is only used in one place which is just =
below
>> where it is defined. Inline the function to reduce the noise and clarify
>> what we are doing.
>>
>> No functional change.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> 
> Have you read the commit message introducing this pattern?=C2=A0 It's
> 11d9e114b53045e5f2009a26dad1d0d0f7df441e for reference.
> 

Yes, and while it makes sense in shadow paging code where we use it 
multiples times; it sounds to me a bit too much here to have such 
function just used once.

> The compiler will do the sensible thing.=C2=A0 What matters is the cognit=
ive
> complexity of the source code.
> 
> ~Andrew
> 

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



