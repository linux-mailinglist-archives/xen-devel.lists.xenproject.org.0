Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04335A67A09
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 17:48:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919503.1323933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tua6c-0000VI-7X; Tue, 18 Mar 2025 16:47:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919503.1323933; Tue, 18 Mar 2025 16:47:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tua6c-0000TA-4k; Tue, 18 Mar 2025 16:47:54 +0000
Received: by outflank-mailman (input) for mailman id 919503;
 Tue, 18 Mar 2025 16:47:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mYbn=WF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tua6b-0000T4-0f
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 16:47:53 +0000
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [2607:f8b0:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba1c68b5-0418-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 17:47:50 +0100 (CET)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2260c91576aso45399645ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 09:47:50 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d9443c01a7336-225c6bbcbbdsm96776195ad.170.2025.03.18.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 09:47:48 -0700 (PDT)
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
X-Inumbo-ID: ba1c68b5-0418-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742316469; x=1742921269; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XgPmtqkoJuaaf+SaiUc1v/lEB8pQfhrRoloS+/n8Sn0=;
        b=qGij20nRXKEpvbOCwXJx0eUKcrfbuawnqMVGksZH81E9i3JqoUqUnAHbBDgcgV7vp7
         2u/GK9Y0cleQCAhdJ56KHwwrxNqab9Ad6oH0I/xisYAiYPlhIZlZGifsLSo+ZhHxxtjb
         dalU0LjJH2Nj+QTL11OJV+qcvtlB5af3eg+HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742316469; x=1742921269;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgPmtqkoJuaaf+SaiUc1v/lEB8pQfhrRoloS+/n8Sn0=;
        b=oK/WqgFuZsL+peje0slrpnIJ9H/2OeEFEzX48+akNzjPln68MlKT8RwB7Nj6I/EP39
         RvGmy3/AlhnfCSLU6z7BEB+jLwADQHYTXKqt8hmnUdU2lBadPok8ebCeEPJVKJsmtzi0
         VWbVP6oDYkqldQAGkt/B8CT2KgxbQfaCNcCd8t2Yf3S8d6Z3fs9VP8R2n5YLoPUhozB1
         ni4FV9HVoq+8Tuteh/26A38Cgo5mEBYkX/1F6I5Ne7e4FznOe6EbRuBy1VePCYMWqAWf
         gRJffaPdSWDQzXjUMC10QYAPJrHgGDJ3vVxgBRkTdbEVG9Yy3W2xRRsjPJuO0J4LDKt1
         Qffw==
X-Forwarded-Encrypted: i=1; AJvYcCUxyjYns7e3gDecOAGis9MAZS/od75ay9/j03GNk3CvEtbJxdYwglIVYZFn2lKAFeXLVZ+qysnNp8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNY9NKivRCgm5fMrTLyQNNVxp0B0NqZqOalitmY81f9NwIQosj
	Qf1Ujne6hyFXVy7Ipo50wMQORdUC9k02/Iq7kHSdCseNerQkwvwIwmdIweHlqlY=
X-Gm-Gg: ASbGncsMJAldyoD1YmO8tH64el1aufytwb9KEvvzfw6uwS5Mes++gxhUu1RuDgBX2o5
	fzF3qjOZEmUoXJjbAY2HHO9WUawTmgTpLU2ItvOk3UrhVcFW9jLyiDo7JsJ+614pWQQlLYCNNdZ
	S8uBegR5JbxXpK24AvAT8MZ3MIr5fKof1iYwB/VBRKyMZRqmw57Q+vBnX+Du/YsL5J/L6YYajAW
	KOBlb3NWV2lkP+iBiXLzXmLEiNRmanPjA52TxvWqcjJOyV428VnZ0mvcz0CkDJ7cRsuwlDlE+D3
	hvTbVmjH8sfSVFi9rKpBmV0W+MGeUvch++CXsiMExargXyZrZHEAKjc=
X-Google-Smtp-Source: AGHT+IE/fapVIabzK+EHsH/K2ZvdL1rXuqFLVVBH+0owuRCRBBQelhKte3SdVUzZICeTCeNm1+cGmA==
X-Received: by 2002:a17:903:fa6:b0:224:194c:694c with SMTP id d9443c01a7336-225e0a8f166mr223706795ad.28.1742316469055;
        Tue, 18 Mar 2025 09:47:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 17:47:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
Message-ID: <Z9mjsLFkCCxMR84Z@macbook.local>
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
 <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
 <Z9mSub1DgzoP71-v@macbook.local>
 <06e00c30-90d4-42a1-a1d7-fadd63b9377e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06e00c30-90d4-42a1-a1d7-fadd63b9377e@suse.com>

On Tue, Mar 18, 2025 at 04:50:58PM +0100, Jan Beulich wrote:
> On 18.03.2025 16:35, Roger Pau Monné wrote:
> > On Tue, Mar 18, 2025 at 03:33:03PM +0100, Jan Beulich wrote:
> >> On 18.03.2025 10:19, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
> >>> +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
> >>> @@ -9,9 +9,9 @@
> >>>   * a secondary mapping installed, which needs to be used for such accesses in
> >>>   * the PV case, and will also be used for HVM to avoid extra conditionals.
> >>>   */
> >>> -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
> >>> -                                   (PERDOMAIN_ALT_VIRT_START - \
> >>> -                                    PERDOMAIN_VIRT_START))
> >>> +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> >>> +                                   (PERDOMAIN_VIRT_START - \
> >>> +                                    PERDOMAIN_ALT_VIRT_START))
> >>
> >> Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
> >> and PERDOMAIN_ALT_VIRT_START? Would
> >>
> >> #define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
> >>                                    PERDOMAIN_VIRT_START + \
> >>                                    PERDOMAIN_ALT_VIRT_START)
> >>
> >> perhaps be less fragile?
> > 
> > PERDOMAIN_{ALT_,}VIRT_START are unsigned long, so this might work.
> > 
> > Note however that even with your suggestion we are still dependant on
> > ARG_XLAT_START(v) > PERDOMAIN_ALT_VIRT_START, or else the '-' won't
> > work.  I think I prefer my proposed version, because it's clear that
> > PERDOMAIN_VIRT_START, ARG_XLAT_START(current) >
> > PERDOMAIN_ALT_VIRT_START.
> 
> What makes that clear? Can't we move PERDOMAIN_ALT_VIRT_START pretty
> much at will?

We would need to adjust the calculations here again, if
PERDOMAIN_ALT_VIRT_START > PERDOMAIN_VIRT_START the subtraction would
lead to an underflow, and would also be UB pointer arithmetic?

Thanks, Roger.

