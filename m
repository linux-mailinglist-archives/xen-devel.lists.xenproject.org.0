Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5CD92EBF7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 17:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757610.1166641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRw3p-00082D-FR; Thu, 11 Jul 2024 15:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757610.1166641; Thu, 11 Jul 2024 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRw3p-0007zF-CJ; Thu, 11 Jul 2024 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 757610;
 Thu, 11 Jul 2024 15:50:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1q9=OL=bounce.vates.tech=bounce-md_30504962.668fff36.v1-a0dbae01ddcf4664a844124fbc73a299@srs-se1.protection.inumbo.net>)
 id 1sRw3n-0007z9-CQ
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 15:50:19 +0000
Received: from mail136-18.atl41.mandrillapp.com
 (mail136-18.atl41.mandrillapp.com [198.2.136.18])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44508e81-3f9d-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 17:50:16 +0200 (CEST)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-18.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4WKfLt6cllzB5p4v8
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 15:50:14 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 a0dbae01ddcf4664a844124fbc73a299; Thu, 11 Jul 2024 15:50:14 +0000
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
X-Inumbo-ID: 44508e81-3f9d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720713014; x=1720973514;
	bh=gjvAGfs3D941j7oCzhucp8DS9sU0UZ6wagNYaZ3rZIw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=bAKC4Tlce982wQS+YFopg5GpV713Km8Mp2agI32bDT0fNc2xAT/lvimPWZIqkwToL
	 wQU9IzYx/skdwF9Qs/3npvUelQ7BOLvI8nLjhvFf00DpCtBixaUe8Mh25ZMOsg6Nue
	 bySZ7oKbEVoXr/MwaFwk+jOLIEwNQeFsn1WueMT5i/PvFNymOt+RWbUMS7/5pY0WAl
	 vUQjwoWgBwP8k/jKSSgXQTGB89/OYA8Yzmiz56EUPpUyYh7UB+/MfhyNDajW86s8AB
	 byRRbpmjNrB0ng7QspqUFDyMCDvYIfS4wMixtkIrlT4nPI486qIjzCIMc4y1qbcAmg
	 rYGpba62tGWpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720713014; x=1720973514; i=anthony.perard@vates.tech;
	bh=gjvAGfs3D941j7oCzhucp8DS9sU0UZ6wagNYaZ3rZIw=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uYvas4ZyZKAgHiQ0GS9qkHqsPef66kshgrXbhZtWrOb+6Cs59+FLiz6sjQGa4EQkU
	 bT9yxMAu2GiJSOlXepBMPrHJ0mT0fgSiIEKp0sodGJIG5hax/zaA1lTs0GUrBT5Ox4
	 V+76KS0+uu/Cq9MK4mueCudC8CQfptzmI3zu3EZTgiKkWH5+YZoNWRGAff+lF7re1A
	 eJZhYEqq8zFIWHd5r/SXev5gWlIhMcyCzxsKh3/FHRRumHFcpgSZVvEqhMEZO1e+mk
	 gKFkNU2M8bSjelS9N92oszNlNU38sltH8dEvQ+2j2gidb6RY9EspI02VertBpOb0tg
	 h5bWu4aQrohgA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2002/12]=20CI:=20Remove=20useless/misleading=20randconfig=20jobs?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720713013731
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Shawn Anastasio <sanastasio@raptorengineering.com>
Message-Id: <Zo//Ndhe9pNFb3Of@l14>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com> <20240711111517.3064810-3-andrew.cooper3@citrix.com> <Zo/ZdG8pt5FIledD@l14> <5eb4de29-edd3-447a-845a-57d20ad8462b@citrix.com>
In-Reply-To: <5eb4de29-edd3-447a-845a-57d20ad8462b@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.a0dbae01ddcf4664a844124fbc73a299?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240711:md
Date: Thu, 11 Jul 2024 15:50:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 11, 2024 at 04:16:29PM +0100, Andrew Cooper wrote:
> On 11/07/2024 2:09 pm, Anthony PERARD wrote:
> > We already have "parallel: 2" on the whole pipeline, give or take, but
> > those are quick jobs so it might be worth it to run them a few more tim=
e
> > on a pipeline.
> 
> I'm afraid I don't follow.

Sorry, I just meant that the whole test suite is run twice, once in
https://gitlab.com/xen-project/hardware/xen/-/pipelines
and once in
https://gitlab.com/xen-project/xen/-/pipelines
(with just a few tests that are differents)

> Obviously, 5 is arbitrary.=C2=A0 I was thinking of having a scheduled (on=
ce
> per day, at 3AM or whenever) running randconfig only with a parallel:20
> or so, so we can make good use of otherwise-idle time.

That sounds like a good idea.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


