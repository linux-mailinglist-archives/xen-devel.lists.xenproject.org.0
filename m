Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C1AAD998
	for <lists+xen-devel@lfdr.de>; Wed,  7 May 2025 10:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.978308.1365132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZoF-0004jJ-M7; Wed, 07 May 2025 08:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 978308.1365132; Wed, 07 May 2025 08:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCZoF-0004gs-IK; Wed, 07 May 2025 08:07:19 +0000
Received: by outflank-mailman (input) for mailman id 978308;
 Wed, 07 May 2025 08:07:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zuHe=XX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uCZoE-0004gh-2I
 for xen-devel@lists.xenproject.org; Wed, 07 May 2025 08:07:18 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ab4f4d9-2b1a-11f0-9eb4-5ba50f476ded;
 Wed, 07 May 2025 10:07:17 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a0af41faa5so797835f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 May 2025 01:07:17 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a099b0f09dsm16235239f8f.63.2025.05.07.01.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 01:07:16 -0700 (PDT)
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
X-Inumbo-ID: 4ab4f4d9-2b1a-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746605237; x=1747210037; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0LTDaA3ljtlXW+nKR4kuaHTdtxYzvsEP3eLi6r9UJE=;
        b=bRYNNqW0z3Am3+rjSzbvsm9A0eS1hrzUjwhHHFwWmoYi30pJqOrkT/pBs4nYhj1G04
         A6VB9nqff/CVuzgcXveAWYS2F3AA5LjGRn5TsFGsmRu2gvMKawmJ5kIeoUmP6S8wDbcn
         wupcNCniJdX7KNNkBxjq1B+PAD5MQJ+xuOe+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605237; x=1747210037;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0LTDaA3ljtlXW+nKR4kuaHTdtxYzvsEP3eLi6r9UJE=;
        b=rDj9+7ZNcenEUmn1zTdFLHphc6aLOrCTWn7eaM6gakA+m6/PPoDNvGlHMAaA3X/Ufv
         pF3C0nxYieQ1bO42K8ptZAbnQrZukNGXJVtndVPn2n/JC4/SqMIT2uEjDc3iAkDi21dc
         DCc77qOB0D7ia28Xmrw4Mryhsxgpf08CBzYmy+AHCk1OOSt4fKoMGPK1z5UHlNxaKmqF
         fN605oJWq7z1ZqdBwrnHgiNRu1M18kbyx1XRyePrZzYPNrxRDgXrKMJvrQP7JuAR2fFL
         5iwzxXdVJ//UGf5tyQaX0B/qR5owrKsBjccu1FKB8ZzIA8yhCq4Q9hwutVaq6EQbymTX
         ZFGg==
X-Gm-Message-State: AOJu0YzPN+1Lvmp9De2sm660604tFj1j7jar7/jS7/V6Cjs03MGSc93o
	ZDXJsyxzLG4NDGfASZRPe4JMrY6RcvKvr6LepjTarDw1N3mlQAg0U8v2X76OfnSGccFbCo96RiZ
	O
X-Gm-Gg: ASbGncvGjVQ2Q/PNsla3A35n+XV30I5QmQ1as7hwx3YyRVB3U4hxQFaBpNh4J3MPSsb
	5lzJoQCV43/INpbDipfmlRGJNJYmCzVGOfjFJ2wG40PjamK81TaHd2U38pqP7kEzi7eqhMglP3W
	o+wmpw//ifQ/yUhw/oycFf6Ne9rHDV/Opu+CBNUo+I+5eoPpqOavgtc5vlLATyjSO4+L4YgSFbN
	rDDh106fzWa2Ta0q4CzzvuadhqfSKO18ceZCPIN7O4NXDoCbxrhGLYAddGOgyT/Ervhm40CQIwn
	s0yWIuQ7FY6p7rEn7Zgs4GeWjOasJTlwFnCwzzsUHTUNUA==
X-Google-Smtp-Source: AGHT+IHPfTnHxnDNqcSmJiTJpz1NyZfKz+SEnAHHkUv77kysGNB+h071CopvpjHWL7HDUBRvyd7kaQ==
X-Received: by 2002:a05:6000:220e:b0:3a0:7a8f:db22 with SMTP id ffacd0b85a97d-3a0b4a2368emr1845285f8f.24.1746605236583;
        Wed, 07 May 2025 01:07:16 -0700 (PDT)
Date: Wed, 7 May 2025 10:07:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v3 06/11] vpci: Hide legacy capability when it fails to
 initialize
Message-ID: <aBsUs4i_8LsPsq4D@macbook.lan>
References: <20250421061903.1542652-1-Jiqian.Chen@amd.com>
 <20250421061903.1542652-7-Jiqian.Chen@amd.com>
 <aBoyBlRFG8W8wJla@macbook.lan>
 <BL1PR12MB5849C99BAC94BC5754897CB4E788A@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB5849C99BAC94BC5754897CB4E788A@BL1PR12MB5849.namprd12.prod.outlook.com>

On Wed, May 07, 2025 at 06:38:45AM +0000, Chen, Jiqian wrote:
> On 2025/5/7 00:00, Roger Pau Monné wrote:
> > On Mon, Apr 21, 2025 at 02:18:58PM +0800, Jiqian Chen wrote:
> >> +    }
> >> +
> >> +    /* PCI_CAP_LIST_NEXT register of target capability */
> >> +    list_del(&next_r->node);
> >> +    spin_unlock(&vpci->lock);
> >> +    xfree(next_r);
> > 
> > Here vpci_remove_register() could also be used, but it will involve
> > searching again for the register to remove, which is a bit pointless.
> Yes, so just keeping things here instead of calling vpci_remove_register()?

I would add a small comment that we avoid calling
vpci_remove_register() to not have to redo the register search.

Thanks, Roger.

