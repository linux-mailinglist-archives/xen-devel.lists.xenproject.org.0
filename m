Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF431A10A25
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 16:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871458.1282452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiPX-0003DX-T2; Tue, 14 Jan 2025 15:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871458.1282452; Tue, 14 Jan 2025 15:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXiPX-0003C4-QN; Tue, 14 Jan 2025 15:00:55 +0000
Received: by outflank-mailman (input) for mailman id 871458;
 Tue, 14 Jan 2025 15:00:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLru=UG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tXiPW-0003By-Ff
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 15:00:54 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59251c2d-d288-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 16:00:52 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aafc9d75f8bso1075347666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 07:00:52 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c913430esm640002466b.88.2025.01.14.07.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 07:00:49 -0800 (PST)
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
X-Inumbo-ID: 59251c2d-d288-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736866852; x=1737471652; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UT+J0hyKbo5O63MAKSTu2gx8xHI6peacL+LV+11S1JY=;
        b=rPZdnMt133FV3XroeoSj9ijP34K0oy+p2p4IIUZ9aZ3TVKbBfhgLiTxO72PqfYA9jK
         Rgd0WSdYdUe+X0AH0Jx6fe84LODMLpdrMH0cY0/Z+9gM3/f+QmLm270tiuh+j/DXx4ti
         H6g7R8WUmkO+W6iwpXxCvDgOy789WurpytCb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736866852; x=1737471652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UT+J0hyKbo5O63MAKSTu2gx8xHI6peacL+LV+11S1JY=;
        b=byPe+0G5+xZZ1vH8oIIB0hCHZ4Kwi8afB63gn28vNrF14uRkHIO9PJ4Ww+Pum3lDum
         aBdpO5i2wZak7k5UTtp9pUVHLMrxi80pnnP3Z9fMeFyucQ3shmfuKDe8bpZEVxn3jcgl
         1zDoKgLzpIHp09cKQvJScdK56Prv0W4ToZoXJWp7okNphBAmhU4+H64lYCfHo+bq6d4T
         T89PeI0m6qYvfQaKqMyPS+MQWyyI1K6hksb1Gut5Oc60U8aCFGdioxoISikePwGzjQOZ
         j82kVC/E74JWPa2yyxA4so10UZ1pMHm3adg4dF3H4GUXBw5EqheEJtkkWZx9YQQboZA0
         lF3Q==
X-Gm-Message-State: AOJu0YxJ/mxuVIHfFW9UZ+ShcN3ZcFSziBpGb+jmwMEiraOI7eLWJdKl
	dQ/vHxW9yBfVQoeHqfpozZmWtecRLE6uHQ1CF6y57e69gfcHKE5G1iOR6cj9+i0=
X-Gm-Gg: ASbGncvJaxEWII3vtsTv0gcDkJhyX37ilwbkhhGow7f7eObDv3gE5q9dxzFRcmjIlNI
	jPWLFdfdpNNSwSZdqT2K5PrXHG5TeKtJKcxM2eeJpyBsy2bF2cmtlkb7k3ajvtKTNo3gn/zSutA
	ED8/NW71fY8QH+Fl6LUnJiT61FyJiewjJ/O37jxKcZSZFEHR3BRNidrbMNhiRs5RZ3PlUp60igt
	5WkjVowVcotqLKW2Q5K2Jqnt44OoOU4rfb8BaUVv6XkmQrvKSYQK75zEA7Awg==
X-Google-Smtp-Source: AGHT+IHuMTezd1ZH5mS5+k+duj0AyKIKCXUfx92Ckc2VgbuZA6swxtJxxN8jrPZT3/CG4VNE1ASV9A==
X-Received: by 2002:a17:906:f59a:b0:aa6:9503:aa73 with SMTP id a640c23a62f3a-ab2abcb1135mr2491453766b.51.1736866850064;
        Tue, 14 Jan 2025 07:00:50 -0800 (PST)
Date: Tue, 14 Jan 2025 16:00:48 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
	michal.orzel@amd.com, xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com, consulting@bugseng.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: Re: [XEN PATCH] MAINTAINERS: Change reviewer of the ECLAIR
 integration
Message-ID: <Z4Z8IMWuz0UqldN9@macbook.local>
References: <8c370ced911457c883360836bd5afda747426a13.1736856521.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c370ced911457c883360836bd5afda747426a13.1736856521.git.nicola.vetrini@bugseng.com>

On Tue, Jan 14, 2025 at 03:48:54PM +0100, Nicola Vetrini wrote:
> Simone Ballarin is no longer actively involved in reviewing
> the ECLAIR integration for Xen. I am stepping up as a reviewer.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Adding Simone to the Cc list, it would be helpful if he can also
provide an Ack to signal he is OK with begin removed.

Thanks, Roger.

