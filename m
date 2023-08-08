Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F98773979
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:53:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579532.907544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJOZ-0006bs-Vp; Tue, 08 Aug 2023 09:52:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579532.907544; Tue, 08 Aug 2023 09:52:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTJOZ-0006YZ-Sy; Tue, 08 Aug 2023 09:52:55 +0000
Received: by outflank-mailman (input) for mailman id 579532;
 Tue, 08 Aug 2023 09:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gjkb=DZ=tibco.com=avallejo@srs-se1.protection.inumbo.net>)
 id 1qTJOX-0006YA-S4
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:52:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5654acf0-35d1-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 11:52:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-317c1845a07so4045812f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Aug 2023 02:52:51 -0700 (PDT)
Received: from EMEAENGAAD19049. (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f6-20020adfdb46000000b003177074f830sm13122945wrj.59.2023.08.08.02.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 02:52:50 -0700 (PDT)
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
X-Inumbo-ID: 5654acf0-35d1-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1691488371; x=1692093171;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1ny2lmOhIgokgHz6VdMH7DQQmIyVahsX5ZjUgT/HTBU=;
        b=W8xMmLsazsGGrf/WVu7d2ZLVN0X9rRchXdEl2BSMMzPY5mTXFvwqi129d3msky0qpE
         +0mkEPHTMcsLXiVg8J8r+RnOCrLKnTOBDtn7bQcjNSAQDRQQToKSX3NA+CqOcUbajibl
         iARCa1zjse3CabFYvaEbo3ci86N5JJkFbYjIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691488371; x=1692093171;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ny2lmOhIgokgHz6VdMH7DQQmIyVahsX5ZjUgT/HTBU=;
        b=f2R6BubCLfPQYUt3GyWCrqXqwEyFZtBdG7K1fQfJSL0tgTQjOPrpi0emFWF4/ylFg+
         zXDo1J31QvJBvCL9PMA7jrqVV8GWY1YwV7TVlqBjf0KRrSYFeq5MJMOvpMfQP342Jl1Q
         TQ3QZpSjEyPTKAzbXbHTKNAMJe5lUL0CQATv5DQJVC+FH0fxzcNh6kMImBW/Z0Fde+9z
         cRRZMOH+/J8PeAwNMFnHnJ21rtbw5H7XU0/OX90g1ewkPcU1i7JvMpb64xaJ6bwxm4lp
         KOMM1oIWsgKDX5T/SDtQ/6cfutdiPxkaIjgZDq6CnWRlSC0I29Il6WLYx9o4iWZKFtzM
         w7gQ==
X-Gm-Message-State: AOJu0YzIB8UA21NNK/Oi9/BWuND26x9DTlzRrP+nWnyNTGJfrFkXT8ep
	xwdD8CM7fdFRpD8bf06zkaNoBQ==
X-Google-Smtp-Source: AGHT+IFVgI9gGVkg+vluaazwSOrh/swjDa5/VCu5uqWz5MKw9HghNyk7kF3CDAHeCOGk+oPqmP/cHw==
X-Received: by 2002:a5d:464a:0:b0:315:a1bb:4d7b with SMTP id j10-20020a5d464a000000b00315a1bb4d7bmr6792592wrs.35.1691488370921;
        Tue, 08 Aug 2023 02:52:50 -0700 (PDT)
Message-ID: <64d21072.df0a0220.bdac0.2e7e@mx.google.com>
X-Google-Original-Message-ID: <ZNIQcKZam87eLK44@EMEAENGAAD19049.>
Date: Tue, 8 Aug 2023 10:52:48 +0100
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Julien Grall <julien@xen.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 5/5] pdx: Add CONFIG_HAS_PDX_COMPRESSION as a common
 Kconfig option
References: <20230728075903.7838-1-alejandro.vallejo@cloud.com>
 <20230728075903.7838-6-alejandro.vallejo@cloud.com>
 <5bd0894b-6114-48dd-8c7f-2d1fe142c9d8@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bd0894b-6114-48dd-8c7f-2d1fe142c9d8@xen.org>

On Mon, Aug 07, 2023 at 06:48:13PM +0100, Julien Grall wrote:
> Hi Alex,
> 
> One more remark in the title. s/HAS// as you renamed the Kconfig.
>
> [snip]
> 
> -- 
> Julien Grall

Oops. Good catch, cheers.

