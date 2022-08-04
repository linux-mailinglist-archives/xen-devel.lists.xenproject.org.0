Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B2589F77
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 18:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380593.614812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJdr0-0007n9-FE; Thu, 04 Aug 2022 16:37:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380593.614812; Thu, 04 Aug 2022 16:37:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJdr0-0007kO-CL; Thu, 04 Aug 2022 16:37:46 +0000
Received: by outflank-mailman (input) for mailman id 380593;
 Thu, 04 Aug 2022 16:37:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oJdqy-0007k2-UN
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 16:37:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJdqu-0000FB-J7; Thu, 04 Aug 2022 16:37:40 +0000
Received: from [54.239.6.184] (helo=[10.7.237.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oJdqu-00007O-DZ; Thu, 04 Aug 2022 16:37:40 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=YwuaDAU6VG1V9chyav9nqirlmVG4W6sb+NsRClJZqoU=; b=to1wSfGz+h2Og+sHmDFdOCqSCw
	+EK0bX8KSw8KNXitW0NmYdg4t1DALAoy7t0hEsdYm9hGRWtFsJDPK4iO2DLnoiGyiOp6iP86jW1fg
	YOdXN1ixyvuZ5c1K853o9d1PJUkDbNY1aQeOWfUNm7AwM+P5q8zC9456M134IGEqESKo=;
Message-ID: <3df9ef1c-b707-7d14-204f-73d55b237cee@xen.org>
Date: Thu, 4 Aug 2022 17:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [xen-unstable-smoke bisection] complete build-amd64-libvirt
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org>
 <08606914-f5f4-8415-51a2-f6a5e1c54d20@suse.com>
 <db39670c-7e36-2cf5-a87b-92d10d3aac18@xen.org>
 <7bcf8fac-df56-2032-0057-2b7c671e59be@suse.com>
 <16b1c490-1d8f-1c35-496a-a60fb1404fc3@xen.org>
 <ff565bad-c2be-5128-aeae-28f614f0230c@citrix.com>
 <c4ebd102-f5ed-0109-4eda-a98a59cad21c@xen.org>
In-Reply-To: <c4ebd102-f5ed-0109-4eda-a98a59cad21c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 02/08/2022 11:58, Julien Grall wrote:
> On 01/08/2022 14:15, Andrew Cooper wrote:
>> The testing situation with libvirt is already bad.  I don't think a
>> force push is going to make it meaningfully worse.
> 
> I have forced pushed to the branch smoke using the flight 171899. For 
> staging, it looks like the latest flight was testing f732240f, so we 
> don't have one with the libvirt patches.
> 
> I am hoping the push to the smoke branch will trigger a xen-unstable 
> flight.

master has now been forced push as well.

Cheers,


-- 
Julien Grall

