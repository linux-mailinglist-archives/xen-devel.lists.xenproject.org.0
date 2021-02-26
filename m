Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C640C3265CA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 17:44:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90459.171248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgEO-0001vE-TP; Fri, 26 Feb 2021 16:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90459.171248; Fri, 26 Feb 2021 16:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFgEO-0001up-Pm; Fri, 26 Feb 2021 16:44:44 +0000
Received: by outflank-mailman (input) for mailman id 90459;
 Fri, 26 Feb 2021 16:44:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eEmz=H4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFgEN-0001uk-Ao
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 16:44:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac001091-6edb-48e4-8c23-7db429185820;
 Fri, 26 Feb 2021 16:44:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AA08DAC6E;
 Fri, 26 Feb 2021 16:44:41 +0000 (UTC)
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
X-Inumbo-ID: ac001091-6edb-48e4-8c23-7db429185820
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614357881; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dqK8mTylXLft1nQhfFmEKN6OQ3lpRwHTJi9dr9srQfc=;
	b=JTAHXPQ11404kE7YL6pQtnRhs103zT2pwFSMh6BNYAzkVO9qJWLdz12kGDEj20L2wUKJKV
	NYMqL0Y80A1T9oDaEXRxi2YXXUMfQbgntlXyLYtBiDaDh+ue+Hgob+GJLuDecTc0EPrOdm
	PC4sS9iscCSZ8K66Zzx85x4nn57RCmk=
Subject: Re: [xen-unstable-smoke test] 159709: regressions - FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <osstest-159709-mainreport@xen.org>
 <a33d2c9a-00e3-caf2-afa6-48f70ef1202c@citrix.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa088007-af68-d4cc-6764-03e6efc9e0d5@suse.com>
Date: Fri, 26 Feb 2021 17:44:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a33d2c9a-00e3-caf2-afa6-48f70ef1202c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.02.2021 17:36, Andrew Cooper wrote:
> On 26/02/2021 16:34, osstest service owner wrote:
>> flight 159709 xen-unstable-smoke real [real]
>> flight 159713 xen-unstable-smoke real-retest [real]
>> http://logs.test-lab.xenproject.org/osstest/logs/159709/
>> http://logs.test-lab.xenproject.org/osstest/logs/159713/
>>
>> Regressions :-(
>>
>> Tests which did not succeed and are blocking,
>> including tests which could not be run:
>>  test-amd64-amd64-xl-qemuu-debianhvm-amd64 12 debian-hvm-install fail REGR. vs. 159704
> 
> Well - there's only one possibility here...
> 
>> commit 615367b5275a5b0123f1f1ee86c985fab234a5a4
>> Author: Andrew Cooper <andrew.cooper3@citrix.com>
>> Date:   Thu Feb 25 16:54:17 2021 +0000
>>
>>     x86/dmop: Properly fail for PV guests
>>     
>>     The current code has an early exit for PV guests, but it returns 0 having done
>>     nothing.
>>     
>>     Fixes: 524a98c2ac5 ("public / x86: introduce __HYPERCALL_dm_op...")
>>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>     Reviewed-by: Ian Jackson <iwj@xenproject.org>
>>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>     Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> which means we've something very wonky going on somewhere.

Or it's the heisenbug, and the next flight is going to be fine.
I've not spotted anything unusual in the logs so far.

Jan

