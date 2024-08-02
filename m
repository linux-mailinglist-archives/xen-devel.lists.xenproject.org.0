Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56CA94595F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 09:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770298.1181258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnCA-0004TQ-Sp; Fri, 02 Aug 2024 07:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770298.1181258; Fri, 02 Aug 2024 07:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZnCA-0004Rl-Q1; Fri, 02 Aug 2024 07:59:26 +0000
Received: by outflank-mailman (input) for mailman id 770298;
 Fri, 02 Aug 2024 07:59:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAnW=PB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sZnC9-0004Nv-JY
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 07:59:25 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 215722ef-50a5-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 09:59:23 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-7a1d0ad7113so530042885a.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 00:59:23 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a34f6eaa32sm65494285a.41.2024.08.02.00.59.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 00:59:21 -0700 (PDT)
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
X-Inumbo-ID: 215722ef-50a5-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722585562; x=1723190362; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nk5chRwyGMNH4RApFfMxbG71pBrT7O72w2Y9RG0+qgk=;
        b=kIBL7fnb+BwaoC5uRhGbPjQgbJWeuRVKjigjYtVEUB3A/RkQMA/ybexqDCAvrUNdz8
         8B/2uiUagL3QXTljwjsWzYEBlPhkBVh+jLVWvC1mcytyUNUCmNxV4ugec96nF6MkOH0u
         S75Ld5nUTmcxiCMmkyaoLj4090wgy7B0NkqV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722585562; x=1723190362;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk5chRwyGMNH4RApFfMxbG71pBrT7O72w2Y9RG0+qgk=;
        b=CPfNjFU/tGvpcPkcdgLC10LF3QjYWaR5f6/WEXH70ABNmkzTEx27zhLObUFJ4f+61u
         jjlXVKZm1kNUfEleTSkhwCpL6E+gcBaXWCLLtf6owoN/EKU/tTqbl0UyG04bnDKw/Mms
         tQQx8mNcpQBQGNrSQRuYs9pic/M3Psv2HYaEqHdrWeaZyrQ7q0DQ7wZJN/fn2DCV7IP1
         LZJZA8rNLayiaLP0h30NH7z6ioUhdIvZ6bFa+fHyx7wpAeIi8eZ2EtGMDsbc5HK81GM9
         nfJsUGLxGlaoBn6YIrZAH3WNQOmRINWJsm6v+kVIpWBHrrOIyEalwVoAKkHrYdIEMpck
         eTKA==
X-Gm-Message-State: AOJu0YwIGmUaxFkYeCYOF6j/DM5jeyjJMLtcGf8ygC2aiMrUmpfJhONS
	++N7Qpk4J7A1DcneGdEt4r6iW0Q8Zmr0RKnzSwtBdA1yxJ1hwyTVhWowUpKugNbV4hV1x5IJnuM
	o
X-Google-Smtp-Source: AGHT+IFjmTsYkFoLwK8EMDNhaHWFP2GJbCf0gVCnLpIVOvsVSjflh7dnOo5WP6XoJwfZPUXwyxdrgA==
X-Received: by 2002:a05:620a:2988:b0:79d:6dd7:5da0 with SMTP id af79cd13be357-7a34efc1241mr307126185a.47.1722585562444;
        Fri, 02 Aug 2024 00:59:22 -0700 (PDT)
Date: Fri, 2 Aug 2024 09:59:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
Message-ID: <ZqyR2Pdh1fte8kdi@macbook>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com>
 <ZqtsQwZNyFzflDQt@macbook>
 <BL1PR12MB58490598FF7FEAE291DCDAABE7B32@BL1PR12MB5849.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BL1PR12MB58490598FF7FEAE291DCDAABE7B32@BL1PR12MB5849.namprd12.prod.outlook.com>

On Fri, Aug 02, 2024 at 03:10:27AM +0000, Chen, Jiqian wrote:
> On 2024/8/1 19:06, Roger Pau Monné wrote:
> > We might as well declare the flags field as uint32_t and avoid the
> > padding field.
> So, should this struct be like below? Then I just need to check whether everything except the lowest bit is 0.
> struct xen_domctl_gsi_permission {
>     uint32_t gsi;
> /* Lowest bit used to signal grant/revoke action. */
> #define XEN_DOMCTL_GSI_REVOKE 0
> #define XEN_DOMCTL_GSI_GRANT  1
> #define XEN_DOMCTL_GSI_PERMISSION_MASK 1

Maybe ACTION_MASK rather than PERMISSION_MASK?

>     uint32_t access_flag;    /* flag to specify enable/disable of x86 gsi access */

I would again be fine naming this just flags and the comment is likely
to go stale quite soon if we add more flags.  However given the
simplicity of this hypercall I'm unsure whether any new flags could
appear.

Thanks, Roger.

