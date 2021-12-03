Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE8467590
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 11:46:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237324.411614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt65S-00057D-Ce; Fri, 03 Dec 2021 10:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237324.411614; Fri, 03 Dec 2021 10:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt65S-00055Q-9X; Fri, 03 Dec 2021 10:46:42 +0000
Received: by outflank-mailman (input) for mailman id 237324;
 Fri, 03 Dec 2021 10:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5e4h=QU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1mt65R-00055K-Cg
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 10:46:41 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1ff5e2-5426-11ec-976b-d102b41d0961;
 Fri, 03 Dec 2021 11:46:40 +0100 (CET)
Received: from [10.10.1.128] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1638528395358886.0942523011702;
 Fri, 3 Dec 2021 02:46:35 -0800 (PST)
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
X-Inumbo-ID: 4b1ff5e2-5426-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; t=1638528396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CfjSyFCXC4W0mmRI1bIQ5yaqXlbYPTUrVzAXzoo2iZjI5xJ58RhsQGQAvf6OtUOWYRFMZRqMEplkkdR4+tPnAgpGKM63F8nNTjaKvIQSr8dduBK7LmesI48j7YSCYEK04KIStTeVACVgfVT2MIOywaV0NIUarbkYMZe35TjVRcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1638528396; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=kSDw7C59Qoo3SKlNbWkKjlxqOSlzCZg9uZsCqFY3pRw=; 
	b=GRW+yvst1fHRszOL6/2luxqD7e2PP9UIpdMfr4bA7rSTHY5g6Fyd/SUfWXmFsJ/tZZiTO3j255jB578WyqcMgr1Emow4FJ6gy6+DcHpzqw+VE/g2vaXJBGZ59D7H8TLbNmjLtJUnPm7PHDQzg3DuOIw5XAYzdMT6x8X/x1UPAME=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1638528396;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kSDw7C59Qoo3SKlNbWkKjlxqOSlzCZg9uZsCqFY3pRw=;
	b=fZV9Vb5Sf1DxW2PMqmY/q7tZ49DgxH+llewErY4Kki7XoTe+zS0+SQYAdMKdAFFw
	Bhm4SKnjVdFEF2cLIfcBglZltlsCQbO21N48QbedmKMSNViL/aboV3dxvGsetMQ+EAD
	OvANGn0vuJzGlyoGzvlDcMjDYS8pNBjKh6goaE0Y=
Subject: Re: [PATCH 15/65] xsm: Annotate fnptr targets
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-16-andrew.cooper3@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <d4d43654-9df2-9a8e-33de-e7bc2cd3e38a@apertussolutions.com>
Date: Fri, 3 Dec 2021 05:46:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211126123446.32324-16-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/26/21 7:33 AM, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

