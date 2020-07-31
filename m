Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F623448D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 13:30:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1TEa-0004n1-LS; Fri, 31 Jul 2020 11:29:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1TEZ-0004mw-7f
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 11:29:55 +0000
X-Inumbo-ID: 2771b594-d321-11ea-8e26-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2771b594-d321-11ea-8e26-bc764e2007e4;
 Fri, 31 Jul 2020 11:29:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 711DEAB55;
 Fri, 31 Jul 2020 11:30:06 +0000 (UTC)
Subject: Re: kernel-doc and xen.git
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9421ec73-1ec0-844f-0014-bd5a36a4036f@suse.com>
Date: Fri, 31 Jul 2020 13:29:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org,
 Bertrand.Marquis@arm.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.07.2020 03:27, Stefano Stabellini wrote:
> Hi all,
> 
> I would like to ask for your feedback on the adoption of the kernel-doc
> format for in-code comments.
> 
> In the FuSa SIG we have started looking into FuSa documents for Xen. One
> of the things we are investigating are ways to link these documents to
> in-code comments in xen.git and vice versa.
> 
> In this context, Andrew Cooper suggested to have a look at "kernel-doc"
> [1] during one of the virtual beer sessions at the last Xen Summit.
> 
> I did give a look at kernel-doc and it is very promising. kernel-doc is
> a script that can generate nice rst text documents from in-code
> comments. (The generated rst files can then be used as input for sphinx
> to generate html docs.) The comment syntax [2] is simple and similar to
> Doxygen:
> 
>     /**
>      * function_name() - Brief description of function.
>      * @arg1: Describe the first argument.
>      * @arg2: Describe the second argument.
>      *        One can provide multiple line descriptions
>      *        for arguments.
>      */
> 
> kernel-doc is actually better than Doxygen because it is a much simpler
> tool, one we could customize to our needs and with predictable output.
> Specifically, we could add the tagging, numbering, and referencing
> required by FuSa requirement documents.
> 
> I would like your feedback on whether it would be good to start
> converting xen.git in-code comments to the kernel-doc format so that
> proper documents can be generated out of them. One day we could import
> kernel-doc into xen.git/scripts and use it to generate a set of html
> documents via sphinx.

How far is this intended to go? The example is description of a
function's parameters, which is definitely fine (albeit I wonder
if there's a hidden implication then that _all_ functions
whatsoever are supposed to gain such comments). But the text just
says much more generally "in-code comments", which could mean all
of them. I'd consider the latter as likely going too far.

Jan

