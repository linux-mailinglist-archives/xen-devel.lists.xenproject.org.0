Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4AA9AE9ED
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:10:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825396.1239609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zT1-0005H5-6W; Thu, 24 Oct 2024 15:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825396.1239609; Thu, 24 Oct 2024 15:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zT1-0005Eu-3C; Thu, 24 Oct 2024 15:09:39 +0000
Received: by outflank-mailman (input) for mailman id 825396;
 Thu, 24 Oct 2024 15:09:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sQmA=RU=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1t3zSz-0005Eo-Kg
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:09:37 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa418e8a-9219-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:09:35 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1729782569100520.8284390440086;
 Thu, 24 Oct 2024 08:09:29 -0700 (PDT)
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
X-Inumbo-ID: fa418e8a-9219-11ef-a0bf-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; t=1729782570; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KEqHjUROvZSoXGFSMgzZtw27qDNwHvspLxo8bo5nt0AurXlZkzRYWOEIf4658XGT0BBa0WE5Je4UwhPBDHHqqyQa/BbfH9omHvR7fOZcOKVm3HSP030I/VUgcWWIwbNlcLv/OSAEI2Q1vGB8ULzV8JX52uRGbq5a2djOnbDEGj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729782570; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SuHlAeyInqvMrMbZWA26jNsE0/fD6TA4egxUAF7gkd4=; 
	b=YqcaWopHYbJW9j4Cgbm0bj9kDFnTEawWZ6hHsI6G6OGe8qMln7717ta1WQHLCViGklJZOCq1quF214wSMu6KGHiq7Bm5oZDH4I/RhzrUJicr/HvJuIb1DZroAxLuZ1Vik972GnVqQiYwGqYSypyz2sPm1hHXxR5Z43MnuDEMQFY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729782570;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SuHlAeyInqvMrMbZWA26jNsE0/fD6TA4egxUAF7gkd4=;
	b=jp+r/A5cMOq4CyM4eGbvWUC4T0QQWD1qYxz+3pnC+c0BDiwZZZVcpLbbTMsyNE0f
	B2uxAipNPrdlgsk/814iTmpK00yfbujp4OfeBQucMjHXzBt75ZqTPOT8rpOzqlhQoGg
	v8asRo66bIK7xvkuzHZD01D9EaFNUIdWj8TQV6fs=
Message-ID: <3e26a4ae-0dfc-4580-a5be-0923ef338a79@apertussolutions.com>
Date: Thu, 24 Oct 2024 11:09:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86/boot: Drop initial_images pointer
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20241024142654.989980-1-andrew.cooper3@citrix.com>
 <20241024142654.989980-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <20241024142654.989980-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 10/24/24 10:26, Andrew Cooper wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Now that the module list is encapsulated inside boot_info, we can do away with
> the initial_images pointer.
> 
> No functional change.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>

Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>

