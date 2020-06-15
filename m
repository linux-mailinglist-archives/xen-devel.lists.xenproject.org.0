Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F91F99A9
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 16:10:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkpo9-0006x7-5U; Mon, 15 Jun 2020 14:09:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OSTQ=74=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jkpo8-0006wu-1e
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 14:09:52 +0000
X-Inumbo-ID: e08fa592-af11-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e08fa592-af11-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 14:09:50 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 40QYEQMnH06bZqtcGpCUHOoUd7xprwS42/gkbBBMAILWJBQxcsZ4ryY196SZADlxSZoe8k7/e5
 DeM50SZaOYWrS6jSIiyXZFX3IKnd3DO7O+8SxCMFvZwirNgq0THj+KcV8KvKQe7GEYQUJcETR3
 xMIwLATFniWs57iOD4krN8ZGRdubDu0zHJEOt0IQFxD/0k8rRh0uh2XyukvJnNlciHF7H0j1eR
 hP6YSzZarEWINiTbA1l7n9uYrwU3BUf55oHtHZvNWykHBsNzb7jVmrvqQBHxKW4DhxIjfiQRxf
 +yg=
X-SBRS: 2.7
X-MesageID: 20409564
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20409564"
Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
To: Ian Jackson <ian.jackson@citrix.com>, "paul@xen.org" <paul@xen.org>
References: <20200520083501.31704-1-jgross@suse.com>
 <24261.17303.413916.29534@mariner.uk.xensource.com>
 <20200520155621.GN54375@Air-de-Roger>
 <05eac1e1-63a3-1d03-9f91-d0ffdcc44f23@suse.com>
 <00f701d64009$c2c10000$48430000$@xen.org>
 <24295.32909.686801.47956@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c420759a-9fab-1542-ef6b-bff558a6dd05@citrix.com>
Date: Mon, 15 Jun 2020 15:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <24295.32909.686801.47956@mariner.uk.xensource.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: =?UTF-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 'Wei Liu' <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15/06/2020 15:07, Ian Jackson wrote:
> Paul Durrant writes ("RE: [PATCH] tools/libxengnttab: correct size of allocated memory"):
>>> -----Original Message-----
>>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jürgen Groß
>>> Sent: 11 June 2020 16:26
>>> To: Roger Pau Monné <roger.pau@citrix.com>; Ian Jackson <ian.jackson@citrix.com>
>>> Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>
>>> Subject: Re: [PATCH] tools/libxengnttab: correct size of allocated memory
>>>
>>> On 20.05.20 17:56, Roger Pau Monné wrote:
>>>> On Wed, May 20, 2020 at 03:49:59PM +0100, Ian Jackson wrote:
>>>>> Juergen Gross writes ("[PATCH] tools/libxengnttab: correct size of allocated memory"):
>>>>>> The size of the memory allocated for the IOCTL_GNTDEV_MAP_GRANT_REF
>>>>>> ioctl() parameters is calculated wrong, which results in too much
>>>>>> memory allocated.
>>>>> Added Roger to CC.
>>>>>
>>>>> Firstly,
>>>>>
>>>>> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>
>>>> For the FreeBSD bits:
>>>>
>>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Any reason the patch didn't go in yet?
>>>
>> I'd be quite happy for this to go in now, consider it
>>
>> Release-acked-by: Paul Durrant <paul@xen.org>
> Thanks.  I tried to apply this but it doesn't seem to apply to
> staging.  Jürgen, would you care to rebase/resend ?

I already committed it, seeing as it was fully acked.

https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=aad20e538d7ba0e36f5ed8d2bebb74096e3a6d7f

~Andrew

