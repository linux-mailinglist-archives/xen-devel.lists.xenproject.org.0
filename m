Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B846969ED
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 17:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495373.765722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyMy-0004EX-GY; Tue, 14 Feb 2023 16:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495373.765722; Tue, 14 Feb 2023 16:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRyMy-0004Bs-Do; Tue, 14 Feb 2023 16:41:28 +0000
Received: by outflank-mailman (input) for mailman id 495373;
 Tue, 14 Feb 2023 16:41:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6HWG=6K=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pRyMx-0004Bh-03
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 16:41:27 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bcf5684-ac86-11ed-933c-83870f6b2ba8;
 Tue, 14 Feb 2023 17:41:25 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id y1so16321069wru.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Feb 2023 08:41:25 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 f5-20020adff445000000b002c53f5b13f9sm13280125wrp.0.2023.02.14.08.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 08:41:24 -0800 (PST)
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
X-Inumbo-ID: 6bcf5684-ac86-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5djcSKT/Rs3aPHyeCmFl4MNhpags+8Pjabq1ljGUlMQ=;
        b=B/I/ZWN939Gh7m3AJcODPyyHXLaEBuYwmhcJcVEewnZgO5xcBG1x1+HxQhacFNkUBh
         jlRq9GVHR20BRKEZY3ji7YV71teZHPsb43S1y5hBj4j2chvW6FoxOX8KIF1iCzf/7jGF
         zX0B2qZBetsgHuTLkHSMNfi1pjvkI87mObMz6TysHWwfEwcVrVkqwP0ExprGTa4H6DNG
         FwIkZ1nObgvVu5uTxD7WcApYknrHFJLzBrnfymip8A88XZ4GxET+odG0BPURrqevOSbt
         LHX7E7WEenoNMscy2W81Vk2qIZDe91XONs57hhEroRAO8eTcpPfsVLpYp69ql5D6k8FQ
         hWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5djcSKT/Rs3aPHyeCmFl4MNhpags+8Pjabq1ljGUlMQ=;
        b=AOFPUUnvzOeXM/LAk9tZUShkR9u+BfN7WdgYGWBkzOdJdJngWzExnNtXEVw2Qs3QVX
         DfGdaySYMQklwPeJIURp+8hlNZ411LKNxGJsJgXODA55U4jdNfw1bGCGQ9e2A9iJhnhx
         RfDo3ebzT6b9BFP4oX41m3tJ1HAlZK1MnV4GZ7iYYE6ozhwPURVyi3fUlRmmVnfHxUj5
         qO0vpt42TwOHRqPttodEZb0+wZyLhH0JBVlTU+Q3RtGOGTAknFLp4hwuV4KXkRHFpdte
         cqQVtERmPhxZHU/HhqtKJrOMLCt5nmOj+S4Wgml+NQrZq5G2dzOo4xh6wC8Zb1FlotIJ
         k01g==
X-Gm-Message-State: AO0yUKW1QfwZReGP3w7fZDI0Bu6RLGXEDZTbBU7uCuPfzqmEGg1GEKlp
	FCj7VuITgx3Q8l/F4pvccsY=
X-Google-Smtp-Source: AK7set+jhx9wrOieIaTVbz2rn7VOqLClRhEDr3V1FUmfkaseyhZ30SNTi3ZovsmrdIIal34h25tkpQ==
X-Received: by 2002:a5d:518b:0:b0:2c5:585e:334f with SMTP id k11-20020a5d518b000000b002c5585e334fmr2565201wrv.41.1676392884971;
        Tue, 14 Feb 2023 08:41:24 -0800 (PST)
Message-ID: <84faf6f53ad8e5cf3e1c8b20afef1b660c5ae7e5.camel@gmail.com>
Subject: Re: [PATCH v1 3/4] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Feb 2023 18:41:23 +0200
In-Reply-To: <3dc6cdd4-30fe-b66a-bce3-44e798576fc4@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <b2f6ed2cd9f02c9f21b716595a158906499a22eb.1675441720.git.oleksii.kurochko@gmail.com>
	 <3dc6cdd4-30fe-b66a-bce3-44e798576fc4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-02-13 at 14:10 +0100, Jan Beulich wrote:
> On 03.02.2023 18:05, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Is there anything keeping x86 from also using the generic
> do_bug_frame()?
> If not, switching over would then likely mean no need for the new
> Kconfig
> control.
>=20
Actually, it seems that it is possible to re-use bug_frame in x86 code
too. Looking at lines 1188 - 1264 [1]
they are mostly the same [2] except for updating of eip [3], processing
of BUGFRAME_bug - was added debugger_trap_fatal [4] and multiple usages
of fixup_exception_return() [5]. But all this stuff can be processed
outside do_bug_frame() function...

[1]
https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86=
/traps.c#L1188
[2]
https://gitlab.com/xen-project/people/olkur/xen/-/blob/generic-bug-h/xen/co=
mmon/bug.c#L10
[3]https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/=
x86/traps.c#L1211
[4]
https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86=
/traps.c#L1244
[5]
https://gitlab.com/xen-project/people/olkur/xen/-/blob/staging/xen/arch/x86=
/traps.c#L1217
> Jan


