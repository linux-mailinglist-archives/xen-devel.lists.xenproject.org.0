Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E593E32D3C2
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 14:00:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93243.175988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnaS-0005xk-U5; Thu, 04 Mar 2021 13:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93243.175988; Thu, 04 Mar 2021 13:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnaS-0005xL-Qz; Thu, 04 Mar 2021 13:00:16 +0000
Received: by outflank-mailman (input) for mailman id 93243;
 Thu, 04 Mar 2021 13:00:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-0005xG-U1
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-00030t-Qe
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHnaQ-0005kI-O0
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:00:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHnaN-0005GY-CI; Thu, 04 Mar 2021 13:00:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=K7KXHwp6Sl8MAn+0wEKK+surykuLXrrgxgWCvRMSCXU=; b=5sYAyCAu/yVd1IxnvG23jB+vAN
	56jqtuGU3++RPs0EOO1QXqqJ/5+qakUmmJOsIH5EgCsuiEkvBV6AZsgVtxFP51ni94XiSf2mu9iQL
	fVVr/8Mwx3IBFG0wycsIjROG5mDWIbiROXRJeC9G+8+C7sAOych21Srh84gYaLUoopgw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24640.55771.89150.389969@mariner.uk.xensource.com>
Date: Thu, 4 Mar 2021 13:00:11 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11
In-Reply-To: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
References: <05fe3295-7993-2eb5-37bc-a6d04fde1fbc@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("[PATCH][4.15] crypto: adjust rijndaelEncrypt() prototype for gcc11"):
> Clearly neither the 1st nor the 2nd argument have a "source size" of 0.
> 
> --- a/xen/include/crypto/rijndael.h
> +++ b/xen/include/crypto/rijndael.h
> @@ -52,7 +52,7 @@
>  
>  int	rijndaelKeySetupEnc(unsigned int [], const unsigned char [], int);
>  int	rijndaelKeySetupDec(unsigned int [], const unsigned char [], int);
> -void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [],
> -	    unsigned char []);
> +void	rijndaelEncrypt(const unsigned int [], int, const unsigned char [16],
> +	    unsigned char [16]);
>  
>  #endif /* __RIJNDAEL_H */

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

