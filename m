Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D206B97AC
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509656.785831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5VH-000134-PL; Tue, 14 Mar 2023 14:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509656.785831; Tue, 14 Mar 2023 14:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5VH-00010W-Md; Tue, 14 Mar 2023 14:19:51 +0000
Received: by outflank-mailman (input) for mailman id 509656;
 Tue, 14 Mar 2023 14:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zfqj=7G=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pc5VF-000102-TI
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:19:49 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 467dc3a0-c273-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:19:48 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id j11so62709678edq.4
 for <xen-devel@lists.xenproject.org>; Tue, 14 Mar 2023 07:19:48 -0700 (PDT)
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
X-Inumbo-ID: 467dc3a0-c273-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678803587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDVhdQS7kpEm9s8BfeQA6VW0gZcYeqF6UvpVg13vS7Y=;
        b=ANjxlxNCL2QIv+A9xukIgHsoGLFLjrO0vnnFpU5RMjG5CmNLNYNICuy+mb4klnifTN
         hfldpL9sqNmu3j84L5tCfj3w3RGSt7G7cpROBx6Rt27Cmt2gKyLHVLZM0YD7NcRQyKmF
         L148zynD2uDaseQwLge4T2ZIdp/ArBY1ylb+0RVXzveycBkmVpr85Bhk4AnHdzJv4tS0
         d8+lNa9lrhukle/GrKWlAujDMj8AIxwiWel4aAmmCalqR+GIrqW8Xf3ksIs+BiVJaa6f
         NQ+FcwfMDhJn+h3iqxTupaZ46SG8p1dzv34Dj+VjPUaYOTaamPXQ8hHMD+H1CczEgW6s
         z5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDVhdQS7kpEm9s8BfeQA6VW0gZcYeqF6UvpVg13vS7Y=;
        b=c32p77LY8i575zrsOAn1ClXPg1dtWeBGw61tD3fBjE3e4FiW7jVIr2395AhCaMR5dO
         VrbQbFojQZqpIQaj++AoyrCJj8wmj+AFxE19Twae14TBSQSV3VBshkLuCE9XYgJyK+WC
         kw0qWS5LdAm+v3Ra5HGBKsZNqqnQqeddTKhBJ3FGQcB9RaWZuisxPPo6+OMljouIy+Yz
         nXx12J9Z26OEegZwkbHx5lNXNTB3RiWtXHRvvsgo3wySoBTH/J8S38r8i0PXXJUujfD6
         k3qjz/VsLuije9E5S3F+W18oS7y3E7uJrp0JHCaBSuYlJSWCvmu0ROCyVZ2J27JgZ7LR
         2lNA==
X-Gm-Message-State: AO0yUKXV2gvm3nD3dTKF+OfyYJbOT8rkfCDt0EsIZ3TU5HlFJYeQqEyy
	Vzm3pMx0nJkDUtlK8oMDCOZpMPuKKNbKL5lF8WE=
X-Google-Smtp-Source: AK7set/S+uWjzf+uCfyHZzMNuO4EuDTg6yqgnq42VG7rAW3VFeQFzzPf5YL4jbgNNv8tegD4+xF3DdsBPXJ3++rhZd0=
X-Received: by 2002:a17:906:b351:b0:91f:79d3:d3e2 with SMTP id
 cd17-20020a170906b35100b0091f79d3d3e2mr1331144ejb.3.1678803587441; Tue, 14
 Mar 2023 07:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230313175047.20719-1-jandryuk@gmail.com> <a990fe77-6132-c5df-c149-6255fb13d845@apertussolutions.com>
 <CAKf6xpt02aK7SWNb=xB3kKZB3Dt9UC8mMKMVz5kq96uNJvdzbQ@mail.gmail.com>
 <d17d7b39-28ce-55a6-8d2b-fe2dfd10c38d@gmail.com> <52c04d0b-2b30-ffc5-fe5f-72a182abfee7@suse.com>
 <CAKf6xpv7AGqWOcv2hFYzcJLq0c3EyhUiBxvmHeSui661M6HFcQ@mail.gmail.com> <ffc64415-8689-a3c5-ab1e-b1a9b3b397cd@suse.com>
In-Reply-To: <ffc64415-8689-a3c5-ab1e-b1a9b3b397cd@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 14 Mar 2023 10:19:35 -0400
Message-ID: <CAKf6xpsfh0yHpr4=ABBTz4XTWyDyMUNPivVqsBGD=J-B2Yi1-A@mail.gmail.com>
Subject: Re: [PATCH] flask: label-pci: Allow specifying optional irq label
To: Jan Beulich <jbeulich@suse.com>
Cc: "dpsmith.dev" <dpsmith.dev@gmail.com>, xen-devel@lists.xenproject.org, 
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 14, 2023 at 10:11=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 14.03.2023 14:20, Jason Andryuk wrote:

> > This patch should have had v2 in the subject (it has a v2 change log).
> > The next one will have v3.
>
> Will it? I've committed it earlier today ...

Not any more!  Thank you.  I had not checked staging.

Regards,
Jason

