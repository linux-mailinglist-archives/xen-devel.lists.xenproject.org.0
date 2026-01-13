Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5510ED1897E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 12:55:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201529.1517153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfczO-0007nX-93; Tue, 13 Jan 2026 11:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201529.1517153; Tue, 13 Jan 2026 11:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfczO-0007kH-5W; Tue, 13 Jan 2026 11:55:10 +0000
Received: by outflank-mailman (input) for mailman id 1201529;
 Tue, 13 Jan 2026 11:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5x1H=7S=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vfczN-0007cP-6D
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 11:55:09 +0000
Received: from mail-yx1-xb12e.google.com (mail-yx1-xb12e.google.com
 [2607:f8b0:4864:20::b12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4bd3cdf-f076-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 12:55:08 +0100 (CET)
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-64476c85854so7307866d50.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 03:55:08 -0800 (PST)
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
X-Inumbo-ID: b4bd3cdf-f076-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768305307; x=1768910107; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Us33qgBVO+A1iQtvWJPQe2C4rxDTACfd5FFGkIpXXc=;
        b=I5Lkq4Y/fSaUME/a7yaOvpiycOiNwmrW9ZOVGc7W97WWHsW2j7PQ0hmmYx5KurEqaA
         YKfMcW4/PcHG368tm/VHPIc7E2oX6Egk6nVP2wZKShKoeMfCD+T3wlx9tbLFfmFgNwba
         yVE+X+KOiA48ZJFdXSp17gPPClUvNDbT42kgcwobG7XStQuBszem302HVacoWEth7QNw
         KdXrY0BTjuGBopBCexsPlDQbeIX3cQF/jw3oIb35rSNM0uSYGyUYRkxHIpmhkMfHwHCh
         O/CJxFo0ypepJSs2tbJA/J3RmYwzwQV99Q6Lfe68bMygEVU0wibw0lxLgYa3kUNzb39j
         hFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768305307; x=1768910107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Us33qgBVO+A1iQtvWJPQe2C4rxDTACfd5FFGkIpXXc=;
        b=aQVQJeBqqArhWz/TkL96EbOj0hx5c11EVwogBJoAcL10gMS4lUKmFnLz+7IJJsQ6Xj
         2ABkcIW2yQPUvZ/MyjTA0NkdskhZ0+gVei5XDFn/VEZjTDj8vgIixAi82D0Rd307/R3l
         ctzyuEYLondDAtONlSVHR7XzKw/WRtBZ4525taeul3ZIH0rj2knf/9wk4uIdWAqvN233
         JesL7Gh79eR98uA1HQz42aioVLbtxJG24+EKH4FPuvdA964w6bT12XDzw/4HUBG8Fd2m
         9CxsSAq61hI832nlksyl9lJFBaH2+jpeaup6wamgLcrsGYCy392tA716MI+UghtSgmmE
         EDhQ==
X-Gm-Message-State: AOJu0YyBfZX2Hzazys7ta21oqVT37siuBl2Yy08NmuQ1efnIg/bAhCW+
	SyDLZWYijyjBZNDCfAD8IqXrMHWIYbINxy6ygqD/PusLNpb4yGcq99sbSu8p025/6rh6WBWSrUF
	wvibLf2x0DRvj+wgVRyCq+GJKLzZnDNdKfQ==
X-Gm-Gg: AY/fxX7gap1npXv5eTVnj52YpqnEcu/uZNsCYpemMgFibH6IuVmuGiYs4LZipaHn+tb
	XYRLHKdRQOJ3NpWJXjWVTmlwQXWQdTpmUAWEQMXF1LNxz791bA2sYu2fMiOkAOMTwVQ0tIEY7ay
	W1V17FfJD8PRZ1p5YItd8KbUlPtrRCRCHWNsoemvT4y+C6UGL2jJ1XxL1+3VN7/auAecJg2RAoV
	wBHgMCBfaLiwCKrPCTekObvAaS+TBXgWl4lxMQdgG62pbCIvPS8aWmJh+V7A2zI4fmz93o=
X-Google-Smtp-Source: AGHT+IHVB62tyqm3pUYJXW8fN3sjX8zI8b9GNXly6vMPbAdICfcNqJ624zYC/JxTVYq5uoUyNcWT6KeMm7RTcY3E7wc=
X-Received: by 2002:a05:690c:7341:b0:787:deea:1ba8 with SMTP id
 00721157ae682-790b5828f50mr398994227b3.50.1768305306869; Tue, 13 Jan 2026
 03:55:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHt6W4ejPT-A7bGfrZGW-8zEBxmQ__LVa91GRcXhYZO_3C1meg@mail.gmail.com>
In-Reply-To: <CAHt6W4ejPT-A7bGfrZGW-8zEBxmQ__LVa91GRcXhYZO_3C1meg@mail.gmail.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 13 Jan 2026 11:54:55 +0000
X-Gm-Features: AZwV_QhgtoESeD24oifWcl42CyTbxdjkT5u4ilNc88rsPGempFyWkOECqVLosXU
Message-ID: <CAHt6W4eQmiuXfBfwi-Wzpp+fzCzr-JAO45+OD3tc5PQXE-0WXw@mail.gmail.com>
Subject: Re: [PATCH livepatch-build-tools v2] Treat constant sections as
 string sections
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 10:44, Frediano Ziglio <freddy77@gmail.com> wrote:
>
> > > Newer compiler can put some constant strings inside constant
> > > sections (.rodata.cstXX) instead of string sections (.rodata.str1.XX).
> > > This causes the produced live patch to not apply when such
> > > strings are produced.
> > > So treat the constant sections as string ones.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >
> > Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> >
> > Thanks,
> > Ross
>
> Hi,
>   any update on this change? Could it be merged?
>

Any update?

Frediano

