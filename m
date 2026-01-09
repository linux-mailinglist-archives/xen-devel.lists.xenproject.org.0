Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9FD0A546
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:16:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198751.1515578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCM1-0005op-Nw; Fri, 09 Jan 2026 13:16:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198751.1515578; Fri, 09 Jan 2026 13:16:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCM1-0005li-KP; Fri, 09 Jan 2026 13:16:37 +0000
Received: by outflank-mailman (input) for mailman id 1198751;
 Fri, 09 Jan 2026 13:16:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DueL=7O=gmail.com=w1benny@srs-se1.protection.inumbo.net>)
 id 1veCLz-0005ji-LM
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:16:35 +0000
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ae59f5a-ed5d-11f0-9ccf-f158ae23cfc8;
 Fri, 09 Jan 2026 14:16:33 +0100 (CET)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-34f62e71769so496443a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 05:16:33 -0800 (PST)
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
X-Inumbo-ID: 6ae59f5a-ed5d-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767964592; x=1768569392; darn=lists.xenproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BgvTqzeSjXT31U6pknG/MiPGWoCqcBMZzzA9zGh77GQ=;
        b=ifeMD7gVcD8EMxehCzPA6FPZauzSSfUBVaa6mYfzkPKK6TYFg/R6yBi5Gc9AdBWTwU
         Lb7+5PwJ8A631frJzJaF1rH0/Yz7N4N0PgwZ2A4+ITSbOEHSfVa6f1dMmTEGE+W67Lvt
         //Ca/HjdZoSe3lR/3eEiOdz/isgB+vQgGKRhCvXILnlHsPNgdLsPhJzKkz6EYaGNexRl
         7K0CZnexwLklAVA68f/NwbSHNAUBBH5psSvB7rZT1kOqQy5u5ZWZ/5PNB5t3MEONh/7T
         atitxeDpY5kjYAjvD7g6jmhF+fsYUuZ2vD+3qMt+5+6B3fPeaeQRh5iI/KZCEyR4VdeF
         LyDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767964592; x=1768569392;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BgvTqzeSjXT31U6pknG/MiPGWoCqcBMZzzA9zGh77GQ=;
        b=ktbStaxA5EFzRDRC6HezvmvQvL+Zf8pPjEUBSXxERHj6d0ValjAVEe2i4wGbU9Nadf
         uje4zklZBajxyTsbgPiHt+zhmHeONPFra99j/Qkq/B96zayq2b1KnxZyEQnT2MJLeAqe
         zeDAAK7P6LLNWtb6+JRdwJejC91sn3qjiSD8G6kEmcl6BWxFoQ6EN919bzqzaxg4sVKK
         VkuuyWdqy4FpwBZxGFAzlzdhcg6s8TrfGtXKsU35Uk0xeOiKg9/otZeZM42lt9ELLpZL
         FUbqaTaJe23dAQYRenAlZEejQPrvWlAuNuL3PJPXLUvqOfz9xQrpWC+6LIuDBQfGGyQc
         cvcA==
X-Gm-Message-State: AOJu0YyEBvJyKC7+cEnHKITNxFcf1jneH3URVKL9WgbrAWEKpF+Jiytv
	6or6Cb8PO0VV2dzh5f12yB2GbwNJww/a7SpOPFRuPcT5ZP78i0vGp+zvm1lN2OXHie1sZWWwdKq
	PSoAUcKtqAbo7bf3Yo651Dev/aSyfgPDLa6WG
X-Gm-Gg: AY/fxX5LaMPSfVzeIIwFMAJveufbuAKoLxxzaaDuDqRQ3fjNjXprtGaXmNRKWCTMcKD
	rrelero2Cx4slFlUGNPadzmJ2yYQwI5wRgmq/nEeMiNeJBLlpTElTp++AzgArQFY49bmCHcgiQn
	ev61iFX3+S1YtLS+cA+g7d5wnlRvBJS/XfWD5BVMaDLXUzB8U8zspUZ8//E93yIfpyD1OpkrkEb
	0TwogvQtDUTWQCIMccQieYfKZPgQUrMEtoLExAC85L/HvOvKYaXkWwU210OBcYV8sQQcQ==
X-Google-Smtp-Source: AGHT+IEU3DlGDx9ojU+Rvf1Pl0EZloHCsR0BBiJ1SfuceVsAgIpJdofHEnpLXm4HpFsbU1Hd84qjEZyhBzp3VN2aakI=
X-Received: by 2002:a17:90a:e706:b0:341:8bda:f04b with SMTP id
 98e67ed59e1d1-34f68cd1fccmr6084490a91.7.1767964592067; Fri, 09 Jan 2026
 05:16:32 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Date: Fri, 9 Jan 2026 21:16:20 +0800
X-Gm-Features: AQt7F2oRce0KZKMFpZgHnNBXthOJOPhcQJGlwS4rIUZGEyZ2dldlV3w2hu5hh8o
Message-ID: <CAKBKdXiuu7Hg8h444XR2WfAAvDj=j+x1V5HPs=FpHaZ6jBJM9g@mail.gmail.com>
Subject: Resuming with superpages broke VMI/altp2m workflow
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi,
After updating to RELEASE-4.21.0 my VMI tool stopped working.

My VMI tool extensively uses altp2m and sets specific access rights to
various pages in the alt-views (e.g. X-only rights to achieve
"invisible breakpoints"). In RELEASE-4.21.0, I noticed that the
memory-access events were hitting for nonsensical pages.

After git bisecting, the offending commit appears to be 50baf2d
(tools/libs/guest: Use superpages where possible on migrate/resume).

I don't think the issue is really there - reverted VMs work always
fine. Instead, I suspect the issue will be in incorrectly splitting
altp2m superpages, since the issue always appears after manually
setting memory-access rights for altp2m pages.

Best,
Petr

