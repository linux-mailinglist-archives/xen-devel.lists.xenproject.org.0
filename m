Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D75B34AE38
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 19:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101994.195424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPqoE-0008OX-I3; Fri, 26 Mar 2021 18:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101994.195424; Fri, 26 Mar 2021 18:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPqoE-0008OB-Eg; Fri, 26 Mar 2021 18:03:46 +0000
Received: by outflank-mailman (input) for mailman id 101994;
 Fri, 26 Mar 2021 18:03:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lPqoD-0008O6-FI
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 18:03:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPqoC-0004TC-6Y; Fri, 26 Mar 2021 18:03:44 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lPqoB-0000qd-UM; Fri, 26 Mar 2021 18:03:44 +0000
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
	bh=Vn5K8+827u0j2tL/5w3PXoqi0Zay3eOA6Y3FQXE9aRY=; b=bQygGXYFmHzTRVI0A2j+rP4ojN
	qNnrMGbeJwpX6/K7saK47RDejSof4oLZdW1X03/AN2mzSnEA+K1aASs3rsFLkELvfJhAHy0L1iptl
	wecc66xtoAM14jCX4KKt3H1mwkxHPms5ao8FZ/NyyrrbBtb8EEzZhYjI+IsKwTXK4hU4=;
Subject: Re: [PATCH-for-4.15 v3] tools/libs/store: tidy up libxenstore
 interface
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210324123948.7207-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a638d4e4-14c0-634d-433b-42b6ec6b50a8@xen.org>
Date: Fri, 26 Mar 2021 18:03:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324123948.7207-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/03/2021 12:39, Juergen Gross wrote:
> xenstore_lib.h is in need to be tidied up a little bit:
> 
> - the definition of struct xs_tdb_record_hdr shouldn't be here
> - some symbols are not namespaced correctly
> - the layout of a structure with an enum inside it depends on the
>    implementation of the compiler

TBH, they seem that each of them should be in their own patch. I am fine 
with one patch but I think you should at least outline the solution in 
the commit message. This will be easier to relate with the rest of the 
code (you are solving 3 issues at once).

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
>

Sorry I didn't realize, you already sent a v3. So I will repeat my 
comment here.

I think you want to summarize the discussion [1] in the commit message 
so it is clear that
   1) You are breaking the ABI (although it is technically broken as we 
use enum)
   2) Why this is fine to do it.

Cheers,

[1]  https://lists.xen.org/archives/html/xen-devel/2021-03/msg01267.html

-- 
Julien Grall

