Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D32A310B7A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:01:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81698.151050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80jE-0007m3-Fn; Fri, 05 Feb 2021 13:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81698.151050; Fri, 05 Feb 2021 13:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l80jE-0007le-CV; Fri, 05 Feb 2021 13:00:52 +0000
Received: by outflank-mailman (input) for mailman id 81698;
 Fri, 05 Feb 2021 13:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IalI=HH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l80jD-0007lZ-GB
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:00:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c82199b5-909c-4ba3-90c0-af5004520987;
 Fri, 05 Feb 2021 13:00:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 359E7AC9B;
 Fri,  5 Feb 2021 13:00:48 +0000 (UTC)
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
X-Inumbo-ID: c82199b5-909c-4ba3-90c0-af5004520987
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612530048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJ8XZqZ4agGo/b1N2M5QIXp5x/7fc7ETiotJmZXoBeo=;
	b=Or3YV8AFZ3UeJQDoWS4AvgIaqnnN2WN8Ygqbh4D1m0EMTPWCs+snK3vyKppCegHLde8v+q
	pqOEzvhl4zqehQgCfvdLCkb0A2oDvwfc2Fi8hSxyLPU+NLJ/v55MUrvP7wp6Yu+WT/73Ly
	cfniI1/6tPHDxQXZ6HvJSVaA5MW6qRM=
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6cf3dbc-9f82-8e1a-e088-f7ae036d16e3@suse.com>
Date: Fri, 5 Feb 2021 14:00:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.02.2021 11:56, Jürgen Groß wrote:
> As we need to consider backports of processor bug mitigations
> in old guests, too, I think we need to have a "catch-all"
> fallback.
> 
> Not being able to run an old updated guest until we add handling
> for a new MSR isn't a viable option IMO.

I'm not sure I follow you here: Such backports should still make
use of the respective CPUID bits, and hence shouldn't contain
"blind" MSR accesses. And if there's really something needing to
probe an MSR, then I'd expect such a backport to make sure the
probing actually works in a prereq (presumably) backport.

Jan

