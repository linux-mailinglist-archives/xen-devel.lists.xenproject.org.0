Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CDA89DC4B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 16:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702473.1097516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCUF-0007Rj-UR; Tue, 09 Apr 2024 14:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702473.1097516; Tue, 09 Apr 2024 14:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruCUF-0007Pb-Rv; Tue, 09 Apr 2024 14:30:11 +0000
Received: by outflank-mailman (input) for mailman id 702473;
 Tue, 09 Apr 2024 14:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mUTu=LO=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ruCUF-0007PV-5a
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 14:30:11 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aabc5fa7-f67d-11ee-94a3-07e782e9044d;
 Tue, 09 Apr 2024 16:30:09 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-345600106d3so2103056f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2024 07:30:09 -0700 (PDT)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e8-20020a5d4e88000000b003438cc1d2b4sm11615040wru.59.2024.04.09.07.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Apr 2024 07:30:08 -0700 (PDT)
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
X-Inumbo-ID: aabc5fa7-f67d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712673009; x=1713277809; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdpsnSMgSmCBcCOSRRou9HJURRfhbFWPT4Myu8GjPFo=;
        b=VyZdygHAXX73Ik9lY9Cftg9otYrBV0H+0hNV48WKmGUkxgBGkhmmQaoMh3Eg0fF4/1
         ZZ2eqvN6GKyIhJKWEAlB0EW4Zx7YLBVGa7wd8wU6/Yixp/bcj75R2BGiy+JCAeqGaJCP
         j4QnpoM1uPYIyRnjJav4a4hfrJ/dN3vnbv8qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673009; x=1713277809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdpsnSMgSmCBcCOSRRou9HJURRfhbFWPT4Myu8GjPFo=;
        b=HjXK74FC1AZJnGVAqEBeqAfu6OBerz5qT7RxNXlLQarD4ChwDBl/NwVb5RqRFzdC/j
         HA9wcjuONRhSv9kuzWCtaEr0JuB5E/JjDmvdR6GLO97kq//mwAvmVHm7EllT6oz9LfNB
         3Z3wcDlubDNjMjaANHRrH7E4kiJPncaQNrAaQAnUVkN8Xb998SmeIipYnnT9/1SJMJH/
         H3I0atZM3etrpVgEdxE9CRCciGgoi+ODDHoy+fu+Ik9dIpdUHYyfbC4wR7rOfK7WXrp8
         cZcCgFZF+inclVgdFU8yEeQKJ0ONKm3QfUlbX7A2KNuwR1/+ShzwhSrwsSAhHQ5r7iOU
         +PoA==
X-Gm-Message-State: AOJu0YwjulyvgpWrQUnliqRi5KcIdITQ+GbpPU/ZCGI7983bb5pHwOH0
	SsF7dvr+UYIR6Yoc0OLkUkHA/Co/XFmjQI3gLP5y2eqL9+TDLuLHaFw4a3LE3PA=
X-Google-Smtp-Source: AGHT+IFjUSOQCxiMX0fQ0/W69U1/+OW3c2/u8oRYof7jnKbyQRzpHGM7DVPn7LhdVnPaOm2UZgCW0A==
X-Received: by 2002:a5d:5283:0:b0:346:44:3910 with SMTP id c3-20020a5d5283000000b0034600443910mr2646164wrv.49.1712673008612;
        Tue, 09 Apr 2024 07:30:08 -0700 (PDT)
Date: Tue, 9 Apr 2024 15:30:07 +0100
From: Anthony PERARD <anthony.perard@cloud.com>
To: leigh@solinno.co.uk
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	slack@rabbit.lu
Subject: Re: [PATCH v2 2/6] tools/misc: rework xenwatchdogd signal handling
Message-ID: <cbad8e28-23a2-433f-b70d-bd71efdc5ee6@perard>
References: <20240329111056.6118-1-leigh@solinno.co.uk>
 <20240329111056.6118-3-leigh@solinno.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240329111056.6118-3-leigh@solinno.co.uk>

On Fri, Mar 29, 2024 at 11:10:52AM +0000, leigh@solinno.co.uk wrote:
> From: Leigh Brown <leigh@solinno.co.uk>
> 
> Rework xenwatchdogd signal handling to do the minimum in the signal
> handler. This is a very minor enhancement.
> 
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

