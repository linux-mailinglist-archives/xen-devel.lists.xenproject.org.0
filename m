Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83C2A41B0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:25:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18194.43090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtVJ-0001fx-Rk; Tue, 03 Nov 2020 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18194.43090; Tue, 03 Nov 2020 10:25:29 +0000
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
	id 1kZtVJ-0001fY-Ox; Tue, 03 Nov 2020 10:25:29 +0000
Received: by outflank-mailman (input) for mailman id 18194;
 Tue, 03 Nov 2020 10:25:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kZtVI-0001fS-39
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:25:28 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43676133-2a44-47e3-b61d-241c26751e86;
 Tue, 03 Nov 2020 10:25:27 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZtVG-0007aC-FW; Tue, 03 Nov 2020 10:25:26 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZtVG-0004C0-7J; Tue, 03 Nov 2020 10:25:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kZtVI-0001fS-39
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:25:28 +0000
X-Inumbo-ID: 43676133-2a44-47e3-b61d-241c26751e86
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 43676133-2a44-47e3-b61d-241c26751e86;
	Tue, 03 Nov 2020 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lYx25Ok5HuPPiU/ax9x92A5EQfjW5LYB9OKN/o2KBNg=; b=l8EKAHzH6Pqy9c5CRPe66ISyXR
	V3nb/GApbKPjixggwewWutcyWUjPmovnQgRhug/PXaOxKXmiNg/OtLLHjRpYi9zpakYIs/qpRORGq
	DsL4YFSyGP0vw2nq/ydXdVd/1kCkE7aTW9oWBBlsXb06lIdnS9wSjqe4wN35hMwa5KY4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZtVG-0007aC-FW; Tue, 03 Nov 2020 10:25:26 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZtVG-0004C0-7J; Tue, 03 Nov 2020 10:25:26 +0000
Subject: Re: [PATCH v2 2/2] xen/rwlock: add check_lock() handling to rwlocks
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20201102131239.14134-1-jgross@suse.com>
 <20201102131239.14134-3-jgross@suse.com>
 <fb3a1a5a-15ea-218f-a6d8-8e9d8d1bc2a7@suse.com>
 <890b6547-ca4f-b195-6b9d-9078ba35c357@suse.com>
 <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a3ad7dea-5528-43f8-ec0a-8ec678fcc2a7@xen.org>
Date: Tue, 3 Nov 2020 10:25:24 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fe41300c-3013-73ae-7ffa-7cd36705d0c2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 03/11/2020 10:04, Jan Beulich wrote:
> On 03.11.2020 10:22, Jürgen Groß wrote:
>> On 03.11.20 10:02, Jan Beulich wrote:
>>> On 02.11.2020 14:12, Juergen Gross wrote:
> Question therefore is how much we care about keeping code
> ready for "real" preemption, when we have ample other places
> that would need changing first, before such could be enabled

The question we should ask ourself is whether we think one would want to 
use preemption in Xen.

Some of the emulation in Xen on Arm (e.g. ITS, SMMUv3, set/way) would 
have been easier to implement if the code were preemptible.

I also hear time to time stakeholders asking for preemptible spin lock 
(this is useful for RT).

Therefore, I think there are values to keep the code as much as possible 
preempt-ready.

Cheers,

-- 
Julien Grall

