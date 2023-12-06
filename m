Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A9E807626
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 18:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649372.1013820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAvQA-00026V-Lx; Wed, 06 Dec 2023 17:10:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649372.1013820; Wed, 06 Dec 2023 17:10:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAvQA-00023i-In; Wed, 06 Dec 2023 17:10:50 +0000
Received: by outflank-mailman (input) for mailman id 649372;
 Wed, 06 Dec 2023 17:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uU2H=HR=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rAvQA-00023b-29
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 17:10:50 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66106d31-945a-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 18:10:47 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3333a3a599fso580789f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 09:10:47 -0800 (PST)
Received: from perard.uk.xensource.com (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 he15-20020a05600c540f00b0040c25abd724sm296896wmb.9.2023.12.06.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 09:10:46 -0800 (PST)
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
X-Inumbo-ID: 66106d31-945a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701882647; x=1702487447; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ygJQ11lVIy+dGwQu4ObcXGNlr5jdB1jPQ2GsWqZ4H6o=;
        b=IQy543vuM6WO+8sWhOlDtkdl0bUrjPS6LqMEZzYlcRrWiXxOFSFiZ6x/Wqfyd70qdE
         xkD2ig/FHEHgTtemeq1BQ7Su7zv5Dcsy7OGJHf/++8CCqlrCfLeHSPMawXNw0YlkNZEp
         AEp8jLiZT9/fjkVJW2HssxVcJFfjnaOSHtFzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701882647; x=1702487447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygJQ11lVIy+dGwQu4ObcXGNlr5jdB1jPQ2GsWqZ4H6o=;
        b=JU6jAWzup5mqb4uOFoVQgWQ4cQSk8nkKey/yQFRf9fm+AT8mxLTMfdzsRltQqTmVQI
         hghqq8xGzOzkx45zfmL638eg8C20ee8+sBMcCCvO8Pykaul9gUifmSuF0WNH2qXrIk/1
         AVn22gOyk5rpgY/m0FtjZCvyPTh8KffogqtyxtR4w4OH9uAx494Fs0VcMLldhBJuz5r/
         YcB/uAgR1FJUfdicvXYJFBNW+V1CuzvEQgKxJOdxUys30c5OwfVEu2rUotSLkhSk+Hz4
         D5dsrXioE2DUCRdbpEzSoJiFo2GQemJrwtTFkMDFNMHokLPtP32pfUmHsFEuuxgSgavb
         9jvA==
X-Gm-Message-State: AOJu0YyNIb6VVa/gJSMikABKoQqggXpaXv1ZCFKXyci4L+TCIZBeU7fV
	jtddHoCHNlDVyIix8+1g9P6qgQ==
X-Google-Smtp-Source: AGHT+IFtWcSHZ2oJLGyder4CwJPSnDHhLNNs7iy18nmFpsBl9eoDeOc0IorEktjQvawsGHALt4O/UQ==
X-Received: by 2002:a05:600c:3c99:b0:40b:2a08:c45e with SMTP id bg25-20020a05600c3c9900b0040b2a08c45emr1750816wmb.3.1701882647076;
        Wed, 06 Dec 2023 09:10:47 -0800 (PST)
Date: Wed, 6 Dec 2023 17:10:46 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Paul Durrant <xadimgnik@gmail.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Subject: Re: [PATCH v4 2/6] xen: backends: don't overwrite XenStore nodes
 created by toolstack
Message-ID: <a5d439c6-f20d-41a6-8ec1-6132d505deb0@perard>
References: <20231202014108.2017803-1-volodymyr_babchuk@epam.com>
 <20231202014108.2017803-3-volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231202014108.2017803-3-volodymyr_babchuk@epam.com>

On Sat, Dec 02, 2023 at 01:41:21AM +0000, Volodymyr Babchuk wrote:
> Xen PV devices in QEMU can be created in two ways: either by QEMU
> itself, if they were passed via command line, or by Xen toolstack. In
> the latter case, QEMU scans XenStore entries and configures devices
> accordingly.
> 
> In the second case we don't want QEMU to write/delete front-end
> entries for two reasons: it might have no access to those entries if
> it is running in un-privileged domain and it is just incorrect to
> overwrite entries already provided by Xen toolstack, because toolstack
> manages those nodes. For example, it might read backend- or frontend-
> state to be sure that they are both disconnected and it is safe to
> destroy a domain.
> 
> This patch checks presence of xendev->backend to check if Xen PV
> device was configured by Xen toolstack to decide if it should touch
> frontend entries in XenStore. Also, when we need to remove XenStore
> entries during device teardown only if they weren't created by Xen
> toolstack. If they were created by toolstack, then it is toolstack's
> job to do proper clean-up.
> 
> Suggested-by: Paul Durrant <xadimgnik@gmail.com>
> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> Co-Authored-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 

Hi Volodymyr,

There's something wrong with this patch. The block backend doesn't work
when creating a guest via libxl, an x86 hvm guest with qdisk.

Error from guest kernel:
"2 reading backend fields at /local/domain/0/backend/qdisk/23/768"

It seems that "sector-size" is missing for the disk.

Thanks,

-- 
Anthony PERARD

