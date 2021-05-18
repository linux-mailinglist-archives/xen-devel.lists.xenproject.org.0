Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18C5387D20
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 18:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129419.242926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2L3-0008En-OG; Tue, 18 May 2021 16:12:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129419.242926; Tue, 18 May 2021 16:12:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj2L3-0008Bp-Kr; Tue, 18 May 2021 16:12:57 +0000
Received: by outflank-mailman (input) for mailman id 129419;
 Tue, 18 May 2021 16:12:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lj2L2-0008B1-3E
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 16:12:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23203f20-c267-4e8d-813d-f49cf3375082;
 Tue, 18 May 2021 16:12:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A422EB020;
 Tue, 18 May 2021 16:12:54 +0000 (UTC)
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
X-Inumbo-ID: 23203f20-c267-4e8d-813d-f49cf3375082
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621354374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cq7biW7fc2hJQfE/Ns6QbKXcGZHWBPzcWQpMIgj02jo=;
	b=FJmcwiWscyjGUmggt+4X9eKg9IH90QGIU0LrfnELuMWGKftEl0olyHQMuUuUoSiWNyClXH
	LD/WxvOBLy6rDO0WTFU6qqNeZen4DzLp0iaof4xZ8oVQttETaRnS9RSL40D/0WYTE715bS
	/IHwzSsc5RNzommPKH7V2Ry2Rnv++98=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] xen-pciback: a fix and a workaround
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Konrad Wilk <konrad.wilk@oracle.com>
Message-ID: <38774140-871d-59a4-cf49-9cb1cc78c381@suse.com>
Date: Tue, 18 May 2021 18:12:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first change completes a several years old but still incomplete
change. As mentioned there, reverting the original change may also
be an option. The second change works around some odd libxl behavior,
as described in [1]. As per a response to that mail addressing the
issue in libxl may also be possible, but it's not clear to me who
would get to doing so at which point in time. Hence the kernel side
alternative is being proposed here.

As to Konrad being on the Cc list: I find it puzzling that he's
listed under "XEN PCI SUBSYSTEM", but pciback isn't considered part
of this.

1: redo VF placement in the virtual topology
2: reconfigure also from backend watch handler

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2021-03/msg00956.html

