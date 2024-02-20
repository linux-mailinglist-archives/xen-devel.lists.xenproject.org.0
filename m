Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109B85BA2B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:18:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683423.1062930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcO8y-0004p7-Qf; Tue, 20 Feb 2024 11:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683423.1062930; Tue, 20 Feb 2024 11:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcO8y-0004mK-Nb; Tue, 20 Feb 2024 11:18:36 +0000
Received: by outflank-mailman (input) for mailman id 683423;
 Tue, 20 Feb 2024 11:18:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vNk=J5=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcO8x-0004mE-6t
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:18:35 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c826ed33-cfe1-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 12:18:33 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40fb3b5893eso29571785e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 03:18:33 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 c5-20020a5d4f05000000b0033b684d6d5csm13206583wru.20.2024.02.20.03.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 03:18:32 -0800 (PST)
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
X-Inumbo-ID: c826ed33-cfe1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708427912; x=1709032712; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XQWief9wkdRpDTRDFY5HHvLHLfu6vYANbFCesfEoTaI=;
        b=eT3FJZyIb7AsbKTkMaVq8PjZ3I25GCTFSGf2ZYmI/RhjNPr+ibzYo2n9S8gufsQGVl
         zoe6V3rj2/TXkBEqJDPV6FKhPC298qKwtbQKp//Oc3aQusOUXJ7xB+GqbWp8U18lPV6D
         nlUN9TJbo1XPZ+LDUKSfsLLJMUlIndPBmzEJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708427912; x=1709032712;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQWief9wkdRpDTRDFY5HHvLHLfu6vYANbFCesfEoTaI=;
        b=RIbneO4X/tXxqYYH8yWDnAiangbNJiO2kc/B1VmaW2OtwQHsCfuj2BKTviPXwTzMMJ
         Yc4HEtoDn08rz7FJq6R5qJu/E1yNRydS7Kj5awEH6RfGf4oppR7/zfNpThXBIH4kixsn
         bHmgYZBpHAeglCvMVLtFD2XXUYjCyVz2TBLy9lpKHjsIOg600Lw4NTG/nQRhI58U84Nj
         GBJHPJtQPfcfTrvI5V0k0lGri2Amfe+oHy02JweEz1WBJcC1pYkHTQVvgIGtcu9nj8ZA
         SOtZvJaf6KtFsfA6NSltQB2xEfJMDMXanAgw35LNVe8C/AqpVXlfFtgyK4J25wg10LUb
         Ry6A==
X-Gm-Message-State: AOJu0Ywfjz9PafUw5dGRJ8Zqtk2L6BHjKl7P0gBQv9TrkzKA3/YEDDu7
	gmOj61smhLloTdcxZK32ss9sLvCNnN82JrUvjaK7SCEU6m1e4yiWu5NWl/PjNpQ=
X-Google-Smtp-Source: AGHT+IFJuoE7Ny2aPZu+noNSiySkulsQ5z5YltJbJG4fRmbptWgxkdCh4rtXGehG1jHiaLMwz35KDw==
X-Received: by 2002:a5d:530f:0:b0:33d:20d3:b876 with SMTP id e15-20020a5d530f000000b0033d20d3b876mr6914057wrv.34.1708427912398;
        Tue, 20 Feb 2024 03:18:32 -0800 (PST)
Date: Tue, 20 Feb 2024 11:18:31 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] build: make sure build fails when running kconfig fails
Message-ID: <b7c22718-ec6c-470e-be72-e613b2af3c54@perard>
References: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55c3a781-17f8-47f2-9629-515e1aea77aa@suse.com>

On Tue, Feb 20, 2024 at 09:43:56AM +0100, Jan Beulich wrote:
> Because of using "-include", failure to (re)build auto.conf (with
> auto.conf.cmd produced as a secondary target) won't stop make from
> continuing the build. Arrange for it being possible to drop the - from
> Rules.mk, requiring that the include be skipped for tools-only targets.
> Note that relying on the inclusion in those cases wouldn't be correct
> anyway, as it might be a stale file (yet to be rebuilt) which would be
> included, while during initial build, the file would be absent
> altogether.
> 
> Fixes: 8d4c17a90b0a ("xen/build: silence make warnings about missing auto.conf*")
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Just to make sure, this patch is a workaround to a harmless bug in older
version of GNU Make which print spurious error messages, and said bug as
been fixed in GNU Make 4.2, right? Bug report:

    bug #102: Make prints an incorrect error for missing includes
    https://savannah.gnu.org/bugs/?func=detailitem&item_id=102

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -375,6 +375,7 @@ $(KCONFIG_CONFIG): tools_fixdep
>  # This exploits the 'multi-target pattern rule' trick.
>  # The syncconfig should be executed only once to make all the targets.
>  include/config/%.conf include/config/%.conf.cmd: $(KCONFIG_CONFIG)
> +	$(Q)rm -f include/config/$*.conf

Maybe this should say "include/config/auto.conf" instead of using "$*".
"syncconfig" is going to generate "auto.conf" and not "$*.conf". And it
would make easier to find the "rm" command via "grep".

>  	$(Q)$(MAKE) $(build)=tools/kconfig syncconfig
>  

Thanks,

-- 
Anthony PERARD

