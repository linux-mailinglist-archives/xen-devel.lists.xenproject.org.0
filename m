Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2689632790B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 09:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91340.172609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdlX-0008Fu-B2; Mon, 01 Mar 2021 08:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91340.172609; Mon, 01 Mar 2021 08:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGdlX-0008FV-7o; Mon, 01 Mar 2021 08:18:55 +0000
Received: by outflank-mailman (input) for mailman id 91340;
 Mon, 01 Mar 2021 08:18:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGdlW-0008FP-K6
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 08:18:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 291ffcec-4e9b-4004-8e85-8eab7209a0e2;
 Mon, 01 Mar 2021 08:18:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8ACFAA4F;
 Mon,  1 Mar 2021 08:18:52 +0000 (UTC)
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
X-Inumbo-ID: 291ffcec-4e9b-4004-8e85-8eab7209a0e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614586733; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Fg3Op08Ae+lWyBT8vLNohsrZlkxK1zqicsFMcN/sa8=;
	b=EOfeChJi4QJOflr7XBYMJQkEWz/c8ILMVxLsuYig6q25DKtKudiPg3biF1xiQxsrEkDnKT
	7Qcmwz65EvleuYeKa3xDe7qfj0Ql1j/9kZ9OXd+KcKfwU/K91o0c3cp2JWjGHZ3nK/i7bw
	WTGHE5D4pGAkgv+90bYJU+qjTpMjDRw=
Subject: Re: [PATCH v3 2/2] VMX: use a single, global APIC access page
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, George Dunlap <george.dunlap@citrix.com>,
 "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <774a0bf2-d2a4-7dba-bf15-fec8b0ec8c5f@suse.com>
 <MWHPR11MB1886992F8E3886EC64A54B8D8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a8575678-8c62-8175-b396-159cdfee8997@suse.com>
Date: Mon, 1 Mar 2021 09:18:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1886992F8E3886EC64A54B8D8C9A9@MWHPR11MB1886.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.03.2021 03:34, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, February 22, 2021 6:57 PM
>>
>> The address of this page is used by the CPU only to recognize when to
>> access the virtual APIC page instead. No accesses would ever go to this
>> page. It only needs to be present in the (CPU) page tables so that
>> address translation will produce its address as result for respective
>> accesses.
>>
>> By making this page global, we also eliminate the need to refcount it,
>> or to assign it to any domain in the first place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>

Thanks, but for the record: As said on an unrelated thread already,
I also need to make an adjustment to shadow mode code here. Since
that doesn't affect VMX code itself, I'll retain the R-b on v4
(which I intend to submit only once we have 4.15 branched).

Jan

