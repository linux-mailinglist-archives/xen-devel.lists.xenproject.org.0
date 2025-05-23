Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88F7AC1D8C
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 09:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995303.1377790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMh8-0000lJ-S3; Fri, 23 May 2025 07:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995303.1377790; Fri, 23 May 2025 07:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMh8-0000jt-P7; Fri, 23 May 2025 07:19:54 +0000
Received: by outflank-mailman (input) for mailman id 995303;
 Fri, 23 May 2025 07:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GSxL=YH=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uIMh8-0000jn-09
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 07:19:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 513eb175-37a6-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 09:19:51 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so64981175e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 00:19:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-447f6b29672sm138336565e9.3.2025.05.23.00.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 00:19:50 -0700 (PDT)
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
X-Inumbo-ID: 513eb175-37a6-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747984791; x=1748589591; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WubEsBbl7epRqvikWw8YjkhJNj7xX8Sbr3wrYsv9VoA=;
        b=OBV2wF3NPd2EJstax4NNSlfZCBFULZPTtksXHt6VuovYRn6qYhLzcwSyS7HqEidfQG
         ECo3Gf+c1VPV23H9DZwAAb6iPAMWMTAx5MbdUokk89LCR6a2agC00VbKbmHLyXxEaBwl
         DuXGZMMENfVsufGRRq41Wie+WV7YNJvoMU9kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984791; x=1748589591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WubEsBbl7epRqvikWw8YjkhJNj7xX8Sbr3wrYsv9VoA=;
        b=Pv3Q9rZNacPJad0x11voG0cEVJ3DrEDGcxQ/kllBFobq0hSlpBAkdHev013KXIU6pZ
         C68++Kq+ZhebJdDgxdYOuMBSNYC3gp1HdY0iAkDqgFxov+mxgclYy3mD8gk2pNIpcMAN
         fbTDtcb7AKWpyr49oc/pmWEQdSXlCWIagt8zScC7C5j6akzx72r+GF8T3as+aUo7u2rI
         EMm8fn3sm715+zW9K/FPXWS2Bw2+mkSF6kUQzc3yOykqVwNLFVnKf52rpz8eN+CGyGfU
         WUe/qf4WJ/gfLmK6p1TxhGKDp8vFBv7+dUD9dXQJeZHWQnYUE8X+KQ+FEPNMtVGkRH5J
         7TfA==
X-Forwarded-Encrypted: i=1; AJvYcCWdi+IUI+a3VwIC4pxtubJNJ9aI/0duQa4lISH9aV24/PDLpDbrchmH+yzSXJpziAkH0iZ/VKqT9jE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx95pTuYnHhd5lpoEakyvXkrA7U0Eq2bsaqQPRXO50BhIXXamIH
	2MI+3CY4qXNCCEmJXNuJnsl+eyfBjMG/GMwN6bhExVytweazi4dJPuDRmcbZzY2oLADCFaPiH1z
	Pqjv7
X-Gm-Gg: ASbGncvkdeA9hEkXVKIlW8iR8Tsgy2fyGR7KNcdphQ+kDR8nBlICHD+NZhjBrw+2sTf
	59oX2I+urNB0QGHXx3lhR9bhr3Y5PUpIOhOcT+8BjSkTssJk7g+lNhLYrCl1Q9+8WyhfTZSFs+U
	sD8NCBXGYgGKJa/Ggd0zKN67hhJeb0TOHEFKzlZTccsUk21MbDfIH5D2Dthn9Q6wyZE6jBQw3nF
	NG9wTcZPAlszbTIg8id+2MhOinNJ9liBrrImqmiEIdRkfttTiJCbvhRhLcAfyaNOQ0OQElZh2Xf
	BJows9HJsZ+lkBcGrDVIW8BHaXd91GlJT8G6uRRGHHrbelVaF+UVzACPVUCnsRc9u1jQZtLmTNu
	U8A7vF+coqQeXcN3m3WVUtVeMreDsxw==
X-Google-Smtp-Source: AGHT+IGxLEUvlCla7HMUlLreziIFmZleTjvp1LgzQbHS6EA2JArMY518yM8EsZHxLPIA6+A9rXvxyg==
X-Received: by 2002:a05:600c:8487:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-44b6d6b6939mr25527865e9.15.1747984791075;
        Fri, 23 May 2025 00:19:51 -0700 (PDT)
Date: Fri, 23 May 2025 09:19:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 1/4] x86/boot: print CPU and APIC ID in bring up
 failure
Message-ID: <aDAhlTgTEaJ2BkVb@macbook.local>
References: <20250522075440.99882-1-roger.pau@citrix.com>
 <20250522075440.99882-2-roger.pau@citrix.com>
 <0028ad37-95e7-4b6e-87b6-07cadcac64aa@suse.com>
 <8c1156a8-a626-4b62-9cc1-7790184b2b9b@citrix.com>
 <aC9V3-5SiBTBDsCE@macbook.local>
 <71b4666e-0efa-4020-83bb-ecaa9ede7ca9@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71b4666e-0efa-4020-83bb-ecaa9ede7ca9@citrix.com>

On Thu, May 22, 2025 at 06:22:19PM +0100, Andrew Cooper wrote:
> On 22/05/2025 5:50 pm, Roger Pau Monné wrote:
> > On Thu, May 22, 2025 at 03:39:57PM +0100, Andrew Cooper wrote:
> >> On 22/05/2025 10:10 am, Jan Beulich wrote:
> >>> On 22.05.2025 09:54, Roger Pau Monne wrote:
> >>>> Print the CPU and APIC ID that fails to respond to the init sequence, or
> >>>> that didn't manage to reach the "callin" state.  Expand a bit the printed
> >>>> error messages.  Otherwise the "Not responding." message is not easy to
> >>>> understand by users.
> >>>>
> >>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>>> ---
> >>>> Changes since v1:
> >>>>  - Also print APIC ID.
> >>>> ---
> >>>>  xen/arch/x86/smpboot.c | 6 ++++--
> >>>>  1 file changed, 4 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
> >>>> index 0189d6c332a4..dbc2f2f1d411 100644
> >>>> --- a/xen/arch/x86/smpboot.c
> >>>> +++ b/xen/arch/x86/smpboot.c
> >>>> @@ -618,10 +618,12 @@ static int do_boot_cpu(int apicid, int cpu)
> >>>>              smp_mb();
> >>>>              if ( bootsym(trampoline_cpu_started) == 0xA5 )
> >>>>                  /* trampoline started but...? */
> >>>> -                printk("Stuck ??\n");
> >>>> +                printk("CPU%u/APICID%u: Didn't finish startup sequence\n",
> >>>> +                       cpu, apicid);
> >>>>              else
> >>>>                  /* trampoline code not run */
> >>>> -                printk("Not responding.\n");
> >>>> +                printk("CPU%u/APICID%u: Not responding to startup\n",
> >>>> +                       cpu, apicid);
> >>>>          }
> >>>>      }
> >>>>  
> >>> Elsewhere I think we print AIC IDs in hex; may be better to do so here, too.
> >>> That may then want some text re-arrangement though, e.g.
> >>>
> >>> "CPU%u: APICID %#x not responding to startup\n"
> >>>
> >>> Thoughts?
> >> Definitely hex.  Elsewhere APIC_ID always has an underscore.
> > Maybe I'm confused, but I don't think Xen uses an underscore, it's
> > always 'APIC ID' when printed.  I don't mind adding it here, I assume
> > what you mean with elsewhere is other projects like Linux?
> 
> It's apic_id in plenty of smpboot.c, but fine - lets do it with a space.
> 
> We do need to reduce from $N ways of rendering this down to 1.

Oh, so it's lowercase with underscore.  Anyway, will use uppercase and
space as agreed.

Thanks, Roger.

