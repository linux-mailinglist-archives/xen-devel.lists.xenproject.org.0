Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8719CE52
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 03:48:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKBR2-0007Ph-9E; Fri, 03 Apr 2020 01:47:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UfN3=5T=gmail.com=kevin.buckley.ecs.vuw.ac.nz@srs-us1.protection.inumbo.net>)
 id 1jKBR0-0007Pc-O2
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 01:47:50 +0000
X-Inumbo-ID: 1fef94f8-754d-11ea-9e09-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1fef94f8-754d-11ea-9e09-bc764e2007e4;
 Fri, 03 Apr 2020 01:47:50 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w10so6689474wrm.4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 18:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6aoVSyUZLXwsf2dSweMcvRNMge3YBSJSwb0zg4UAVwQ=;
 b=oNdFJwdicCNuZNwh9rhP2SBBg07jdDfnoygEX3kl2OSxelUUHNbJdduvvPBqu5sUVp
 zg5p6yN63Gs8kEHXjgYHfOc8tFCePOhEnZ+WQsWtJc1axPNZV9fvlr/7QwQwp2PBoHJz
 KbvgRJ11EEgVRm2PMbvX2jipHhYhjy0NI6r16gXsIeEq8i3lZTix3suK2S0jJ6jPKeT8
 PozSOUebikCupXh9bAuro5JcMJbd06ClndOf68InFjlvAcgAd+sVgK6LAfDm0DOVPD+z
 86nLQ5AL/GwMx4zACgmyAwIPtszKUxQCl5CNsMCnIkZdTDCVciTvkxbD/9nGiswK2DAa
 Lekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6aoVSyUZLXwsf2dSweMcvRNMge3YBSJSwb0zg4UAVwQ=;
 b=mM1rOe8/d4ZwFAKx+jssg/JKhFK4FB6u/KJWaKV4jYt0K/g2EUEvcNiZeiJpath6Df
 ywdLwozMm6eXjFKUOBzCIoIpY6SLpyaLyYKIhiyNoTst/b3l/mql6RIX7MFd6CLQSYj2
 CRb2zj1URHRAiZYC1FEA45YwIT0P3NqicGwoikfhQXq5OatYbrhuMh7P8RC3N896dSnr
 TfwzHSiJv5bRJSDUQs6knFKnmLDM2J9Ot0uRFLygChME+a/GKcP/6Cg3WPBVokIz45Gw
 DlkQnKq9Nj12zT6Ha0h3Sot2X7zWLW+AsAWaVzPSlVxGaJelGEkdc14n3zRCWHSdYkYJ
 mL4Q==
X-Gm-Message-State: AGi0PubbeWs9yUY9BpBEwn6KVV8n0QF/6UTJYBC0o/OPbSj4/zkHzkpT
 Zp4kcWLqKDkCpEFgKD41w37mLRbdKphjiHuzXG4=
X-Google-Smtp-Source: APiQypLucwvVEcRZHLQNdVYxG4vCR9gkJToadmkizyV5SdDXp4KB63Qy2EvoDiovsZ9wg0GiV0J0VOVUqxXPW8Jd/xE=
X-Received: by 2002:adf:e70f:: with SMTP id c15mr6665995wrm.217.1585878469375; 
 Thu, 02 Apr 2020 18:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <CABwOO=doPdSR1PUPLU-X2R6akDGRgBoqMv_wK_sPpkh9jF6kCQ@mail.gmail.com>
 <49bb60b5-d64b-393c-bdd2-a4024e695e6e@citrix.com>
In-Reply-To: <49bb60b5-d64b-393c-bdd2-a4024e695e6e@citrix.com>
From: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Date: Fri, 3 Apr 2020 09:47:37 +0800
Message-ID: <CABwOO=cJqNtWwtoNZwT0NzRDMUxgX5ti_o52AMYhjEXtbj82TQ@mail.gmail.com>
Subject: Re: 4.13: import xen.lowlevel.xc fails with SystemError: bad call
 flags
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 2 Apr 2020 at 20:56, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> We've got a fix in staging
>
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=e19b4b3b55f84e0cfcc02fe5d66965969a81c965
>
> It hasn't been backported to the 4.13 stable tree yet.
>
> ~Andrew

Bingo!

I guess I must have missed that when scanning the [PATCH ] subject lines

Applied and seen to fix the issue for me

Many thanks,
Kevin

