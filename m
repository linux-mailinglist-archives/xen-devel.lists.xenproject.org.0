Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AFACFE7B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 10:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008184.1387412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSfD-0005Jg-7V; Fri, 06 Jun 2025 08:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008184.1387412; Fri, 06 Jun 2025 08:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNSfD-0005IC-49; Fri, 06 Jun 2025 08:42:59 +0000
Received: by outflank-mailman (input) for mailman id 1008184;
 Fri, 06 Jun 2025 08:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0k5i=YV=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uNSfB-0005I6-Kz
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 08:42:57 +0000
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [2607:f8b0:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e13c5b1-42b2-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 10:42:56 +0200 (CEST)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3da73df6c4eso16248865ab.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 01:42:56 -0700 (PDT)
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
X-Inumbo-ID: 3e13c5b1-42b2-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749199375; x=1749804175; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y50bpedkxKFeoMDlm0zVMdyfNFBuYl1yYyag+al4b8=;
        b=g/DZXPh3PyLERRFwZMu6MA36iUU7ER1Bv45nzMweyxub0Ru8mgxun2icIWoy7kJy6v
         1fq297CxjFhlVwnEmADgWuUv4e6yOKYFonXOENHbkns9EtCfNAwc8xq+s1L6slDEsBBg
         mBhll36ox8Ou/4sCAiAm/L1XO72tUqSr/b8S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749199375; x=1749804175;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Y50bpedkxKFeoMDlm0zVMdyfNFBuYl1yYyag+al4b8=;
        b=lJsRjkksEaVmLxReYZehh/7kfsFUSnmavcGXMKB9pgE3/QUrjj3Q7Vn5b0QfpWjBKh
         lt7FLBkhmekzFieiLeSPHWkyspKQH43qL83Mi4W6P+5SiMJTfH+rJ8k0NA1I1XtYoR4V
         kL1nxb/YYxKoKy6YuEqoTa5eIDISwVeQqHL47DHY3m88mNVqOEdHHO+7A2reWtI4BBQT
         natb2Q2rQbVuudg47JK5rRCXWv5M7010ouEHGc+xUcyaCCAtpywCFixosmK/TPuYmxKr
         OpHY5e4G6e9hzqbcvVaALeHT8QCXrvH25fvM7iJg5puh4rg08UJOftqwQbA0xAJg/WO/
         jkTA==
X-Forwarded-Encrypted: i=1; AJvYcCXGfJWdKEJZSoKoIigKSbkKzm80A+KpRd7m/S/yoqMDy0kNb5F2cucVI/chfBNHRDnj4z03RrcflN8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywklw6qkXg2JqRytPGTm5QyX4z4aVGqU2F4Y1uo+7orO81V+NoC
	7YTfaCgot/CLvzgFhOFgb0ullvV8SIzGbN4amSI7O2WNFhSQaeQSZ0dpq+7vni8b5jrzRh8VlfW
	5DmwwldjcjRp1YUx8H4jqYA5eR6Eh5tPd9syby0Xu6ZiihRuOOxQ=
X-Gm-Gg: ASbGncsIxYuQzqFfoH19Ffrck897Iy+lTkJ1+YQBSLHSxbPhd36+7di90lv2L3QZk0d
	0TV0NR3c/hhVyJcfGp6CNj073vFr4+hPOPD+FZ4rbX7KFtH26h452X+02BUEh0T7eUPHFve+S0/
	CW5XwE+A9ZQjvDPHHafBzKDd98WEUzHm+IBuH4viLSJg==
X-Google-Smtp-Source: AGHT+IH8bp9IZxDHBL0knAOb/iNuYFt+e6X7+2aGL2ZinMHm5AjvYsRDRuX84gUaWbDCspaAUprAdEMDu2LPOpGkGvo=
X-Received: by 2002:a05:6808:6f8d:b0:407:59ac:d73f with SMTP id
 5614622812f47-409051f2c1fmr1794876b6e.21.1749199363766; Fri, 06 Jun 2025
 01:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250527152635.2451449-1-ross.lagerwall@citrix.com>
 <20250527152635.2451449-2-ross.lagerwall@citrix.com> <202b9b4f-edd1-4bb4-a61a-a1fcf8333108@suse.com>
In-Reply-To: <202b9b4f-edd1-4bb4-a61a-a1fcf8333108@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 6 Jun 2025 09:42:32 +0100
X-Gm-Features: AX0GCFvc76-59S6WzumYHm7FESMlUCdmE0fcmtT2eqAPn-erq9KuTgEVGLRGiNM
Message-ID: <CAG7k0EojF1QNQW1NVgHkjW28ZHhFw6vvvO9zexV-sbK7yKrqLw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] x86/pmstat: Check size of PMSTAT_get_pxstat buffers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 11:10=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 27.05.2025 17:26, Ross Lagerwall wrote:
> > --- a/xen/include/public/sysctl.h
> > +++ b/xen/include/public/sysctl.h
> > @@ -215,11 +215,22 @@ typedef struct pm_px_val pm_px_val_t;
> >  DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
> >
> >  struct pm_px_stat {
> > -    uint8_t total;        /* total Px states */
> > +    /*
> > +     * IN: Number of elements in pt, number of rows/columns in trans_p=
t
> > +     *     (PMSTAT_get_pxstat)
> > +     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
> > +     */
> > +    uint8_t total;
> >      uint8_t usable;       /* usable Px states */
> >      uint8_t last;         /* last Px state */
> >      uint8_t cur;          /* current Px state */
> > -    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
> > +    /*
> > +     * OUT: Px transition table. This should have total * total elemen=
ts.
> > +     *      As it is a 2-D array, this will not be copied if it is sma=
ller than
> > +     *      the hypervisor's Px transition table. (PMSTAT_get_pxstat)
> > +     */
> > +    XEN_GUEST_HANDLE_64(uint64) trans_pt;
> > +    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
> >      XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
> >  };
>
> Commentary here is still confusing imo: Since "total" now has two meaning=
s,
> saying "This should have .." in OUT: descriptions is ambiguous. Imo for
> trans_pt you want to say something like "will not be copied if input tota=
l is
> less than output total", and for pt "the number of elements copied is the
> smaller of input and output total".
>
> If that's okay with you, I can edit things along these lines while commit=
ting,
> at which point
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>

Sure, that's fine with me.

Thanks,
Ross

