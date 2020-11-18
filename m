Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43492B8331
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 18:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30168.59961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfRQu-0001Cj-L4; Wed, 18 Nov 2020 17:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30168.59961; Wed, 18 Nov 2020 17:39:52 +0000
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
	id 1kfRQu-0001CK-HZ; Wed, 18 Nov 2020 17:39:52 +0000
Received: by outflank-mailman (input) for mailman id 30168;
 Wed, 18 Nov 2020 17:39:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfRQt-0001CE-3x
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:39:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRQq-00074H-Oo; Wed, 18 Nov 2020 17:39:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfRQq-0006Kp-IW; Wed, 18 Nov 2020 17:39:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRQt-0001CE-3x
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 17:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=LIjtSl1sh6PSwW8rL6BTN1rxi+eCV/A2IbRRZIwE8lo=; b=Mw1V5hkvjOmZ4WW27MJ3EWD3HN
	RB/p4c/qQmmlINd1yaZ2RRB3klQB1TGo/uuPzu11OwC+ISTc/xjeJXN3Wnxc5n/ovpGBYmiEmJGJG
	FXK9m4TFePu/hWGViocYLDe99YY/Axd2457csHaqms64aUBXWVa8V49a1KXVLalPIEg8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRQq-00074H-Oo; Wed, 18 Nov 2020 17:39:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfRQq-0006Kp-IW; Wed, 18 Nov 2020 17:39:48 +0000
Subject: Re: [PATCH v2 4/8] lib: move parse_size_and_unit()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ec053ed2-7952-f057-94cb-366cec2a0613@xen.org>
Date: Wed, 18 Nov 2020 17:39:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <eaffac30-8bd0-6018-5186-ca53d1becfe5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/10/2020 11:17, Jan Beulich wrote:
> ... into its own CU, to build it into an archive.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> ... into its own CU, to build it into an archive.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

