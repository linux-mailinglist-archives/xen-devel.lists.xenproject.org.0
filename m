Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3914D8C775E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:16:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723311.1128050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7axT-0000e2-Gt; Thu, 16 May 2024 13:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723311.1128050; Thu, 16 May 2024 13:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7axT-0000bc-E7; Thu, 16 May 2024 13:15:43 +0000
Received: by outflank-mailman (input) for mailman id 723311;
 Thu, 16 May 2024 13:15:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7axR-0000bW-Tz
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:15:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64308ffc-1386-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:15:40 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so3501033a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 06:15:40 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bebb56fsm10527900a12.33.2024.05.16.06.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 06:15:39 -0700 (PDT)
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
X-Inumbo-ID: 64308ffc-1386-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715865339; x=1716470139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MnSS4hSoCWtkefUSxw1ivBpTMCEMzONTA3RqAl7piS4=;
        b=IG0joNHKxScd6OkrD/9oQqLgvsHJf9ASpgaFOzs5F3ZdJ3gRBH5ydfFrD3mPD7KI/K
         ZFcelOf99FsEYeD+CjrEZQJjLtw6L37qinAHPkghwZdFtHkMONcxlnF8JeVW3EfE8Wno
         HGtvELuhjxv94hh23GbuU64JAFpGhi1p4fae0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715865339; x=1716470139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnSS4hSoCWtkefUSxw1ivBpTMCEMzONTA3RqAl7piS4=;
        b=HIM6nFIA5jUBB+y6YvVrfZwX6ZAO/j3k2nzYtLPWYPJrkczb/EfgdDWAInzpPNAdb3
         GA7DVP026xh23/c+mPLfZ3MiojROhljKyY3GtVDgVGBnoFWGtRpX1o+Qgea1anpkLjbi
         pfeP3knOGJlwIXRliaNF3xQLpxm6AONDZd5AK3quBrRB6z6s9m1pf1jr7s8Vt/VzawoR
         VI8tRt+2rSGljToa6+uKqZjZ6jXNo3ye81bBZuFP+Ah6vvXCuj+WxcxkEp2wmZMGMSJO
         HXpQeh3RgS1JIM9w3S8lCWxgOyPfbGD5cqfTKbby7Kn74A40/f386ZubuP8qVpLs7A3x
         b96A==
X-Forwarded-Encrypted: i=1; AJvYcCXSqo9HuQLUUwT+1RbMBac0Mljgge/x5Cq+GVpkqJ4o7qu/ycDXgv1vD2dTCMjk/NcoHDQosLQUoe3qDzS/yPimeJT/o0ieeRtHxpp9by4=
X-Gm-Message-State: AOJu0YxRrwgySoCbyDj7xaer+iph5V08YoLwh6syysbNj+/znIZh4zX8
	bLtWBywlxJ0xlzPgdXb+QF12Hh03/57LR87t7VBMCxhsCHn9tQ5SvP5q+0w7esQ=
X-Google-Smtp-Source: AGHT+IHxTT7K41Nkg6kQcl8zYMmNCxsyoYCpa+lvNkL7GumtZfjOOO4o8Nao7aVMbfGHLEw9pMOf/A==
X-Received: by 2002:aa7:d294:0:b0:574:eb43:3865 with SMTP id 4fb4d7f45d1cf-574eb433921mr4634714a12.32.1715865339456;
        Thu, 16 May 2024 06:15:39 -0700 (PDT)
Message-ID: <1c98ba15-fcbf-4fa1-aa0e-39de8bdfb5fa@cloud.com>
Date: Thu, 16 May 2024 14:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: Add install/uninstall targets to
 tests/x86_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240516110710.3446-1-alejandro.vallejo@cloud.com>
 <cf8cfb82-7a69-4690-8afb-d971dbe8b7e3@suse.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <cf8cfb82-7a69-4690-8afb-d971dbe8b7e3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 16/05/2024 12:16, Jan Beulich wrote:
> On 16.05.2024 13:07, Alejandro Vallejo wrote:
>> Bring test_x86_emulator in line with other tests by adding
>> install/uninstall rules.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> I'd expect such a change to come with a word towards what use the binary has
> on the installed system.

First of all, having some tests installed and some not is highly
confusing (See [1]).

> Imo we should not randomly put binaries in place
> when there's - afaict - absolutely no use for them outside of development

I don't disagree, but that's (imo) a packaging matter. For reference
XenServer has a xen-dom0-tests package for this very purpose, so we can
install it or withhold it at will.

Being able to validate that the development invariants still hold on
whatever machine you happen to be running on is generally a good thing,
I reckon.

Cheers,
Alejandro

==============================

[1] (grepped for the install target in the tests folder)

[snip]

--
./paging-mempool/Makefile:install: all
./paging-mempool/Makefile-      $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
./paging-mempool/Makefile-      $(INSTALL_PROG) $(TARGET)
$(DESTDIR)$(LIBEXEC_BIN)
--
./xenstore/Makefile:install: all
./xenstore/Makefile-    $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
./xenstore/Makefile-    $(if $(TARGETS),$(INSTALL_PROG) $(TARGETS)
$(DESTDIR)$(LIBEXEC_BIN))
--
./depriv/Makefile:install: all
./depriv/Makefile-      $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
./depriv/Makefile-      $(INSTALL_PROG) $(INSTALL_PRIVBIN)
$(DESTDIR)$(LIBEXEC_BIN)
--
./cpu-policy/Makefile:install: all
./cpu-policy/Makefile-  $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
./cpu-policy/Makefile-  $(if $(TARGETS),$(INSTALL_PROG) $(TARGETS)
$(DESTDIR)$(LIBEXEC_BIN))

[snip]


