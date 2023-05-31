Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96B717A5C
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 10:42:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541659.844626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4HPP-0007sF-BX; Wed, 31 May 2023 08:42:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541659.844626; Wed, 31 May 2023 08:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4HPP-0007qQ-8f; Wed, 31 May 2023 08:42:19 +0000
Received: by outflank-mailman (input) for mailman id 541659;
 Wed, 31 May 2023 08:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOFA=BU=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q4HPN-0007qK-OB
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 08:42:17 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0acbb42c-ff8f-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 10:42:14 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso6483110e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 01:42:15 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bg22-20020a05600c3c9600b003f4283f5c1bsm2549802wmb.2.2023.05.31.01.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 01:42:14 -0700 (PDT)
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
X-Inumbo-ID: 0acbb42c-ff8f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685522535; x=1688114535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Osa6hVxTZdMNXuW1v1cwzqZsai20sLwtKYlmBbJRRqU=;
        b=M1ROsHsJwnjZ89apSgITOKrlhXXAt8aM4NwhpsZ9q3BYqQH93jP11khg+auJeK8a5f
         gue9HSh56ehbqjVeHF1XjPH/kme6rnBnEMBY4ZTyCKXFFRyC4bijwZw5yBNWpq36tTg6
         msh6tnEUCrIADgpJdLdekWKD2BvJ5CIYlyz54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685522535; x=1688114535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Osa6hVxTZdMNXuW1v1cwzqZsai20sLwtKYlmBbJRRqU=;
        b=R055RyI+Dhn2E38jW90fkht7p6zzMFKRsvU2us7MnQDumSirLyA9lMcJdlFbt/KKnq
         Dl+s1SovbyKZR0pavv1HLAtPudrTC12aCoWtEc/izYwV++gm/muw88buS2ZyX+PAsrZL
         XNJ4s8lPQaFBCFy4DyAMf8hxb5i8ej3Ok6K+/B4sUo00AjCOgFyJetfxabPmyOu0QP3H
         DNlmrtb4GoA8jp+D232i5THoJu1cCpOHaKckxrw/yA+7Ms7jLGmGi00/6wMwtaF88uhW
         XaUu+NWvapGeLBmXCdk312YV0mz27MmWy3AeQFZOEAgjW2Lk/n2SLVU8fkF8hcmv02ED
         2P/g==
X-Gm-Message-State: AC+VfDyZVfgKDscGocOfDKaxSsVyAgt3hzAQv8YUDcZZtdrrHPmd78fy
	vKTmWghgbRi08QUZcILUWAXS33MVKQlYEBjVzFQ=
X-Google-Smtp-Source: ACHHUZ6+f7F6JUKyaOyaNOXYrEv5GBvVb05c20J98HURKyeck1hZ9prak3v5hnBpfX4Fo6VahfXLXg==
X-Received: by 2002:a05:6512:72:b0:4ef:f09c:c505 with SMTP id i18-20020a056512007200b004eff09cc505mr2063845lfo.37.1685522534956;
        Wed, 31 May 2023 01:42:14 -0700 (PDT)
Message-ID: <64770866.050a0220.c32a7.5357@mx.google.com>
X-Google-Original-Message-ID: <ZHcIZRjx5LzVxi+D@EMEAENGAAD19049.>
Date: Wed, 31 May 2023 09:42:13 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/3] x86: Add bit definitions for Automatic IBRS
References: <20230530135854.1517-1-alejandro.vallejo@cloud.com>
 <20230530135854.1517-2-alejandro.vallejo@cloud.com>
 <bc209116-75ac-06d6-e4bb-eb77b10ac5bd@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc209116-75ac-06d6-e4bb-eb77b10ac5bd@citrix.com>

On Tue, May 30, 2023 at 06:29:14PM +0100, Andrew Cooper wrote:
> ... I've changed this on commit to just "Automatic IBRS".  The behaviour
> is more far complicated than this, and anyone who wants to know needs to
> read the manual extra carefully.
> 
> For one, there's a behaviour which depends on whether SEV-SNP was
> enabled in firmware...
> 
> ~Andrew
Ack.

Alejandro

