Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA6677F6BD
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 14:50:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585402.916504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcRk-0003bp-9x; Thu, 17 Aug 2023 12:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585402.916504; Thu, 17 Aug 2023 12:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWcRk-0003ZP-79; Thu, 17 Aug 2023 12:49:52 +0000
Received: by outflank-mailman (input) for mailman id 585402;
 Thu, 17 Aug 2023 12:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWEV=EC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qWcRi-0003ZJ-2A
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 12:49:50 +0000
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com
 [136.143.184.57]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b706ffa-3cfc-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 14:49:47 +0200 (CEST)
Received: from [10.10.1.156] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 169227657688440.538902891930206;
 Thu, 17 Aug 2023 05:49:36 -0700 (PDT)
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
X-Inumbo-ID: 8b706ffa-3cfc-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; t=1692276584; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lbDVtzI2goGDLp+DmV19JHBb1/G5QzjaRvsbn1KXrGGjFPKYefpPj8vTXWh1q3HofhKfNuhbVWb9SioL7owHhrxf/n8ouTLTUuumY0CeEhRMvy5xBbg8MQlWi4YboKCKYmnS8Bnree6pYoHCxkfub+4e9N+VULYTMP4RDK/nwP0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1692276584; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5EqkT65579FjVu/OBxRV0FrblhMFppyH/DGRi6f53II=; 
	b=S/8U8gkCSTJuVxKgdJzpVNbnQzb0cDl0SrqDAKFIv22TR19V2VSlhGE4ESizhOzHjivOn0A0BR66Xey1+YfdzGjruhP3EBFu/yXzdxZdeO2Hj5k6SJjw57yy5VRcz12PekeW3AvAXAgwokBsphiHqvM9+cYyLbWUTse1bRKK2RM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1692276584;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5EqkT65579FjVu/OBxRV0FrblhMFppyH/DGRi6f53II=;
	b=EjB/n+g6LWxz4mxNgxhLKYVCTkwzChrCQFnxBXsedJpYW6p/6EtyKBhvcDMlP8Bg
	6bGF4WILLe2pMiN4TtzrbLvv/V/Ub3Wd+1blgxzzTkQ24rtcxMNNNvHhWu5vr0Ek2zc
	3CqtgDKNvQ8fo9d1Rz3kXtdLp9rlLrxbZOEWTNBk=
Message-ID: <958bfe58-200b-0ea5-22f8-fce393eb69b2@apertussolutions.com>
Date: Thu, 17 Aug 2023 08:49:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] xsm: removing inclusion of byteorder.h
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20230816190425.8160-1-dpsmith@apertussolutions.com>
 <CAKf6xpvpHq5vBHm20snGr+fgu78Kviiwne2JVcxrESXStDs2Mw@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xpvpHq5vBHm20snGr+fgu78Kviiwne2JVcxrESXStDs2Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 8/17/23 08:17, Jason Andryuk wrote:
> On Wed, Aug 16, 2023 at 3:05 PM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> This is to complement patch 'common: move Linux-inherited fixed width type
>> decls to common header' by removing the unnecessary include of
>> 'asm/byteorder.h'. In the process of removing these includes, the ordering was
>> corrected to comply with current coding style.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
>> ---
>>   xen/xsm/flask/ss/avtab.c       | 3 +--
>>   xen/xsm/flask/ss/conditional.c | 9 ++++-----
>>   xen/xsm/flask/ss/ebitmap.c     | 8 ++++----
>>   xen/xsm/flask/ss/policydb.c    | 9 ++++-----
>>   4 files changed, 13 insertions(+), 16 deletions(-)
> 
> These four files all call le32_to_cpu(), so AFAICT, you are trading an
> explicit dependency for an implicit one.  Is that what you want?

In fact, no. You comment here caused me to go back and try to see why 
Jan said they needed to move. I realized there was a misunderstanding 
about his commit message. He was not saying later, at a point in the 
future, they need to be moved, but that as a result of his change the 
inclusion ordering had to be changed. The former is what I understood 
and thus attempted a build without them to see if it would work. I was 
not expecting that conversions would have been able to be implicitly 
resolved.

Since I already rebased to latest stable, I can resubmit a v2 with 
correcting the inclusion order but with byteoder.h inclusion remaining. 
Though that would render this down to simply a style change patch. Would 
that still be acceptable Jan?

v/r,
dps

