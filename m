Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDB1D173E
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2020 16:13:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYs8a-00010E-Rd; Wed, 13 May 2020 14:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYs8a-000109-0p
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:13:32 +0000
X-Inumbo-ID: ebeec59c-9523-11ea-a384-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ebeec59c-9523-11ea-a384-12813bfff9fa;
 Wed, 13 May 2020 14:13:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4B8B4AC90;
 Wed, 13 May 2020 14:13:32 +0000 (UTC)
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
 <20200513135552.24329-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a56bb718-47e8-ab45-d706-84f59d3131d8@suse.com>
Date: Wed, 13 May 2020 16:13:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200513135552.24329-3-andrew.cooper3@citrix.com>
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
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13.05.2020 15:55, Andrew Cooper wrote:
> Xen doesn't support CET-IBT yet.  At a minimum, logic is required to enable it
> for supervisor use, but the livepatch functionality needs to learn not to
> overwrite ENDBR64 instructions.
> 
> Furthermore, Ubuntu enables -fcf-protection by default, along with a buggy
> version of GCC-9 which objects to it in combination with
> -mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).
> 
> Various objects (Xen boot path, Rombios 32 stubs) require .text to be at the
> beginning of the object.  These paths explode when .note.gnu.properties gets
> put ahead of .text and we end up executing the notes data.
> 
> Disable -fcf-protection for all embedded objects.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

For the immediate purpose
Reviewed-by: Jan Beulich <jbeulich@suse.com>

I wonder however ...

> --- a/Config.mk
> +++ b/Config.mk
> @@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>  
>  EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none

... whether this isn't going to bite us once some of the consumers
of this variable want to enable some different mode.

Jan

