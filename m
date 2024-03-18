Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FC87E911
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 13:03:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694651.1083609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBhh-0000pr-7W; Mon, 18 Mar 2024 12:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694651.1083609; Mon, 18 Mar 2024 12:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmBhh-0000oJ-44; Mon, 18 Mar 2024 12:02:57 +0000
Received: by outflank-mailman (input) for mailman id 694651;
 Mon, 18 Mar 2024 12:02:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=az6s=KY=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rmBhg-0000oD-6G
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 12:02:56 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741f7692-e51f-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 13:02:55 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-413f1853bf3so28840035e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 05:02:55 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 t20-20020a05600c199400b004132ae838absm14793489wmq.43.2024.03.18.05.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 05:02:54 -0700 (PDT)
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
X-Inumbo-ID: 741f7692-e51f-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710763374; x=1711368174; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zw2EktgE+5/3X3GE505EIk99kT1ap2KZKgZaaJMsPhk=;
        b=XE2Lp+Fq8jJM5EYDQWaz1wQHL4LvkXun3l4/KRZLJr9J/ZDVcS/OfY321TjSltKhAN
         hZlBxgZKd0oC7V+NHPlAqhF9mLYCMCkCOQ53gl84dx4d2JPN/VoF1+LYFfJKSQZIAx8K
         WTu4pmBHIszFzTQZYq7vIVXzDH3cPwNIDSLvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710763374; x=1711368174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zw2EktgE+5/3X3GE505EIk99kT1ap2KZKgZaaJMsPhk=;
        b=YTZI007XLCwF2tmH8A/ob+tGqAj8woVSUVOH8vDgcuOJfUoXdi6c+7YZd1HVYOnSu0
         rUUewxeyPVmdSrrUhTK8I3f3CV0/EAnLYZEyxFuduR441WWf83jnsrqUNR53b18c2drb
         NISs2u6RQHucDpcPi/KT9RhWzAgBzHLhW6TR/l64RE4zEo5ILZd0xEPPVTLGtLN8a5Ti
         erlRKDzRXnaSl4OuxJCV4fT0zCQdcnqMn2ixse8exOjjet5cCKw+IijsHceIeca5tsO5
         tFI4HDu2yEpgDfExH4Yulz7BlSgBdX6CtXyqty5En5v8rifMatBW27RfD4V9c8VEbdi9
         3fJw==
X-Gm-Message-State: AOJu0YzNuJraAFc2lplzoxBcGyoq8oaxqCYXfK5kHki/P3F3/KSPC8po
	mR1RUSUmhWaBxbauxAyPt87t6rRnZA6oDBkNCUrjRzZzug38VOSkcd071+neeEU=
X-Google-Smtp-Source: AGHT+IH1Xeji7NT5Hr7hdguPclUtPwKCiCfGpR9kBBlsVbliHOJkp5sg4zsaLriPiVqdNB2hDsb0Hg==
X-Received: by 2002:a05:600c:3150:b0:413:f80f:9a5 with SMTP id h16-20020a05600c315000b00413f80f09a5mr8262467wmo.5.1710763374582;
        Mon, 18 Mar 2024 05:02:54 -0700 (PDT)
Date: Mon, 18 Mar 2024 12:02:53 +0000
From: Anthony PERARD <anthony.perard@cloud.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [OSSTEST PATCH v2 0/3] Switch to Linux 6.1 by default on x86
Message-ID: <73baa2f3-4ce1-4611-8633-cc024a42d0c9@perard>
References: <20240315154849.28819-1-anthony.perard@citrix.com>
 <Zfgao9BaG20mLRuU@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zfgao9BaG20mLRuU@macbook>

On Mon, Mar 18, 2024 at 11:42:43AM +0100, Roger Pau Monné wrote:
> On Fri, Mar 15, 2024 at 03:48:46PM +0000, Anthony PERARD wrote:
> > Anthony PERARD (3):
> >   make-fligh: Fix freebsd guest test test-id
> >   mfi-common: Rework toolstack-disk_format test matrix
> >   ap-common: Switch to Linux 6.1 by default on x86 + drop dom0 i386
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Pushed.

Thanks,

-- 
Anthony PERARD

