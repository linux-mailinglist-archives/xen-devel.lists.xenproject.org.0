Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6E2F154D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64846.114646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxOw-0000UJ-09; Mon, 11 Jan 2021 13:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64846.114646; Mon, 11 Jan 2021 13:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxOv-0000Tu-T6; Mon, 11 Jan 2021 13:38:29 +0000
Received: by outflank-mailman (input) for mailman id 64846;
 Mon, 11 Jan 2021 13:38:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyxOu-0000Tp-JX
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:38:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a8e87b12-09a0-42a0-9f24-36bfa65bc047;
 Mon, 11 Jan 2021 13:38:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25DE1AB3E;
 Mon, 11 Jan 2021 13:38:26 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a8e87b12-09a0-42a0-9f24-36bfa65bc047
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610372306; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcZE8Cussi9XbpqqCVOs0ptBkgKgaIqkoA9+WcuTuYE=;
	b=mQUIaJ5TyBttjDsaqax/FDyYviF6vVn2t7Q3d3xdMONvXwxAWsY/FciDlXR5W8Riw0iDct
	Q/gHKf4KrJURkE5mSa4CI5uhKrwbvxnF9b1NhUW2zBLgwRGD9+EL8kB799XFfaiSR/zEnF
	65bN/ZrRgL07MLR7cNdX4seEi6VMrTU=
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: Igor Druzhinin <igor.druzhinin@citrix.com>, paul@xen.org
Cc: wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
 <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
 <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
 <560f9255-3b38-62f6-2b0b-db87dffd36e3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb26b3e9-3a76-98a6-5a03-4abed060134e@suse.com>
Date: Mon, 11 Jan 2021 14:38:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <560f9255-3b38-62f6-2b0b-db87dffd36e3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 14:34, Igor Druzhinin wrote:
> On 11/01/2021 09:16, Jan Beulich wrote:
>> On 11.01.2021 10:12, Paul Durrant wrote:
>>>> From: Paul Durrant <xadimgnik@gmail.com>
>>>> Sent: 11 January 2021 09:10
>>>>
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 11 January 2021 09:00
>>>>>
>>>>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>>>> You can add my R-b to the patch.
>>>>>
>>>>> That's the unchanged patch then, including the libxl change that
>>>>> I had asked about and that I have to admit I don't fully follow
>>>>> Igor's responses? I'm hesitant to give an ack for that aspect of
>>>>> the change, yet I suppose the libxl maintainers will defer to
>>>>> x86 ones there. Alternatively Andrew or Roger could of course
>>>>> ack this ...
>>>>>
>>>>
>>>> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
>>>> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
>>>> that's enough.
>>>
>>> ... although adding an option in xl/libxl isn't that much work, I suppose.
>>>
>>> Igor, would you be ok plumbing it through?
>>
>> This back and forth leaves unclear to me what I should do. I
>> would have asked on irc, but you're not there as it seems.
> 
> I don't see a scenario where somebody would want to opt out of unlimited
> VPs per domain given the leaf with -1 is supported on all Windows versions.

So Paul - commit patch as is then?

> I can make it configurable in the future if reports re-surface it causes
> troubles somewhere.

This is the slight concern I have: Having to make it configurable
once someone has reported trouble would look a little late to me.
Otoh I agree it may end up being dead code if no problems get
ever encountered.

Jan

