Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8468940CF2B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 00:03:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187932.336961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQcz6-00066I-ND; Wed, 15 Sep 2021 22:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187932.336961; Wed, 15 Sep 2021 22:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQcz6-000640-JY; Wed, 15 Sep 2021 22:02:28 +0000
Received: by outflank-mailman (input) for mailman id 187932;
 Wed, 15 Sep 2021 22:02:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vf4E=OF=yandex.ru=isaikin-dmitry@srs-us1.protection.inumbo.net>)
 id 1mQcz4-00063u-ND
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 22:02:27 +0000
Received: from forward500p.mail.yandex.net (unknown [77.88.28.110])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 185c1760-c4c5-402a-ae21-d4861e70dcb7;
 Wed, 15 Sep 2021 22:02:24 +0000 (UTC)
Received: from iva5-d37fe543de32.qloud-c.yandex.net
 (iva5-d37fe543de32.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:6a6:0:640:d37f:e543])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 3ED3BF0207B;
 Thu, 16 Sep 2021 01:02:22 +0300 (MSK)
Received: from 2a02:6b8:c0c:128f:0:640:c3f7:29dd
 (2a02:6b8:c0c:128f:0:640:c3f7:29dd [2a02:6b8:c0c:128f:0:640:c3f7:29dd])
 by iva5-d37fe543de32.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 H2ge3P1Df8c1-2LDmrj27; Thu, 16 Sep 2021 01:02:21 +0300
Received: by iva4-c3f729ddadf7.qloud-c.yandex.net with HTTP;
 Thu, 16 Sep 2021 01:02:20 +0300
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
X-Inumbo-ID: 185c1760-c4c5-402a-ae21-d4861e70dcb7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1631743341;
	bh=8dOvvtT153yNC1427nLKREV1Y00TVP3qVUTQ6ci4o80=;
	h=References:Date:Message-Id:Cc:Subject:In-Reply-To:To:From;
	b=M21wcaZbiby4Ql+v51FCUqUNb8Gpet9iKHXZR0KAOfHBWISs/4fVMBbWzHwbFynHP
	 6RtaKe9HbiIMMKRGJpLFVOyPxVTqefJWWxja0gxTOCITWOwWudP+keaXV+nmX6FStn
	 2UehyeMR6SrpwjlXpCsS6j3tob3ggR9VEfzFT5rM=
Authentication-Results: iva5-d37fe543de32.qloud-c.yandex.net; dkim=pass header.i=@yandex.ru
From: =?utf-8?B?0JTQvNC40YLRgNC40Lkg0JjRgdCw0LnQutC40L0=?= <isaikin-dmitry@yandex.ru>
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <24896.33446.713051.453627@mariner.uk.xensource.com>
References: <cover.1631555561.git.isaikin-dmitry@yandex.ru>
	<9dc667d2017e6e69877a2b9859041c1f7d965899.1631555561.git.isaikin-dmitry@yandex.ru> <24896.33446.713051.453627@mariner.uk.xensource.com>
Subject: Re: [PATCH 1/1] tools/xl: Fix regular expression for autobaloon mode detection based on xen command line.
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 16 Sep 2021 01:02:20 +0300
Message-Id: <237131631740227@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/html; charset=utf-8

<div><div>I checked only the cases "dom0_mem=101376M" and "dom0_mem=-24832M,max:-24832M".</div><div>In both cases, the regex worked correctly.</div></div><div> </div><div><div>Simultaneous restoration of several (1-15) virtual machines from snapshots also works stably in our production (on xen 4.14).</div></div><div> </div><div>14.09.2021, 14:08, "Ian Jackson" &lt;iwj@xenproject.org&gt;:</div><blockquote><p>Dmitry Isaikin writes ("[PATCH 1/1] tools/xl: Fix regular expression for autobaloon mode detection based on xen command line."):</p><blockquote> The case of specifying a negative size was handled incorrectly.</blockquote><p><br />Thank you. The change looks good to me. Did you test that after your<br />change, the functionality works ?<br /><br />Ian.</p></blockquote>

