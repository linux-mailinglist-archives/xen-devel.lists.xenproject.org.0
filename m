Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 920672573F2
	for <lists+xen-devel@lfdr.de>; Mon, 31 Aug 2020 08:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCdgI-0000fd-NZ; Mon, 31 Aug 2020 06:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kCdgH-0000fY-Hl
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 06:52:41 +0000
X-Inumbo-ID: d1722020-ca06-41cc-b20d-cd15a9e16523
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1722020-ca06-41cc-b20d-cd15a9e16523;
 Mon, 31 Aug 2020 06:52:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 32472ADD6;
 Mon, 31 Aug 2020 06:53:14 +0000 (UTC)
Subject: Re: [PATCH] gitignore: Move ignores from global to subdirectories
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Doug Goldstein <cardoe@cardoe.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200828025747.GA25246@mattapan.m5p.com>
 <d284a27c-f347-f80f-f62f-78134749e20d@suse.com>
 <20200831063748.GB1522@mattapan.m5p.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ccab621e-9962-6715-896d-30e6bb8b9520@suse.com>
Date: Mon, 31 Aug 2020 08:52:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200831063748.GB1522@mattapan.m5p.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.08.2020 08:37, Elliott Mitchell wrote:
> On Fri, Aug 28, 2020 at 09:24:41AM +0200, Jan Beulich wrote:
>> On 28.08.2020 04:57, Elliott Mitchell wrote:
>>> Subdirectories which have .gitignore files should not be referenced in
>>> the global .gitignore files.  Move several lines to appropriate subdirs.
>>>
>>> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
>>>
>>> ---
>>> Hopefully the commit message covers it.  When moved to the subdirectories
>>> I'm using "./<file>" as otherwise any file sharing the name in a deeper
>>> subdirectory would be subject to the match.
>>
>> May I ask why this last sentence isn't part of the commit message?
> 
> My thinking is it was pretty straightforward to figure out when looking.
> Not /quite/ obvious enough to avoid commenting in e-mail, but not quite
> obscure enough to have in commit message.  This can go either way really.

Your statements below really look to me as if this wasn't this obvious
at all - ...

> The .gitignore files aren't very consistent.  I'm unsure whether it is
> worth going after the inconsistencies, but it is certainly there.
> 
> Before this I noticed xen/xsm/flask/.gitignore had "/policy.c", which
> overlapped with "xen/xsm/flask/policy.*" in the top-level .gitignore.
> Checking the documentation on .gitignore files if it simply had
> "policy.c", git would have ignored any file name "policy.c" in
> subdirectories.
> 
> Is it better to prefix lines in the current directory with "./" versus
> "/"?  (I kind of like "./" since it looks like a relative path, but it
> *isn't* actually a relative path)

... you even look to suggest here that there are two alternative
forms which both have the same meaning. Personally I agree that
./ may be more "natural" to use than /, but the question then is
what the conventions are. I can't answer this.

> Should files in subdirectories also include "./"?

If "no prefix at all" includes, as you say, also files in subdirs,
then the answer probably is "depends".

> Preferences in sorting?

Alphabetical sorting is what we generally aim for here.

Jan

