Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7103605D7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 11:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110962.212039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyN3-0000KT-MU; Thu, 15 Apr 2021 09:33:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110962.212039; Thu, 15 Apr 2021 09:33:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyN3-0000Jp-JK; Thu, 15 Apr 2021 09:33:09 +0000
Received: by outflank-mailman (input) for mailman id 110962;
 Thu, 15 Apr 2021 09:33:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWyN2-0000Jk-5J
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 09:33:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e46d24e-532e-41b7-93cf-ff3160e497d6;
 Thu, 15 Apr 2021 09:33:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04F3BB1E9;
 Thu, 15 Apr 2021 09:33:06 +0000 (UTC)
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
X-Inumbo-ID: 6e46d24e-532e-41b7-93cf-ff3160e497d6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618479186; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cu8lOUmCNVpGaa9ENLLh2dwSXaGH+rjyXb081TNyKoY=;
	b=Zos+HhiHRRHoZSbC5GS8N1b2iGTO8lPUQ+gTduIi8jaj0IZ3pxJzVINtBtvxxti+ga7NYV
	L7wP1PE40CxINv2+++f8at/kShKNp5CO28oM4fsvJqKoZpxhR7rT7qEk3B/akzjychZCDv
	gqyS793B8y5HBvZQ3yP1QReVTB76CxE=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86: is_pv*domain() adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <3bc868c1-1003-2f80-1617-d64a1e7441bc@suse.com>
Date: Thu, 15 Apr 2021 11:33:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: correct is_pv_domain() when !CONFIG_PV
2: use is_pv_64bit_domain() to avoid double evaluate_nospec()

Jan

