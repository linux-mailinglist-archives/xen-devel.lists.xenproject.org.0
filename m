Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EC01A22F4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:28:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAkV-0006TT-06; Wed, 08 Apr 2020 13:28:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N8iV=5Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jMAkT-0006TO-FW
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:28:09 +0000
X-Inumbo-ID: c90127a2-799c-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c90127a2-799c-11ea-9e09-bc764e2007e4;
 Wed, 08 Apr 2020 13:28:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02CE4AF59;
 Wed,  8 Apr 2020 13:28:06 +0000 (UTC)
Subject: Re: [XEN PATCH v4 16/18] build,xsm: Fix multiple call
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200331103102.1105674-1-anthony.perard@citrix.com>
 <20200331103102.1105674-17-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <809cba94-cebf-29c6-39d5-31ec41bdbdc4@suse.com>
Date: Wed, 8 Apr 2020 15:28:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200331103102.1105674-17-anthony.perard@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 12:31, Anthony PERARD wrote:
> Both script mkflask.sh and mkaccess_vector.sh generates multiple
> files. Exploits the 'multi-target pattern rule' trick to call each
> scripts only once.

Isn't this a general fix, which may even want backporting? If so,
this would better be at or near the beginning of the series.

> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -26,14 +26,14 @@ mkflask := policy/mkflask.sh
>  quiet_cmd_mkflask = MKFLASK $@
>  cmd_mkflask = $(CONFIG_SHELL) $(mkflask) $(AWK) include $(FLASK_H_DEPEND)
>  
> -$(FLASK_H_FILES): $(FLASK_H_DEPEND) $(mkflask) FORCE
> +$(patsubst include/%,\%/%,$(FLASK_H_FILES)): $(FLASK_H_DEPEND) $(mkflask) FORCE

Since what $(FLASK_H_FILES) contains is well under our control,
how about the simpler

$(subst include/,%/,$(FLASK_H_FILES)): ...

? Preferably with this and preferably with it moved ahead
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

