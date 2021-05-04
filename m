Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA603729AF
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122152.230383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtaW-0007q9-E7; Tue, 04 May 2021 11:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122152.230383; Tue, 04 May 2021 11:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldtaW-0007pX-Ah; Tue, 04 May 2021 11:51:40 +0000
Received: by outflank-mailman (input) for mailman id 122152;
 Tue, 04 May 2021 11:51:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldtaU-0007pS-Nd
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:51:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c489974f-ef13-4bf8-8d83-9682ad0826a6;
 Tue, 04 May 2021 11:51:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 38AF7ACC4;
 Tue,  4 May 2021 11:51:37 +0000 (UTC)
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
X-Inumbo-ID: c489974f-ef13-4bf8-8d83-9682ad0826a6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620129097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5ED1M1mFdajQeHDp6a1WU7QjD7jpSFUTnWtGUDsc5Q=;
	b=bImvwcbx2mxS07aTydHhVAV2lQKO6BYWGOWG+ADvhRSe9U4ZQWX4JDvFlJ4PcxPEpinAbA
	PMMVTdZEt0ao/DeI/+7jRcMIiUL6sXAlZTQK11oxjveN/jQtnuSZJoEcVH+OW332aLQtjQ
	kA+tbR3+VPgEu47dao4H6CehnhLXE6w=
Subject: Re: [PATCH 1/5] x86/xstate: Elide redundant writes in set_xcr0()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39d641e7-107b-0e60-8fc2-6f6c2303f072@suse.com>
Date: Tue, 4 May 2021 13:51:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503153938.14109-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.05.2021 17:39, Andrew Cooper wrote:
> XSETBV is an expensive instruction as, amongst other things, it involves
> reconfiguring the instruction decode at the frontend of the pipeline.
> 
> We have several paths which reconfigure %xcr0 in quick succession (the context
> switch path has 5, including the fpu save/restore helpers), and only a single
> caller takes any care to try to skip redundant writes.
> 
> Update set_xcr0() to perform amortisation automatically, and simplify the
> __context_switch() path as a consequence.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

