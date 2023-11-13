Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EAC7E9D9B
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 14:46:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631595.985092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XG4-0000AP-3F; Mon, 13 Nov 2023 13:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631595.985092; Mon, 13 Nov 2023 13:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2XG4-000087-0U; Mon, 13 Nov 2023 13:45:44 +0000
Received: by outflank-mailman (input) for mailman id 631595;
 Mon, 13 Nov 2023 13:45:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b4yj=G2=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1r2XG1-00007P-WC
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 13:45:42 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee2ade2f-822a-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 14:45:39 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-507cee17b00so5863266e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 05:45:39 -0800 (PST)
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
X-Inumbo-ID: ee2ade2f-822a-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699883139; x=1700487939; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNZUl3tOFffMT8/9TCJ9pt/FJdg18vzl/W4qPLTqoNQ=;
        b=VjC2+Sa7/1Ylc6EstrMGRmo8O16uVyxOodWj8H+4m5u2x7mCxZxuWHrtgcCKznE7L0
         MNDFHJw+LFEW4u4QAwnFX8MMItAJj7Z1AKJZGtmuUlWpO+m2Guwp59AgUUzTTqvp9zGb
         zhWSseJYCZ8HF86DyVmeeG+pzVOVwPaVa85vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699883139; x=1700487939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNZUl3tOFffMT8/9TCJ9pt/FJdg18vzl/W4qPLTqoNQ=;
        b=RMDX2LXMeruSCmYQ1JFMRVP6OJAfuRYWqwELi6BI1YOdBCehUvz3jxUmXD7bqRfCgD
         7X2UeW0JDdZ1mYN21aUcJ+vXdx7NaLOvjVEakZVz34wc8OPgd5GMKitfyZaxd4tLnQJs
         3ZzC7uHc4qfsr0Oz2/SkJzsHVzwGn1ZG2akhLIQTU+xzUdtWYoicOau3wmkdQZ2/BoYf
         2yTrNIYYNMfz0iq7rSI2fV0UjcWe3ws0IWCTWFVmW2pRK/KKVK31Rjy8VG7Jke/k96XI
         G0a8HlFdr4X/RnmDMNA1QZIk3Pb2ICCHoxY9119FINJhzvfMfr+Z7dq1lFsz5BrOy6fC
         Ny+w==
X-Gm-Message-State: AOJu0YwqLpZSlKVuJiQU2rJC9svmP5pwRD3yiekq6xYyMuZXCaSrt880
	19g/0bKT0urSZJkND5LghA9GL0HYmKwuJERoCkcpdw==
X-Google-Smtp-Source: AGHT+IHElwJPpKxes7YUsHz9jB3iui0kQDnMYs7URwUo8te36YTi53Fx1u6+6r79ay78Lc+CxLXEi8E70LoR5iCRpBo=
X-Received: by 2002:ac2:54b9:0:b0:500:d4d9:25b5 with SMTP id
 w25-20020ac254b9000000b00500d4d925b5mr4255399lfk.56.1699883138778; Mon, 13
 Nov 2023 05:45:38 -0800 (PST)
MIME-Version: 1.0
References: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
In-Reply-To: <174FCBBC-3C2F-47E9-936A-F1399DD9AFFB@arm.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 13 Nov 2023 13:45:27 +0000
Message-ID: <CA+zSX=Z2O-EoP5AL-vEgeJgf11YGi4fweSy+XFWOAc5TEEJ9dA@mail.gmail.com>
Subject: Re: Clang-format configuration discussion - pt 1
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <Michal.Orzel@amd.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 9:53=E2=80=AFAM Luca Fancellu <Luca.Fancellu@arm.com=
> wrote:
>
> Hi all,
>
> Let=E2=80=99s kick off the discussion about clang-format configuration, w=
ith this part 1 I would like to discuss some configurable
> that I feel are not controversial.
>
> You can find the serie introducing clang-format here:
> https://patchwork.kernel.org/project/xen-devel/cover/20231031132304.25739=
24-1-luca.fancellu@arm.com/
> and there is also a patch linked to my gitlab account where you can find =
the output for the hypervisor code.
>
> For a full list of configurables and to find the possible values for them=
, please refer to this page:
> https://clang.llvm.org/docs/ClangFormatStyleOptions.html

Luca,

Thank you so much for the work that you've done here.

The approach in your v2 series looks plausible, as does a brief
overview of the items in this list.

One problem I have is how to really evaluate the proposed changes.  I
spent a few minutes skimming through the "megadiff" [1] output from
the v2 series, and while everything looked fine, that is a HUGE patch
to skim through.  I don't really have any way to know if there's some
rule introduced that I don't really agree with.

On the other hand, I want to avoid busy make-work and the invitation
to interminable bike-shedding discussions.

Is it possible, for instance, to start with a diff which will enforce
*just these settings* (column width, indentation, and so on)?  And
then add on new coding style changes one (or a few) at a time, in a
way that would make it easier to understand what effect each change is
having?  If so, do you think that's a reasonable approach?

If not, how do you propose to proceed?

Thanks,
 -George

[1] https://gitlab.com/luca.fancellu/xen-clang/-/commit/8938bf2196be66b0569=
3a48752ebbdf363e8d8e1.patch

