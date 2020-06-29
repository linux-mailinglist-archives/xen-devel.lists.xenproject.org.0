Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3020CD5E
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 10:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jppMX-0006my-2p; Mon, 29 Jun 2020 08:42:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jppMW-0006mt-3U
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 08:42:00 +0000
X-Inumbo-ID: 64ed8458-b9e4-11ea-853f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64ed8458-b9e4-11ea-853f-12813bfff9fa;
 Mon, 29 Jun 2020 08:41:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19471AB89;
 Mon, 29 Jun 2020 08:41:58 +0000 (UTC)
Subject: Re: [PATCH] tools/configure: drop BASH configure variable
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200626170038.27650-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
Date: Mon, 29 Jun 2020 10:41:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626170038.27650-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Ian Jackson <Ian.Jackson@citrix.com>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.06.2020 19:00, Andrew Cooper wrote:
> @@ -24,14 +20,14 @@ extra-y += $(ALL_H_FILES)
>  
>  mkflask := policy/mkflask.sh
>  quiet_cmd_mkflask = MKFLASK $@
> -cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
> +cmd_mkflask = $(mkflask) $(AWK) include $(FLASK_H_DEPEND)

This and ...

>  $(subst include/,%/,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE
>  	$(call if_changed,mkflask)
>  
>  mkaccess := policy/mkaccess_vector.sh
>  quiet_cmd_mkaccess = MKACCESS VECTOR $@
> -cmd_mkaccess = $(CONFIG_SHELL) $(mkaccess) $(AWK) $(AV_H_DEPEND)
> +cmd_mkaccess = $(mkaccess) $(AWK) $(AV_H_DEPEND)

... this should still use $(SHELL) though, as ...

> diff --git a/xen/xsm/flask/policy/mkaccess_vector.sh b/xen/xsm/flask/policy/mkaccess_vector.sh
> old mode 100644
> new mode 100755
> diff --git a/xen/xsm/flask/policy/mkflask.sh b/xen/xsm/flask/policy/mkflask.sh
> old mode 100644
> new mode 100755

... this may or may not take effect on the file system the sources
are stored on.

Jan

