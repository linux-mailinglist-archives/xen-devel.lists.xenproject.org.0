Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4264D373DEC
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 16:48:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123150.232305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIoq-0003QL-Gt; Wed, 05 May 2021 14:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123150.232305; Wed, 05 May 2021 14:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIoq-0003Ne-Dg; Wed, 05 May 2021 14:48:08 +0000
Received: by outflank-mailman (input) for mailman id 123150;
 Wed, 05 May 2021 14:48:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6083=KA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leIop-0003NX-2n
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 14:48:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21bd878d-f90f-4771-8434-5a8edd9d45a5;
 Wed, 05 May 2021 14:48:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4DDD1AFD8;
 Wed,  5 May 2021 14:48:05 +0000 (UTC)
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
X-Inumbo-ID: 21bd878d-f90f-4771-8434-5a8edd9d45a5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620226085; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Un/nF7d9cHfDIEG6yL1v2j45fHDcpkbofyMtRhUi1o=;
	b=LG5RLWpoRdnEbUBy1U/luIc/GcdmgLKlro0+QZkst+LUL2U2MYzBIK6n0QNN1zA402RF2O
	jC55wMrVy8raU77RM3Aep8vih9OGZCV8rxPqTlaE7vuz3dASCB97sSMwscYYXOnMg5/yiA
	sc0hyr2Ou9lkHjrq0jJoHcJvJE+DBaQ=
Subject: Re: [PATCH] libx86: Introduce x86_cpu_policy_calculate_compatible()
 with MSR_ARCH_CAPS handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210504213120.4179-1-andrew.cooper3@citrix.com>
 <YJJtqyDOIkMxjvxW@Air-de-Roger>
 <8f6f339b-f025-2cd0-e666-a3083e79af3a@citrix.com>
 <YJKXZyCHpRg32tyc@Air-de-Roger>
 <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb2089cf-74f3-a7f2-7001-21a0d009440f@suse.com>
Date: Wed, 5 May 2021 16:48:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <38f5b74f-b005-784b-a92d-8ddb9e1b8d3c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05.05.2021 16:29, Andrew Cooper wrote:
> Technically, MCXSR_MASK is also a hard blocker to migration, but we
> don't even have that data in a consumable form, and we just might be
> extremely lucky and discover that it is restricted to non-64-bit CPUs.

"it" being what here? The value's presence / absence in an {F,}XSAVE
image? Or the precise value of it?

Jan

