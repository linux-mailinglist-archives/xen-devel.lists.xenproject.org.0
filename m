Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ED621D16F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jul 2020 10:13:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jutan-0003GC-84; Mon, 13 Jul 2020 08:13:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bAa1=AY=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jutam-0003G6-DA
 for xen-devel@lists.xenproject.org; Mon, 13 Jul 2020 08:13:40 +0000
X-Inumbo-ID: c1e70452-c4e0-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1e70452-c4e0-11ea-b7bb-bc764e2007e4;
 Mon, 13 Jul 2020 08:13:39 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l2so12251097wmf.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Jul 2020 01:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Ar0ph7hv3Yh6PwDGEGAD9y+GhfIA3gUk01Sca/V8LyQ=;
 b=mlRwTfR7RDvOrnBEJ5S7rP6ObfAIVmA8W4J7oOeVAA3vbOUl0bXanzaBLwDrzG5/Lr
 FIgQ3OQrLC0iZU8GXD4w/RKJXxbC+gYWcwM5KwQyO1+vFw6Rru5xEBj86OZRjHqzbUo5
 1Ad4wVTIZePwkOjCrurIQ4WKOAh6jYFlJibOHJ9i/qb2ApOrDXtAz/BmHjzq54qwUq0g
 3rO0gS5QGVXHkW8jfeiB9oxQ1pBi2zHM1s7HjiRI78rsJtsDkQzNc087h5Tf5TFCXeDw
 bQw4dJy1o5PdoGOFcPuHInv8uQb5drjvixokUo6iRxLFFxsqnhhW/piVpGOwrBS6ZmD7
 Yi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Ar0ph7hv3Yh6PwDGEGAD9y+GhfIA3gUk01Sca/V8LyQ=;
 b=L2g80KofQ/IEdCEGKtn4eUgQOEix0h4NXbOSSUrKlOkm9PwUPmhbPtHT7iDrME8jP9
 TjJH07L7l5v2DjIC1zgEnGoEjX+M+KPo4pKoadV2azTHyzxeykolGmemOfUG/PvwuveX
 YTmyJOWH7RD2setvkT5lCZuHzVGumLMApLhXeGlOLqIAbOdGAkLWdwJhppwbvfwu+Cd4
 NXTtiaE/HL5i6zgPcm1RZos1GtG239WwgQ8zWJfqtzQ8u7AHJn0JUIhVeS+BtOklaMYy
 AFksS4XTV28hFtNxQWIZiYegproCKtCwUl25ZHxjBb8E67kyFoBQNS3w6EzKPjha04Vt
 4W3Q==
X-Gm-Message-State: AOAM531RKfRpuaPe8CjMsZep2ncuMbJpqW+Cg4gh8RpnHwrX7580lLht
 nbEaEVM9R6z/gPoEjYdV+Ns=
X-Google-Smtp-Source: ABdhPJyVyUJJTvpZOfshsPBjra2CRmozn1fcF3R3+0T6/6b8nEDE+IPag8OJMWDCyFMfEdLmjAA+VA==
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr17476565wmg.116.1594628019011; 
 Mon, 13 Jul 2020 01:13:39 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id j6sm23374885wro.25.2020.07.13.01.13.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Jul 2020 01:13:38 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200713051639.26948-1-jgross@suse.com>
In-Reply-To: <20200713051639.26948-1-jgross@suse.com>
Subject: RE: [PATCH] docs: specify stability of hypfs path documentation
Date: Mon, 13 Jul 2020 09:13:37 +0100
Message-ID: <003b01d658ed$831ae680$8950b380$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIFNc7lIAokfYuPpo0uaUrzq7VTS6inbwKA
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
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 13 July 2020 06:17
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>
> Subject: [PATCH] docs: specify stability of hypfs path documentation
> 
> In docs/misc/hypfs-paths.pandoc the supported paths in the hypervisor
> file system are specified. Make it more clear that path availability
> might change, e.g. due to scope widening or narrowing (e.g. being
> limited to a specific architecture).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> This might be a candidate for 4.14, as hypfs is new in 4.14 and the
> documentation should be as clear as possible.

Agreed. Since this a pure documentation change it carries no risk, so once the final wording is agreed then consider it...

Release-acked-by: Paul Durrant <paul@xen.org>

> ---
>  docs/misc/hypfs-paths.pandoc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misc/hypfs-paths.pandoc b/docs/misc/hypfs-paths.pandoc
> index a111c6f25c..7ad4b7ba95 100644
> --- a/docs/misc/hypfs-paths.pandoc
> +++ b/docs/misc/hypfs-paths.pandoc
> @@ -5,6 +5,9 @@ in the Xen hypervisor file system (hypfs).
> 
>  The hypervisor file system can be accessed via the xenhypfs tool.
> 
> +The availability of the hypervisor file system depends on the hypervisor
> +config option CONFIG_HYPFS, which is on per default.
> +
>  ## Notation
> 
>  The hypervisor file system is similar to the Linux kernel's sysfs.
> @@ -55,6 +58,11 @@ tags enclosed in square brackets.
>  * CONFIG_* -- Path is valid only in case the hypervisor was built with
>    the respective config option.
> 
> +Path availability is subject to change, e.g. a specific path specified
> +for a single architecture now might be made available for other architectures
> +in future, or it could be made conditional by an additional config option
> +of the hypervisor.
> +
>  So an entry could look like this:
> 
>      /cpu-bugs/active-pv/xpti = ("No"|{"dom0", "domU", "PCID-on"}) [w,X86,PV]
> --
> 2.26.2



