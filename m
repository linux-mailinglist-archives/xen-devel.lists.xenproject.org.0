Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F7A20B3D4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 16:44:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jopZc-0001ix-4B; Fri, 26 Jun 2020 14:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPqg=AH=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jopZZ-0001is-QU
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 14:43:21 +0000
X-Inumbo-ID: 612767b0-b7bb-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 612767b0-b7bb-11ea-b7bb-bc764e2007e4;
 Fri, 26 Jun 2020 14:43:21 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id j18so9061238wmi.3
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jun 2020 07:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=VNi0skosebjyIppHSOJfiiPcBm9z+1fKzOIjWKvVeCg=;
 b=KKyNBdmHEJFLFmbbuZn4Vu+9kIlbH3Hl+817ej4KULED+Zi23g14jiWqXdPUeaZeai
 IqTnrt6KTTsnU+tGKK4qWfBpdW3FLsV+YGN3qndku+/21ZyjlZKg51PCBOLpiOtIrVrx
 G/zYLLcRWcJCixJ2WS6w1I1mUGW6HslrOOCWt7/ZRGtA4u/DxMpi4GgKgPFgtnHUZNxb
 OQ3hQfKmWTFOujd4+/4AJfenheQdFJJ6E5PPCLV2Edw0jnPsan0ACNEawBcLaCPbWg56
 7r4tnopgwKRl2STatGWxfke6a5mKpnBNjZGKddEh2FrTP/uTUO/PVkIygMBX1AVYP/iJ
 vNnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=VNi0skosebjyIppHSOJfiiPcBm9z+1fKzOIjWKvVeCg=;
 b=lvIH+1Fyi27GG6tJLed7PXSgSF28Ob/FRaPtG7hfK9YWgsvxTTWE7T6qP9UWEHogvv
 wBEKjTL3e79lQmYvWjX7g4bEooeiRd0qie8gT0BdVnsuJGPAjX1wBq84k0kpJkJbXVIA
 srNbahJ2hXV4wvKw61afKBkQhfBgPOF9JQ7K7Xu82pggFgBu6UMsUPvmMpOKB/0e3/6T
 atPVaJApqOqF8T7+Lqe/gGZhzimhGkCH29pYR2og3O/N9PvFn0+MxEyErPN+IMxoAI3L
 nk56tJnqpWiuAQRM3kNQEkeSISlHfkRPRTsKmDmYKFIlnhDpZop9Jr8xkKYdRnqVdtJI
 vSFQ==
X-Gm-Message-State: AOAM533oaxdtEbRfyXlKkzhHQ8oqRwasM1jIlcgdVgYNwltDqVrGZN76
 QPhNKEkFPypvVck1eQswOJ0=
X-Google-Smtp-Source: ABdhPJwn7zjvIyCnqcHy4w0AYUEL2f700A25RbqyMaY3AeDQSnM2cj9JyE/W7Zk2tKRLqNYI7PlhqA==
X-Received: by 2002:a1c:b686:: with SMTP id g128mr3984668wmf.145.1593182600025; 
 Fri, 26 Jun 2020 07:43:20 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id 1sm17376911wmf.0.2020.06.26.07.43.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 07:43:19 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200626143738.1525-1-andrew.cooper3@citrix.com>
In-Reply-To: <20200626143738.1525-1-andrew.cooper3@citrix.com>
Subject: RE: [PATCH for-4.14] changelog: Add notes about CET and Migration
 changes
Date: Fri, 26 Jun 2020 15:43:18 +0100
Message-ID: <000e01d64bc8$225470f0$66fd52d0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKMC0NhwedNQpKXt7bFC8BNw1etxKd/eY8Q
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
> Sent: 26 June 2020 15:38
> To: Xen-devel <xen-devel@lists.xenproject.org>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap <George.Dunlap@eu.citrix.com>; Ian
> Jackson <ian.jackson@citrix.com>; Jan Beulich <JBeulich@suse.com>; Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Julien
> Grall <julien@xen.org>; Paul Durrant <paul@xen.org>
> Subject: [PATCH for-4.14] changelog: Add notes about CET and Migration changes
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Paul Durrant <paul@xen.org>
Release-acked-by: Paul Durrant <paul@xen.org>

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
>  CHANGELOG.md | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 43fd260156..5c3d3c791d 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -21,6 +21,15 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>   - New 'domid_policy', allowing domain-ids to be randomly chosen.
>   - Option to preserve domain-id across migrate or save+restore.
>   - Support in kdd for initial KD protocol handshake for Win 7, 8 and 10 (64 bit).
> + - Tech preview support for Control-flow Execution Technology, with Xen using
> +   Supervisor Shadow Stacks for its own protection.
> +
> +### Changed
> + - The CPUID data seen by a guest on boot is now moved in the migration
> +   stream.  A guest migrating between non-identical hardware will now no
> +   longer observe details such as Family/Model/Stepping, Cache, etc changing.
> +   An administrator still needs to take care to ensure the features visible to
> +   the guest at boot are compatible with anywhere it might migrate.
> 
>  ## [4.13.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.13.0) - 2019-12-17
> 
> --
> 2.11.0



