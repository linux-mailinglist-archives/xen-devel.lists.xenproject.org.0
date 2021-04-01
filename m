Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314F3512BD
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104258.199198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu0e-0006H7-Mt; Thu, 01 Apr 2021 09:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104258.199198; Thu, 01 Apr 2021 09:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRu0e-0006Gi-Jc; Thu, 01 Apr 2021 09:53:04 +0000
Received: by outflank-mailman (input) for mailman id 104258;
 Thu, 01 Apr 2021 09:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRu0d-0006GN-CK
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:53:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc26323c-72f3-498e-ab02-fd8648a1f5f6;
 Thu, 01 Apr 2021 09:53:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4C8AFAEF5;
 Thu,  1 Apr 2021 09:53:01 +0000 (UTC)
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
X-Inumbo-ID: cc26323c-72f3-498e-ab02-fd8648a1f5f6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270781; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vNiUNwZ+aiEw9xOsPoj4ZZ2Cw6r47zSUiseZb9FdFBQ=;
	b=sHYTkEGMb4g8QbEC7jeXduHsoZrBIi8HGDBqX1gLcCZXyW91j8M+GbGCUuQMQuAIDCagNE
	R/VPViDCkifgc4dSkXkVsu1aLDVq1zdozq+K1oFt875CDBy4F4jK9gchS++ZD3VzhToGyG
	3em4PsP8ck/IZtLg2qG87an1aLyu4fk=
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 0/3] x86/time: calibration rendezvous adjustments
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Message-ID: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
Date: Thu, 1 Apr 2021 11:53:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The first patch was, under a different title and with a different
approach, already part of the prior series of the same subject.
The other two patches are new, resulting from me spotting further
room for improvement (or so I hope).

1: latch to-be-written TSC value early in rendezvous loop
2: yield to hyperthreads after updating TSC during rendezvous
3: avoid reading the platform timer in rendezvous functions

Jan

