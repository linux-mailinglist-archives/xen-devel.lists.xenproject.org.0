Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89324B18107
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 13:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067169.1432116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnsz-00039l-CL; Fri, 01 Aug 2025 11:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067169.1432116; Fri, 01 Aug 2025 11:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhnsz-00038N-9d; Fri, 01 Aug 2025 11:25:17 +0000
Received: by outflank-mailman (input) for mailman id 1067169;
 Fri, 01 Aug 2025 11:25:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYZz=2N=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uhnsy-00038E-AS
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 11:25:16 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f576e42-6eca-11f0-b896-0df219b8e170;
 Fri, 01 Aug 2025 13:25:10 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3b79bddd604so1131041f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 01 Aug 2025 04:25:10 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4589ee4f0easm63027195e9.16.2025.08.01.04.25.08
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 04:25:08 -0700 (PDT)
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
X-Inumbo-ID: 2f576e42-6eca-11f0-b896-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754047510; x=1754652310; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0StIsGSq261gefJP6NHZmfvZQo3NODpE+T+uQM4u284=;
        b=if8HSb725wUqjuW2+oKX0WnoRiiijGLHN1kOUQ0AWYmvxJCfrKCuCIjEcOlOD12meC
         Tn3O1/vpkKY2r8APSl2YA9/obzPbb9DSr3OqBAmLW0JI1GUuyR3z3hcT++sBOYqcbd6b
         ANpdIkBEPlP8pNq8Vxg4JCUGn05FchIiOhe8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754047510; x=1754652310;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0StIsGSq261gefJP6NHZmfvZQo3NODpE+T+uQM4u284=;
        b=BQQ2bZDzQXsWd9zsFa2d3J/nOg0dIxIznu0jKrqvqt/VJuqlX4U8fOBRDe406O+6mu
         CabvxeapLcEJnfdvVjAFDByYTAGzILUkBwTFZcVdAoqqNPqzSZPoJGssWgn6ufEhsGQT
         dOT1dn56zQ3yD2c9zBtO3/pox9dWDbrb3nQ8zAM7s6rIO8X0rnxUSN/bnm1UU/zv6uYl
         ozSHL1A2YHA1VKEyAfVWIwysTKLA93xT5UfK9jkSCZt49cy9T5GPyGOwiE7NxnQzd8X8
         jPz2QeTa8DqcEzjQxV6hpYk3cpdkYgOa6VPdtKTfqYN13yfRUTCdH18U7wF56um7EirJ
         pVpQ==
X-Gm-Message-State: AOJu0YwlnEMfAnpat+yc6hFGVkyxr+tFI1mU3UyP+crtAMAYkulOGngx
	/fNwBO8zBsul/PRiKkt/0c0LESiRfP5lPR9ySyLvJmxuHbZooUcqk59bH/HLT+2xwT3hKhmQ55J
	BUDtTs38=
X-Gm-Gg: ASbGnctyQX4VU/RQGjR0zEus2AQ8WhsNYij0nLaynuyTN9NLMR8/IpO00LyRw6dQE9n
	Au0wEi/j17Mxh15ACQDatgoFxzweX3Hq1dxcDceV7YgyCnkS5yNKmLEGE0Q9GHBR7Xq1zEek2Xa
	itPp9qABrhsXbPDt92csJ6ad0WWXd5ycN10oH8PiBuR8uxNoYAEAyGCKme1v3b2I/CLU8CVMTZo
	3kzXxME1qVGcFigz8D+19x429mkipE6U9uGKDUnsZvUcLIxYIbkp5KUaKFi5P9+bqPrmGzTKjs6
	erR3xG0ni7DH+cfWOLw5ULChAddSpkQUUBscEdyqbAC8t9HkBiPL3VfexRqsG+MBDmva8/jY3fF
	Guzc7rXJKSLlBECZu7JnQlU/eHFZoouMgb9gwAT8ScxdShBQGbo6+qA369hfCRfGQ+DoK
X-Google-Smtp-Source: AGHT+IFlyS0f0sruAKsFjJU5urJlVWiY7p/7VJLssKo3A9u26xxu82c9gtvgbvqH9uqPYpW6rVjKuQ==
X-Received: by 2002:adf:a297:0:b0:3b7:970d:a565 with SMTP id ffacd0b85a97d-3b7970da81bmr6750756f8f.46.1754047509607;
        Fri, 01 Aug 2025 04:25:09 -0700 (PDT)
Message-ID: <e742cee1-450d-4df0-a3a6-af635a940472@citrix.com>
Date: Fri, 1 Aug 2025 12:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Console vs serial
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

There's a long-standing irritation in Xen, whereby printk()'s which
occur prior to console_init_preirq() get half-lost.

They end up in the console ring, and hence are available via `xl dmesg`,
but they're missing from serial console.

e.g. these 4 lines don't escape

    (XEN) Enabling lockdown mode because Secure Boot is enabled
    (XEN) Lockdown mode is enabled
    (XEN) Ignoring cmdline option 'hap_2mb' in lockdown mode
    (XEN) Ignoring cmdline option 'hap_1gb' in lockdown mode
     __  __            _  _    _  ___   ____
     \ \/ /___ _ __   | || |  / |/ _ \ |___ \


This is from a testcase failure I've just debugged, but the issue is not
specific to secureboot.  More generally, any diagnostic from cmdline
parsing ends up in this state.

For PVShim, we did a gross hack to assume the PV console is usable right
from the outset, but all other console configurations don't start
working until the cmdline has been parsed.

Is anything stopping us from feeding the current contents of the console
ring into serial in console_init_preirq()?

~Andrew

