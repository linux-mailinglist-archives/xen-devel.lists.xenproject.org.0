Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A030391260
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 10:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132388.246960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lloxC-0006iy-GE; Wed, 26 May 2021 08:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132388.246960; Wed, 26 May 2021 08:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lloxC-0006fb-D8; Wed, 26 May 2021 08:31:50 +0000
Received: by outflank-mailman (input) for mailman id 132388;
 Wed, 26 May 2021 08:31:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lloxB-0006fV-Ii
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 08:31:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7228b69c-c542-4673-93ab-84065a47279e;
 Wed, 26 May 2021 08:31:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92AB7B122;
 Wed, 26 May 2021 08:31:47 +0000 (UTC)
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
X-Inumbo-ID: 7228b69c-c542-4673-93ab-84065a47279e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622017907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c+k/yzqGlAGx0UctOAHow0WXoiiTdCLO+6Z7UG8i2ro=;
	b=erRdeD3VOz6+be+GDCqCdp+jSfHsaqPflBPKbpQXDaEojRPCZS4h4rNFFh5u/DdwLFThH5
	2gDsFPilL9ZTdjprn+6w4JAs7watJUHM2RlVZqgJAbwhiqFefsvDVnfJT++J7PDmlYWHkf
	AxF5qJIRCXSlpt7mU7sZMY6fd1MH+lc=
Subject: Re: [PATCH v2] firmware/shim: UNSUPPORTED=n
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>
References: <19695ffc-34d8-b682-b092-668f872d4e57@suse.com>
 <72b98382-34ba-6e9d-c90e-c913dfe66258@suse.com>
 <YK4Gbz0fat7DRY+o@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50ca498e-a95f-f187-2fdb-70f5a1978bfe@suse.com>
Date: Wed, 26 May 2021 10:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YK4Gbz0fat7DRY+o@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.05.2021 10:27, Roger Pau Monné wrote:> It's also confusing that the scheduler that gets set as the default> when shim exclusive is selected is not available to enable/disable:> > [*] Credit scheduler support (NEW)> [*] Credit2 scheduler support (NEW)>     Default Scheduler? (Null Scheduler)  --->
I don't view this as confusing - we want the null scheduler there in
this case, unconditionally. But yes, the prompt's condition could of
course also have "PV_SHIM || " added.

Jan

