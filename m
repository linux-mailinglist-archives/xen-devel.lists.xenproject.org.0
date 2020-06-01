Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD831E9D56
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 07:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfczC-0006X3-OP; Mon, 01 Jun 2020 05:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+B1I=7O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jfczB-0006Wy-Gt
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 05:27:45 +0000
X-Inumbo-ID: 9e1cd922-a3c8-11ea-aaee-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e1cd922-a3c8-11ea-aaee-12813bfff9fa;
 Mon, 01 Jun 2020 05:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 80141B03E;
 Mon,  1 Jun 2020 05:27:43 +0000 (UTC)
Subject: Re: [PATCH v10 05/12] libs: add libxenhypfs
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200519072106.26894-1-jgross@suse.com>
 <20200519072106.26894-6-jgross@suse.com>
 <8468b7ea-81ba-0512-c638-322803134576@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <91bd61d3-3f61-c8c8-8f7b-4547eb02b342@suse.com>
Date: Mon, 1 Jun 2020 07:27:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8468b7ea-81ba-0512-c638-322803134576@citrix.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.05.20 17:54, Andrew Cooper wrote:
> On 19/05/2020 08:20, Juergen Gross wrote:
>> diff --git a/tools/libs/hypfs/include/xenhypfs.h b/tools/libs/hypfs/include/xenhypfs.h
>> new file mode 100644
>> index 0000000000..ab157edceb
>> --- /dev/null
>> +++ b/tools/libs/hypfs/include/xenhypfs.h
>> @@ -0,0 +1,90 @@
>> +/*
>> + * Copyright (c) 2019 SUSE Software Solutions Germany GmbH
>> + *
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License as published by the Free Software Foundation;
>> + * version 2.1 of the License.
>> + *
>> + * This library is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
>> + * Lesser General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU Lesser General Public
>> + * License along with this library; If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +#ifndef XENHYPFS_H
>> +#define XENHYPFS_H
>> +
>> +#include <stdbool.h>
>> +#include <stdint.h>
>> +#include <sys/types.h>
>> +
>> +/* Callers who don't care don't need to #include <xentoollog.h> */
>> +struct xentoollog_logger;
>> +
>> +typedef struct xenhypfs_handle xenhypfs_handle;
>> +
>> +struct xenhypfs_dirent {
>> +    char *name;
>> +    size_t size;
>> +    enum {
>> +        xenhypfs_type_dir,
>> +        xenhypfs_type_blob,
>> +        xenhypfs_type_string,
>> +        xenhypfs_type_uint,
>> +        xenhypfs_type_int,
>> +        xenhypfs_type_bool
>> +    } type;
>> +    enum {
>> +        xenhypfs_enc_plain,
>> +        xenhypfs_enc_gzip
>> +    } encoding;
>> +    bool is_writable;
>> +};
> 
> I'm afraid this a blocker bug for 4.14.
> 
> enum's aren't safe in public ABI structs, even under _GNU_SOURCE.  Use
> unsigned int's, and declare the enumerations earlier.
> 
> There is also 3/7 bytes of trailing padding and very little forward
> extensibility.  How about an unsigned int flags, of which writeable is
> the bottom bit, seeing as this is purely an informational field?

Sounds fine. I'll send a patch on Tuesday (today is a local holiday in
Germany and I need to do some outdoor work).


Juergen

