Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC6C805B41
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 18:41:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648171.1012253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZQG-00006D-IW; Tue, 05 Dec 2023 17:41:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648171.1012253; Tue, 05 Dec 2023 17:41:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAZQG-0008Vf-Fr; Tue, 05 Dec 2023 17:41:28 +0000
Received: by outflank-mailman (input) for mailman id 648171;
 Tue, 05 Dec 2023 17:41:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jRF5=HQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rAZQE-0008UJ-IP
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 17:41:26 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8296c933-9395-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 18:41:24 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bfd7be487so2540897e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 09:41:24 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600010cc00b0033340aa3de2sm8062899wrx.14.2023.12.05.09.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 09:41:23 -0800 (PST)
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
X-Inumbo-ID: 8296c933-9395-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701798084; x=1702402884; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TIu81kHNLcUFnzXEDsWPV/BO02CgjvtbH3jmiN2zx80=;
        b=jAo0S2BbAuv/ENjnbY0UptYH9LGXfJgIf6F54Kflh2kxP7ca4fcy6iusGyK/vo5MHg
         P38muVXfPCk0kmw8AepsPTmXhlCHualy0TIDcQaeUiBPJL5fFzrxt0K+2afL9wCuVv78
         FnM8If1rSE/7Gv4Xn0EUCYZ35mQodGqbCbvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798084; x=1702402884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TIu81kHNLcUFnzXEDsWPV/BO02CgjvtbH3jmiN2zx80=;
        b=GfYEl2QCZ9wCjl4oHhbW7Li5hHogi5lh8LSbhtqTk7Z7+JtWuqNl/utKC9M3FsyX+I
         aNQ4C+yMy9TSJVUPcqPNie7dnVxU30CpY2eLgtg66k1/O3olmjJjIBArLOmQXbwagJfE
         I13Q9tBXnFs2ckuievAqihqUuNUZvH7hLOB/9oML6SEcF9sa7eODACizdCO2JB1SziTZ
         bokW4YQUHbkry7CDn1KPdUkFM3BP9p2p6AuKlq8jeB75r/aTXA+MOK15JOAreufqfgkG
         pVSHG9wk8g566qo/rW+oAYmg/N7UytH5Va4uSFSwpkDFC8TBYn4whg8lyCGHOchHtMIs
         w7BA==
X-Gm-Message-State: AOJu0Yxt+/EchjUeYl7tV7mw1zwSJ7GsXyDBgb6LPHUGVlZKll0VQrGA
	I9DsDvF9xSrltz5b+gga0QblvA==
X-Google-Smtp-Source: AGHT+IEFM/kMcyd9FAk5Pf7rQBjSV+Md4yFzZYBQ+C1ZUp/V9UeVYpmt9Hxo72XTRPC65hBg6GL5WA==
X-Received: by 2002:a19:550d:0:b0:50b:fd52:e629 with SMTP id n13-20020a19550d000000b0050bfd52e629mr1526932lfe.125.1701798083979;
        Tue, 05 Dec 2023 09:41:23 -0800 (PST)
Date: Tue, 5 Dec 2023 18:41:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 6/6] x86/vPIC: check values loaded from state save
 record
Message-ID: <ZW9gwvKUODm-busm@macbook>
References: <49a17ffa-c873-4b0f-81ed-9587053ca159@suse.com>
 <bac47eda-012f-492a-a1a4-c478929ba08e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bac47eda-012f-492a-a1a4-c478929ba08e@suse.com>

On Tue, Nov 28, 2023 at 11:36:40AM +0100, Jan Beulich wrote:
> Loading is_master from the state save record can lead to out-of-bounds
> accesses via at least the two container_of() uses by vpic_domain() and
> __vpic_lock(). Make sure the value is consistent with the instance being
> loaded.
> 
> For ->int_output (which for whatever reason isn't a 1-bit bitfield),
> besides bounds checking also take ->init_state into account.
> 
> For ELCR follow what vpic_intercept_elcr_io()'s write path and
> vpic_reset() do, i.e. don't insist on the internal view of the value to
> be saved.
> 
> Move the instance range check as well, leaving just an assertion in the
> load handler.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

