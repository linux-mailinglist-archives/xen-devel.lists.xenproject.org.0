Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD785D196
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 08:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683863.1063493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rchBX-0007xr-Tx; Wed, 21 Feb 2024 07:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683863.1063493; Wed, 21 Feb 2024 07:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rchBX-0007vU-RL; Wed, 21 Feb 2024 07:38:31 +0000
Received: by outflank-mailman (input) for mailman id 683863;
 Wed, 21 Feb 2024 07:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rchBW-0007vO-0z
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 07:38:30 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33debf08-d08c-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 08:38:28 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d0cd9871b3so67191271fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 23:38:28 -0800 (PST)
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
X-Inumbo-ID: 33debf08-d08c-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708501107; x=1709105907; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kM3OowUkSdEyn+kO36RUprrqXgAkORPjN1L25sxdVgQ=;
        b=DtXxjSoNaVzxYlwzpcFwMc+LwO+9uTbzULJcdHa1LwQZsBC14DgznaBoSNsRhxvRup
         p286PDJoUZSI+X6qzFTqkg/A5WheHtAfhcOjzrscItHVl8oDaEDJMRyWjYWvhkyJDWot
         3vMAr0tSIsD7fmr/En+1xqjZ3NYI0l+wn0CUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708501107; x=1709105907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kM3OowUkSdEyn+kO36RUprrqXgAkORPjN1L25sxdVgQ=;
        b=oX5yk1aFqlNwu6ZU0DlomEZydKvlccZIU5p9fcqAnTRsGnygJcYCy1vjJcZATEqWMO
         BsNhKKJgHKj5JrhfuKff9KawOgPtwbbnWMsqBDiw6eZyT0DQBc4APDniv0yKgKMerv57
         4mdug/zH/BE/VdZhNAeqN7omAUgLG3VI5X2rgxG8x0vvbw7yLSeY5WvkH0S1BHWy1Eg+
         1qnovoPgWAwiUlZrMNYhpdGgOLvt/6+chYdw0/fbufUpng5U6bDkApNcvBYiLlN37U/S
         lXVNGdNF68EsFRjevJcR/R3eD/eD9M28tgp3c07WSggIXvAZ/J+eYuYPbAdT2Jy5UmHB
         cd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnATFbZEZsyANODgGq2vc/4jcFwZLF704KXIH4lhT5Hjui3YqRKjiAujv82pS4K6fj4zB5pi7ITmhmoIDidwFPEVa4V43IxJ9X3LnA/Mw=
X-Gm-Message-State: AOJu0Yy2V37Nu1N5Rige9kDTWyxsK2LzunECR0HT7jwOydNB1kLsRLES
	d8cQ2poiDknO+LtoJv9FIMYl8Hn4Ge1eAMtyy1Vl99XX7diP2KEuhuEV6DW0YIPXuLjuvGl9qcw
	ovxwFQC4/fK9yJTdwcT/UwgoKqb4tLeGE9sUsuQ==
X-Google-Smtp-Source: AGHT+IEx2n75EVJP3+E0tFds5KhS6fxBn1YLAIf2HQJDYNZr+XZO6vD5YYeLVF3hd+WX4TE4EqmPzAaxXlh6u7uSEMA=
X-Received: by 2002:a2e:9d10:0:b0:2d0:af40:7058 with SMTP id
 t16-20020a2e9d10000000b002d0af407058mr4938455lji.14.1708501107532; Tue, 20
 Feb 2024 23:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-2-george.dunlap@cloud.com> <66962dfc-db89-40bc-8411-9b92f9458b16@suse.com>
 <CA+zSX=ZwUT4Wf7eY3DFyp=Bf_MndExoKCZBVGEhF-ByaOEH7tw@mail.gmail.com> <088414f7-c5f3-4776-80a2-c9c3da618c22@suse.com>
In-Reply-To: <088414f7-c5f3-4776-80a2-c9c3da618c22@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 15:38:16 +0800
Message-ID: <CA+zSX=a5-Bfp==DESE-2UZdt6yCfSxRxCf65PotsJ2Emrg2GCQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] xen/hvm: Convert hap_capabilities into a bitfield
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 3:23=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 21.02.2024 08:02, George Dunlap wrote:
> > On Mon, Feb 19, 2024 at 9:36=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 06.02.2024 02:20, George Dunlap wrote:
> >>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> >>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> >>> @@ -113,8 +113,8 @@ static int cf_check parse_ept_param_runtime(const=
 char *s)
> >>>      int val;
> >>>
> >>>      if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
> >>> -         !(hvm_funcs.hap_capabilities &
> >>> -           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
> >>> +         !(hvm_funcs.caps.hap_superpage_2mb ||
> >>> +           hvm_funcs.caps.hap_superpage_1gb) )
> >>>      {
> >>>          printk("VMX: EPT not available, or not in use - ignoring\n")=
;
> >>
> >> Just to mention it: The conditional and the log message don't really
> >> fit together. (I was first wondering what the 2mb/1gb checks had to
> >> do here at all, but that's immediately clear when seeing that the
> >> only sub-option here is "exec-sp".)
> >
> > So you mean basically that the checks & error message are poorly
> > factored, because there's only a single sub-option?  (i.e., if there
> > were options which didn't rely on superpages, the check would be
> > incorrect?)
>
> Right.
>
> > Let me know if there's something concrete you'd like me to do here.
>
> Nothing. I meant to express this by starting with "Just to mention it".

Right, and when I said "let me know" I meant, "I'm going to ignore
this unless you say something, feel free to say nothing". :-D

I understood that you weren't asking for anything, but maybe coming
back to this after a few days you'd've had a simple fix.  I wouldn't
mind changing the text of the message, but I didn't feel like finding
a better text.  Reorganizing the checks (which seems closer to the
Right Thing) is off-topic for this patch of course.

 -George

