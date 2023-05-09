Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704CC6FCE7E
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 21:24:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532491.828730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSwN-0003FA-3W; Tue, 09 May 2023 19:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532491.828730; Tue, 09 May 2023 19:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwSwN-0003DS-0A; Tue, 09 May 2023 19:24:03 +0000
Received: by outflank-mailman (input) for mailman id 532491;
 Tue, 09 May 2023 19:24:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwSwL-0003DM-Py
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 19:24:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSwL-0001cI-9G; Tue, 09 May 2023 19:24:01 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.228]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwSwL-0007LD-3z; Tue, 09 May 2023 19:24:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=xgd3dabGCyxd1bHDiz5yr2QmYjSUogMyQF8yrndJ24Y=; b=arSGNCXhj3oX8KhiBxzRuxfRbu
	3vPof/kpm4G4ZHV45hUxibsAmE1rKPw8i+equPlSA8ACSv2vLvFAaoIXNd2rxybNVTnUDz1ERRMlS
	ZFRn2LeZcNU5+1bfXtJAKOsl8H2zQ9/5xuHWItPB+J3xI3mvctxvE3IyDMpJqfXkmDVk=;
Message-ID: <2a47f26e-a011-ce6c-cc88-c0e111a558a8@xen.org>
Date: Tue, 9 May 2023 20:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 14/14] tools/xenstore: switch quota management to be
 table based
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-15-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230508114754.31514-15-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 08/05/2023 12:47, Juergen Gross wrote:
> @@ -2714,15 +2710,19 @@ static unsigned int get_optval_uint(const char *arg)
>   
>   static bool what_matches(const char *arg, const char *what)
>   {
> -	unsigned int what_len = strlen(what);
> +	unsigned int what_len;
> +
> +	if (!what)
> +		return false;
>   
> +	what_len = strlen(what);

NIT: Keep the newline before the return.

Acked-by: Julien Grall <jgrall@amazon.com>

-- 
Julien Grall

