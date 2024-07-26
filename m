Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB12393CEDD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 09:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765284.1175876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFQA-0006CK-KE; Fri, 26 Jul 2024 07:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765284.1175876; Fri, 26 Jul 2024 07:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sXFQA-0006Ad-HZ; Fri, 26 Jul 2024 07:31:22 +0000
Received: by outflank-mailman (input) for mailman id 765284;
 Fri, 26 Jul 2024 07:31:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bxzg=O2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sXFQ9-0006AV-0d
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 07:31:21 +0000
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0aa34778-4b21-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 09:31:16 +0200 (CEST)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6b5d3113168so2131126d6.2
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2024 00:31:16 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3f8db083sm14421536d6.19.2024.07.26.00.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jul 2024 00:31:14 -0700 (PDT)
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
X-Inumbo-ID: 0aa34778-4b21-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721979075; x=1722583875; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7T1RPparR4n0DFQfHklUcgedcAh9YksCWJn3yX0zJvk=;
        b=qoZzxzXmRC5My7yYcE5yIze+7pBifp+Z7kpGFLOLGRmBtYJshffbO3MrJb7xOZ2/se
         AFE+fb2lC/1GAJSDG3hLFwx/OP+87q5IrPTHVr+tMyI/g/LuNEMrmbYeg+r2t3ETlKYj
         BCJ399i++1yH2/oG8zUbL5ViV3FAtuNM4m9n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721979075; x=1722583875;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7T1RPparR4n0DFQfHklUcgedcAh9YksCWJn3yX0zJvk=;
        b=Jq04eE5lZOYGgsRUOr9xBLHGtRCUZjFtNBHcxeQLm8lXpOmlK0Ioh2eZ/qQGtpYTi6
         SMP9w1ai0fEI4j+CeNsDOFkSruvMEXx2WZMECAlEeY2z73C3Xc4/g+0gOrtWfHZnB+8z
         am3AJJXWnneT/NDXC0XZa5iXmaLHZJeW62LCRai/hp/92BPDZ7yRs7TF1HoCFERE9g7z
         Q9kuh3EsHIBQsXowDfmNShkaVsk9/jlDwUpbXeDCfEidGYC2ySezT2SCw8zdyOchirbJ
         xv5IG10v5glqZhaFYZmp0FKluI2UTKhFMcF3nOIHm0f8cEbnhVXjApJgXTEy2cx9+G8b
         NI7w==
X-Forwarded-Encrypted: i=1; AJvYcCWKzngcS+s+xOj/8T3YRxGUWBEIeV8KmJSWy/WfPSH/Scy3vkl+doHjrEWILP/uLoz1nqR9fdpqMeTmlOLdi3Q5RRV6C+f4ObrC3/frM80=
X-Gm-Message-State: AOJu0YyTi9stwI/irBvLZnDK0n6IwYBN7TWYkyoxbVHaWDEYXyv0nfzj
	wRtjZGyQA+c1giffwxbdIHYCy0lbgGnbZ3ypCwC5Zi64tLqaFl4Opxjlcvv6FAA=
X-Google-Smtp-Source: AGHT+IFmK3OyqU+nLG8U9CJYDyASW/TI1jsxGYMl44GGd3iqexf1uI14A86b4jAagDM2IRqPJnIYJA==
X-Received: by 2002:a05:6214:300b:b0:6b7:9bdd:c5ac with SMTP id 6a1803df08f44-6bb3cb30bf8mr52290766d6.54.1721979074907;
        Fri, 26 Jul 2024 00:31:14 -0700 (PDT)
Date: Fri, 26 Jul 2024 09:31:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
Message-ID: <ZqNQwM3U8S5q-kg5@macbook>
References: <20240725105634.16825-1-roger.pau@citrix.com>
 <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>
 <ZqJnPvL1ilDDzM9V@macbook>
 <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a638b0e1-07a3-495c-b3b9-e450a50f9429@suse.com>

On Thu, Jul 25, 2024 at 05:00:22PM +0200, Jan Beulich wrote:
> On 25.07.2024 16:54, Roger Pau Monné wrote:
> > On Thu, Jul 25, 2024 at 03:18:29PM +0200, Jan Beulich wrote:
> >> On 25.07.2024 12:56, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/include/asm/alternative.h
> >>> +++ b/xen/arch/x86/include/asm/alternative.h
> >>> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
> >>>   * https://github.com/llvm/llvm-project/issues/82598
> >>>   */
> >>>  #define ALT_CALL_ARG(arg, n)                                            \
> >>> -    register union {                                                    \
> >>> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> >>> -        unsigned long r;                                                \
> >>> +    register struct {                                                   \
> >>> +        typeof(arg) e;                                                  \
> >>> +        char pad[sizeof(void *) - sizeof(arg)];                         \
> >>
> >> One thing that occurred to me only after our discussion, and I then forgot
> >> to mention this before you would send a patch: What if sizeof(void *) ==
> >> sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
> >> get rid of.
> > 
> > I wondered about this, but I though it was only [] that we were trying
> > to get rid of, not [0].
> 
> Sadly (here) it's actually the other way around, aiui.

The only other option I have in mind is using an oversized array on
the union, like:

#define ALT_CALL_ARG(arg, n)                                            \
    union {                                                             \
        typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
        unsigned long r;                                                \
    } a ## n ## __  = {                                                 \
        .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
    };                                                                  \
    register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
        a ## n ## __.r

Regards, Roger.

