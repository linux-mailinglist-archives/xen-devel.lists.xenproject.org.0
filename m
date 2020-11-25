Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376E82C3B44
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 09:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37430.69788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqOE-0002ui-2n; Wed, 25 Nov 2020 08:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37430.69788; Wed, 25 Nov 2020 08:43:02 +0000
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
	id 1khqOD-0002uJ-W2; Wed, 25 Nov 2020 08:43:01 +0000
Received: by outflank-mailman (input) for mailman id 37430;
 Wed, 25 Nov 2020 08:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqOC-0002uE-PL
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:43:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee7ec38e-885f-4406-99b6-cc469fac6b06;
 Wed, 25 Nov 2020 08:42:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89E6AABD7;
 Wed, 25 Nov 2020 08:42:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqOC-0002uE-PL
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 08:43:00 +0000
X-Inumbo-ID: ee7ec38e-885f-4406-99b6-cc469fac6b06
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ee7ec38e-885f-4406-99b6-cc469fac6b06;
	Wed, 25 Nov 2020 08:42:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606293778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DPHuqGl4qpSo8PE8TebKnbH3KKmtBNPNXBMO5S57Ukg=;
	b=Rv9MxrKo5/oWxU5PyYUwjOikRjxCOmFa35odDUDj/KkS4Mum1tZ6CT0WUzKuw5VtsErbre
	KbeHQFaIhrh/N373jrGMOebszs5NDqd+J9hvlEE6ESnTMxGwY4lj+YU985qy4/BDGBRmzl
	Lwl0RLCueA67Hk1zJYMdE20X38frk+U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 89E6AABD7;
	Wed, 25 Nov 2020 08:42:58 +0000 (UTC)
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/5] x86: asm-offsets.h and !PV32 adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
Date: Wed, 25 Nov 2020 09:42:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The 2nd and 3rd patches here effectively called for the latter
two to also be created, hence why they all live together.

1: build: limit rebuilding of asm-offsets.s
2: build: limit #include-ing by asm-offsets.h
3: build: restrict contents of asm-offsets.h when !HVM / !PV
4: hypercall vector is unused when !PV32
5: don't build unused entry code when !PV32

Jan

