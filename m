Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223193157B1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 21:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83416.155200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Zcd-0005lJ-7i; Tue, 09 Feb 2021 20:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83416.155200; Tue, 09 Feb 2021 20:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Zcd-0005ku-4e; Tue, 09 Feb 2021 20:28:31 +0000
Received: by outflank-mailman (input) for mailman id 83416;
 Tue, 09 Feb 2021 20:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p39W=HL=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l9Zcb-0005kp-K7
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 20:28:29 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2233fe9b-025f-42cc-9aeb-d368ef3c7ce7;
 Tue, 09 Feb 2021 20:28:28 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 190so4466398wmz.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Feb 2021 12:28:28 -0800 (PST)
Received: from CBGR90WXYV0 (host86-180-176-157.range86-180.btcentralplus.com.
 [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id o18sm6116550wmp.19.2021.02.09.12.28.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Feb 2021 12:28:27 -0800 (PST)
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
X-Inumbo-ID: 2233fe9b-025f-42cc-9aeb-d368ef3c7ce7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=46I3FtWtKWr70b2Tg3d0U944LEcVXMR7JWoWN107KGQ=;
        b=K6DAsgh/y9k1u823HKaI69dj520lamXxZ0Xj15uZDkndO20UiCzWh4U6ktQ7nv+2wo
         0UbvCK3tj54KMSQ3d06EtS4tQQsxk0zw4XGVm7ud5JXT+XVuCi9qROXc971Ox5JGwEB+
         O7SDwXVP4JZiDw598p1CmHxu+TXqD+9zzpZGV6SeInZPy5VDhxJh4YZaeHAdUB5mv7V6
         Imo2PeGHAtYHjfjkNw7nbnblX0/bD8M2w7VL2qrdNUEPhvxHEurOIsJP/xtsrxIAIq2z
         CtY5h8h0Q//zlWk0YoQVKr7qr41/yWmtiT0wh919sADEAp7y5lhb3mvO4Kgbgi8mYRlM
         tI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=46I3FtWtKWr70b2Tg3d0U944LEcVXMR7JWoWN107KGQ=;
        b=dw1r775CkiHeBlPFCEeQeuYQVKXYqDGW+HWfuRGq3b1Duba/606ubdizd8dNQ8ryod
         RFsvsnG08+wSHJoYADaWfZnWHXXNmJ3Bsbj/1UUF4WRnhkRjwlLG6EKt9pQN2CY3SfDt
         KUTzy+ImHurP7TpvrLuf49YRJPkOlTP9D5mcNR/vAO3jF9ccQKPimkkNVVLOxXpksO1g
         /DLowfWrxoszsLDAHyT2AkhAhIwhf4zfUILo0uCyEPBJenKkVQI+/ir8ltriuJEdjqNK
         Z+8dauTNQnrw4bexLV1jkXssVvGqhYVxy5iHAJDGSoJXw/sdx4Ai4SnJqvwiiJbB1HfX
         u45g==
X-Gm-Message-State: AOAM530zzKEFdIs305Hhk3X33rYVdFR8Txf44DVvp9Wmel1DF01PO4Cr
	Acmwa4v9DVjc+pwOdf1FIik=
X-Google-Smtp-Source: ABdhPJxXVF4yN4vgbbIychghmloXYhdMZr08LXGGKN1/kjTxDa9cpsKaitMvRjZMZBJRw2crTB+CDA==
X-Received: by 2002:a1c:3185:: with SMTP id x127mr4971652wmx.117.1612902507926;
        Tue, 09 Feb 2021 12:28:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
Cc: <hongyxia@amazon.co.uk>,
	<iwj@xenproject.org>,
	"'Julien Grall'" <jgrall@amazon.com>,
	"'Jan Beulich'" <jbeulich@suse.com>
References: <20210209152816.15792-1-julien@xen.org> <20210209152816.15792-4-julien@xen.org>
In-Reply-To: <20210209152816.15792-4-julien@xen.org>
Subject: RE: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the domain if it is dying
Date: Tue, 9 Feb 2021 20:28:26 -0000
Message-ID: <04f601d6ff22$1f52cf60$5df86e20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJkA3sfHUQVO5jg8t87X8qwyW0VowHF7mi9qSgLgIA=
Content-Language: en-gb

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 09 February 2021 15:28
> To: xen-devel@lists.xenproject.org
> Cc: hongyxia@amazon.co.uk; iwj@xenproject.org; Julien Grall <jgrall@amazon.com>; Jan Beulich
> <jbeulich@suse.com>; Paul Durrant <paul@xen.org>
> Subject: [for-4.15][PATCH v2 3/5] xen/iommu: iommu_map: Don't crash the domain if it is dying
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> It is a bit pointless to crash a domain that is already dying. This will
> become more an annoyance with a follow-up change where page-table
> allocation will be forbidden when the domain is dying.
> 
> Security wise, there is no change as the devices would still have access
> to the IOMMU page-tables even if the domain has crashed until Xen
> start to relinquish the resources.
> 
> For x86, we rely on dom_iommu(d)->arch.mapping.lock to ensure
> d->is_dying is correctly observed (a follow-up patch will held it in the

s/held/hold

> relinquish path).
> 
> For Arm, there is still a small race possible. But there is so far no
> failure specific to a domain dying.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> This was spotted when trying to destroy IOREQ servers while the domain
> is dying. The code will try to add the entry back in the P2M and
> therefore update the P2M (see arch_ioreq_server_disable() ->
> hvm_add_ioreq_gfn()).
> 
> It should be possible to skip the mappin in hvm_add_ioreq_gfn(), however

s/mappin/mapping

> I didn't try a patch yet because checking d->is_dying can be racy (I
> can't find a proper lock).
> 
> Changes in v2:
>     - Patch added
> ---
>  xen/drivers/passthrough/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
> index 879d238bcd31..75419f20f76d 100644
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -272,7 +272,7 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>                              flush_flags) )
>                  continue;
> 
> -        if ( !is_hardware_domain(d) )
> +        if ( !is_hardware_domain(d) && !d->is_dying )
>              domain_crash(d);

Would it make more sense to check is_dying inside domain_crash() (and turn it into a no-op in that case)?

  Paul

> 
>          break;
> --
> 2.17.1



