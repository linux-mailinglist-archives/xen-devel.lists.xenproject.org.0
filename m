Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A427CB72
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 14:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157.351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEkw-0007Sr-1q; Tue, 29 Sep 2020 12:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157.351; Tue, 29 Sep 2020 12:29:18 +0000
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
	id 1kNEkv-0007SR-US; Tue, 29 Sep 2020 12:29:17 +0000
Received: by outflank-mailman (input) for mailman id 157;
 Tue, 29 Sep 2020 12:29:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNEku-0007SK-8s
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:29:16 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5308d7e3-1f54-49c0-acf0-b4b5f5d3c417;
 Tue, 29 Sep 2020 12:29:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEkq-0001dP-AT; Tue, 29 Sep 2020 12:29:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEkq-0008RO-41; Tue, 29 Sep 2020 12:29:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNEku-0007SK-8s
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:29:16 +0000
X-Inumbo-ID: 5308d7e3-1f54-49c0-acf0-b4b5f5d3c417
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5308d7e3-1f54-49c0-acf0-b4b5f5d3c417;
	Tue, 29 Sep 2020 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=H/rxwgSpInYcwH576mSqSm3J5CGkpjoPtixcoE+Mu/g=; b=3LPmgYn3MdKLKG5GHbU05i+5NC
	9g1NYdZsWgB5kcS1o3JF8t7B+fo8+OKeExQbxZRTR+7XNiucKJFATnuEj7GrEWWW3eDaI3E4OFpnP
	mRRMzBCkQ0vg0XkmV7Fdm6SbKJHYcPy4GJD7MHhEQH2y2tIc7LttSRJTRa7sMxN88l4w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEkq-0001dP-AT; Tue, 29 Sep 2020 12:29:12 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEkq-0008RO-41; Tue, 29 Sep 2020 12:29:12 +0000
Subject: Re: [PATCH 10/12] evtchn/fifo: use stable fields when recording "last
 queue" information
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <836125f3-b15e-bf96-43c6-6de5728e89df@xen.org>
Date: Tue, 29 Sep 2020 13:29:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ff4c9cc4-c642-2f51-da36-c9883ab65e61@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 12:01, Jan Beulich wrote:
> Both evtchn->priority and evtchn->notify_vcpu_id could, prior to recent
> locking adjustments, change behind the back of
> evtchn_fifo_set_pending(). Neither the queue's priority nor the vCPU's
> vcpu_id fields have similar properties, so they seem better suited for
> the purpose. In particular they reflect the respective evtchn fields'
> values at the time they were used to determine queue and vCPU.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

