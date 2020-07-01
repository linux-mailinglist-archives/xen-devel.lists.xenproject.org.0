Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E22110C3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 18:34:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqfgX-0003Tk-Tz; Wed, 01 Jul 2020 16:34:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iA1B=AM=gmail.com=brgerst@srs-us1.protection.inumbo.net>)
 id 1jqfgW-0003Tf-5Y
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 16:34:08 +0000
X-Inumbo-ID: af31e90c-bbb8-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af31e90c-bbb8-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 16:34:07 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id i4so25654137iov.11
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 09:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MoybjELZfC8f+lXSCtoUVME2X9MJfIpV+bdz3fRbLPs=;
 b=UIQesNKyPGHb0LsgKEkEqKC04ivhJDSLff+nAYrcTcn1rxfacGjyvsw8a6MHdkh2OU
 dysTn5Deu/gEZ6sPLxswsTnoXY8MNBef2h7eQigzrb8i+UA/fScu+ZhchmeakIiuK9y5
 lWUtPL1yADHz4EeusxKEafPF/8hJSssq923JNp/E/Yybr3deh+6cYHVsW2lzeTghXLxX
 ZgGXH5e5fXYPugjAkgWJ89Ps8b7S5pw8vRtOtrJAGP85BydIP5Dfzu/BNSxI6BNFh6FS
 ooCn2W2QvCgGubrpoe1aQ4cWXJ8lpknkPZs0MDAdOLmDkjGjoTOM3guUedfZID0WQTLx
 JHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MoybjELZfC8f+lXSCtoUVME2X9MJfIpV+bdz3fRbLPs=;
 b=CAkoEid6UIpuu9WdYSNEkyR0fFyTDTjDMjG63wtL+Iv4T95Bzr9Ye17Rh8awoa1s1i
 2c0WcAhowd5LH7wmZiX2IvIV0MMsowOoCQlBXv79JLKyKRSQEtRE38Ej9vrjSsJybIqA
 rj2MVlQKz1ClFizaoupn3VyyoyRVUBefWEb4wAnve7Ohuriet8/fTil2lw19mu4RAJCG
 wuNeoRPc6CqZK1Om80pNZbhzYFUhYA4xlEpDP5rgbVF4RWVODxQp/kK3FGRwqMn9Fmsj
 Yew6ieU8gu2gw60ZH5qaj87qeIYHi8yCdsiTlsCeDnyfyv9/qUhjarLM1anZL8K51HFV
 5JXw==
X-Gm-Message-State: AOAM530gRV+jXe3Fq62LiArUXzh+QQxrs0MfU8qUfYxwtxr8mNjoy+Fx
 FLDWBHY5PkjiDPP0PcOcdxRmsxOqJJeLWH6bLg==
X-Google-Smtp-Source: ABdhPJyvkzjjp3Dg16h9W16pWaYpiojKXdtxSoSo0JgxzCryuV4rnIzZSZrN/Fkw4QQZ2XiCYSCYxFItVNiYZ1CA3jg=
X-Received: by 2002:a02:3501:: with SMTP id k1mr28948520jaa.133.1593621247338; 
 Wed, 01 Jul 2020 09:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200701110650.16172-1-jgross@suse.com>
 <20200701110650.16172-2-jgross@suse.com>
In-Reply-To: <20200701110650.16172-2-jgross@suse.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Wed, 1 Jul 2020 12:33:56 -0400
Message-ID: <CAMzpN2iuwv=05vpxeP6eyVqEH9_093gDtDV3QAXYQ2QrucznBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] x86/xen: remove 32-bit Xen PV guest support
To: Juergen Gross <jgross@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 1, 2020 at 7:08 AM Juergen Gross <jgross@suse.com> wrote:
>
> Xen is requiring 64-bit machines today and since Xen 4.14 it can be
> built without 32-bit PV guest support. There is no need to carry the
> burden of 32-bit PV guest support in the kernel any longer, as new
> guests can be either HVM or PVH, or they can use a 64 bit kernel.
>
> Remove the 32-bit Xen PV support from the kernel.

If you send a v3, it would be better to split the move of the 64-bit
code into xen-asm.S into a separate patch.

--
Brian Gerst

