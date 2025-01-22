Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F0EA18F9C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2025 11:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875862.1286278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXtw-0000Bp-CA; Wed, 22 Jan 2025 10:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875862.1286278; Wed, 22 Jan 2025 10:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taXtw-00009x-8v; Wed, 22 Jan 2025 10:24:00 +0000
Received: by outflank-mailman (input) for mailman id 875862;
 Wed, 22 Jan 2025 10:23:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYzQ=UO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1taXtu-00009o-N5
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2025 10:23:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc7faff4-d8aa-11ef-99a4-01e77a169b0f;
 Wed, 22 Jan 2025 11:23:56 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-437a92d7b96so66206925e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2025 02:23:56 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b318c059sm19606175e9.8.2025.01.22.02.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 02:23:55 -0800 (PST)
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
X-Inumbo-ID: fc7faff4-d8aa-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737541436; x=1738146236; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLcwpP7Zz4xxiGaVQcgn7KerB+Yi5fPr3kurnqDBUq8=;
        b=Nw1dtYylIdLr/HBSHIS52POr8lnAqFFAnx7eFeof+PHH/W1HSJT4JWi42rqNW77UdI
         2dY2dIus28JAbsy83vhI8VeGUK/oe4iP84o5f8WHXO3kKznk3oSKen5aY1Us/X5whmLL
         yj/RC7DiEY+YIX7aenbDpjTIWg1IVF52c+be8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541436; x=1738146236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FLcwpP7Zz4xxiGaVQcgn7KerB+Yi5fPr3kurnqDBUq8=;
        b=HOy7hhtDChQIVg+uvzV6WJ0i3ReJcZYBUeKpGiLT4DInumY926PV7jxsMe8n04W9jn
         bKvFrUBybFCfjKQ+GVSlUk8UfLBCjyuNDGmVshkE0MAk4eXkZiHVgGNY8nsf6Aa+uCwd
         5d3k0hPlfH6q8qJQE+vDmgs4hnmu4CZuHkm+Yb7BKKzFdUXATsuFKNGmmGxnVYp+fsFa
         2Gs6QPx9trAN21TdIE6Er0xqBJ7sNIkXPULFI7bMvnS48Dg015kzQg/71FZ3YkBWSphV
         Q1sUfzdXcFSgLLIxSmK9yVD2INN4F+hGm9xwJLF7IyoWizAqDjSLChaee3zQ07fqJqo1
         EN/w==
X-Gm-Message-State: AOJu0YwqMhW5+/oppE6jvH3518ldY7YSJuQBOXIGhzVq8/vA13msYpCZ
	Mqk5AbUWHIhlwmA9wvOxWpMu3p4vZhNI+5OT78ry9HyZQrSnoYbMCTEnplWOl0A=
X-Gm-Gg: ASbGncvTbEoILXL5m3bmQdHi9/TN3iYozu9ahnVL0SA/aA+1tj2/C7xjx3LZYs53QNG
	B2fOjHF5yeKIg+e97s5t/sVyLt9U3SuSTMvt9tCwbWOa16rV3OWbw/gFpTjHV8yvye6vXozOqSW
	dcpsA8fkcPjSFRwpgkEXNWLxpN/qC9APSHJeb7EH+RLp85tkLV8puc0Vop8NZnM8iEorMNuNLB4
	+MBikW6Jp3JkF4AgDeklCHDjnPbgIvo1VhCr9xagB6S/bMZpfzeKdsxjsk4jJ7hWDugvfZncuA=
X-Google-Smtp-Source: AGHT+IE98PFtbN2cemTu0C8JTlVwZnRETr+CNiItbJ830J/cDg5kGb2/ApLZ/TLbwh/qDPthQ+IP0g==
X-Received: by 2002:a7b:cd0a:0:b0:438:a1f5:3e38 with SMTP id 5b1f17b1804b1-438a1f53e8fmr165716365e9.30.1737541436004;
        Wed, 22 Jan 2025 02:23:56 -0800 (PST)
Date: Wed, 22 Jan 2025 11:23:54 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] x86emul: further correct 64-bit mode zero count
 repeated string insn handling
Message-ID: <Z5DHOknjrhMoAGz6@macbook.local>
References: <2e81cf29-65fd-74fc-db4f-95c453acc327@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e81cf29-65fd-74fc-db4f-95c453acc327@suse.com>

On Fri, Aug 04, 2023 at 07:58:21AM +0200, Jan Beulich wrote:
> In an entirely different context I came across Linux commit 428e3d08574b
> ("KVM: x86: Fix zero iterations REP-string"), which points out that
> we're still doing things wrong: For one, there's no zero-extension at
> all on AMD. And then while RCX is zero-extended from 32 bits uniformly
> for all string instructions on newer hardware, RSI/RDI are only for MOVS
> and STOS on the systems I have access to. (On an old family 0xf system
> I've further found that for REP LODS even RCX is not zero-extended.)
> 
> Fixes: 79e996a89f69 ("x86emul: correct 64-bit mode repeated string insn handling with zero count")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Partly RFC for none of this being documented anywhere (and it partly
> being model specific); inquiry pending.

Did you get any reply on this?

Thanks, Roger.

