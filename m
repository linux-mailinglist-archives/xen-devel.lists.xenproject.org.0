Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DC3931BC3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 22:25:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759259.1168901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTSFa-0000sf-Bz; Mon, 15 Jul 2024 20:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759259.1168901; Mon, 15 Jul 2024 20:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTSFa-0000qQ-8A; Mon, 15 Jul 2024 20:24:46 +0000
Received: by outflank-mailman (input) for mailman id 759259;
 Mon, 15 Jul 2024 20:24:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8vP=OP=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1sTSFY-0000qK-DZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 20:24:44 +0000
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44b6acb0-42e8-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 22:24:42 +0200 (CEST)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id TSFTskNDCj4pfTSFTsXq55; Mon, 15 Jul 2024 22:24:42 +0200
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
X-Inumbo-ID: 44b6acb0-42e8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1721075082;
	bh=he6gmmUMbwqSQvrMV8Ht1aTxpX0j3zxi5MrnSEMUtK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Uw2tFpXR0tt0oeSW7GCyQ4KbPzTV1U03xlQVSUohBFjERXVY/VyzYpNkxkOflO47/
	 S9OW4zOii+LNuEWk+KIFMOTK7oMVoRZQc/MIOQ36wNBLq8b/PpCi/d5zGHQONMpLhU
	 DNHkW9VEU/k4yiF6CmGRfxDJmwtONicerc3g6o06U8EE4qBmnPBLN5uf8amKg4ejXi
	 w1Z4reb1ppUjvcDdaLrHomrr/aCkBhevHMGpw2biRNQdUnclfa/yBbSz1KzlARjB8k
	 w9IE7w+CKpcgx/sKHa3A5j4YORzeD9qUnqxSn2a5zOiW8pBgvG5mmb6loPtA22oKjG
	 wJnekI47YlphA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 15 Jul 2024 22:24:42 +0200
X-ME-IP: 90.11.132.44
Message-ID: <b3fa592d-91d7-45f0-9ca2-824feb610df8@wanadoo.fr>
Date: Mon, 15 Jul 2024 22:24:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netback: Use seq_putc() in xenvif_dump_hash_info()
To: Jakub Kicinski <kuba@kernel.org>
Cc: xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Durrant <paul@xen.org>, Wei Liu <wei.liu@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>
References: <add2bb00-4ac1-485d-839a-55670e2c7915@web.de>
 <20240715090143.6b6303a2@kernel.org>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240715090143.6b6303a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 15/07/2024 à 18:01, Jakub Kicinski a écrit :
> On Sat, 13 Jul 2024 15:18:42 +0200 Markus Elfring wrote:
>> Single characters (line breaks) should be put into a sequence.
>> Thus use the corresponding function “seq_putc”.
>>
>> This issue was transformed by using the Coccinelle software.
> 
> I prefer to only merge trivial changes like this if maintainer
> indicates their support by acking them. Since the merge window
> has opened we can't wait and see so I'm marking this patch and
> your pktgen patch as deferred.
> 
> 

Hi Jakub,

Most of the time, this kind of modification is useless because it is 
already done by the compiler, see [1].

CJ

[1]: 
https://elixir.bootlin.com/linux/v6.10-rc7/source/include/linux/seq_file.h#L123

