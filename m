Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64828AB1D8
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 17:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709156.1108445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqC1-0003jr-0t; Fri, 19 Apr 2024 15:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709156.1108445; Fri, 19 Apr 2024 15:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxqC0-0003hN-To; Fri, 19 Apr 2024 15:30:24 +0000
Received: by outflank-mailman (input) for mailman id 709156;
 Fri, 19 Apr 2024 15:30:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3rY=LY=gmail.com=rosbrookn@srs-se1.protection.inumbo.net>)
 id 1rxqBy-0003hC-T0
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 15:30:22 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc5b3655-fe61-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 17:30:22 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-516d487659bso2572184e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 08:30:22 -0700 (PDT)
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
X-Inumbo-ID: bc5b3655-fe61-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713540622; x=1714145422; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+QTxnZWGbKSlWat3cNzg1IhaEvN4SBhcytuMlfd7Y8=;
        b=RcXiU/lZOn1BV4YuB5b8Ajb1XE2JIBEIN8gvgO19tGaIToOEcpgGNxex1W+prbpigG
         gRaTOIsIkm8ct2wJVRZyt5sDWYDm+ZlB+iqh0AqwwKIgxO+zBsUKP/OX+AvGoAO08Hay
         S/LH5lkGqPWK7kpnF/8NgNU8d+v+XPb4C/Mzik4JEyaEBzj0FALN0Dxm7JrrglitvCx4
         aB1I0NS6kwcDhhL8W+Wmz35VxRap1Phe6PjKo+dHXD8I0fJnUBxaJfI1/G61wvQ+HN8j
         CJkFRejmzdVZStttbs1T1EljKAU3cHBRxmv7iwh7Rnr7mJMRngZcs+HcQCW/xgGeqHvj
         G4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713540622; x=1714145422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+QTxnZWGbKSlWat3cNzg1IhaEvN4SBhcytuMlfd7Y8=;
        b=wcilm5YeZuWSnuaSIqX6KOlrhY8seYVPZnyT3AI9gcTozhHR2QFP/r+d+a1SbpepUs
         fH7yWMEakr+eftnlAYQTuLQiOHLv2VLWFPqcxQ1AIucqzD+2BrIFSVsb7kXQSPOB3cVo
         ZqCBrpMyAFGqNG+HQAhDQMOZs/JWqKGFjd+INoOFZ57f753Vy7br9OH7lX95cKTeG1ut
         P6ghkQDeKzpaOpwH3A1sp6ZekD0AZhcp7zy0oiZGedWIheeYoAzynp9atYBXhzgk9eQe
         MuNi5/kiH3ovsIgy6kUBNqt03RP3JcIZgNyCjqkgA4S56QL/EI/kRejLI4WyQODlMV38
         Yrag==
X-Gm-Message-State: AOJu0Yw7yYvzQhBUjY40V0OzUP85cj/3wVyWsSiN4yZ+OsW05+9Ca6bZ
	Re1bxfY2+Fh9U22fHvnwg2dlk88rSfWwO5VGf2Ayg13EBUszSO3bKnCHOmdyNqlHWPFWG4C2HlT
	eLud4jyFsmZvwr4wS+zfFXj0FghY=
X-Google-Smtp-Source: AGHT+IGWAgGPEGZrzgACnQuRw+xrNR3VBsC5j9g7lpFHSjGdNDN2CJbHuPDYQ/B6UFqkuAELBcWlcEGCY/rV6r5HWhQ=
X-Received: by 2002:a05:6512:4843:b0:516:d002:47cb with SMTP id
 ep3-20020a056512484300b00516d00247cbmr1586789lfb.43.1713540621304; Fri, 19
 Apr 2024 08:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240419135120.830517-1-george.dunlap@cloud.com> <20240419135120.830517-2-george.dunlap@cloud.com>
In-Reply-To: <20240419135120.830517-2-george.dunlap@cloud.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Fri, 19 Apr 2024 11:30:10 -0400
Message-ID: <CAEBZRSeAAk+bjao2-hnrXqV77gsaQGAxLxc--WWeBoYqnwfDCA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] golang/xenlight: Ensure comments aren't
 interpreted as docstrings
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2024 at 10:00=E2=80=AFAM George Dunlap <george.dunlap@cloud=
.com> wrote:
>
> Go has always interpreted a comment directly before a function as a
> docstring, so having the C function prototypes which the golang method
> is meant to wrap in the comment before was always a bit non-standard.
> However, recent versions of `go fmt` now attempt to normalize these
> docstrings as well, leading to strange changes, particularly if `go
> fmt` is run on save.
>
> Go through and put a space between non-docstring comments and methods,
> so that `go fmt` leaves the comments alone.
>
> No functional change.
>
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Nick Rosbrook <rosbrookn@gmail.com>

Thanks,
Nick

