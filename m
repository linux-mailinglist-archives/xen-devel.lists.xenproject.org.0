Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4F57858A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:35:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369865.601426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRq2-0003br-My; Mon, 18 Jul 2022 14:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369865.601426; Mon, 18 Jul 2022 14:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDRq2-0003ZW-JX; Mon, 18 Jul 2022 14:35:10 +0000
Received: by outflank-mailman (input) for mailman id 369865;
 Mon, 18 Jul 2022 14:35:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FdCD=XX=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1oDRq0-0003ZQ-QE
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:35:08 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d216abb9-06a6-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 16:35:07 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id u19so10836726lfs.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jul 2022 07:35:07 -0700 (PDT)
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
X-Inumbo-ID: d216abb9-06a6-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OWSSskPizbv13pCfhcraXRUYiiPfqJIszhCz/Xu/GZM=;
        b=bwrbIdUWT6h6zVO4ORqAijm8PTDSXYzEhh5bXA1TP0ENe/tmQE5MPIe0naaSZUsdk8
         SA6f23yDaktNNJjUPSy8sLIeURORxWDIsrI1207OvWQxYfIz0K8oOsIlv6sL0Q25Q89J
         KKc4Q+vDeCH6bFbXqjAi7Rm9j/INzrq8WCh9zSfxRQTYXxFD9Wg8PdMyaGFdYvy1oZ4J
         wzB9g5Tdp+8zMVKlfDVJ3EYB0jxbasp/z4UDDHirubS/pFrzKLypWQQZ2VfpBwCaqhlV
         e3g7t0HrqRNQPXUKhE1MyLVbcPYmdrh87cL5zXtnhrNAKlmc5Yx2cLo7w+SOgeS32o5i
         HKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OWSSskPizbv13pCfhcraXRUYiiPfqJIszhCz/Xu/GZM=;
        b=TgmQm6E5JGIip6hBm6Yd0oiXpopVKKS9Wdx6k6iZgPQZCyTA0d1A+oKHFTioamwLCr
         b03bNwxJxwkbZZ7s/CMHUxTjc85ggafO6OvbArTUDqVFPAOCqR//TDb9UfGQLeUFSfWy
         mwUi8kwcrKro9DoUE+m/SJa7EJ5mbmWEnCa/QMmOYLvZZikwHVorOja0/2cWOYq+/zng
         oEOoDoHj/kvkdrixnXtBHU+NpGPN/ZpCKvdLHk73rGKGdukFGdOwGR3n8vKxpghTGM2U
         AaVDv2I5V85TeyjtWdSMCg74KemtNDJXSiHk0k1jtbC3N9gANtfF3DhiCCx3gIJE91Im
         OcKA==
X-Gm-Message-State: AJIora82kFIMc5a98MKRbyng5ANXBVZ7MJ/pfeLAEpzlNetUqtuHC4rB
	fzIJCP63AYLQmMlpvi/ZvPzTjR0xKTkvDhNB6GQ=
X-Google-Smtp-Source: AGRyM1t3EwDb6/uQHaZy5o02XXjffk7DzfQ2iFGyEQxGlhfJgT1YYKdgMtdnvqUvHHbcyoZXtGdpXT7AanUmcNfBjBg=
X-Received: by 2002:ac2:58e2:0:b0:48a:1a12:c4f3 with SMTP id
 v2-20020ac258e2000000b0048a1a12c4f3mr10512331lfo.447.1658154907267; Mon, 18
 Jul 2022 07:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220718140517.14771-1-jandryuk@gmail.com> <3842b4a4-c059-1eb3-c292-f53c5357e502@suse.com>
In-Reply-To: <3842b4a4-c059-1eb3-c292-f53c5357e502@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 18 Jul 2022 10:34:55 -0400
Message-ID: <CAKf6xps4okaLz8Awi5987cFmKpc1GYsHYYQbJoedOYu0OmyDOA@mail.gmail.com>
Subject: Re: [PATCH] x86: Add MMIO Stale Data arch_caps to hardware domain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 10:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 18.07.2022 16:05, Jason Andryuk wrote:
> > Let the hardware domain know about the hardware it is running on.  This
> > allows a linux Dom0 to know that it has the appropriate microcode via
> > FB_CLEAR.  /sys/devices/system/cpu/vulnerabilities/mmio_stale_data
> > changes from:
> > "Vulnerable: Clear CPU buffers attempted, no microcode; SMT Host state
> > unknown"
> > to:
> > "Mitigation: Clear CPU buffers; SMT Host state unknown"
> >
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> > ---
> > Should calculate_host_policy()'s arch_caps mask also be updated?  They
> > are not identical today, but I'm don't know this code to understand why
> > they differ.
>
> I think this wants updating too, yes. I'm afraid I have to leave it to
> Andrew to provide the reasons for the differences between the two.
>
> I would further suggest to also consider adding RRSBA and BHI_NO, even
> if then the title would want adjusting. And finally I'd like to ask to
> add a proper Fixes: tag (or more), as it looks like the updating here
> was simply forgotten when the bits were introduced. Ideally we'd have
> a way for the compiler to remind us of updates being needed (or at
> least be considered) here.

That all sounds good.

Thanks,
Jason

