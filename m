Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349767484D0
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 15:19:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559184.873938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2Pz-0000FC-LV; Wed, 05 Jul 2023 13:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559184.873938; Wed, 05 Jul 2023 13:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH2Pz-0000CC-IH; Wed, 05 Jul 2023 13:19:39 +0000
Received: by outflank-mailman (input) for mailman id 559184;
 Wed, 05 Jul 2023 13:19:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ax/R=CX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qH2Py-0000C5-KR
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 13:19:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97391a0f-1b36-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 15:19:37 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51d9695ec29so6611967a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 06:19:37 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05640204cf00b0050bc4600d38sm13102913edw.79.2023.07.05.06.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 06:19:37 -0700 (PDT)
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
X-Inumbo-ID: 97391a0f-1b36-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688563177; x=1691155177;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fNWqkfpY8O+LC0woT+RLk77yDqFKrDnTj3/t36sTusI=;
        b=YcTveAsZ9sQKA38cVjoUweNk6puMB+HXMcXOpdn9COQOphtDv8izLubOW2Gp81pxKc
         aHvhMr3vSDTp8d6Q6z47Knw7MeWkPg1kb5v4wBtHpn98oAwvPeD+ChJAOqD8ljfO4Xnn
         ToCl7PktRS6Pm6AZgWLIRM3esxlhanjZvJj3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688563177; x=1691155177;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNWqkfpY8O+LC0woT+RLk77yDqFKrDnTj3/t36sTusI=;
        b=FQa5HdM07VNBlbwb6t96AfMlv7Otp47HQBP7N19HVncERersG2rhrhQSCVqbXWsjT6
         7yXji/Ea8b7DDfObJ/+64FOBlTyX0zEUIb1ZjeqVFTfU3TYZ3zdTjqi3lFRyeYiZN3aF
         e0JG29c7v5O+XvjOs31DGs/lrnBh8gduzR9NwqzJtF9CIqNlXBxU4D+76AX2JlGburZK
         Gv8lapnjtHT2iSb9Q4/qctEAcPJpMnCnaUyOJht8CS7//MXNAmugRXmMwzfi5GEaSj0h
         ARzBahtitDmBQ2wlVBX/vmrSg2vGf/TNSBHlCcuRNwsuALsklJkiY7U/yGq83O9+SDno
         eM4w==
X-Gm-Message-State: ABy/qLbgnBXYVzEFAk2KoNtt31pi364GkubtJ2qhrgjUofcdrFg0PBrp
	nK4pnY7jnwpfv2+PWBrQMQfFzQ==
X-Google-Smtp-Source: APBJJlE83lVD7cj5ICvUFNipVkGEakx5iPewbWcvjlVwejs+p5tLdwAvv2uTVnryv63Xo0nraVEAHA==
X-Received: by 2002:aa7:de10:0:b0:51e:26a3:1ba3 with SMTP id h16-20020aa7de10000000b0051e26a31ba3mr1451557edv.19.1688563177191;
        Wed, 05 Jul 2023 06:19:37 -0700 (PDT)
Message-ID: <64a56de9.050a0220.a91e8.eeca@mx.google.com>
X-Google-Original-Message-ID: <ZKVt558EsgVrbZTa@EMEAENGAAD19049.>
Date: Wed, 5 Jul 2023 14:19:35 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 3/4] x86: Read MSR_ARCH_CAPS immediately after
 early_microcode_init()
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-4-alejandro.vallejo@cloud.com>
 <0dafce38-e572-3675-7f5f-a44a097abf09@suse.com>
 <64a56c5b.170a0220.c33b5.793c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64a56c5b.170a0220.c33b5.793c@mx.google.com>

On Wed, Jul 05, 2023 at 02:12:58PM +0100, Alejandro Vallejo wrote:
> Something along this lines would be better?
> ```
>           * Microcode updates may change CPUID or MSRs. We need to reload
>           * the early subset boot_cpu_data before continuing. Notably tsx_init()
>           * needs an up to date MSR_ARCH_CAPS.
> ```
That makes no sense. I sent the email before completing the sentence. I
meant:

```
          * Microcode updates may change CPUID or MSRs. We need to reload
          * the subset of boot_cpu_data we got on early_cpu_init() before
          * continuing. Notably tsx_init() needs an up to date MSR_ARCH_CAPS.
```

Alejandro

