Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DE3748768
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559289.874158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH43o-00067L-N6; Wed, 05 Jul 2023 15:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559289.874158; Wed, 05 Jul 2023 15:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH43o-00064V-K0; Wed, 05 Jul 2023 15:04:52 +0000
Received: by outflank-mailman (input) for mailman id 559289;
 Wed, 05 Jul 2023 15:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ax/R=CX=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qH43n-0005mH-KJ
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:04:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49a9f1a3-1b45-11ee-8611-37d641c3527e;
 Wed, 05 Jul 2023 17:04:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-992af8b3b1bso772883466b.1
 for <xen-devel@lists.xenproject.org>; Wed, 05 Jul 2023 08:04:49 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 sb23-20020a170906edd700b0098d486d2bdfsm15008140ejb.177.2023.07.05.08.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 08:04:49 -0700 (PDT)
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
X-Inumbo-ID: 49a9f1a3-1b45-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1688569489; x=1691161489;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TSGMFxZjABZHJWtgyG5iqDKIZ/mAJXJlcxIhd/A4F9o=;
        b=jgpSXnoFQzRGOV7f5NZZGnVz2dZkjslbKHu8CYgx08M0WwbXVrkyEctkvQ80kzLl+4
         9oRO7O011UV5yt6xpbJ8/zg11FMT7FgLydGYg2OffcUBcYdCOyaD54lp8Si9L9znd5Yl
         z10wjtwWHfIL35pCDvQ4ue8fBCddxJcn5tbwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688569489; x=1691161489;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSGMFxZjABZHJWtgyG5iqDKIZ/mAJXJlcxIhd/A4F9o=;
        b=DpJ8ttuKFdaEfPxJHCXwwSCuxPcHZbbdHAeUGf6DPL/WCAHnJtppPWv8ZIisrsB2DW
         FZVFi/MYUbo5RE9Sj9PPUG/oOpMKyaIxxOAtjY9lCTpFUVc9/oHBN8mk2lK9qzY7lL8v
         wdehN7RAyXJ2RezeOh6PgT1VwAw6dn9IrXGe4TdB6NM6TNiGmF/3xewIoYCztGJY2yb8
         JZSjF09mucHgH/kRloULLsFYKIYMsDzpaCpQKaE6DcU/n9PCxi5m0X4cei/iDtGjMMnz
         QXisoqNVgdiRbNqbjlqkGIhIekCnv6FXtj+NxqPEAhgaPal7XuuDDIR5dDffT5V3gqpr
         zepQ==
X-Gm-Message-State: ABy/qLaf/SiXSzoDIwjXDk6pc9wyAXuTi2Ke24L/6PQM/X74hPmEmBxi
	kOw/ts6XkrVRJ4Gu0kgKzlyFog==
X-Google-Smtp-Source: ACHHUZ6/mnH280tPlNQIa4Skr9UhUtI23S9wXMl8KmyzBrsvhUSYFzzWzoCACyGv5VfE62858cIBWw==
X-Received: by 2002:a17:906:bcc1:b0:98e:1deb:caf8 with SMTP id lw1-20020a170906bcc100b0098e1debcaf8mr12971061ejb.57.1688569489471;
        Wed, 05 Jul 2023 08:04:49 -0700 (PDT)
Message-ID: <64a58691.170a0220.ef84.9a1c@mx.google.com>
X-Google-Original-Message-ID: <ZKWGjzqiE7UbTeCv@EMEAENGAAD19049.>
Date: Wed, 5 Jul 2023 16:04:47 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v5 4/4] x86/microcode: Disable microcode update handler
 if DIS_MCU_UPDATE is set
References: <20230629152656.12655-1-alejandro.vallejo@cloud.com>
 <20230629152656.12655-5-alejandro.vallejo@cloud.com>
 <1c9fe38e-d8aa-21fb-8dbe-4c54385b5a67@suse.com>
 <64a57820.170a0220.9a035.9a30@mx.google.com>
 <b5d551ed-6523-0ead-9c83-a7fae10eee67@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5d551ed-6523-0ead-9c83-a7fae10eee67@suse.com>

On Wed, Jul 05, 2023 at 04:30:02PM +0200, Jan Beulich wrote:
> (maybe with an adjustment to the comment, as mentioned in the
> earlier reply)
> 
> Jan
Yes, that sounds good to me. Thanks.

Alejandro

