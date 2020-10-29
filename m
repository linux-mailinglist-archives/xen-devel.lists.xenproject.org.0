Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D159B29F297
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 18:08:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14386.35538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYBP3-0001DZ-W3; Thu, 29 Oct 2020 17:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14386.35538; Thu, 29 Oct 2020 17:07:57 +0000
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
	id 1kYBP3-0001Cb-QK; Thu, 29 Oct 2020 17:07:57 +0000
Received: by outflank-mailman (input) for mailman id 14386;
 Thu, 29 Oct 2020 17:07:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kYBP1-0001Bl-Mr
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:07:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae50ef18-0294-4033-ae69-3f325dc3fbfb;
 Thu, 29 Oct 2020 17:07:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CDD10ACDF;
 Thu, 29 Oct 2020 17:07:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kYBP1-0001Bl-Mr
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 17:07:55 +0000
X-Inumbo-ID: ae50ef18-0294-4033-ae69-3f325dc3fbfb
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ae50ef18-0294-4033-ae69-3f325dc3fbfb;
	Thu, 29 Oct 2020 17:07:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603991273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiK9X/wvAAM8i0u+8KFD3nOrXT+gEzyAGqGIL6zpRJk=;
	b=UbRDxNJdobdbOGPeJcV1Weur0qpCxoNe7g15zYZhhUNfii9r9Ow1GPTIkozDZRB4OzBEw+
	eUH6k8JJby129Tz7H35Bxau7wAVpx7FwDSpHKlZFgXhIIQWiAFZjTlFfSzXc7yXC7grQTX
	EdtZQSXceE3G3WtqqstLC1L0jUPezNo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CDD10ACDF;
	Thu, 29 Oct 2020 17:07:53 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] x86: PV shim vs grant table
Message-ID: <94c18ebf-632d-8a2c-220c-c31d6e37eb55@suse.com>
Date: Thu, 29 Oct 2020 18:07:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While Andrew reported a randconfig build failure, I started wondering
why we'd ever build in a way different from what had failed to build.
Fix the build and then switch the shim config file accordingly.

1: fix build of PV shim when !GRANT_TABLE
2: PV shim doesn't need GRANT_TABLE

Jan

