Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1734736A75E
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 14:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117153.223021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laeJd-0002kt-5O; Sun, 25 Apr 2021 12:56:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117153.223021; Sun, 25 Apr 2021 12:56:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1laeJd-0002kX-22; Sun, 25 Apr 2021 12:56:49 +0000
Received: by outflank-mailman (input) for mailman id 117153;
 Sun, 25 Apr 2021 12:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1laeJa-0002kS-Pa
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 12:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laeJZ-0001VS-5d; Sun, 25 Apr 2021 12:56:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1laeJY-0006uO-TI; Sun, 25 Apr 2021 12:56:45 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=mUIbIz+FutOPuc5vsbUn0JngfNoKUlFHFen65Y5k3WU=; b=OmIZHUkQyr5Fa4TiyqUxqHnDpX
	2X9QUXuKyno7fqkTa5fxM6J0J/79fMNzMROGGc6BeucVFtkhRqKkb3mgtS5l9YoCPbNPPmD4iJt2k
	xFBtRcBQf9ejysdCzDxnfhh0Q3lsL/Vql1olU01h7eedAQuAHt+Fuk0NCg+CgG87KExQ=;
Subject: Re: [PATCH] tools/xenstored: Wire properly the command line option
 -M/--path-max
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210421140255.23437-1-julien@xen.org>
 <673f6a7e-a63c-ca0c-054d-5c33682e901e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3c1f428d-242b-d076-824d-cc382e413cb4@xen.org>
Date: Sun, 25 Apr 2021 13:56:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <673f6a7e-a63c-ca0c-054d-5c33682e901e@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 21/04/2021 16:07, Juergen Gross wrote:
> On 21.04.21 16:02, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The command line option -M/--path-max was meant to be added by
>> commit 924bf8c793cb "tools/xenstore: rework path length check" but this
>> wasn't wired through properly.
>>
>> Fix it by adding the missing "case 'M':".
>>
>> Fixes: 924bf8c793cb ("tools/xenstore: rework path length check")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! I have committed it.

> I wonder why no compiler cared about the obviously dead coding.
Coverity actually spotted it (see CID-1470790) back in December 2020. 
Although, I wasn't aware of it because I just check coverity now.

Cheers,

-- 
Julien Grall

