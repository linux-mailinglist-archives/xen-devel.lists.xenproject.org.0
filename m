Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05CB5A376
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 22:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124860.1467042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uycee-0006Wx-O8; Tue, 16 Sep 2025 20:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124860.1467042; Tue, 16 Sep 2025 20:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uycee-0006U7-Ks; Tue, 16 Sep 2025 20:52:00 +0000
Received: by outflank-mailman (input) for mailman id 1124860;
 Tue, 16 Sep 2025 20:51:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew@xen.org>) id 1uyced-0006U1-AS
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 20:51:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyceY-00CxDf-00;
 Tue, 16 Sep 2025 20:51:54 +0000
Received: from [149.199.65.200] (helo=[10.10.151.52])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <andrew@xen.org>) id 1uyceY-00DG2N-0B;
 Tue, 16 Sep 2025 20:51:53 +0000
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
	bh=Uf6XeadhFawDcIV8dpBEaYKUBStuK0owIWX7FO5bFQ4=; b=yU/uzTSc2ZD78p5lNkW6mKdwRz
	oGu8ecZ3K4mDsKEjJFs5QI0TtXNfXAzBt4ihSVOoOxl6lEKIiNrgvex5jPtNdlXbiivcVG+VYQ7eX
	PoOCn+lRFdS2DzLkzmfMbqLBJfjvGLzfnK3DuT0wBRyBlVdNZhY9fsj2fncmaahacDB0=;
Message-ID: <71e80d9a-0210-490c-a3b0-6b370a18145f@xen.org>
Date: Tue, 16 Sep 2025 13:51:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/domain: introduce DOMID_ANY
To: Jan Beulich <jbeulich@suse.com>, dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250916173702.871508-2-dmukhin@ford.com>
 <9e5c0735-1024-4d44-b1bd-1a8909ce2c37@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew@xen.org>
In-Reply-To: <9e5c0735-1024-4d44-b1bd-1a8909ce2c37@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2025 1:05 pm, Jan Beulich wrote:
> On 16.09.2025 19:37, dmukhin@xen.org wrote:
>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -608,6 +608,9 @@ DEFINE_XEN_GUEST_HANDLE(mmuext_op_t);
>>  /* DOMID_INVALID is used to identify pages with unknown owner. */
>>  #define DOMID_INVALID        xen_mk_uint(0x7FF4)
>>  
>> +/* Domain ID allocator: search [1..DOMID_FIRST_RESERVED-1] range. */
> Considering this is an implementation detail of the hypervisor, ...
>
>> +#define DOMID_ANY            DOMID_INVALID
> ... I don't think this should go in a public header.

Except we want it for the toolstack to use, as part of preventing 0
being a magic number to XEN_DOMCTL_createdomain.

~Andrew

