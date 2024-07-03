Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A054392569D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 11:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752845.1161085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwC3-0007TT-Fk; Wed, 03 Jul 2024 09:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752845.1161085; Wed, 03 Jul 2024 09:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOwC3-0007Qa-C9; Wed, 03 Jul 2024 09:22:27 +0000
Received: by outflank-mailman (input) for mailman id 752845;
 Wed, 03 Jul 2024 09:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znpO=OD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sOwC1-0007QS-QZ
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 09:22:25 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0ac04b8-391d-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 11:22:22 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-42562fde108so36882535e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 02:22:22 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b063485sm225971115e9.21.2024.07.03.02.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 02:22:21 -0700 (PDT)
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
X-Inumbo-ID: c0ac04b8-391d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719998542; x=1720603342; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GxfiErWVKvpb8SbTCs5z3SCJx3ZO0EpZtwQ+tXaZMNs=;
        b=EGyO+9FE7yCVDYr/pwRo6yPBU/mwZgDEU74Ie0djVAm0CJLkkwTfMcWYiYOSb33Wgu
         sdTfoWYg7z2o0UB4PyAlgB5Qn7kSphHFovd3mwdRaaT0KrYSsJLhl1mXGguAhFEuf0pX
         Yu+Saak39ARAnt6Q6PtSija4hu2f5DNa6zYKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719998542; x=1720603342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxfiErWVKvpb8SbTCs5z3SCJx3ZO0EpZtwQ+tXaZMNs=;
        b=Spsvny7Zw50Nfcc/YwHD/u5KbFY+kSFFjvOv4hGaSGjJoD/dArHbqum7zmzWhCxzDg
         w2GNWmuisgLCZA+OfPAiRcfLmgYj5qcSLY72q4MEgjxlqzFKIafff6g3tqtYAjEfA7aT
         loVxVrlkefQsz5RqwXQZ1kQpRSEY693ylZTATQnWF9x2thlBjDqQp2XhS9pVN6D5mDTQ
         2SNnQoDNQjd/y5AgMMVT3XNLfVP2JezthwE+47mb6Uph6xas67GQsExUHtSY1uzXIn/V
         Xn1SCH0TMEwnPcneywvWUbHt9hhcyhsgzbq6v0aG42YTjb4CjJ1ISER1BJBWMPZ6Ayx5
         8v0Q==
X-Gm-Message-State: AOJu0YxahnpyNzuimjIyhqby0QAd1ukWR/t1CXUTtqA1qAUJV9F7bDKl
	9E0MhR6OM87ALvlWiaQxpb2kxoBQhYcnoKdwpk5z4hxMum+RRS6xhGdAtJ3fIhk=
X-Google-Smtp-Source: AGHT+IHwaJQt2vAL1T6U9em+Lp5PKSn5v3vsgDjU+hOsaQwH/FPP747dFfBEUpalSicW9NvcyVlnIg==
X-Received: by 2002:a05:600c:4206:b0:425:680b:a6a8 with SMTP id 5b1f17b1804b1-4257a02f79emr83044095e9.15.1719998541438;
        Wed, 03 Jul 2024 02:22:21 -0700 (PDT)
Date: Wed, 3 Jul 2024 11:22:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v5 for-4.19? 1/2] amend 'cmdline: document and enforce
 "extra_guest_irqs" upper bounds'
Message-ID: <ZoUYTO1SzQhDBTg6@macbook.local>
References: <789d567b-db3a-4c4d-9eac-f73232777244@suse.com>
 <37f1a5b8-9b54-42f1-845f-dddcf0b0401e@suse.com>
 <0d0eb666-fc0b-4775-99ce-61f74b6c584b@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d0eb666-fc0b-4775-99ce-61f74b6c584b@suse.com>

On Wed, Jul 03, 2024 at 10:47:36AM +0200, Jan Beulich wrote:
> On 03.07.2024 10:44, Jan Beulich wrote:
> > Address late review comments for what is now commit 17f6d398f765:
> > - bound max_irqs right away against nr_irqs
> > - introduce a #define for a constant used twice
> > 
> > Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Actually should also have added
> 
> Requested-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> above the S-o-b.

Sorry, didn't realize this was already committed.

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks for addressing the comments!

