Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42E1D914B
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 09:47:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jawy7-00082k-HF; Tue, 19 May 2020 07:47:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jawy5-00082X-JY
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 07:47:17 +0000
X-Inumbo-ID: f55a4fe0-99a4-11ea-a8e2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f55a4fe0-99a4-11ea-a8e2-12813bfff9fa;
 Tue, 19 May 2020 07:47:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2193AB64;
 Tue, 19 May 2020 07:47:17 +0000 (UTC)
Subject: Re: [PATCH v10 02/12] xen: add a generic way to include binary files
 as variables
To: Juergen Gross <jgross@suse.com>
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24d44577-2e59-1428-2b63-08c89a0046d8@suse.com>
Date: Tue, 19 May 2020 09:47:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519072106.26894-3-jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 09:20, Juergen Gross wrote:
> --- a/xen/xsm/flask/Makefile
> +++ b/xen/xsm/flask/Makefile
> @@ -39,6 +39,9 @@ $(subst include/,%/,$(AV_H_FILES)): $(AV_H_DEPEND) $(mkaccess) FORCE
>  obj-bin-$(CONFIG_XSM_FLASK_POLICY) += flask-policy.o
>  flask-policy.o: policy.bin
>  
> +flask-policy.S: $(XEN_ROOT)/xen/tools/binfile
> +	$(XEN_ROOT)/xen/tools/binfile -i $@ policy.bin xsm_flask_init_policy

I realize the script gets installed as executable, but such
permissions can get lost. Typically I think we invoke the shell
instead, with the script as first argument. Thoughts? Would
affect patch 8 then as well. Sorry for noticing this only now.

Jan

