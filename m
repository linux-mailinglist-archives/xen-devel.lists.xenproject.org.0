Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 943BE773A7B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 15:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579888.908078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMkd-0006vd-NN; Tue, 08 Aug 2023 13:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579888.908078; Tue, 08 Aug 2023 13:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTMkd-0006sk-JY; Tue, 08 Aug 2023 13:27:55 +0000
Received: by outflank-mailman (input) for mailman id 579888;
 Tue, 08 Aug 2023 13:27:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTMkb-0006sC-Su
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 13:27:53 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fe9dd3c-35ef-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 15:27:51 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so8763764e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 06:27:51 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020a25ad0e000000b00d59ac349fe0sm431377ybi.25.2023.08.08.06.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 06:27:50 -0700 (PDT)
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
X-Inumbo-ID: 5fe9dd3c-35ef-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691501271; x=1692106071;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NoQrogLV9f5a5mnrTdAisY2Um7UDzKxPXcl25SM3U04=;
        b=eyP5qe/EmJhArZ8mNk+WDiEx+C7k3o3fKsxQt+6X4AH1pbMXedscRsNHyjqufzauIc
         S4rVGyIDGMhF/0bPOZYcjrUMmwnyPEUVxMVdIhFzIr7e0eSugkeL7S2HiDey0QCPrwsZ
         x2/1cAVyKIstAHUQK37doSlFLq5SVdN77QLuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691501271; x=1692106071;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoQrogLV9f5a5mnrTdAisY2Um7UDzKxPXcl25SM3U04=;
        b=CrZ9ctuqbj5AU4T3Bql2wLN1ODcp6cmShZOEokQi0CqYKTnX3by7LvVeVYrr1rNFvn
         I7XMbF9XjDTJY+duuHHB/da+yoVbYuhZe2QR8BRcOR6s50EEokPL+ORZpZsEvctbJxzt
         kOpMnUQFvo6qY5PW2b/GPiBVPIkPgIDQQswBBWcWSRNCG8mIuVk6nsuRVJk7yU3r+TAB
         mO9QFbW72JdLTrFr0KeLN1bUZr4X9FnyNhE5kb6IqO4KAODDEwAt80+dKP7McsO5dvu2
         wY3bwwFxeHTVfqX6KCkTzuEq1FwMna/l+5L9/1DbfLB2YbYiUB5NXOXxTFT59n81e4i/
         n3uA==
X-Gm-Message-State: AOJu0Yx42cEcHcEkvAbzCTC8iLef89Zg89+tDQFj5sSNOnaSyh/VZw2A
	WTYtcvNXCH+Ti0cNQXl8/PkeAg==
X-Google-Smtp-Source: AGHT+IHYtuFP80fZIYZobFnijetCi53/w7Gpsd2lBsHcrZLuTWwOR76UNvXkTfFTUOoXW3x80WAc4w==
X-Received: by 2002:a05:6512:3b29:b0:4fd:faa5:64ed with SMTP id f41-20020a0565123b2900b004fdfaa564edmr10967056lfv.11.1691501271248;
        Tue, 08 Aug 2023 06:27:51 -0700 (PDT)
Message-ID: <64d242d6.250a0220.6b78d.2b35@mx.google.com>
X-Google-Original-Message-ID: <ZNJC0iDJA5yax1Zg@EMEAENGAAD19049.>
Date: Tue, 8 Aug 2023 14:27:46 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v7 1/3] x86/microcode: Ignore microcode loading interface
 for revision = -1
References: <20230808130331.27995-1-alejandro.vallejo@cloud.com>
 <20230808130331.27995-2-alejandro.vallejo@cloud.com>
 <efee9d93-e1d8-6606-0e97-3f63ecefc8be@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efee9d93-e1d8-6606-0e97-3f63ecefc8be@suse.com>

Hi,

On Tue, Aug 08, 2023 at 03:08:04PM +0200, Jan Beulich wrote:
> On 08.08.2023 15:03, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/cpu/microcode/core.c
> > +++ b/xen/arch/x86/cpu/microcode/core.c
> > @@ -867,10 +867,23 @@ int __init early_microcode_init(unsigned long *module_map,
> >          return -ENODEV;
> >      }
> >  
> > -    microcode_grab_module(module_map, mbi);
> > -
> >      ucode_ops.collect_cpu_info();
> >  
> > +    /*
> > +     * Some hypervisors deliberately report a microcode revision of -1 to
> > +     * mean that they will not accept microcode updates. We take the hint
> > +     * and ignore the microcode interface in that case.
> > +     */
> > +    if ( this_cpu(cpu_sig).rev == ~0 )
> > +    {
> > +        printk(XENLOG_WARNING "Microcode loading disabled due to: %s",
> > +                              "rev = ~0");
> 
> Sadly there now looks to be a newline missing. Easy to add while committing,
> I suppose, and with it added (back)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan
You mean the missing newline after "%s"? It fell under the cracks
while adding the substring in v6. It should indeed be there, cheers.

Thanks,
Alejandro

