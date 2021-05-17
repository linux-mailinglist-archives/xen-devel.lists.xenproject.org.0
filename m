Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE5382A6D
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 12:59:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128162.240655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liaxj-0008BU-1U; Mon, 17 May 2021 10:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128162.240655; Mon, 17 May 2021 10:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liaxi-00089b-Ua; Mon, 17 May 2021 10:59:02 +0000
Received: by outflank-mailman (input) for mailman id 128162;
 Mon, 17 May 2021 10:59:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liaxh-000892-9G
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 10:59:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ed95dc4-2799-4b56-b405-4659370b0ae7;
 Mon, 17 May 2021 10:58:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 31039AE89;
 Mon, 17 May 2021 10:58:54 +0000 (UTC)
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
X-Inumbo-ID: 0ed95dc4-2799-4b56-b405-4659370b0ae7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621249134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PRce/xL7hdszTFBxalqPXo3Pbt1l/3oKPkY+6zNLqOY=;
	b=CRkUpWSgK0JhPft+XYOuXWj+QkwoTvfTXDQvOII5GP5o8wKdRfcwgnVLgRejhbv4ZfMIyX
	/d5kcB+NynVdP2Xo3uCvk6BGZqOmojj7/Zor+YzSQDeZZO9f6T0DzlrBR+VJyYJhYSWOxk
	LTUamU+dIEs5juTtRJNpC48j+bjmmnk=
Subject: Re: Regressed XSA-286, was [xen-unstable test] 161917: regressions -
 FAIL
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <osstest-161917-mainreport@xen.org>
 <7cfa28ae-2fbe-0945-8a6c-a965ec52155f@citrix.com>
 <e8fae962-1a5b-cc91-d429-a716b009f062@suse.com>
Message-ID: <f365c8f9-362c-f7f5-6ed4-34131a1dce63@suse.com>
Date: Mon, 17 May 2021 12:59:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e8fae962-1a5b-cc91-d429-a716b009f062@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 17.05.2021 10:43, Jan Beulich wrote:
> On 13.05.2021 22:15, Andrew Cooper wrote:
>> Second, the unexplained OSSTest behaviour.
>>
>> When I repro'd this on pinot1, test-pv32pae-xsa-286 failing was totally
>> deterministic and repeatable (I tried 100 times because the test is a
>> fraction of a second).
>>
>> From the log trawling which Ian already did, the first recorded failure
>> was flight 160912 on April 11th.  All failures (12, but this number is a
>> few flights old now) were on pinot*.
>>
>> What would be interesting to see is whether there have been any passes
>> on pinot since 160912.
>>
>> I can't see any reason why the test would be reliable for me, but
>> unreliable for OSSTest, so I'm wondering whether it is actually
>> reliable, and something is wrong with the stickiness heuristic.
> 
> Isn't (un)reliability of this test, besides the sensitivity to IRQs
> and context switches, tied to hardware behavior, in particular TLB
> capacity and replacement policy? Aiui the test has
> 
>     xtf_success("Success: Probably not vulnerable to XSA-286\n");
> 
> for the combination of all of these reasons.

I've just done a dozen runs on my Skylake - all reported SUCCESS.

Jan

