Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB37250E6F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 03:57:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAOBa-0006Z7-S7; Tue, 25 Aug 2020 01:55:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmWW=CD=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kAOBa-0006Z2-4V
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 01:55:42 +0000
X-Inumbo-ID: 308b625f-0d79-4cf1-abb7-c6b7f3453d05
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 308b625f-0d79-4cf1-abb7-c6b7f3453d05;
 Tue, 25 Aug 2020 01:55:41 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id t6so4861302qvw.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 18:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AHmymnXZjccIX1MDQQNYoNvPM5wfcuA1M40jDu+1ClM=;
 b=GuBDfK9YLcIhy3qKhEjT/UVCSJ2gx7oZdCsWSAIW315ZWiYDldFy7K26321YnU/CKb
 F5EXvDQv6j2/WuvOphiDuTV/y7HrpXRDfUuE6jdLwQ4x1zDygHHnezas1T0KFD3UC6bg
 m0MJ5mPZ1JZSBanyrKSoHGqjQDvftdMeMvCcsYWtd8iE/6hAJoEe6bjbseZ+g2iPOn8g
 fdC/HmBc+8WtxsgqBeEcjXM2+Nos0SyMNQX9DsRaw1CauhtBnhLTbjatiDgfiwiRQjId
 55wU57/rV/zQmvu0HvleRGI+mDKWaOAcHRoEjVTC8KBDKI9Nl4NM9oIUCsq9Swj5AqOo
 MFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AHmymnXZjccIX1MDQQNYoNvPM5wfcuA1M40jDu+1ClM=;
 b=s5FG4ZJxKSjo4wUkrEJZpwIX7oHI4fujTadEJF1qLWnN+JeUvbRtqwZQTNCgb1bXyI
 ZtJritsyNjUb0Dbi5i94eFwzUMjn3v74QUhDa1tFeHb95p7A9/5ZuTRFxw6ZFEXhom7c
 E3YjzJrNBgZ1YWN4+NdjZ377Vy3iPvUHazNA4bfD9q32iWytUAU5wywLYIrYfheyJ+jY
 wgi92y6O8cM5UHojq9vQuqmSjD/izmrtRPWhqaxvfCb9csDICiGis/oE9FT/atVNkkbI
 T3GBsuKp1CwCWGOAMb1hPSYSI0FeMIJBS/WFvXKzdm78WgHLsDcwuNXTaBcAb+YQNdfB
 +K1w==
X-Gm-Message-State: AOAM531Es55E4cDj6oecCOqkrbEEy3jPklEeRPxmhsAPOp4TOWB1Avh0
 kE0h44X7eft64g1zRv/pokpqRRu1UkUhbhIn4fWg+A==
X-Google-Smtp-Source: ABdhPJwCIda8PATjTK/CuSuBeM+x5kVZHz73QJiiEji6KJ3iRpe6m6AsOJWHRN9huGzyM5uqvA1qCKKP+GqVAQmQ7Ho=
X-Received: by 2002:a0c:ec86:: with SMTP id u6mr7329969qvo.58.1598320540628;
 Mon, 24 Aug 2020 18:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <a439f9c6-2773-5f49-367b-fe3f3ff21ae9@citrix.com>
 <CAMmSBy8gupDuXEUGxucwZ0G6dG8xD-Edabv-ken0L_P1uyJgZA@mail.gmail.com>
 <66a05f5d-715f-eb40-57c4-6decd43f540b@suse.com>
 <1dd4bf33-ee63-56e0-be33-7dbaec596644@citrix.com>
In-Reply-To: <1dd4bf33-ee63-56e0-be33-7dbaec596644@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 24 Aug 2020 18:55:29 -0700
Message-ID: <CAMmSBy-9JsHMNKX8Eej+cb1b6aWLAgY1NceqBZ+j5tQ9=UObCg@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Aug 21, 2020 at 3:11 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 21/08/2020 07:50, Jan Beulich wrote:
> > On 20.08.2020 21:12, Roman Shaposhnik wrote:
> >> On Thu, Aug 20, 2020 at 5:56 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >>> On 19/08/2020 23:50, Roman Shaposhnik wrote:
> >>>>  Hi!
> >>>>
> >>>> below you can see a trace of Xen 4.14.0 failing on Dell IoT Gateway 3001
> >>>> without efi=no-rs. Please let me know if I can provide any additional
> >>>> information.
> >>> Just to be able to get all datapoints, could you build Xen with
> >>> CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP and see if the failure mode changes?
> >> It does.
> > As said on the other sub-thread - it doesn't:
> >
> >> (XEN)  00000ff900000-00000ffffffff type=11 attr=8000000000000000
> >> (XEN) Unknown cachability for MFNs 0xff900-0xfffff
> >> [...]
> >> (XEN) ----[ Xen-4.14.0  x86_64  debug=y   Not tainted ]----
> >> (XEN) CPU:    0
> >> (XEN) RIP:    e008:[<00000000775e0d21>] 00000000775e0d21
> >> (XEN) RFLAGS: 0000000000010046   CONTEXT: hypervisor
> >> (XEN) rax: 0000000088411fe8   rbx: ffff82d0408afb28   rcx: ffff82d0408afa40
> >> (XEN) rdx: 00000000ff900000   rsi: 00000000ff900000   rdi: 00000000775e4d58
> >> (XEN) rbp: ffff82d0408afc00   rsp: ffff82d0408afa18   r8:  ffff82d0408afb28
> >> (XEN) r9:  0000000000000000   r10: 00000000ff920000   r11: 0000000000020000
> >> (XEN) r12: ffff82d0408afc40   r13: 0000000000000040   r14: 00000000775ce2c0
> >> (XEN) r15: 00000000775cf9e8   cr0: 0000000080050033   cr4: 00000000001006e0
> >> (XEN) cr3: 0000000070ddd000   cr2: 00000000ff900020
> >> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
> >> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> >> (XEN) Xen code around <00000000775e0d21> (00000000775e0d21):
> >> (XEN)  8b 11 45 33 c9 49 8b d8 <4c> 39 5a 20 75 0b 0f b7 42 30 48 8d 4c 10 17 eb
> >> (XEN) Xen stack trace from rsp=ffff82d0408afa18:
> >> (XEN)    00000000775ddb8e 00000000775e4d58 0000000000072812 0000000000000001
> >> (XEN)    ffff82d0408afaf8 00000000ff900000 0000000000020000 00000000ff91fff0
> >> (XEN)    00000000ff90cecc 00000000ff900060 0000000007f70021 0000000000000000
> >> (XEN)    0000000077739001 ffff82d0409cc3c0 0000000000000020 ffff82d0409cc3c0
> >> (XEN)    0000000000000020 ffff82d040646ce0 ffff82d040620d20 ffff82d0408afc40
> >> (XEN)    00000000775e2e73 00000000775da608 ffff82d0408afc50 0000000000000000
> >> (XEN)    0000000000000000 ffff82d0409b8950 00000000775e2ead ffff82d0409b8950
> >> (XEN)    ffff82d0408afb48 8000000000000003 0000000000000000 0000000000000000
> >> (XEN)    00000000775ddd88 00000000775da610 000000000000000a ffff82d0408afc50
> >> (XEN)    000000000000000a ffff82d0408afc40 ffff82d040620d20 ffff82d040721200
> >> (XEN)    ffff82d0408afb78 ffff82d0409eed20 ffff82d0408afbb8 0000000000000430
> >> (XEN)    0000000000000002 ffff82d0408aff00 000000000000020c ffff82d0408afc50
> >> (XEN)    00000000775de841 00000000775cf9e8 00000000775d03b5 00000000775ce2c0
> >> (XEN)    0000000000000000 ffff82d0408afc40 0000000000000082 0000000000000000
> >> (XEN)    00000000775d0798 ffff82d0408afc90 0000000000000000 0000000000002022
> >> (XEN)    ffff82d04025e164 ffff82d0408afc40 0000000000000282 0000000000000000
> >> (XEN)    ffff82d0408affff 0000000000000282 ffff82d040665fb6 00000000001006e0
> >> (XEN)    ffff82d040202033 0000000000000002 ffff830077586e18 0000000000000003
> >> (XEN)    ffff82d0408afcd0 0000000071233000 00007d2fbf750367 ffff82d0404ef931
> >> (XEN)    0000000031746960 0000000000001d4b 0000000000000200 00333114010107dc
> >> (XEN) Xen call trace:
> >> (XEN)    [<00000000775e0d21>] R 00000000775e0d21
> >> (XEN)    [<00000000775ddb8e>] S 00000000775ddb8e
> >> (XEN)    [<0000000000000282>] F 0000000000000282
> >> (XEN)    [<ffff830077586e18>] F ffff830077586e18
> >> (XEN)
> >> (XEN) Pagetable walk from 00000000ff900020:
> > Hitting the very same address range, just the call trace has changed.
>
> This mangled stack trace is a known problem with debug builds in Xen.
>
> It should revert back to a more normal stack trace if you disable
> CONFIG_FRAME_POINTER (which defaults to CONFIG_DEBUG).

10x! That's super helpful.

Thanks,
Roman.

