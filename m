Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC93716E4
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:46:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121660.229452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZqL-0004iJ-By; Mon, 03 May 2021 14:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121660.229452; Mon, 03 May 2021 14:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldZqL-0004hu-8k; Mon, 03 May 2021 14:46:41 +0000
Received: by outflank-mailman (input) for mailman id 121660;
 Mon, 03 May 2021 14:46:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldZqJ-0004hp-Ew
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:46:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c2a5f07-55ae-437a-8979-a7c9b3462e92;
 Mon, 03 May 2021 14:46:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4FE0FB19B;
 Mon,  3 May 2021 14:46:37 +0000 (UTC)
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
X-Inumbo-ID: 3c2a5f07-55ae-437a-8979-a7c9b3462e92
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620053197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eT4aP9mmfvbYpaF/Aa54jjFTrk212r7i0SUa9wwU5SU=;
	b=Yp0BSqJe/c5j4RNr/AdhmeWekomtajcLiggsSOCB3hXmaRwKW3gdVSj5ipJsRZTeqZU85U
	RJPTBRfYsS9b911uCOQTC8wK5VBeynkKbgL/shzKrD/JUTSVYC48ymB8mAWIiT3UnDuE8O
	VDOsccTwyekXRzC5fs38t/7oyWb9Dwo=
Subject: Re: [PATCH v4 3/3] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <cover.1619707144.git.rahul.singh@arm.com>
 <60b4c33fdcc2f7ad68d383ffae191e22b0b32f1c.1619707144.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbc50008-da47-a5e2-501b-a9c06ce38335@suse.com>
Date: Mon, 3 May 2021 16:46:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <60b4c33fdcc2f7ad68d383ffae191e22b0b32f1c.1619707144.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.04.2021 16:46, Rahul Singh wrote:
> MSI code that implements MSI functionality to support MSI within XEN is
> not usable on ARM. Move the code under CONFIG_HAS_PCI_MSI_INTERCEPT flag
> to gate the code for ARM.
> 
> Currently, we have no idea how MSI functionality will be supported for
> other architecture therefore we have decided to move the code under
> CONFIG_PCI_MSI_INTERCEPT. We know this is not the right flag to gate the
> code but to avoid an extra flag we decided to use this.

My objection remains: Actively putting code under the wrong gating
CONFIG_* is imo quite a bit worse than keeping it under a too wide one
(e.g. CONFIG_X86), if introducing a separate CONFIG_HAS_PCI_MSI is
deemed undesirable for whatever reason. Otherwise every abuse of
CONFIG_PCI_MSI_INTERCEPT ought to get a comment to the effect of this
being an abuse, which in particular for code you move into
xen/drivers/passthrough/msi-intercept.c would end up sufficiently odd.
(As a minor extra remark, putting deliberately misplaced code at the
top of a file rather than at its bottom is likely to add to possible
confusion down the road.)

Jan

