Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F89D9BF0BC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 15:52:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831164.1246338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hOh-0001Oo-Dd; Wed, 06 Nov 2024 14:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831164.1246338; Wed, 06 Nov 2024 14:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8hOh-0001Ma-A0; Wed, 06 Nov 2024 14:52:39 +0000
Received: by outflank-mailman (input) for mailman id 831164;
 Wed, 06 Nov 2024 14:52:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RQdK=SB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t8hOf-0001MU-Ci
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 14:52:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1328d86-9c4e-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 15:52:34 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1730904747861384.24842207424683;
 Wed, 6 Nov 2024 06:52:27 -0800 (PST)
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
X-Inumbo-ID: c1328d86-9c4e-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzNi4xNDMuMTg4LjUxIiwiaGVsbyI6InNlbmRlcjQtb2YtbzUxLnpvaG8uY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMxMzI4ZDg2LTljNGUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTA0NzU1LjEyMTEyOCwic2VuZGVyIjoiZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; t=1730904750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BxioXDAQQUi8w91cOKiyxiB4EHoc2A6tskBkTG7Pb6wTS3oNWsd4kfhZhIV0h4vtsWNTUk8SREEtkAfnyId68tIUq5Ofj/moG6czJZ6cp/TRhgXIczXcYKDXHlSQo+sCS/G8b0vTnRMGR0w/8RqM3GI4YlXYX1wKSjL/Fb6xVbE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730904750; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j0GDESmwi4wUWs8/LMK6scNZ8RanVoOqDz3vO8QCLbs=; 
	b=mOanUUxluL3LE9a0yXO+FZniIKEXrBvRIVc+Mf3d0qFR4urzc+om2rBfKCQxFSH6E3qKIJfxrNG3GMJekwaotE33tKDdr6COMnGTdujkY+g2ahXqmOK/wG1NMUmGga/RCzt7oucut/HkZBhVOAfEZi8gfexZ968yg//LLgl+sgI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730904750;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j0GDESmwi4wUWs8/LMK6scNZ8RanVoOqDz3vO8QCLbs=;
	b=MQZP+OS4Fa9MDkv9Ate6ENIKz0Ls2lGOMl0LForhrCvOL/1chFLbohbBLQyGnCoY
	K1MGaGoL3M4GHcLEsofdd0yU+4jhm9b9L+G5HyUbq7SVNRvzBKenGfKToS0Kr8osZ1n
	knh9HNEE1auNjJUXiY+TJLwthakrgc/XE5iAO+Zc=
Message-ID: <f1ac596c-80e1-4d14-950e-2e014ef3a474@apertussolutions.com>
Date: Wed, 6 Nov 2024 09:52:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] x86/boot: introduce boot module flags
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241102172551.17233-1-dpsmith@apertussolutions.com>
 <20241102172551.17233-4-dpsmith@apertussolutions.com>
 <4172f59f-9191-473f-affb-82b8d707bcbc@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <4172f59f-9191-473f-affb-82b8d707bcbc@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 11/6/24 09:38, Andrew Cooper wrote:
> On 02/11/2024 5:25 pm, Daniel P. Smith wrote:
>> The existing startup code employs various ad-hoc state tracking about certain
>> boot module types by each area of the code. A boot module flags bitfield is
>> added to enable tracking these different states. The first state to be
>> transition by this commit is module relocation.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> This looks safe to rebase ahead of patch 2, making it able to be taken
> without delay.  (With only a trivial adjustment vs bootmod_type in patch
> 1, it could probably go into staging without waiting for the rest of the
> ucode-uaf fixes.)

Thank you and I have no objections as it would reduce the size of v9.

v/r,
dps

