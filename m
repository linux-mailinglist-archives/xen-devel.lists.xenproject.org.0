Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28EB673AA6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 14:46:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481080.745777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVEe-0006cB-E3; Thu, 19 Jan 2023 13:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481080.745777; Thu, 19 Jan 2023 13:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVEe-0006Zu-Az; Thu, 19 Jan 2023 13:45:44 +0000
Received: by outflank-mailman (input) for mailman id 481080;
 Thu, 19 Jan 2023 13:45:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pIVEc-0006Zn-SS
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 13:45:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVEc-0003FC-PW; Thu, 19 Jan 2023 13:45:42 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.13.107]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pIVEc-0004zy-Js; Thu, 19 Jan 2023 13:45:42 +0000
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
	bh=YUYZvw4RROg+8CsoP3Sio+dwD0Ri+23YpiqwwpCUAu0=; b=2I+3J4Q1I2AFKv8Q84+nG633MC
	bTs8dBzynUcRBH1RtDbs3hmnv76olYWTYu1ZChJiXPfJsU2BzlEAvaQitqyORQk7C0q6H+HUhesHg
	Zz1rlaQBOOT6eYBuZ3BzdA0MHzJGkChLCSbpjWITe+IFxHhNuRArO53+h+3A1BQFj2gM=;
Message-ID: <84a03cf7-1c3d-4e61-4865-e90d7a9c7862@xen.org>
Date: Thu, 19 Jan 2023 13:45:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 14/17] tools/xenstore: introduce trace classes
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230118095016.13091-1-jgross@suse.com>
 <20230118095016.13091-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230118095016.13091-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 18/01/2023 09:50, Juergen Gross wrote:
> Make the xenstored internal trace configurable by adding classes
> which can be switched on and off independently from each other.
> 
> Define the following classes:
> 
> - obj: Creation and deletion of interesting "objects" (watch,
>    transaction, connection)
> - io: incoming requests and outgoing responses
> - wrl: write limiting
> 
> Per default "obj" and "io" are switched on.
> 
> Entries written via trace() will always be printed (if tracing is on
> at all).
> 
> Add the capability to control the trace settings via the "log"
> command and via a new "--log-control" command line option.
> 
> Add a missing trace_create() call for creating a transaction.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

