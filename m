Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1823D63EC2E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 10:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450389.707622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fi6-00075e-RK; Thu, 01 Dec 2022 09:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450389.707622; Thu, 01 Dec 2022 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0fi6-00072z-OQ; Thu, 01 Dec 2022 09:18:26 +0000
Received: by outflank-mailman (input) for mailman id 450389;
 Thu, 01 Dec 2022 09:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a25g=37=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p0fi5-00072s-Cr
 for xen-devel@lists.xen.org; Thu, 01 Dec 2022 09:18:25 +0000
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [2607:f8b0:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a0d7b21-7159-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 10:18:24 +0100 (CET)
Received: by mail-pg1-x536.google.com with SMTP id 136so1163649pga.1
 for <xen-devel@lists.xen.org>; Thu, 01 Dec 2022 01:18:23 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 n16-20020a170903111000b0016cf3f124e1sm3094631plh.234.2022.12.01.01.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:18:21 -0800 (PST)
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
X-Inumbo-ID: 1a0d7b21-7159-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StnIbZYaIPz/Pik8pZgnLw5C7gcdo2ir+ZsqwcMfASU=;
        b=P0+XOfs3RONiah35WkNA/qvQeJCEaV8d9GCEOSelgG3H6oVIe2XlS3sH240iTyHbLB
         9Zil943jYd2UvUZHCnaFrqk7TmkH+NaU4EysBnX1vKgwrSZhXGpH4RiK2V8+pes3taY9
         Gh4pKyvAzVyvrZtWiHocBMemLJg4SmqqHbXDuT5+vmh/T8TPGCHk0n6CQdslJ23lhACb
         3GBlzLNWaucwFYHSG6j/1a4obh5hyRTa9Zz9d+YJqPzpfoyDkCtkxfrQ0Q9CSXYLxvjy
         r8ecXLt/J93NAjpT8tMCbX3BV4LZAim5JVNw83yl0jiCb1qYxMZkUuVj3u7HFSzBw+9k
         KZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StnIbZYaIPz/Pik8pZgnLw5C7gcdo2ir+ZsqwcMfASU=;
        b=1lAPIYmROfcgukCxPFUhhzPeRBeBzEsV/auwl1uGBMyE//7Qfi11Gpqys+ZPmgnM7T
         eGJWpkv2o41c8F0w6Qfz2nqQtgLSdK63ANOnI3yN6kdeOwRsxk/8ZjFB+UFFkeDXRQ8a
         iMTRol7s1N9N2TmZ5jG7hvxI9O206cKBP6oDWBm8qZAMdbu0QGtSFvQuEAUyemWlnwVO
         wG3DpDHQ+qZfENdhIZypz8jt3cO70MkjHMSUNdsvNlF44eqRXLmi38AwIXoR8bAcq6jz
         +FEu8sQTNogt6eLAWwVUt0Inx+TrilTRCqzesbfAnxLBNbOMUF3mAbTrh8pBl4Vtl9rw
         yhhg==
X-Gm-Message-State: ANoB5pn4WGCFUr9A89/JbPacpoHBO+ZbTPVpCvZFK2kjE+tZXst8BaZD
	pqH2El+O/fqHxT6yhRunODZTognPzFu/1w==
X-Google-Smtp-Source: AA0mqf6RzOzFAXmzxy9Vwk2HCj22L4oZj9Y1eyfQt5hP1atNpmQq4GFaxfe2b46G//sykxu83/3cGg==
X-Received: by 2002:a65:6d10:0:b0:476:fdde:e539 with SMTP id bf16-20020a656d10000000b00476fddee539mr43398276pgb.216.1669886301552;
        Thu, 01 Dec 2022 01:18:21 -0800 (PST)
Date: Thu, 1 Dec 2022 14:48:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH V6 0/3] Virtio toolstack support for I2C and GPIO on Arm
Message-ID: <20221201091819.n7xyprz3ido55pyg@vireshk-i7>
References: <cover.1667906228.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667906228.git.viresh.kumar@linaro.org>

On 08-11-22, 16:53, Viresh Kumar wrote:
> Hello,
> 
> This patchset adds toolstack support for I2C and GPIO virtio devices. This is
> inspired from the work done by Oleksandr for the Disk device.
> 
> This is developed as part of Linaro's Project Stratos, where we are working
> towards Hypervisor agnostic Rust based backend [1].
> 
> This is based of origin/staging (e61a78981364 xen/arm: add iounmap after initrd
> has been loaded in domain_build) and the earlier posted cleanup patches [2].
> 
> V5->V6:
> - The cleanup patches are sent separately [2].
> - We don't add I2C or GPIO specific device changes anymore, rather we create
>   generic "virtio" devices. The "type" of a virtio devices helps us identify the
>   right device, and create an entry in the DT node. The same can be used for all
>   Virtio devices now.
> - Update man page xl.cfg.

Ping.

-- 
viresh

