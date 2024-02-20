Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF885BAC8
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 12:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683441.1062961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOTk-0001X2-Sk; Tue, 20 Feb 2024 11:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683441.1062961; Tue, 20 Feb 2024 11:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcOTk-0001Ui-Pf; Tue, 20 Feb 2024 11:40:04 +0000
Received: by outflank-mailman (input) for mailman id 683441;
 Tue, 20 Feb 2024 11:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qAG8=J5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rcOTj-0001D9-C7
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 11:40:03 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8c1f4a2-cfe4-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 12:40:02 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512b29f82d1so2925491e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 03:40:02 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 jv24-20020a05622aa09800b0042dce775a4bsm3386041qtb.3.2024.02.20.03.40.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 03:40:01 -0800 (PST)
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
X-Inumbo-ID: c8c1f4a2-cfe4-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708429202; x=1709034002; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IGlZzmWp6xz09mlJ1wyOOX/OEeaoUYzGIvASoAaf8N8=;
        b=IQIWO/c0mwTWqMRCz4W8tXmpG0EYhY7eaDC8JgvDrTcIOimuYagBmVAZ3/a/uETKl7
         pwPAZLVJmzP4YP+zILR9eUmEimbadScTAXUcGnCCd9ygjYPWkKbZA2D5Dk8i0Sjww8MK
         /bzQlxhI0D/DzpPJ3E3CHkXaw874qppi994vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708429202; x=1709034002;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IGlZzmWp6xz09mlJ1wyOOX/OEeaoUYzGIvASoAaf8N8=;
        b=K9OUyNRBBk2fegYBpjqtLFpqRb9CLXDxGIw+GGr7KGLlIHp60feXDArzb49MeuWvUv
         hf+cwormNxLTJ3XgDqb9s7B++Kvt3BnquSEY4kp9TftYdB5UHq2YFr0+2gZaKih+R9zd
         rqEjHMh0tmArTEwVtuUvp769N0KS8i4vlqatzfjNj22U+MuKyzVrgL2eYL3Khz4zEpo5
         yklzhab2oGbd3Sy6lgCcE3KCAhrtA8OAlBQYT59z/1Uh7hMybZa75m+XZUiwkkhcaASi
         Ssc+L9xf1z8bxzhAg4zZCWvujuZXVy6OBL0lVhKyKjKMvwZVOMUZrEaOvFqdFCILICaD
         Owqg==
X-Forwarded-Encrypted: i=1; AJvYcCXpLHeBEdXniBFWmQv4boJRe8Bh6I/I+SIxTOiTw9s9GODsV9TKrjGpNxlp7oVSFbjuhkEqNCz/WoFSOeXA0HK8LkAunwDcI9fRUWh/lJw=
X-Gm-Message-State: AOJu0Ywg0/fdmNW5r+M2AP7hChBvUCz3Lmt5uuP4hCCDVXUtu6pTNlbN
	bq2P9z5WteE1qlS7FLLNQslWiKmAsUxKx98NKtTuJixQF23kU4Ny8DvzFTl6xpQ=
X-Google-Smtp-Source: AGHT+IHbnU1LpWt6trJIlUs3WRM52Tu3ynjqRt6lHOWcYzwBooYpKnWVVL35CFpQMvX5fPKx7bXULg==
X-Received: by 2002:a19:4304:0:b0:512:b3ef:79c6 with SMTP id q4-20020a194304000000b00512b3ef79c6mr3048275lfa.40.1708429201878;
        Tue, 20 Feb 2024 03:40:01 -0800 (PST)
Date: Tue, 20 Feb 2024 12:39:59 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org
Subject: Re: [PATCH 1/4] xen-blkfront: set max_discard/secure erase limits to
 UINT_MAX
Message-ID: <ZdSPj32Ww80nKQhM@macbook>
References: <20240220084935.3282351-1-hch@lst.de>
 <20240220084935.3282351-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220084935.3282351-2-hch@lst.de>

On Tue, Feb 20, 2024 at 09:49:32AM +0100, Christoph Hellwig wrote:
> Currently xen-blkfront set the max discard limit to the capacity of
> the device, which is suboptimal when the capacity changes.  Just set
> it to UINT_MAX, which has the same effect except and is simpler.

Extra 'except' in the line above?

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

