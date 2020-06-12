Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9568E1F763F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 11:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjgNd-0007aw-5D; Fri, 12 Jun 2020 09:53:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjgNb-0007aA-9l
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 09:53:43 +0000
X-Inumbo-ID: 98b3d8be-ac92-11ea-b5b0-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98b3d8be-ac92-11ea-b5b0-12813bfff9fa;
 Fri, 12 Jun 2020 09:53:42 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: VA5PqxmCpZsnA/rl8fUrRRvX420SqoeFC2oU1F/cBAy8d1F+lNya0RWBjF85hpF9JAU1J8d79O
 cqtYtRFM9MazDYRncU3JFBupSUlAMuGZkn/B7aboA88dL6r0XiG7oNJ9ZU5/eSIyzkaQH3sLMo
 64gJlZtjXuikbs05MWYRkvAOKDgxTu98PRbPjgY3mXHf4UgQvhnVUmfpX9ehhsSvodw1VOAGWr
 yfFbWPDogms/AE0wZSWJMwzY9b6LbDkLEb8vpEbvHNCTXcroQ00CJfkA5TX1nBD3U+uFqtnYQ0
 /AE=
X-SBRS: 2.7
X-MesageID: 20656360
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,502,1583211600"; d="scan'208";a="20656360"
Subject: Re: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
To: <paul@xen.org>, 'Xen-devel' <xen-devel@lists.xenproject.org>
References: <20200610114004.30023-1-andrew.cooper3@citrix.com>
 <010401d6408a$2c57bba0$850732e0$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <765b4fed-60d3-9c4a-d6b7-bcd9893c525b@citrix.com>
Date: Fri, 12 Jun 2020 10:53:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <010401d6408a$2c57bba0$850732e0$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: 'Juergen Gross' <jgross@suse.com>, 'Ian Jackson' <Ian.Jackson@citrix.com>,
 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 08:22, Paul Durrant wrote:
>> -----Original Message-----
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 10 June 2020 12:40
>> To: Xen-devel <xen-devel@lists.xenproject.org>
>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Ian Jackson <Ian.Jackson@citrix.com>; Wei Liu
>> <wl@xen.org>; Juergen Gross <jgross@suse.com>; Paul Durrant <paul@xen.org>
>> Subject: [PATCH for-4.14] tools: fix error path of xendevicemodel_open()
>>
>> c/s 6902cb00e03 "tools/libxendevicemodel: extract functions and add a compat
>> layer" introduced calls to both xencall_open() and osdep_xendevicemodel_open()
>> but failed to fix up the error path.
>>
>> c/s f68c7c618a3 "libs/devicemodel: free xencall handle in error path in
>> _open()" fixed up the xencall_open() aspect of the error path (missing the
>> osdep_xendevicemodel_open() aspect), but positioned the xencall_close()
>> incorrectly, creating the same pattern proved to be problematic by c/s
>> 30a72f02870 "tools: fix error path of xenhypfs_open()".
>>
>> Reposition xtl_logger_destroy(), and introduce the missing
>> osdep_xendevicemodel_close().
>>
>> Fixes: 6902cb00e03 ("tools/libxendevicemodel: extract functions and add a compat layer")
>> Fixes: f68c7c618a3 ("libs/devicemodel: free xencall handle in error path in _open()")
>> Backport: 4.9+
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Ian Jackson <Ian.Jackson@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Paul Durrant <paul@xen.org>
>>
>> RFC - this is still broken.
>>
> I'm slightly confused. Do you want this in 4.14 in this form or are you expecting to update it?

In this form, it is an improvement over before.

There is still the crash described below which needs some form of
figuring out and fixing.

~Andrew

>
>   Paul
>
>> Failure to create the logger will still hit the NULL deference, in all of the
>> stable libs, not just devicemodel.
>>
>> Also, unless I'd triple checked the history, I was about to reintroduce the
>> deadlock from c/s 9976f3874d4, because it totally counterintuitive wrong to
>> expect setup and teardown in opposite orders.
>> ---
>>  tools/libs/devicemodel/core.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
>> index db501d9e80..4d4063956d 100644
>> --- a/tools/libs/devicemodel/core.c
>> +++ b/tools/libs/devicemodel/core.c
>> @@ -67,9 +67,10 @@ xendevicemodel_handle *xendevicemodel_open(xentoollog_logger *logger,
>>      return dmod;
>>
>>  err:
>> -    xtl_logger_destroy(dmod->logger_tofree);
>> +    osdep_xendevicemodel_close(dmod);
>>      xentoolcore__deregister_active_handle(&dmod->tc_ah);
>>      xencall_close(dmod->xcall);
>> +    xtl_logger_destroy(dmod->logger_tofree);
>>      free(dmod);
>>      return NULL;
>>  }
>> --
>> 2.11.0
>


