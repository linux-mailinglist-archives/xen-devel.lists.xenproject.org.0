Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6843C71FA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:19:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155402.286869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JFg-0001hT-QS; Tue, 13 Jul 2021 14:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155402.286869; Tue, 13 Jul 2021 14:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JFg-0001ea-Mb; Tue, 13 Jul 2021 14:19:12 +0000
Received: by outflank-mailman (input) for mailman id 155402;
 Tue, 13 Jul 2021 14:19:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3JFf-0001eU-FD
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:19:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3JFb-0006wk-Vf; Tue, 13 Jul 2021 14:19:07 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3JFb-00047y-PF; Tue, 13 Jul 2021 14:19:07 +0000
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
	bh=f+XN0xR8iXaoRMZld8LT3jZGzJZyV2/UgdteyhFi9HA=; b=gFxcbEamk3xRask1fhfNkoqzuE
	DHSm42J0x1Ioa9hQYNvNXlUdQC1dO+SYYqEpcjSdzgRLlszKHG/ijFFSV0rKXLZfM1Fq9xNahw5BN
	zPfncpe32DdXQ0w5rxYhJ6e+UPWLBNyah/o/mFtUdQVGiod6esnyL0R8qZTxWT4msCOE=;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
Date: Tue, 13 Jul 2021 15:19:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/07/2021 15:14, Jan Beulich wrote:
>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
> 
> Even that doesn't seem right to me, at least in principle. There shouldn't
> be a build time setting when it may vary at runtime. IOW on Arm I think a
> runtime query to the hypervisor would be needed instead.

Yes, we want to be able to use the same userspace/OS without rebuilding 
to a specific hypervisor page size.

> And thinking
> even more generally, perhaps there could also be mixed (base) page sizes
> in use at run time, so it may need to be a bit mask which gets returned.

I am not sure to understand this. Are you saying the hypervisor may use 
at the same time different page size?

Cheers,

-- 
Julien Grall

