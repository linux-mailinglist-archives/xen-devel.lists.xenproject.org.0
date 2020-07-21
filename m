Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E17227B9A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 11:22:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxoS7-0006pS-94; Tue, 21 Jul 2020 09:20:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5W=BA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxoS5-0006pN-7m
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 09:20:45 +0000
X-Inumbo-ID: 737cf175-cb33-11ea-84fc-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 737cf175-cb33-11ea-84fc-bc764e2007e4;
 Tue, 21 Jul 2020 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595323244;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=7q50Xwsj+ljEirvyYc69VOA10kw2w40I9IPu2T3IlSY=;
 b=P0as67hJfJhJLIzYOQfk3c3TwEoQNq909P5BmodNy+8/NZ1RPG0+WjxC
 mE92nlh2m9VTRy3G20zVopfJLnuEOYaos5cnfzqkd/CZzL4/G0YVIGZWm
 udH0fcgzbkr+XMN5BSMM0EBTh2iHRa5+m2Ti6H75+jmyMQSj+p3Zge1ZV s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EIFYKv/CbPa0FveuWYks6Mxcspe/ZgyvW95ZOrgEXJzpNl9EXMwgk6BEc9SFlPrAkfsCeYnYMW
 k7maOgHqpVtdHtqp2IOBOIa43JK8mb0vd9COyxJuBIcdB/dowGiPZ5ncHx4uXnDoYbwRM6I+bH
 JAOOfr/yhb/bjFDVcnV1vlU8qADA4BOFryHf+tvzFMVsfrYmT2O5QPfE+Lo/e6LFRtDf3hIGKF
 ETRqeiFxLDNENGWdJG/61ge2akYxxXF8TTSrffsdVqqFHKyTC7+pp6lNc9OUyKXLSQUHwXqUvR
 +Ac=
X-SBRS: 2.7
X-MesageID: 23151962
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23151962"
Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
To: <paul@xen.org>, 'Nick Rosbrook' <rosbrookn@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
 <003901d65f2e$6faab0c0$4f001240$@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <66dc2e79-e899-1d94-c0f2-d834b55cd859@citrix.com>
Date: Tue, 21 Jul 2020 10:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <003901d65f2e$6faab0c0$4f001240$@xen.org>
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
Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/07/2020 08:13, Paul Durrant wrote:
>> -----Original Message-----
>> From: Nick Rosbrook <rosbrookn@gmail.com>
>> Sent: 21 July 2020 00:55
>> To: xen-devel@lists.xenproject.org
>> Cc: paul@xen.org; Nick Rosbrook <rosbrookn@ainfosec.com>; George Dunlap <george.dunlap@citrix.com>;
>> Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
>> Subject: [PATCH for-4.14] golang/xenlight: fix code generation for python 2.6
>>
>> Before python 2.7, str.format() calls required that the format fields
>> were explicitly enumerated, e.g.:
>>
>>   '{0} {1}'.format(foo, bar)
>>
>>   vs.
>>
>>   '{} {}'.format(foo, bar)
>>
>> Currently, gengotypes.py uses the latter pattern everywhere, which means
>> the Go bindings do not build on python 2.6. Use the 2.6 syntax for
>> format() in order to support python 2.6 for now.
>>
>> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> I'm afraid this is too late for 4.14 now. We are in hard freeze, so only minor docs changes or critical bug fixes are being taken at
> this point.

This is Reported-by me, and breaking gitlab CI on the master and 4.14
branches (because apparently noone else cares to look at the results...)

The alternative is to pull support for CentOS 6 from the 4.14 release,
which would best be done by a commit taking out the C6 containers from CI.

~Andrew

