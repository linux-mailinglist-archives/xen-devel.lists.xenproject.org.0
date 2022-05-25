Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C2533B75
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 13:14:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337152.561674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoyC-000172-Db; Wed, 25 May 2022 11:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337152.561674; Wed, 25 May 2022 11:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntoyC-00014H-Ay; Wed, 25 May 2022 11:14:28 +0000
Received: by outflank-mailman (input) for mailman id 337152;
 Wed, 25 May 2022 11:14:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntoyB-00014B-ER
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 11:14:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntoy8-00073o-Qa; Wed, 25 May 2022 11:14:24 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.21.168]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntoy8-0007lJ-KK; Wed, 25 May 2022 11:14:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=ibyxt/qh4JAYU6oqiQUUqcfgl9La7uGb3Fo1HqRisRk=; b=KPTAx0SoG8CJk2qwA22VVjEk6C
	bXzJduLp/TYyCROdnb2W6MeMCN4SRhwKhnP4sc0EY1o0ne8z8dqTfK4fDuBuiDXkklkuLaYLO2/W0
	LVYbSNoTrWjTxioGAheBq1i5pbaezPoKRscimSQV4TRchi79OtVzMYcMnA5rhpWstgFs=;
Message-ID: <34e4bba1-688d-effe-e648-c4ab9439fd1f@xen.org>
Date: Wed, 25 May 2022 12:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] tools/xenstore: fix event sending in introduce_domain()
To: Andrew Cooper <amc96@srcf.net>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220525105549.30184-1-jgross@suse.com>
 <21392cc6-55b6-647e-08eb-c818d6229603@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <21392cc6-55b6-647e-08eb-c818d6229603@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 25/05/2022 11:59, Andrew Cooper wrote:
> On 25/05/2022 11:55, Juergen Gross wrote:
>> Commit fc2b57c9af46 ("xenstored: send an evtchn notification on
>> introduce_domain") introduced a potential NULL dereference in case of
>> Xenstore live update.
>>
>> Fix that by adding an appropriate check.
>>
>> Coverity-Id: 1504572
>> Fixes: fc2b57c9af46 ("xenstored: send an evtchn notification on introduce_domain")
>> Signed-off-by: Juergen Gross <jgross@suse.com>

Committed.

> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> seeing as I've

b4 will end up to pick "seeing as I've":

42sh> b4 am 21392cc6-55b6-647e-08eb-c818d6229603@srcf.net
Looking up 
https://lore.kernel.org/r/21392cc6-55b6-647e-08eb-c818d6229603%40srcf.net
Grabbing thread from 
lore.kernel.org/all/21392cc6-55b6-647e-08eb-c818d6229603%40srcf.net/t.mbox.gz
Analyzing 2 messages in the thread
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH] tools/xenstore: fix event sending in introduce_domain()
     + Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com> seeing as I've
   ---
   ✓ Signed: DKIM/suse.com
---
Total patches: 1
---
  Link: https://lore.kernel.org/r/20220525105549.30184-1-jgross@suse.com
  Base: applies clean to current tree
        git am 
./20220525_jgross_tools_xenstore_fix_event_sending_in_introduce_domain.mbx

I don't think this is fixable in b4 because we allow to have additional 
information after the tag (e.g. # arm).

So would you be able to avoid adding words after the tags that are not 
meant to committed? This would reduce the amount of manual work when 
committing.

Cheers,

-- 
Julien Grall

