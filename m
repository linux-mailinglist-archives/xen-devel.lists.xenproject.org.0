Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8AD2B5E20
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 12:19:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28933.58088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kez0U-0006g9-75; Tue, 17 Nov 2020 11:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28933.58088; Tue, 17 Nov 2020 11:18:42 +0000
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
	id 1kez0U-0006fn-3j; Tue, 17 Nov 2020 11:18:42 +0000
Received: by outflank-mailman (input) for mailman id 28933;
 Tue, 17 Nov 2020 11:18:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kez0S-0006fi-Ci
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:18:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63b42f8-ea1e-4495-b9bc-56293f9071f5;
 Tue, 17 Nov 2020 11:18:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4AE2AC23;
 Tue, 17 Nov 2020 11:18:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kez0S-0006fi-Ci
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 11:18:40 +0000
X-Inumbo-ID: b63b42f8-ea1e-4495-b9bc-56293f9071f5
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b63b42f8-ea1e-4495-b9bc-56293f9071f5;
	Tue, 17 Nov 2020 11:18:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605611919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lkxfR3i5w6zX+HLBvlooZzm+W9Yy7IGTSSX3u9qyyyY=;
	b=N/4FGcRBg/o+eoVv6Lpej/u6a6Fw/D6Jl6GQl47ycESoOrDMpiejQPppevr/ktS+KJNsaa
	WXQQWjPGw0pbP8DNdIDHvBOv5UwEHQFB/yrQVmEWvlnjDKLcbqPN82lsm2skwDSIFoAGaD
	CZgFnna3GShLe/O7I0fBVZTFRwp8/h0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D4AE2AC23;
	Tue, 17 Nov 2020 11:18:38 +0000 (UTC)
Subject: Re: [PATCH 06/12] xen/hypfs: move per-node function pointers into a
 dedicated struct
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c9d71ea-8f25-0f57-ac48-5152a1e35264@suse.com>
Date: Tue, 17 Nov 2020 12:18:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> @@ -15,10 +29,7 @@ struct hypfs_entry {
>      unsigned int max_size;
>      const char *name;
>      struct list_head list;
> -    int (*read)(const struct hypfs_entry *entry,
> -                XEN_GUEST_HANDLE_PARAM(void) uaddr);
> -    int (*write)(struct hypfs_entry_leaf *leaf,
> -                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int ulen);
> +    struct hypfs_funcs *funcs;

const (with all the cascade changes necessary)?

Jan

