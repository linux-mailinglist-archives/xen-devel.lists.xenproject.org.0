Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E330A7F724
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 09:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.941543.1341012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23oh-00034Z-8N; Tue, 08 Apr 2025 07:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 941543.1341012; Tue, 08 Apr 2025 07:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u23oh-00031f-5A; Tue, 08 Apr 2025 07:56:19 +0000
Received: by outflank-mailman (input) for mailman id 941543;
 Tue, 08 Apr 2025 07:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7fLb=W2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u23of-00030n-6X
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 07:56:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0e1463a-144e-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 09:56:13 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-ac6e8cf9132so650929666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 00:56:13 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5f088084f17sm7846004a12.61.2025.04.08.00.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 00:56:12 -0700 (PDT)
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
X-Inumbo-ID: f0e1463a-144e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744098972; x=1744703772; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1j44ElKcVDSRUPPLnlZEk7WntRHqwG4uBiG9hD82OVA=;
        b=lKbyWGWvtPpdrhsuxJ0Jvf6zUmcNBze4PPO3sHOO4ujaxJPq8aSd8liJkIau2mgZUk
         OAZXMmBP7Vb7NR+ulo4szj1AxgzLsihMh2j7P90FcPI7rzCiC/CM3E3AsY6tFzRczcF0
         UE0J7eQ1Q2apsrwUCxjLhbXNaqANmwyWYDWBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744098972; x=1744703772;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1j44ElKcVDSRUPPLnlZEk7WntRHqwG4uBiG9hD82OVA=;
        b=TscgOKLON45DHfUBxcZvO1oZSkXruxC5U8B9zZxuvJSF5I0AMU91AaGZlwnep98BtD
         zBR+kbH4xEfJF60AYcF3N3Y+Qu8FmzDXZ32q3J9y5AkcVoWlm5cmxOoOp070Ls6GGLMQ
         3Ss7lD0lohA++AiO7i0+gjluHMNVPiDcxEkcK1ql2JvGrI7DsGDoLfS+r93ip+AUHkh1
         g/r2k+Kaw2unR9l/NErbTk33bWGBDsS6iJfENlHWA8IH8yn4ETIliBlJhNI5AXkCbWJQ
         wSomxGnqd8r+UYkapKlLbbQlKL0lfaWeErR8aqeUs5pvcK0H037xd9b/+kM/qjgxgWo+
         vyXA==
X-Forwarded-Encrypted: i=1; AJvYcCUU8YZWP1z70cLSuK5ahbx4LA5KsS1P15W2QB2gQ9N2ZO0co+QbVECd2QgcmqzTB3JmeJyIPNnZuSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJ6k5Ddf24HvQXqAcNXSaOUUvovvs0d5Hrg2x+hvhSI0tFQFcA
	u9EdgQUH46cWkwNl7etVj7hzXJFposwv2G9BTkzmUUZHahtDd6+2gaAgWtvTg1A=
X-Gm-Gg: ASbGncspPqO4A7yw+rV7EPnt5d4iyE9x/OezwnDTmCyjo6NMRgi4ZVFAj0eB9L5+Tw/
	qH7Ugwmf2WJ6L7UITXYoqow7FL5DaGXavB1jFEf2L0EDNJg65p0rjbXTcMMKWSPY+2FooA1E5Gt
	i/ddNdBFT52lMePVIlEXK3vbEQs/tu/qtbbpWV91rcj5bEddNpHejjdBdEzyrKgO78sehn/rdSg
	jQx0tfm8XDIAGMyYfz7iTBhHiHvaY6Ll+vuNi+yv6I+I7pp4LXTXC13Hi3M2I1EgUrHAlRWVAGE
	2ZDFZJXjWAG+bRoqnADqJhdCp5OAbpeeE7DNbhD9mtqJ8Fz/jRuKEJgBaEh6
X-Google-Smtp-Source: AGHT+IFrdLzI7Obo3lMHc3o+Bts9IFD9nysuRzY32z6WzIUjIwJ9/ZjASpMly4exe9Ad018boUFWWQ==
X-Received: by 2002:a17:906:6a11:b0:ac2:dc00:b34d with SMTP id a640c23a62f3a-ac7d1cca522mr1154877566b.53.1744098972517;
        Tue, 08 Apr 2025 00:56:12 -0700 (PDT)
Date: Tue, 8 Apr 2025 09:56:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 00/11] x86/EFI: prevent write-execute sections
Message-ID: <Z_TWm1rll_0PyzNQ@macbook.lan>
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <c686844c-4cb8-43d0-a762-7f93a30f9388@suse.com>
 <Z-vpoh858ldjXok_@macbook.local>
 <f71c3298-24df-4d6f-b73c-382d4a112e01@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f71c3298-24df-4d6f-b73c-382d4a112e01@suse.com>

On Mon, Apr 07, 2025 at 04:04:18PM +0200, Jan Beulich wrote:
> On 01.04.2025 15:26, Roger Pau Monné wrote:
> > nxcompat should be enabled by default I think?  I can of course make
> > it explicit by adding to the PE link command line.
> 
> --nxcompat wasn't the default originally, then was made the default for MinGW
> (and by mistake for everything else as well), then it being the default was
> undone for Cygwin. I've meanwhile submitted a patch to undo it for everything
> that isn't MinGW [1]. I simply don't think the linker is in the position to
> declare that every binary is NX-compatible. It's the programmers who have to
> determine that. With the flag not being honored everywhere one also can't
> simply test an EFI binary on a couple of hosts, at least as long as the EFI
> implementation there is a black box.

I think I looked at this reference:

https://sourceware.org/binutils/docs/ld/Options.html

When saying that nxcompat was enabled by default:

--nxcompat
--disable-nxcompat The image is compatible with the Data Execution
Prevention. This feature was introduced with MS Windows XP SP2 for
i386 PE targets. The option is enabled by default.

I guess the intent was to only enable it by default for Windows PE
images?  Anyway, as said earlier, I don't mind adding it.  FWIW, (I
think I commented with Andrew) I did saw this flag was already present
in our PE builds, even in it's current form, so that explains it.

Thanks, Roger.

