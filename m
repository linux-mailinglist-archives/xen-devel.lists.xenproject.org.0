Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56E7EF3BC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 14:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635199.991061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yyV-0003kq-Q6; Fri, 17 Nov 2023 13:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635199.991061; Fri, 17 Nov 2023 13:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3yyV-0003iA-NJ; Fri, 17 Nov 2023 13:33:35 +0000
Received: by outflank-mailman (input) for mailman id 635199;
 Fri, 17 Nov 2023 13:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3yyU-0003i4-0n
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 13:33:34 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6d08846-854d-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 14:33:32 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c594196344so25469331fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 05:33:32 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 t11-20020a05600001cb00b0032de6f95fb3sm2341576wrx.40.2023.11.17.05.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 05:33:31 -0800 (PST)
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
X-Inumbo-ID: e6d08846-854d-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700228012; x=1700832812; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fR9bF3Uprd1ab6wabUhoaMVMySCm9zD9QRQ70ylCa0E=;
        b=n8XBc2pm7dsXxmPMMFJ9lufl+vgtW3r22WRoAHUo+JoLgJ/Sau2QYALD7n90T/yNd7
         3l4oM+j2sjsQHXJnbhwHcVstLeIWiCQm8kS/eZGanxmaxNjBhfEF7yABxTvLViJ/X9vH
         f55rR+7sjvbcCQU0qzBvSMYZMNLNyelWXIY8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700228012; x=1700832812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fR9bF3Uprd1ab6wabUhoaMVMySCm9zD9QRQ70ylCa0E=;
        b=IFLg9vcjT2PZbrK7lJ7D0JwbcvzCi/7+Y8F9RHjx/n7vVb51Zp8cE/GKimKe8KHZ+V
         uzMqTFnRNbyalDZKMGMmrSctSqTKbk8F3c1QlJtIpqI2a6708xB8OBQUAyZiqsx0f9sH
         F3R4Abtfutij4IYtdLgvjWhIe2I+2QrsBAKGUN7pebXhjBhLhHZpwS89eucpZdgpfHa6
         ya/S22Km2ZpLU6r+RlTWSlcPGhY9YT1Y8QFxUYWX7jh3KLynx0CvPYMeZCm/OEb769CQ
         R8PM+bBqpS7BckdD4+o55k52ngxN+nMIhgLKivsAJ1T3MU+enBiD6wcNG7yEXGFvI/3z
         xUCg==
X-Gm-Message-State: AOJu0YyCRy7yGL/p9bzw4VzcW2jqFw6G0H3l9A0usysiJ2xCdpQZ3XAs
	k25urRv6+Lr2pnWMEs1ib9owHQ==
X-Google-Smtp-Source: AGHT+IGjAA3487zDURkRF6r6r4ptXmwGSfGnmkMwNVdaFpB0sojJdbZ9he/ozDDn+/+Qy6bGGywBvA==
X-Received: by 2002:a2e:b0c6:0:b0:2c6:edfd:658a with SMTP id g6-20020a2eb0c6000000b002c6edfd658amr4152729ljl.31.1700228012209;
        Fri, 17 Nov 2023 05:33:32 -0800 (PST)
Date: Fri, 17 Nov 2023 14:33:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 1/2] xen/vpci: header: status register handler
Message-ID: <ZVdrqg4rc_B4sxfu@macbook.local>
References: <20230913143550.14565-1-stewart.hildebrand@amd.com>
 <20230913143550.14565-2-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230913143550.14565-2-stewart.hildebrand@amd.com>

On Wed, Sep 13, 2023 at 10:35:46AM -0400, Stewart Hildebrand wrote:
> +int vpci_add_register_mask(struct vpci *vpci, vpci_read_t *read_handler,
> +                           vpci_write_t *write_handler, unsigned int offset,
> +                           unsigned int size, void *data, uint32_t rsvdz_mask,
> +                           uint32_t ro_mask, uint32_t rw1c_mask)

Forgot to mention, it would be good if you can add some tests in
tools/tests/vpci that ensure the masks work as expected.

Thanks, Roger.

