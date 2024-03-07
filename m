Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326078758C8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 21:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690033.1075658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKgb-000762-UU; Thu, 07 Mar 2024 20:49:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690033.1075658; Thu, 07 Mar 2024 20:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riKgb-00073b-RI; Thu, 07 Mar 2024 20:49:53 +0000
Received: by outflank-mailman (input) for mailman id 690033;
 Thu, 07 Mar 2024 20:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riKga-00073V-EO
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 20:49:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e1f257e-dcc4-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 21:49:51 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a4467d570cdso18181866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 12:49:51 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a170906591400b00a3d5efc65e0sm8611857ejq.91.2024.03.07.12.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 12:49:49 -0800 (PST)
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
X-Inumbo-ID: 3e1f257e-dcc4-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709844590; x=1710449390; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKY0/kjpyBwXqZPFaZC8zJg2HyVpPDaHzKDxYdT5r00=;
        b=j4wPxJOZ+HFpGtW7jH5xMFwRYUeZbqUz30GRoxUrilsbPjY3zUCn9XVT/aKo7InSIR
         j3NmrZlVsVy81v0kx4IhdhQAgcjLg4yRCij/nbQ9citIG0wzQJPB0u83hq45Cw3CpfcH
         10rQfOki1upT9/FpdVTqOCIVi5Hk+2f1bX+Itbs0OZAcKXVthpgW/IZ1fk/XeAcnzyH1
         6dXheynDq8lY5gPxwH+CDuwPTP0Dl56CDe1hUPEIBSuGzCYxRQ5wTD3jTmoilpJNMyTS
         Sf/m+Pg+aTuwJbt+6wG3Sk2XOhVWVznQiitd6f3EOXE4o8kD0yamWNfDa4dyReJsYwmp
         ervQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709844590; x=1710449390;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DKY0/kjpyBwXqZPFaZC8zJg2HyVpPDaHzKDxYdT5r00=;
        b=QnyW1YcNFtT3jJU7XZ/hSd1ZnHmCki53ydgzkFuxBgxx3ach7NlRMbcqEE6jXocAGv
         lZb9yfVUvE476mAPtzCsSR7cLMX4xJfJ+d9Ld/Czewa7yPmX174mwDhRbi7ERMkR+CBF
         6ba3Tf0N0gv8hyELaGaa3fMeNRGgXk3BCVWRnLMfO1f4B4fNW5Wk7OdxMoArvnMf0jN4
         29VNK5ndx+/Xn94WuachymLaqIUsMoRmO80NC0dYuvDwtX2BEDMTlvx4a7Bpm7/YkvGP
         0XjcQEe1RVssKF2Cr7ZvFH2JujgWdR4KSxErRho+2JkKOtIvwcwr8pn9jyNSuGzCqN/n
         UA7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWBz9qrN9J5UG8HGf3JJ2GHadlhBHc7dZqHLebr5oYA9J9suhMtyp8tTgmSf5AnTH2Gdro6rht5doLB/i2E63b6lpjmVdPfJa1pNgci1U=
X-Gm-Message-State: AOJu0Yy3rTjl3wJkAcrKOMhWyBVbo7eLPTkk/AMtEiXk/XroKTdlIRff
	/HX6dVvlZl/lGcfHsdHsuReyY8LMDn2fj4Cd7exyV6OYPVBwTpO8
X-Google-Smtp-Source: AGHT+IEakc2RD8id5JNyrpqEb+cESrJsM/f+7ocKWxnIzn97bNVuli84qqKH9iP5UBojjkIPSuH5SA==
X-Received: by 2002:a17:906:685:b0:a44:fe70:1b82 with SMTP id u5-20020a170906068500b00a44fe701b82mr10075176ejb.8.1709844590235;
        Thu, 07 Mar 2024 12:49:50 -0800 (PST)
Message-ID: <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 21:49:49 +0100
In-Reply-To: <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
	 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
	 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
	 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
	 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
	 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
	 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
	 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
> For plain writes it should at least be "=3DQo" then, yes.
Constraints Q is a machine specific constraint, and I am not sure that
it makes sense to use "=3Do" only and probably it is a reason why it is
enough only "r". Does it make sense?

>  To me making those
> input operands on Arm can't have been quite right.
I  don't understand why they both are input, logically it looks like an
address should be an output.

~ Oleksii


