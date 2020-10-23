Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8675297354
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:15:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11147.29536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVziK-0006rb-2x; Fri, 23 Oct 2020 16:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11147.29536; Fri, 23 Oct 2020 16:14:48 +0000
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
	id 1kVziJ-0006rC-W9; Fri, 23 Oct 2020 16:14:47 +0000
Received: by outflank-mailman (input) for mailman id 11147;
 Fri, 23 Oct 2020 16:14:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kVziI-0006r7-NJ
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:46 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73090fc0-4388-4a80-afc9-419641a5526a;
 Fri, 23 Oct 2020 16:14:45 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVziG-00086e-9R; Fri, 23 Oct 2020 16:14:44 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kVziG-0002Lt-0g; Fri, 23 Oct 2020 16:14:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nEE3=D6=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kVziI-0006r7-NJ
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:14:46 +0000
X-Inumbo-ID: 73090fc0-4388-4a80-afc9-419641a5526a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 73090fc0-4388-4a80-afc9-419641a5526a;
	Fri, 23 Oct 2020 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=FovwwkTpbjUCmAUNjvltY+9UukJzlORO7DJLQNXPO4c=; b=HEFNcpswtJITyFIG5DpV9SqMmP
	BQuYAAha66CXTbQtnqYOFSS/GatldkhRhN+nR/Zsf8CKTCquOil3dwtNo/yIRijgut5T5+9OEtCvt
	YdQjQA4C6cLsjKf7xi8hHPzq7oADfUIk1N1DYWbDhxdbhHIRpgJeygnrgz6i6jJYY7RI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVziG-00086e-9R; Fri, 23 Oct 2020 16:14:44 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kVziG-0002Lt-0g; Fri, 23 Oct 2020 16:14:44 +0000
Subject: Re: [PATCH] SUPPORT: Add linux device model stubdom to Toolstack
To: Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200525025506.225959-1-jandryuk@gmail.com>
 <24269.8360.504075.118119@mariner.uk.xensource.com>
 <CAKf6xpuqTdSc-qnfHu=yyEo6V45QLiSP6j=XsgEudoO4ojFaJw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bb8435bf-de66-ae74-0ccb-57c1a0710b18@xen.org>
Date: Fri, 23 Oct 2020 17:14:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpuqTdSc-qnfHu=yyEo6V45QLiSP6j=XsgEudoO4ojFaJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jason,

On 20/10/2020 14:27, Jason Andryuk wrote:
> On Tue, May 26, 2020 at 10:13 AM Ian Jackson <ian.jackson@citrix.com> wrote:
>>
>> Jason Andryuk writes ("[PATCH] SUPPORT: Add linux device model stubdom to Toolstack"):
>>> Add qemu-xen linux device model stubdomain to the Toolstack section as a
>>> Tech Preview.
>>
>> Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
> 
> Hi, this never got applied.  It should go to staging and 4.14.

Sorry this fell through the cracks. I have committed it with the 
existing Acks.

Regarding 4.14, this would need to go through a backport request.

Cheers,

-- 
Julien Grall

