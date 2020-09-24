Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28273277335
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 15:57:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLRkB-0000kl-GW; Thu, 24 Sep 2020 13:57:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2aH=DB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kLRkA-0000kd-Ag
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 13:57:06 +0000
X-Inumbo-ID: 0e25af03-774e-4bd1-b7ba-93cc1266fb2c
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e25af03-774e-4bd1-b7ba-93cc1266fb2c;
 Thu, 24 Sep 2020 13:57:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600955825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kMkKFU8JZMqFZmxjQU9djdmjoC3W0J2Xrpey80MwLAw=;
 b=Xbxuqf6kWAUF3JHMcswGJWJP5J67T78jKSU+U9Yv5Q9DyKp5uHdkgoZ3bjJWAI8uL3jo8Z
 F0il6nUPQ+cqZsZ5voTwbhF5cBYc4RjQnV+I2bNtzy4OAiQaojBbaBr3VWqPqyFYAQaCz+
 nAwj/9VoXRhrkab4gSU/VtxzQTAfDOY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F2DEAE44;
 Thu, 24 Sep 2020 13:57:05 +0000 (UTC)
Subject: Re: [PATCH 2/3] x86/pv: Don't clobber NT on return-to-guest
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Andy Lutomirski <luto@kernel.org>
References: <20200923101848.29049-1-andrew.cooper3@citrix.com>
 <20200923101848.29049-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <339f0abd-65ad-7be0-a3f0-149fcac9a0a3@suse.com>
Date: Thu, 24 Sep 2020 15:57:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200923101848.29049-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.09.2020 12:18, Andrew Cooper wrote:
> A 64bit IRET can restore NT - the faulting case is when NT is set in the live
> flags.  This change had an unintended consequence of causing the NT flag to
> spontaneously disappear from guest context whenever a interrupt/exception
> occurred.
> 
> In combination with a SYSENTER which sets both TF and NT, Xen's handling of
> the #DB exceptions clears NT before it is even recorded suitably in the guest
> kernel's view of what userspace was doing.
> 
> Reported-by: Andy Lutomirski <luto@kernel.org>
> Fixes: 0e47f92b0 ("x86: force EFLAGS.IF on when exiting to PV guests")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

