Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D69480980
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 14:19:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252243.433239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2CNO-0000Ee-DK; Tue, 28 Dec 2021 13:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252243.433239; Tue, 28 Dec 2021 13:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2CNO-0000B3-9d; Tue, 28 Dec 2021 13:18:50 +0000
Received: by outflank-mailman (input) for mailman id 252243;
 Tue, 28 Dec 2021 13:18:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=twCP=RN=gmail.com=ayan.halder.arm@srs-se1.protection.inumbo.net>)
 id 1n2CNM-0000Av-B0
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 13:18:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0387da0-67e0-11ec-bb0b-79c175774b5d;
 Tue, 28 Dec 2021 14:18:47 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id w20so29351960wra.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 05:18:47 -0800 (PST)
Received: from [192.168.1.75] (40.230.9.51.dyn.plus.net. [51.9.230.40])
 by smtp.gmail.com with ESMTPSA id az15sm17394124wmb.47.2021.12.28.05.18.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 05:18:45 -0800 (PST)
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
X-Inumbo-ID: b0387da0-67e0-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Xi5AJGQaDpl0p63FzDAP4rk1vajquACxcaZRSyZwl4c=;
        b=fASZXD1x0Lmh22w9PJ5lALlbmlUk6eAd6eMk6mMxoyI66fExRBMVmJ54o/qdTTMMQs
         +C4FT/GJlbC0BHIwYkDkaacFvXMHcBi8QnaKI7EpdqfhxRfflQEXYxec80zUsceLbT0Z
         ztx+Y8KyacxkoLclrnJZ/0bOJmPzAPDm3QZNQ8G20UCpI/FWzJwnmwynmROR4i3in8BP
         mxL22xxdEgqYVqqhbWadgVck5Otz5OMYMFW/xR3V6Iy74WTeBQQqBN9pgj+iJgXGQOGd
         Kb1T/qH6iP0DsWWOE2hqayGvKIXAZh9B3jHJrpEeb92wUGMtukeMFtSTMvd2SyNe/zh0
         Y77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=Xi5AJGQaDpl0p63FzDAP4rk1vajquACxcaZRSyZwl4c=;
        b=WC+z1YD2fDJjxuzyjvzeYGQMShpDi0C+T8UVTAqEVJDqfIK1TlY0oNuklZQZMYKLql
         8gT1GRdvtKjO1ySgBv1/BCAKaPe0LzW9p4sZnORhytu0ZxRgwOee95aPQOdZ3W1oSprj
         NCzxZrRi5MJwlygrVkpCCK4v5/5GfN6x0Sx9NpP5KMASCCmScV92Y/p2oIJbwj5JnzuG
         UKV9Zy1EA1K/N7jcV8oQmi65nRPvKBGyi8Oiiqq5iBDi7iJaXeEqIQ67+QeU3S5fb0ZS
         D+zJpNgvfscACR9Ptb0tR+FxgZQedAUoo4B9LJmma5d4ULbTseKy6003X6GIyDRU12Ow
         8+Qw==
X-Gm-Message-State: AOAM533Vn1CbocSc76pHnut1EZIi3zD+PWyn3jbCXTkcugM7mDqWb8xN
	UJsMysIYaSiL5AkzafEcDcKJ/nnVyl331TKr
X-Google-Smtp-Source: ABdhPJxgvjF0GMcyGpn8zikPRmysVjLKXR1lADcfVlTviHTf7pMVdY0MiXa4e0fKZYQGv+PXYBCicg==
X-Received: by 2002:adf:f8cb:: with SMTP id f11mr16184846wrq.700.1640697526238;
        Tue, 28 Dec 2021 05:18:46 -0800 (PST)
From: Ayan Kumar Halder <ayan.halder.arm@gmail.com>
Subject: Trying to boot xen on Raspberry-pi 3 B+
To: julien.grall.oss@gmail.com, bertrand.marquis@arm.com,
 Volodymyr_Babchuk@epam.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org
Message-ID: <ed00e7a6-ed75-5101-0dd1-a5f156aeb68f@gmail.com>
Date: Tue, 28 Dec 2021 13:18:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi,

I am trying to boot xen on Raspberry-pi 3 B+ as my hobby project to 
learn about Xen.

I used the latest version of xen 
(f1e268b9fd13647e1f69c8ce0ae7be401d319fc8).  I tried using 
tiny64_defconfig and built xen-4.17-unstable. Also I enabled printk and 
set 0x7e215040 as the early printk physical base address (0x7e215040).

Then, I just tried to load xen and dtb (the same which has worked fine 
for linux). However, there is no prints after "Starting kernel ...".

1. Do you know if there is something I am missing ? I am expecting to 
see the Xen earlyprintk logs.

2. Is raspberry 3 B+ expected to work with Xen ? I was reading 
https://www.linux.com/featured/xen-on-raspberry-pi-4-adventures/ and is 
my understanding correct that only Pi 4 is supported ?

Kind regards,

Ayan


