Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 820CE330AD5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 11:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94767.178452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCoJ-0007HL-3K; Mon, 08 Mar 2021 10:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94767.178452; Mon, 08 Mar 2021 10:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJCoI-0007Gz-W2; Mon, 08 Mar 2021 10:08:22 +0000
Received: by outflank-mailman (input) for mailman id 94767;
 Mon, 08 Mar 2021 10:08:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJCoH-0007Go-W9
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 10:08:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bdfe8175-2bef-40ab-a75e-2465cf0d18ec;
 Mon, 08 Mar 2021 10:08:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 516C2AD21;
 Mon,  8 Mar 2021 10:08:20 +0000 (UTC)
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
X-Inumbo-ID: bdfe8175-2bef-40ab-a75e-2465cf0d18ec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615198100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8igKPNfpqU7zE7zUDr+iOm2x4LW/QFrThygf8LahdfI=;
	b=ddociSuUtZky4Mz7K6RTWL4yGeYkGnK2Oiul2eDhMnPkv1T1Vl4CKZqfgwSzoR2Q+J14b8
	cQ8fiZ+U8hvzE8JrXAodW6RXO4KIAUqaeF4qdZSOqRG10RpY9mwO8cHi0BK4UoHsUPgU8f
	YQbaOdKKGF/TcKsDbgk6odNrPTaKlaQ=
Subject: Re: [PATCH 2/2] tools/x86: move arch-specific include/xen/ population
 into arch-specific rule
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <d08ec3ba-dff1-cb1c-9103-949e15774fd5@suse.com>
 <0702c375-4769-7246-ba47-613ed69330e1@suse.com>
 <24645.62936.623189.553418@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dac82dfb-6800-d76a-cdd2-05a47252df6b@suse.com>
Date: Mon, 8 Mar 2021 11:08:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24645.62936.623189.553418@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 11:00, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 2/2] tools/x86: move arch-specific include/xen/ population into arch-specific rule"):
>> There's no need for the common "xen-dir" rule to have an arch-specific
>> part when there already is a arch-specific rule where this can be taken
>> care of.
> 
> I think the symlinks being made in this arch-specific code are more
> logically part of the xen-dir target than part of the all target.

But that's true of what has been in all-$(CONFIG_X86) as well, isn't it?
It's all about populating xen/.

Jan

