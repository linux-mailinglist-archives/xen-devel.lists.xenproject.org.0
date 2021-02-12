Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FAC31A269
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 17:13:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84373.158240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb3g-0005vh-V1; Fri, 12 Feb 2021 16:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84373.158240; Fri, 12 Feb 2021 16:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAb3g-0005vH-Rb; Fri, 12 Feb 2021 16:12:40 +0000
Received: by outflank-mailman (input) for mailman id 84373;
 Fri, 12 Feb 2021 16:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAb3f-0005vC-Qv
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 16:12:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c3fa973-6f9d-40c4-a2c8-8a23a723f7fc;
 Fri, 12 Feb 2021 16:12:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5777FB7A7;
 Fri, 12 Feb 2021 16:12:38 +0000 (UTC)
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
X-Inumbo-ID: 2c3fa973-6f9d-40c4-a2c8-8a23a723f7fc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613146358; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0D8qcfOgFn7FHOECrrXxpmKqC4jFpbIEWCm0H1u4gBc=;
	b=FC+L907nin3PVfz5jXvXFY7E1lSL8dBHhSKne8bw1lY4pzlYQ7aYC0x+P9mXjwlHRbZXSF
	9/zjy/qg33Zon+7wKtf0yNVFBgDN59ULqCmh6iJoOLMrv6nAMpOgZXev+OGtJus3/KSm9M
	e9rbt472ch1fSViE2Yney21HPvR9n48=
Subject: Re: [PATCH 10/10] tools/libs: Write out an ABI analysis when
 abi-dumper is available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210212153953.4582-1-andrew.cooper3@citrix.com>
 <20210212153953.4582-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bac2a21-736d-9b07-4ee0-4654b5273ce5@suse.com>
Date: Fri, 12 Feb 2021 17:12:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210212153953.4582-11-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.02.2021 16:39, Andrew Cooper wrote:
> --- a/tools/libs/libs.mk
> +++ b/tools/libs/libs.mk
> @@ -49,6 +49,8 @@ PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
>  LIBHEADER ?= $(LIB_FILE_NAME).h
>  LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
>  
> +PKG_ABI := lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)-$(XEN_COMPILE_ARCH)-abi.dump

Don't you mean $(XEN_TARGET_ARCH) here?

Jan

