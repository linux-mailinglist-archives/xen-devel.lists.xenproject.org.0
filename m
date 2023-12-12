Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D280E663
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 09:39:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652733.1018741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyHj-0003yV-GY; Tue, 12 Dec 2023 08:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652733.1018741; Tue, 12 Dec 2023 08:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyHj-0003vU-Dt; Tue, 12 Dec 2023 08:38:35 +0000
Received: by outflank-mailman (input) for mailman id 652733;
 Tue, 12 Dec 2023 08:38:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IzYH=HX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rCyHh-0003vO-EY
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 08:38:33 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3ce37a2-98c9-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 09:38:31 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40c256ffdbcso55939545e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 00:38:30 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600c4f0c00b0040b4b2a15ebsm15737945wmq.28.2023.12.12.00.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Dec 2023 00:38:29 -0800 (PST)
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
X-Inumbo-ID: d3ce37a2-98c9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702370310; x=1702975110; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hgWOSAvFUgceCheTd9cfK2sSRdSk4/oBkTdTk+cD/tk=;
        b=MgSbVjDJyp03G6Mauv2P/ncgq3BmiK0WYgs/LdE6CpCsHyu7IOGvo/P/LcFwbCd+XE
         /OB38AGUxr/f70FMOQQeH+cxGxChe6hMhQMe4X4qdeqDMvYF9xf1yh5h7qNCdQOQSMxd
         XCDf1nLVBmSwviE2+SjyMQ9fR49fK5CKeKdnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702370310; x=1702975110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgWOSAvFUgceCheTd9cfK2sSRdSk4/oBkTdTk+cD/tk=;
        b=cWmTdIrLLRVGxoopINIdjigwjO2wJlJJwmR1mQvdQUWmw7FL2vFtHS8M5wqqTeYAZq
         L6YiXgCtCttN24JBq/Lgbd22YHvyylOeHp8k3XWxXVIVZUO38p0ucsT/644qjroJ86SB
         WwUOSoXQNVS9NS3g1AubUhrO2BPH5Qs0IujOgjaDeb2NbOe0WKZME4j0OZ8BewPIaxnS
         xoga/UCTRMxF1jZcCsKg18nbd99BrSm+r5I+lmB3aWCelQXa/GzLYDLp6U2F1DXHcnZr
         4WHrzIyOrcptjJNgryOT59nfc0Jv7sv8TihVrHKe28oh1BQrf7QiF4FlLVu5GhSDk0Io
         YH8Q==
X-Gm-Message-State: AOJu0YxwMsPnpHJ4HSTWcEcBJ0c3dEtWdWu/ftUIzq5KFRQ4WKzXZxbb
	nom8XM6zjjNKiRFOt/TMijhvTA==
X-Google-Smtp-Source: AGHT+IEMHTK10uBTP16eEbfUBLFaa8mGa9GvSxjF6yio0dday5yCnZdXvxa5sizHN3f7Hw8Cc2tJMg==
X-Received: by 2002:a05:600c:16d4:b0:40c:2c1b:27ab with SMTP id l20-20020a05600c16d400b0040c2c1b27abmr2421067wmn.155.1702370309895;
        Tue, 12 Dec 2023 00:38:29 -0800 (PST)
Date: Tue, 12 Dec 2023 09:38:28 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [OSSTEST PATCH 2/3] create_build_jobs: Enable X86_GENERIC for
 i386 kernel pvops jobs.
Message-ID: <ZXgcBIAkmWrLvo-h@macbook>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
 <20231208160226.14739-3-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231208160226.14739-3-anthony.perard@citrix.com>

On Fri, Dec 08, 2023 at 04:02:25PM +0000, Anthony PERARD wrote:
> This is following a failure to build "arch/x86/xen/enlighten.c" in
> build-i386-pvops jobs with linux 968f35f4ab1c ("Merge tag
> 'v6.7-rc3-smb3-client-fixes' of git://git.samba.org/sfrench/cifs-2.6")
> in linux-linus branch.

Could we expand a bit on why CONFIG_X86_GENERIC is required?  It would
seem to me that option should have been selected by default already?

Thanks, Roger.

