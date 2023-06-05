Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5C4722384
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:32:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543642.848783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67VI-0005Lh-5P; Mon, 05 Jun 2023 10:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543642.848783; Mon, 05 Jun 2023 10:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67VI-0005JW-2h; Mon, 05 Jun 2023 10:32:00 +0000
Received: by outflank-mailman (input) for mailman id 543642;
 Mon, 05 Jun 2023 10:31:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNO+=BZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1q67VG-0005IW-Jc
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:31:58 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31f844b7-038c-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 12:31:56 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-30aebe2602fso3783152f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 03:31:56 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfdd90000000b0030633152664sm9241227wrl.87.2023.06.05.03.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 03:31:55 -0700 (PDT)
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
X-Inumbo-ID: 31f844b7-038c-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1685961116; x=1688553116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAsAi/0DNL4Q7W+IedKpFwOcbv4F6f1yLIdPIyxAzVo=;
        b=NsPW9sU52+xOU0s1CaztonefyxV5wuQoqNW7fjwUx5rQS+qZMSbLQbaLuQ29yGng1r
         UiYHQcNqFyzStcs3dmT4ZbjBkOkGWlp+eVk7JUfIM51MZ4uSvl6QWQ7qkFeSjdaoBelS
         wDS9uJgkOXxSn9v1dZh4K7dPYLJrpkAaUQ5WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685961116; x=1688553116;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAsAi/0DNL4Q7W+IedKpFwOcbv4F6f1yLIdPIyxAzVo=;
        b=Zq7WfRgzM48HSMEIcy5Tlr8v4dzIXM9YQh1wpPyR6Ci+IW8B/gPcfy53pdzB/cvXer
         JlpA1+qz3mMtlP5syp02H01ikGPprnPdEZZUv86Kbw4JPtm6Eb8mtUiXRa2B8WLtMR3T
         NalMTkc1kQTXgtgeIXyhRTrKBMmQCCS0Buyj3v8CyZ2sOuydNzeTRlYRN6Y3tl80ka/N
         s6rtCBNxVSQXe89FY/1zKIWBfuF3TDqY5V1Sbloe1E9m5htAAEs4mkiFF6eTwhdiiOQ+
         oPKIBucd2pwkXbSG8xM6Yb2ASg4O/oXLonsk5jbjufWul2bFUIeQvwzjRbT5Rcckjwrq
         RlpQ==
X-Gm-Message-State: AC+VfDzAdhdAMSkRxWrMjoIzb5OB8tCsZjED/ej5/OmU/91QA8Qna2f+
	WiqMD7NTZkz40jXRTx9ttEGVEFADtgi3RvNcphA=
X-Google-Smtp-Source: ACHHUZ6YJcg2H+mhcvzw3Ty/ztBi+LocATROojxhZ9H3mDaNn4UdbWZ14qq96JZZHnXU0YB6Ms5ZtQ==
X-Received: by 2002:adf:d082:0:b0:30d:d85c:4472 with SMTP id y2-20020adfd082000000b0030dd85c4472mr3691251wrh.62.1685961115865;
        Mon, 05 Jun 2023 03:31:55 -0700 (PDT)
Message-ID: <647db99b.df0a0220.45aaa.6dcd@mx.google.com>
X-Google-Original-Message-ID: <ZH25mQLR4jcfUmMc@EMEAENGAAD19049.>
Date: Mon, 5 Jun 2023 11:31:53 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/microcode: Prevent attempting updates known to fail
References: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
 <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
 <0b118c70-b1b0-43ad-31d2-1b301b360b12@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b118c70-b1b0-43ad-31d2-1b301b360b12@citrix.com>

On Fri, Jun 02, 2023 at 09:35:56PM +0100, Andrew Cooper wrote:
> For this MCU_CONTROL_DIS_MCU_LOAD case, we don't want to be trying to
> load new microcode because that's a waste of time, but we absolutely
> should query the current microcode revision.  It is frequently relevant
> for security reasons.
> 
> So I think we want to fine-grain things a little, and separate the
> concepts of "ucode info available" and "ucode loading available".  Per
> the current mechanism, that would involve supporting a case where
> ucode_ops.collect_cpu_info() is available but
> ucode_ops.apply_microcode() is not.
I was going after something to that effect, yes.

> 
> ~Andrew
> 
> P.S. also in our copious free time, we need to start supporting the
> Intel min_rev field, which is more complicated than it sounds.
> 
> min_rev is vaguely defined as being relevant to block updates "after
> you've evaluated CPUID and made decisions based on it", but here in Xen
> we do also do livepatching and late loading to explicitly make use of
> newly enumerated features.
> 
> So we need a way of xen-ucode saying "please really do load this,
> because I as the admin think it will be fine in combination with the
> livepatch I'm about to apply".
> 
> My best idea for this is to have a `--force` option to pass to Xen to
> skip the revision checks, which will require either a new hypercall, or
> perhaps borrowing a high bit from the size field in the current hypercall.
> 
> With a force option in place, the boot time ucode=allow-same can go
> away.  It has become distinctly less useful now that we were forced do
> this unilaterally on AMD CPUs, and separating "allow same because of HW
> bugs" from "the Admin promised they knew what they were doing" would be
> better for testing.
I've created a GitLab issue to keep track of that:

  https://gitlab.com/xen-project/xen/-/issues/164

There's also the case of downgrades. We probably want to at least avoid
going back to a microcode revision with different min_rev field.

Alejandro

