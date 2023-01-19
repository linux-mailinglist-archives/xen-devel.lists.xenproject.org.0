Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A679F678D20
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 02:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483373.749514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK7lu-0002L6-3H; Tue, 24 Jan 2023 01:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483373.749514; Tue, 24 Jan 2023 01:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pK7lu-0002IZ-0B; Tue, 24 Jan 2023 01:06:46 +0000
Received: by outflank-mailman (input) for mailman id 483373;
 Tue, 24 Jan 2023 01:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QYlf=5V=gmail.com=bobbyeshleman@srs-se1.protection.inumbo.net>)
 id 1pK7ls-0002IT-Me
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 01:06:44 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cf66f2d-9b83-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 02:06:43 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id d3so13220333plr.10
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 17:06:42 -0800 (PST)
Received: from localhost (c-73-164-155-12.hsd1.wa.comcast.net. [73.164.155.12])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a17090a764d00b00229d06713d7sm7128322pjl.46.2023.01.23.17.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 17:06:40 -0800 (PST)
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
X-Inumbo-ID: 5cf66f2d-9b83-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRi2qQe60p8JdyBRrhIC/m03Eqmvs9ZvQ1CI3E1klMU=;
        b=JQqB4SG/aLtxtFmdYC+9/EX7dT70QFPVlkb1vgPqWfsB2xpuS/s96mYm7osf7cxs0B
         u4jGlJdH2FBCfDN5xo8LtYTwx1rJmCcC5tsUvrawcfBTc2gdk3/ngKBfX7i1868Ballt
         yRqd7uM9Jm43GuZsZVGMjw3hliAQftNU91f4Ww8Psmb5kpIWQcBiv9y3uAJ4RZIqxhaW
         0FDbMrPBjWnRCdqYf8VGuTGOsX2aEg6nMP/tTDDtaN05WfuNTlJpKi7iNgpqY7xh38X8
         TWPWWEJVyHBZnVwZIdDuzXiM6OGRiH5FUmDI2HAeIJLUpZhq1DmC3iwa7YOkQ2IvTvR6
         rQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRi2qQe60p8JdyBRrhIC/m03Eqmvs9ZvQ1CI3E1klMU=;
        b=NaT00w0U6mdeD/P+jB77iFu+gpZ7cyzNOB295Pva4gFlgSx2gBBEfM3DEvd25/G4Nl
         4Ol5LH6XSbqABzPd8/GDo3syQEzZoTvXmErUQOguAn/l1uzgzbsBURWcOPJkQZTFrIuM
         fh043T2VcYfMjVdULKktyDn52sBkn3+mHocQq8pecpJ7cTHA6Tjjm2inbQfzD0OK5fUh
         rnZ2bR58U/Kux4MrgjSjByEEbVVoo1XRGmAjK/aoz0oz5wvC2cWeCWfKmbGYQtxGlsTA
         ML5HB+e2VKm+aeUmnbY3EJ4ptcbcAefvdySlevYCoEqGAjOO2uk16UzzDTauLkEdpbQW
         5Tpg==
X-Gm-Message-State: AFqh2kprdRcq3EBnclxj1Bkzkl5257WEv7nxrOFvWf13ZsWLFD9/D0nV
	fdgm0Z/mTBw22QjOYnvhcDY=
X-Google-Smtp-Source: AMrXdXvGI3JwGo3+pYFVJ4oSyBEBjlF+Ukr5GvNuAcewp98ttJHrAt7wT5fvQC/mgvN0IzbxJeXDFw==
X-Received: by 2002:a17:90a:e617:b0:229:5027:c2d9 with SMTP id j23-20020a17090ae61700b002295027c2d9mr29475918pjy.34.1674522401361;
        Mon, 23 Jan 2023 17:06:41 -0800 (PST)
Date: Thu, 19 Jan 2023 16:10:15 +0000
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: Re: [RISC-V] Switch to H-mode
Message-ID: <Y8lrZ18B8gpAyXTw@bullseye>
References: <18aa47afaebce70b00c3b5866a4809605240e619.camel@gmail.com>
 <Y8lABYJoQ5Qt4DAt@bullseye>
 <d5be3bcd-8835-5a2f-12b0-2b2aaa98b9b4@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5be3bcd-8835-5a2f-12b0-2b2aaa98b9b4@citrix.com>

On Mon, Jan 23, 2023 at 11:09:13PM +0000, Andrew Cooper wrote:
> On 19/01/2023 1:05 pm, Bobby Eshleman wrote:
> > On Mon, Jan 23, 2023 at 06:56:19PM +0200, Oleksii wrote:
> >> Hi Alistair and community,
> >>
> >> I am working on RISC-V support upstream for Xen based on your and Bobby
> >> patches.
> >>
> >> Adding the RISC-V support I realized that Xen is ran in S-mode. Output
> >> of OpenSBI:
> >>     ...
> >>     Domain0 Next Mode         : S-mode
> >>     ...
> >> So the first my question is shouldn't it be in H-mode?
> >>
> >> If I am right than it looks like we have to do a patch to OpenSBI to
> >> add support of H-mode as it is not supported now:
> >> [1]
> >> https://github.com/riscv-software-src/opensbi/blob/master/lib/sbi/sbi_domain.c#L380
> >> [2]
> >> https://github.com/riscv-software-src/opensbi/blob/master/include/sbi/riscv_encoding.h#L110
> >> Please correct me if I am wrong.
> >>
> >> The other option I see is to switch to H-mode in U-boot as I understand
> >> the classical boot flow is:
> >>     OpenSBI -> U-boot -> Xen -> Domain{0,...}
> >> If it is at all possible since U-boot will be in S mode after OpenSBI.
> >>
> >> Thanks in advance.
> >>
> >> ~ Oleksii
> >>
> > Ah, what you are seeing there is that the openSBI's Next Mode excludes
> > the virtualization mode (it treats HS and S synonymously) and it is only
> > used for setting the mstatus MPP. The code also has next_virt for
> > setting the MPV but I don't think that is exposed via the device tree
> > yet. For Xen, you'd want next_mode = PRIV_S and next_virt = 0 (HS mode,
> > not VS mode). The relevant setup prior to mret is here for interested
> > readers:
> > https://github.com/riscv-software-src/opensbi/blob/001106d19b21cd6443ae7f7f6d4d048d80e9ecac/lib/sbi/sbi_hart.c#L759
> >
> > As long as the next_mode and next_virt are set correctly, then Xen
> > should be launching in HS mode. I do believe this should be default for
> > the stock build too for Domain0, unless something has changed.
> 
> Ok, so everything ought to be doing the right thing, even if it doesn't
> show up clearly in the logging.
> 

Right.

> At some point, Xen is going to need a `if ( !hs-mode ) panic();`,
> because we can't operate dom0 properly if Xen is in plan S-mode.
> 
> I suggested that we try and make csr_read_safe() work, then try and read
> `hstatus` to probe if the H extension is active.
> 
> Does this sound reasonable, or is there a better option?
> 
> ~Andrew

That sounds reasonable to me.

The alternative is parsing the isa string from the dtb, which also seems
fine, but I'm not sure if it is better per se.

Best,
Bobby

