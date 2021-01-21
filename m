Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAC42FEDB6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72148.129637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bPX-0002JZ-OL; Thu, 21 Jan 2021 14:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72148.129637; Thu, 21 Jan 2021 14:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2bPX-0002JA-LC; Thu, 21 Jan 2021 14:58:11 +0000
Received: by outflank-mailman (input) for mailman id 72148;
 Thu, 21 Jan 2021 14:58:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dq2E=GY=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1l2bPV-0002J1-V2
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 14:58:09 +0000
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aef6edb2-8559-499d-9db4-159b1d77b8ab;
 Thu, 21 Jan 2021 14:58:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id u14so1787355wmq.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Jan 2021 06:58:08 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id v1sm8031028wmj.31.2021.01.21.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 06:58:07 -0800 (PST)
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
X-Inumbo-ID: aef6edb2-8559-499d-9db4-159b1d77b8ab
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QxTTPK6zIAqiKmB63HReVHFENvYw4s6J1FX0b5pavfo=;
        b=ccE5IUXru895BA3Kn6EHYc+gbEpUXZ9ebTYJXUMDdkiN0MSmswVhb3sKM3seE+QppT
         NIwKGHSaDZTZst3rWGovTEFejw3fosAJ7yY7mXVdBAz6JeSE8Nh/WnD74xTeKgBMGrOy
         WJOpYYgURKKP2hRg/H0H60dakRNHzKyER169BJtmNJLq8tJ7BRzg0HtBHepnfKKL/5Ge
         gqLjT17T83zKJTxOCxh9ujGHsS/T4HTPXW+A6lvWAyFbPdxG1iImSfhrrQLvh0DiVafc
         50tBstz6y2pUIK0abTT607xL1RwXOtw7urcIx14MEMC3R2kfTUEeK1rir8ot9BkPlPfI
         IC7Q==
X-Gm-Message-State: AOAM530i2y6Xwii1vlV8JVFrAcaVBTEsA6v8bKlX7DFDLdN3tIKgN/wc
	27XGd8mG4RFYkJYN3dW/fTY=
X-Google-Smtp-Source: ABdhPJxEisU5WGequRPF2ZVpSEPbXoIU0MGA4MxmccyqhfFRFY6X9v87J6no0/qkiFUIifU/lYvoRw==
X-Received: by 2002:a7b:cb81:: with SMTP id m1mr9457423wmi.117.1611241088134;
        Thu, 21 Jan 2021 06:58:08 -0800 (PST)
Date: Thu, 21 Jan 2021 14:58:06 +0000
From: Wei Liu <wl@xen.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, wl@xen.org,
	anthony.perard@citrix.com, jbeulich@suse.com,
	andrew.cooper3@citrix.com, roger.pau@citrix.com,
	jun.nakajima@intel.com, kevin.tian@intel.com
Subject: Re: [PATCH v2 4/4] tools/libs: Apply MSR policy to a guest
Message-ID: <20210121145806.dqtv6icsu3ta25pm@liuwe-devbox-debian-v2>
References: <1611182952-9941-1-git-send-email-boris.ostrovsky@oracle.com>
 <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611182952-9941-5-git-send-email-boris.ostrovsky@oracle.com>
User-Agent: NeoMutt/20180716

On Wed, Jan 20, 2021 at 05:49:12PM -0500, Boris Ostrovsky wrote:
> When creating a guest, if ignore_msrs option has been specified,
> apply it to guest's MSR policy.
> 
> Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

Acked-by: Wei Liu <wl@xen.org>

