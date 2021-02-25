Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3F324B43
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 08:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89626.168953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFB9d-0005zG-94; Thu, 25 Feb 2021 07:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89626.168953; Thu, 25 Feb 2021 07:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFB9d-0005yu-5m; Thu, 25 Feb 2021 07:33:45 +0000
Received: by outflank-mailman (input) for mailman id 89626;
 Thu, 25 Feb 2021 07:33:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFB9b-0005yp-LE
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 07:33:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45572949-0d11-4900-9fab-1f20a214a0e6;
 Thu, 25 Feb 2021 07:33:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22A84AD6B;
 Thu, 25 Feb 2021 07:33:41 +0000 (UTC)
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
X-Inumbo-ID: 45572949-0d11-4900-9fab-1f20a214a0e6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614238421; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a3BRihie3lifIDroDr4++Mfc0UHcnu/N2fnqw+5haSM=;
	b=GpU8DlBsevf+eVkPZ94CbGcv1uB6uRZI+tW6SJTwFPOhzG3UUXUI5dxuPLatvLOelAIVDc
	XHr8Htmb6stblsr5FBv+Ne2JFlTnn3tyndhJVoHYEP9avlnkyhJmZYer9l6FnNH2mS1SX4
	JcM6RrDa50deZWu7GY4nKXEnQVDSiqU=
Subject: Re: [PATCH] xen-netback: correct success/error reporting for the
 SKB-with-fraglist case
To: paul@xen.org
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Wei Liu <wl@xen.org>
References: <4dd5b8ec-a255-7ab1-6dbf-52705acd6d62@suse.com>
 <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76c94541-21a8-7ae5-c4c4-48552f16c3fd@suse.com>
Date: Thu, 25 Feb 2021 08:33:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <67bc0728-761b-c3dd-bdd5-1a850ff79fbb@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.02.2021 17:39, Paul Durrant wrote:
> On 23/02/2021 16:29, Jan Beulich wrote:
>> When re-entering the main loop of xenvif_tx_check_gop() a 2nd time, the
>> special considerations for the head of the SKB no longer apply. Don't
>> mistakenly report ERROR to the frontend for the first entry in the list,
>> even if - from all I can tell - this shouldn't matter much as the overall
>> transmit will need to be considered failed anyway.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/drivers/net/xen-netback/netback.c
>> +++ b/drivers/net/xen-netback/netback.c
>> @@ -499,7 +499,7 @@ check_frags:
>>   				 * the header's copy failed, and they are
>>   				 * sharing a slot, send an error
>>   				 */
>> -				if (i == 0 && sharedslot)
>> +				if (i == 0 && !first_shinfo && sharedslot)
>>   					xenvif_idx_release(queue, pending_idx,
>>   							   XEN_NETIF_RSP_ERROR);
>>   				else
>>
> 
> I think this will DTRT, but to my mind it would make more sense to clear 
> 'sharedslot' before the 'goto check_frags' at the bottom of the function.

That was my initial idea as well, but
- I think it is for a reason that the variable is "const".
- There is another use of it which would then instead need further
  amending (and which I believe is at least part of the reason for
  the variable to be "const").

Jan

