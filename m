Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CD8AB10F
	for <lists+xen-devel@lfdr.de>; Fri, 19 Apr 2024 16:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709143.1108415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpaC-0003bo-Jk; Fri, 19 Apr 2024 14:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709143.1108415; Fri, 19 Apr 2024 14:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxpaC-0003aI-GE; Fri, 19 Apr 2024 14:51:20 +0000
Received: by outflank-mailman (input) for mailman id 709143;
 Fri, 19 Apr 2024 14:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=txqa=LY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rxpaB-0003aC-Ki
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2024 14:51:19 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 479c6107-fe5c-11ee-b909-491648fe20b8;
 Fri, 19 Apr 2024 16:51:18 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5196fe87775so2311183e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Apr 2024 07:51:18 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a056512049c00b00519558f5d83sm739569lfq.289.2024.04.19.07.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 07:51:17 -0700 (PDT)
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
X-Inumbo-ID: 479c6107-fe5c-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713538278; x=1714143078; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ygxjPqIm5eQHqgerOw85bsXBdDi0AVVR7rmKodPuu6s=;
        b=RVOuzYCtRcO5ME73su7FxVQAm3Qqjs77X/BHm6SEkHBN3pehFEtsaAMPfPjye+oeNw
         M19Bvb9X9i0Is+qG6BFyGMR5pMUyDl54lSLHfhhX7AnyKYfGnsSxgdto7anzVxgzI33U
         XqTNGL2dQzz3imcV85iwk9gAcid/0LzpN8LhiCBJ0HBbMmC/8KLMdfv3TvUEgMHZTrZv
         E5oA3BcQq2ZDGCQzxGaYe7V/LXTVJHrkjLogdjBmV223vWjHZWb1iKbtlAczVQjlEhsv
         g38+A0im95xjizDlghSIa65HjDqD8/4M4mw5XeOU0nQCBBMpgtNyvsqOcsHPhuIzzCz/
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538278; x=1714143078;
        h=mime-version:user-agent:content-transfer-encoding:date:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygxjPqIm5eQHqgerOw85bsXBdDi0AVVR7rmKodPuu6s=;
        b=ZHaKJiDnYlyVdvkMsngx4WgLICnHKisr7euEHResGy7dLsGtFM8Zm3XSs5BS4dqHnd
         qN+Q7fokqmlT7giP4CbxfUmRObzpRUrj3/zc8sxPAJQTsB7GNb45q5ASi1Q1RHHhl6sy
         6RLJdGGXqJ7twmS4+oiylFPYBvVFGAYeZsekjcXh7fu7zg/jul9FG9FmVbTDCNp1VIjP
         4tcEUVj5RQBTz4D6OmopV6fWqIgIJzyi9pZyI4W3r9G1pAs4yz1dUBH/zr8jyNYwkW/v
         xDc404tKwRP2o8am6olQIVehkjIab/9r5HYSxmzPbWwsTMq8MW9FR4YqFtwnICTz6OX7
         biTA==
X-Gm-Message-State: AOJu0Yw8RWAJnr6Jp9Owq1HdiMJXbDx1u76PKBOv2gR5IbvMdrA0VfcE
	qfhbWoqcC3gMG0nJHFogcD8sahCnpsbgW5iLarPsuUYdCrQxYd2GZ8BX7w==
X-Google-Smtp-Source: AGHT+IHOCQj/w5htOsXPTfmIOyQGUz1CxJDs+lnVQ1CeaSmzejPz2EszuT2pKclmW+OlqbwozjHo4w==
X-Received: by 2002:a05:6512:1d2:b0:516:d8df:2e0 with SMTP id f18-20020a05651201d200b00516d8df02e0mr2004691lfp.45.1713538277539;
        Fri, 19 Apr 2024 07:51:17 -0700 (PDT)
Message-ID: <5b6a6221aad93bb8c7803edb58494a597d5d8f73.camel@gmail.com>
Subject: Last posting date for Xen 4.19 is Apr 26, 2024
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, committers@xenproject.org, 
	community.manager@xenproject.org
Date: Fri, 19 Apr 2024 16:51:16 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

Hi all,

The last posting date for Xen 4.19 is Apr 26, 2024. If you want your
features to be included for the release, please make sure they are
posted for the first time before Fri Apr 26, 2024.

Have a good weekned!

Best regards,
 Oleksii


