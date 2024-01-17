Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3B830453
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668394.1040567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3ri-0001PQ-17; Wed, 17 Jan 2024 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668394.1040567; Wed, 17 Jan 2024 11:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3rh-0001Nb-TL; Wed, 17 Jan 2024 11:13:49 +0000
Received: by outflank-mailman (input) for mailman id 668394;
 Wed, 17 Jan 2024 11:13:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nKNn=I3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rQ3rf-0001NP-U8
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 11:13:47 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aee2cc7-b529-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 12:13:45 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e87d07c07so10316305e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 03:13:45 -0800 (PST)
Received: from localhost ([213.195.127.68]) by smtp.gmail.com with ESMTPSA id
 q14-20020a05600c46ce00b0040e7306f655sm11852803wmo.22.2024.01.17.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 03:13:44 -0800 (PST)
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
X-Inumbo-ID: 7aee2cc7-b529-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1705490025; x=1706094825; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1zCmrZV7W9u4ZP4ToBoC/feR3qJ+1tDpDWxA05TrOMU=;
        b=Wt05RoRYUeFxldeXyHCAs9F2pmTme88e/R6n8Lq90lrjx5fLYhCfgxBuvSi0gbuZXc
         ek1MUHleGPNPrsAqPoTPHw88hThNNGS9YQ/Iy5WUWUBmfSoj9LdH4Hc+SSuAMCKw6TNe
         xadCDgcZwXUXOH7qRNG9Nb5/gsOSs1iev3EWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705490025; x=1706094825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zCmrZV7W9u4ZP4ToBoC/feR3qJ+1tDpDWxA05TrOMU=;
        b=kL0SSxIpCZ33RVKiYOx+CoIsOioBK1PzkZDFH13/6kNZBmI+VSHCdMBri8awhig8Q4
         0DlRRdg3Jbo24Q5JHbyEGqFk1DMH9Ex7gm3/Z6tmp+MfTKwqxNFXxYBM1E5R66J4VZjM
         m20Xe4kmxxRhANl/PyyTvDiNUNKN3e43M1eXRXD8SGm+NDCWKsE+AEzPygFhHU/gwso/
         QZyODGU9aYdaJJejo9vxKHJspky7LngDxhu8trfEhT4w0mCneKzJv34h8DjiLWknHvYs
         gLft8e2DcEkcSXi2uaiuhJJI6Q2Slb76lKQLEuCL0X0Y9nGySCPf0i+1Wgxjkybkb+dq
         Ysnw==
X-Gm-Message-State: AOJu0YzGM/+4aPQ8Z0H0CXESHjz2+vV5N3gRgFFiU9AZ3lDT/ME5AB4K
	o4+sJyBizA5FjU/PnI/57sJ6wTJRgPDFgg==
X-Google-Smtp-Source: AGHT+IEkXJPzDt5855uijbUXJsXQywEGzRzCN4nxMHei/ZinZgWjvSAPSEZsTjWF36W6VlbftB8unA==
X-Received: by 2002:a05:600c:4752:b0:40d:39bb:b8eb with SMTP id w18-20020a05600c475200b0040d39bbb8ebmr5407966wmo.118.1705490025139;
        Wed, 17 Jan 2024 03:13:45 -0800 (PST)
Date: Wed, 17 Jan 2024 12:13:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/PVH: Dom0 "broken ELF" reporting adjustments
Message-ID: <Zae2aJu5PqX9ruPq@macbook>
References: <fda7586f-a1d1-4500-a6c4-d0e010223ee2@suse.com>
 <ZaerAAt1EnFAZpo3@macbook>
 <de31c22f-6cb8-40dd-bb00-1e523fc3e9be@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de31c22f-6cb8-40dd-bb00-1e523fc3e9be@suse.com>

On Wed, Jan 17, 2024 at 11:42:53AM +0100, Jan Beulich wrote:
> On 17.01.2024 11:25, Roger Pau Monné wrote:
> > On Wed, Jan 17, 2024 at 09:53:26AM +0100, Jan Beulich wrote:
> >> elf_load_binary() isn't the primary source of brokenness being
> >> indicated. Therefore make the respective log message there conditional
> >> (much like PV has it), and add another instance when elf_xen_parse()
> >> failed (again matching behavior in the PV case).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/xen/arch/x86/hvm/dom0_build.c
> >> +++ b/xen/arch/x86/hvm/dom0_build.c
> >> @@ -570,6 +570,8 @@ static int __init pvh_load_kernel(struct
> >>      if ( (rc = elf_xen_parse(&elf, &parms, true)) != 0 )
> >>      {
> >>          printk("Unable to parse kernel for ELFNOTES\n");
> >> +        if ( elf_check_broken(&elf) )
> >> +            printk("Xen dom0 kernel broken ELF: %s\n", elf_check_broken(&elf));
> > 
> > I would rather use "%pd: kernel broken ELF: %s\n", in case this gets
> > used for loading more than dom0 in the dom0less case.  The 'Xen'
> > prefix is IMO useless here (I know it was here before).
> 
> Can do. But if I do, I'd like to bring PV in sync with this as well,
> right in the same patch. I hope you don't mind that.

Sure, please go ahead.

Thanks, Roger.

