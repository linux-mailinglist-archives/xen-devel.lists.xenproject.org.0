Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9F09EC2B9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 04:03:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853700.1267085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD0Q-0004IT-PM; Wed, 11 Dec 2024 03:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853700.1267085; Wed, 11 Dec 2024 03:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLD0Q-0004GD-Md; Wed, 11 Dec 2024 03:03:18 +0000
Received: by outflank-mailman (input) for mailman id 853700;
 Wed, 11 Dec 2024 03:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLD0P-0004En-3Z
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 03:03:17 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750ab3a4-b76c-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 04:03:14 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733886186956718.379389784205;
 Tue, 10 Dec 2024 19:03:06 -0800 (PST)
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
X-Inumbo-ID: 750ab3a4-b76c-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733886189; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ksxwnsMfVW8oRE0UojpZzYhV640/C4iuNc9cUwY7QSPQZgO7UGPHMJmtUUCEz3DOeNCEJgVymhnr/BhwNX+nyGuyqY8wF5dq1Dli8r4hsiTJQZHJt2pRedAjsni4D05yMdz35uwct4Am32qUitVQoPOmf45Fp1YSJK+IKY/7x/k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733886189; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7DFb3vLMOPYI/O6UDb1gJySxpRV+8/scDyN5yvxffJQ=; 
	b=iPMQtCGgXdHYTpNiyB43L03f39kEH3k63SJ29pJvoGWhWN1y+Q6KIlADYaw5kkSUV5E/L2GgZjScMMzN1mYgNU4nPbCoifTIUeYPiw7RPFDvWuAsTGb5fgHoqEBmerjVTUtKSivSPhYKYlU9R2UvC5lyA2168PB9Mkro/mGzgJY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733886189;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7DFb3vLMOPYI/O6UDb1gJySxpRV+8/scDyN5yvxffJQ=;
	b=eVDK5UG9TQGTFC58S4FpKZq+OUvvq2FnTayMmWotFzOWMnN/dNkyTQOTEQUCAgvY
	PuoHpeH9vJACWJX8rNP4WN+5+xJnXg51ZagrM/rFwpCnd96HUKHPNDMOyaEWuadlW3o
	MGzpUbQ0CK6EfWFr6wwbfxDUiAgLRsYW9398iVVU=
Message-ID: <afd218f3-5165-48b1-82da-8c661d61335e@apertussolutions.com>
Date: Tue, 10 Dec 2024 22:03:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/15] kconfig: introduce option to independently enable
 libfdt
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: christopher.w.clark@gmail.com, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-5-dpsmith@apertussolutions.com>
 <20753f5c-bdf5-4f87-aa94-6a32a96f4b94@amd.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20753f5c-bdf5-4f87-aa94-6a32a96f4b94@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 11/25/24 10:42, Jason Andryuk wrote:
> On 2024-11-23 13:20, Daniel P. Smith wrote:
>> Currently the inclusion of libfdt is controlled by the 
>> CONFIG_HAS_DEVICE_TREE
>> kconfig flag. This flag also changes behvaior in a few places, such as 
>> boot
> 
> behavior

ack.

>> module processing for XSM. To support the ability to include libfdt 
>> without
>> changing these behaviors, introduce CONFIG_LIB_DEVICE_TREE. The 
>> inclusion of
>> libfdt is then moved under CONFIG_LIB_DEVICE_TREE.
>>
>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

thanks!

v/r,
dps

