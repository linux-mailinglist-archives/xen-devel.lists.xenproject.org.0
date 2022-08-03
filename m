Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE535888EA
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 10:56:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379673.613319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAAr-0002TH-Fv; Wed, 03 Aug 2022 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379673.613319; Wed, 03 Aug 2022 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJAAr-0002QI-D5; Wed, 03 Aug 2022 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 379673;
 Wed, 03 Aug 2022 08:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MEIo=YH=kolabnow.com=brunoce@srs-se1.protection.inumbo.net>)
 id 1oJAAq-0002QC-JP
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 08:56:16 +0000
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.155])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21757c6b-130a-11ed-bd2d-47488cf2e6aa;
 Wed, 03 Aug 2022 10:56:15 +0200 (CEST)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id D77F712D9;
 Wed,  3 Aug 2022 10:56:14 +0200 (CEST)
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9MO9HShvuko; Wed,  3 Aug 2022 10:56:14 +0200 (CEST)
Received: from int-mx002.mykolab.com (unknown [10.9.13.2])
 by mx.kolabnow.com (Postfix) with ESMTPS id 7CC6F1C2;
 Wed,  3 Aug 2022 10:56:14 +0200 (CEST)
Received: from ext-subm001.mykolab.com (unknown [10.9.6.1])
 by int-mx002.mykolab.com (Postfix) with ESMTPS id 354D51B7C;
 Wed,  3 Aug 2022 10:56:14 +0200 (CEST)
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
X-Inumbo-ID: 21757c6b-130a-11ed-bd2d-47488cf2e6aa
Authentication-Results: ext-mx-out002.mykolab.com (amavisd-new);
	dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
	header.d=kolabnow.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
	in-reply-to:references:message-id:date:date:subject:subject
	:mime-version:from:from:content-transfer-encoding:content-type
	:content-type:received:received:received; s=dkim20160331; t=
	1659516974; x=1661331375; bh=h9zijXmNyPCKBkZwpkuvqS7w/Uh8kfYbxqG
	U6ZKonS4=; b=34t+3UuQ0A5j7wOags1Pyl8MAE9w3lOy1a1Ba74qsZLf6uHRyeW
	pqCO/Dcjsesk5yB1/5k5f41JopKn9ZBRcGvjQxGBk3c/pKMTFAga4TpMu7Sw1Srl
	UA6d8SwmwPT3K8mHg2xSYvFLtzf1ptFLLWwpF0XvNlmMWCGhSO3KDm/exZvhelSl
	yJ6VWJBjmwwNIQkXVB0nju42ML1dQ3XPhjHms4Gy5nIemZUBHZfbVDOLklLDqutQ
	gOJxmd6Ig9vqxBzIQn7f1JYePn8hDj/K7IHLYHvoNAaResaqQ+ZV7VZ7fG7MYBtM
	ziQOcs0xvdtMo1l+s91SXZsp6oIv91KjGfKMUA0pyP5LIB4D6jpBKxef1K1LmwkN
	VTOjBVoR8pdrU2TBAst1LPSz5SLXWUs1yQvAAa/s4KbGId3Zz8PLtVSybcZfcIbB
	gvUJBzi517JCetRkKeNNwwSYv9zMXa8jcDebx/h3dRqe/YsIzYIJnO+9Mhfy8IXU
	xiwXOeJ9jbDoDhL6D36WWzlFvomuefb1oK4S0/rXx1vVsbXPKSAiaOaMK39KywOU
	oni1g4t83+mG8LbxbqEidTkMzJmq9yPIs5nxkJpZuwnEwlKi1wBwcT3QFBtQLcrw
	C4N3w4eoXYhrIavrOJrdSsAdP0Fu/kerQDPk6/BUAlJLeFbllEm3RUog=
X-Virus-Scanned: amavisd-new at mykolab.com
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level:
X-Spam-Status: No, score=-1.899 tagged_above=-10 required=5
	tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
	autolearn=ham autolearn_force=no
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Bruno <brunoce@kolabnow.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Acer Aspire 5 A517-52G - No firmware ACIP and no boot
Date: Wed, 3 Aug 2022 09:56:12 +0100
Message-Id: <EB26D6B6-A0AD-4DF4-AF9C-3C59FB213BF7@kolabnow.com>
References: <780f6ed5-24dc-9df0-2d40-f00ea467808d@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <780f6ed5-24dc-9df0-2d40-f00ea467808d@suse.com>
To: Jan Beulich <jbeulich@suse.com>

Understood. This means, someone in this list might be interested in picking t=
his up and implementing a solution to it to the code.

I am glad we have this here now.

Thank you.

> On 3 Aug 2022, at 09:49, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> =EF=BB=BFOn 03.08.2022 10:44, Bruno wrote:
>> Jan, I am glad we see this now!
>>=20
>> Should I report this on the to the linux  kernel dev group?
>=20
> While you might, I'm not sure they would care. Work needs to be done in
> the hypervisor first, with Linux making use of the added functionality
> (i.e. presumably a new hypercall sub-function) only afterwards.
>=20
> Jan


