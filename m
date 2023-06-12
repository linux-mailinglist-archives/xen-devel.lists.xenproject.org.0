Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE972C27F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 13:08:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547011.854174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fP7-0008Il-5Z; Mon, 12 Jun 2023 11:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547011.854174; Mon, 12 Jun 2023 11:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8fP7-0008G1-1d; Mon, 12 Jun 2023 11:08:09 +0000
Received: by outflank-mailman (input) for mailman id 547011;
 Mon, 12 Jun 2023 11:08:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C1Pn=CA=rasmusvillemoes.dk=linux@srs-se1.protection.inumbo.net>)
 id 1q8fP5-0008Fl-Hk
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 11:08:07 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6870ed08-0911-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 13:08:06 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f624daccd1so4627642e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jun 2023 04:08:06 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id
 q5-20020a19a405000000b004edafe3f8dbsm1420627lfc.11.2023.06.12.04.08.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 04:08:05 -0700 (PDT)
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
X-Inumbo-ID: 6870ed08-0911-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686568086; x=1689160086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cqc/dWIkGp13SLIIu6IJWBJIUBo6SVnCPSxnZiD/2qs=;
        b=Ee1kxW2zIBpufE5Pd30SjljWSF8bmQ23PvcXOTfBLWDuhuzmi4GNxm81r6THqfr1R8
         TF/XbV/vQPE7NAjqG5CUcG091GIVP+OIZkR2eVbcnqSSGulqYKQ0tS4fGce1Vqz72BEK
         4dnF5FIjP/ixuv50EXQjUSlglRcu6SFfk78g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686568086; x=1689160086;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqc/dWIkGp13SLIIu6IJWBJIUBo6SVnCPSxnZiD/2qs=;
        b=j/x7UCqsAcXHwcEJK5ZcG0lcl9i2GNluKik4HKww6wUQdx9izUocK/5wWVfULU28Gb
         J9Guz122jmbMIdWa7dFPWtVhx5y1XXcZRH7HIS9maOqj7PSJ+u9GF5iAkoKxOWCuJ0RS
         sHsomr4tj795DyyRqvdUkaZ54R2cRWaa5CtnaM6wtU+HojqWKlWV9kCVbmT2Vv/oqI14
         JkpHWYk7p2ixwwq3zQ1P4RHsTYDZRKFe/sX2G1Mj9NpNtCwUFkWd++oL5KVI/iPBy80+
         647g+yezRDUFJWXoG5uTIV2sbIf7bs0Ms1JmWvSFYbQhwBn89i3dUKLkDx2izcwOTWKw
         gz8Q==
X-Gm-Message-State: AC+VfDxy+U5YmyFNszHWQB2P7dWQG0qE3dTMOX9SbeRl5GiuPehL9Z4T
	vYgpBjiCpK82sb8qBDVy383FKw==
X-Google-Smtp-Source: ACHHUZ7b8SUOyAvo5mZ/ej3K8XSkF1lyVZaH5wXsQAhZBy44s+7p1e2LN2fuBFmbbRRFjOsD8ITAwQ==
X-Received: by 2002:a05:6512:3123:b0:4f3:a723:1dc6 with SMTP id p3-20020a056512312300b004f3a7231dc6mr3958647lfd.52.1686568086176;
        Mon, 12 Jun 2023 04:08:06 -0700 (PDT)
Message-ID: <546e2ab5-f520-c85e-d6f4-ca7b02457d4c@rasmusvillemoes.dk>
Date: Mon, 12 Jun 2023 13:08:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/4] vsscanf(): do not skip spaces
Content-Language: en-US, da
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Christoph Hellwig <hch@lst.de>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-4-demi@invisiblethingslab.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20230610204044.3653-4-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/06/2023 22.40, Demi Marie Obenour wrote:
> Passing spaces before e.g. an integer is usually
> not intended. 

Maybe, maybe not. But it's mandated by POSIX/C99.

And of course we are free to ignore that and implement our own semantics
(though within the constraints that we really want -Wformat to help us),
but there seems to be existing code in-tree that relies on this
behavior. For example I think this will break
fsl_sata_intr_coalescing_store() which uses a scanf format of "%u%u".

Sure, that could just say "%u %u" instead, but the point is that
currently it doesn't. So without some reasonably thorough analysis
across the tree, and updates of affected callers, NAK.

Rasmus


