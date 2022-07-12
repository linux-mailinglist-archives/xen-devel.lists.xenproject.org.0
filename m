Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453A57259A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 21:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366030.596594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLXK-0007P9-UT; Tue, 12 Jul 2022 19:27:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366030.596594; Tue, 12 Jul 2022 19:27:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBLXK-0007MC-RN; Tue, 12 Jul 2022 19:27:10 +0000
Received: by outflank-mailman (input) for mailman id 366030;
 Tue, 12 Jul 2022 19:27:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dIdn=XR=gmail.com=salvatore.bonaccorso@srs-se1.protection.inumbo.net>)
 id 1oBLXJ-0007Lm-PD
 for xen-devel@lists.xen.org; Tue, 12 Jul 2022 19:27:09 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ecf03bf-0218-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 21:27:08 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id g1so11369769edb.12;
 Tue, 12 Jul 2022 12:27:08 -0700 (PDT)
Received: from eldamar (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
 by smtp.gmail.com with ESMTPSA id
 fy6-20020a170906b7c600b0072aed3b2158sm4117961ejb.45.2022.07.12.12.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 12:27:07 -0700 (PDT)
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
X-Inumbo-ID: 9ecf03bf-0218-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=z9G0wguDrAjcjW75nvr7+pGpjBAR/f3spr6nVa+W/E8=;
        b=hdS47UsIc8Fwz4zPSqtXitJJWQN1LCuo4FKPRv16FEUdcOd+jNhAGXk6U/TMsne7CY
         OWPbw7WcL1VYfnvV4p5u8jGRr1SAcNuC3JB/tUIXNd6rga6qu546Urpw38vlw6VCRppW
         xE/eOuxFIUG8W8kJhuH7U2LAWumu7eXZgS2QXB7z15N22+sMxDnTcLWXqP4yW5a2bWWD
         EeB5DzMFNIBX43mfFkybVmzucuCMjWFT2edBJfecKXTc1UQgfJ4ixOR2aMAUxt5Hdbpt
         v+UpC9bB0E+zZ5sVw+pSYlrKo4lWRgG4KJJljjPsKwSAeRAlmX8GmNDoabxxTevf+1kw
         C97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=z9G0wguDrAjcjW75nvr7+pGpjBAR/f3spr6nVa+W/E8=;
        b=DbEa8mmiVeQ5C4zIP1Q4atF8Rvp/BWrLsren0Oup4NULQX/yXCCbB7bnijNmHgIEMP
         QYw9UBrO2EKUNoNNp0xpnqLWOaLsWyNgzuYbW8ElxxpzaSSn9VTodDwoFcczHRbCHg0r
         K6oqAVn3aQprs+2NxgKN1CTzVqfW0IigjIlYWbjF5ZchkBaFc1vYy58sWAkoRJO4SoQq
         3AKto7Fp1NX1Zi6hLFxll1ZUCPzEUmaEoJtfEjjRxv5YCxb5c2enSxNxSTAtiqe60B4T
         UkE8vcE1HnNU3sAldn9v15/Xka3NS9QcvTJA+0rwxPrmEMio/PxuiDM3xXq6zdsX1JFX
         DNVw==
X-Gm-Message-State: AJIora8cjgE77HD2oGuYyYUkNqFt/+p4TXMiqXCogOPamtvr/WjCeZDp
	D5QkBTIOvaUDZzz9zMpdfMU=
X-Google-Smtp-Source: AGRyM1v8019adYsp3ny2RyVvIYKz2DtuN+HXhP1DCr3GueiOWQEx9YpzP62n3PtvTXXlbH7Gs0vgYg==
X-Received: by 2002:a05:6402:cba:b0:43a:6b17:f6b5 with SMTP id cn26-20020a0564020cba00b0043a6b17f6b5mr34455445edb.330.1657654028245;
        Tue, 12 Jul 2022 12:27:08 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date: Tue, 12 Jul 2022 21:27:07 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: oss-security@lists.openwall.com
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
	xen-users@lists.xen.org,
	"Xen.org security team" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 407 v1
 (CVE-2022-23816,CVE-2022-23825,CVE-2022-29900) - Retbleed - arbitrary
 speculative code execution with return instructions
Message-ID: <Ys3LCx6LmRFF547K@eldamar.lan>
References: <E1oBIrq-0007mF-D5@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1oBIrq-0007mF-D5@xenbits.xenproject.org>

Hi,

On Tue, Jul 12, 2022 at 04:36:10PM +0000, Xen.org security team wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
> 
>  Xen Security Advisory CVE-2022-23816,CVE-2022-23825,CVE-2022-29900 / XSA-407
> 
>    Retbleed - arbitrary speculative code execution with return instructions
> 
> ISSUE DESCRIPTION
> =================
> 
> Researchers at ETH Zurich have discovered Retbleed, allowing for
> arbitrary speculative execution in a victim context.
> 
> For more details, see:
>   https://comsec.ethz.ch/retbleed
> 
> ETH Zurich have allocated CVE-2022-29900 for AMD and CVE-2022-29901 for
> Intel.
> 
> Despite the similar preconditions, these are very different
> microarchitectural behaviours between vendors.
> 
> On AMD CPUs, Retbleed is one specific instance of a more general
> microarchitectural behaviour called Branch Type Confusion.  AMD have
> assigned CVE-2022-23816 (Retbleed) and CVE-2022-23825 (Branch Type
> Confusion).
> 
> For more details, see:
>   https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-1037

Is it confirmed that AMD is not using CVE-2022-29900? The above
amd-sb-1037 references as well both CVE-2022-23825 (Branch Type
Confusion) and CVE-2022-29900 (RETbleed), so I assume they agreed to
use CVE-2022-29900 for retbleed?

So should the Xen advisory as well use CVE-2022-23825,CVE-2022-29900
and CVE-2022-29901?

Regards,
Salvatore

