Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BD32D40D7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48137.85110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxSu-0003Qc-8p; Wed, 09 Dec 2020 11:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48137.85110; Wed, 09 Dec 2020 11:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxSu-0003QD-4v; Wed, 09 Dec 2020 11:17:00 +0000
Received: by outflank-mailman (input) for mailman id 48137;
 Wed, 09 Dec 2020 11:16:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kmxSs-0003Q8-1q
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:16:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmxSq-0005rB-07; Wed, 09 Dec 2020 11:16:56 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kmxSp-0003EZ-N4; Wed, 09 Dec 2020 11:16:55 +0000
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
	bh=LMVuGsN2J17uA7dGWuaJGpfZYc8eBmei0dEK7x+yVzM=; b=ayjfQT22rZNujy9mpFgu1SekJ1
	RPxQ/vlQns4WVyhRomGGK/Mg/a2CDgF7sILKhdph05lF2FilgnbO9/7qhAadeJnpxGtPJLHEpMRW0
	LN1Dpq0IQu6lRbB5BI9MaBhMBAtMN9vDo31X9GLwwHq6YlO8hWfsuLOcoCtX6njInJWc=;
Subject: Re: [PATCH v3 3/5] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
 <d2461bd6-fb2f-447f-11c6-bd8afd573d7b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c11437e3-58f2-6dd3-45ae-9fd5f1d97e59@xen.org>
Date: Wed, 9 Dec 2020 11:16:53 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d2461bd6-fb2f-447f-11c6-bd8afd573d7b@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/11/2020 13:28, Jan Beulich wrote:
> There's no need to serialize all sending of vIRQ-s; all that's needed
> is serialization against the closing of the respective event channels
> (so far by means of a barrier). To facilitate the conversion, switch to
> an ordinary write locked region in evtchn_close().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

