Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B27EC3E1
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 14:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633644.988682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3G4j-0008RA-AM; Wed, 15 Nov 2023 13:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633644.988682; Wed, 15 Nov 2023 13:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3G4j-0008P6-7S; Wed, 15 Nov 2023 13:37:01 +0000
Received: by outflank-mailman (input) for mailman id 633644;
 Wed, 15 Nov 2023 13:36:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlqS=G4=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1r3G4h-0008Ox-E7
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 13:36:59 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b542760-83bc-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 14:36:56 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso49190875e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 05:36:56 -0800 (PST)
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
X-Inumbo-ID: 0b542760-83bc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700055416; x=1700660216; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7gBCwt2r+ccXs+dhC5v9mdYsXqTjkSdt5veSuXJKiY=;
        b=Emr7TqqgSpxi4YURe9DFFdLAeJbuf78vBenhUyD/MTLz3g1YGs8ZctBxmutsdSo4NM
         Nc0XsFUnPlwJWazbJEeG2qGpWETGQ91nJugxu4GCbHMkc1gFHfdNXgat5qU8Iz0xnH6G
         ps3y2u1I8qu6NO+yHb47vX1ozB/Fw/7pKeAsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700055416; x=1700660216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7gBCwt2r+ccXs+dhC5v9mdYsXqTjkSdt5veSuXJKiY=;
        b=vlAomflmDoMroJF0RDI0QIX/TfxrWrDG2Fn/BfYe3fhTDmLWwHjMVPX/9leG4tlra5
         jliE/w6CsSAkyEoUfdVCh9sqd5VAFpkNAtFn+UYJ+YdKDyvKNfbZJe1FRx6G/dMORk4F
         J2T0Wo4fHvMAp9hVMjXmMxbnIO4bwkcAeQ4Iv6RuuqmZFSXRAKBl9Dm51O6TyX4JRkjT
         iLEzJZJd2T+RQIEaSgD+m7YB9G4NZ/zQmI0ZrtI7UNNvbREbBroZUDazvEHem8vgbSo8
         vZerYyFmdZXl0/jkyBrX2DD3dzbY5YHULQ4vCFDdH+58jthkzph4XhwYSNDoO4AUvUzh
         q5Sw==
X-Gm-Message-State: AOJu0Yw3Q4IOWr4fYI0JHWI1fGrXwcnpt9oHdyOFZzTwTUA/9WFWa352
	ecBTVU7H3LtH5MuCk3nN+ZGhuAi0YJAj5U0QzNO3
X-Google-Smtp-Source: AGHT+IFn+wlTg5jUZSotAAhnqFPSpmjS3x5Kg1n7u7H00VT4qyvmf1svomqlAM0oNNms1qxpECz3Q+oD/4FZ4BuXxS8=
X-Received: by 2002:a05:600c:35cb:b0:409:79cb:1df6 with SMTP id
 r11-20020a05600c35cb00b0040979cb1df6mr11147445wmq.14.1700055415903; Wed, 15
 Nov 2023 05:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20231113160940.52430-1-roger.pau@citrix.com>
In-Reply-To: <20231113160940.52430-1-roger.pau@citrix.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Wed, 15 Nov 2023 13:36:44 +0000
Message-ID: <CAG7k0EqGgyD=PDyRy-GvtZsst_+iUBDHp2LFgk3uEtsrJMe4Ww@mail.gmail.com>
Subject: Re: [PATCH 0/2] livepatch-tools: fixes for building on non-glibc
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 4:10=E2=80=AFPM Roger Pau Monne <roger.pau@citrix.c=
om> wrote:
>
> Hello,
>
> A couple of fixes to allow building the tools on non-glibc systems (BSD
> and musl tested).
>
> No functional changes intended for either of the two fixes.
>

Reviewed-by: Ross Lagerwall <ross.lagerwall@citrix.com>

Applied, thanks.

Ross

