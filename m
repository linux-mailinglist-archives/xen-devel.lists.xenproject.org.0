Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 788619AE1A4
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 11:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825081.1239279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uaf-0003Xm-HS; Thu, 24 Oct 2024 09:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825081.1239279; Thu, 24 Oct 2024 09:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uaf-0003Vy-EV; Thu, 24 Oct 2024 09:57:13 +0000
Received: by outflank-mailman (input) for mailman id 825081;
 Thu, 24 Oct 2024 09:57:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UfPV=RU=bounce.vates.tech=bounce-md_30504962.671a19f5.v1-db67610ea81e43c4bb8a19255a9af5bc@srs-se1.protection.inumbo.net>)
 id 1t3uae-0003Vl-5C
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 09:57:12 +0000
Received: from mail186-28.suw21.mandrillapp.com
 (mail186-28.suw21.mandrillapp.com [198.2.186.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55c3f445-91ee-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 11:57:10 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-28.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4XZ1Y12JLCzMQxZ9F
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 09:57:09 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 db67610ea81e43c4bb8a19255a9af5bc; Thu, 24 Oct 2024 09:57:09 +0000
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
X-Inumbo-ID: 55c3f445-91ee-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1729763829; x=1730024329;
	bh=BANLhm+gEpY1Ue77VOp2HhdcA4V8mb1aY9+sHxDCH2Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=eq1hT/xlZ0ER/mKIHj1dwejXWreh0Mo46pFzzCQsJoZMjXLIMoj+ASX/Kn2qmOWJP
	 XrsFFEQNdl4CHgCdptmYCHP0/zVsH5U7QbnkUsKUqLaPMWB18a4AY8CUEuTd8L85Up
	 70bZikAZfaccg44iGFEevckzu0nMY1NCvJfvAaqkhrbjRPwxXxxuAvdQFDtrwXeO22
	 Se9qJAj+yhjfp0AfFKwDHoH4c8D3WSmb+zSrZRrCpaviME48cumUy/+eDIysp0asp4
	 7KDBPHMluAW1rONL0UE5DKGK707MQgM0I9R3LwwAhYbWElMigMu7LUvzUqGJwAT4fU
	 uBBdwI2dj4buQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1729763829; x=1730024329; i=anthony.perard@vates.tech;
	bh=BANLhm+gEpY1Ue77VOp2HhdcA4V8mb1aY9+sHxDCH2Y=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ld8EHKEREzpk4obad4FC6rTEN0zpXkLSw7bL1JSMbCRCvoc7fCErsMPjXtEJempJx
	 H+mmal/8m6fD0k0Tpm5JJDBt8oUfQtgvy5+7zyXuw4tGWUSI8pN8fe+nf5JATrXeYb
	 l43lTp7tZ2cBiiF3nmeOwHo4sv8jesVt6xbTMNxRCjKboi9vKxb75AoBW/CDNpd7Bt
	 kHPdKFdUebJuvcqDzU9F55pFI0RmoNorJjMHAQNCKvfCexmfAhpDJMPK0VFfAjM0jj
	 aE6TTeZMid+H7SJaxxaoRnSFPit4oaHwBnl8I+j5R0Snr8XGnscJuzIvGN/t9SFxMQ
	 kPbzbYnHa7Yaw==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20tools/pvhsim:=20Inherit=20the=20tools=20debug=3D=20setting?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1729763828146
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, "Jan Beulich" <JBeulich@suse.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <ZxoZ86BWqenxR5q0@l14>
References: <20241022162500.121276-1-andrew.cooper3@citrix.com>
In-Reply-To: <20241022162500.121276-1-andrew.cooper3@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.db67610ea81e43c4bb8a19255a9af5bc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241024:md
Date: Thu, 24 Oct 2024 09:57:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Tue, Oct 22, 2024 at 05:25:00PM +0100, Andrew Cooper wrote:
> diff --git a/tools/firmware/xen-dir/Makefile b/tools/firmware/xen-dir/Makefile
> index 6f5e208ab413..e19916f76722 100644
> --- a/tools/firmware/xen-dir/Makefile
> +++ b/tools/firmware/xen-dir/Makefile
> @@ -1,4 +1,5 @@
>  XEN_ROOT = $(CURDIR)/../../..
> +include $(XEN_ROOT)/tools/Rules.mk
>  
>  all: xen-shim
>  
> @@ -75,6 +76,8 @@ $(D): linkfarm.stamp
>  
>  $(D)/xen/.config: $(D)
>  	$(MAKE) -C $(@D) KBUILD_DEFCONFIG=pvshim_defconfig defconfig
> +	echo "CONFIG_DEBUG=$(if $(debug),y,n)" >> $@

I don't think this does what you think it does ;-).

In the GitLab CI, we have both "export debug=y" and "export debug=n", in
both case that $(if ) will return 'y' because $(debug) is non-empty.

For one-liner to do this, there's a few option in Make and shell:
    $(if $(filter y,$(debug)),y,n)
    $$([ "$(debug)" = y ] && echo y || echo n)
    $$(case "$(debug)" in y) echo y;; *) echo n;; esac)

For the $(filter ) option, if one does `debug='y no' make` the $(if )
will expand to 'y', but it's probably good enough.

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

