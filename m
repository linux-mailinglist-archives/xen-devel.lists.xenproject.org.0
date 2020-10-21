Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623352947FD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Oct 2020 07:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9869.26079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kV78l-0004Pj-Ii; Wed, 21 Oct 2020 05:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9869.26079; Wed, 21 Oct 2020 05:58:27 +0000
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
	id 1kV78l-0004PO-FF; Wed, 21 Oct 2020 05:58:27 +0000
Received: by outflank-mailman (input) for mailman id 9869;
 Wed, 21 Oct 2020 05:58:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kV78j-0004PJ-QB
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 05:58:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8aa93d3-5c61-4bbb-a2db-c69f1c55463a;
 Wed, 21 Oct 2020 05:58:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AB458AC48;
 Wed, 21 Oct 2020 05:58:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JBpP=D4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kV78j-0004PJ-QB
	for xen-devel@lists.xenproject.org; Wed, 21 Oct 2020 05:58:25 +0000
X-Inumbo-ID: d8aa93d3-5c61-4bbb-a2db-c69f1c55463a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d8aa93d3-5c61-4bbb-a2db-c69f1c55463a;
	Wed, 21 Oct 2020 05:58:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603259902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oNswih2V7dAStqKuSd8QaGTZPVgz++In9Oe75UkhAMc=;
	b=RQbs7A3nfGLVlZlaxFegInOOP2664jJdhPsvAVK1XQMatRXxfqUqAWOpfieIXU2Aj2eKAS
	ANRgpUmDl3DGX5kRosMOYInftNi/3ORHCuZ8Usv1PQNMIGOSFZZt6HvohlzfxDMrmg+5Y3
	KFXGLknD8mF/NmV5aMfqH0JbpVrCDvI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AB458AC48;
	Wed, 21 Oct 2020 05:58:22 +0000 (UTC)
Subject: Re: [PATCH] x86/pv: Flush TLB in response to paging structure changes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201020152405.26892-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0f62840-0ed9-cd25-76aa-eeb4484799bb@suse.com>
Date: Wed, 21 Oct 2020 07:58:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201020152405.26892-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.10.2020 17:24, Andrew Cooper wrote:
> A couple of minor points.
> 
>  * PV guests can create global mappings.  I can't reason any safe way to relax
>    FLUSH_TLB_GLOBAL to just FLUSH_TLB.

We only care about guest view here, and from guest view we only
care about non-leaf entries. Non-leaf entries can't be global,
and luckily (for now at least) the G bit also doesn't get
different meaning assigned in non-leaf entries.

Jan

