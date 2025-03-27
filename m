Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56D4A72FD0
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929065.1331700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlYu-00018s-GL; Thu, 27 Mar 2025 11:38:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929065.1331700; Thu, 27 Mar 2025 11:38:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlYu-00015g-CX; Thu, 27 Mar 2025 11:38:16 +0000
Received: by outflank-mailman (input) for mailman id 929065;
 Thu, 27 Mar 2025 11:38:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U7fn=WO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1txlYt-0000be-4y
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:38:15 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f76176d4-0aff-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:38:13 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so111659466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:38:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac3efdaccc0sm1216532166b.185.2025.03.27.04.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 04:38:12 -0700 (PDT)
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
X-Inumbo-ID: f76176d4-0aff-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743075493; x=1743680293; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y3/jpgQiTD/9GMw00etH0QwstLh1K0ffkx1YaphIPU=;
        b=TNp7CoR5Zo9xdRieA5NcQU7Kg6A+vzlOz5xGnm1bobQ+1T01tEJz6Jr5ehAMEb5Osw
         /howQxIbofmk70uqjxtlKq2gdlmfZ6WJTv/wz2el4Wt/eQbmQiKfKOEmqw3WdIdQkE5+
         LZUlgbxBXtBeHp3aknteKS+6ka6Y26C1woQiY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743075493; x=1743680293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Y3/jpgQiTD/9GMw00etH0QwstLh1K0ffkx1YaphIPU=;
        b=a2eah8K8fIiKh/HYAYmtKPyV9HDt+AGblLCT5tcCvq/M68/qiAdKrT1Og2yuSaKqxJ
         5ytiRjP1hDjoPlDuQ8QOxyhCOSlAC8k47RumyXQrrv0PswvD+vrb4XLPAzBa7ZXLBeUp
         WKgcAYCgUiXt2Vo5eBBI6iZ5sTCmt0HYpN9xJCqx4ZAhxb02CUbu3SIuQwHMnBQfBNbS
         jLD867eMe7JHIwkewmT/VgIWvQ1wiZXiyMAbXXwQV7c3drxkVno90irequHMOL5o4TVr
         nti5RrNTODZcg0LyVGyMgp2YObejTKSK0hqBHMziH8ucdqmOEJpMUqovSc8OefknxQPO
         RJSA==
X-Gm-Message-State: AOJu0YzzhFuadYFPazQdutMZElkYFELM8tB1qNYt9aQx0z5AXOTmO0pJ
	jaixBNKEp58sEpJ2OOYox/J4hLCxyZWfdsko/QFlTaN9ATilHCrfjUKBPHEmrHaNoRBjzWMDyWT
	T
X-Gm-Gg: ASbGncsQDW0xSVHGgovvnly+x96Ycf+xdMFg0R4qQ7bea6sH22nwIGv1Y75utlTWXDs
	mM039CjTLDMqyYfYblwZMy03H9Z2hLLF6ZxyDVjCrA9/iaGGZDwFUP7H3gu/sHAREgAYpszlmAl
	437WNnHrj9/a9cRPHFVpMQpoQ0/yn6K5Uvu+g6Ybqi7hoaOOablA9ds24ll0qe66upyQ21ZVhnK
	8mGYCTgE6ydCgeIzTxZwG51DmHGA0fVl1UNukxqTE4n9BN6wmysEq+W5v7SkA+QXQLT+P+9TZw7
	B+i/IGSIMw7l/lDcKucncIoBRT7/kqkBibXi4cgPVjaJb6UaRQ==
X-Google-Smtp-Source: AGHT+IE7hjlbFwvIjFuSPDCO1pHqdoCv7zZBitCFf0ZRTlDV8Xlcth+a/PIlh3CPTkq2UpNuat0tyQ==
X-Received: by 2002:a17:907:c0f:b0:ac1:de84:dec0 with SMTP id a640c23a62f3a-ac6faf03b6emr275013866b.26.1743075492739;
        Thu, 27 Mar 2025 04:38:12 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:38:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] x86/MTRR: hook mtrr_bp_restore() back up
Message-ID: <Z-U4ozL6p-Unh5Y8@macbook.local>
References: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad8ea1da-dda9-4567-8b15-55b65777e80f@suse.com>

On Thu, Mar 27, 2025 at 12:20:47PM +0100, Jan Beulich wrote:
> Unlike stated in the offending commit's description,
> load_system_tables() wasn't the only thing left to retain from the
> earlier restore_rest_processor_state().
> 
> While there also do Misra-related tidying for the function itself: The
> function being used from assembly only means it doesn't need to have a
> declaration, but wants to be asmlinkage.

I wonder, maybe the intention was for the MTRR restoring on the BSP to
also be done by the mtrr_aps_sync_end() call in enter_state()?

AFAICT that will set the MTRRs uniformly on all CPUs, by calling
mtrr_set_all() just like mtrr_bp_restore(), but later in the restore
process.

Thanks, Roger.

