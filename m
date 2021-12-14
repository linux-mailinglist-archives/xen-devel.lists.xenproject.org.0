Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 645E14748E0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 18:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246956.425930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBHL-0006Yg-IJ; Tue, 14 Dec 2021 17:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246956.425930; Tue, 14 Dec 2021 17:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxBHL-0006Wv-FD; Tue, 14 Dec 2021 17:07:51 +0000
Received: by outflank-mailman (input) for mailman id 246956;
 Tue, 14 Dec 2021 17:07:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxBHK-0006Wn-0V
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 17:07:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBHI-0004fc-2k; Tue, 14 Dec 2021 17:07:48 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxBHH-0004jZ-Sr; Tue, 14 Dec 2021 17:07:48 +0000
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
	bh=i50K/7EwgKHpshLqmUbo5A/wty9ebUcpgeIvfZUJmjE=; b=dqSloZFh1/Z7lQQZbAgtap12rz
	0AWGfTpZOGtxQbUUFYkXX4/sFNAXHWesqR/4rm0n0yKH4h+q+h/QNYoajzOnJZ74NpL1rhRTLIap1
	es/1D9fKNgxGH5iQc0akYcafFpKji7rOGod7oRKWyTdudujiy+k0iTZdbrIQhulKHzV4=;
Message-ID: <d8b5bc56-1bdd-d6ec-42aa-860e81172e88@xen.org>
Date: Tue, 14 Dec 2021 17:07:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN PATCH v8 22/47] build: clean-up "clean" rules of duplication
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
 <20211125134006.1076646-23-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211125134006.1076646-23-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 25/11/2021 13:39, Anthony PERARD wrote:
> All those files to be removed are already done in the main Makefile,
> either by the "find" command or directly (for $(TARGET).efi).
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

