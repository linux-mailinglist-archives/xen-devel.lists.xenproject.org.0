Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCCC41A9E2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197698.350898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7fc-00052d-5g; Tue, 28 Sep 2021 07:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197698.350898; Tue, 28 Sep 2021 07:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7fc-00050J-26; Tue, 28 Sep 2021 07:36:56 +0000
Received: by outflank-mailman (input) for mailman id 197698;
 Tue, 28 Sep 2021 07:36:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHmr=OS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mV7fa-00050D-OS
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:36:54 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42772453-5762-4ab7-b011-07ecb0886482;
 Tue, 28 Sep 2021 07:36:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so56337193wrg.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 00:36:54 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id h15sm18422829wrc.19.2021.09.28.00.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 00:36:53 -0700 (PDT)
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
X-Inumbo-ID: 42772453-5762-4ab7-b011-07ecb0886482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v5ug0LzsbMRQwh3CsWK83e691mVxV+MasCT39d/p1F0=;
        b=RGhIruELcEu6cVD9rU8Q4GeBVWwDr6GdDYMdqR5Xn53hMzhHdb3dRiPWwDxg7Pob27
         QfRJRWoqwNm8pWqttZwBtSjpspO+n1SXnHVt3QzkpZOSS91U/SeZ3eIf9AclCfOEdUQ4
         aBi46UeEUpyhrcT/rZ7mfr6071ikP2l9A/p2emS+krfZC2E3NYc8AqV75v3EvQ0AD6xc
         epmZOnA1OJLUnk01D2PWuO7lgUjqQFR1uDOZUp4t9w7PSJ7pSf2W0ZfEnLqTmXz4zYcG
         ZPdbFM5t3sfmXqc3bNp4deBDRZARGqOoJ1qhL0Z0Vgo243rjxHERwLMWUHLQKyZQYbjV
         pt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v5ug0LzsbMRQwh3CsWK83e691mVxV+MasCT39d/p1F0=;
        b=u5kEch72vxxl1v9x1YrzozmIBtowyddapKIsB3nB8eQaqPxaUPM+MgcJKWO3JP/sZ4
         VxQg1o+lSQYq70uvV3WTGoyUGxIz4TcUUB3/rmyUnRAiBVfJLW37z8Cwibrm1PJuMrZw
         tiXkobbk9HXL8t4qKWlzci5OKLeGnFHS6qX27ZPvzVO1N9fO1MvRg/0HLgSAe1yiphk9
         KrfNHjCMGqrkwB7N3oe/Np5WEoLgKoRGrnEe73zqqZsFPLjeb+SY7gnw0TFcVtxRAsnZ
         3tID+E445UAbqo5SJuuCrnkDMKyzwlUUQOsU5jCg1tsMPXs85BV7zYox7P8rdV0GstyD
         lxlw==
X-Gm-Message-State: AOAM531XkAUWh/QiUtwIyNeXvvkxE7Fh2X4BDNxmLHyOvsRcVwrtD3AP
	lX/qKEkcm0rnpYXHA4PVa7E=
X-Google-Smtp-Source: ABdhPJyqnCu9GbeBSKd18QLEKWPAlanEQ0sqC5irH14fIeVOfGMhpfSMk9CD9ytV06cED/EDwd3iCw==
X-Received: by 2002:adf:dd49:: with SMTP id u9mr4672361wrm.341.1632814613332;
        Tue, 28 Sep 2021 00:36:53 -0700 (PDT)
Message-ID: <d3c3b085-4408-f797-eaa6-d3fae074e692@gmail.com>
Date: Tue, 28 Sep 2021 08:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v8 5/6] AMD/IOMMU: pull ATS disabling earlier
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <34c081bd-ac6d-055c-e6c1-eeac62851389@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <34c081bd-ac6d-055c-e6c1-eeac62851389@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2021 15:38, Jan Beulich wrote:
> Disabling should be done in the opposite order of enabling: ATS wants to
> be turned off before adjusting the DTE, just like it gets enabled only
> after the DTE was suitably prepared. Note that we want ATS to be
> disabled as soon as any of the DTEs involved in the handling of a device
> (including phantom devices) gets adjusted respectively. For this reason
> the "devfn == pdev->devfn" of the original conditional gets dropped.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

