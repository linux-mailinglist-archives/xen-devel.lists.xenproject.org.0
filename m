Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE33467578
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:44:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237315.411594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt63P-0004QY-Um; Fri, 03 Dec 2021 10:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237315.411594; Fri, 03 Dec 2021 10:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt63P-0004O6-RR; Fri, 03 Dec 2021 10:44:35 +0000
Received: by outflank-mailman (input) for mailman id 237315;
 Fri, 03 Dec 2021 10:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5e4h=QU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mt63O-0004Nw-8E
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:44:34 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff3f820e-5425-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:44:33 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1638528267238734.1398885193619;
 Fri, 3 Dec 2021 02:44:27 -0800 (PST)
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
X-Inumbo-ID: ff3f820e-5425-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; t=1638528269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KT2Gru+LrRepHwPqRm6hHPPFbRYBTCLCDmY8zphTwwoIJjBMZwtAaPCUIHyy9HVAMkmTTpcQmYZ68qA44qi2a9ZrGDv1HTtatkEGzkH+hRsxpPUXmuV1X6MxsxKpQyYmTwiuPhB+K9vBZHDmobj3WjelHWMzu/tBPPPc8PwBj7w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1638528269; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kSDw7C59Qoo3SKlNbWkKjlxqOSlzCZg9uZsCqFY3pRw=; 
	b=lAN6FnOn2FJ9S2Y7A2/645EgFjvdRkeK7Nm+E8DD4IC574ROJe9GysFR09qWd2FGqlCX6zalRCrRwvdVtO4ohyGTA/sJL6u1HIjmbQlKaimy3fr7LKVmvgOwhoFABCgL4/jTsCBq+g9HQCvo35rmYoud4DgsdgIsojzkBGIxvIE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1638528269;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kSDw7C59Qoo3SKlNbWkKjlxqOSlzCZg9uZsCqFY3pRw=;
	b=S+WGih6N1x+R6upaRUVaBi8MnDGDus8k6/j5MJVaV49v219bOYbpMLT6Zu1/uPOR
	qtfI+n2yDzPiMx/3z+uXX97Lgyl17pobjtbF41W47X3etWNdq+i5ETsRCyXFP/9uJRS
	gyGs2FKpk2rL0P2uHaeqo8UsGR0XPzkcDhDRcuvE=
Subject: Re: [PATCH 14/65] xsm/flask: Annotate fnptr targets in the security
 server
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-15-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <55d493fb-7882-1ebb-6d40-305eb9d0d6cf@apertussolutions.com>
Date: Fri, 3 Dec 2021 05:44:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211126123446.32324-15-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/21 7:33 AM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

