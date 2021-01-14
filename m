Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F42F610D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 13:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66976.119190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01kq-0005VI-AZ; Thu, 14 Jan 2021 12:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66976.119190; Thu, 14 Jan 2021 12:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l01kq-0005Ut-7b; Thu, 14 Jan 2021 12:29:32 +0000
Received: by outflank-mailman (input) for mailman id 66976;
 Thu, 14 Jan 2021 12:29:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pJr6=GR=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l01ko-0005Ul-PX
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 12:29:30 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94b30c0d-680a-4264-8a40-6b5c1b8d7181;
 Thu, 14 Jan 2021 12:29:28 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10ECTCpW012292;
 Thu, 14 Jan 2021 13:29:13 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id E7FE1281D; Thu, 14 Jan 2021 13:29:12 +0100 (CET)
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
X-Inumbo-ID: 94b30c0d-680a-4264-8a40-6b5c1b8d7181
Date: Thu, 14 Jan 2021 13:29:12 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
Message-ID: <20210114122912.GA2522@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1101:0:0:0:1]); Thu, 14 Jan 2021 13:29:13 +0100 (MET)

On Thu, Jan 14, 2021 at 11:53:20AM +0100, Jan Beulich wrote:
> On 12.01.2021 19:12, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > Use unsigned char variable, or cast to (unsigned char), for
> > tolower()/islower() and friends. Fix compiler error
> > array subscript has type 'char' [-Werror=char-subscripts]
> 
> Isn't this something that wants changing in your ctype.h instead?
> the functions (or macros), as per the C standard, ought to accept
> plain char aiui, and if they use the input as an array subscript,
> it should be their implementation suitably converting type first.

I asked for inputs from NetBSD developers familiar with this part.

Although the parameter is an int, only a subset of values is valid,
as stated in ISO C 2018 (Section 7.4 paragrah 1):
> In all cases the argument is an int, the value of which shall be
> representable as an unsigned char or shall equal the value of the
> macro EOF.  If the argument has any other value, the behavior is 
> undefined.                               


As stated by NetBSD's ctype(3) manual page, NetBSD and glibc took different
approach. NetBSD emits a compile-time warning if the input may lead to
undefined behavior. quoting the man page:
     Some implementations of libc, such as glibc as of 2018, attempt to avoid
     the worst of the undefined behavior by defining the functions to work for
     all integer inputs representable by either unsigned char or char, and
     suppress the warning.  However, this is not an excuse for avoiding
     conversion to unsigned char: if EOF coincides with any such value, as it
     does when it is -1 on platforms with signed char, programs that pass char
     will still necessarily confuse the classification and mapping of EOF with
     the classification and mapping of some non-EOF inputs.


So, although no warning is emmited on linux, it looks like to me that the
cast to unsigned char is needed anyway, and relying on glibc's behavior
is not portable.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

