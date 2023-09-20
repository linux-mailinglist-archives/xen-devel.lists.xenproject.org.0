Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F57E7A8C25
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 20:59:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605933.943575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2PU-00029O-Id; Wed, 20 Sep 2023 18:58:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605933.943575; Wed, 20 Sep 2023 18:58:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qj2PU-00026q-F0; Wed, 20 Sep 2023 18:58:52 +0000
Received: by outflank-mailman (input) for mailman id 605933;
 Wed, 20 Sep 2023 18:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cdA=FE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qj2PT-00026h-Bt
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 18:58:51 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb912e3d-57e7-11ee-9b0d-b553b5be7939;
 Wed, 20 Sep 2023 20:58:49 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31ff1f3cde5so139685f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Sep 2023 11:58:49 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e1-20020a5d65c1000000b00315af025098sm19288379wrw.46.2023.09.20.11.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 11:58:48 -0700 (PDT)
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
X-Inumbo-ID: bb912e3d-57e7-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695236329; x=1695841129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TDCsVEQXVvB1dzVrirmLD8hzugcckZVxRhko0DzKviU=;
        b=WaXVoMwd3jKSpkNgD5jAZHEh8Oe1I9Fvt2kXlF88/AiWGMyQqJLyAjoCE7i8VzGrz1
         PRjV9t8WHlHdzErYTXBRtturQhSc+fgV0G9Fp52ylqO+ixdP2TL9jHFa1fd+VvLni2wv
         uY9YSXpe4U2rzIjyqT+M4m54OaSIxP3fgvkcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695236329; x=1695841129;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDCsVEQXVvB1dzVrirmLD8hzugcckZVxRhko0DzKviU=;
        b=nWdP+rPoDRwEvSCcv74ZlQqPlbDDZitm7RHxM6dYPBiPWUk2INOHpMBVf0eH5JfKcu
         LhKbqMVv+LkNzVsNfnwxChEHKgrv/FAP32ReC1JPhFHPtKswgvMDuqKJvdunFenz6g/H
         1EkJ9doQiVopq7e1zjVwPulLbmcRbJ527Wjj55xK86i7oTpx4W3QRmwuAMUJ6XQ/LH2Q
         fPGRhW60L7gkdWdfKaseifGgzDTwIyUAaSEcQUEKjC+WPGn8j8c8FWyphTE2O/Beckh9
         IXOVeBrLjpqB331pZ/LnQf+skyrzT18dmWz+rSvAj5FbtIls98+UCQClyZrkGxARgXFW
         K/Fw==
X-Gm-Message-State: AOJu0Yz1tgkiHXRGSQV4Lfnt8mfN8qtfF66llK+Qh1CLh9R1k3Dx4D24
	HBlNGIaCPlDvUxgRIJ/e73QoSg==
X-Google-Smtp-Source: AGHT+IHEMDgsHfcTbZbImvmLSGKjb8kXZjl8OKnf6F9owdz1AAQt2hRCrUQQ8LfqOL21ze5uNBo8mw==
X-Received: by 2002:a05:6000:10c7:b0:321:5d9f:2da0 with SMTP id b7-20020a05600010c700b003215d9f2da0mr3074023wrx.13.1695236328641;
        Wed, 20 Sep 2023 11:58:48 -0700 (PDT)
Message-ID: <640f6b3f-7a57-a53c-fd43-c120ac6d7f44@citrix.com>
Date: Wed, 20 Sep 2023 19:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: New MISRA C:2012 R10.3 violations due to XSA-438 fix
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, roger.pau@citrix.com,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <94f7aad4a3e6629fe947883ab0fca53f@bugseng.com>
In-Reply-To: <94f7aad4a3e6629fe947883ab0fca53f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/09/2023 5:25 pm, Nicola Vetrini wrote:
> Hi all,
> 
> In light of the recent changes introduced by commit fb0ff49fe9f784bfee0370c2a3c5f20e39d7a1cb,
> as part of XSA-438 [1], the signature of function pointer 'update_cr3' in
> 'xen/arch/x86/include/asm/paging.h', line 121, changed its second parameter to a boolean.
> Consequently, all calls to that function should use a boolean to comply with MISRA C:2012
> Rule 10.3 ("The value of an expression shall not be assigned to an object with a narrower
> essential type or of a different essential type category"), but they still use integers.
> These were the ones I can find:
> xen/arch/x86/include/asm/paging.h:299:    return paging_get_hostmode(v)->update_cr3(v, 1, noflush);
> xen/arch/x86/mm/hap/hap.c:797:    hap_update_cr3(v, 0, false);
> xen/arch/x86/mm/shadow/common.c:2513:    v->arch.paging.mode->update_cr3(v, 0, false);
> xen/arch/x86/mm/shadow/multi.c:2478:        v->arch.paging.mode->update_cr3(v, 0, false);
> 
> [1]
> https://lore.kernel.org/xen-devel/E1qitNQ-0001Pu-0K@xenbits.xenproject.org/
> 

Hmm yes - the int->bool conversion is not relevant to the rest of the
change, and shouldn't have been part of a security fix even before
taking MISRA into consideration.

I truly detest APIs like this - whether it's 0/1 or true/false, the
callsites are unreadable due to the obfuscation.

However, Xen even has paging_lock_recursive() for the cases where the
paging lock may or may not be held, and needs to be.  So I'm fairly sure
the do_locking parameter is bogus in the first place.

~Andrew

