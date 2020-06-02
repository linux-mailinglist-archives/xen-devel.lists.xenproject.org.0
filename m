Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13B1EBA39
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 13:18:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg4wA-0008Dl-Hi; Tue, 02 Jun 2020 11:18:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg4w8-0008Dg-UM
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 11:18:28 +0000
X-Inumbo-ID: c8040f9e-a4c2-11ea-abd7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8040f9e-a4c2-11ea-abd7-12813bfff9fa;
 Tue, 02 Jun 2020 11:18:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC03BAA6F;
 Tue,  2 Jun 2020 11:18:28 +0000 (UTC)
Subject: Re: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading
 documentation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200601134025.24142-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4b93512-240b-6f7e-cfa5-23a14489420e@suse.com>
Date: Tue, 2 Jun 2020 13:18:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200601134025.24142-1-andrew.cooper3@citrix.com>
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.06.2020 15:40, Andrew Cooper wrote:
> Extend the disclaimer about runtime loading.  While we've done our best to
> make the mechaism reliable, the safety of late loading does ultimately depend
> on the contents of the blobs.
> 
> Extend the xen-ucode portion with examples of how to use it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> ---
>  docs/admin-guide/microcode-loading.rst | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
> index 5f0f661a2e..8cd5d0351b 100644
> --- a/docs/admin-guide/microcode-loading.rst
> +++ b/docs/admin-guide/microcode-loading.rst
> @@ -104,8 +104,8 @@ modules to find any CPIO archives, and search the archive for the applicable
>  file.  Xen will stop searching at the first match.
>  
>  
> -Run time microcode loading
> ---------------------------
> +Runtime microcode loading
> +-------------------------
>  
>  .. warning::
>  
> @@ -113,7 +113,23 @@ Run time microcode loading
>     or at boot time.  Not all microcode updates (or parts thereof) can be
>     applied at runtime.
>  
> -The ``xen-ucode`` utility can be used to initiate a runtime microcode load.
> +   Given the proprietry nature of microcode, we are unable to make any claim
> +   that a runtime microcode is risk-free.  Any runtime microcode loading needs

"that runtime microcode loading is risk-free" (or some such, including
the word "load")? Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

