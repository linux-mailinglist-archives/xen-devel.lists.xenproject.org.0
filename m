Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 978317F6418
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:39:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639927.997572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CjL-0004gy-4V; Thu, 23 Nov 2023 16:39:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639927.997572; Thu, 23 Nov 2023 16:39:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CjL-0004e4-1N; Thu, 23 Nov 2023 16:39:07 +0000
Received: by outflank-mailman (input) for mailman id 639927;
 Thu, 23 Nov 2023 16:39:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVVO=HE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r6CjJ-0004dy-Lx
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:39:05 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d045a2e0-8a1e-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 17:39:04 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40b2c8e91afso7184085e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:39:04 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n44-20020a05600c502c00b004083a105f27sm3248624wmr.26.2023.11.23.08.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Nov 2023 08:39:03 -0800 (PST)
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
X-Inumbo-ID: d045a2e0-8a1e-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tibco.com; s=googleworkspace; t=1700757544; x=1701362344; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ckM42asHBmu0kl2OnTUmIDbkFvcg5lrIZYng+KIepo=;
        b=kvYSdKiBxldASqr815aOmek3ZY830oeKRAclJIIHQ/iJiPtFRKUqRyX9W1eFZCU+cK
         yIW8pILTuQBVbgQAwp59doal63eKNQsJT0BOOYjsEOjsvKNsopne7sDur6yy2XuDV9of
         RFk0xO6ktAhDNfoAib/rU8BPN2UdVijxhE2K3QMPpzToryb5zlfocgTdET5Gq8YkVRiP
         vSktA+camgzuCIAoBuEs1Tz2wCpT8lu2UARcYViFsd37r1PpJ8VgAp2jwqOY4lBfiecg
         gnzG2SDUn8itNvRoJpBS5R/7VqFJB1MP3jbLMbE3MIXfSMkpKA9Ph7bwKHG6R1CsvM1j
         sNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700757544; x=1701362344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ckM42asHBmu0kl2OnTUmIDbkFvcg5lrIZYng+KIepo=;
        b=CKfoE7ncgD/2DzHhngVwWFtO7vbCfhRmhywb7+/dfEj5nb9I/qQhG7+wK8qULQUHpK
         eYuh+aCyztggGGPs/odkEEyhfFXuREwsFfpg/zBmcRcYp96gUxfVyN3UUUa9kGhKbCTM
         VmwVAnPKo/XykQrBHMmOZhTgy8RfMnYeFsdo8KYOBVtvN/hywuiVfTzNUY0VRApgOBCh
         1MdLBH2yefvG7K3uz2xcXoB0I+DEzbmEnGVyhFU4EVytvVbEAxu6ykDA9DbxX+g/5UIN
         R3vkoEzOgj8eyA9b68IuQz4LtvPQSGOr+rH49Y+W+4yKw2fbaNQiIBgiuP8431kOt1W1
         B6fQ==
X-Gm-Message-State: AOJu0YzfiLpHSPBOZF4mneAoQP3znTF1OLXoCKt2Lh9H7wX/0lWfcqJg
	WjexprwLe3IDpcSRMV7uR4Fngw==
X-Google-Smtp-Source: AGHT+IGPc+QF/JKNc3OlOcbOPAdsXD0z9yBC0PoH/yMbXrLVawmJ0In+3JoEh/PRGonk3cR4HXYDWg==
X-Received: by 2002:a05:600c:4fc5:b0:402:ea96:c09a with SMTP id o5-20020a05600c4fc500b00402ea96c09amr112423wmq.16.1700757543790;
        Thu, 23 Nov 2023 08:39:03 -0800 (PST)
Message-ID: <aaa662ef-41f3-4e76-9d9f-54b3ff555cd5@tibco.com>
Date: Thu, 23 Nov 2023 16:39:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tools/pygrub: Hook libfsimage's fdopen() to pygrub
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
 <20231106150508.22665-7-alejandro.vallejo@cloud.com>
From: Andrew Cooper <andcooper@tibco.com>
In-Reply-To: <20231106150508.22665-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2023 3:05 pm, Alejandro Vallejo wrote:
> This patch increases the security posture by removing the need to grant
> filesystem access to the depriv pygrub. Using libfsimage's fdopen(), the
> parent thread in the depriv procedure can simply ensure all the appropriate
> file descriptors are present before revoking permissions to the filesystem.
>
> A convenient usability side-effect is that it's no longer required for the
> restricted user to have access to the disk, because the depriv thread
> already has the file descriptor open by its parent.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  docs/man/xl.cfg.5.pod.in         |  6 +-
>  tools/pygrub/src/ExtLinuxConf.py | 20 ++++---
>  tools/pygrub/src/GrubConf.py     | 29 ++++++----
>  tools/pygrub/src/LiloConf.py     | 20 ++++---
>  tools/pygrub/src/pygrub          | 95 ++++++++------------------------
>  5 files changed, 68 insertions(+), 102 deletions(-)
>
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 2e234b450e..e3fd2e37eb 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1704,8 +1704,7 @@ See docs/features/qemu-deprivilege.pandoc for more information
>  on how to setup the unprivileged users.
>  
>  Note that running the bootloader in restricted mode also implies using
> -non-interactive mode, and the disk image must be readable by the
> -restricted user.
> +non-interactive mode.
>  
>  =item B<bootloader_user=USERNAME>
>  
> @@ -2768,8 +2767,7 @@ See docs/features/qemu-deprivilege.pandoc for more information
>  on how to setup the unprivileged users.
>  
>  Note that running the bootloader in restricted mode also implies using
> -non-interactive mode, and the disk image must be readable by the
> -restricted user.
> +non-interactive mode.
>  
>  =item B<bootloader_user=USERNAME>
>  

I'm leaning towards suggesting that this wants a note in the changelog,
as we're removing a limitation imposed by a security fix.


> diff --git a/tools/pygrub/src/ExtLinuxConf.py b/tools/pygrub/src/ExtLinuxConf.py
> index 4e990a9304..f2e9a81013 100644
> --- a/tools/pygrub/src/ExtLinuxConf.py
> +++ b/tools/pygrub/src/ExtLinuxConf.py
> @@ -123,6 +123,7 @@ class ExtLinuxImage(object):
>  class ExtLinuxConfigFile(object):
>      def __init__(self, fn = None):
>          self.filename = fn
> +        self.file = None
>          self.images = []
>          self.timeout = -1
>          self._default = 0
> @@ -138,16 +139,21 @@ class ExtLinuxConfigFile(object):
>  
>      def parse(self, buf = None):
>          if buf is None:
> -            if self.filename is None:
> +            if not self.filename and not self.file:
>                  raise ValueError("No config file defined to parse!")
>  
> -            f = open(self.filename, 'r')
> -            lines = f.readlines()
> -            f.close()
> -        else:
> -            lines = buf.split("\n")
> +            if self.file:
> +                buf = file.read()
> +                path = self.file.name
> +            else:
> +                f = open(self.filename, 'r')
> +                buf = f.read()
> +                f.close()
> +        lines = buf.split("\n")
> +
> +        if not path:
> +            path = os.path.dirname(self.filename)
>  
> -        path = os.path.dirname(self.filename)
>          img = []
>          for l in lines:
>              l = l.strip()

[List context, Alejandro and I discussed this IRL]

This pattern is horrible and repeated in each object.  I'm going to
experiment and see if there's a (limited) bit of cleanup which can be
done to reduce the invasiveness, and therefore the legibility of this patch.

~Andrew

