Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6153939049
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762014.1172104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtdB-00016x-C1; Mon, 22 Jul 2024 14:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762014.1172104; Mon, 22 Jul 2024 14:03:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVtdB-00013l-8c; Mon, 22 Jul 2024 14:03:13 +0000
Received: by outflank-mailman (input) for mailman id 762014;
 Mon, 22 Jul 2024 14:03:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k8PV=OW=bounce.vates.tech=bounce-md_30504962.669e669b.v1-1a9b2c75e59f4b8aa2f0f5d86cad38f2@srs-se1.protection.inumbo.net>)
 id 1sVtd9-00013e-3o
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:03:11 +0000
Received: from mail135-10.atl141.mandrillapp.com
 (mail135-10.atl141.mandrillapp.com [198.2.135.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 201d479e-4833-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 16:03:09 +0200 (CEST)
Received: from pmta14.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail135-10.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4WSMSC58dbz5QkLSn
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 14:03:07 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1a9b2c75e59f4b8aa2f0f5d86cad38f2; Mon, 22 Jul 2024 14:03:07 +0000
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
X-Inumbo-ID: 201d479e-4833-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1721656987; x=1721917487;
	bh=MSapFqqTdz9X3vB7aeqkkvWkEwHPCK3gqIlvip3B3fo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=V20wToOj3w8JY5x7ULcuFJU7AwwFTUl95nNP0jtMLG49j+oi60NUWfOH+KHiKtFy4
	 aiiJxF/Kcn0DE3mrLuSyRDZ0JEz6J57lFNiqkJamVLlkcYsWwM7Yeq+RuNszd6SbJf
	 zAzgEL9mV9wXazP//TC9Ez+xGttJVEjxCdW3OBscoRxjFhh3Mz4OzMWYqnRiz5BaTu
	 tqUlzgtuzQV8NID1lCQf0hKgSyFW9nW4JWAcgdea/tju1Se5ml03MVlLAX/z9rE0Dz
	 N2emtKCS7qxEXMAxhmmAnFmS4FRTmW6ssfWm3C69syP4WcQklf13pPyIYc82C5ll19
	 AWRhqYyFBjNEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1721656987; x=1721917487; i=anthony.perard@vates.tech;
	bh=MSapFqqTdz9X3vB7aeqkkvWkEwHPCK3gqIlvip3B3fo=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=df+Pqd294KZfuUjwuPoUKC/Dif7/oz4m7h4YyqF+Ub/7V5aBFbjqccifm/L5BYaT8
	 1kX/IKKXO498irte0VD4oSpJHH9UDh2xY+wllWCqCAuEogdu6SjVu3SfVDat+0P0qn
	 0nczZhb3PMXOkA2YTzRGx69MB9TX1/+bl/Dz7EGykn+IxCOMPM57XAct0iJ+CLCIq1
	 VOIHUoo8bCtP307kYaKPHKv05Gcu+LY1NHl0X3cGmN9sQy1lU/392ljRFEDm0k3cNv
	 leMZ5V9MrLLup9i3BB7b+hLUG7r11oGhbL/synf4ViEQwiaFp9daW66ZUi70XoBBnm
	 KrycFCX+94vuw==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v3=202/2]=20Add=20tools/fuzz/oss-fuzz/build.sh?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1721656984665
To: Jan Beulich <jbeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <Zp5mmA3e45BwiNlE@l14>
References: <20240722112752.4981-1-tamas@tklengyel.com> <20240722112752.4981-2-tamas@tklengyel.com> <9bd41e19-50f7-43e7-b3ce-c2870a836f79@suse.com>
In-Reply-To: <9bd41e19-50f7-43e7-b3ce-c2870a836f79@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1a9b2c75e59f4b8aa2f0f5d86cad38f2?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240722:md
Date: Mon, 22 Jul 2024 14:03:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jul 22, 2024 at 02:20:21PM +0200, Jan Beulich wrote:
> On 22.07.2024 13:27, Tamas K Lengyel wrote:
> > +# SPDX-License-Identifier: Apache-2.0
> 
> ... there wouldn't want to be an "-only" tag here. Yet I'm entirely uncertain
> with this, as CC-BY-4.0 also has no such tag.

FYI, all valid SPDX identifier are listed there:
https://spdx.org/licenses/

"Apache-2.0" is the correct one to use.

Cheers,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

