Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037A7A525A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 20:50:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604194.941415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJJJ-0004DP-IA; Mon, 18 Sep 2023 18:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604194.941415; Mon, 18 Sep 2023 18:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiJJJ-0004Bg-FH; Mon, 18 Sep 2023 18:49:29 +0000
Received: by outflank-mailman (input) for mailman id 604194;
 Mon, 18 Sep 2023 18:49:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qiJJI-0004Ba-10
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 18:49:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiJJH-0001JQ-S3; Mon, 18 Sep 2023 18:49:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.8.227]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qiJJH-0005n1-Ls; Mon, 18 Sep 2023 18:49:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Cc:
	References:To:Subject:MIME-Version:Date:Message-ID;
	bh=p9vVfqJHFuAioEy89TQKyQ3bQ+M/DIoo9EiQsLNSmbk=; b=GU15G+IHDF5t6cne96a5/CHX/3
	ocG5emjaQSPNkNBx6HWVrEAOYlh/fcnStr2W3IAC7z56AQbqoeK6d9X8DR2JsWB3LnXjRiDN4wYzH
	IpfdAip3RZAGRaZxGLTVirk/MARtnoBlu3WZiCOdYyd96RtdAwtYI46f4zKOD6tKvSxo=;
Message-ID: <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
Date: Mon, 18 Sep 2023 19:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Content-Language: en-GB
To: Chuck Zmudzinski <brchuckz@netscape.net>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

(+Roger and moving to xen-devel)

Hi,

On 18/09/2023 19:17, Chuck Zmudzinski wrote:
> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>> Hello,
>>
>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>
>> [user@Malmalinux ~]$ sudo xl dmesg
>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>> ...
>>
>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>
>> Can increasing the buffer fix this? How would one do that?
>>
>> Thanks
>>
> 
> I see the setting is the command line option conring_size:
> 
> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
> 
> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.

Thanks for the report. This remind me the series [1] from Roger which 
tries to increase the default size to 32K. @Roger, I am wondering if we 
should revive it?

Cheers,

[1] 
https://lore.kernel.org/xen-devel/20220630082330.82706-1-roger.pau@citrix.com/

-- 
Julien Grall

