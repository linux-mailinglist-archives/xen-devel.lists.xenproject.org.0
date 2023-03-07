Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E43E86AE550
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507542.781172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZYh-00010C-CZ; Tue, 07 Mar 2023 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507542.781172; Tue, 07 Mar 2023 15:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZYh-0000xK-9I; Tue, 07 Mar 2023 15:48:59 +0000
Received: by outflank-mailman (input) for mailman id 507542;
 Tue, 07 Mar 2023 15:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZZYf-0000jA-N9
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:48:57 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916fa4bb-bcff-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 16:48:56 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id l1so12546990wry.12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:48:56 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c592535839sm12810167wrt.17.2023.03.07.07.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:48:55 -0800 (PST)
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
X-Inumbo-ID: 916fa4bb-bcff-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204136;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d4VVf6Ok91yoK/WSdCMtKSGd9K2hkIRITKppkJrbLbk=;
        b=KK8MTs5ZJ+ZGZsWyZ/FIL+lUClKCa0Q+Z4ogG+cNO02dCzn+vdapYF0FjTEJhOZ4l6
         i6yx740eVQkzPOleIGEfDPui4Ea0adeL/Du854HyDJH10+bneztjU7QT9M2V8NpEawK8
         FxLhH+1fiJ1YetEABOE1gC7l2jmUONt0gvRcxGlDaK8iOHJ9ZXtYxkg3kbfW+teyz9+t
         wPWMCZ4Fm8lVwzZBJYxYUD9iw3EmlSgUbU0A5ZgD1AvVyuZ2W5bKtaCWUmihO7tiIEtd
         uTqjCs1z3W0dua9HC/CGcLq1clRhBFCyXwkl8HGhwqahIX7GkIn80bNtcUtyvzFlsBri
         Rr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204136;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4VVf6Ok91yoK/WSdCMtKSGd9K2hkIRITKppkJrbLbk=;
        b=JwgU2gTCSP2+5BxPU5GdCx+hMtN2ffXc0Msweja8LbzqrBx1F6+b8Po0alSfnwGxJP
         PjERNtVPt8f1CV0PJH0nS6DsEgqZq3DVm5y3iLX0PPw2k//7rRhDl+/q/A0C1aiCAzdb
         dnA4drCsypIGWNN1XEMfb/omSeTBe50r8CAB8cM/gCJKCFjtVPztyUS7gdnRS7XlA2B/
         63y/wIZ5ftDZkdCsA8fD8niHi5359Esahr/aTFiA3bCHhQcnqxojSutanEgc9/zrAAd8
         a0koGLtonp1c5ARJcjLVLcvfgvxyswnO1oHEJ9gN2v8y24meubFCOy0PUjwYe41bEB+R
         eVNQ==
X-Gm-Message-State: AO0yUKWuXpgPHr5Gydx/Zn4BqaM9oS0Lw2NDo8QZomR+JoH0HtRIcPNn
	Gb5muvMQQivEMofim3saaaY=
X-Google-Smtp-Source: AK7set9MOYFY9eeCxPLSD/f3wYHB0MRb/Jt+n2KwWMszzZsOIF3uM6kkD/gdT3uc27zfP/zs8NTZdA==
X-Received: by 2002:adf:eecf:0:b0:2c9:8cd:55a with SMTP id a15-20020adfeecf000000b002c908cd055amr8384078wrp.15.1678204135733;
        Tue, 07 Mar 2023 07:48:55 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <c8638efb-1c83-4394-11d5-2614f531834c@xen.org>
Date: Tue, 7 Mar 2023 15:48:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 19/25] hw/xen: Only advertise ring-page-order for
 xen-block if gnttab supports it
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-20-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-20-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Whem emulating Xen, multi-page grants are distinctly non-trivial and we
> have elected not to support them for the time being. Don't advertise
> them to the guest.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


