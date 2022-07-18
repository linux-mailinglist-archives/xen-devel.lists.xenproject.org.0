Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50885578710
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 18:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369927.601551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTMK-0002Sq-QC; Mon, 18 Jul 2022 16:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369927.601551; Mon, 18 Jul 2022 16:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDTMK-0002QV-N4; Mon, 18 Jul 2022 16:12:36 +0000
Received: by outflank-mailman (input) for mailman id 369927;
 Mon, 18 Jul 2022 16:12:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2blJ=XX=gmail.com=andrii.chepurnyi82@srs-se1.protection.inumbo.net>)
 id 1oDTMI-0002Q1-Li
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 16:12:34 +0000
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [2607:f8b0:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd89ebb-06b4-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 18:12:33 +0200 (CEST)
Received: by mail-ot1-x334.google.com with SMTP id
 k25-20020a056830169900b0061c6f68f451so9523187otr.9
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jul 2022 09:12:33 -0700 (PDT)
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
X-Inumbo-ID: 6dd89ebb-06b4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E97tihP8HnbI/adEmvxCjiADzk+ycuYUVPz4eAZufX8=;
        b=lOi8HISE/WBi5tBpHSDKX3uf5I0ag7Z1hcOUqSfQsB8WgpjH3j8/f/QZYOmeGQkOhA
         lwozyxjT0ude+8GMBFlz/OfdEJ0fgqyxhc5hXKGWnU974ZRj8J3gJyIn088PRUPPMeli
         7u63BA9EauP4odKcKxI+kNwvnSIPUFZ6ojJlctIrDF5ENk9li+0VgBVZiFLBPInvIF4l
         mHbO0g96xEk1O69Jnuguv9jPFqcgl0VAJKMa+LmsLgfNCl2vh04RnUvC7SYd0Yoo46ff
         e95p9xsn6okMoIFy90b/PqkGyFsBOzYOtX+4dc77F+bA1hApG4OKsN86g7prXbyYJ8SI
         TpOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E97tihP8HnbI/adEmvxCjiADzk+ycuYUVPz4eAZufX8=;
        b=4joaILk957IbbAwA464z4VD1/yd8FJ2RLMNItdTxzokdR1hIhc76xymwD0msWs+l5L
         HpMQYKwUuNYtE7ceQbOxJvDrtr2zOHTT9f7TeajqymOM71dXcjsVRiXIPQa8bynNSb43
         ZCVecNRc2TmH5GcpR32AFmdrU5eI/728Ip1LeZBKrYgtsqlzQGQlKXjxf1/slWFqnxsp
         jfuh/yCRjqlsgnbSVEptJmbBesEMnDR3qOhJNU0xExC2h93x55kjXEbFH2ux9kvGhp7I
         S3OcRp8GgqgViNvcVUAPkljRwWtib5Blh+p74eUIEcas8uJOMMUmPHsBJjJKKcA+xW/U
         21TA==
X-Gm-Message-State: AJIora+TJSyoskauVdjsFWwka0/0t9PPHcf5rrZim+wsqlhmlSlgs5g0
	CY3baqo0muJiRNHhKXeYi3SR0BW28mqlTBn5qzo=
X-Google-Smtp-Source: AGRyM1u8zj1bV71F06iwCAEO/iNocAMe7lhHQUtETzV61a63N8I6/58X5nFZOsMn33gIduBYquoztm6MVS22Txbp7qE=
X-Received: by 2002:a9d:7855:0:b0:61c:814f:a7e9 with SMTP id
 c21-20020a9d7855000000b0061c814fa7e9mr7458227otm.315.1658160752397; Mon, 18
 Jul 2022 09:12:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220715225108.193398-1-sj@kernel.org>
In-Reply-To: <20220715225108.193398-1-sj@kernel.org>
From: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>
Date: Mon, 18 Jul 2022 19:12:21 +0300
Message-ID: <CAJwUmVDFPV-cunSVQyLQ2Lk2_pXiAnW+cGSGFQBUaBcq=PxpBQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] xen-blk{back,front}: Fix two bugs in 'feature_persistent'
To: SeongJae Park <sj@kernel.org>
Cc: roger.pau@citrix.com, axboe@kernel.dk, boris.ostrovsky@oracle.com, 
	jgross@suse.com, Oleksandr <olekstysh@gmail.com>, mheyne@amazon.de, 
	xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello SeongJae,

Thanks for the efforts.
I've tested backend patches(1,2) on my custom 5.10 kernel (since I
can't test on vanilla) and it works for me.

Best regards,
Andrii


On Sat, Jul 16, 2022 at 1:51 AM SeongJae Park <sj@kernel.org> wrote:
>
> Introduction of 'feature_persistent' made two bugs.  First one is wrong
> overwrite of 'vbd->feature_gnt_persistent' in 'blkback' due to wrong
> parameter value caching position, and the second one is unintended
> behavioral change that could break previous dynamic frontend/backend
> persistent feature support changes.  This patchset fixes the issues.
>
> Changes from v3
> (https://lore.kernel.org/xen-devel/20220715175521.126649-1-sj@kernel.org/)
> - Split 'blkback' patch for each of the two issues
> - Add 'Reported-by: Andrii Chepurnyi <andrii.chepurnyi82@gmail.com>'
>
> Changes from v2
> (https://lore.kernel.org/xen-devel/20220714224410.51147-1-sj@kernel.org/)
> - Keep the behavioral change of v1
> - Update blkfront's counterpart to follow the changed behavior
> - Update documents for the changed behavior
>
> Changes from v1
> (https://lore.kernel.org/xen-devel/20220106091013.126076-1-mheyne@amazon.de/)
> - Avoid the behavioral change
>   (https://lore.kernel.org/xen-devel/20220121102309.27802-1-sj@kernel.org/)
> - Rebase on latest xen/tip/linux-next
> - Re-work by SeongJae Park <sj@kernel.org>
> - Cc stable@
>
> Maximilian Heyne (1):
>   xen-blkback: Apply 'feature_persistent' parameter when connect
>
> SeongJae Park (2):
>   xen-blkback: fix persistent grants negotiation
>   xen-blkfront: Apply 'feature_persistent' parameter when connect
>
>  .../ABI/testing/sysfs-driver-xen-blkback      |  2 +-
>  .../ABI/testing/sysfs-driver-xen-blkfront     |  2 +-
>  drivers/block/xen-blkback/xenbus.c            | 20 ++++++++-----------
>  drivers/block/xen-blkfront.c                  |  4 +---
>  4 files changed, 11 insertions(+), 17 deletions(-)
>
> --
> 2.25.1
>

