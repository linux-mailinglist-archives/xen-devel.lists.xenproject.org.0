Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A7A1F77C5
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 14:16:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjibJ-0003j5-ML; Fri, 12 Jun 2020 12:16:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4JN/=7Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jjibJ-0003if-2T
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 12:16:01 +0000
X-Inumbo-ID: 78881cda-aca6-11ea-bca7-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78881cda-aca6-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 12:15:58 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NKcKlwxWljgx+R7dtt4YKZaLPoc8WwgO0grQBfms08EHwOvRVo/Re1r/aeWKE1Lp6SMmGWjTsk
 rz3i0PvaauRETPH7fV/gT2gmP90EqzVIJtJ6MJP+rQbw1SwTuNdOXW0wgHdEPD2fpgJLG7tcxX
 asq7VXhpNxaN4OT/6wZa/bcTob/zvf+amuLYBWKNrpfHVS0ffQk2Dap7dWznIwQyyztKzwQFY+
 8jL8sQYvLK9yam0gNtfNpx9Y7ul/aJX/rIt0/0TiP5EIqr6RcBEszuwnFYry8Kc53ht9sSdPkK
 yqU=
X-SBRS: 2.7
X-MesageID: 19898299
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="19898299"
Subject: Re: golang bindings dirty in tree after libxl build
To: George Dunlap <George.Dunlap@citrix.com>
References: <ab679f8c-a09f-cbc6-c0fc-6285550ba3af@citrix.com>
 <A8F5EC16-53D8-40F4-863F-0862298193EA@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1b412370-3a8f-59af-f7cf-042ae45ea802@citrix.com>
Date: Fri, 12 Jun 2020 13:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <A8F5EC16-53D8-40F4-863F-0862298193EA@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "rosbrookn@gmail.com" <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12/06/2020 12:59, George Dunlap wrote:
>
>> On Jun 12, 2020, at 12:00 PM, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>>
>> Hello,
>>
>> I've just done a libxl build and got things such as:
>>
>> --- a/tools/golang/xenlight/helpers.gen.go
>> +++ b/tools/golang/xenlight/helpers.gen.go
>> @@ -431,14 +431,14 @@ x.Evtch = int(xc.evtch)
>>  x.Rref = int(xc.rref)
>>  x.Connection = ChannelConnection(xc.connection)
>>  switch x.Connection{
>> -case ChannelConnectionUnknown:
>> -x.ConnectionUnion = nil
>>  case ChannelConnectionPty:
>>  var connectionPty ChannelinfoConnectionUnionPty
>>  if err := connectionPty.fromC(xc);err != nil {
>>   return fmt.Errorf("converting field connectionPty: %v", err)
>>  }
>>  x.ConnectionUnion = connectionPty
>> +case ChannelConnectionUnknown:
>> +x.ConnectionUnion = nil
>>  case ChannelConnectionSocket:
>>  x.ConnectionUnion = nil
>>  default:
>>
>> dirty in tree.  They are all case labels, and only their order in the
>> switch has changed.
>>
>> Does the current binding generation rely on the order of entries in a
>> python dictionary by any chance?
> Not explicitly, but obviously somewhat implicitly.
>
> Is this a python2/3 issue, or would different versions of python within 2/3 end up with different sort orders?
>
> If python3 will always put them in the same order, then we might consider just switching the script to being explicitly python3.  Otherwise, we’ll probably have to add sorts.

Python 3.6 now guarantees that the insert order of elements will be
preserved.  Before that, there are no guarantees at all.

It sounds like some sprinkling of sorted() will be needed.

~Andrew

