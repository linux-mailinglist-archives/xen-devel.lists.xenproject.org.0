Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4EB3690BB
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 13:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116182.221802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtXd-0005Yw-L7; Fri, 23 Apr 2021 11:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116182.221802; Fri, 23 Apr 2021 11:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZtXd-0005YW-Hr; Fri, 23 Apr 2021 11:00:09 +0000
Received: by outflank-mailman (input) for mailman id 116182;
 Fri, 23 Apr 2021 11:00:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vTXC=JU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZtXb-0005UR-Ct
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 11:00:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7c756ed-6085-4756-b8de-842ec980242c;
 Fri, 23 Apr 2021 11:00:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1AA9B06A;
 Fri, 23 Apr 2021 11:00:05 +0000 (UTC)
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
X-Inumbo-ID: c7c756ed-6085-4756-b8de-842ec980242c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619175605; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vqIIGpVhwdgqU0V3/pxrgUh3+hfFqa6O/5aIiLJaxLo=;
	b=sUC3cDfRdTVV+Lm/GvQ6wPiPeQ5fdpJ8AISdiKETzWK7Agl3vLRz+OM1pNHZZD5nMtmwFk
	JYCcEzeRVavlVJXyDLNb798GvwmZlApyP6hdFMHVrxKkxDqagiyROvg+d+oFH15FxTqH11
	qMH3iFrubZyV1VaFYt+Fsfn1Pe8O1z4=
Subject: Really v5 (was: [PATCH v4 0/3] VMX APIC access page and shadow
 adjustments)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Message-ID: <55ba772b-923f-dfc5-aa42-c6874c792698@suse.com>
Date: Fri, 23 Apr 2021 13:00:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.04.2021 12:51, Jan Beulich wrote:
> 1: VMX: use a single, global APIC access page
> 2: x86/shadow: re-use variables in shadow_get_page_from_l1e()
> 3: x86/shadow: streamline shadow_get_page_from_l1e()

I'm sorry, I'm noticing only now that I've typoed the version.

Jan

