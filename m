Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A34AA18EA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 20:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972998.1361242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9pKy-0007Hd-RE; Tue, 29 Apr 2025 18:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972998.1361242; Tue, 29 Apr 2025 18:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9pKy-0007FP-OR; Tue, 29 Apr 2025 18:05:44 +0000
Received: by outflank-mailman (input) for mailman id 972998;
 Tue, 29 Apr 2025 18:05:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0E=XP=linuxfoundation.org=torvalds@srs-se1.protection.inumbo.net>)
 id 1u9pKx-0007FJ-6Y
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 18:05:43 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dfb3f55-2524-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 20:05:38 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso624907766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 11:05:38 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ecf9a27sm822737466b.109.2025.04.29.11.05.36
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 11:05:36 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ace94273f0dso624899166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 11:05:36 -0700 (PDT)
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
X-Inumbo-ID: 8dfb3f55-2524-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745949937; x=1746554737; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mga3Rq70LqXw/l3aYagru3Xh65JFPJSy1XpGB2clVXE=;
        b=iAEL9Cs4ZMvjKBFFN90HlnpfJykFmSVoK0vQtYGf0amEuoSellaPdgVlD4H6+ScrjI
         wlsBFAVFr47C+OKa4AFkA/SKS9TM8twlCkZnQdllrInqbLO7w+yqsf8bN36UXTxkmjyu
         /1Rl+vke85OrSeP2ZAJNDaYwyn1gR3IFkRw1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949937; x=1746554737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mga3Rq70LqXw/l3aYagru3Xh65JFPJSy1XpGB2clVXE=;
        b=c3JflFFh7cQsNMbAFDKpLcaBgwQHwLOo/VWemHYcHrhnS/AN7hR2m+QG4A3xhDFbWs
         ohRRXrEVFK6Kh1ZYnjDMaYIny7o9M0fE9YjNK3jF2U7wdRu5RHCEzXA7q+2wDZUhG47h
         T4bzt2S+joRAnoyV8wsAcNSgYh+1N9lAuFmvhWu/V/Fo7wjyPbHazhTefhi5/G7MWSop
         piZMxrELW2JSEf+1MXHBzT2g0hXAnF6R6Bo5kmi51BZ96IcnfXbO7/G1UedQnUHYSp1w
         zUsiJgdJJNMr1mf52WuVJwlrtQo4Ku5PS/l/MctXN4pf8jTnuJfwey73m3+PmSl7zC2M
         7C9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNUqoLMFfgFJ52HdV3AiPN3fZ3eY3KS2KbeZkADRpkwoGavY38tMdAeD3oa6DLl++C+TtXXs2BK8Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmGDoESBOlUpfeqBSw5isSEM6RBGqv4O5yg0UW9PtY8wYLikKE
	K5HjH7OM1EwqRrNZInRozXphaD/158CcvnNnSQnUtrVaBnxRR+kN7z1mhY+T5r9PwM4cMMzwzRb
	ih0iCXA==
X-Gm-Gg: ASbGncvw4xFiOndzvFYNATVnQWfyYFGLZBugpRO45dMgKuTkWRXYttc8oFWVNU8u9Lr
	jmn+D0111So/SuRXfKtbqH6qTHOJUNyJ8wfpQZWFg7qAH5rNmpBybLr2Ceguii2TRqtMIJHLdMT
	LSy8VM+4lqY3DocXeeTaFqG21k7JIw0EOJowxILzAXUAj+SKJr1j/of4c2HiYGzJBUh+VC90Rxn
	IAPRVUjRAZzipsSiXAgjDBnq4juSubTCSmPfZk0ToCg1T+iz5+ylQIE+nQmp7hzAfsP/cPolU2U
	+CepeAWD0KTYRBe5EnWADWLaCM2KJ+IaJJvsmZlKWdmw9/VOfVfypljhPs3Kfdt3wGFTZT/yNwI
	a0MPGgud1VIJApEabxcXXFBZm2w==
X-Google-Smtp-Source: AGHT+IFXQ7xryeTBYT/nWuOK/FkaO0GrW2KqG0+JE9aaEUo6HLPzg8A+qsoOikMe8dsuTp6BXlkmaw==
X-Received: by 2002:a17:907:9405:b0:ac7:3a23:569c with SMTP id a640c23a62f3a-acedc56c9e1mr32083766b.1.1745949937171;
        Tue, 29 Apr 2025 11:05:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUk6RlNCuUIiHllBaxVoKh7x7xbYlxOKl6EBRq1gKIsV7HjgspxHdvsJc3N7niLyE72hiyouPnfKWc=@lists.xenproject.org
X-Received: by 2002:a17:907:60d3:b0:ace:c2d1:9761 with SMTP id
 a640c23a62f3a-acedc623882mr34288966b.27.1745949935745; Tue, 29 Apr 2025
 11:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
In-Reply-To: <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 11:05:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
X-Gm-Features: ATxdqUFTY5mdGhFc4ArUUSgC4AOenPGa8voKgtO-ChPuKuk16Y4sxjRuZZC2Fww
Message-ID: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 07:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> I tried that.  (The thread started as a question around
> __builtin_constant_p() but did grow to cover __builtin_ffs().)

Maybe we could do something like

   #define ffs(x) \
        (statically_true((x) != 0) ? __ffs(x)+1 : __builtin_ffs(x))

which uses our "statically_true()" helper that is actually fairly good
at the whole "let the compiler tell us that it knows that value cannot
be zero"

I didn't check what code that generated, but I've seen gcc do well on
that statically_true() thing in the past.

Then we can just remove our current variable_ffs() thing entirely,
because we now depend on our (good) __ffs() and the builtin being
"good enough" for the bad case.

(And do the same thing for fls() too, of course)

               Linus

