Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11D281097
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1847.5572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOIIp-00048e-3i; Fri, 02 Oct 2020 10:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1847.5572; Fri, 02 Oct 2020 10:28:39 +0000
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
	id 1kOIIp-00048F-0W; Fri, 02 Oct 2020 10:28:39 +0000
Received: by outflank-mailman (input) for mailman id 1847;
 Fri, 02 Oct 2020 10:28:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOIIo-00048A-3j
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:28:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18f87fbd-97f6-4bde-a329-13d8d12fdeef;
 Fri, 02 Oct 2020 10:28:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9EEC6ACC6;
 Fri,  2 Oct 2020 10:28:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOIIo-00048A-3j
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 10:28:38 +0000
X-Inumbo-ID: 18f87fbd-97f6-4bde-a329-13d8d12fdeef
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 18f87fbd-97f6-4bde-a329-13d8d12fdeef;
	Fri, 02 Oct 2020 10:28:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601634515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4UCAj3UTPnfjBSq1QDPEFFl5FD4FiGnBBNdrOKwf1mE=;
	b=fwvii5KasWFgtIU2Zg2WRzdQY2UmVBWq4tLwe9zc8R0XTjL6APB7LlBZoaY/pW2dn59qi9
	od11pZlZ6YmfrdvSi8jGtP0Sveg3zx8+1C45kz3PbDt8y1FPtTBheeeSfZsNLzawmlFyKx
	9GWqI89POxc5qNkW8PZiguAjMb3ZJjc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9EEC6ACC6;
	Fri,  2 Oct 2020 10:28:35 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/3] x86: plug 2 vCPU creation resource leaks + some cleanup
Message-ID: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
Date: Fri, 2 Oct 2020 12:28:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

1: vLAPIC: don't leak regs page from vlapic_init() upon error
2: fix resource leaks on arch_vcpu_create() error path
3: vLAPIC: vlapic_init() runs only once for a vCPU

Jan

