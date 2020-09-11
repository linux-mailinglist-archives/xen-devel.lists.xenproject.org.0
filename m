Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F5266448
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 18:34:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGm04-0004jQ-Iu; Fri, 11 Sep 2020 16:34:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yBET=CU=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kGm03-0004jL-1m
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 16:34:11 +0000
X-Inumbo-ID: 6c137f65-7527-4be6-b348-0d40f5e6c115
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c137f65-7527-4be6-b348-0d40f5e6c115;
 Fri, 11 Sep 2020 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Cc:Subject:From:To;
 bh=9L35WIzV7Uivnsa94vXH9c4NM5gwtX9gAb8QWmV28RQ=; b=1XiK5LzaPRRMk06uMqBm+SS4Dw
 o6eyWgvpQ/Lkw+8bhotvAHEw9FFg+xDoXbkecC5SnyYm0iKbzKgGyfY7XRfJhLoyzfzZQRzvOwYYa
 aWbpcpnjCNwRvPNiZnZKM4KyxGOhL7p2DzL0cFTnhb9pqfzMJUg95qMkkPKus5X8kSBI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlzt-0005VR-5n; Fri, 11 Sep 2020 16:34:01 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kGlzs-0003z9-SX; Fri, 11 Sep 2020 16:34:01 +0000
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Julien Grall <julien@xen.org>
Subject: Adopting the Linux Kernel Memory Model in Xen?
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Message-ID: <1bc70974-2efb-2e73-34bf-bdd3c1d0ef96@xen.org>
Date: Fri, 11 Sep 2020 17:33:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

At the moment, Xen doesn't have a formal memory model. Instead, we are 
relying on intuitions. This can lead to heated discussion on what can a 
processor/compiler do or not.

We also have some helpers that nearly do the same (such as 
{read,write}_atomic() vs ACCESS_ONCE()) with no clear understanding 
where to use which.

In the past few years, Linux community spent a lot of time to write down 
their memory model and make the compiler communities aware of it (see 
[1], [2]).

There are a few reasons I can see for adopting LKMM:
    - Xen borrows a fair amount of code from Linux;
    - There are efforts to standardize it;
    - This will allow us to streamline the discussion.

Any thoughts?

Cheers,

[1] https://www.kernel.org/doc/Documentation/memory-barriers.txt
[2] http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2020/p0124r7.html


-- 
Julien Grall

