Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB569912A68
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 17:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745362.1152495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgLZ-0005vt-UF; Fri, 21 Jun 2024 15:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745362.1152495; Fri, 21 Jun 2024 15:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgLZ-0005tX-Pr; Fri, 21 Jun 2024 15:38:41 +0000
Received: by outflank-mailman (input) for mailman id 745362;
 Fri, 21 Jun 2024 15:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r4xA=NX=bounce.vates.tech=bounce-md_30504962.66759e7c.v1-d3f6f7b1faa24e30b72ac5e9274a2fa9@srs-se1.protection.inumbo.net>)
 id 1sKgLY-0005tR-Mk
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 15:38:40 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53ad00aa-2fe4-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 17:38:38 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W5M2h74pNz5QkLfk
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 15:38:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d3f6f7b1faa24e30b72ac5e9274a2fa9; Fri, 21 Jun 2024 15:38:36 +0000
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
X-Inumbo-ID: 53ad00aa-2fe4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718984317; x=1719244817;
	bh=hfad+2rNS0mrqDfEWBN4M8U5znJnUAVi7JfVgoUoF+I=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yUzDNOdtL7LHsHK9HBhzkzL6I+VotskM+QeWA7BjPLtPzCE90JfFgXDi8yvsXUONJ
	 Ds7p4/eyXr3yeJTsSUeuJLtEQEafOTnYT0qqlAyhM4YcsKoUQHtaJnFo+jArZu3AYc
	 zuKjiZorLb7hq9IcD7UJWIN0lp+xiqBylwPE1K8cAPgP6DADHD7nv6gyt4NP86+bOM
	 yV540uT14v0CWYW7KcDldtsEkYKu/ySkBfl1/UiCIULhooa8HBhW9+JbOGtNX1cEQr
	 oADDMXCXBSNxh1kuoLVWAkeFPZra9iY34SyAdOJe3htDT05k8J6xFTTE4P7cQpuHey
	 5vYM4qpiY1KKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718984317; x=1719244817; i=anthony.perard@vates.tech;
	bh=hfad+2rNS0mrqDfEWBN4M8U5znJnUAVi7JfVgoUoF+I=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=WzQhxveU/iYCGfzQ4WbIykGFnavUMQDgjbpVq9besL6n+AUldf9ki3JxtOlBqDtdU
	 VZYK8y2vfBDzOlVCWJ394TSzJSKs9jz4CGBSHxDtc5/YA1sN7uMuzSP35z8OM1Q7Y5
	 jA7moR46TQsKJ4atAyHZ95C8lmbkB6gPneOztk0zPybNxGMKZJc16CpxIzFYcVeAwL
	 TmnAgV3/pFWAT/1xWjj65NJRi00o/JXmvDMuJh7Y/OY7+St2fRQ9QiebOypOzTFYwx
	 0EI7GbRVqlwUskiI5IqRsfG0x0tvKqdutPnpGfKMpsGJsecZmHu18lFalIcV9FRvuz
	 BZOfu84+acN6g==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN=20PATCH]=20tools/misc:=20xen-hvmcrash:=20Inject=20#DF=20instead=20of=20overwriting=20RIP?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718984316003
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD <anthony@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-Id: <ZnWee2hUmG42n/W7@l14>
References: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
In-Reply-To: <27f4397093d92b53f89d625d682bd4b7145b65d8.1717426439.git.matthew.barnes@cloud.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d3f6f7b1faa24e30b72ac5e9274a2fa9?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240621:md
Date: Fri, 21 Jun 2024 15:38:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On Mon, Jun 03, 2024 at 03:59:18PM +0100, Matthew Barnes wrote:
> diff --git a/tools/misc/xen-hvmcrash.c b/tools/misc/xen-hvmcrash.c
> index 1d058fa40a47..8ef1beb388f8 100644
> --- a/tools/misc/xen-hvmcrash.c
> +++ b/tools/misc/xen-hvmcrash.c
> @@ -38,22 +38,21 @@
>  #include <sys/stat.h>
>  #include <arpa/inet.h>
>
> +#define XC_WANT_COMPAT_DEVICEMODEL_API
>  #include <xenctrl.h>
>  #include <xen/xen.h>
>  #include <xen/domctl.h>
>  #include <xen/hvm/save.h>

There's lots of headers that aren't used by the new codes and can be
removed. (They were probably way too many headers included when this
utility was introduced.)

> +    for (vcpu_id = 0; vcpu_id <= dominfo.max_vcpu_id; vcpu_id++) {
> +        printf("Injecting #DF to vcpu ID #%d...\n", vcpu_id);
> +        ret = xc_hvm_inject_trap(xch, domid, vcpu_id,
> +                                X86_ABORT_DF,

In the definition of xendevicemodel_inject_event(), the comment say to
look at "enum x86_event_type" for possible event "type", but there's no
"#DF" type, can we add this new one there before using it? (It's going
to be something like X86_EVENTTYPE_*)

> +                                XEN_DMOP_EVENT_hw_exc, 0,
> +                                NULL, NULL);

The new code doesn't build, "NULL" aren't integers.

> +        if (ret < 0) {
> +            fprintf(stderr, "Could not inject #DF to vcpu ID #%d\n", vcpu_id);
> +            perror("xc_hvm_inject_trap");

Are you meant to print two error lines when there's an error? You can
also use strerror() to convert an "errno" to a string.

Also, perror() might print an error from fprintf() if that last one
failed.

Are you meant to keep inject into other vcpus even if one have failed?
Should `xen-hvmcrash` return success when it failed to inject the double
fault to all vcpus?

Thanks,

-- 

Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

