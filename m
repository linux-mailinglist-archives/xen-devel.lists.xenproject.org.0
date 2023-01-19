Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2296743B6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 21:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481327.746132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIbsV-0008C8-HB; Thu, 19 Jan 2023 20:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481327.746132; Thu, 19 Jan 2023 20:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIbsV-000893-Dc; Thu, 19 Jan 2023 20:51:19 +0000
Received: by outflank-mailman (input) for mailman id 481327;
 Thu, 19 Jan 2023 20:51:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KNz0=5Q=flex--seanjc.bounces.google.com=3Qa3JYwYKCeYaMIVRKOWWOTM.KWUfMV-LMdMTTQaba.fMVXZWRMKb.WZO@srs-se1.protection.inumbo.net>)
 id 1pIbsT-00088x-Oo
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 20:51:17 +0000
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [2607:f8b0:4864:20::44a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0374f8be-983b-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 21:51:15 +0100 (CET)
Received: by mail-pf1-x44a.google.com with SMTP id
 u3-20020a056a00124300b0056d4ab0c7cbso1417493pfi.7
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 12:51:15 -0800 (PST)
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
X-Inumbo-ID: 0374f8be-983b-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I2tCCje/5pOyO5VnTjmGeAPKEpXwqTjK1CxJlREHoLc=;
        b=ZUxDCKMVQjNq0Ad3LmKcfXxLYPQlie6QymBRU9CgWvPnQmU9YNW3vRcaYzXlDf5zGK
         iBkYKQDM6BTanCHAesuDCeGhnFpa2ZowBqPYTml16CUd2+O15v5wsT6cveJwoqmF8CW8
         h0HfBZNFXtMwqWwyYMJSUdqn1BfLD8pZSZTcHMI8By/yzItKQB6xJrffJGRrtRZ4+L9v
         ZT05TsuLk0jaJP1yfvVCxxIz35gDfSZzhEDPnlsLTg5plULU5US3BsDMYdswsCXEJ6GO
         XvaQhJWSwaX4TsjwRTdHjGGn8lP3+TNR5q/VjVjJm5S8Wh806CvafZKa6FDaBcZEFwpp
         Encg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2tCCje/5pOyO5VnTjmGeAPKEpXwqTjK1CxJlREHoLc=;
        b=fmzN7DOKjrpGJ9pI75Ts/vB2SsOd8PT0YWSKTcmlQSAnGBOcrLpIIP1d7Th50A1BNU
         mW5VoUesC0FBnT7/EWjMpgn+v5H2KmOPu25Pqby08hmBT4qiGVsQPI5DgzXh/xm7+x4P
         e+ZYbYBrfY+oJ2nB/KTxqKW1LMuA7098TtKXOGQv6iJlmZZ5UgcnJ/IOefZI7Zyl5IIA
         bR+t7GqAsroia+8cTmVSVWnUYnclK7lrFhMF8B26K0w1zYXILmlT76cfVIuCsSjKXYf2
         nzNVNueke19VmCoOZ3hUCCbQai9iWcKS5ezivkpSnVwIduGMOV+Tde2UFaVz5T3mC2Um
         QQlg==
X-Gm-Message-State: AFqh2koKyeEgmRYE4Zy+7AGYcwTXt88FXGfN+WcrfkgGbhydkk7zPW+v
	tdmOIIxTJTuoiFjDBsOLzdFzbdr8ldU=
X-Google-Smtp-Source: AMrXdXuMJ72KATZjKKGdUxfwU1BnmbdJhYoDO22X+Eb8X1jmyzmFoSUv42Aa7I3d+0m8g/hjK7t9hHqafUo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:12cf:b0:194:b631:69ac with SMTP id
 io15-20020a17090312cf00b00194b63169acmr838250plb.39.1674161473999; Thu, 19
 Jan 2023 12:51:13 -0800 (PST)
Date: Thu, 19 Jan 2023 20:48:54 +0000
In-Reply-To: <20230106103600.528-1-pdurrant@amazon.com>
Mime-Version: 1.0
References: <20230106103600.528-1-pdurrant@amazon.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <167409095498.2375862.15711695818147385057.b4-ty@google.com>
Subject: Re: [PATCH v7 0/2] KVM: x86/xen: update Xen CPUID Leaf 4
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, x86@kernel.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	Paul Durrant <pdurrant@amazon.com>
Cc: Borislav Petkov <bp@alien8.de>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="utf-8"

On Fri, 06 Jan 2023 10:35:58 +0000, Paul Durrant wrote:
> Patch #2 was the original patch. It has been expended to a series in v6.
> 
> Paul Durrant (2):
>   KVM: x86/cpuid: generalize kvm_update_kvm_cpuid_base() and also
>     capture limit
>   KVM: x86/xen: update Xen CPUID Leaf 4 (tsc info) sub-leaves, if
>     present
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/2] KVM: x86/cpuid: generalize kvm_update_kvm_cpuid_base() and also capture limit
      https://github.com/kvm-x86/linux/commit/e3ac476711ca
[2/2] KVM: x86/xen: update Xen CPUID Leaf 4 (tsc info) sub-leaves, if present
      https://github.com/kvm-x86/linux/commit/509d19565173

--
https://github.com/kvm-x86/linux/tree/next
https://github.com/kvm-x86/linux/tree/fixes

