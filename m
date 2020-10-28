Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B506F29CF0B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Oct 2020 09:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.13374.33990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXgwn-0000cq-E7; Wed, 28 Oct 2020 08:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13374.33990; Wed, 28 Oct 2020 08:36:45 +0000
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
	id 1kXgwn-0000cQ-Ap; Wed, 28 Oct 2020 08:36:45 +0000
Received: by outflank-mailman (input) for mailman id 13374;
 Wed, 28 Oct 2020 08:36:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kXgwl-0000cL-HY
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:36:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f61a7d05-237b-4401-8aae-95e8f3e3d227;
 Wed, 28 Oct 2020 08:36:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3F8BACB6;
 Wed, 28 Oct 2020 08:36:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=aZyU=ED=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kXgwl-0000cL-HY
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 08:36:43 +0000
X-Inumbo-ID: f61a7d05-237b-4401-8aae-95e8f3e3d227
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f61a7d05-237b-4401-8aae-95e8f3e3d227;
	Wed, 28 Oct 2020 08:36:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603874201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jLMEeVZNG/TEx5W5KQGMjELEYzd5LmrPPQ+A8SlDNh8=;
	b=uFaAZ97EieKwShiVlzUskCn3WKBGlJUgULa5C5sBccIwEhoFGIQGdCuHol0ErvVZNh2JLl
	TJWlGWg5VNBssmfLJFT/mahgboyWIQ+5OxrZBLtSNb55y63m6ZicLeijDuOk8Ap6dQeiGJ
	bgRDPuUAdnp2Jn671jZgCh9Y33lzIz0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B3F8BACB6;
	Wed, 28 Oct 2020 08:36:41 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/ucode: Introduce ucode=allow-same for testing
 purposes
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
References: <20201026172519.17881-1-andrew.cooper3@citrix.com>
 <20201026172519.17881-4-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8033edf2-f77f-e454-63cf-6fb1f2c9e08c@suse.com>
Date: Wed, 28 Oct 2020 09:36:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201026172519.17881-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.10.20 18:25, Andrew Cooper wrote:
> Many CPUs will actually reload microcode when offered the same version as
> currently loaded.  This allows for easy testing of the late microcode loading
> path.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Igor Druzhinin <igor.druzhinin@citrix.com>
> 
> I was hoping to make this a runtime parameter, but I honestly can't figure out
> the new HYPFS-only infrastructure is supposed to work.

For your use case have a look into xen/arch/x86/hvm/vmx/vmcs.c how the
"ept" runtime parameter is handled.

This is a similar case where one sub-option can be modified at runtime.


Juergen

