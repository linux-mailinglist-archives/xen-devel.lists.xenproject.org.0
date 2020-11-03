Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F10522A40FF
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18141.42992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZt7X-0007NV-U3; Tue, 03 Nov 2020 10:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18141.42992; Tue, 03 Nov 2020 10:00:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZt7X-0007N6-Qg; Tue, 03 Nov 2020 10:00:55 +0000
Received: by outflank-mailman (input) for mailman id 18141;
 Tue, 03 Nov 2020 10:00:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kZt7W-0007N1-Dr
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:00:54 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d9fd4aa-2df8-4af0-a04e-9ca1e8fb4547;
 Tue, 03 Nov 2020 10:00:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZt7Q-00072x-Lu; Tue, 03 Nov 2020 10:00:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZt7Q-0002iL-Ai; Tue, 03 Nov 2020 10:00:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kZt7W-0007N1-Dr
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:00:54 +0000
X-Inumbo-ID: 8d9fd4aa-2df8-4af0-a04e-9ca1e8fb4547
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8d9fd4aa-2df8-4af0-a04e-9ca1e8fb4547;
	Tue, 03 Nov 2020 10:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=uP2W4gg5bUqMmDSdmcX7RGZycNlWhY3WAnjFDfiGHMg=; b=L6TXfZKWRvZISHxjF4GOInxMLT
	MjCX4vkf0flN21X6LC6PxA71OsMKBSs8+e4xuYuAXFiDjveBQQ/p7+k/aOOFWMd4JJ2pffV8+1XST
	k2lUfRMIdlqVMIWFemzZK1OPrsevqGwsCfOIt2Z5xXuWGjWsF8LyAGoobBLpZP74Wc8A=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZt7Q-00072x-Lu; Tue, 03 Nov 2020 10:00:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZt7Q-0002iL-Ai; Tue, 03 Nov 2020 10:00:48 +0000
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
From: Julien Grall <julien@xen.org>
Message-ID: <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
Date: Tue, 3 Nov 2020 10:00:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Frédéric,

On 31/10/2020 15:14, Frédéric Pierret (fepitre) wrote:
> ---
>   xen/Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/Makefile b/xen/Makefile
> index 30b1847515..4cc35556ef 100644
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>   export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>   -include xen-version
>   
> +export SOURCE_DATE_EPOCH	?= $(shell git log -1 --format=%ct 2>/dev/null)

It is possible to download a tarball for Xen release (see [1]). They 
don't contain the .git directory and therefore this command would fail.

Should we fallback to "date" in this case?

> +
>   export XEN_WHOAMI	?= $(USER)
>   export XEN_DOMAIN	?= $(shell ([ -x /bin/dnsdomainname ] && /bin/dnsdomainname) || ([ -x /bin/domainname ] && /bin/domainname || echo [unknown]))
>   ifneq ($(SOURCE_DATE_EPOCH),)
> 

Cheers,

[1] https://xenproject.org/downloads/

-- 
Julien Grall

