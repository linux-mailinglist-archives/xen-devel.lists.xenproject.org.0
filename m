Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACFEACFF38
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 11:23:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008307.1387583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTI1-0003fF-Uq; Fri, 06 Jun 2025 09:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008307.1387583; Fri, 06 Jun 2025 09:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNTI1-0003cl-RU; Fri, 06 Jun 2025 09:23:05 +0000
Received: by outflank-mailman (input) for mailman id 1008307;
 Fri, 06 Jun 2025 09:23:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWpK=YV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uNTI0-0003cd-Nt
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 09:23:04 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9314f31-42b7-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 11:23:04 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4e742dc97so1914945f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 02:23:04 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a532464581sm1310620f8f.95.2025.06.06.02.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 02:23:02 -0700 (PDT)
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
X-Inumbo-ID: d9314f31-42b7-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749201783; x=1749806583; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vDxlvwlA58ZhsEIhri6RBySwLFlTdx7Xvm/kRtk0QwA=;
        b=Pe79+G8+4tjq+8MqUi7QCT+z3bgnHMHu4dGD57fssgPTDArKr79rXC8VbpQiqA5Hlx
         H+SV+g5vctKFX3auEILYQgAC0uSNjnyAdvh2Hfy1OXKbWDgccT5YDGMkjAYXDkOb/Oc+
         rEAXmFAUdf8LVE3v+FpzhbLLnrYuZKGeXsfHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749201783; x=1749806583;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDxlvwlA58ZhsEIhri6RBySwLFlTdx7Xvm/kRtk0QwA=;
        b=vfvddiAR0AQ3CHpZQmPeJ1Ou72C73yvXbtO5IpDQjR0Pz+hQtel6ANg/Z4KRSyk2Qh
         CtlAcqqWP41qxvYjXcScFl/0oVsM1NrNe8PDJvFnx+XKMa49mGPbRIdXs+JVLP24IMd1
         rE5+KHpZtuSMuvJomRlh3fhZu+wmxkJckN+IQpK061759elJSa7MDPRB43mTXqLrf4mL
         RFSEdNPq3aqHOdeSgQ9nKO2nqDmVwQ2PdXIlPx8KtNECmGzoeSReh5gRCwWT3214Lfdm
         sorDGM9ArF/dLGjvl/ux8GEXdSxnFFGB8Y+JInGdE260E8N2V0H1ZAs+fKhdfvmy3MEH
         IAZw==
X-Gm-Message-State: AOJu0Yy1FFhNi2g+JFvsWBOtXjyj4112tZzA3VpIGFkzHNe7g0Vpdi2H
	vTq+zCdq9MVs4L/yV9tXB5oR/w1urg3sucOpjNuCImYNTuFG1hIaa21kRNcXSE5Vsjkvzt8SEdo
	cX4z8
X-Gm-Gg: ASbGncufVEO8yisfJXjhSPqSkeuBE4fDPre8p6uv2KREdaqCK7NxSDyA9ykPV/7+9JE
	HvNNBoECG18p8oLkGngqUIiELPvSuPdbACu2HhYvRLxhIPjulVn2vkGbhJ5EV89xX3rpLMfVNVV
	GqOgqEJbjJLDHy6mGrDs9RjYLcaES2EC+wn+Q3E4Z/3lkTKd1EtKroCGTdVqzIsTL/ybGCvlrhS
	qQTrjMHq9zS3QEnP7VQqJmlcbDjA95mqUYq889lir9H5PkyI4LsTn5CDZm5LuNxjt5kf2BAECaq
	D0QZFE+7TKWEGe/HA3shywGK2hOSpDlkklA1q7WTnom+1DDj4/XTRPNIU0aotJn8ttGBDue6XLe
	mHd8BFYwN6D+mR+9/Mv8=
X-Google-Smtp-Source: AGHT+IHWDLBAAv5bxIu+sSYJCKoiwdCT4iWQTnaFGD/sqri1cHaBnHljsiAosMYzxjsCyx/a/p7vfw==
X-Received: by 2002:a05:6000:2211:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a5314342dbmr2869051f8f.22.1749201783339;
        Fri, 06 Jun 2025 02:23:03 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:23:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH v5 10/10] vpci/msix: Free MSIX resources when init_msix()
 fails
Message-ID: <aEKzdg3HxDF1TjT8@macbook.local>
References: <20250526094559.140423-1-Jiqian.Chen@amd.com>
 <20250526094559.140423-11-Jiqian.Chen@amd.com>
 <aEG482WJWGu_ZHQ6@macbook.local>
 <BL1PR12MB584978D30E02C9D535AF912BE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB584978D30E02C9D535AF912BE76EA@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Jun 06, 2025 at 08:44:02AM +0000, Chen, Jiqian wrote:
> On 2025/6/5 23:34, Roger Pau Monné wrote:
> > On Mon, May 26, 2025 at 05:45:59PM +0800, Jiqian Chen wrote:
> >> When init_msix() fails, current logic return fail and free MSIX-related
> >> resources in vpci_deassign_device(). But the previous new changes will
> >> hide MSIX capability and return success, it can't reach
> >> vpci_deassign_device() to remove resources if hiding success, so those
> >> resources must be removed in cleanup function of MSIX.
> >>
> >> To do that, implement cleanup function for MSIX.
> >>
> >> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> > 
> > 
> > 
> >> ---
> >> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> >> ---
> >> v4->v5 changes:
> >> * Change definition "static void cleanup_msix" to "static int cf_check cleanup_msix" since cleanup hook is changed to be int.
> >> * Add a read-only register for MSIX Control Register in the end of cleanup_msix().
> >>
> >> v3->v4 changes:
> >> * Change function name from fini_msix() to cleanup_msix().
> >> * Change to use XFREE to free vpci->msix.
> >> * In cleanup function, change the sequence of check and remove action according to init_msix().
> >>
> >> v2->v3 changes:
> >> * Remove unnecessary clean operations in fini_msix().
> >>
> >> v1->v2 changes:
> >> new patch.
> >>
> >> Best regards,
> >> Jiqian Chen.
> >> ---
> >>  xen/drivers/vpci/msix.c | 29 ++++++++++++++++++++++++++++-
> >>  1 file changed, 28 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> >> index 674815ead025..cf79320d3b6f 100644
> >> --- a/xen/drivers/vpci/msix.c
> >> +++ b/xen/drivers/vpci/msix.c
> >> @@ -655,6 +655,33 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >>      return 0;
> >>  }
> >>  
> >> +static int cf_check cleanup_msix(struct pci_dev *pdev)
> >> +{
> >> +    int rc;
> >> +    struct vpci *vpci = pdev->vpci;
> >> +    const unsigned int msix_pos = pdev->msix_pos;
> >> +
> >> +    if ( !msix_pos )
> Need to change this check as previous patch, I think.

No, please ignore those previous requests, sorry.

> >> +        return 0;
> >> +
> >> +    rc = vpci_remove_registers(vpci, msix_control_reg(msix_pos), 2);
> >> +    if ( rc )
> >> +        return rc;
> >> +
> >> +    if ( !vpci->msix )
> >> +        return 0;
> > 
> > You cannot short-circuit here, as it then prevents adding the dummy
> > handlers done in the last return.
> > 
> >> +
> >> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
> >> +        if ( vpci->msix->table[i] )
> >> +            iounmap(vpci->msix->table[i]);
> >> +
> >> +    list_del(&vpci->msix->next);
> >> +    XFREE(vpci->msix);
> >> +
> >> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> >> +                             msix_control_reg(msix_pos), 2, NULL);
> > 
> > The above needs to be added even if !vpci->msix.
> Oh, right.
> I will change to
> 
>     if ( vpci->msix )
>     {
>         for ( unsigned int i = 0; i < ARRAY_SIZE(vpci->msix->table); i++ )
>             if ( vpci->msix->table[i] )
>                 iounmap(vpci->msix->table[i]);
> 
>         list_del(&vpci->msix->next);
>         XFREE(vpci->msix);
>     }

LGTM, thanks.

Roger.

