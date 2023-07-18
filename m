Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6A7757DED
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:40:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565270.883288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkw0-0003VU-BH; Tue, 18 Jul 2023 13:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565270.883288; Tue, 18 Jul 2023 13:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkw0-0003Ti-7F; Tue, 18 Jul 2023 13:40:12 +0000
Received: by outflank-mailman (input) for mailman id 565270;
 Tue, 18 Jul 2023 13:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rqcw=DE=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qLkvz-0003Tc-3G
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:40:11 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d3bcc1b-2570-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:40:10 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51e29ede885so8184259a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jul 2023 06:40:10 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o6-20020a1709062e8600b009920f18a5f0sm1011317eji.185.2023.07.18.06.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jul 2023 06:40:09 -0700 (PDT)
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
X-Inumbo-ID: 9d3bcc1b-2570-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1689687609; x=1692279609;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Pzwf/H01D+13e23r1ClZH4MClNVAtCL1EC6VhI3vg=;
        b=HM7Y2byrdjYoiuHJk4T6rOhZhqK160rlqRWSWzxb4D8FoDLZykO4quKlyUwSxFciTR
         yDBomb1CR7+Q5fBmB2+JMYDtFoecDO5f5l8ch/EmGXPNNx2xWFjQ+SdaFjvZwQgOTypO
         CazbGuvsFuC/t3LJmHSrBn2ylMMdaMqBqkeUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689687609; x=1692279609;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3Pzwf/H01D+13e23r1ClZH4MClNVAtCL1EC6VhI3vg=;
        b=J95ahYINPTo05iD+vHRvvdVFQ3BIGrss+0hfLY6rmB5xc/Y5IHqJU7vpe4GSGLrayZ
         PVTx4WfloIcnHNaUJvALWOuTkZ3Y42+VPOg/AJnWKJLsDr7zFADe/sNC9ygEVf2FXh2g
         Fsh36NmiweR6Xqwc/IAxWuhilVfp6fOZ9kOtvfKcw7bc/GmmyOXhW9RPlDO0wGKcmoGa
         vm7nxYjd+vuJLq9bCEsRpT2nqFM8BEn3qRBDeBSAEpbzufs9q0B3sPzFaLl4gh90QkX8
         2S9fG2HjudGJNR6QkN9iD+lxPLPg1aEu1qUvnYwVvuWgEuNRDXMbLlMPLjkXtFDHb+Fd
         1IeQ==
X-Gm-Message-State: ABy/qLbpN+hzeqbjjX8+5CvOMEdF9FZ9o/trgGv6+PlQLH3QWOEK9j/H
	YCNEPp68C6yQsb9OtwzPy0n4cw==
X-Google-Smtp-Source: APBJJlH67/xzB0EgoAH+lVGuAgkTUe/uMpZL3APYKq8T45nQUOWjq6T8paz334dSfwzMsxODtvstrw==
X-Received: by 2002:a17:907:3d5:b0:982:8de1:aad9 with SMTP id su21-20020a17090703d500b009828de1aad9mr12303642ejb.64.1689687609616;
        Tue, 18 Jul 2023 06:40:09 -0700 (PDT)
Message-ID: <64b69639.170a0220.5f2ec.42dd@mx.google.com>
X-Google-Original-Message-ID: <ZLaWOOmXiJ629qXY@EMEAENGAAD19049.>
Date: Tue, 18 Jul 2023 14:40:08 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/8] Make PDX compression optional
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <7ad1dc72-3b1b-fa7f-8ce4-dd7973c8da93@suse.com>
 <64b68c65.170a0220.b0fe3.40f1@mx.google.com>
 <119404f7-8e6d-a3e0-2d29-d34ab78a6a2d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <119404f7-8e6d-a3e0-2d29-d34ab78a6a2d@suse.com>

On Tue, Jul 18, 2023 at 03:06:26PM +0200, Jan Beulich wrote:
> On 18.07.2023 14:58, Alejandro Vallejo wrote:
> > I believe the burden of proof is reversed. Features bring complexity, and
> > complexity increases the chances of introducing bugs. It's the presence of
> > a feature that ought to be backed by a proof-of-requirement, not its
> > absence.
> 
> The feature was introduced to support hardware a partner of ours was
> working on at the time. Xen wouldn't have worked very well there
> without these additions. It is beyond my control or knowledge whether
> any such system has ever made it into the public. So at the time of
> its introduction, the need for this code was well justified imo.
> 
> Jan
Oh, of course. I don't question the legitimacy of its introduction at all,
nor do I question the matter of its optional presence. I do question the
default considering the public data we have available.

Alejandro

