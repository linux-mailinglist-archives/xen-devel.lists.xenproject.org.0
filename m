Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4AE28CFC7
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 16:05:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6231.16562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKv6-0007Uh-MS; Tue, 13 Oct 2020 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6231.16562; Tue, 13 Oct 2020 14:04:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSKv6-0007UI-J2; Tue, 13 Oct 2020 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 6231;
 Tue, 13 Oct 2020 14:04:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSKv4-0007U9-KD
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:04:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9758e83-e599-41b1-9cd2-56d89a03ad4a;
 Tue, 13 Oct 2020 14:04:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0F31AABCC;
 Tue, 13 Oct 2020 14:04:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSKv4-0007U9-KD
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 14:04:50 +0000
X-Inumbo-ID: d9758e83-e599-41b1-9cd2-56d89a03ad4a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d9758e83-e599-41b1-9cd2-56d89a03ad4a;
	Tue, 13 Oct 2020 14:04:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602597889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fJOGg2+tRr993kw3sK8IPbALK/T6ItKt1gWPLVjTZMk=;
	b=N1LQy7maKi7fdudmNNtuZxdZb+tD1oUGj8xk3fp74G1BvOZRgCrZZdLI1Z60e07BRBipwZ
	TfOPOKYb+tUkkfD2W8m/Futi9FwKlem4ktmrCz+T8wEIUI0BiQuAT2wfIBydEBHZdpi0Re
	mG2mtfojxqiDIFjlLyYfl0yIDGtEY7Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0F31AABCC;
	Tue, 13 Oct 2020 14:04:49 +0000 (UTC)
Subject: Re: [PATCH v2] build: always use BASEDIR for xen sub-directory
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <df2fc83d3a84dd3fc2e58101ded22847fdbaa862.1602082503.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f492da43-4fd2-b798-7bb3-3810be5f4893@suse.com>
Date: Tue, 13 Oct 2020 16:04:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <df2fc83d3a84dd3fc2e58101ded22847fdbaa862.1602082503.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.10.2020 16:57, Bertrand Marquis wrote:
> Modify Makefiles using $(XEN_ROOT)/xen to use $(BASEDIR) instead.
> 
> This is removing the dependency to xen subdirectory preventing using a
> wrong configuration file when xen subdirectory is duplicated for
> compilation tests.
> 
> BASEDIR is set in xen/lib/x86/Makefile as this Makefile is directly
> called from the tools build and install process and BASEDIR is not set
> there.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

And once again
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

