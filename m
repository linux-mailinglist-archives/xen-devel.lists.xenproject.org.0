Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B2394379
	for <lists+xen-devel@lfdr.de>; Fri, 28 May 2021 15:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133936.249449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmckU-0005qk-M7; Fri, 28 May 2021 13:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133936.249449; Fri, 28 May 2021 13:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmckU-0005nh-Hp; Fri, 28 May 2021 13:42:02 +0000
Received: by outflank-mailman (input) for mailman id 133936;
 Fri, 28 May 2021 13:42:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wdiM=KX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmckS-0005nI-Mp
 for xen-devel@lists.xenproject.org; Fri, 28 May 2021 13:42:00 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6ec4b3c-0d6f-48da-a4ef-c1438f7acfee;
 Fri, 28 May 2021 13:41:59 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F3DB11FD2E;
 Fri, 28 May 2021 13:41:58 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C3E6D11A98;
 Fri, 28 May 2021 13:41:58 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nhWmLibzsGAqUQAALh3uQQ
 (envelope-from <jbeulich@suse.com>); Fri, 28 May 2021 13:41:58 +0000
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
X-Inumbo-ID: b6ec4b3c-0d6f-48da-a4ef-c1438f7acfee
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622209319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dsxnym2Edb8D8ioPAlnFYNHlty7zrn/wpCqrfApi17Y=;
	b=Qt+UkaJTUz5S8s5jqrK/QYBHB39/clK8RBPdLYyjqN/qKDBl6m4os8wcSHxgg8NTqINWIZ
	0s50OnLWtRM3O/YQ5+XAzW2IlG39KcBYOzoZ+mnoJZza4qLMbWaYHBbkt78BW2+ZoM/ndw
	j16wJnj0k4NVySgUri3398QJKZO47bQ=
Subject: Re: [PATCH v6 1/3] evtchn: slightly defer lock acquire where possible
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <01bbf3d4-ca6a-e837-91fe-b34aa014564c@suse.com>
 <5939858e-1c7c-5658-bc2d-0c9024c74040@suse.com>
 <938eb888-ec15-feb1-19f7-b90dfee822ae@xen.org>
 <YLCqQz9xS4HEpabG@Air-de-Roger>
 <27d54d81-bec8-5bc7-39cd-60e9761e726b@suse.com>
 <079f2f2a-0797-b650-ff47-7e595ab29589@xen.org>
 <YLDwuQrJsYU9PAFT@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68f032b6-62a0-c472-8b10-ec26d0407c93@suse.com>
Date: Fri, 28 May 2021 15:41:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLDwuQrJsYU9PAFT@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.05.2021 15:31, Roger Pau Monné wrote:
> I think I'm being extremely dull here, sorry. From your text I
> understand that the value returned by is_port_valid could be stale by
> the time the user reads it?
> 
> I think there's some condition that makes this value stale, and it's
> not the common case?

It's evtchn_destroy() running in parallel which can have this effect.

Jan

