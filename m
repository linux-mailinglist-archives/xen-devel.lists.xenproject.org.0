Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B83353F0626
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 16:15:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168271.307229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGMLf-00020w-8h; Wed, 18 Aug 2021 14:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168271.307229; Wed, 18 Aug 2021 14:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGMLf-0001xT-55; Wed, 18 Aug 2021 14:15:19 +0000
Received: by outflank-mailman (input) for mailman id 168271;
 Wed, 18 Aug 2021 14:15:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U85i=NJ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1mGMLe-0001xL-DT
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 14:15:18 +0000
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ee6fe4b-fe8b-42cd-8fd0-ec385bb88060;
 Wed, 18 Aug 2021 14:15:17 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h13so3827465wrp.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Aug 2021 07:15:17 -0700 (PDT)
Received: from ?IPv6:2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec?
 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id e4sm6208044wrw.74.2021.08.18.07.15.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 07:15:16 -0700 (PDT)
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
X-Inumbo-ID: 1ee6fe4b-fe8b-42cd-8fd0-ec385bb88060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=J3oke6bzb5KCEKognh8foJlyHEan8xSaFePYHmO6fss=;
        b=s9NBiKE6Vfxcp1pr+Qyf9C6D3zB+umfqE4Zaaow2OsrAHeH25XiLe36VlrT+lelLcn
         Yua1trRltiPgarAAs8sNUBKGE3XlrS5/W+Fj3oFvioqePuGJHWPvqKrir2CYVXGm4uYk
         Eb3HNvlk3qNBeG+aTavWrKdClnEZBVno0x2HPNUULP+UHrR0OWulfGrhpF3e251UvgRD
         movD5UfQcysklapRxf8S0P9s2YwrlmRMP8KmhffTItiqoYHxlYU7XHTG/QjRFc7OwWSA
         3YptP7+N3W+t1XdvBTMsJ+S6bLP1f5gnFlkzPTdmo6031g/lEwil0tTZ7ebv7rCnGtfc
         cXjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=J3oke6bzb5KCEKognh8foJlyHEan8xSaFePYHmO6fss=;
        b=P0FnE5VCJTpt//6HaOiMhj9s3rU4ge2zmqI5+pnMCZe5PXCzABM9gZNzwWLmRn7lvG
         VYxqq1CXjzzkxcHIrXnXSURuDKEF22UTQSV0HuJEx/kj9CqHmoMQfJF4ohOPiT/CMjBB
         DfHVbbs29B0qhvHsQeCjpGE3zv7Cy1v+QXfyhojaYV74tt7+KPkOK7TVQ17QYMLeCQG3
         JdDC4gapVdClgdZVuPOffjiNlfJA/3syLNegRw0yq/znjP9wng5peKAtkyL55uUE2NWY
         d27ptbeG0zt6oibJIyQ95YuaNegqPAoxjt6YNgHc42Ue0rrKTD90JNTdV9PHCggMbrvl
         MuiA==
X-Gm-Message-State: AOAM533TZibFdWgVulq8g1fKJR1QW88Bmdj+YYRlg+E9YGlfeg9ev/Ls
	oPJDnJMqcNm7DqRgq7HLP8eK0RT+hUU=
X-Google-Smtp-Source: ABdhPJwXl3NX3NvxMFbPer/vw7EK3SdE7Dhd6cG8p9wMfhg6H6JnyyjLDcmxST5xq1Tq3Q649EesoQ==
X-Received: by 2002:adf:de0e:: with SMTP id b14mr10988546wrm.207.1629296116896;
        Wed, 18 Aug 2021 07:15:16 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: meaning and use of IOMMU_FLUSHF_added
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d6a6e5a3-5ea2-638e-1eb5-2fee73d82188@suse.com>
 <496eb0fb-138e-d807-ebad-fc4b792dd9be@suse.com>
Message-ID: <d426b1fc-cf57-469a-59c8-a2d28ed2e312@xen.org>
Date: Wed, 18 Aug 2021 15:15:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <496eb0fb-138e-d807-ebad-fc4b792dd9be@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/08/2021 13:09, Jan Beulich wrote:
> On 18.08.2021 12:51, Jan Beulich wrote:
>> Paul,
>>
>> back at the time I did already question your intended meaning of
>> this flag. I notice that there's presently no consumer of it being
>> set (apart from yielding non-zero flush_flags). I'm afraid this
>> model makes accumulation of flush flags not work properly: With
>> both flags set and more than a single page altered, it is
>> impossible to tell apart whether two present PTEs were altered, or
>> a non-present and a present one.
>>
>> VT-d's flushing needs to know the distinction; it may in fact be
>> necessary to issue two flushes (or a single "heavier" one) when
>> both non-present and present entries got transitioned to present
>> in one go.
> 
> No two (or "heavier") flush looks to be needed upon further reading.
> I did derive this from our setting of "did" to zero in that case,
> but that looks to be wrong in the first place - it's correct only
> for context cache entry flushes. I'll make a(nother) patch ...
> 

Yes, the intention of the flag was simply to allow a 'lighter' flush in 
the case there are no modified entries as part of the accumulation. If 
it is impossible to tell the difference then I guess it's not useful.

   Paul


