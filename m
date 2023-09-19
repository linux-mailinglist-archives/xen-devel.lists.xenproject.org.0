Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD97A6C8D
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 22:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605017.942620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qihiz-0007cM-1S; Tue, 19 Sep 2023 20:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605017.942620; Tue, 19 Sep 2023 20:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qihiy-0007aR-Uf; Tue, 19 Sep 2023 20:53:36 +0000
Received: by outflank-mailman (input) for mailman id 605017;
 Tue, 19 Sep 2023 20:53:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlr/=FD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qihix-0007aJ-Bg
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 20:53:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 988a73f4-572e-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 22:53:33 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401187f8071so1563365e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Sep 2023 13:53:33 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c294c00b0040303a9965asm40842wmd.40.2023.09.19.13.53.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 13:53:32 -0700 (PDT)
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
X-Inumbo-ID: 988a73f4-572e-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1695156813; x=1695761613; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/8v+fLBjzDchcY3KEo/X8Cz0FYTTYDqEFVcitrjtkZE=;
        b=ofERRzx5Tno0sYi69s7ej3K2GtZWGgP/4OomNrJpLvxKa6foqRBFLVel9/LwBA1Ruo
         zd8hFx6v9QwR51evdLWBdJm1lDWfVtuPeEwDejQWkkcDXOBeVq7czdFRfZMdhkCf08gq
         xwl526D9sdj85IoIVFynPDXDrzpfuRAWNUniE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695156813; x=1695761613;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8v+fLBjzDchcY3KEo/X8Cz0FYTTYDqEFVcitrjtkZE=;
        b=sIYW06V/5zEpIg9Z2qOropAYBTwNvCm5ap84VDA2l+DKldPaqOZO11ab0vf/tpnrWk
         tjAwTAzt2JNfuW4Uzarx2qXiJm7X+BJJBQVXTsUrlrgxsKIvnM8SdXKnQbA2m/n1pPYr
         WUNGPzHMZktGkVi2M066S3zzY3P9erL1IadXqY3r3Siftfpb+FC/OqB3zS1Q/KpbhMSQ
         pGLXIketyoiYjemwknjFbIYc7o/T+Tzp2Iguq9hQkp/jehH7xmE6wUg4pIKrrsdINuYX
         uNTW/NoGjeMOqX8EeOs7r4bWnktWaWsFGM+bS8bHfR75yeiv025vy2vNV31e9VwygXnU
         7maA==
X-Gm-Message-State: AOJu0YxnMCEwbQ85bcsUfqnoGjUohf04vRpup5D8ICR+rRTAnk2X44lk
	iygW4bV4y+3eQ22mvKZBhLfnKEx3cBZG6UthBIEDeQ==
X-Google-Smtp-Source: AGHT+IHPALjSqpBEMOPHY2jCaanelpsapTy/3wwM/rUipwBV1i8kvqrH/3dnQavwDZ3CALKBQxMSxA==
X-Received: by 2002:a05:600c:1e20:b0:401:bd94:f45b with SMTP id ay32-20020a05600c1e2000b00401bd94f45bmr3147473wmb.4.1695156812885;
        Tue, 19 Sep 2023 13:53:32 -0700 (PDT)
Message-ID: <7de1e96f-a867-e5e2-45d5-3c64cd01ea3a@citrix.com>
Date: Tue, 19 Sep 2023 21:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 0/7] x86/pv: #DB vs %dr6 fixes, part 2
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jinoh Kang <jinoh.kang.kr@gmail.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/09/2023 9:36 pm, Andrew Cooper wrote:
> This time with a bit of sanity testing.  See patches for details.
>
> Andrew Cooper (7):
>   x86/emul: ASSERT that X86EMUL_DONE doesn't escape to callers
>   x86/emul: Fix and extend #DB trap handling
>   x86/pv: Fix the determiniation of whether to inject #DB
>   x86/pv: Drop priv_op_ctxt.bpmatch and use pending_dbg instead
>   x86: Introduce x86_merge_dr6()
>   x86: Extend x86_event with a pending_dbg field
>   x86/pv: Rewrite %dr6 handling

I've found even more PV debug bugs.

1) The MSR leak fix stopped MSR_DEBUGCTL leaking into PV guests, and
even "broke" my XTF test (still not blocking in CI because of bisector
interaction issues).  Really, this was one buggy case swapped for
another, but it needs resolving nevertheless.

2) activate_debugregs() has a misleading dr7 check in it (the caller is
gated on the same condition, making it tautological).  Worse however, it
loads %dr6 which interferes with with the #DB handler trying to get a
clean view of "new bits".  PV guests can't access %dr6 at all, so I'm
reasonably sure it's state we simply don't need to load at all.

3) The comment in paravirt_ctxt_switch_from() about debug regs is
buggy.  The logic is correct, but the reasoning is false.

4) set_debugreg() doesn't account for the dr7 state before loading
dr{0..3} in current context.  This manifests as spuriously loading
breakpoint registers despite not having debugging "active".  I think
it's benign.

5) The order of operations in activate_debugregs() is wrong.  There's a
period of time where we've got the new vCPU's breakpoints active using
the old vCPU's mask registers.  Again, I think it's benign.

~Andrew

