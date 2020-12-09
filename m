Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A5E2D46AD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:25:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48518.85817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Gf-00060P-4L; Wed, 09 Dec 2020 16:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48518.85817; Wed, 09 Dec 2020 16:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn2Gf-000600-1G; Wed, 09 Dec 2020 16:24:41 +0000
Received: by outflank-mailman (input) for mailman id 48518;
 Wed, 09 Dec 2020 16:24:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn2Gd-0005zt-5o
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:24:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn2Gb-0004RF-8p; Wed, 09 Dec 2020 16:24:37 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn2Gb-0000Ae-0N; Wed, 09 Dec 2020 16:24:37 +0000
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
	bh=CrduSadRGWxDmlUA9cyM3OxNjxcP51vGA77Oa/Mm+pc=; b=K/aYP80xERl8bFO3fxINkKXKfu
	MosNRQbijFi0EWj9mGpFyej/8hICDFgxmhG+ARLmD5nWAu/xKAy5hrh0ob75E+z5MHzQe0MIExFtm
	JZcDovgMR6D7B1FL0EyPTTek3tya6b4QoYdvK5imF7SWYti4ZY7icsmWnKcwMl47uI00=;
Subject: Re: [PATCH RFC 0/3] xen: add hypfs per-domain abi-features
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201209161618.309-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a2270efd-19d4-5d5e-2e8b-4696ba9751ab@xen.org>
Date: Wed, 9 Dec 2020 16:24:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201209161618.309-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 09/12/2020 16:16, Juergen Gross wrote:
> This small series is meant as an example how to add further dynamical
> directories to hypfs. It can be used to replace Paul's current approach
> to specify ABI-features via domain create flags and replace those by
> hypfs nodes.

This can only work if all the ABI-features are not required at the time 
of creating the domain.

Those features should also be set only once. Furthermore, HYPFS is so 
far meant to be optional.

So it feels to me Paul's approach is leaner and better for the 
ABI-features purpose.

Cheers,

-- 
Julien Grall

