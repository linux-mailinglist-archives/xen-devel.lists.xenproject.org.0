Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33980A77D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 16:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650680.1016394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcqr-0007bI-D5; Fri, 08 Dec 2023 15:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650680.1016394; Fri, 08 Dec 2023 15:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBcqr-0007Zc-A7; Fri, 08 Dec 2023 15:33:17 +0000
Received: by outflank-mailman (input) for mailman id 650680;
 Fri, 08 Dec 2023 15:33:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBcqq-0007ZW-Ae
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 15:33:16 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a06836b-95df-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 16:33:14 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c09f4814eso29533545e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 07:33:14 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bi11-20020a05600c3d8b00b0040c2963e5f3sm3165279wmb.38.2023.12.08.07.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:33:13 -0800 (PST)
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
X-Inumbo-ID: 1a06836b-95df-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702049594; x=1702654394; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWGL9ioe4Q0XAlenJXy9ICyFtlPyiwtSIiZ8G0lVCX0=;
        b=ZHbB39ineD2RlWc1iS0/TsOGr5etV1dsYflfAAUQmxGbcl3uTRg26WkYydrjT4/5BO
         uOvIdwEGOTi7+0d/6bXm7tUtCLNXQ0jWt40qOy1xAF2lWqtYJduJ2MVCSY9hCogSFDZN
         kVa0kCU/t82mAs9/LsT/L9OybEohoc56JQ7FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702049594; x=1702654394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWGL9ioe4Q0XAlenJXy9ICyFtlPyiwtSIiZ8G0lVCX0=;
        b=ChoXF2c58ael209xUvxi2QFVWKk1+XvhdenaoSYmurZnVvaBNIrdvIU9J0jo2XmTM1
         YckW/dbW9L5MaY3BOAeK0r01pFo48WXMeLlUoReUKOaanCviDSDwvMI+1Il2ZVefaccc
         ltGO2B1XyyuWJX1OFwqwQd5Zj+tpExEuQXXg0X1gvoxoDcqNN3dHUDq/NtgdWbroRC8O
         Vdr4noe/kGE8/QuR3T1/zPMv8S8kl0XUQZEXimUoac0Kk3hGFqijelhDY3YdVlUcHTg8
         YkWd80ujKnTnnTzGALccvNcSJlxGO3kcLDwHNOwLaIYW845T+Rz9ULkLhzlI8Y3mjvJn
         JJSQ==
X-Gm-Message-State: AOJu0YzpDLaaIwhieC2WFV/QUDfYilOIJy11s5ei5uEtR3buHqWda6IA
	BS//lLCRjCVRLU+ImHwVwyUTSVK2cL8HPPg28o0=
X-Google-Smtp-Source: AGHT+IHaWiFpRuyUYcsuDeSV9wcbXamwsasRL4Fz0OVhuTxVZMGF5ADMW2YSCsu3zVwrh4Dn5BPl8w==
X-Received: by 2002:a05:600c:2b0e:b0:40c:337e:f059 with SMTP id y14-20020a05600c2b0e00b0040c337ef059mr95087wme.65.1702049593787;
        Fri, 08 Dec 2023 07:33:13 -0800 (PST)
Date: Fri, 8 Dec 2023 15:33:12 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 0/5] tools/xenstored: remove some command line options
Message-ID: <6f81bc46-8459-4fd0-accb-3c3f65f13aac@perard>
References: <20231121114048.31294-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121114048.31294-1-jgross@suse.com>

On Tue, Nov 21, 2023 at 12:40:43PM +0100, Juergen Gross wrote:
> Remove some command line options which have no real use case.
> 
> Changes in V2:
> - moved removal of "-N" into last patch of the series, as this is the
>   only option which seems to have a use case (OTOH using it has some
>   downsides as well).
> 
> Juergen Gross (5):
>   tools/xenstored: remove "-D" command line parameter
>   tools/xenstored: remove "-V" command line option
>   tools/xenstored: remove the "-P" command line option
>   tools/xenstored: remove the "-R" command line option
>   tools/xenstored: remove "-N" command line option

Should we have en entry in the changelog about all these removals? Who
knows if they are used by someone or not...

Thanks,

-- 
Anthony PERARD

