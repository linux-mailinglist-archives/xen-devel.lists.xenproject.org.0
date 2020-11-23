Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 736DF2C05BD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 13:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34145.64969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khAvT-0000BQ-UT; Mon, 23 Nov 2020 12:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34145.64969; Mon, 23 Nov 2020 12:26:35 +0000
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
	id 1khAvT-0000B0-R5; Mon, 23 Nov 2020 12:26:35 +0000
Received: by outflank-mailman (input) for mailman id 34145;
 Mon, 23 Nov 2020 12:26:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1khAvS-0000Av-MO
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:26:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f8e59d50-e4f0-428d-b443-f176b10ec7e4;
 Mon, 23 Nov 2020 12:26:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WaDe=E5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1khAvS-0000Av-MO
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 12:26:34 +0000
X-Inumbo-ID: f8e59d50-e4f0-428d-b443-f176b10ec7e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f8e59d50-e4f0-428d-b443-f176b10ec7e4;
	Mon, 23 Nov 2020 12:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606134393;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=X3ywSJwCxr8loBrZm4rgWehNqaqAQQSzGvAtJ9NS+Qc=;
  b=Kc5a8JwPwIVVtk2rqV0Yl5B2cJ2ibHsaY/B+v8Ws3xEDybmmcKNi3/8d
   VNEIbAg6Coey1rNTkGPaecyAjfEGifC6Wo8bRsn7sABtGFu6cYzEGYdVm
   9bV9C91Yv3NLbzWWK4sw53wZSXGo+rv9IoiQsGOKHz/pYjQ6d1gX7mrqS
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZTWxce4bX9lztQz6JEvQx5H7e9403izrKGNBsQWjUxQXdk3jysuqBOfH6X0/YVtPcRucvkEWo3
 wnglOwUthDcIVTV1kuXZiOf0iY5ojxvEDoYZiDQnOrAcnQW+JLuwqT6ndd6XmIjGAQNuQkhvRK
 b50PtMC1QA+DH8Zg5yWl2wy3Uq1WE+qu/MVyknwyViYFGuvMYSCqOR5JOoLDU4EYSdQ2pzLw+D
 H32VZxZVIu882q1hfHmlLtDXWfck+Ykq8t5VtYUompfqJURiZxN+6if1yuWAml67cFWCuMJsRP
 u4Q=
X-SBRS: None
X-MesageID: 32078809
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,363,1599537600"; 
   d="scan'208";a="32078809"
Subject: Re: Ping: [PATCH v2] x86/PV: make post-migration page state
 consistent
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>
References: <07ebce3c-4dcf-bc9e-6d82-7f3def486ab8@suse.com>
 <b733914b-1bfd-d95d-470e-af3ca7a4f69f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e2ac69e3-64ef-5362-427b-7e52735ea834@citrix.com>
Date: Mon, 23 Nov 2020 12:26:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b733914b-1bfd-d95d-470e-af3ca7a4f69f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 20/11/2020 12:48, Jan Beulich wrote:
> On 04.11.2020 08:56, Jan Beulich wrote:
>> When a page table page gets de-validated, its type reference count drops
>> to zero (and PGT_validated gets cleared), but its type remains intact.
>> XEN_DOMCTL_getpageframeinfo3, therefore, so far reported prior usage for
>> such pages. An intermediate write to such a page via e.g.
>> MMU_NORMAL_PT_UPDATE, however, would transition the page's type to
>> PGT_writable_page, thus altering what XEN_DOMCTL_getpageframeinfo3 would
>> return. In libxc the decision which pages to normalize / localize
>> depends solely on the type returned from the domctl. As a result without
>> further precautions the guest won't be able to tell whether such a page
>> has had its (apparent) PTE entries transitioned to the new MFNs.
>>
>> Add a check of PGT_validated, thus consistently avoiding normalization /
>> localization in the tool stack.
>>
>> Also use XEN_DOMCTL_PFINFO_NOTAB in the variable's initializer instead
>> open coding it.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Don't change type's type.
> Ping?

Ping what?  There is still nothing addressing my concerns from v1.

To re-iterate - this is a very subtle change, in a very complicated
piece of migration.  As the problems described do not manifest in
practice, it is vital to understand why.

~Andrew

