Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925664F93C
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 15:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465282.723929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Y0a-0007kw-OT; Sat, 17 Dec 2022 14:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465282.723929; Sat, 17 Dec 2022 14:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Y0a-0007hV-Ka; Sat, 17 Dec 2022 14:17:48 +0000
Received: by outflank-mailman (input) for mailman id 465282;
 Sat, 17 Dec 2022 14:17:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cfq=4P=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1p6Y0Y-0007hN-7j
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 14:17:46 +0000
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [2607:f8b0:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 929aa947-7e15-11ed-91b6-6bf2151ebd3b;
 Sat, 17 Dec 2022 15:17:44 +0100 (CET)
Received: by mail-pg1-x534.google.com with SMTP id w37so3524569pga.5
 for <xen-devel@lists.xenproject.org>; Sat, 17 Dec 2022 06:17:44 -0800 (PST)
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
X-Inumbo-ID: 929aa947-7e15-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
        b=HTaeci6QMzAYrKlkHCibDPNesH6NQaFsq3gt8qsDvuoU81500fdPGn4uv1HcSnY3X5
         CARiaImyTb5o8SkSU+BQl+NzF0t+Yf5o5BHTKAm+WvI7SSD7dotyo4YyIuXvxquAOj4J
         Y20FmGSTG6duP2gemACPkmKXhHtGeVQtXwZ5cmnSnGLRh0UXR6oh/IB1faWQWGLWoSFP
         e9DGkYZOgDvWwgAY0UMXi0XTY9AcpmZZ7xyVezzEFSQNXjx0vFTJbz1C81kB/QNzTYNa
         4xCisy5PiI6ZCMqLfnA8IsVA+12hZj3RqdK6yVrDXzHa7KSd0qTH17/bHLIrOnHcLQ62
         nwew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNfEddRIOphyC/U4i6KaIOkajJ1qtFPwVhN65+71iv4=;
        b=OMNhNBAJwB7DO6Jc8RF9lvLHvMgCpnZ0ARULhWPeb0P/URANtM/ILZutc8qLe87xAy
         geJy4wfdYOUWPw55GVvZgqkhNFfzIIPIGrtn4nSKx38hmk1JrG5hLe6VsAMZiFFiOy2o
         zjWYWyY28HTf5ejLGrl5UcOrNfWUlIm4WnpX1mJ7Pn/Qw7jufs/cMZcGKuqMlroNhMot
         YeUZ+DBilpVa8sZDim/t8sbuwHV7nfRDiQKDDPuLikRyQh1Yw2aNz6NNfwuBgT1Yh1J6
         wrKSV/Lzq0od58eoBvd+nyNBzYDxbFFip8z2d4oMR9+oghnuCskaWNAke9XLkXyLYJIJ
         l16g==
X-Gm-Message-State: ANoB5plNTdWpkdSMYutLrmKOwAf8PtVSojykS2tRVIp1ns9Bg1ki3+bm
	bMhMsko1eDMjn4z554oqwwvys3tyZyCLA6lY0mOwEA==
X-Google-Smtp-Source: AA0mqf4sJTQzxVAyuyfPndN+cFfXCetE5MzcyHYxSEjRglGqnXHR5+VpVD1/DTblX0u9sfsC1TWJzqUEUB+Gxw/fd3Q=
X-Received: by 2002:a62:b501:0:b0:573:1959:c356 with SMTP id
 y1-20020a62b501000000b005731959c356mr80489363pfe.51.1671286663082; Sat, 17
 Dec 2022 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20221216220951.7597-1-philmd@linaro.org>
In-Reply-To: <20221216220951.7597-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Dec 2022 14:17:31 +0000
Message-ID: <CAFEAcA_Foy+k80r=vjXx2JO1T=2qFT-_7uvPhAuoSz-=XDanBQ@mail.gmail.com>
Subject: Re: [PATCH] exec: Rename NEED_CPU_H -> CONFIG_TARGET
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, 
	Richard Henderson <richard.henderson@linaro.org>, haxm-team@intel.com, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org, 
	Wenchao Wang <wenchao.wang@intel.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org, 
	Cameron Esfahani <dirty@apple.com>, Kamil Rytarowski <kamil@netbsd.org>, Paul Durrant <paul@xen.org>, 
	Reinoud Zandijk <reinoud@netbsd.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Sunil Muthuswamy <sunilmut@microsoft.com>, Peter Xu <peterx@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 16 Dec 2022 at 22:09, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> 'NEED_CPU_H' guard target-specific code; it is defined by meson
> altogether with the 'CONFIG_TARGET' definition. Since the latter
> name is more meaningful, directly use it.
>
> Inspired-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

This feels to me like it's overloading the meaning of CONFIG_TARGET,
which at the moment is "the string which names the header file
with target-specific config definitions". I think I'd rather
we just renamed NEED_CPU_H to something a bit clearer, like
perhaps COMPILING_PER_TARGET (better suggestions welcome).

thanks
-- PMM

