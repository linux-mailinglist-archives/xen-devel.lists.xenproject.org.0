Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9551DBD04
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 20:39:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbTc4-0006ra-FW; Wed, 20 May 2020 18:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gBXs=7C=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jbTc3-0006rV-2s
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 18:38:43 +0000
X-Inumbo-ID: 1fd68733-9ac9-11ea-aa71-12813bfff9fa
Received: from ppsw-41.csi.cam.ac.uk (unknown [131.111.8.141])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fd68733-9ac9-11ea-aa71-12813bfff9fa;
 Wed, 20 May 2020 18:38:42 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40160
 helo=[192.168.1.219])
 by ppsw-41.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.159]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jbTby-000lux-SB (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Wed, 20 May 2020 19:38:38 +0100
Subject: Re: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
 <20200515135802.63853-3-roger.pau@citrix.com>
 <e9e337ae-295e-5577-3c6d-a42721190b07@suse.com>
 <20200518154527.GW54375@Air-de-Roger>
 <6ce247e4-ef85-6793-68a6-0d1cde7f886d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b3fc4a9d-faf8-1904-3104-9c9f9da4773d@citrix.com>
Date: Wed, 20 May 2020 19:38:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ce247e4-ef85-6793-68a6-0d1cde7f886d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18/05/2020 16:47, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 18.05.2020 17:45, Roger Pau Monné wrote:
>> On Mon, May 18, 2020 at 05:05:12PM +0200, Jan Beulich wrote:
>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>>
>>> On 15.05.2020 15:58, Roger Pau Monne wrote:
>>>> --- a/docs/misc/xen-command-line.pandoc
>>>> +++ b/docs/misc/xen-command-line.pandoc
>>>> @@ -652,6 +652,15 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
>>>>  additionally a trace buffer of the specified size is allocated per cpu.
>>>>  The debug trace feature is only enabled in debugging builds of Xen.
>>>>  
>>>> +### disable-c6-errata
>>> Hmm, yes please - a disable for errata! ;-)
>>>
>>> How about "avoid-c6-errata", and then perhaps as a sub-option to
>>> "cpuidle="? (If we really want a control for this in the first
>>> place.)
>> Right, I see I'm very bad at naming. Not sure it's even worth it
>> maybe?
>>
>> I can remove it completely from the patch if that is OK.
> I'd be fine without. Andrew?

Yeah - the only thing people can do with this is shoot themselves in the
foot.

There's frankly no need to give them the option in the first place.

~Andrew

