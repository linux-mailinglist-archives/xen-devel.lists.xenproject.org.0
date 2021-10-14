Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B53842D6DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 12:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209233.365622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxnK-00026E-8v; Thu, 14 Oct 2021 10:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209233.365622; Thu, 14 Oct 2021 10:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maxnK-00024U-5l; Thu, 14 Oct 2021 10:17:02 +0000
Received: by outflank-mailman (input) for mailman id 209233;
 Thu, 14 Oct 2021 10:17:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1maxnI-00024L-Pf
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 10:17:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maxnH-00064S-Ct; Thu, 14 Oct 2021 10:16:59 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.16.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1maxnH-00039L-6E; Thu, 14 Oct 2021 10:16:59 +0000
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
	bh=GY10fllVgq55HqLtUE9e1EBLbt2kE/rasoKtHXXYd0o=; b=GTTnJb32v1wjFH/82OGehE2gVx
	tFedkFgSfue09xHwkpbjA/fVLq+rfmZ1rNOga2BI1i+fL/H0R/x5lfgI2j6hftR4uMx+wGxO2g3tx
	64ASDuN9gdZ9INFbahIvNGvEROWNOAJuOH1AWGqeCu39SGjRSiMmPfiu/NTXA0D4Ze3Q=;
Message-ID: <e786f0dd-dfa3-d45c-1fa4-1497efedc7ec@xen.org>
Date: Thu, 14 Oct 2021 11:16:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH] Revert "xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag"
To: Christian Lindig <christian.lindig@citrix.com>
Cc: Michal Orzel <michal.orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 David Scott <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "bertrand.marquis@arm.com" <bertrand.marquis@arm.com>
References: <20211014084718.21733-1-michal.orzel@arm.com>
 <26a54c0f-7177-20d6-9186-08df5ebe852a@xen.org>
 <5C594BB0-FDF2-47B0-8E54-CEB154579F47@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5C594BB0-FDF2-47B0-8E54-CEB154579F47@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 14/10/2021 10:42, Christian Lindig wrote:
> 
> 
>> On 14 Oct 2021, at 10:33, Julien Grall <julien@xen.org 
>> <mailto:julien@xen.org>> wrote:
>>
>> Looking at the thread, we are only missing an ack for...
>>
>>> ---
>>>  tools/ocaml/libs/xc/xenctrl.ml  | 1 - > 
>>>   tools/ocaml/libs/xc/xenctrl.mli | 1 -
> 
> Acked-by: Christian Lindig <christian.lindig@citrix.com 
> <mailto:christian.lindig@citrix.com>>

Committed. Thank you!

Cheers,


-- 
Julien Grall

