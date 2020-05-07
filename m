Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E41C886A
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 13:36:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWeoF-0001kq-Eh; Thu, 07 May 2020 11:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AJJs=6V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jWeoD-0001kh-EP
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 11:35:21 +0000
X-Inumbo-ID: d50b286a-9056-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d50b286a-9056-11ea-b07b-bc764e2007e4;
 Thu, 07 May 2020 11:35:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3BAB0AB8F;
 Thu,  7 May 2020 11:35:22 +0000 (UTC)
Subject: Re: [PATCH v7 05/12] libs: add libxenhypfs
To: George Dunlap <George.Dunlap@citrix.com>
References: <20200402154616.16927-1-jgross@suse.com>
 <20200402154616.16927-6-jgross@suse.com>
 <936102D2-0655-43EA-B52A-DED46E9E07D0@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <57e40d81-1e06-bb71-9b27-f955654cf681@suse.com>
Date: Thu, 7 May 2020 13:35:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <936102D2-0655-43EA-B52A-DED46E9E07D0@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.04.20 16:53, George Dunlap wrote:
> 
> 
>> On Apr 2, 2020, at 4:46 PM, Juergen Gross <JGross@suse.com> wrote:
>>
>> Add the new library libxenhypfs for access to the hypervisor filesystem.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Wei Liu <wl@xen.org>
> 
> Just a few questions...
> 
>> +/* Returned buffer and dirent should be freed via free(). */
>> +void *xenhypfs_read_raw(xenhypfs_handle *fshdl, const char *path,
>> +                        struct xenhypfs_dirent **dirent);
>> +
>> +/* Returned buffer should be freed via free(). */
>> +char *xenhypfs_read(xenhypfs_handle *fshdl, const char *path);
> 
> What’s the difference between these two?  And what’s the `dirent` argument to xenhypfs_read_raw() for?

xenhypfs_read() is returning the printable content (if possible),
e.g. "1" for an entry of type integer containing 0x00000001

xenhypfs_read_raw() returns the raw content (e.g. the binary
value 0x00000001 in above example) and the entry format data in
dirent (type, size and enconding of entry).


Juergen

