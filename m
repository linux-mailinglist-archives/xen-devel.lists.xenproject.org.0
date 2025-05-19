Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE373ABC0C0
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 16:34:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989900.1373874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH1Yn-0001n1-AT; Mon, 19 May 2025 14:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989900.1373874; Mon, 19 May 2025 14:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH1Yn-0001ks-7b; Mon, 19 May 2025 14:33:45 +0000
Received: by outflank-mailman (input) for mailman id 989900;
 Mon, 19 May 2025 14:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG9i=YD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uH1Ym-0001km-4c
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 14:33:44 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4391faf1-34be-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 16:33:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso43595065e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 07:33:43 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-442fd516a51sm141473145e9.24.2025.05.19.07.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 07:33:42 -0700 (PDT)
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
X-Inumbo-ID: 4391faf1-34be-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747665222; x=1748270022; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ox7Dbgv61pwuI8/vrKMBMI3PAamFjqTf5QkFXQ6JKvo=;
        b=ve/fuCl/oBnEY0HQPlOr1I5h96PI8elD2JqvToBUFaSPKG5aWkDeC0qcDYRIleY+I2
         R5x/Zt6DFbT+20RLn9UXPcJfbBJulOntUu3uAk249Faj26+sORGGh/23LVFp+NJkLfoE
         Yge9ex70bq4rr2ds183feId4Pwj4lBAM7Zfhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665222; x=1748270022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ox7Dbgv61pwuI8/vrKMBMI3PAamFjqTf5QkFXQ6JKvo=;
        b=KZvhcpMqfBmwUxdXk30r5UZc32z/ogN0hXJW7DfiK4FQxsGhsze5NuanLVYbzzmwxD
         ph0O+oMmfrc0eP7flu37X2ZmrYVmkr6R2w4qow7+P/l0a/G/dsykzitneo7M6dFiFxY1
         hru1KpGkyx8XLma9JZ+6SK0rVjiY9V3piZblCHY1Ilz+KuL0cN3iXqQ7rJ6M+rcf3iNU
         PVd4BD0aZi5xRyjhDAQ+R0n6I6z4+YwZIcZxOYVp+0ckoxYNjXR7fFLjiwSsndhoJgNb
         MNbHBXgicZ+gfmb6rOg1og6uLXGB39OkQxzeHlsm047NZnPXpy2SAtECusN+v2PfQsJN
         VM+g==
X-Forwarded-Encrypted: i=1; AJvYcCV9fjz+w87sMKlWBnLgpWxAr+pNtJ+5QJjeXxxzBfWe5r8qjQkpe6v2Ipb4ab0ojjz0LCh7VnCfLSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaHc3CgqeYawNaRcLoVypCS3qXQsLKD8nlqZzXuuHroBcqOkaF
	mChwEKTDA1wpM4tgH8jazBF7Nk5cqwOIQamfiSzxA2HzaeXArHtPpHwDvLRV/SRzu0E=
X-Gm-Gg: ASbGncsKNHfeSd3rcOPt3fC7eFGdPR325USJSfdmXSi0wRR7xORFqqO+2Yo+AGeDvHM
	XOGJujZQqTJMc6JzUbtfUXd8h8ff5gJ7wGiOEH3YhkWyifXmnI+zfCYi2NrwfDNgHcGfNjSAXya
	GgMyZNMVNE3afNhzKC9TJF7cMi2bKtoCbP+f0xkJbIal+EHLMegbHx0jJ+4SMFTiKcZ/fI+cbxL
	EppYG/dP+GxG39j4RIhSeFD83+fUyWvv0YRa/LSyRMhqmsflIKgxds3fS2ctah9uwuGisaKMtnR
	G0TR8gTRJ63CYDtk/agtI3MwJNbflWDtGQpoV5jwJeOwQDIiTyAFZbNufFao5DPN1R1ipouPkiK
	ON1IS31PfjRO67kEjiPnwareqNrqCqQ==
X-Google-Smtp-Source: AGHT+IGpuQxXCUxcmduBa1eJXKGRQpQB10vVFjKfOzMj9Klq1vO4FbSRRH9KvYRVuThpimM3zVq60A==
X-Received: by 2002:a05:600c:c059:20b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442ffc60edemr69596105e9.3.1747665222613;
        Mon, 19 May 2025 07:33:42 -0700 (PDT)
Date: Mon, 19 May 2025 16:33:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
Message-ID: <aCtBRV3cTwTnKuLc@Mac.lan>
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
 <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com>
 <aCsRJBmoP-al6Kgk@Mac.lan>
 <558c7ec2-77ea-42e6-8568-af8b74e19c88@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <558c7ec2-77ea-42e6-8568-af8b74e19c88@suse.com>

On Mon, May 19, 2025 at 03:22:32PM +0200, Jan Beulich wrote:
> On 19.05.2025 13:08, Roger Pau Monné wrote:
> > On Sun, May 18, 2025 at 01:44:49PM +0200, Jan Beulich wrote:
> >> On 16.05.2025 11:45, Roger Pau Monne wrote:
> >>> Not sure whether this attempt to reduce cache flushing should get some
> >>> mention in the CHANGELOG.
> >>
> >> Err on the side of adding an entry there?
> > 
> > Oleksii would you be fine with me adding:
> > 
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index 1ea06524db20..fa971cd9e6ee 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -11,6 +11,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
> >     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
> >   - Linux based device model stubdomains are now fully supported.
> > + - On x86:
> > +   - Restrict the cache flushing done in memory_type_changed() to improve
> > +     performance.
> 
> Maybe better to mention function names here, saying "after a memory type change
> by a guest" instead?

It's not just "after a memory type change by a guest", since
memory_type_changed() is also used for toolstack operations like
io{mem,ports}_{permit,deny}_access(), that strictly speaking are not
memory type changes, neither are done by the guest itself.  I could
reword to:

   - Restrict the cache flushing done as a result of guest physical
     memory map manipulations and memory type changes.

Does that sound better?

Thanks, Roger.

