Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8241A96F
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197608.350754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7I0-0003OK-Ls; Tue, 28 Sep 2021 07:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197608.350754; Tue, 28 Sep 2021 07:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7I0-0003MH-If; Tue, 28 Sep 2021 07:12:32 +0000
Received: by outflank-mailman (input) for mailman id 197608;
 Tue, 28 Sep 2021 07:12:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHmr=OS=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mV7Hz-0003MB-8j
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:12:31 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 46f61a1f-09da-4549-9cc3-3a05dd2271d0;
 Tue, 28 Sep 2021 07:12:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t8so56299225wri.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Sep 2021 00:12:30 -0700 (PDT)
Received: from ?IPV6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id r6sm2032203wrp.41.2021.09.28.00.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 00:12:29 -0700 (PDT)
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
X-Inumbo-ID: 46f61a1f-09da-4549-9cc3-3a05dd2271d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:reply-to:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GaYYYFgnPlLR3k+/irQBsFsyl5Li0H3pN+dzpabEdF4=;
        b=EcS5Yt22pkp+j9/fwmecfi/V6S/6356P/dLrjU6yYABKDoEvmG+fWG6Yn89JaVcMTX
         BS7k6HO7vB/vcPcTiZQ1PIf5e22heEFF+2Fm8iHnRpJYdWH5DGAggqYC6trz2PIkk4ZY
         dZ4V9G2WTC8+sfYBN4IdXo5hcWfwFWDxIqoW8usWU0nVGJUYBvjVVE9omZigTi+OINxe
         l9nyBmQuwV+XkxRGtOgqqZHGW1/x+wMI1Hc0SEos+40+AYk517DdCCwaXb9Kdsyq692S
         Y0Bjrxudo8vmyWV4DYfLbn3Cm+NCanFjeA9aDpx+icKWYtptMmJo0efr97bh9EbreEAN
         yyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GaYYYFgnPlLR3k+/irQBsFsyl5Li0H3pN+dzpabEdF4=;
        b=PnGJGzjFHfFIqhRW5JtF7vaIndo2kKTr92VrKGfEeOsbnJv7pbk58szgIz9RKLTr1P
         RRCO8fehavd50YGs9EhNzOyWg66qwrnTAeZtsyWxoYZLe8rNVF5rRbhGr2GdTHX6AnA7
         4SVi+TN2L+ZdQcan9bXekUNbtkDrbCzIy/gwKfieoHV7hsY/EPFCWFlfcOL6UFKuuCCu
         11HeqwACJuAFUcXSsp+N3eo7zcRRPK4Cpp6+Ga0lXDgGeqnHW96aS0NYdNrksIpGCO/t
         5SP94aalTf4u80h8XIfxwuowYBJAlX4uw/e+0T+cAOKqIJExHFYW0sTwX6bLp/jDdabX
         3JeA==
X-Gm-Message-State: AOAM531a9y86Cz2lEIO+pTrznrRErLLvofN5lWPUdMtGDQyn71Vg/rtg
	9FS6lwYRQVykL9NAjO8ngeQ=
X-Google-Smtp-Source: ABdhPJyTtWBvdFtmruKesMEj/0t+gM9zzmpxxjy8MbSrdKRzujo67CTP/NR4DY/UNnrjrLTXa975ww==
X-Received: by 2002:adf:e30d:: with SMTP id b13mr4592901wrj.438.1632813149466;
        Tue, 28 Sep 2021 00:12:29 -0700 (PDT)
Message-ID: <f5dad7a7-0309-79f6-c592-18dda495e774@gmail.com>
Date: Tue, 28 Sep 2021 08:12:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Reply-To: paul@xen.org
Subject: Re: [PATCH v8 1/6] AMD/IOMMU: obtain IVHD type to use earlier
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <d249a759-188a-d689-316a-4743922827e5@suse.com>
 <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <d5f76461-70d2-fc59-2213-99a093e3b57f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/09/2021 15:36, Jan Beulich wrote:
> Doing this in amd_iommu_prepare() is too late for it, in particular, to
> be used in amd_iommu_detect_one_acpi(), as a subsequent change will want
> to do. Moving it immediately ahead of amd_iommu_detect_acpi() is
> (luckily) pretty simple, (pretty importantly) without breaking
> amd_iommu_prepare()'s logic to prevent multiple processing.
> 
> This involves moving table checksumming, as
> amd_iommu_get_supported_ivhd_type() ->  get_supported_ivhd_type() will
> now be invoked before amd_iommu_detect_acpi()  -> detect_iommu_acpi(). In
> the course of doing so stop open-coding acpi_tb_checksum(), seeing that
> we have other uses of this originally ACPI-private function elsewhere in
> the tree.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Paul Durrant <paul@xen.org>

