Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7522B36C773
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 16:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118552.224739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOHD-0002rC-Vn; Tue, 27 Apr 2021 14:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118552.224739; Tue, 27 Apr 2021 14:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbOHD-0002ql-Rc; Tue, 27 Apr 2021 14:01:23 +0000
Received: by outflank-mailman (input) for mailman id 118552;
 Tue, 27 Apr 2021 14:01:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbOHB-0002qa-Gv
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 14:01:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbOHA-0000Ep-7b; Tue, 27 Apr 2021 14:01:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbOHA-0005Cy-09; Tue, 27 Apr 2021 14:01:20 +0000
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
	bh=QOz5+fD2+ZaOVs72M29oHJ/kbi7jMnLM1FKQY/BV/rg=; b=hJjfWasN0DLsk/g3kwzBqQDBzB
	TGCNxxb2kehZKAgg8d03/1OSuS04CMPB1SU33/pUcjQyR0x5XgGoN2r5xWWUsMuO1wQ8YDtkDlJvs
	GjZ+5ZKRtBvvhUaoI5LzJjI0FVwdE6bRZnXP+MIm8HzIRBaGRfczv67ukIcLtv7Xn1tw=;
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Jan Beulich <jbeulich@suse.com>, Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f9ac61bd-13d1-c6a0-cbc7-85b4121f974a@xen.org>
Date: Tue, 27 Apr 2021 15:01:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 27/04/2021 14:57, Jan Beulich wrote:
>> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hypercall-interfaces/arm64/grant_tables.rst
>> new file mode 100644
>> index 0000000000..8955ec5812
>> --- /dev/null
>> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
>> @@ -0,0 +1,8 @@
>> +.. SPDX-License-Identifier: CC-BY-4.0
>> +
>> +Grant Tables
>> +============
>> +
>> +.. doxygengroup:: grant_table
> 
> I continue to object to this giving the impression that grant tables
> are something Arm64 specific.

+1, grant tables is common interface so why do they need to be described 
per arch?

I haven't looked at the history of the patch, but if there was some 
rationale about this approach, then this ought to be written in the 
commit message or at least after (---).

Cheers,

-- 
Julien Grall

