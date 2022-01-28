Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD4B49F67B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 10:38:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261907.453768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNhV-0003hx-JJ; Fri, 28 Jan 2022 09:37:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261907.453768; Fri, 28 Jan 2022 09:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDNhV-0003g7-G4; Fri, 28 Jan 2022 09:37:49 +0000
Received: by outflank-mailman (input) for mailman id 261907;
 Fri, 28 Jan 2022 09:37:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NLE7=SM=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1nDNhU-0003g1-4n
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 09:37:48 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f381b79e-801d-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 10:37:47 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id u15so9732743wrt.3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jan 2022 01:37:47 -0800 (PST)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id u7sm1513104wml.7.2022.01.28.01.37.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jan 2022 01:37:46 -0800 (PST)
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
X-Inumbo-ID: f381b79e-801d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CUBUlllwIrtjoiltYib61AlCPOQmSESy3Oh4tXfXE4I=;
        b=OB9ibjvzkni5RBwUO4lNS96aUhXkp8XdjY8cZRHLgGpJVWnJAT7sK/umILoNZa+BtB
         /T5ltyofZu56S0D9GoWQT7iWpmNfGq7erZVit56FamcG//3B3IbgMEmN7B8wET5AY4EQ
         3tado1du78/IJR92WCNqXdQ3RRMbzlDeBd5CovKZAbI7azhUkBMhyinSgpCtlHu5PRHF
         imBqdueYeBL04YoViybVkx7nvz7DJnV6LbWsLmuxEMH3GPy86ZkfVCrxv3NXPqiyhX20
         pK3SC/Zix8aLj//tpxJ5pqcnTEhnYQL0SmY0uxRWTRWZEqnE8pAZ0x8ut9mia4eJi1lp
         eOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CUBUlllwIrtjoiltYib61AlCPOQmSESy3Oh4tXfXE4I=;
        b=TVgLN6PUWWZpkZROEt2jhI0kKOaL0tD1j2fhj/9Ikndw9VYcpr1hiPpfqcFvdCm3Wb
         DCRVwYPgWsC8uMPLEVLniN1/Gu/Uk0pU0USIELZ/4JnBN2YF+YxfNyMAg4rNTJlWZMZG
         fvj2q75poW/aTvBpn/rPEhfkSimTcP5VM9MfitqgI+oCLY15A7okawgT+k2NoZV8HsFT
         mCR08f8SB3nBkXx/SgkhIIBJvV3JTd4eLjfOabFXRsGs5gnyK9N1hmoKxLVqz4GzKmxZ
         ts74FqI42U3PqN2AM5DBDM/5PGp9x18nf1Ym4pkncwbgwlrfM9VeyQLeFVnyS5ACJeAW
         NerQ==
X-Gm-Message-State: AOAM532b6kHQRzoEta6rIoF4LW2OsgCG3Ds+oOIgp6zx13bDsHkTsv83
	jw39w9lBKSdB4lVuVjmvDNET8lt1vVY=
X-Google-Smtp-Source: ABdhPJy8mj/F0IOi5tdi+3HZPtn+Of86shguhs7sfkK7R38olNhHSliEBWyGeiq62IDU9C+sydBp7Q==
X-Received: by 2002:adf:b610:: with SMTP id f16mr6330578wre.266.1643362666715;
        Fri, 28 Jan 2022 01:37:46 -0800 (PST)
Message-ID: <e39b1ad8-75b0-b1f4-b59a-49da2d1cf320@gmail.com>
Date: Fri, 28 Jan 2022 09:37:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 4/4] IOMMU/PCI: propagate get_device_group_id() failure
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <4b7db7ae-eb84-7ecc-4334-fe5f0f7ef46b@suse.com>
 <998f6587-d64a-7336-a44b-d05ca486b4bc@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <998f6587-d64a-7336-a44b-d05ca486b4bc@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/01/2022 14:49, Jan Beulich wrote:
> The VT-d hook can indicate an error, which shouldn't be ignored. Convert
> the hook's return value to a proper error code, and let that bubble up.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

