Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131298544D2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680287.1058333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBMu-0002IV-4a; Wed, 14 Feb 2024 09:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680287.1058333; Wed, 14 Feb 2024 09:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raBMu-0002GP-1Z; Wed, 14 Feb 2024 09:15:52 +0000
Received: by outflank-mailman (input) for mailman id 680287;
 Wed, 14 Feb 2024 09:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WArD=JX=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1raBMt-0002GJ-7x
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:15:51 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4a34282-cb19-11ee-98f5-efadbce2ee36;
 Wed, 14 Feb 2024 10:15:49 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d09cf00214so69162791fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:15:49 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 x2-20020a05620a14a200b00785d9e3b744sm2072612qkj.108.2024.02.14.01.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:15:48 -0800 (PST)
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
X-Inumbo-ID: a4a34282-cb19-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707902149; x=1708506949; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MtFyai8Qihp5DcPzX+dkaiqwqpJO2yVolS7zMjPGrvU=;
        b=V/585Iop6H77TGC9dbYcs3vp4RcSzlPb40E5HCvt71R28VhgMn6yrcAT/7JlvOJHcS
         ZDvrwGwszlAoQ3ysphgndBr9pmtMZ+eME7y0w7yK3SUF6dNoqaqUnhCp06xnYKDRFFhj
         eUn1PjWA+8OBZqpIiOivQyQQoOMqk+l8wH+Vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902149; x=1708506949;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtFyai8Qihp5DcPzX+dkaiqwqpJO2yVolS7zMjPGrvU=;
        b=vQgp+5wzQvcWg7I8H0vMHWF11u8drwZqOLUU8ycM2G1nuQJyAKhsy+MUfWtHwXDtHf
         Ve4/L3p+0KVCIb/kSAp1WVc0mApUmu3bhRSVAPhk5hQ+0kK5SFDgUEPdk368FPP+N2ez
         sOCMMQOUk8KF/O+jn2dRmpjC0aZz4ztRLcZ1GSxeDT7fLME7j0gF8jcaYFhNOMB6Eev6
         /z7jClJpxhI4AA9D5HZspN4htAdhY+47Ns4tnNMF9oDkll6CvNxXqaGvoOwc+M3zHxs6
         P0Dm71iCGKt1E9mF+x5QF80vH/p73JHm96RkAjyoq10wAZgKD3t7BMnVA/XcK84CU0vN
         qVgA==
X-Forwarded-Encrypted: i=1; AJvYcCX6okKLIVmuAdghzzZCSX0zhMAFCU9xJVq4TtWsT5D0Q9qtNW4qUL1PbGgVi09sqPSb0/nu+HnXlfkDgh2B9ICWkxP4C9JEYQ3XPBVTpm0=
X-Gm-Message-State: AOJu0YwmogpnXQDrK47lwl29W92VGM/2xDIl4e/DAdolr7QZzDE5SvWx
	FQBwB5FchUA5QZ4FPdmKP1DcHsjkLV2zUREVw9Y3fgh7nBsSONqA0Mta/IrV0FrbJNb2OvWWWXx
	Y
X-Google-Smtp-Source: AGHT+IHSXKVIDkSsXyEIlRBTAaSPerLebQTsgWytleH0LMQ6e93O+91p1P7Z1s6AaaXuTRpwq0me6w==
X-Received: by 2002:a05:651c:626:b0:2d0:9210:fd57 with SMTP id k38-20020a05651c062600b002d09210fd57mr1220276lje.18.1707902148777;
        Wed, 14 Feb 2024 01:15:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjitlyM0tWC7SMGh2/X9TO0Enpkp2cmEhuNWxHasZ2zImagTLqxjSgOC2uiLoiffg5G0AuJ6CzlJewGMMOnJDTjWE+CyBWSw6J0+2i17E9rrJAio0SMND3lU09Q8AwlLeAVNyC
Date: Wed, 14 Feb 2024 10:15:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [regression] Re: [PATCH v2 2/2] iommu/vt-d: switch to common
 RMRR checker
Message-ID: <ZcyEwjnu3igWl1xT@macbook>
References: <20240207153417.89975-1-roger.pau@citrix.com>
 <20240207153417.89975-3-roger.pau@citrix.com>
 <c27c76ec-36cd-43cb-b76f-e8f95fb27ed8@suse.com>
 <c4f27180-86bf-45fd-8641-bd160c6de229@citrix.com>
 <37ed1abe-afcc-4a76-8a86-623282ca37a3@suse.com>
 <Zcx9w5eZkXiN9s66@macbook>
 <790c81c8-04f4-435b-937f-87fa1cd54998@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <790c81c8-04f4-435b-937f-87fa1cd54998@suse.com>

On Wed, Feb 14, 2024 at 10:01:43AM +0100, Jan Beulich wrote:
> On 14.02.2024 09:45, Roger Pau Monné wrote:
> > On Wed, Feb 14, 2024 at 08:45:28AM +0100, Jan Beulich wrote:
> >> On 13.02.2024 23:37, Andrew Cooper wrote:
> >>> It's very likely something in this series, but the link to Intel might
> >>> just be chance of which hardware got selected, and I've got no clue why
> >>> there's a reset with no further logging out of Xen...
> >>
> >> I second this - even after looking closely at the patches again, I can't
> >> make a connection between them and the observed behavior. Didn't yet look
> >> at what, if anything, osstest may have to say. Do I understand correctly
> >> that the cited log messages are the last sign of life prior to the
> >> systems rebooting?
> > 
> > I've found it:
> > 
> >     for ( addr = start; mfn_x(addr) <= mfn_x(end); mfn_add(addr, 1) )
> > 
> > Should be:
> > 
> >     for ( addr = start; mfn_x(addr) <= mfn_x(end); addr = mfn_add(addr, 1) )
> > 
> > mfn_add() doesn't modify the parameter.  Will see about making those
> > helpers __must_check in order to avoid this happening in the future.
> 
> Hmm, yes, it's not the first time this has happened. But even seeing the
> flaw I still can't explain the observed behavior: The system ought to
> hang then, not instantly reboot?

AFAICT, it was stuck in a loop without making progress until the CI
controller decided to reboot it.

Thanks, Roger.

