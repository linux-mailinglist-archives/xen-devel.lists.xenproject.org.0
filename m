Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B96872722
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 19:58:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688890.1073621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhZyh-0001ds-4p; Tue, 05 Mar 2024 18:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688890.1073621; Tue, 05 Mar 2024 18:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhZyh-0001bh-1J; Tue, 05 Mar 2024 18:57:27 +0000
Received: by outflank-mailman (input) for mailman id 688890;
 Tue, 05 Mar 2024 18:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhZyf-0001bV-Bg
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 18:57:25 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32ee4834-db22-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 19:57:22 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5135540c40dso1143695e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 10:57:22 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a056512340a00b00513409c4472sm1309286lfr.31.2024.03.05.10.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 10:57:21 -0800 (PST)
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
X-Inumbo-ID: 32ee4834-db22-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709665042; x=1710269842; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WVydwxx6qmSKti8h+I/VwaGiN8g3FTWWDmAIX3/W9w=;
        b=ndxj2oqP06EHVj5IvVD24o0LslXzB3FFtT1ENOF0cPCFhffO5vKFgAbZvrWFFRDEXv
         rb0pXP432g3bQnKMd/PDDagmIJadpWhBRqV5fEA7XtOk23FKWu11pslkRFJ7FCvrcrbp
         35KexwFq09NDcNTttQWcs2XkITUHAA+CoTW6qq4VDPgLLIFZ1NIf7EUeUhvhj7C75jkc
         TkV+znMezVcCL8jz41+MydsRJm1AlnrKzkw56g1LZtCqo1JHbNnB0VfZMDgCHlHL0ML2
         fgte0jdxWlG/z8JzL50WxZL/+cV8WzirUM0RMLBUhDWYjgeQFBRH+gM/l6CWH50ai7AL
         5iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709665042; x=1710269842;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WVydwxx6qmSKti8h+I/VwaGiN8g3FTWWDmAIX3/W9w=;
        b=gik4mLPfHBBebbmzdp5Uy8UGuBSt6hP3dl5evT+IVRl40x86E0UiOa3jKkCeD+10go
         Q/FK1ke65dxip0GD5XhNOUe8YAQ2g0P0ObNi9DGq1D3FoO+mrLlg7ouVCEu3EEYQVLzT
         Ztl91VmGRaY+cYrfdJwMQhkfikBSs3v3691+sJ4InwnYU44yLKckh1+v6/DzfRGutrmy
         swzb9f9cIM5d3yeaQVuPSlzGgTmrjRSliGKGp2JBZmdSVD+otrcWMnf+T8vxeBv6xWRN
         sZTVFT+roiH+1hhC7lYr+TXCzo1H8f337fxtjLGp6Hkamc0ieNOH9bg+rZyXlimPO/O/
         F3Lg==
X-Forwarded-Encrypted: i=1; AJvYcCV29pGHdZfiVw1oJWKZUpEXVviTrrgaLAGXXt6mNmFrqRnIHP/jmkeLsa3qwS3GwIJjjsG7mTdyTMnqcgz2OKFoNSlZcgGrTJNS/7Z/chI=
X-Gm-Message-State: AOJu0YxdsJ0gl3Ga3H9GqSTvhwuNN3Df7z+gOtfy6grEEDarS3LsHa0A
	zL9tsbmBnTuDG4EDJIeL7E3vQhl1/WAFgOvcLZwy77fFRCv2grAP
X-Google-Smtp-Source: AGHT+IFIId0y+YC76TnEEV4w8GFSRvSlBM0QpTQSRnIU72hUrlWcihBk6BKl+zWEpMmJhBUhSAL41g==
X-Received: by 2002:ac2:495d:0:b0:513:f34:3f1c with SMTP id o29-20020ac2495d000000b005130f343f1cmr1770708lfi.27.1709665041652;
        Tue, 05 Mar 2024 10:57:21 -0800 (PST)
Message-ID: <3317829c581ff532e27fcc41c69033e520feec1c.camel@gmail.com>
Subject: Re: [PATCH 1/2] xen/*/nospec: Provide common versions of
 evaluate_nospec/block_speculation
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>,  Michal Orzel <michal.orzel@amd.com>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, Xen-devel
 <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Julien Grall <julien@xen.org>
Date: Tue, 05 Mar 2024 19:56:52 +0100
In-Reply-To: <3d585715-7729-4a5a-b4e4-c0eb96601882@suse.com>
References: <20240304161041.3465897-1-andrew.cooper3@citrix.com>
	 <20240304161041.3465897-2-andrew.cooper3@citrix.com>
	 <c9f92495-2c00-443f-bffd-1b09cb8a8c84@xen.org>
	 <d343c58c-2a3a-45a9-8d67-64d1506d973c@suse.com>
	 <5c06c437-b62c-4bee-8694-1be597887718@xen.org>
	 <141ed8a2-df4f-492c-a192-4ffa7f4c8384@suse.com>
	 <4fb729fa-8519-4244-a795-cc66a79cd346@citrix.com>
	 <c6f9c9fa-a252-41c4-b92f-435c57044cd2@xen.org>
	 <3bc0b828-d3c5-447d-b338-c478d8e337fc@citrix.com>
	 <7df33568918536487ec75a05cd47cee128150c0c.camel@gmail.com>
	 <3d585715-7729-4a5a-b4e4-c0eb96601882@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-03-05 at 16:43 +0100, Jan Beulich wrote:
> On 05.03.2024 16:15, Oleksii wrote:
> > I agree that upon examining the current state of the code around
> > these
> > functions, it appears safe to provide stubs. However, the reason my
> > patch was rejected is that it may not be entirely safe, as Julien
> > pointed out that even with Arm, some functions shouldn't be empty.
> >=20
> > What I would like to propose is that it might be beneficial, at
> > least
> > in CONFIG_DEBUG=3Dy, to have a warning message. Does that make sense?
>=20
> A warning message to what effect? And are you thinking of a build-
> time
> warning, or a runtime one? Plus wouldn't different aspects quickly
> lead
> to proliferation of warnings?
A warning message about that an empty definition is provided for
evaluate_nospec/block_speculation functions, so a developer will know
that it can be an issue.

Personally, I am OK with having this function empty by default as it is
done in the patch with opportunity to being redefined in arch specific
code if it is necessary, but I remembered that I had the similar
questions in my patch series which probably should be covered in this
patch series.

Runtime message can also be an option, but I thought about build-time,
but I agree that it can lead to proliferation of warning, so not the
best one idea.

~ Oleksii

