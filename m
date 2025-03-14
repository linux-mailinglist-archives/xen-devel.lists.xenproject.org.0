Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26203A60E88
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 11:15:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914311.1320082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt251-0001zv-7Y; Fri, 14 Mar 2025 10:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914311.1320082; Fri, 14 Mar 2025 10:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt251-0001xz-4Z; Fri, 14 Mar 2025 10:15:51 +0000
Received: by outflank-mailman (input) for mailman id 914311;
 Fri, 14 Mar 2025 10:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OT8H=WB=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tt24z-0001vU-Sx
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 10:15:49 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cfe60df-00bd-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 11:15:49 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5e5e0caa151so3398548a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 03:15:49 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-5e81692e5cbsm1765827a12.6.2025.03.14.03.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 03:15:48 -0700 (PDT)
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
X-Inumbo-ID: 4cfe60df-00bd-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741947348; x=1742552148; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FJYTP2Dh6p+9633+iMLtPWp7oFzzLMB4AGgcgd1qq/w=;
        b=ErLbnYpaS6tlsx1SwN9Emx+Gn2pGhN1T+X3Kkacgk5Hf+MUClCN2sVeT1zFIPtm3PX
         DzGENp5XpE59/JH5uncBJ9YW1prfMnZjRD5L051pUNbuvVRu/mT+bGG8mf8jTcUU4WM1
         YWoWNU0g3+qW2pG4yaXCJiyUM9FgJ8r5zaEYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741947348; x=1742552148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJYTP2Dh6p+9633+iMLtPWp7oFzzLMB4AGgcgd1qq/w=;
        b=bfXPYqY7MbqEY3tUgWtMS70PSzXPD9h7/Tj5heYZat4y47DdMN4XWGfWqyjJzQUsfi
         wd8k/Ge2PNy3h+uZGSzryMY/YKkMA/dfF6r8RdJBOZK/WXl793wY7KFRR6gj9o5a9qj1
         a82+CU8Lxlzdi6woR+31woZ7FoddzeZVsGSklnwQEzkiYSo8eXmDRiuCq9iIv1aGDSw+
         fqkjlWo/kUueDHm/hpZzU94IcH5u3exHb+5rFVBh7GRpHxOQeYL3mPLVXQDt0DQRflRi
         WCcIRy6FPW9qM7yFF4WxUyZYm2Fu7LMhjIbMHse5056Hw46SLHwh83MPJpM+dzXvPH5Q
         F3Rw==
X-Gm-Message-State: AOJu0YzNgmOQnTGyL8V283XsF04kFa+QplSY4uN/mVuRCKiRRvfV1wio
	4R7ofCp8/TJMjwTcM0A+lkvCmXtyNlivK2xDEFBqv36A+qu6yGU1obBJHEbdIQs4rZc6Y7Rv26a
	W
X-Gm-Gg: ASbGnctAe43EZJh1p3ZH7es3wHjOAwA4epOoA3ukPwpkNBsTJB/dma9KCHRRwOebXAQ
	1It+SEnqlS3WQJJKsCmdvyMKhRgSRZB7TDtA2zHqVdmorUQfZVanU+S1xxaqCRbQPEY30Ju3Juf
	BDSUosgiQi9olbKI9ThLNYqPso+jmShkD7avruJNAxMFy+jrlUJYWdy+0fGki8eBV7yJ8EV4a2u
	tme500ab/kbFpoT1rbbGtIRbe/py2mbMkjV2Y6kDYj8UhSncIfMKutcy7KlDJqvfk6xswbUmhx6
	zzNpyPcdSjSzbN4e588/xRJT5Vbd7hrolvvS0yiTPEJdpOwhKA==
X-Google-Smtp-Source: AGHT+IEuzh597vPDgihK2YOLxsaosS3RrL90rCfxLrG/aCXd7jixcwwM5JT6sdOMIMa09pOaVYF/lA==
X-Received: by 2002:a05:6402:5186:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5e89e6b0197mr2115547a12.1.1741947348332;
        Fri, 14 Mar 2025 03:15:48 -0700 (PDT)
Date: Fri, 14 Mar 2025 11:15:47 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] VT-d: Adjust diagnostics in set_msi_source_id()
Message-ID: <Z9QB0ymmaygrFFUc@macbook.local>
References: <20250314095523.4096604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314095523.4096604-1-andrew.cooper3@citrix.com>

On Fri, Mar 14, 2025 at 09:55:23AM +0000, Andrew Cooper wrote:
> Use %pd, and state what the unknown is.  As it's an enum, it's a signed type.
> 
> Also drop one piece of trailing whitespace.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/drivers/passthrough/vtd/intremap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
> index 81394ef45299..9272a2511398 100644
> --- a/xen/drivers/passthrough/vtd/intremap.c
> +++ b/xen/drivers/passthrough/vtd/intremap.c
> @@ -485,15 +485,15 @@ static int set_msi_source_id(const struct pci_dev *pdev,
>          else
>          {
>              dprintk(XENLOG_WARNING VTDPREFIX,
> -                    "d%d: no upstream bridge for %pp\n",
> -                    pdev->domain->domain_id, &pdev->sbdf);
> +                    "%pd: no upstream bridge for %pp\n",
> +                    pdev->domain, &pdev->sbdf);
>              return -ENXIO;
>          }
>          break;
>  
>      default:
> -        dprintk(XENLOG_WARNING VTDPREFIX, "d%d: unknown(%u): %pp\n",
> -                pdev->domain->domain_id, pdev->type, &pdev->sbdf);
> +        dprintk(XENLOG_WARNING VTDPREFIX, "%pd: %pp unknown device type %d\n",
> +                pdev->domain, &pdev->sbdf, pdev->type);

Would be nice to have a pdev_type_to_str() or similar helper.

Thanks, Roger.

