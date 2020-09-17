Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EF26DF95
	for <lists+xen-devel@lfdr.de>; Thu, 17 Sep 2020 17:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIvne-0001nz-Vr; Thu, 17 Sep 2020 15:26:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w9D7=C2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kIvne-0001nu-Ai
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 15:26:18 +0000
X-Inumbo-ID: dd429aae-d5c0-4897-9c22-2e2cddf85e46
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd429aae-d5c0-4897-9c22-2e2cddf85e46;
 Thu, 17 Sep 2020 15:26:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=cantorsusede; t=1600356376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NVaNXe59J+NL21e1GFQxT5LgaIU4Fc1dBThNybVTuAI=;
 b=akKqHXZxySUvJvG5/JZtZThl5wseTXXkLzYr8XqSWz3lJjMefkcQZwSFuB2RnV4yhhhmTd
 t1CCPhN9Ywdva1yZAszgLzGKSmvd45UxAvXCrp3cIxDvxuX/+o//1/l/WdW7RdEGorfmnP
 H0uytAhpS2ova58NqqBIhXVyMcmog6pHO6R4MMITV6fvFo9C7TgwrydeeJjyyRMXAmGWZN
 O3TfPPYMEAOM5+SEVO2dlCaaOE5kJUCx6BxG3HYCiXJHGgwHy2poQEEsD0s7vcLrM+qdbX
 w2fqjZvhiI48ZwnUgMG3B6kKAUvvFjGhI1fqUK74VX+pqFIDfpkOqPYFpklUug==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5171EAD71;
 Thu, 17 Sep 2020 15:26:50 +0000 (UTC)
Subject: Re: [PATCH v4 4/4] efi: Do not use command line if secure boot is
 enabled.
To: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-5-hudson@trmm.net>
 <3def666c-c5f1-a520-18dc-6c1c61026b57@suse.com>
 <Rtytoe06osw9o7-z0sRD22p_KP8B2SVSp6Ae6IYHyhS_LpwthJkTMwDc1tICmBReafaZOLSu0nNVPV3ceUTqUnjP7dc4DrsMHhjPwfze3X0=@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae3cd252-71fd-ba49-b53d-f0a4882d201e@suse.com>
Date: Thu, 17 Sep 2020 17:26:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <Rtytoe06osw9o7-z0sRD22p_KP8B2SVSp6Ae6IYHyhS_LpwthJkTMwDc1tICmBReafaZOLSu0nNVPV3ceUTqUnjP7dc4DrsMHhjPwfze3X0=@trmm.net>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.09.2020 16:05, Trammell Hudson wrote:
> On Thursday, September 17, 2020 8:51 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 14.09.2020 13:50, Trammell Hudson wrote:
>>> If secure boot is enabled, the Xen command line arguments are ignored.
>>> If a unified Xen image is used, then the bundled configuration, dom0
>>> kernel, and initrd are prefered over the ones listed in the config file.
>>> Unlike the shim based verification, the PE signature on a unified image
>>> covers the all of the Xen+config+kernel+initrd modules linked into the
>>> unified image. This also ensures that properly configured platforms
>>> will measure the entire runtime into the TPM for unsealing secrets or
>>> remote attestation.
>>
>> The command line may also include a part handed on to the Dom0 kernel.
>> If the Dom0 kernel image comes from disk, I don't see why that part of
>> the command line shouldn't be honored. Similarly, if the config file
>> doesn't come from the unified image, I think Xen's command line options
>> should also be honored.
> 
> Ignoring the command line and breaking the shim behaviour in a
> unified image should be ok; that is an explicit decision by the
> system owner to sign and configure the new image (and the shim
> is not used in a unified image anyway).
> 
> If we have a way to detect a unified image early enough, then
> we can avoid the backwards incompatibility if it is not unified.

I was assuming this was easily possible, if necessary as about the
first thing we do. If it's not as easy, perhaps something wants
adding to make it so?

> That would require moving the config parsing to above the relocation
> call.

I guess I don't understand why this would be.

Jan

