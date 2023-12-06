Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42A807914
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 20:59:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649419.1013940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAy34-0007aC-Nb; Wed, 06 Dec 2023 19:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649419.1013940; Wed, 06 Dec 2023 19:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAy34-0007Xj-KI; Wed, 06 Dec 2023 19:59:10 +0000
Received: by outflank-mailman (input) for mailman id 649419;
 Wed, 06 Dec 2023 19:59:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sabd=HR=gmail.com=brgerst@srs-se1.protection.inumbo.net>)
 id 1rAy32-0007Xd-TG
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 19:59:08 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9870129-9471-11ee-98e5-6d05b1d4d9a1;
 Wed, 06 Dec 2023 20:59:06 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so231268e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 11:59:06 -0800 (PST)
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
X-Inumbo-ID: e9870129-9471-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701892746; x=1702497546; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3MVaLAQQ+8IH1t0woX8XXUKr5UkxZE7+TDCaXdlmH8=;
        b=jB1FLcfG9zy3xH4cnpZt6goQ0g7t9yUAb0jX48XPgzsWHAPapz/815Srwfru6lA5E/
         D97BAEk4TKMnUE3cXSIcsRoGMCjSrm2GAfRgIx3LBmonccUTWZhLnh3+j4oHSq8cy9K1
         NbyjuwrpDAMubJgQDYMZ5seOSXKuMGS177hEg1GuzdVvDQ1oGdnI0gaBWB2aL7Zkm2OG
         BxwaS8I3txyBNoWqnSJks7XOw/waFUGc/gW+OCSJ8BQ0mbosi38KCdcYfAmOROjIP/dI
         F4tzpf8dEKDxc9ixuw6wMYgRbZOUnhWPKVqLJE4b4wXaEbajw3O4eOuIxKsZFzkV7Tkt
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701892746; x=1702497546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3MVaLAQQ+8IH1t0woX8XXUKr5UkxZE7+TDCaXdlmH8=;
        b=pD/iEA+yk/yjV2ld5EbW9RBuES37fInhU7/Acgj7C0i6txT9FewII+sKEXNHeMEcyX
         EP3R0C+vsbhHqmqgRF3QKmD2JI1H0mPIXkq4HHJAlPZqkHB7iBfIm3/zKiSBbJyFbhhZ
         a3cj1xEiDBYYQpHVyAe7lIegImBd+L2PR1VSX+KHAmj7eDyMQhZhS9LLjXnX+jDAu0fO
         iSbxQmDSE3s7OwZo+RpMD5++V+u6Ic9pLA0uSPFC/waUVa77lJ2UtdWnLdottAVrhp0F
         cERIX2sBUzUFEvbLlpgnj87A53v4+CcasYr8li/dmZJTs4gL5yySzGG1eOeoTgmtV4j3
         6t/w==
X-Gm-Message-State: AOJu0YzcBnBptky2iWkSHU693VoV8u9OVPqaJtalnYExmYQx8n75S++C
	29B1ywwotjY7TLrK0XcT6Smoie+yCsJdnNtztA==
X-Google-Smtp-Source: AGHT+IGSVyhk5VpdTSmdKP6ivPsMkGJooS9Dbr4Wp/iKBXDLx1h1VzpZYwbgyo3XsO8rZ2GE63oX9rjlDQtd+FQguRU=
X-Received: by 2002:a05:6512:158e:b0:50c:6b:f180 with SMTP id
 bp14-20020a056512158e00b0050c006bf180mr812498lfb.56.1701892745640; Wed, 06
 Dec 2023 11:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20231205105030.8698-1-xin3.li@intel.com> <20231205105030.8698-27-xin3.li@intel.com>
 <f260ddf9-be67-48e0-8121-6f58d46f7978@citrix.com> <SA1PR11MB67343544B0CEB6C82002790DA884A@SA1PR11MB6734.namprd11.prod.outlook.com>
 <4e41b658-f49e-424c-8a86-08c8ab8e384d@citrix.com> <SA1PR11MB673472A25E72022F68882869A884A@SA1PR11MB6734.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB673472A25E72022F68882869A884A@SA1PR11MB6734.namprd11.prod.outlook.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 6 Dec 2023 14:58:54 -0500
Message-ID: <CAMzpN2h8yAk8Q0XwWWhBO3LcnwkNH57JOzTqamoNRXs-E3GJnw@mail.gmail.com>
Subject: Re: [PATCH v13 26/35] x86/fred: FRED entry/exit and dispatch code
To: "Li, Xin3" <xin3.li@intel.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"hpa@zytor.com" <hpa@zytor.com>, "Lutomirski, Andy" <luto@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com" <seanjc@google.com>, 
	"peterz@infradead.org" <peterz@infradead.org>, "Gross, Jurgen" <jgross@suse.com>, 
	"Shankar, Ravi V" <ravi.v.shankar@intel.com>, "mhiramat@kernel.org" <mhiramat@kernel.org>, 
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>, "nik.borisov@suse.com" <nik.borisov@suse.com>, 
	"Kang, Shan" <shan.kang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 6, 2023 at 2:19=E2=80=AFPM Li, Xin3 <xin3.li@intel.com> wrote:
>
> > >>> + case X86_TRAP_OF:
> > >>> +         exc_overflow(regs);
> > >>> +         return;
> > >>> +
> > >>> + /* INT3 */
> > >>> + case X86_TRAP_BP:
> > >>> +         exc_int3(regs);
> > >>> +         return;
> > >> ... neither OF nor BP will ever enter fred_intx() because they're
> > >> type SWEXC not SWINT.
> > > Per FRED spec 5.0, section 7.3 Software Interrupts and Related Instru=
ctions:
> > > INT n (opcode CD followed by an immediate byte): There are 256 such
> > > software interrupt instructions, one for each value n of the immediat=
e
> > > byte (0=E2=80=93255).
> > >
> > > And appendix B Event Stack Levels:
> > > If the event is an execution of INT n (opcode CD n for 8-bit value n)=
,
> > > the event stack level is 0. The event type is 4 (software interrupt)
> > > and the vector is n.
> > >
> > > So int $0x4 and int $0x3 (use asm(".byte 0xCD, 0x03")) get here.
> > >
> > > But into (0xCE) and int3 (0xCC) do use event type SWEXC.
> > >
> > > BTW, into is NOT allowed in 64-bit mode but "int $0x4" is allowed.
> >
> > There is certainly fun to be had with CD 03 and CD 04 byte patterns, bu=
t if you
> > meant to mean those here, then the comments are wrong.
> >
> > Vectors 3 and 4 are installed with DPL3 because that is necessary to ma=
ke CC and
> > CE function in userspace.  It also suggests that the SWINT vs SWEXC dis=
tinction
> > was retrofitted to architecture after the 286, because exceptions don't=
 check DPL
> > and ICEBP delivers #DB from userspace even when Vector 1 has a DPL of 0=
.
> >
> > While CC is for most cases indistinguishable from CD 03, CE behaves ent=
irely
> > differently to CD 04.  CD 04 doesn't #UD in 64bit mode, and will trigge=
r
> > exc_overflow() irrespective of the state of EFLAGS.OF.
> >
> >
> > The SDM goes out of it's way to say not to use the CD 03 byte pattern (=
and it
> > does take effort to emit this byte pattern - e.g. GAS will silently tra=
nslate "int $3"
> > to "int3"), and there's no plausible way software is using CD 04 in pla=
ce of CE.
> >
> > So why do we care about containing to make mistakes of the IDT era work=
 in a
> > FRED world?
>
> First, I agree with you because it makes things simple and neat.
>
> However, the latest SDM and FRED spec 5.0 both doesn't disallow it, so it
> becomes an OS implementation choice.
>
> >
> > Is there anything (other than perhaps the selftests) which would even n=
otice?
>
> I'm just conservative :)
>
> If a user app can do it with IDT, we should still allow it when FRED is
> enabled.  But if all key stakeholders don't care whatever gets broken
> due to the change and agree to change it.

One case to consider is Windows software running under Wine.
Anti-tampering code has been known to do some non-standard things,
like using ICEBP or using SYSCALL directly instead of through system
DLLs.  Keeping the status quo should be preferred, especially if
Microsoft does the same.


Brian Gerst

