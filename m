Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B96D2F0ED4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 10:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.64700.114328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytJ8-0001Lz-VL; Mon, 11 Jan 2021 09:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64700.114328; Mon, 11 Jan 2021 09:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kytJ8-0001La-Rt; Mon, 11 Jan 2021 09:16:14 +0000
Received: by outflank-mailman (input) for mailman id 64700;
 Mon, 11 Jan 2021 09:16:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kytJ7-0001LV-9a
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 09:16:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a84fc29-92b8-4a62-b657-1bb1d5f6b70a;
 Mon, 11 Jan 2021 09:16:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 960CBAD2B;
 Mon, 11 Jan 2021 09:16:11 +0000 (UTC)
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
X-Inumbo-ID: 1a84fc29-92b8-4a62-b657-1bb1d5f6b70a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610356571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lb+tkPNomeNBwotSLe2nth5GzmjN1HVzGE1ZmMS0HeE=;
	b=Llk103NrRCgq+GGwwZBa0C5yVTrtR1N3ewSj9ockRJHVMO4qaini9t8mpoisY+2YS81Wcm
	g9qqm7OuxYoebQco42Xcikz0DyqUFwKmI3lNkWL8wk6jGxUWdzMhXywIHgZWgmhuZEiPe9
	U2UYJzUm/JU4FQlHlyYuej/LNdiCR78=
Subject: Re: [PATCH 1/2] viridian: remove implicit limit of 64 VPs per
 partition
To: paul@xen.org
Cc: wl@xen.org, iwj@xenproject.org, anthony.perard@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 sstabellini@kernel.org, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org, 'Igor Druzhinin' <igor.druzhinin@citrix.com>
References: <1610066796-17266-1-git-send-email-igor.druzhinin@citrix.com>
 <009d01d6e598$bfdd0110$3f970330$@xen.org>
 <ce4814a8-4f18-c17c-c3e2-99a0ad18e4f1@citrix.com>
 <00ad01d6e7f6$1ebbe610$5c33b230$@xen.org>
 <33322763-6810-3bfc-9573-1e326b38293e@suse.com>
 <00b001d6e7f9$80937a30$81ba6e90$@xen.org>
 <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d5e7f52e-2ec4-a722-e6cf-4b0b9b1cd1d5@suse.com>
Date: Mon, 11 Jan 2021 10:16:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <00b101d6e7f9$e342ff20$a9c8fd60$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.01.2021 10:12, Paul Durrant wrote:
>> From: Paul Durrant <xadimgnik@gmail.com>
>> Sent: 11 January 2021 09:10
>>
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 11 January 2021 09:00
>>>
>>> On 11.01.2021 09:45, Paul Durrant wrote:
>>>> You can add my R-b to the patch.
>>>
>>> That's the unchanged patch then, including the libxl change that
>>> I had asked about and that I have to admit I don't fully follow
>>> Igor's responses? I'm hesitant to give an ack for that aspect of
>>> the change, yet I suppose the libxl maintainers will defer to
>>> x86 ones there. Alternatively Andrew or Roger could of course
>>> ack this ...
>>>
>>
>> I don't think we really need specific control in xl.cfg as this is a fix for some poorly documented
>> semantics in the spec. The flag simply prevents the leaf magically appearing on migrate and I think
>> that's enough.
> 
> ... although adding an option in xl/libxl isn't that much work, I suppose.
> 
> Igor, would you be ok plumbing it through?

This back and forth leaves unclear to me what I should do. I
would have asked on irc, but you're not there as it seems.

Jan

