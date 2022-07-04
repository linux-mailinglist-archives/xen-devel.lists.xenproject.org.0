Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF02564FDE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 10:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359968.589276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HcP-000721-8k; Mon, 04 Jul 2022 08:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359968.589276; Mon, 04 Jul 2022 08:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8HcP-0006zk-5n; Mon, 04 Jul 2022 08:39:45 +0000
Received: by outflank-mailman (input) for mailman id 359968;
 Mon, 04 Jul 2022 08:39:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HcN-0006xN-Bz; Mon, 04 Jul 2022 08:39:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HcJ-000397-8n; Mon, 04 Jul 2022 08:39:39 +0000
Received: from [54.239.6.187] (helo=[192.168.26.128])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8HcJ-0004xd-2G; Mon, 04 Jul 2022 08:39:39 +0000
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
	bh=0ai07RFTIsDpeNOCYG7G85s9+3LdXsUGfO+KbNqiteU=; b=cgWxPzwf81W9csWAM+AUNeebaz
	NzoTOWq0GW88BnuzNpOQGpVnq/ExLIicpwgeHdO+rz3GI4IQLkmsVK8OWC+kd4Ybd+F/Metpq7nHb
	+UudVhuKRNoXyW1//h4pour/znMzuYGAMQIL3YYWPsFPT40fVuxq7fBrinY+ThWwz6Ko=;
Message-ID: <7ce54a47-9795-310f-c5cb-55f1b6fcdd93@xen.org>
Date: Mon, 4 Jul 2022 09:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 0/8] mini-os: some cleanup patches
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220620073820.9336-1-jgross@suse.com>
 <10e6cfe8-2aaf-2340-a52e-bce0c3373706@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <10e6cfe8-2aaf-2340-a52e-bce0c3373706@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 04/07/2022 09:37, Juergen Gross wrote:
> On 20.06.22 09:38, Juergen Gross wrote:
>> Do some cleanups.
>>
>> No functional change intended, apart from whitespace changes only
>> minor modifications making code easier to read.
>>
>> Juergen Gross (8):
>>    mini-os: drop xenbus directory
>>    mini-os: apply coding style to xenbus.c
>>    mini-os: eliminate console/console.h
>>    mini-os: rename console/xenbus.c to consfront.c
>>    mini-os: apply coding style to consfront.c
>>    mini-os: eliminate console directory
>>    mini-os: apply coding style to console.c
>>    mini-os: add mini-os-debug[.gz] to .gitignore
>>
>>   .gitignore                      |   2 +
>>   Makefile                        |   9 +-
>>   console/xenbus.c => consfront.c |  99 ++++---
>>   console.c                       | 415 ++++++++++++++++++++++++++
>>   console/console.c               | 177 -----------
>>   console/console.h               |   2 -
>>   console/xencons_ring.c          | 238 ---------------
>>   include/console.h               |   1 +
>>   xenbus/xenbus.c => xenbus.c     | 510 +++++++++++++++++++-------------
>>   9 files changed, 778 insertions(+), 675 deletions(-)
>>   rename console/xenbus.c => consfront.c (78%)
>>   create mode 100644 console.c
>>   delete mode 100644 console/console.c
>>   delete mode 100644 console/console.h
>>   delete mode 100644 console/xencons_ring.c
>>   rename xenbus/xenbus.c => xenbus.c (71%)
>>
> 
> Could someone please commit this series? Samuel gave his R-b nearly 2 weeks
> ago.

I will commit this series and the other you pointed out.

Cheers,

-- 
Julien Grall

