Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEFAA914A1
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956940.1350162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JF1-0000Oz-Ow; Thu, 17 Apr 2025 07:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956940.1350162; Thu, 17 Apr 2025 07:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JF1-0000Mc-M1; Thu, 17 Apr 2025 07:00:55 +0000
Received: by outflank-mailman (input) for mailman id 956940;
 Thu, 17 Apr 2025 07:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s05F=XD=nppct.ru=sdl@srs-se1.protection.inumbo.net>)
 id 1u5JEz-0000MW-61
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:00:54 +0000
Received: from mail.nppct.ru (mail.nppct.ru [195.133.245.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1fc9b72-1b59-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 09:00:50 +0200 (CEST)
Received: from mail.nppct.ru (localhost [127.0.0.1])
 by mail.nppct.ru (Postfix) with ESMTP id 8B7641C0E8A
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 10:00:47 +0300 (MSK)
Received: from mail.nppct.ru ([127.0.0.1])
 by mail.nppct.ru (mail.nppct.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WDgrvqbrtfTk for <xen-devel@lists.xenproject.org>;
 Thu, 17 Apr 2025 10:00:39 +0300 (MSK)
Received: from [172.16.0.185] (unknown [176.59.174.214])
 by mail.nppct.ru (Postfix) with ESMTPSA id 8B6BC1C08D8;
 Thu, 17 Apr 2025 10:00:23 +0300 (MSK)
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
X-Inumbo-ID: b1fc9b72-1b59-11f0-9ffb-bf95429c2676
Authentication-Results: mail.nppct.ru (amavisd-new); dkim=pass (1024-bit key)
	reason="pass (just generated, assumed good)" header.d=nppct.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nppct.ru; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:to:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1744873239; x=1745737240; bh=w5PRKU5sdEGDHRp4fP0Y606LJOfqnZ6orvN
	Nl1CuqY8=; b=ZfCkEqU5CLR6zk1GoYwHVG/iZlY0AdlFJg282mLJe4nkN2qZX1J
	Cb5rv4fUlmG1P2YEyKsMu8Dg5aPHoYiQE+ZY8WEobLCnQpD+MCp4f8QvbMU3FiGm
	5EISN9Iwymnq85CIrv+UGGuibFc6vtqHf850X3qrRslHFkKZR3iNYKKE=
X-Virus-Scanned: Debian amavisd-new at mail.nppct.ru
Message-ID: <fa91aad9-f8f3-4b27-81b3-4c963e2e64aa@nppct.ru>
Date: Thu, 17 Apr 2025 10:00:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen-netfront: handle NULL returned by
 xdp_convert_buff_to_frame()
To: Jakub Kicinski <kuba@kernel.org>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20250414183403.265943-1-sdl@nppct.ru>
 <20250416175835.687a5872@kernel.org>
Content-Language: en-US
From: Alexey <sdl@nppct.ru>
In-Reply-To: <20250416175835.687a5872@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 17.04.2025 03:58, Jakub Kicinski wrote:
> On Mon, 14 Apr 2025 18:34:01 +0000 Alexey Nepomnyashih wrote:
>>   		get_page(pdata);
> Please notice this get_page() here.
>
>>   		xdpf = xdp_convert_buff_to_frame(xdp);
>> +		if (unlikely(!xdpf)) {
>> +			trace_xdp_exception(queue->info->netdev, prog, act);
>> +			break;
>> +		}
Do you mean that it would be better to move the get_page(pdata) call lower,
after checking for NULL in xdpf, so that the reference count is only 
increased
after a successful conversion?

