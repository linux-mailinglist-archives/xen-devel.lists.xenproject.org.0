Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9FA0938E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 15:33:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869735.1281196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG4X-0002lY-DJ; Fri, 10 Jan 2025 14:33:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869735.1281196; Fri, 10 Jan 2025 14:33:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWG4X-0002iS-AV; Fri, 10 Jan 2025 14:33:13 +0000
Received: by outflank-mailman (input) for mailman id 869735;
 Fri, 10 Jan 2025 14:33:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J0bo=UC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tWG4W-0002hC-P8
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 14:33:12 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d18dfb01-cf5f-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 15:33:11 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so309878866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 06:33:11 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c963d420sm169983366b.167.2025.01.10.06.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 06:33:10 -0800 (PST)
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
X-Inumbo-ID: d18dfb01-cf5f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736519591; x=1737124391; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9rn8CVGsxA2rBOmcskWsCpwJ6ED/zH2v5Bnl7e194M=;
        b=WLhNQ+FYIgCtdBF51t68isjgiaK+JSspbz3KBhr08smcSMfU08l+QtIcMwwMc5Ou2T
         G1iyARpH9EBvcynv3bonMVs02QjRBzCaVTR8oBWcqq62cC4TbA74Ll3gZ8pxyRfLV+fm
         vjnwZO1XfaearapZjZXJtQvruWt2uGV8If404=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736519591; x=1737124391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9rn8CVGsxA2rBOmcskWsCpwJ6ED/zH2v5Bnl7e194M=;
        b=hDv9dI/JXVaL2Q0SlWjljlZ78nN8glkRYrvpNv2OfIcY9eGKZs5ldgPefRfVxhDfGn
         jR+3/z2IleGyTIh2kJEfNx6/oeVjGXi+5VMWwLUZtJVmI2oYpU0Rh5VPD0aYUisnb7r6
         mc+CAVcykWykTUfuKyp8zLYtKZORKZCH2TN4UX5P01RRglh13y3149Og5px44uv+1xiU
         BpZzLTjYNjSWW9aTxj3mNxDBr1/wAwoZCFqkSm4AHZOs6uAMLlfiXfIxibmstFSmTCyh
         0R2e3ybj7yzalE6dDql4mSWd/j74SyZ3W9Fho4HPa1IV69ZgNkgboINCJZPTM45/LEaT
         Kq7A==
X-Gm-Message-State: AOJu0YxpJ4AJS1LifN5ogR25iELWHLLOXaMZ/oDdtFRtGmYE7tSgQyYp
	5ClxK9QdtjxZ7mPqKekPEPj1juCBgNJFsLIrRcgdIJTZ/zRYq1gJ6SDT15rNDU8=
X-Gm-Gg: ASbGncsJ8GuiAoQNjP+BY63Oer+FYYCt4qVa+cLcd7Nhh6EjiNEx7DDCBGPlWpFlP+S
	wANpNfb23/9sVPoLmfHWr9BqPgaNgI24as6WXCueJmn9MMPzYY+bCCq2hdWqvLVY8lxQ8fETu3F
	8Yd0ZEL7M31L7j6qUqPR6uomGarjRd4foC+nMaXCEkTrnAD7oSwUa5pkrvivhCc73qPfUF8vmEG
	sSx5iN53jFfc+ZnHCh+WjbiHgCNYN6Ko+9KU+Vc5W4asG0G6iEYLeOzIow/0oa5gPI=
X-Google-Smtp-Source: AGHT+IGW2oi1c7mDJHqFs9oR9kjZVN69KH2hxm2KTrcdGl4An90nQCuP9Z6q5rLeUCkCKTBbo3Wzag==
X-Received: by 2002:a17:907:3d9f:b0:aae:ef24:888d with SMTP id a640c23a62f3a-ab2abc92349mr1000031566b.55.1736519591103;
        Fri, 10 Jan 2025 06:33:11 -0800 (PST)
Date: Fri, 10 Jan 2025 15:33:09 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2.1 06/18] x86/pv: set/clear guest GDT mappings using
 {populate,destroy}_perdomain_mapping()
Message-ID: <Z4EvpVHOy9jyGy9M@macbook.local>
References: <20250108142659.99490-7-roger.pau@citrix.com>
 <20250108151133.858-1-roger.pau@citrix.com>
 <D6XGXLZ2SKUR.3CW1GPXWK3LFC@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <D6XGXLZ2SKUR.3CW1GPXWK3LFC@cloud.com>

On Thu, Jan 09, 2025 at 10:25:50AM +0000, Alejandro Vallejo wrote:
> On Wed Jan 8, 2025 at 3:11 PM GMT, Roger Pau Monne wrote:
> > The pv_{set,destroy}_gdt() functions rely on the L1 table(s) that contain such
> > mappings being stashed in the domain structure, and thus such mappings being
> > modified by merely updating the L1 entries.
> >
> > Switch both pv_{set,destroy}_gdt() to instead use
> > {populate,destory}_perdomain_mapping().
> 
> nit: s/destory/destroy
> 
> How come pv_set_gdt() doesn't need to be reordered here (as opposed to v2)?

In a previous version (that I've never published)
populate_perdomain_mapping() was using v->arch.cr3 as the root pointer
in which to do a page-walk and modify the requested entries.  That
required v->arch.cr3 to be valid when populate_perdomain_mapping() was
called, and hence needed the reordering.

Since populate_perdomain_mapping() no longer uses v->arch.cr3 it
doesn't matter whether the vCPU c3 is valid when calling
populate_perdomain_mapping().

Thanks, Roger.

