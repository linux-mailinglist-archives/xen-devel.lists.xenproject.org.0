Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E0E8CAB6D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 12:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726735.1131088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MKy-0005p0-UV; Tue, 21 May 2024 10:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726735.1131088; Tue, 21 May 2024 10:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9MKy-0005n5-R4; Tue, 21 May 2024 10:03:16 +0000
Received: by outflank-mailman (input) for mailman id 726735;
 Tue, 21 May 2024 10:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9BQ=MY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s9MKx-0005mz-56
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 10:03:15 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55416051-1759-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 12:03:12 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-69b5ece41dfso7730656d6.2
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2024 03:03:12 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f194da1sm120076446d6.67.2024.05.21.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 03:03:10 -0700 (PDT)
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
X-Inumbo-ID: 55416051-1759-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716285792; x=1716890592; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JCodHXALEwX3rcjPsEqWu+TfABQYk2zNMzXaKsxlTiI=;
        b=HomM6hWVAeWVoHEYtdiTFSDFblZm3KZ332JBGVY6JivkFQo7CE5B0hZUHgTii+r9cN
         YrMvhRAf9wHvN48sIozVXOu1nIF5KLYTH4g2j2lPeyAwmnK2Op2FyGP1di9nxInx9rQ5
         wV5DsVKpP6Q2YWJS6U3Y7GHomE+htpAl5Xxtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716285792; x=1716890592;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCodHXALEwX3rcjPsEqWu+TfABQYk2zNMzXaKsxlTiI=;
        b=RLhwWpN6/yx+mDWPPmLGklIAWoCDXyGMJnCpW3QCjDclGtw49jnzjQJ8gmafLjtkUv
         zz0FJlzDIMb/PbLvokRXU2iqgPjiPVIwjINRESOWq3D3YGFJA4RCoGrgIDFgRtHk5mjC
         E77Je5VCWgq6MtlkdLkANaFMmelbET8t4WjOPaZrkwoiSVUZutL4DilQZcoKBIthVwEG
         qzlPH6t1FWekjJomI+yVL9ovVm1Fw/HUO7Sjj9Po9APlCnHbRUDFdf6m7MQ+gG4Z2Mkq
         dHRlzppeN5mbGlAMy0y7/tAnX3MBDfvEhz2mIgpDiRkcB6YlbbYLxLsIYXrvDGWfeylN
         3kgg==
X-Gm-Message-State: AOJu0Yw7yRg+g+5AAJInlh8+ttNfRUqpo+jwGM9Eb/zHSmcakBDu4OmX
	EgwsjzwnomuYo2VR1vJcaKC0L7ViwhRlOx29Z95VuUu8zT05C+FVD+Szg/zth557dOpvguJLwzS
	5
X-Google-Smtp-Source: AGHT+IHyAs9wkukllqxUeu+6zXvC9UjriusAK0/vPemcSXU+ppSaw+I3IphkeL+VRyDkCvvnwT/TlA==
X-Received: by 2002:a05:6214:320a:b0:6a9:2fc9:f539 with SMTP id 6a1803df08f44-6a92fc9f733mr76254016d6.9.1716285791529;
        Tue, 21 May 2024 03:03:11 -0700 (PDT)
Date: Tue, 21 May 2024 12:03:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 05/12] IOMMU: rename and re-type ats_enabled
Message-ID: <ZkxxXNbOJ48Bl_Sk@macbook>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
 <7f11ca06-9bed-443b-9c79-0e62b71a1f96@suse.com>
 <ZjjQIaxEwS6b-swj@macbook>
 <24d52bbb-1329-4f8a-81be-505a35969875@suse.com>
 <Zjjg2ueqgjmn-MS3@macbook>
 <44af358a-9510-4056-826c-3be99dc25830@suse.com>
 <ZksmJp5JnQoBYZ6U@macbook>
 <d1267c40-e2d6-4919-81ac-54ad217e4702@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1267c40-e2d6-4919-81ac-54ad217e4702@suse.com>

On Tue, May 21, 2024 at 08:21:35AM +0200, Jan Beulich wrote:
> On 20.05.2024 12:29, Roger Pau Monné wrote:
> > On Wed, May 15, 2024 at 12:07:50PM +0200, Jan Beulich wrote:
> >> On 06.05.2024 15:53, Roger Pau Monné wrote:
> >>> On Mon, May 06, 2024 at 03:20:38PM +0200, Jan Beulich wrote:
> >>>> On 06.05.2024 14:42, Roger Pau Monné wrote:
> >>>>> On Thu, Feb 15, 2024 at 11:15:39AM +0100, Jan Beulich wrote:
> >>>>>> @@ -196,7 +196,7 @@ static int __must_check amd_iommu_setup_
> >>>>>>          dte->sys_mgt = MASK_EXTR(ivrs_dev->device_flags, ACPI_IVHD_SYSTEM_MGMT);
> >>>>>>  
> >>>>>>          if ( use_ats(pdev, iommu, ivrs_dev) )
> >>>>>> -            dte->i = ats_enabled;
> >>>>>> +            dte->i = true;
> >>>>>
> >>>>> Might be easier to just use:
> >>>>>
> >>>>> dte->i = use_ats(pdev, iommu, ivrs_dev);
> >>>>
> >>>> I'm hesitant here, as in principle we might be overwriting a "true" by
> >>>> "false" then.
> >>>
> >>> Hm, but that would be fine, what's the point in enabling the IOMMU to
> >>> reply to ATS requests if ATS is not enabled on the device?
> >>>
> >>> IOW: overwriting a "true" with a "false" seem like the correct
> >>> behavior if it's based on the output of use_ats().
> >>
> >> I don't think so, unless there were flow guarantees excluding the possibility
> >> of taking this path twice without intermediately disabling the device again.
> >> Down from here the enabling of ATS is gated on use_ats(). Hence if, in an
> >> earlier invocation, we enabled ATS (and set dte->i), we wouldn't turn off ATS
> >> below (there's only code to turn it on), yet with what you suggest we'd clear
> >> dte->i.
> > 
> > Please bear with me, I think I'm confused, why would use_ats(), and if
> > that's the case, don't we want to update dte->i so that it matches the
> > ATS state?
> 
> I'm afraid I can't parse this. Maybe a result of incomplete editing? The
> topic is complex enough that I don't want to even try to guess what you
> may have meant to ask ...

Oh, indeed, sorry, the full sentences should have been:

Please bear with me, I think I'm confused, why would use_ats() return
different values for the same device?

And if that's the case, don't we want to update dte->i so that it
matches the ATS state signaled by use_ats()?

> > Otherwise we would fail to disable IOMMU device address translation
> > support if ATS was disabled?
> 
> I think the answer here is "no", but with the above I'm not really sure
> here, either.

Given the current logic in use_ats() AFAICT the return value of that
function should not change for a given device?

Thanks, Roger.

