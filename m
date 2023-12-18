Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A7816E09
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 13:39:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655964.1023866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCtr-0003Hn-K5; Mon, 18 Dec 2023 12:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655964.1023866; Mon, 18 Dec 2023 12:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFCtr-0003FQ-HN; Mon, 18 Dec 2023 12:39:11 +0000
Received: by outflank-mailman (input) for mailman id 655964;
 Mon, 18 Dec 2023 12:39:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W5ff=H5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFCtq-0003FK-KS
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 12:39:10 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fccf1c9-9da2-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 13:39:08 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c339d2b88so31768435e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 04:39:08 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600c198900b0040c490db950sm31553236wmq.47.2023.12.18.04.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 04:39:07 -0800 (PST)
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
X-Inumbo-ID: 6fccf1c9-9da2-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702903148; x=1703507948; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jdkKBhaUm/qQXMxDj+zOdH5N1Fpb5RPvTGS8ZYXnJl8=;
        b=WATgGqJwcPK5C9AeLhSB8tdKZLyKvfZYbUpMY5aLS4/L+XFnN2KAhvjTCarF74U0X5
         8/xiUDok8jbj4laJ6K/PQkI1M7DPk2q7LJrxlsp2oXLlFNdWRvAL9vouiGXxKWSOVlMK
         H8zfFOwBpw4o0fj3/dpbbddogv1arc7fNFR7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702903148; x=1703507948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jdkKBhaUm/qQXMxDj+zOdH5N1Fpb5RPvTGS8ZYXnJl8=;
        b=YQxkK9W7FQP9ofIoRXEMtDkkBUQZDXIwZjZbgkpVwLV1oDCXJkYGfbYY4WZcBfANAF
         F+InETu9I+aMJ9EkBXd1++ir0A2YWpTHStczBBQKvbVhcmXheGpRVtdSa5ZYbXuidxjo
         Rx6QuUq//2G4b30WzNRqRsPvj/Cf5L8n9+YdHjnqWNX6W+Ze9S4qB1YHtBkzfM+9cY8J
         LGrV8NftUR3hFRdmcy6an7yO4jHMIiBnHgHozwyjLxQt3NroDuXMrvqNrD87D5fldM3b
         TRtkCAjbRcPbQw1ZBrXcHqliMzq9I+vo/oM9LpByM5gPY7KlyIgjGc1BjlPVlb7wIiMJ
         HGBg==
X-Gm-Message-State: AOJu0YyD+427Ufxc9h7akzfEQ39Ngc5hlCrMToXJ4A9FyokyI1obsArx
	MaabnZfKXsTWG5L6VEknN0f7vg==
X-Google-Smtp-Source: AGHT+IHE2Efg3G7VL9QgT1GxU9SL60uxQutRS338pKilE6s0iG6b87xzgI63f7mZyspCIaScsKmYWA==
X-Received: by 2002:a05:600c:4d0f:b0:40c:3e43:417f with SMTP id u15-20020a05600c4d0f00b0040c3e43417fmr7912062wmp.58.1702903147658;
        Mon, 18 Dec 2023 04:39:07 -0800 (PST)
Date: Mon, 18 Dec 2023 13:39:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/4] x86/spec-ctrl: defer context-switch IBPB until
 guest entry
Message-ID: <ZYA9ap4dB5nnFCu3@macbook>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <83c2a504-bce4-d3e7-1d9a-76ac0ca17bab@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <83c2a504-bce4-d3e7-1d9a-76ac0ca17bab@suse.com>

On Tue, Feb 14, 2023 at 05:11:05PM +0100, Jan Beulich wrote:
> In order to avoid clobbering Xen's own predictions, defer the barrier as
> much as possible. Merely mark the CPU as needing a barrier issued the
> next time we're exiting to guest context.

While I understand that doing the flush in the middle of the guest
context might not be ideal, as it's my understanding we also
needlessly flush Xen predictions, I'm unsure whether this makes any
difference in practice, and IMO just makes the exit to guest paths
more complex.

Thanks, Roger.

