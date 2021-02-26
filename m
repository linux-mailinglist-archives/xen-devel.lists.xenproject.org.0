Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA193326467
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 15:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90385.171068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeV3-0005Q6-TG; Fri, 26 Feb 2021 14:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90385.171068; Fri, 26 Feb 2021 14:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFeV3-0005Ph-QA; Fri, 26 Feb 2021 14:53:49 +0000
Received: by outflank-mailman (input) for mailman id 90385;
 Fri, 26 Feb 2021 14:53:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFeV2-0005Pc-1v
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 14:53:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFeUz-0005Qq-Rz; Fri, 26 Feb 2021 14:53:45 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFeUz-0006WC-Hk; Fri, 26 Feb 2021 14:53:45 +0000
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
	bh=/XxitYmbtMdY5Kmb/chQfd8nUNCdrYxRbctwC8wUOZs=; b=cUAm7PLyUfKUIh/sGUcqrMzJHU
	hnAHVueoe1zwqiQGvMkIP7+0YFye5ZNqfp+ABGldD9nuDJD+g0mpAXq84DVtr2qxyB6MV4zXhrXtE
	TGp8U2aC5jvlFF0XmWe1R0Tq7wlZnNJnE8na8BL/FAi66LDezA3dZlDv725rc3LBX+PA=;
Subject: Re: [PATCH XENSTORE v1 10/10] xs: add error handling
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Julien Grall <jgrall@amazon.co.uk>,
 Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-11-nmanthey@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <78560c14-81dc-05de-26f8-15861459806d@xen.org>
Date: Fri, 26 Feb 2021 14:53:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226144144.9252-11-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Norbert,

On 26/02/2021 14:41, Norbert Manthey wrote:
> In case of a failure deep in the call tree, we might return NULL as the
> value of the domain. In that case, error out instead of dereferencing
> the NULL pointer.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.

This commit message is not very descriptive. Internally, I suggested:

"
tools/xenstore: Harden xs_domain_is_introduced()

The function single_with_domid() may return NULL if something
went wrong (e.g. XenStored returns an error or the connection is
in bad state).

They are unlikely but not impossible, so it would be better to
return an error and allow the caller to handle it gracefully rather
than crashing.

In this case we should treat it as the domain has disappeared (i.e.
return false) as the caller will not likely going to be able to
communicate with XenStored again.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.
"

I would have expected this to be addressed given that...

> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk
... you carried over my reviewed-by tag.


Cheers,

-- 
Julien Grall

