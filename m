Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3A7D00A3
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 19:33:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619546.964803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWts-00027Q-Ql; Thu, 19 Oct 2023 17:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619546.964803; Thu, 19 Oct 2023 17:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWts-00025C-Nn; Thu, 19 Oct 2023 17:33:36 +0000
Received: by outflank-mailman (input) for mailman id 619546;
 Thu, 19 Oct 2023 17:33:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gyPq=GB=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qtWtq-000250-6p
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 17:33:34 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9f69904c-6ea5-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 19:33:33 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5384975e34cso14417088a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Oct 2023 10:33:32 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 b7-20020a170906660700b009a5f1d1564dsm3802118ejp.126.2023.10.19.10.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 10:33:31 -0700 (PDT)
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
X-Inumbo-ID: 9f69904c-6ea5-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1697736811; x=1698341611; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TNNdwNAyFLKq8WMgyakYbwr7XSBrEHOFQd3jTAYLzT8=;
        b=vrbi4TEqrol/CU0gbwO3kYef/qUpPrOMxdXey3JePi8sTf+iS+rMW2QQa+sUycda6A
         XXDnA1yeDd5v6g3H7mF9n63Ivhdt3fIRBzx00YCwZGJ+s3wJUGXq5iDpW7O/nqwF4ihY
         3XHFZwNG11akg7AnG18IHPj+kUTNdBK3YfOdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697736811; x=1698341611;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNNdwNAyFLKq8WMgyakYbwr7XSBrEHOFQd3jTAYLzT8=;
        b=UWmfREm2LQkkk0KbC7rHnJd5uL0hwopgmSiAkcglk+72WEGHDZsecESe3PfjPODlUv
         +Q8XEVmtfnUwJcKgd6nrMPFJKO47SOO8m7Nyi5Rc0nW6X4pDBlgyFrUGvuNbsc6CYtOG
         OrLHYndH1oSkOrtdLojzuFxqc9CBGL2a3mq1DEIqQ6EXxFBJdJa7uCXmO32NX1NDTH7u
         MCOezSVUWacvp7MF6d+bl1gSRSP4w5djCouV9AxG07LGpp6lINRpK08jBPRFQlvIgp+8
         tH8HFA8iD1wvPQSvL2rxFPV//m++TagfjcBOV3M6KYyslmAppFATTss3Dg/reAUV6puQ
         VC+g==
X-Gm-Message-State: AOJu0Yyy1jtT4eJ07w3W1iY12ZER8+eBTDrG1oh+JX3fr2M4btW5Al03
	wkPn/j9pO60ianUJIsMtgnLbiKNtluV9hAdGrK4=
X-Google-Smtp-Source: AGHT+IHX8c8lbk5uYQqu6RWN18DMC0I7nxXFmu8RsTQd4syzOjMis9Bt2K3jG1pQxf/eU0eVXpo+SA==
X-Received: by 2002:a17:907:7e91:b0:9a5:7f99:be54 with SMTP id qb17-20020a1709077e9100b009a57f99be54mr2529984ejc.67.1697736811407;
        Thu, 19 Oct 2023 10:33:31 -0700 (PDT)
Date: Thu, 19 Oct 2023 18:33:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH for-4.18] CI: (More) Always pull base image when building
 a container
Message-ID: <f8cb1c63-b634-4bd2-9bce-54d2e3e6dbe3@perard>
References: <20231019171452.1704276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231019171452.1704276-1-andrew.cooper3@citrix.com>

On Thu, Oct 19, 2023 at 06:14:52PM +0100, Andrew Cooper wrote:
> Repeat c/s 26ecc08b98fc ("automation: Always pull base image when building a
> container") for the other makefile we've got building containers.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> 
> For 4.18.  This is CI infrastructure, not part of the regular build.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

