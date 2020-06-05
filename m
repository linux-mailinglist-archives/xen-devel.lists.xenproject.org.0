Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804901EF30A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 10:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh7gJ-0004zf-MY; Fri, 05 Jun 2020 08:26:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh7gH-0004za-Kt
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 08:26:25 +0000
X-Inumbo-ID: 3dfaf4de-a706-11ea-af89-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3dfaf4de-a706-11ea-af89-12813bfff9fa;
 Fri, 05 Jun 2020 08:26:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8C944ACD0;
 Fri,  5 Jun 2020 08:26:26 +0000 (UTC)
Subject: Re: [PATCH for-4.14 RFC] docs/support-matrix: Gross bodge to unbreak
 docs rendering
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200604205226.14518-1-andrew.cooper3@citrix.com>
 <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c73dd31b-7ac6-5016-3012-ca95cf80c522@suse.com>
Date: Fri, 5 Jun 2020 10:26:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <f2a2fbe6-c198-708c-b8c8-d8e9c27d00ee@citrix.com>
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
 Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 22:58, Andrew Cooper wrote:
> On 04/06/2020 21:52, Andrew Cooper wrote:
>> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
>> while.  commitish_version() pulls an old version of xen/Makefile out of
>> history, and uses the xenversion rule.
>>
>> Currently, this fails with:
>>
>>   tmp.support-matrix.xen.make:130: scripts/Kbuild.include: No such file or directory
>>
>> which is because the Makefile legitimately references Kbuild.include with a
>> relative rather than absolute path.
>>
>> Rearrange $CWD of the make rune to be in xen/
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Ian Jackson <ian.jackson@citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Anthony PERARD <anthony.perard@citrix.com>
>> CC: Paul Durrant <paul@xen.org>
>>
>> This is obviously not a proper fix.  It will break in an unfixable way if we
>> ever delete a file from the xen/ build system.
>>
>> I don't think pulling a makefile out of history and expecting it to work in
>> the current working tree is a reasonable expectation.
> 
> Actually - it occurs to me that we only want the major and minor number.
> 
> I think it is reasonable to expect that those will always be plain
> numbers, and we can grep them directly out of the file, rather than
> feeding the thing to make.
> 
> Thoughts?

I was about to ask why we don't do that.

Jan

