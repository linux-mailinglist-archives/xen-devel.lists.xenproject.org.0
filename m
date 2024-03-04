Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 442F586FFC4
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 12:07:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688276.1072327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh69T-00009F-RK; Mon, 04 Mar 2024 11:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688276.1072327; Mon, 04 Mar 2024 11:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh69T-00006W-Ns; Mon, 04 Mar 2024 11:06:35 +0000
Received: by outflank-mailman (input) for mailman id 688276;
 Mon, 04 Mar 2024 11:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z0qD=KK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rh69S-00006Q-Bv
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 11:06:34 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 422e8280-da17-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 12:06:33 +0100 (CET)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-68f5cdca7a3so39414906d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 03:06:33 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 kv9-20020a056214534900b006905c8b37bbsm3293451qvb.133.2024.03.04.03.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 03:06:31 -0800 (PST)
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
X-Inumbo-ID: 422e8280-da17-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709550392; x=1710155192; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nj7TaiKNdx+UofWlTcISG1cNyrM42a4yAPgq52ev2dQ=;
        b=JNQYPZN0xTjcnOt1v6TcBAfTOa+o3MN/6rdgop6l0D1CeklJPJIVz27hUI7KfBtUfH
         3vDVgu023G6LN5pCyZeY+DjofHmozW7p665AZWL8dszYQNEcKGYRsxIC8RL0Bp0qtQyR
         io7XJXAn9ztuhrEmERxWwb3nTPn5FLklBqwsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550392; x=1710155192;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nj7TaiKNdx+UofWlTcISG1cNyrM42a4yAPgq52ev2dQ=;
        b=ddTWHcvCU9bjuyIbi8ztdmHpfbPqeLzsubqtxfPuvl5AFfNc+XP9zndXB0BeSFiOh3
         rpJDNKgKTN8f19/rHAg77kfYRo7GF3pme+dGO2CugmgTjy+PEulb1BX9qklmlo8caTCo
         7fJGj5MMS1uo/WO+Z7d5WxCyMmDu7cCizBcYOPQIca/GUDONCSbBnJW4z83GLpifIvyu
         4bp/3t+YDoYeWUha+6sFi1q7TT1vdX7SW05qt4UlavIaGFkXDiRdKHmIpgS0egGkwC+A
         YPN4r3Ao17389sp4EYXsLst8tIXa/8fUVi4s7lUXw8eSaVpmphsIcml8LSttKbdHznfF
         cn7Q==
X-Gm-Message-State: AOJu0YxuO08DiG9iYYNGfUvZbOk3BxzcKrBgZHz9Bmiw6Cfn9QizWLtL
	2EJGuLPLVkhJ2SLkiMnju6vplcX7Ys8vH6DerRpXWd/X2G/GrodMdoAQtuf5HMI=
X-Google-Smtp-Source: AGHT+IGt0iG0ipjqmYbgvFr3A9xhv5F2lA+o0LsZT58nTNBzusESgX+5ByyAgcNvYcUBnIT/Gh50ng==
X-Received: by 2002:a0c:da84:0:b0:690:5ff8:cc0 with SMTP id z4-20020a0cda84000000b006905ff80cc0mr8354428qvj.11.1709550392004;
        Mon, 04 Mar 2024 03:06:32 -0800 (PST)
Date: Mon, 4 Mar 2024 12:06:29 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH] MAINTAINERS: drop AMD SVM and Intel VT-x sections
Message-ID: <ZeWrNWLw2soxEsg1@macbook>
References: <ff10dd86-6894-434f-b2cc-9407a83a3487@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff10dd86-6894-434f-b2cc-9407a83a3487@suse.com>

On Mon, Mar 04, 2024 at 10:27:44AM +0100, Jan Beulich wrote:
> We'd like to thank the VT-x maintainers for their past contributions,
> while at the same time we'd like to reflect reality as it has been for
> quite some time. Have VT-x maintainership (and for symmetry also AMD
> SVM's) fall back to general x86.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

