Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFB9B1230A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 19:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058300.1425931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMJN-0006rf-4f; Fri, 25 Jul 2025 17:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058300.1425931; Fri, 25 Jul 2025 17:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufMJN-0006pJ-1B; Fri, 25 Jul 2025 17:34:25 +0000
Received: by outflank-mailman (input) for mailman id 1058300;
 Fri, 25 Jul 2025 17:34:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kfLl=2G=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ufMJK-0006nY-SO
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 17:34:22 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98c64496-697d-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 19:34:20 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so2001291f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 10:34:20 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b778f036c8sm447304f8f.49.2025.07.25.10.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 10:34:19 -0700 (PDT)
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
X-Inumbo-ID: 98c64496-697d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753464860; x=1754069660; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dokkoXBEKyUDeD/ScNzfSMoSMKnknG1JnB1ur0echJE=;
        b=oE1iDhlL47rOWezRSAplsQymYHchoAOiHPc4CufF4EWvXzcoZexHVATjobmr/BKqjm
         zMP3hhPuhmlwIo58ACtrk+iAEMn4oV8XEi+RqjibGADdsat9kAAl0DqFW3T+rcq29IEn
         C0q1dQeZjqRxtFSDUNKKn5kC4faTJa6tVNbsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753464860; x=1754069660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dokkoXBEKyUDeD/ScNzfSMoSMKnknG1JnB1ur0echJE=;
        b=lTSOKjh6oNSwHKDQO7wQqFXWLVkDb0xgl8A54uOSf4BMq4uv3u0xQchRmoQSzMF5nP
         yIb22Ja1V8ce2TYa1ng5BOhVrshltjPUd0UWVOhdIPT33JEJpkBsdFh0adQXQNzDwn23
         F3i+KDyaOR5JFMWUGVffEwIj5ER2FSpSEmUadZQ/nFrRiAkSXz7sHf+MpUI5iVEhyfm/
         CqG6q7sanBNeHMLkmj1rHSAFbAYY07F4QSAjcVbz3FAoVO5bVzBQ3IqqY6DNWIsPETWn
         h4/1s2i9YXuF6yjf716TsclblGEBHhBkUZbHVl4S0tupuotNe0JR7R7amlbCIpGvK+pt
         LrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWojaW0UUgyWmFJaxo9wVvSydsDsL+vsy9X9M7Hx66wRd/D3ZJvdkN9VbNupOxLQnvsOKycMsqrKYE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1eIb3c6uL54ZIJsaEioSmlJUeXgJQuTJj0r3Qg3SS66nZgy2d
	5sd8K91z7quHhe954e0Yt7yekUJHY1t/1AqRSb7kT87a4isLk9L26GntdbyEmaFX2Hs=
X-Gm-Gg: ASbGncs+wjcjNiDZgpRn3HFVnmrvt8GYoV7e2xvU3TJ3ktN0cLDS/qtdKdWEH9qlpl8
	yjKc4W+taw+xZ9Ea3cN/dk1cRbbnATuf4nPQgWNKrd4FIhtguqrqxieQ1rkzev9zquGlqmVVNVt
	TPGcOcqAnBhpBrndO536+G9BVxv1NfVW/ywXLiDr2j4SUXE9Sxql7TqdLzPn6o1ZDmESelNO4t3
	oBDXxyfebVrRX2BXbiyH9EgQTQn/Wj56qlm0wZX2YShmRuFllKkJBjy8f6TfiQNbR3kdkqA0uDB
	uzA+Fj8HQFao51cm9FNcwh4tjXz4nnQeMFo/PY6ymJpTeiMG5ZDqIB8SjwJjztE7VZT8zFLOjET
	OIRac7dtVXQI/HdCMH5E6pCVDfqt6MMFbrx4nfRc9boI0TwYvkeGja7wbdz128wn5NyAIvLx0SF
	5B
X-Google-Smtp-Source: AGHT+IGz30qH5xAgVw30OBj/grgnweDPj1XVdtOzgkVAEWL72vnGml1gjDphjb192JyRgCdZYWnokg==
X-Received: by 2002:a5d:5f93:0:b0:3b5:f0aa:b1e5 with SMTP id ffacd0b85a97d-3b77672df06mr2016273f8f.19.1753464859784;
        Fri, 25 Jul 2025 10:34:19 -0700 (PDT)
Date: Fri, 25 Jul 2025 19:34:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 7/8] x86/public: Split the struct cpu_user_regs type
Message-ID: <aIPAGmasLVitVXxB@macbook.local>
References: <20250311211043.3629696-1-andrew.cooper3@citrix.com>
 <20250311211043.3629696-8-andrew.cooper3@citrix.com>
 <8edba542-9844-409e-bbf0-5ff1c9287a10@suse.com>
 <eaaf2aef-129a-45ce-b5e7-ae884c2385f3@citrix.com>
 <fdbb0485-ec42-41c2-8fa5-d0560e0a10a4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdbb0485-ec42-41c2-8fa5-d0560e0a10a4@suse.com>

On Mon, Mar 24, 2025 at 10:47:29AM +0100, Jan Beulich wrote:
> On 21.03.2025 16:11, Andrew Cooper wrote:
> > On 17/03/2025 12:15 pm, Jan Beulich wrote:
> >> On 11.03.2025 22:10, Andrew Cooper wrote:
> >>> In order to support FRED, we're going to have to remove the {ds..gs} fields
> >>> from struct cpu_user_regs, meaning that it is going to have to become a
> >>> different type to the structure embedded in vcpu_guest_context_u.
> >>>
> >>> struct cpu_user_regs is a name used in common Xen code (i.e. needs to stay
> >>> using this name), so renaming the public struct to be guest_user_regs in Xen's
> >>> view only.
> >>>
> >>> Introduce a brand hew cpu-user-regs.h, currently containing a duplicate
> >>> structure.  This removes the need for current.h to include public/xen.h, and
> >>> highlights a case where the emulator was picking up cpu_user_regs
> >>> transitively.
> >>>
> >>> No functional change.
> >>>
> >>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > 
> > Thanks.
> > 
> >>> cpu_user_regs_t and the guest handle don't seem to be used anywhere.  I'm
> >>> tempted to exclude them from Xen builds.
> >> I concur. We can always re-expose them should they be needed somewhere.
> > 
> > It's actually a little ugly to do.
> > 
> > #ifdef __XEN__
> > #undef cpu_user_regs
> > #else
> > typedef struct cpu_user_regs cpu_user_regs_t;
> > DEFINE_XEN_GUEST_HANDLE(cpu_user_regs_t);
> > #endif
> > 
> > and I don't particularly like it, given the complexity of #ifdef-ary
> > around it.  Thoughts?
> 
> It's not really pretty, but I'd be okay with this.
> 
> >>> --- /dev/null
> >>> +++ b/xen/arch/x86/include/asm/cpu-user-regs.h
> >>> @@ -0,0 +1,69 @@
> >>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> >>> +#ifndef X86_CPU_USER_REGS_H
> >>> +#define X86_CPU_USER_REGS_H
> >>> +
> >>> +#define DECL_REG_LOHI(which) union { \
> >>> +    uint64_t r ## which ## x; \
> >>> +    uint32_t e ## which ## x; \
> >>> +    uint16_t which ## x; \
> >>> +    struct { \
> >>> +        uint8_t which ## l; \
> >>> +        uint8_t which ## h; \
> >>> +    }; \
> >>> +}
> >>> +#define DECL_REG_LO8(name) union { \
> >>> +    uint64_t r ## name; \
> >>> +    uint32_t e ## name; \
> >>> +    uint16_t name; \
> >>> +    uint8_t name ## l; \
> >>> +}
> >>> +#define DECL_REG_LO16(name) union { \
> >>> +    uint64_t r ## name; \
> >>> +    uint32_t e ## name; \
> >>> +    uint16_t name; \
> >>> +}
> >>> +#define DECL_REG_HI(num) union { \
> >>> +    uint64_t r ## num; \
> >>> +    uint32_t r ## num ## d; \
> >>> +    uint16_t r ## num ## w; \
> >>> +    uint8_t r ## num ## b; \
> >>> +}
> >> Can we try to avoid repeating these here? The #undef-s in the public header are
> >> to keep external consumers' namespaces reasonably tidy. In Xen, since we don't
> >> otherwise use identifiers of these names, can't we simply #ifdef-out those
> >> #undef-s, and then not re-introduce the same (less the two underscores) here?
> >> Granted we then need to include the public header here, but I think that's a
> >> fair price to pay to avoid the redundancy.
> > 
> > Breaking the connection between asm/current.h and public/xen.h is very
> > important IMO.  Right now, the public interface/types/defines are in
> > every TU, and they absolutely shouldn't be.
> 
> Hmm, that's a good point. Nevertheless I wonder if we still couldn't avoid the
> unhelpful redundancy. E.g. by introducing a separate, small public header with
> just these. Which we'd then pull in here as well.
> 
> > Sadly, the compiler isn't happy when including public/xen.h after
> > asm/current.h, hence the dropping of the underscores.
> 
> Even if the ones here are #undef-ed after use?
> 
> > I did have half a mind to expand them fully.  I find them unintuitive,
> > but I also didn't think I'd successfully argue that change in.
> 
> Roger - do you have an opinion here? I like these wrappers, yet then I also
> understand this is code that's pretty unlikely to ever change again. Hence
> fully expanding them is an option.

Hm, I don't have a strong opinion TBH, as I haven't done much work
that required touching those.  I think the proposal is fine, we can
always fully expand later if needed.

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

