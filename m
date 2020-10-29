Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14F29E6FD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 10:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14066.35009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3xO-0006Bs-9e; Thu, 29 Oct 2020 09:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14066.35009; Thu, 29 Oct 2020 09:10:54 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY3xO-0006BT-67; Thu, 29 Oct 2020 09:10:54 +0000
Received: by outflank-mailman (input) for mailman id 14066;
 Thu, 29 Oct 2020 09:10:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kY3xN-0006BO-Ee
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:10:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7650592-46c0-43a7-bb04-a60d66bafc0e;
 Thu, 29 Oct 2020 09:10:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5E30FAC65;
 Thu, 29 Oct 2020 09:10:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o7xP=EE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kY3xN-0006BO-Ee
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 09:10:53 +0000
X-Inumbo-ID: d7650592-46c0-43a7-bb04-a60d66bafc0e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d7650592-46c0-43a7-bb04-a60d66bafc0e;
	Thu, 29 Oct 2020 09:10:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603962651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzTkLgkH7xmXURvo+vTHjDlyEfUi6v22gqhA1NQ1zMc=;
	b=HQTSStvH5NdjybFs8hoswDeDtUcMY44kW2ag5Wa02TvSqISb6LxWhEJBKYrwxLKfAMUccm
	AhrhdHBoDPDRKLpMnHP3TRA93vMGtakI45WMj3fX+YoVzHbSrY7jIoAb/N5iZqGnf0MDLR
	KwuEuKthofqddirRZXkRRIqoZBZTtic=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5E30FAC65;
	Thu, 29 Oct 2020 09:10:51 +0000 (UTC)
Subject: Re: call traces in xl dmesg during boot
To: Olaf Hering <olaf@aepfle.de>
References: <20201029092237.50b8a6f6.olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1172852a-3428-be59-a1a0-9e264664bf81@suse.com>
Date: Thu, 29 Oct 2020 10:10:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201029092237.50b8a6f6.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29.10.2020 09:22, Olaf Hering wrote:
> During boot of xen.git#staging, Xen seems to think something pressed debug keys very early, which shows various call traces in 'xl dmesg'. A reboot may "fix" it, and no traces are printed.

I'm seeing the same every now and then, albeit only with a single
'A' so far, iirc.

> Any idea what may cause this behavior? I do not see it on a slightly smaller box.

I've been assuming this is stuff left in the serial port's input
latch or FIFO. So far I didn't have a good idea how to tell
left over garbage from actual input that was sent very early, so
I've no good idea how to work around it. A command line option
triggering the discarding of initially present input doesn't
look very attractive to me ...

Jan

