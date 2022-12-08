Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB076475A4
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 19:32:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457400.715299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LgS-0005Jm-L9; Thu, 08 Dec 2022 18:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457400.715299; Thu, 08 Dec 2022 18:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3LgS-0005Hf-IW; Thu, 08 Dec 2022 18:31:48 +0000
Received: by outflank-mailman (input) for mailman id 457400;
 Thu, 08 Dec 2022 18:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DFw/=4G=eikelenboom.it=linux@srs-se1.protection.inumbo.net>)
 id 1p3LgQ-0005HZ-Be
 for xen-devel@lists.xen.org; Thu, 08 Dec 2022 18:31:46 +0000
Received: from server.eikelenboom.it (server.eikelenboom.it [91.121.65.215])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fb11459-7726-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 19:31:42 +0100 (CET)
Received: from 131-195-250-62.ftth.glasoperator.nl ([62.250.195.131]:58874
 helo=[172.16.1.50])
 by server.eikelenboom.it with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <linux@eikelenboom.it>)
 id 1p3LhV-0002BF-8r; Thu, 08 Dec 2022 19:32:53 +0100
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
X-Inumbo-ID: 8fb11459-7726-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xh7NYgKqJIs6p/O05J4xYYF4pKK9kYdP7khjJXgOgSk=; b=F7fd1PyDPZxieCswJjDDZ9UCbv
	nF3RnxOIAWJRm0w4ju2cI30eMoaciQQ9bUN5Tu3wW1SP3oSEqMKWGyD673jHM2Nxa3zHg3+x7vy+t
	46VY3PQjvgDB4euRFgOSr13UQ5ByKjXwwIsHGM1eliLUwALKifBOtlA4mPnGMCSfm04Y=;
Message-ID: <c5dc1c91-dd32-e233-6029-10b175fc1eff@eikelenboom.it>
Date: Thu, 8 Dec 2022 19:31:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: Xen + linux 6.1.0-rc8, network to guest VM not working after
 commit ad7f402ae4f466647c3a669b8a6f3e5d4271c84a fixing XSA-423
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul@xen.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>
References: <2f364567-3598-2d86-ae3d-e0fabad4704a@eikelenboom.it>
 <56054539-4a02-5310-b93f-6baacaf8e007@citrix.com>
Content-Language: nl-NL, en-US
From: Sander Eikelenboom <linux@eikelenboom.it>
In-Reply-To: <56054539-4a02-5310-b93f-6baacaf8e007@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/12/2022 00:00, Andrew Cooper wrote:
> On 07/12/2022 21:42, Sander Eikelenboom wrote:
>> Hi Ross / Juergen,
>>
>> I just updated my linux kernel to the latest of Linus his tree which
>> included commit ad7f402ae4f466647c3a669b8a6f3e5d4271c84a fixing XSA-423.
>>
>> Unfortunately when using this kernel I can't SSH anymore into the Xen
>> guest I start, but I don't see any apparent failures either.
>> A straight revert of the commit
>> ad7f402ae4f466647c3a669b8a6f3e5d4271c84a makes networking function
>> normally again.
>>
>> I have added some of the logging below, perhaps it at gives some idea
>> off the state around the Xen network front and backend.
>>
>> Any ideas or a test patch that I could run to shed some more light on
>> what is going on ?
> 
> XSA-423 was buggy.  Fix and discussion at:
> 
> https://lore.kernel.org/xen-devel/681773dd-6264-63ac-a3b5-a9182b9e0cc1@suse.com/T/#t
> 
> ~Andrew

Thanks for the pointer Andrew, that fix works for me as well!
What a difference a few characters can make :)

--
Sander

