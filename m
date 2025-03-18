Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E75A677C2
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:29:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919306.1323797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYsZ-0007pO-DV; Tue, 18 Mar 2025 15:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919306.1323797; Tue, 18 Mar 2025 15:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYsZ-0007ma-AI; Tue, 18 Mar 2025 15:29:19 +0000
Received: by outflank-mailman (input) for mailman id 919306;
 Tue, 18 Mar 2025 15:29:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tuYsY-0007mU-3S
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:29:18 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a9b7b4-040d-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:29:16 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac2a089fbbdso1010598466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:29:16 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3146af05esm872384166b.16.2025.03.18.08.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:29:14 -0700 (PDT)
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
X-Inumbo-ID: c0a9b7b4-040d-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742311756; x=1742916556; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=es6Ez7FrEsyu7asoq1qxn+Djsr19u/lSAV+H/2guTGw=;
        b=MJ29K5MdeWcmqUEYsT5v9DaDNJoxVBfUuwzRoehc5h46/hp2FG79NnpUGLIvmFFVzv
         4b4VCCwwNftV+MxgSewnRgUbEK/KKa6CWKqMDw5fIpFWnS10xcDAz2wb1RmASbchDMC+
         kGJrtDE4YYOEb4M2w21nIdlXSA8vdxJLQRmY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311756; x=1742916556;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=es6Ez7FrEsyu7asoq1qxn+Djsr19u/lSAV+H/2guTGw=;
        b=FvDl+jCBgNWtKIWjeky9390PjN8MaaJk/bB7dFgTKGbj3INJ1t6C9amb0hsSSYktR4
         2iijavZXiacBi4fsMLHYeBgKGEwr/aGkrijpd9A1oF6VkodMXDT8/WDRm9QnBfhBZKsI
         /hqOo2qbza4IMbIRaDxX32IFPJcIRfHaPtYQtAIapf7aeE7IZQwOfij0ADKWNd9C4FL4
         BuPcxGygVglAlKQRsjfy3ecRxWyVHH5PZxK+2d+gvV0kgcvuNePoxvvE9ut83IltNKN5
         u6D3EibJPrRcv3Z92t87pBnV5PQ39nga20HqKO90KxspQI+gphEA94nYSSbOMfPjIFWH
         cnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPg0d/dm5UP5YspOrKtmsHttejJDRym/l8viyUBP+bkfaubp2mQp+AazlkaVE/91PzwGu3kV8z/os=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqCqB2/TrzfjVbx0rdAz7MM2UQcX6+uFgD91Ia5q+CIyMP+wa1
	ckWLSmWNr4KG6wfZxPN+nCFhLbEV0SbabJwGCWCSqO92PIk/FCfIW9g9Dzg9p/pL7fTOeksIGkv
	3
X-Gm-Gg: ASbGncveUGFTPSHfawB1WDu5p+tnjgDiQD0DTC2qBdTF9ItNYTbIOGpm38X7Dtl31WI
	F+NbjINrHdrz0/P9YIKpXCJG2Yoa82VVbZL1YRZXoMJU5wxolc1Mx/S/IWanDFy0lLg0px/qOrR
	gYQLIOWrQI24vjUovmdMhWFYu5I4qAgejIu7/tqgp1ZJyCB302cRJHAiCaaWg/mCKXhNKpc9U7h
	vIXK2WWbxgZN8yeT5yseIKsB0OwmmpWQuvMlzbE+4Zr2aOqAbPFT9JAhi+dFuTgyjVTnmCTweDV
	HCkQyWdYiCrfTF9vvE0InkPQO34tfTvx51R97qwqK1jdsP9dwoCc8/U=
X-Google-Smtp-Source: AGHT+IGAOxj7EnL+AkhdV/ZM2QlNm6mbcS4NHX/p5IJbIRPpX7oz+m6NoHVPPCLZzZM1zSa96F/AEA==
X-Received: by 2002:a17:907:72cb:b0:ac1:edc5:d73b with SMTP id a640c23a62f3a-ac38f744041mr375723966b.8.1742311755075;
        Tue, 18 Mar 2025 08:29:15 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:29:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/5] x86/shadow: fix UB pointer arithmetic in
 sh_mfn_is_a_page_table()
Message-ID: <Z9mRSc7PKQIY9whY@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-5-roger.pau@citrix.com>
 <1871a0ff-5766-4707-8791-c20279c12fd9@citrix.com>
 <a8f43182-a101-4e5a-ad25-97e3a41853fd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8f43182-a101-4e5a-ad25-97e3a41853fd@suse.com>

On Tue, Mar 18, 2025 at 03:36:45PM +0100, Jan Beulich wrote:
> On 18.03.2025 13:53, Andrew Cooper wrote:
> > On 18/03/2025 9:19 am, Roger Pau Monne wrote:
> >> UBSAN complains with:
> >>
> >> UBSAN: Undefined behaviour in arch/x86/mm/shadow/private.h:515:30
> >> pointer operation overflowed ffff82e000000000 to ffff82dfffffffe0
> >> [...]
> >> Xen call trace:
> >>    [<ffff82d040303882>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
> >>    [<ffff82d040304cc3>] F lib/xxhash64.c#__ubsan_handle_pointer_overflow+0xcb/0x100
> >>    [<ffff82d040471c5d>] F arch/x86/mm/shadow/guest_2.c#sh_page_fault__guest_2+0x1e350
> >>    [<ffff82d0403b216b>] F lib/xxhash64.c#svm_vmexit_handler+0xdf3/0x2450
> >>    [<ffff82d0402049c0>] F lib/xxhash64.c#svm_stgi_label+0x5/0x15
> > 
> > Something is definitely wonky in this backtrace.
> > 
> >>
> >> Fix by moving the call to mfn_to_page() after the check of whether the
> >> passed gmfn is valid.  This avoid the call to mfn_to_page() with an
> >> INVALID_MFN parameter.
> >>
> >> While there make the page local variable const, it's not modified by the
> >> function.
> >>
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > 
> > Whatever is wonky in the backtrace isn't related to this patch, so
> > Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, but the backtrace
> > does want fixing.
> 
> Right, but the fix may need to be in the tool chain. I'd be curious what
> the symbol table looks like that this was created from. Roger, was this
> linked with GNU ld or LLVM? Are the filename anomalies also visible in
> the corresponding xen-syms.map?

It's with LLVM LD, it's this issue:

https://lore.kernel.org/xen-devel/20220505142137.51306-1-roger.pau@citrix.com/

I need to refresh that patch and resend.

Sorry, I got so used to those wonky filenames in the backtraces that I
no longer notice.

Thanks, Roger.

