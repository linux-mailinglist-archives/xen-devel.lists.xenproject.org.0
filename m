Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D20793FF3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 17:07:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596662.930636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdu7D-00020V-L5; Wed, 06 Sep 2023 15:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596662.930636; Wed, 06 Sep 2023 15:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdu7D-0001xs-I8; Wed, 06 Sep 2023 15:06:47 +0000
Received: by outflank-mailman (input) for mailman id 596662;
 Wed, 06 Sep 2023 15:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0AC=EW=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qdu7C-0001xm-30
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 15:06:46 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd619d98-4cc6-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 17:06:43 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e742a787so737155f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 08:06:43 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 cc11-20020a5d5c0b000000b0031f34a395e7sm14400495wrb.45.2023.09.06.08.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 08:06:42 -0700 (PDT)
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
X-Inumbo-ID: fd619d98-4cc6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694012803; x=1694617603; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QXuin7IP5covAgQK4SZeRZX11R3PRkTRd8e51Jp2B5g=;
        b=jc9a7VFwv5egZRMgJ1lDACG1P6+c000KEY9MdfXd+zHdNutR+Lh0ccG00pCnVkVv1F
         19yQhczE2uFei8qQIhhKT8Aba7lFMHxhmMUIeI8fqbnja4mit2BOjCHEp1a6xMzf4ce3
         3t+hbhFADKsSy1/Jhtil/NcnhJNEgJ6HhNBE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694012803; x=1694617603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXuin7IP5covAgQK4SZeRZX11R3PRkTRd8e51Jp2B5g=;
        b=P87fwhsM/QWH0up0FNAfo5fn0V8Jn3cNnaU557cadheE5weXNsTlPskvAHM9uC4fR9
         nkSWWoXMbj8cVUOmjWCForZnf5Rpq+q/YPpNYtW8AeZu21yPLvk6W7GxiPiv+VXFoZCR
         6Eioyd75d5Rvd6H0VgRUgXhQP+pQZFVu7eXV+SGRMKxhoj+02l0otLrLk1/W4ZFf4e94
         +aqBgCvgvCVF+c/IOYeArsJUlVX3FQzaa+kVDuf2nRyYtYEiwxkSHCQ/kNWnFSBTwBwS
         DYQi55S0SY5OLEz2t6QD0Wlszkq5wJxLCxzl7WdmzGZZJh+HV6Q+583/rrC8yblrh2hv
         DTjg==
X-Gm-Message-State: AOJu0Yz5OpzvBdXOhcmJd0stK7KxDHzkzjJiCGkIpvBKs0qnRvziQ4Vn
	XNrd8nzNudB3z/UfssIBj2sOVg==
X-Google-Smtp-Source: AGHT+IFByzCBFOa+qAD+Tda4Gdo2nblxYMqsoYWs4tCgRUGW5rn5JWxg9E4Vgypvl3Xd8ZMfAitA5A==
X-Received: by 2002:a05:6000:1049:b0:319:7537:b454 with SMTP id c9-20020a056000104900b003197537b454mr2692464wrx.28.1694012802755;
        Wed, 06 Sep 2023 08:06:42 -0700 (PDT)
Date: Wed, 6 Sep 2023 16:06:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 1/2] xen: asm-generic support
Message-ID: <32993819-b4b8-4ee3-bbb9-823ee7a46722@perard>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
 <96b2a4ff48578b7b105581529d2aa6bebd8ad622.1693583721.git.oleksii.kurochko@gmail.com>
 <731b436d-748c-092d-0bec-dcea5bdaed29@suse.com>
 <66fcd43cbcb176f13b5fe2aad53f659feefb9667.camel@gmail.com>
 <627a5863-0ced-956d-f76a-0547cd46c2bd@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <627a5863-0ced-956d-f76a-0547cd46c2bd@suse.com>

On Wed, Sep 06, 2023 at 02:40:29PM +0200, Jan Beulich wrote:
> On 06.09.2023 14:28, Oleksii wrote:
> > On Wed, 2023-09-06 at 14:16 +0200, Jan Beulich wrote:
> >> You've removed quite a bit of functionality, comparing with the Linux
> >> original. May I ask why that is? What they have all makes sense to
> >> me,
> >> and looks to be useful down the road.
> > I decided to take only minimum needed now but if you think it would be
> > better to use the latest Linux's Makefile.asm-generic then I will
> > update it in the next patch version.
> 
> Unless there are things getting in the way, I indeed think it would be
> better to take the whole thing largely verbatim (a few edits are
> unavoidable afaict).

Yes, I think it would be useful as well to take most of the file from
Linux. At least, this would include the "$(unwanted)" variable, which is
used to remove old wrapper when an header is removed from "generic-y".
But instead of the "-include $(kbuild-file)", could you include
"$(src)/Makefile" instead like we do in "Rules.mk"? We don't have
$(kbuild-file) macro anyway, and I don't see the point in using files
name "Kbuild" when "Makefile" works and is enough.

Thanks,

-- 
Anthony PERARD

