Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6939D23E990
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 10:49:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3y3W-0000C1-Ox; Fri, 07 Aug 2020 08:48:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3y3V-0000Bw-2r
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 08:48:49 +0000
X-Inumbo-ID: 61de6ee3-d85a-4ed9-999f-77ac46da74c3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61de6ee3-d85a-4ed9-999f-77ac46da74c3;
 Fri, 07 Aug 2020 08:48:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 558C2AF06;
 Fri,  7 Aug 2020 08:49:05 +0000 (UTC)
Subject: Re: [PATCH 00/14] kernel-doc: public/arch-arm.h
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7923d0f4-a446-c852-5423-0fe65ef27a41@suse.com>
Date: Fri, 7 Aug 2020 10:48:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=windows-1252
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
Cc: julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.2020 01:49, Stefano Stabellini wrote:
> # THE KERNEL-DOC KEYWORDS USED
> 
> I used the "struct" keyword for structures, i.e.:
> 
> /**
>  * struct foobar
>  */
> 
> "struct" makes kernel-doc go and look at the following struct in the
> code, parses struct members comments, and generate a doc optimized to
> describe a struct. Note that in these cases the struct needs to follow
> immediately the comment. Thus, I had to move an #define between the
> comment and the struct in a few places.
> 
> Also note that kernel-doc supports nested structs but due to a quirk,
> comments for nested struct members cannot be on a single line. They have
> to be:
> 
>   struct foo {
>       struct {
>           /**
>            * @u.bar: foobar
>            */
>           bar;
>       } u;
>   }

Urgh.

> Otherwise for normal struct the single line comment works fine:
> 
>   struct foo {
>       /** @bar: foobar */
>       bar;
>   }
> 
> 
> I used the "DOC" keyword otherwise. "DOC" is freeform, not particularly
> tied to anything following (functions, enums, etc.) I kept a black line
> between "DOC" and the following comment if multiline and no blank line
> if it is single line.
> 
>   /**
>    * DOC: doc1
>    * single line comment
>    */
> 
>    /**
>     * DOC: doc2
>     *
>     * this is
>     * multiline
>     */

I think before the first piece of this goes in (or together with it
going in), ./CODING_STYLE wants to be updated to reflect this. It is
particularly relevant imo to mention the quirk above and hence the
necessary exception (even better of course would be to get the quirk
out of kernel-doc).

Jan

