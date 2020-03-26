Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8680193F1F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 13:45:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHRq5-0000BG-Jb; Thu, 26 Mar 2020 12:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BM0P=5L=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jHRq4-0000BB-4C
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 12:42:24 +0000
X-Inumbo-ID: 3d4440a6-6f5f-11ea-87ce-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d4440a6-6f5f-11ea-87ce-12813bfff9fa;
 Thu, 26 Mar 2020 12:42:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5C2F7B138;
 Thu, 26 Mar 2020 12:42:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200326094557.13822-1-jgross@suse.com>
 <5a260627-c362-9fda-df42-8478df0e99e6@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bb8b0bde-837c-ff70-2fa8-c47b0970f018@suse.com>
Date: Thu, 26 Mar 2020 13:42:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5a260627-c362-9fda-df42-8478df0e99e6@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH] tools/libxl: make default of max event
 channels dependant on vcpus
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.20 13:36, Andrew Cooper wrote:
> On 26/03/2020 09:45, Juergen Gross wrote:
>> Today the maximum number of event channels for a guest is defaulting
>> to 1023. For large guests with lots of vcpus this is not enough, as
>> e.g. the Linux kernel uses 7 event channels per vcpu, limiting the
>> guest to about 140 vcpus.
>>
>> Instead of requiring to specify the allowed number of event channels
>> via the "event_channels" domain config option, make the default
>> depend on the maximum number of vcpus of the guest.
>>
>> In order not to regress current configs use 1023 as the minimum
>> default setting.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> :(
> 
> I suspect I regressed this by making it not actually dead code.
> 
> 1023 is the 32bit EVT 2L ABI limit, but until I moved max_evtchn into
> the createdomain hypercall, I'm pretty sure a limit never used to get set.

In 4.11 I'm seeing it being set via xc_domain_set_max_evtchn().


Juergen


