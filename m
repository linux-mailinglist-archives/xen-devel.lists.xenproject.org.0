Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538136A0E37
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 17:50:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500587.772062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVEnJ-00044n-Pa; Thu, 23 Feb 2023 16:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500587.772062; Thu, 23 Feb 2023 16:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVEnJ-00041U-M9; Thu, 23 Feb 2023 16:50:09 +0000
Received: by outflank-mailman (input) for mailman id 500587;
 Thu, 23 Feb 2023 16:50:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOJK=6T=citrix.com=prvs=41104d4c8=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pVEnI-00041O-5q
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 16:50:08 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f49820f-b39a-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 17:50:06 +0100 (CET)
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
X-Inumbo-ID: 1f49820f-b39a-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677171006;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pHecuL3hPgExQAbk2vS1h8sYa6z8dmE4FyJ6FMmoKHo=;
  b=Pou819XGoxLvau0fxHkSWrtCZpWTxLRcqO2tijGyuURpBvOkERhv0QkU
   a2dAjsBDsWJrVXYpPnhANYqsMwDSZPzpYOBckRR/rCjx61YgxjP6FmBbe
   EKa/nUiROQCxlTq6buu/bLX1h45mMw9G16APp/OB4+/BzTimaeTHb8QsZ
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100681460
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:EfBTrq79S1uLZ94RqXU4IAxRtLnHchMFZxGqfqrLsTDasY5as4F+v
 moWW2uFa6mCYDegfIsnPo7i8xgAusTUx4UxTVFt+SE1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoR5weF/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m5
 OMWOG0zRC24m//v/o2Ga/NAwf8NFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9xx7A+
 DKfozqhav0cHNeZxBGj/iuwut7wrADqUq9KHoGk5OE/1TV/wURMUUZLBDNXu8KRiEO4QJRAK
 k8Q8ywioLIa8E2tR8P6GRqirxasrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQA2
 0WVhdrvCXpKuaeMVHOG3r6OqHW5Pi19BWoLfyRCRwwD5djooak6lBeJRdFmeIa8hd30H3f/3
 iiWpQA3nbBVhskOv42k+XjXjjTqoYLGJiY36R/QRXmN9R5iaciuYInAwVHD4OxJNoqxUliLt
 39CkM+bhN3iFrnUynbLGr9UWuj0ubDcama0bUNT84cJ5iuj6yOdV71r/CwnGnhUE9woPgTHW
 RqG0e9O36N7MHyvZK5xRou+DcU20KTtfejYuuDogslmOcYoKlLelM16TQvJhj22zhBw+U0qE
 c3DGftAG0r2HkiOINCeY+4GmYEmySklrY84bcCqlk/3uVZyiZP8dFvkDLdsRrplhE9niF+Pm
 zq6Cydt40Q3bQEGSnOLmbP/1HhTRZTBObj4qtZMasmIKRd8FWcqBpf5mO1+JNQ0x/UMzriXo
 hlRv3O0L3Kl2BX6xfiiMCg/ONsDo74ixZ7EAcDcFQnxgCVyCWpexKwea4E2bdEaGB9LlJZJo
 w0+U5zYWJxnE22XkwnxmLGh9OSOgjz331PRV8dkCRBjF6Ndq/vhpoW9I1KyqnhTVkJad6IW+
 tWd6+8SerJbLywKMSocQKjHI4+Z1ZTFpN9PYg==
IronPort-HdrOrdr: A9a23:8arn+6H5+oLCUyENpLqEOseALOsnbusQ8zAXPiFKOGRom6mj/P
 xG885rsyMc5AxhP03I5+ruBEDwewK5yXcd2+B4UYtKNzOWwVdAQrsSkbcL3VDbehEX54Nmu5
 uJkMJFeafN5SQRt7eG3OHxe+xL/DHMmJrEuQ9OpE0McenqAJsQjDuQY2ygYy9LrOkvP+tdKH
 KYi/A33AadRQ==
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="100681460"
Date: Thu, 23 Feb 2023 16:49:52 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>, Marc Bonnici
	<marc.bonnici@arm.com>, Achin Gupta <achin.gupta@arm.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v7 03/20] tools: add Arm FF-A mediator
Message-ID: <Y/eZMEOjWXwYJJND@perard.citrite.net>
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ede0da127fe74526e6b401e6b44d1407fe28cb70.1677079672.git.jens.wiklander@linaro.org>

On Wed, Feb 22, 2023 at 04:33:00PM +0100, Jens Wiklander wrote:
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 0cfad8508dbd..64fb570bc19a 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -494,7 +494,8 @@ libxl_gic_version = Enumeration("gic_version", [
>  
>  libxl_tee_type = Enumeration("tee_type", [
>      (0, "none"),
> -    (1, "optee")
> +    (1, "optee"),
> +    (2, "ffa")

Could you add a comma at the end of this line? This will avoid the need
to change two lines the next time we are adding a tee_type (like you
have to do now).

Also, as you are changing libxl's API, could you add a LIBXL_HAVE_*
macro in libxl.h? Something like:
    /*
     * arch_arm.tee field in libxl_domain_build_info has ffa value.
     */
    #define LIBXL_HAVE_BUILDINFO_ARCH_ARM_TEE_FFA 1

Thanks,

-- 
Anthony PERARD

