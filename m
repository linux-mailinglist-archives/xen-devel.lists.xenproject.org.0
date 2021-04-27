Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5532536BF69
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 08:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118024.223971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHUn-0006aq-Ez; Tue, 27 Apr 2021 06:46:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118024.223971; Tue, 27 Apr 2021 06:46:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbHUn-0006aU-Bc; Tue, 27 Apr 2021 06:46:57 +0000
Received: by outflank-mailman (input) for mailman id 118024;
 Tue, 27 Apr 2021 06:46:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbHUm-0006aP-8t
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 06:46:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c73d739-c057-45de-865f-6f894cfe2563;
 Tue, 27 Apr 2021 06:46:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6926AAF8C;
 Tue, 27 Apr 2021 06:46:54 +0000 (UTC)
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
X-Inumbo-ID: 3c73d739-c057-45de-865f-6f894cfe2563
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619506014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bxnl+t91Qu4B3Nz/2s7RePJqK+7uiTp5BaSl7tQspJY=;
	b=l/Q/nN9SKs0EuIF628OE1hap9TJVtqJR1DOQLFcFb8f9/Q9BmrKuWWp4G/av/7nXepkyQ6
	fr5M0V+XYVG8esbggMyAw09xGNcwAm3Pihte+7hFoWmkZ7BRK3TJSBJ6XkRep+DaEBG9Sb
	IN1vFfTfhKfuf8WayiTr0K0wVbpGJM4=
Subject: Re: [PATCH 0/3] x86: Initial pieces for guest CET support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03630ebd-861e-b02c-e845-1e2324211562@suse.com>
Date: Tue, 27 Apr 2021 08:46:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210426175421.30497-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.04.2021 19:54, Andrew Cooper wrote:
> Some initial pieces for guest support.  Everything will currently malfunction
> for VMs which explicitly opt in to CET_SS/IBT.
> 
> Still TODO as a minimum:
>  * Teach the pagewalk logic about shadow stack accesses and errors.
>  * Emulator support for the new instructions.  WRUSS is an irritating corner
>    case, requiring a change to how we express pagewalk inputs, as
>    user/supervisor is no longer dependent on CPL.

I can put this on my todo list, considering that I'm the one to play
with the emulator the most. Just let me know if you would prefer to
do it yourself. (Otherwise my next item there after AMX is now
complete would have been KeyLocker insns.)

>  * Context switching of U/S_CET state.  Recommended way is with XSAVES, except
>    the S_CET has broken sematics - it ends up as a mix of host and guest
>    state, and isn't safe to XRSTOR without editing what the CPU wrote out.

Hmm, I wasn't aware of quirks here - would you mind going into more
detail?

> The above ought to suffice for getting some XTF testing in place.  For general
> guest support:
>  * In-guest XSAVES support.  Windows is the only OS to support CET at the time
>    of writing, and it cross-checks for XSAVES.  Linux expected to perform the
>    same cross-check in due course.

What specifically do you mean here? The XSAVES CPU feature is marked
'S', so ought to be visible to Windows. Hence I guess you mean support
for the respective XSS bits?

Jan

