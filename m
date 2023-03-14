Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52CB6B8E1F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 10:06:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509510.785372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0ba-0001aI-ME; Tue, 14 Mar 2023 09:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509510.785372; Tue, 14 Mar 2023 09:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc0ba-0001XA-Ii; Tue, 14 Mar 2023 09:06:02 +0000
Received: by outflank-mailman (input) for mailman id 509510;
 Tue, 14 Mar 2023 09:06:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TUcq=7G=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pc0bZ-0001X4-B0
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 09:06:01 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ffa9e3c-c247-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 10:06:00 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id k37so9723990wms.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 02:05:59 -0700 (PDT)
Received: from [192.168.21.223] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a7bc38e000000b003ed2b6da0d2sm1450244wmj.9.2023.03.14.02.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 02:05:58 -0700 (PDT)
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
X-Inumbo-ID: 6ffa9e3c-c247-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678784759;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/lJt9s2WRiZqSUJt1NgB/CFrGxZutEK5uPIWwQ1+iY=;
        b=kI+bfujAQ55ePrqLGf8KA4t4Md+YehwS1IeF0GT4FIidlUTQzNoEmOioAN9koNVluv
         bKvaeLj6mX+JcKkiz+VFTNF690ptqqD+8ED/fH615zZxL+zO4uzRsJUTFv82Rtz1PNI8
         i6aqf3C5f2grqe4pys+PHh8FeZk86+7NKntHXUQ3+U/+8fPeFGuJUL0BDhOkfDEhK1mm
         GFKf0tDrgZKfYHsroRl2dGsDwXaIRq8LCrAt2vx/NZ41otGweYRd2UHIvgNsJu2qooeT
         vGjTwXLdQ5m7OzJ3E7RMYoi+4tpslgNqi8ZqmfNuqTmsfNGDT8uvVFTMarPwbxlMzHqi
         LGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784759;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/lJt9s2WRiZqSUJt1NgB/CFrGxZutEK5uPIWwQ1+iY=;
        b=V/wVRBnytEXrT6/Lv+DXObtc8tWl/11MjElH2WQysRLq/kkNGcpHvdIZPIMEo4vKmG
         156leE78geZj2OMttMB8dFaRfWPq3Zj+bjkCt5URtjMMjzbDqx/PPNNc7nkyRbdhl3j+
         mNy6xPSxHY6gXbO4M/lA13VK9pxP13lhn7FMSQB8SESTzLqChMscuHtaIgaRc2EPvgu0
         Q/uKwH6wiq3KHL8OITpkL6fE1Oi19UNOcePGIF2MbCMvE/HXlYA3rUULfLw2AmmMJX83
         xX54fE35+AOVZ7AHf+esZ4ofuQlAgoPMBtPE1VYl8HTLYcOzDDiE0dsKKNqbksbLad43
         HYQg==
X-Gm-Message-State: AO0yUKUnuKyJ+0uoBpLXjS+16FTyk+DfKyJ9ZCs27EF+c7qFd68BSIdc
	IACBVS1GMPeHr+w283vFXiI=
X-Google-Smtp-Source: AK7set/iy+guVU8jvKQJiCwja+79BoDT/XQwIGyKPKWW2gx9TOz8R5kfjPD04OMjaplDG3HOZExHVg==
X-Received: by 2002:a05:600c:19cf:b0:3eb:3cc9:9f85 with SMTP id u15-20020a05600c19cf00b003eb3cc99f85mr14397660wmq.26.1678784759074;
        Tue, 14 Mar 2023 02:05:59 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <af8b5b82-036d-6355-4201-77ecdd6ba61b@xen.org>
Date: Tue, 14 Mar 2023 09:05:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [PATCH] accel/xen: Fix DM state change notification in
 dm_restrict mode
To: David Woodhouse <dwmw2@infradead.org>, Jason Andryuk <jandryuk@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>, Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
References: <20230307182707.2298618-1-dwmw2@infradead.org>
 <20230307182707.2298618-14-dwmw2@infradead.org>
 <CAKf6xpuH2E=16s1jFvgL9J723wv0dhBD5aYWP2NBNj5rZio2jg@mail.gmail.com>
 <5062bef5b5cfd3e2d7f313de9af306f5e4f841f5.camel@infradead.org>
 <CAKf6xptRmeVmH3xmF8QffQA=aYeXxCWUw9ta2HaYx1xQngzjTA@mail.gmail.com>
 <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <1f141995bb61af32c2867ef5559e253f39b0949c.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/03/2023 08:35, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When dm_restrict is set, QEMU isn't permitted to update the XenStore node
> to indicate its running status. Previously, the xs_write() call would fail
> but the failure was ignored.
> 
> However, in refactoring to allow for emulated XenStore operations, a new
> call to xs_open() was added. That one didn't fail gracefully, causing a
> fatal error when running in dm_restrict mode.
> 
> Partially revert the offending patch, removing the additional call to
> xs_open() because the global 'xenstore' variable is still available; it
> just needs to be used with qemu_xen_xs_write() now instead of directly
> with the xs_write() libxenstore function.
> 
> Also make the whole thing conditional on !xen_domid_restrict. There's no
> point even registering the state change handler to attempt to update the
> XenStore node when we know it's destined to fail.
> 
> Fixes: ba2a92db1ff6 ("hw/xen: Add xenstore operations to allow redirection to internal emulation")
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Co-developed-by: Jason Andryuk <jandryuk@gmail.com>
> Not-Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Will-be-Tested-by: Jason Andryuk <jandryuk@gmail.com>
> ---
>   accel/xen/xen-all.c | 27 ++++++++++-----------------
>   1 file changed, 10 insertions(+), 17 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


