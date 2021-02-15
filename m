Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A335431B5F1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 09:39:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85093.159542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZP4-000728-Mo; Mon, 15 Feb 2021 08:38:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85093.159542; Mon, 15 Feb 2021 08:38:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBZP4-00071k-IQ; Mon, 15 Feb 2021 08:38:46 +0000
Received: by outflank-mailman (input) for mailman id 85093;
 Mon, 15 Feb 2021 08:38:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBZP2-00071M-7L
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 08:38:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 68ff295d-05b1-4c48-9ad2-c8de1852afd6;
 Mon, 15 Feb 2021 08:38:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0027AAD78;
 Mon, 15 Feb 2021 08:38:39 +0000 (UTC)
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
X-Inumbo-ID: 68ff295d-05b1-4c48-9ad2-c8de1852afd6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613378320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5OmUhAPyHsjLq24iNVaOjuspmmJfGHeH5jqOEAPucM=;
	b=pkI8gRBq4Lb43TQjdcoN3nAgch8IhU8NRVunS2oCh3rHziMTlvP0tEBR1/rttkFGBYbab/
	JBPVWPYrDjQYx7q2HprfASg2q+cUWomovYFVYIa115sTONjKiKquAP6+4pqpsMaXawAP79
	v6w6enxt7WqImGtzCL4ZdZwc5tHpbEQ=
Subject: Re: Boot time and 3 sec in warning_print
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
Date: Mon, 15 Feb 2021 09:38:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.02.2021 09:13, Jürgen Groß wrote:
> On 15.02.21 08:37, Anders Törnqvist wrote:
>> I would like to shorten the boot time in our system if possible.
>>
>> In xen/common/warning.c there is warning_print() which contains a 3 
>> seconds loop that calls  process_pending_softirqs().
>>
>> What would the potential problems be if that loop is radically shortened?
> 
> A user might not notice the warning(s) printed.
> 
> But I can see your point. I think adding a boot option for setting
> another timeout value (e.g. 0) would do the job without compromising
> the default case.

I don't think I agree - the solution to this is to eliminate the
reason leading to the warning. The delay is intentionally this way
to annoy the admin and force them to take measures.

Jan

