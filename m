Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9551F9FEB0D
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:39:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863606.1274979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSNT3-0006UO-Te; Mon, 30 Dec 2024 21:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863606.1274979; Mon, 30 Dec 2024 21:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSNT3-0006SZ-R5; Mon, 30 Dec 2024 21:38:29 +0000
Received: by outflank-mailman (input) for mailman id 863606;
 Mon, 30 Dec 2024 21:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X1cU=TX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tSNT2-0006ST-Og
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:38:28 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 675c6320-c6f6-11ef-a0db-8be0dac302b0;
 Mon, 30 Dec 2024 22:38:27 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so68808765e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2024 13:38:27 -0800 (PST)
Received: from [192.168.86.29] ([83.105.36.37])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm331680555e9.2.2024.12.30.13.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2024 13:38:25 -0800 (PST)
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
X-Inumbo-ID: 675c6320-c6f6-11ef-a0db-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1735594706; x=1736199506; darn=lists.xenproject.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oJffYIi5qutgzhH576unqR1diKIC1dYjPN9dS+C85B0=;
        b=uv1l77iqI5KxvnHfiI1voiyLHEBGMti0vndAwbzkHhHXK1qBNo+eIAKn5Uy0gr2fOp
         mu8IuJhZZIheZy7tZtkXDtX+hY/D6uQ6AEYeQGU3y8Y1CjqYW7Y4dVtkwsIP22xZ2+nx
         8oYzkHLzdIVS0tmXRZXCQscuLOnw1R0k8WP2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735594706; x=1736199506;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJffYIi5qutgzhH576unqR1diKIC1dYjPN9dS+C85B0=;
        b=aS6PmKOAAn0lmHMUuFy+Vxlj2FwFQRHDPkqgNQ8eQ8zSMT6/01g6IJq/zfMoEljeOD
         T2U3SrB7Phi/elKh69qV/Mgm7EEBNWBs81A032kulf28NrvgzT8ZGLr5USnYBiiWD0Dd
         hOvoBD6n4xL1ZhVtuhZLrfX/D06EvLyB8HcKoFcwftr5RHx3INQ70xqCqh5uUGlY/UxD
         e8Na3ySYHt/66wbab1lmGdsh+Qeme498j3jB5+aBWFrDKJTAV6lpr+xgpRLf64ByKDos
         sM2CCfHqlA8zNaPzLk7qZUSmASyKTfKz5SgIFyzlWpeYLpQP6yzvmA4Wq1hI9P7GE6TM
         SyVg==
X-Forwarded-Encrypted: i=1; AJvYcCVQhITSlqt7BLgk2UMdvGvvqI8x69wFiCG9Ay1RolNwOnSV42ofcD9/UWK53iZgeWg3UwwTRMePkiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxQZp4h47WFwXN63CvqahsLX9EblktYFIuJab8Rga80mOexM814
	RINBf2KexMrKvOQNPLMYIByxYKlwO0WcM/GQyuIUpr/t6/y+67YWThogWoKwj3CN+DN0+eEc9RI
	LO1Y=
X-Gm-Gg: ASbGncstsB+nIbI7Fv8wL3MRMMpFwB1tSTg09YbDxJ8QOJmDEnRCyr0mR+4arUV1WGd
	jHqZyAJO512QLrdcplkWHgtvfzPjVsJ0Km7oEi1WE4Vl+Xu0WVK5eXiizuE6rjX0E8U2W5oHKoU
	XeGGdX6nRQh5S9rNCPHqEtZcpuaexqfAHmuh7gkKYNyrDKYt9OCzNYOEAJNt60DkDj5BHT43DGL
	+4f+1sWbC3eneQuEK7xl39o6SDmj1XLptYP0S5zkW+zrVJBKMZqBqtDwA8kaaiuY/M=
X-Google-Smtp-Source: AGHT+IEgZxHeICBm18wV8vgOeXFzikWq81a+bwNUZ6puMkZMQtTRhxxw4GISrYLG1JPwiUBld8k+Bg==
X-Received: by 2002:a05:600c:1d03:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-43668642e70mr294021145e9.8.1735594706491;
        Mon, 30 Dec 2024 13:38:26 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------wxhaatOR6HOj2e14hEB07Hvz"
Message-ID: <25f9fabf-1239-4465-92c9-484fc24fc4f7@citrix.com>
Date: Mon, 30 Dec 2024 21:38:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/5] docs: set DATE to SOURCE_DATE_EPOCH if available
To: Maximilian Engelhardt <maxi@daemonizer.de>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
References: <cover.1735585600.git.maxi@daemonizer.de>
 <1ad1283052a580cbe7dbd7581b64f3cfd87cbf88.1735585600.git.maxi@daemonizer.de>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1ad1283052a580cbe7dbd7581b64f3cfd87cbf88.1735585600.git.maxi@daemonizer.de>

This is a multi-part message in MIME format.
--------------wxhaatOR6HOj2e14hEB07Hvz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/12/2024 9:00 pm, Maximilian Engelhardt wrote:
> Use the solution described in [1] to replace the call to the 'date'
> command with a version that uses SOURCE_DATE_EPOCH if available. This
> is needed for reproducible builds.
>
> The -d "@..." syntax was introduced in GNU date about 2005 (but only
> added to the docuemntation in 2011), so I assume a version supporting
> this syntax is available, if SOURCE_DATE_EPOCH is defined. If
> SOURCE_DATE_EPOCH is not defined, nothing changes with respect to the
> current behavior.
>
> [1] https://reproducible-builds.org/docs/source-date-epoch/
>
> Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
> ---
>  docs/Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/docs/Makefile b/docs/Makefile
> index b30cc619f8..beba02a94f 100644
> --- a/docs/Makefile
> +++ b/docs/Makefile
> @@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
>  -include $(XEN_ROOT)/config/Docs.mk
>  
>  VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
> -DATE		:= $(shell date +%Y-%m-%d)
> +
> +DATE_FMT	:= +%Y-%m-%d
> +ifdef SOURCE_DATE_EPOCH
> +DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u "$(DATE_FMT)")
> +else
> +DATE		:= $(shell date "$(DATE_FMT)")
> +endif
>  
>  DOC_ARCHES      := arm x86_32 x86_64
>  MAN_SECTIONS    := 1 5 7 8

While this looks fine for docs, there's another (identical) use of date
in tools/firmware/hvmloader/Makefile, as well as some differing uses to
construct XEN_BUILD_{DATE,TIME}.  INSTALL talks about VGABIOS_REL_DATE too.

Does something like this work for you?  It seems to DTRT for SMBIOS.  It
needs adapting a bit more for vgabios and Xen, but I think having one
common $(date) is going to be better than ad-hoc ones over the tree.

~Andrew
--------------wxhaatOR6HOj2e14hEB07Hvz
Content-Type: text/x-patch; charset=UTF-8; name="SOURCE_DATE_EPOCH.patch"
Content-Disposition: attachment; filename="SOURCE_DATE_EPOCH.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0NvbmZpZy5tayBiL0NvbmZpZy5tawppbmRleCBmYTA0MTQwNTViOTMu
LjA5MzFlNzAyYjAyNSAxMDA2NDQKLS0tIGEvQ29uZmlnLm1rCisrKyBiL0NvbmZpZy5tawpA
QCAtMTQxLDYgKzE0MSwxNCBAQCBleHBvcnQgWEVOX0hBU19CVUlMRF9JRD15CiBidWlsZF9p
ZF9saW5rZXIgOj0gLS1idWlsZC1pZD1zaGExCiBlbmRpZgogCisjIFdyYXAgZGF0ZSgxKSB0
byB1c2UgU09VUkNFX0RBVEVfRVBPQ0ggaWYgc2V0IHRoZSBlbnZpcm9ubWVudC4KKyMgU2Vl
IGh0dHBzOi8vcmVwcm9kdWNpYmxlLWJ1aWxkcy5vcmcvZG9jcy9zb3VyY2UtZGF0ZS1lcG9j
aC8KK2lmZGVmIFNPVVJDRV9EQVRFX0VQT0NICitkYXRlID0gJChzaGVsbCBkYXRlIC11IC1k
ICJAJChTT1VSQ0VfREFURV9FUE9DSCkiICIkKDEpIiAyPi9kZXYvbnVsbCB8fCBkYXRlIC11
IC1yICIkKFNPVVJDRV9EQVRFX0VQT0NIKSIgIiQoMSkiIDI+L2Rldi9udWxsIHx8IGRhdGUg
LXUgIiQoMSkiKQorZWxzZQorZGF0ZSA9ICQoc2hlbGwgZGF0ZSAiJCgxKSIpCitlbmRpZgor
CiBkZWZpbmUgYnVpbGRtYWtldmFyczJzaGVsbHZhcnMKICAgICBleHBvcnQgUFJFRklYPSIk
KHByZWZpeCkiOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogICAgIGV4cG9ydCBYRU5fU0NSSVBUX0RJUj0iJChYRU5fU0NSSVBUX0RJUikiOyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCmRpZmYgLS1naXQgYS9kb2NzL01ha2VmaWxlIGIv
ZG9jcy9NYWtlZmlsZQppbmRleCBiMzBjYzYxOWY4ZGQuLjk1ZGM4M2ZmOWM1OSAxMDA2NDQK
LS0tIGEvZG9jcy9NYWtlZmlsZQorKysgYi9kb2NzL01ha2VmaWxlCkBAIC0zLDcgKzMsNyBA
QCBpbmNsdWRlICQoWEVOX1JPT1QpL0NvbmZpZy5tawogLWluY2x1ZGUgJChYRU5fUk9PVCkv
Y29uZmlnL0RvY3MubWsKIAogVkVSU0lPTgkJOj0gJChzaGVsbCAkKE1BS0UpIC1DICQoWEVO
X1JPT1QpL3hlbiAtLW5vLXByaW50LWRpcmVjdG9yeSB4ZW52ZXJzaW9uKQotREFURQkJOj0g
JChzaGVsbCBkYXRlICslWS0lbS0lZCkKK0RBVEUJCTo9ICQoY2FsbCBkYXRlLCslWS0lbS0l
ZCkKIAogRE9DX0FSQ0hFUyAgICAgIDo9IGFybSB4ODZfMzIgeDg2XzY0CiBNQU5fU0VDVElP
TlMgICAgOj0gMSA1IDcgOApkaWZmIC0tZ2l0IGEvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVy
L01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2VmaWxlCmluZGV4IGM3
YmM0MDA2NTc4YS4uMWU3N2IwMTRmNjE0IDEwMDY0NAotLS0gYS90b29scy9maXJtd2FyZS9o
dm1sb2FkZXIvTWFrZWZpbGUKKysrIGIvdG9vbHMvZmlybXdhcmUvaHZtbG9hZGVyL01ha2Vm
aWxlCkBAIC0yMyw3ICsyMyw3IEBAIGluY2x1ZGUgJChYRU5fUk9PVCkvdG9vbHMvZmlybXdh
cmUvUnVsZXMubWsKIGxkLW9wdGlvbiA9ICQoc2hlbGwgaWYgJChMRCkgLXYgJCgxKSA+L2Rl
di9udWxsIDI+JjE7IHRoZW4gZWNobyB5OyBlbHNlIGVjaG8gbjsgZmkpCiAKICMgU01CSU9T
IHNwZWMgcmVxdWlyZXMgZm9ybWF0IG1tL2RkL3l5eXkKLVNNQklPU19SRUxfREFURSA/PSAk
KHNoZWxsIGRhdGUgKyVtLyVkLyVZKQorU01CSU9TX1JFTF9EQVRFID89ICQoY2FsbCBkYXRl
LCslbS8lZC8lWSkKIAogQ0ZMQUdTICs9ICQoQ0ZMQUdTX3hlbmluY2x1ZGUpIC1mbm8tcGlj
IC1tcmVncGFybT0zCiAK

--------------wxhaatOR6HOj2e14hEB07Hvz--

