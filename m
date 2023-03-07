Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAD16AE0C0
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 14:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507389.780822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXVv-0000ee-44; Tue, 07 Mar 2023 13:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507389.780822; Tue, 07 Mar 2023 13:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZXVv-0000bN-08; Tue, 07 Mar 2023 13:37:59 +0000
Received: by outflank-mailman (input) for mailman id 507389;
 Tue, 07 Mar 2023 13:37:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zeiT=67=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pZXVt-0000ah-Pu
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 13:37:57 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44c77c53-bced-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 14:37:56 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso10464696wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 05:37:56 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.143.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.143]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm12634521wru.75.2023.03.07.05.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:37:55 -0800 (PST)
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
X-Inumbo-ID: 44c77c53-bced-11ed-96b5-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678196276;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LBozl/jteQCSq5ymfj39QkpcL0DAY6dgRc+xb2K6Bwg=;
        b=Yg60t1Evp4FStN1sNZDmHz5PWswI+4NLpSocr87TY08K30X+wzacqTv3zRHzg0ttTO
         bfN6Wz1jyBsfLumaLVwRNzC0In2wu3OjWv8ZKmU58FPuGXyuvAvQQ7Vz5IGWDLAEALkH
         CklcCM2TwClw28LdUa/wbxBtoI8Etc6pngn4GmUUmsZTV/j8maSqG8PEjdzovIYstS0i
         tNIaoCX7cVUG926iWdGEh5XesLBGMT5P12Ixxi6R9cBab8P306h0NVTbdkJFY9IwDIJc
         qpF5ct/0i/a59AuvSzHnj3U2zhaCpQTrASfg9zg7RIYQfRqwSWMwu3TdolqxFIzcPmtC
         LctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196276;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBozl/jteQCSq5ymfj39QkpcL0DAY6dgRc+xb2K6Bwg=;
        b=yjO/22Xc1UBm++53kP31WdpJ5dExcr7hhi7Z8JXUEwKC5u6qy9yTAloryPu2zW9Krq
         up1RjfWRR3dg+hfH+20iVs1VsPfBZqB7UmTOKBrUKhof5iCsrp1myrieymg9lZd9jVzK
         a4gb33pZLVKRwY/2nNX+cRarvJpJxXB0dPGvu4Z+/yzLzKUWryuxuQbh+pxstrcmaMUJ
         X9vyni9hozXEWlZNIMsEazMINgDkyQVP0fZZaCXfU1HpJPp3dRUqWSBVRsYh0zOuq2H8
         0WglpHTQ9YPTJz4mXfRVwhfACTMcrreh4ZE6wA3MVhjnpIxekfSD5vYvq7/FCmsT75Zf
         43Jw==
X-Gm-Message-State: AO0yUKUOCm7I/x3KxwpuzcRVUxnpqph9FmCqOHCWV8xOOFkdQLYz9eQ5
	+l77thUJynXXjJQrN14yqBU=
X-Google-Smtp-Source: AK7set/yF9UbXD+KUGbGlqIn3tY+z9kXngEMj2NFmDevMl7jInVdhapnVUBAUxd8A2yjWhvm++aN1w==
X-Received: by 2002:a05:600c:3b16:b0:3eb:5990:aea4 with SMTP id m22-20020a05600c3b1600b003eb5990aea4mr13137019wms.12.1678196276207;
        Tue, 07 Mar 2023 05:37:56 -0800 (PST)
Message-ID: <cfc8f4450928fb8696db13dc25bb9b9b4cd6c68d.camel@gmail.com>
Subject: Re: [PATCH v5 4/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Tue, 07 Mar 2023 15:37:54 +0200
In-Reply-To: <9bb8c837-7aa4-ba75-99fc-5e4c079023b3@suse.com>
References: <cover.1677839409.git.oleksii.kurochko@gmail.com>
	 <4a478638449e66a76e1671db38ec29b9e3108201.1677839409.git.oleksii.kurochko@gmail.com>
	 <8a7920d9-9622-195c-2706-2b435c2c856e@suse.com>
	 <e91666a08b6cfc146123e18e634aacd979161b66.camel@gmail.com>
	 <9bb8c837-7aa4-ba75-99fc-5e4c079023b3@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-03-07 at 13:59 +0100, Jan Beulich wrote:
> On 07.03.2023 13:52, Oleksii wrote:
> > On Mon, 2023-03-06 at 11:36 +0100, Jan Beulich wrote:
> > > On 03.03.2023 11:38, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/x86/include/asm/bug.h
> > > > +++ b/xen/arch/x86/include/asm/bug.h
> > > > @@ -1,79 +1,12 @@
> > > > =C2=A0#ifndef __X86_BUG_H__
> > > > =C2=A0#define __X86_BUG_H__
> > > > =C2=A0
> > > > -#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > > > -#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > > > -#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> > > > +#define BUG_DEBUGGER_TRAP_FATAL(regs)
> > > > debugger_trap_fatal(X86_EXC_GP,regs)
> > >=20
> > > Along the lines of a comment on an earlier patch, please move
> > > this
> > > ...
> > >=20
> > > > =C2=A0#ifndef __ASSEMBLY__
> > >=20
> > > ... into the thus guarded section.
> > But it was defined there before the patch series and these definies
> > are
> > used in "#else /* !__ASSEMBLY__ */"
>=20
> Since you use plural, maybe a misunderstanding? My comment was solely
> on the line you add; the removed lines are there merely as context.
Really. I misunderstood you.
>=20
> > > > @@ -1166,12 +1167,9 @@ void cpuid_hypervisor_leaves(const
> > > > struct
> > > > vcpu *v, uint32_t leaf,
> > > > =C2=A0
> > > > =C2=A0void do_invalid_op(struct cpu_user_regs *regs)
> > > > =C2=A0{
> > > > -=C2=A0=C2=A0=C2=A0 const struct bug_frame *bug =3D NULL;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 u8 bug_insn[2];
> > > > -=C2=A0=C2=A0=C2=A0 const char *prefix =3D "", *filename, *predicat=
e, *eip =3D
> > > > (char
> > > > *)regs->rip;
> > > > -=C2=A0=C2=A0=C2=A0 unsigned long fixup;
> > > > -=C2=A0=C2=A0=C2=A0 int id =3D -1, lineno;
> > > > -=C2=A0=C2=A0=C2=A0 const struct virtual_region *region;
> > > > +=C2=A0=C2=A0=C2=A0 const char *eip =3D (char *)regs->rip;
> > >=20
> > > I realize "char" was used before, but now that this is all on its
> > > own,
> > > can this at least become "unsigned char", but yet better "void"?
> > If we change it to "void" shouldn't it require additional casts
> > here (
> > which is not nice ):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 eip +=3D sizeof(bug_insn);
>=20
> Arithmetic on pointers to void is a GNU extension which we make
> heavy use of all over the hypervisor.
Got it. Than I'll rework it with 'void *'.
>=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 switch ( id )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0 case BUGFRAME_run_fn:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen WARN at %s%=
s:%d\n", prefix, filename,
> > > > lineno);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixup_exception_re=
turn(regs, (unsigned long)eip);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0 case BUGFRAME_bug:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Xen BUG at %s%s=
:%d\n", prefix, filename,
> > > > lineno);
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( debugger_trap_fata=
l(TRAP_invalid_op, regs) )
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
> > >=20
> > > This and ...
> > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Xen BUG at %s%s:=
%d\n", prefix, filename,
> > > > lineno);
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0 case BUGFRAME_assert:
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* ASSERT: decode the p=
redicate string pointer. */
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 predicate =3D bug_msg(b=
ug);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !is_kernel(predica=
te) && !is_patch(predicate) )
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 predicate =3D "<unknown>";
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Assertion '%s' =
failed at %s%s:%d\n",
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > -
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( debugger_trap_fata=
l(TRAP_invalid_op, regs) )
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return;
> > >=20
> > > ... this return look to have no proper representation in the new
> > > logic; both cases fall through to ...
> > >=20
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_execution_state(re=
gs);
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Assertion '%s' f=
ailed at %s%s:%d\n",
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 predicate, prefix, filename, lineno);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > =C2=A0
> > > > =C2=A0 die:
> > >=20
> > > ... here now, which is an unwanted functional change.
> > Oh, you are right. So then in case we have correct id it is needed
> > to
> > do only return:
> > =C2=A0=C2=A0=C2=A0 switch ( id )
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0 case BUGFRAME_run_fn:
> > =C2=A0=C2=A0=C2=A0 case BUGFRAME_warn:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixup_exception_return(regs,=
 (unsigned long)eip);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 return;
>=20
> Except the "return" needs to remain inside the switch; unrecognized
> id
> values should still fall through to the "die" label.
Yeah, it is still possible to get unrecognized id.
Thanks.
>=20

~ Oleksii

