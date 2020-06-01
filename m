Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6C81EA6C1
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 17:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfmDY-0002NP-T2; Mon, 01 Jun 2020 15:19:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jfmDW-0002NG-Sf
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 15:19:10 +0000
X-Inumbo-ID: 3daa2f6a-a41b-11ea-9dbe-bc764e2007e4
Received: from mail-ej1-x62d.google.com (unknown [2a00:1450:4864:20::62d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3daa2f6a-a41b-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 15:19:09 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id n24so9579632ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=I3z+TGgCjqU+RgML/yFoOLMrSRU4S4kmaHi0OCyG2cU=;
 b=VLh1DfNTwHBdXvPmzJ0CSDEDIam+ai2OrNBLUvwWzTZ/ctWa8LdzbFixMftzps+wLQ
 F9s0fuMMqo/C7m8Po2abhjaQbTPFPYiVT1sXwOBngUHR3o9eGXLshEu7bJLtPocZqqrB
 SRy7JCKDmvZGh9d0NgKQijk/dHqLYMCrp1u6gPuogYN6Skm2lp0su2wjSZnOghV0SCv3
 9MEJXsb3/YVCNNpG3dqIApctQjpKpXXEBZEiHV/gUTJ71r9s4zjQr8znd0VHTq07C9IB
 AJOOKxcxswcCeqVe/G9f7+yxpJO+XWfeTL8MCTeHGrglRc5BrVExlqM47HaXdTy2e+7u
 tl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=I3z+TGgCjqU+RgML/yFoOLMrSRU4S4kmaHi0OCyG2cU=;
 b=U+t/bqMacH+EhL8ZgvmiSilgYLpljJDlvs4dVLDx6Jv7w9dHhRxL+c062/BnZT3eIE
 kVRJaQnDWZardvhHQL1YBvq7Qu7TdyHPGv2laeBTnzrRg7Y5iQGU45CM8YZGj9Q/YIjT
 1B2U9ufDn4ih9YTcVbvCyb8wNvKTOIQP+mInpyHK7484ChhGwkDsJh+4c77jOaaeyp63
 MVs6klhi+Q+qDLbf7HGperrM0fgrFv+/0O8BrfizM4mLXVW2/olUf3u0klpmaGsh033B
 /s3huW4aRp8ykXMfIJ3GM2JOO8OdPtaQSCKpLwB6sok47k4MrpDsBVjlh+Fy+EK9yhR1
 JNQw==
X-Gm-Message-State: AOAM5334Hwq/3h9i+AAI8diJvMVTZgqCOCgewHOOVvrevWv4Ow1/P9J1
 o04fNE05WdA05fu491WE+z8=
X-Google-Smtp-Source: ABdhPJwC463SFXhYeSRAiZDGbIujQCLoXRCd7HXbntfWsAHNxXdaEd++Fcd5SG0syzZxOzwcUVIGTA==
X-Received: by 2002:a17:906:8d0:: with SMTP id
 o16mr20514557eje.196.1591024749047; 
 Mon, 01 Jun 2020 08:19:09 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id q12sm8994614ejn.23.2020.06.01.08.19.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 08:19:08 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200601134025.24142-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200601134025.24142-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading
 documentation
Date: Mon, 1 Jun 2020 16:19:07 +0100
Message-ID: <000e01d63827$fede4d70$fc9ae850$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGxKdezJRRpkuANC4vfHjenNW9S2akN+uKw
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Jan Beulich' <JBeulich@suse.com>, 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Sent: 01 June 2020 14:40
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien
> Grall <julien@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH for-4.14] docs/ucode: Extend runtime microcode loading documentation
> 
> Extend the disclaimer about runtime loading.  While we've done our best to
> make the mechaism reliable, the safety of late loading does ultimately depend
> on the contents of the blobs.
> 
> Extend the xen-ucode portion with examples of how to use it.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: George Dunlap <George.Dunlap@eu.citrix.com>
> CC: Ian Jackson <ian.jackson@citrix.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> CC: Julien Grall <julien@xen.org>
> CC: Paul Durrant <paul@xen.org>
> ---
>  docs/admin-guide/microcode-loading.rst | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/admin-guide/microcode-loading.rst b/docs/admin-guide/microcode-loading.rst
> index 5f0f661a2e..8cd5d0351b 100644
> --- a/docs/admin-guide/microcode-loading.rst
> +++ b/docs/admin-guide/microcode-loading.rst
> @@ -104,8 +104,8 @@ modules to find any CPIO archives, and search the archive for the applicable
>  file.  Xen will stop searching at the first match.
> 
> 
> -Run time microcode loading
> ---------------------------
> +Runtime microcode loading
> +-------------------------
> 
>  .. warning::
> 
> @@ -113,7 +113,23 @@ Run time microcode loading
>     or at boot time.  Not all microcode updates (or parts thereof) can be
>     applied at runtime.
> 
> -The ``xen-ucode`` utility can be used to initiate a runtime microcode load.
> +   Given the proprietry nature of microcode, we are unable to make any claim

s/proprietry/proprietary

with that fixed this is...

Release-acked-by: Paul Durrant <paul@xen.org>

> +   that a runtime microcode is risk-free.  Any runtime microcode loading needs
> +   adequate testing on a dev instance before being rolled out to production
> +   systems.
> +
> +The ``xen-ucode`` utility can be used to initiate a runtime microcode load::
> +
> +  [root@host ~]# xen-ucode
> +  xen-ucode: Xen microcode updating tool
> +  Usage: xen-ucode <microcode blob>
> +  [root@host ~]#
> +
> +e.g. With a Linux dom0 on a Haswell system::
> +
> +  [root@host ~]# xen-ucode /lib/firmware/intel-ucode/06-3c-03
> +  [root@host ~]#
> +
>  It will pass the blob to Xen, which will check to see whether the blob is
>  correct for the processor, and newer than the running microcode.
> 
> --
> 2.11.0



