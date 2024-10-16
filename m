Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D33C39A093D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 14:22:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820004.1233501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t132o-0002BX-1w; Wed, 16 Oct 2024 12:22:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820004.1233501; Wed, 16 Oct 2024 12:22:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t132n-0002A2-VP; Wed, 16 Oct 2024 12:22:25 +0000
Received: by outflank-mailman (input) for mailman id 820004;
 Wed, 16 Oct 2024 12:22:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kaV7=RM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t132m-00029u-7i
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 12:22:24 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b830c48-8bb9-11ef-99a3-01e77a169b0f;
 Wed, 16 Oct 2024 14:22:22 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c973697b52so4735967a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 05:22:22 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4d6672sm1670809a12.17.2024.10.16.05.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 05:22:20 -0700 (PDT)
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
X-Inumbo-ID: 4b830c48-8bb9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729081342; x=1729686142; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1w5IAYRBSY/ZaPn84pSvHXsXJIk+tzG7XvUISCCXVo=;
        b=Q0anOV4dPqnQApPQGnbTXN+qcY1QPJivj9XP94ioIoMpWwD2/HMZTuR7aA8JDt2Awa
         svHujha5JRNadmiwtldYJpNVtDe8Fri72IytYk/J28rfJsym310aN7RnaMKMVR3A7Y3M
         WCHMyaoQHTsuEB80EltOz9+oCkSzz/hylTtNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729081342; x=1729686142;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u1w5IAYRBSY/ZaPn84pSvHXsXJIk+tzG7XvUISCCXVo=;
        b=wLLuMRtGOXs6V2AOfpcOQtrabkO2FaZE2NNJsOLJahPIQ2KNo6hSHgdjwut+bRhwfr
         k/o57j0/JU7/uXfWNSB7N29mWtUNn2ZRsvfv12WMQpSXOKDaRq4EmkjarvfPgMwBFxrf
         FEaMZDc7wWk0ZxaSqPJsiaxbah0LuapFumLHUVrAxG9Z9eRu9z+UVtCug5GnA+yRfNv/
         rA2NFr4UvQNmwrXI4Ak+pHqxwn1XQzYv5iMw9cr5Pht2u7hCtEAVd9/PvHNLF8DnxHNz
         Dw0tAOmg/jHFgLk/0rW8hhjuupw7WAQd5HNPhPrpDqadnxn+B/tThfSr7LaBaUXIORpe
         0h/A==
X-Forwarded-Encrypted: i=1; AJvYcCX0ODlHPtYkYbyf27bQKovry4E/S5OcaoiPQM7xzH9tWwSV9X3wonE9c6R21lk0LKimT3pvOnV/Zq4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEeS03jgvr9ZvkTxIOWkbzMs/97hDZJaJWvUsGC3IQukRqjMZR
	YTTFqB1lnZq37nrjN+NnZ8kOGIgIQ3JDyuO8L9HdUTW/DjG5xIhEMrLR8V6r4wU=
X-Google-Smtp-Source: AGHT+IFrV2/t86ARram2Fwswr8T9Glh1b1iwODIQThDpJspxtomgzOB+YccuoVBcfC+Bq9tIvUbwzw==
X-Received: by 2002:a05:6402:2750:b0:5c9:7d87:eb2d with SMTP id 4fb4d7f45d1cf-5c97d87efccmr8542728a12.33.1729081341795;
        Wed, 16 Oct 2024 05:22:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Oct 2024 13:22:14 +0100
Message-Id: <D4X86F05Q1PD.FNSXTCN2F8KC@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86emul/test: correct loop body indentation in
 evex-disp8.c:test_one()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <ded15010-299a-4273-9414-106579677a5f@suse.com>
 <D4X5APOZBQ8R.3IKLCYY15066F@cloud.com>
 <86229731-c999-4c02-a561-e8fc0bb82fc5@suse.com>
In-Reply-To: <86229731-c999-4c02-a561-e8fc0bb82fc5@suse.com>

On Wed Oct 16, 2024 at 11:15 AM BST, Jan Beulich wrote:
> On 16.10.2024 12:06, Alejandro Vallejo wrote:
> > On Wed Oct 16, 2024 at 8:45 AM BST, Jan Beulich wrote:
> >> For some reason I entirely consistently screwed these up.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >=20
> >   Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Thanks.
>
> > We should really give another push to the clang-format effort. This who=
le class
> > of mistakes would be a thing of the past.
>
> For issues like the one here it would depend on whether that would also b=
e
> applied to (parts of) tool stack code. The plans, iirc, were mainly to co=
ver
> the xen/ subtree.
>
> Jan

True, but AIUI that was merely an act of scope reduction for the sake of
getting something merged in a finite time frame. In an ideal world the whol=
e
codebase would be covered, and I think this was a shared sentiment among th=
ose
in favour.

Cheers,
Alejandro

