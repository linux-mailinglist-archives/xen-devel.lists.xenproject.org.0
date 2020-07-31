Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010512346E3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 15:30:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1V75-0006bj-6R; Fri, 31 Jul 2020 13:30:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1V73-0006bd-9S
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 13:30:17 +0000
X-Inumbo-ID: f7cf482c-d331-11ea-abb1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7cf482c-d331-11ea-abb1-12813bfff9fa;
 Fri, 31 Jul 2020 13:30:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EB622AC5E;
 Fri, 31 Jul 2020 13:30:27 +0000 (UTC)
Subject: Re: [PATCH] tools/configure: drop BASH configure variable [and 1 more
 messages]
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200722113258.3673-1-andrew.cooper3@citrix.com>
 <20200626170038.27650-1-andrew.cooper3@citrix.com>
 <880fcc83-875c-c030-bfac-c64477aa3254@suse.com>
 <24313.55588.61431.336617@mariner.uk.xensource.com>
 <2c202733-cbff-74e0-30c6-4cba227e7969@suse.com>
 <24356.5736.297234.341867@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d963d352-d6d6-393a-9fdf-9d6f46450309@suse.com>
Date: Fri, 31 Jul 2020 15:30:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24356.5736.297234.341867@mariner.uk.xensource.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 15:02, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
>> On 29.06.2020 14:05, Ian Jackson wrote:
>>> Jan Beulich writes ("Re: [PATCH] tools/configure: drop BASH configure variable"):
>>>> On 26.06.2020 19:00, Andrew Cooper wrote:
>>>> ... this may or may not take effect on the file system the sources
>>>> are stored on.
>>>
>>> In what circumstances might this not take effect ?
>>
>> When the file system is incapable of recording execute permissions?
>> It has been a common workaround for this in various projects that
>> I've worked with to use $(SHELL) to account for that, so the actual
>> permissions from the fs don't matter. (There may be mount options
>> to make everything executable on such file systems, but people may
>> be hesitant to use them.)
> 
> I don't think we support building from sources which have been
> unpacked onto such filesystems.  Other projects which might actually
> need to build on Windows or something do do this $(SHELL) thing or an
> equivalent, but I don't think that's us.

It's not unexpected that you think of Windows here, but my thoughts
were more towards building from sources on a CD or DVD, where iirc
execute permissions also don't exist. The latest when we have
out-of-tree builds fully working, this ought to be something that
people should be able to do, imo. (Even without out-of-tree builds,
my "next best" alternative of using a tree of symlinks to build in
would similarly have an issue with the links pointing at a mounted
CD/DVD, if the $(SHELL) wasn't present.)

Jan

