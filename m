Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB782A4373
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:55:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18223.43154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtxr-0004lN-Cw; Tue, 03 Nov 2020 10:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18223.43154; Tue, 03 Nov 2020 10:54:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtxr-0004ky-9j; Tue, 03 Nov 2020 10:54:59 +0000
Received: by outflank-mailman (input) for mailman id 18223;
 Tue, 03 Nov 2020 10:54:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtxp-0004kt-AE
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:54:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3930e305-901e-4d5c-9c4b-75858e291101;
 Tue, 03 Nov 2020 10:54:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BFD6ACA3;
 Tue,  3 Nov 2020 10:54:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtxp-0004kt-AE
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:54:57 +0000
X-Inumbo-ID: 3930e305-901e-4d5c-9c4b-75858e291101
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 3930e305-901e-4d5c-9c4b-75858e291101;
	Tue, 03 Nov 2020 10:54:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604400895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oV/mDKp+mMMwMLDcuxuCHfmSupqxXZf2vCXQnS4sp20=;
	b=KxhMsVlVWGe3m5z1HBJ6pWdybTdrSCA67i4+8zFNF+cb3KdKiqSotJlAjYctt8F6fWVPXF
	J5edqeKWycetFymAJ1QtlYUxM/Qjm9vIz0w6+22RVyURlnz0YieYY43qddMt8jwLf3KgM0
	jQ5ZGyAGlhcBGRX5yi5aZ7KFfcjRr6o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4BFD6ACA3;
	Tue,  3 Nov 2020 10:54:55 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86/PV: memory management consistency and minor
 relaxations
Message-ID: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Date: Tue, 3 Nov 2020 11:54:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Especially the latter three patches provide only small possible
gains, from all I can tell. I nevertheless wanted to put up the
entire set for consideration.

1: consistently inline {,un}adjust_guest_l<N>e()
2: fold redundant calls to adjust_guest_l<N>e()
3: _PAGE_RW changes may take fast path of mod_l[234]_entry()
4: restrict TLB flushing after mod_l[234]_entry()
5: avoid TLB flushing after mod_l3_entry()

Jan

