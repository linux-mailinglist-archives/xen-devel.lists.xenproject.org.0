Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758D19074B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 09:13:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGedf-0007Qu-Lh; Tue, 24 Mar 2020 08:10:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lmgi=5J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jGede-0007Qk-OE
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 08:10:18 +0000
X-Inumbo-ID: e4d8506a-6da6-11ea-8397-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e4d8506a-6da6-11ea-8397-12813bfff9fa;
 Tue, 24 Mar 2020 08:10:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5BE69AC8F;
 Tue, 24 Mar 2020 08:10:15 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
 <20200323144837.GB24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d0286dd-1702-e7dd-a0a1-795cbd54ccb3@suse.com>
Date: Tue, 24 Mar 2020 09:10:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.03.2020 06:41, Tian, Kevin wrote:
>> From: Roger Pau Monné <roger.pau@citrix.com>
>> Sent: Monday, March 23, 2020 10:49 PM
>>
>> On Mon, Mar 23, 2020 at 09:09:59AM +0100, Jan Beulich wrote:
>>> On 20.03.2020 20:07, Roger Pau Monne wrote:
>>>> This reverts commit f96e1469ad06b61796c60193daaeb9f8a96d7458.
>>>>
>>>> The commit is wrong, as the whole point of nvmx_update_apicv is to
>>>> update the guest interrupt status field when the Ack on exit VMEXIT
>>>> control feature is enabled.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Before anyone gets to look at the other two patches, should this
>>> be thrown in right away?
>>
>> I would like if possible get a confirmation from Kevin (or anyone
>> else) that my understanding is correct. I find the nested code very
>> confusing, and I've already made a mistake while trying to fix it.
>> That being said, this was spotted by osstest as introducing a
>> regression, so I guess it's safe to just toss it in now.
>>
>> FWIW patch 2/3 attempts to provide a description of my understanding
>> of how nvmx_update_apicv works.
>>
> 
> I feel it is not good to take this patch alone, as it was introduced to fix
> another problem. W/o understanding whether the whole series can
> fix both old and new problems, we may risk putting nested interrupt
> logic in an even worse state...

Well, okay, I'll wait then, but it would seem to me that reverting
wouldn't put us in a worse state than we were in before that change
was put in.

Jan

