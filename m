Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65342F14FB
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 14:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64840.114634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxL1-0000LT-Ed; Mon, 11 Jan 2021 13:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64840.114634; Mon, 11 Jan 2021 13:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyxL1-0000L4-BV; Mon, 11 Jan 2021 13:34:27 +0000
Received: by outflank-mailman (input) for mailman id 64840;
 Mon, 11 Jan 2021 13:34:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/gp=GO=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kyxKz-0000Ky-2x
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 13:34:25 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 77cff65e-2e26-4805-acf4-b8abe76c69d3;
 Mon, 11 Jan 2021 13:34:24 +0000 (UTC)
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
X-Inumbo-ID: 77cff65e-2e26-4805-acf4-b8abe76c69d3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610372064;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=7ctQ74+8c+zkOPLUXhM6X7hHHEW2FtxtPjabOKFoP8A=;
  b=LGeHZHJ1ncY3xloCofrFB9MTfvQbI8Izb81a+OEpPIdtDabqOb4ioOnt
   Zy+yiy9dJ8TnyqFvc5G32r14SsvCLeEg6sV8BKVVw2hYmRJwMkdzBulLD
   aFJTYxdhsqcJJ4GNmpS475D2wQ76Ka2pFE1JmRyMIrtzufAVjHRTGsf1C
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: WkBcDGQ6AyDDHK2PY9u2k2epXDCXGU2oJDeaufkHKLctXXeOTrEMHLMpMcwWm8WEn1NGVuoj5h
 +hTm6uqLe0bCuRjF4nHTcv84ASlkgOPolRFglw1C9Smmjtd7cArz7HkeMQnUxQA2c0VYsMOLTc
 3seia+exMI785noEVkvYJykszh0qozr89muXH7YJPpqR+xqqnelsNvpJ3FxvjFTsm5vk9Txd9E
 vHzHenaAKMJaPiLwSMKRmoH9OG5isWWsWQQ16R3ytOstzQNhQ5sFiqW6wdhC7Soqi/b9jRtoe5
 y4g=
X-SBRS: 5.2
X-MesageID: 35191095
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,338,1602561600"; 
   d="scan'208";a="35191095"
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: Jan Beulich <jbeulich@suse.com>, <paul@xen.org>
CC: <wl@xen.org>, <iwj@xenproject.org>, <anthony.perard@citrix.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <julien@xen.org>,
	<sstabellini@kernel.org>, <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
 <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
 <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <560f9255-3b38-62f6-2b0b-db87dffd36e3@citrix.com>
Date: Mon, 11 Jan 2021 13:34:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/01/2021 09:16, Jan Beulich wrote:
> On 11.01.2021 10:12, Paul Durrant wrote:
>>> From: Paul Durrant <xadimgnik@gmail.com>
>>> Sent: 11 January 2021 09:10
>>>
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 11 January 2021 09:00
>>>>
>>>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>>> You can add my R-b to the patch.
>>>>
>>>> That's the unchanged patch then, including the libxl change that
>>>> I had asked about and that I have to admit I don't fully follow
>>>> Igor's responses? I'm hesitant to give an ack for that aspect of
>>>> the change, yet I suppose the libxl maintainers will defer to
>>>> x86 ones there. Alternatively Andrew or Roger could of course
>>>> ack this ...
>>>>
>>>
>>> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
>>> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
>>> that's enough.
>>
>> ... although adding an option in xl/libxl isn't that much work, I suppose.
>>
>> Igor, would you be ok plumbing it through?
> 
> This back and forth leaves unclear to me what I should do. I
> would have asked on irc, but you're not there as it seems.

I don't see a scenario where somebody would want to opt out of unlimited
VPs per domain given the leaf with -1 is supported on all Windows versions.
I can make it configurable in the future if reports re-surface it causes
troubles somewhere.

I'd like to do the same with CPU hotplug bit (given it's not configurable
in QEMU either) but wanted to hear an opinion here?

Igor


