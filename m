Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A57A658AA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:45:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917523.1322418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDaj-0008JT-Pz; Mon, 17 Mar 2025 16:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917523.1322418; Mon, 17 Mar 2025 16:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuDaj-0008Hm-NP; Mon, 17 Mar 2025 16:45:29 +0000
Received: by outflank-mailman (input) for mailman id 917523;
 Mon, 17 Mar 2025 16:45:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=34V3=WE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tuDah-0008Hg-Rh
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:45:27 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a836279-034f-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 17:45:26 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-ac27cb35309so769831466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:45:26 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac314858a8fsm681408666b.80.2025.03.17.09.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:45:25 -0700 (PDT)
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
X-Inumbo-ID: 3a836279-034f-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742229926; x=1742834726; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLtdOXGUKb+gzM89xEuLuV0E9VyAPUANd/cKWsBd9IQ=;
        b=dc3EUvawq2Z7S7SdWPeB/JKtqx1xhL9SdSXJaojznwFNCRcUf+QwKy0qnVn/t/3RSn
         FEFYbbVwelpFluD9uKKxFDtur98OcXvEEbVnyMKm7OO+wa0MnBQLikKxkN0mIs/lBHh4
         uWKIjUlHALdRLcz6UwQTFa5Q9IZx2QevFMrI6y9lloeiAwAXgbUr0U6hg7wGmejdBrDC
         qEt8XQPaYafYVUfML7GRbRK8UwxqxNkqkbL/pIBdj2FCqBcZaEOo27hu80vHp757lLJU
         h587o8pWNbL3KOsawnPuV2xfPQqa54h3h33eYFHwg3beTF3uYW57XQc0tRZa5yvBTkQV
         lOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742229926; x=1742834726;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLtdOXGUKb+gzM89xEuLuV0E9VyAPUANd/cKWsBd9IQ=;
        b=AQ9s8QVTMsSVlNekvQZfLU5LYh9AxCDIFZOo6Jp+FR2eyMyHIiw2WcjrfSt6mBWb3E
         tRDaSlDD47BYhgSGGQkQNE8M0hcHPNVzaTGSYpJbKRKZN6uM/aNRmVW0OBeyhj0Lf2K4
         cS6DAEmmxTTFZR/ShzNuuhr/nEGZPiYoys62Os/tk8YxIRDrq5lUgTun+HGJOnflQN+Q
         8eztsJUAyrxOpM8PXOTkduzWmJo/cIG3wbZHA2jHZTplRSHK5kBEKYxDpEe6Za+s2mO2
         NMLDlm8QJmMjiXFZBicgD25jydM39pdSlwkB2sYlNRxnVi7YqG9oDosjMX/NmkMn3sgh
         DVkg==
X-Forwarded-Encrypted: i=1; AJvYcCXr2dEvmOWzyK4JjsnnoD+niM3O+YizzlMGq26r+QWVNpD6wLnqpSYGMIQmSsyI1cUMnqkd6RBTlx8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxVHC6YNqFFQgfhA6F7A2sqV+Y1jzSdY/gWflnaVD79A4XjDf0y
	e2tZKNHEvqiuEaTaYSDgiEXUXwIbKT4EwFEMpK5nyMFNJD1l5J2r
X-Gm-Gg: ASbGncs3ZDkZFMIBtBuNcqS1KPlmbiaWuPEFoTMwiVjM2EQHT0hPKf1EXcAgrL3GKdz
	+QYrbe6OD77uR3P1JKLBA1ES1YMnTpC1XxMTOlj1tZHOLfAfQJ1jj9aYdT1sef2GaUwNzJkIdg6
	qt1KasWbch9kzhnoOjI3FS5BI2KvSHBdgU8X616bjyi2XvpZ/cNhd2a2piaNY/tWcyuRTUh3LbD
	eaFFNxomEGXKMLzWumjkzUnz0byyIZpaQTfciYfZ6V89GnkLOKxdn6ZgG/b1yuYP2KO6IYuFb5o
	q7PPElNM/BqXUrqVAovm+OZ9eDU80zunHaTTmD1USN4pz1MhnPPeGzaE1v+mRmvPcDUsEKl7l+J
	5qvvtqTuQy6uVRh8qq/7G
X-Google-Smtp-Source: AGHT+IETDFFJEhlTQYTQPdXbgsQvYe9QH+AEBCdZAv7mgtBkZ0lAQungI9nRxPYW5rw8xSleVA+3PA==
X-Received: by 2002:a17:907:c88a:b0:ac3:8976:8e4f with SMTP id a640c23a62f3a-ac389769a2fmr101323366b.2.1742229925847;
        Mon, 17 Mar 2025 09:45:25 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------uHe4yYhL36akIsXWa8Ahth68"
Message-ID: <3b3a97cc-9389-4fec-83bc-cdefdfa4b6a3@gmail.com>
Date: Mon, 17 Mar 2025 17:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] automation/cirrus-ci: add smoke tests for the FreeBSD
 builds
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Community Manager <community.manager@xenproject.org>
References: <20250317121616.40687-1-roger.pau@citrix.com>
 <20250317121616.40687-9-roger.pau@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250317121616.40687-9-roger.pau@citrix.com>

This is a multi-part message in MIME format.
--------------uHe4yYhL36akIsXWa8Ahth68
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/17/25 1:16 PM, Roger Pau Monne wrote:
> Introduce a basic set of smoke tests using the XTF selftest image, and run
> them on QEMU.  Use the matrix keyword to create a different task for each
> XTF flavor on each FreeBSD build.
>
> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
> ---
> I've used the current version of FreeBSD to run the tests, but it might be
> safer to use the latest production (release) version instead.
> ---
>   .cirrus.yml  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>   CHANGELOG.md |  1 +

Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
~ Oleksii

>   2 files changed, 55 insertions(+)
>
> diff --git a/.cirrus.yml b/.cirrus.yml
> index c74d5cf6eb9a..9c8b4b235cfd 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -5,6 +5,8 @@ freebsd_versions: &FREEBSD_VERSIONS
>       FREEBSD_14: freebsd-14-2
>       FREEBSD_15: freebsd-15-0-snap
>   
> +# Build jobs
> +
>   freebsd_template: &FREEBSD_ENV
>     environment:
>       APPEND_LIB: /usr/local/lib
> @@ -118,3 +120,55 @@ task:
>     xtf_artifacts:
>       path: xtf/tests/selftest/test-*-selftest
>       type: application/octet-stream
> +
> +# Test jobs
> +
> +task:
> +  name: 'FreeBSD: XTF selftest'
> +
> +  << : *FREEBSD_ENV_LATEST
> +
> +  env:
> +    matrix:
> +      FREEBSD_BUILD: $FREEBSD_13
> +      FREEBSD_BUILD: $FREEBSD_14
> +      FREEBSD_BUILD: $FREEBSD_15
> +
> +  depends_on:
> +    - freebsd_full_$FREEBSD_BUILD
> +    - xtf
> +
> +  install_script: pkg install -y qemu-nox11 expect
> +
> +  env:
> +    matrix:
> +      XTF_ARCH: hvm32
> +      XTF_ARCH: hvm32pae
> +      XTF_ARCH: hvm32pse
> +      XTF_ARCH: hvm64
> +      XTF_ARCH: pv64
> +
> +  fetch_script:
> +    - fetchhttps://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip
> +    - fetchhttps://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip
> +    - unzip xtf.zip
> +    - unzip xen.zip
> +
> +  test_script: |
> +    case "$XTF_ARCH" in \
> +      *hvm*) \
> +        XEN_EXTRA_CMD="dom0=pvh dom0-iommu=none" \
> +        ;; \
> +    esac
> +    export TEST_CMD="qemu-system-x86_64 -kernel xen/xen -initrd xtf/tests/selftest/test-${XTF_ARCH}-selftest \
> +                                        -append \"loglvl=all console=com1 noreboot console_timestamps=boot dom0=verbose ${XEN_EXTRA_CMD}\" \
> +                                        -m 512 -nographic -monitor none -serial stdio"
> +    export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
> +    export PASSED="Test result: SUCCESS"
> +    export TEST_TIMEOUT=120
> +    ./automation/scripts/console.exp | sed 's/\r\+$//'
> +
> +  always:
> +    serial_artifacts:
> +      path: serial-*.txt
> +      type: text/plain
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 7201c484f899..16c14e933c80 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - On x86:
>      - Option to attempt to fixup p2m page-faults on PVH dom0.
>      - Resizable BARs is supported for PVH dom0.
> +   - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
>   
>   ### Removed
>   
--------------uHe4yYhL36akIsXWa8Ahth68
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/17/25 1:16 PM, Roger Pau Monne
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250317121616.40687-9-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">Introduce a basic set of smoke tests using the XTF selftest image, and run
them on QEMU.  Use the matrix keyword to create a different task for each
XTF flavor on each FreeBSD build.

Signed-off-by: Roger Pau Monné <a class="moz-txt-link-rfc2396E" href="mailto:roger.pau@citrix.com">&lt;roger.pau@citrix.com&gt;</a>
---
I've used the current version of FreeBSD to run the tests, but it might be
safer to use the latest production (release) version instead.
---
 .cirrus.yml  | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 CHANGELOG.md |  1 +</pre>
    </blockquote>
    <pre>Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20250317121616.40687-9-roger.pau@citrix.com">
      <pre wrap="" class="moz-quote-pre">
 2 files changed, 55 insertions(+)

diff --git a/.cirrus.yml b/.cirrus.yml
index c74d5cf6eb9a..9c8b4b235cfd 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -5,6 +5,8 @@ freebsd_versions: &amp;FREEBSD_VERSIONS
     FREEBSD_14: freebsd-14-2
     FREEBSD_15: freebsd-15-0-snap
 
+# Build jobs
+
 freebsd_template: &amp;FREEBSD_ENV
   environment:
     APPEND_LIB: /usr/local/lib
@@ -118,3 +120,55 @@ task:
   xtf_artifacts:
     path: xtf/tests/selftest/test-*-selftest
     type: application/octet-stream
+
+# Test jobs
+
+task:
+  name: 'FreeBSD: XTF selftest'
+
+  &lt;&lt; : *FREEBSD_ENV_LATEST
+
+  env:
+    matrix:
+      FREEBSD_BUILD: $FREEBSD_13
+      FREEBSD_BUILD: $FREEBSD_14
+      FREEBSD_BUILD: $FREEBSD_15
+
+  depends_on:
+    - freebsd_full_$FREEBSD_BUILD
+    - xtf
+
+  install_script: pkg install -y qemu-nox11 expect
+
+  env:
+    matrix:
+      XTF_ARCH: hvm32
+      XTF_ARCH: hvm32pae
+      XTF_ARCH: hvm32pse
+      XTF_ARCH: hvm64
+      XTF_ARCH: pv64
+
+  fetch_script:
+    - fetch <a class="moz-txt-link-freetext" href="https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip">https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/xtf/xtf.zip</a>
+    - fetch <a class="moz-txt-link-freetext" href="https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip">https://api.cirrus-ci.com/v1/artifact/build/$CIRRUS_BUILD_ID/freebsd_full_$FREEBSD_BUILD/xen.zip</a>
+    - unzip xtf.zip
+    - unzip xen.zip
+
+  test_script: |
+    case "$XTF_ARCH" in \
+      *hvm*) \
+        XEN_EXTRA_CMD="dom0=pvh dom0-iommu=none" \
+        ;; \
+    esac
+    export TEST_CMD="qemu-system-x86_64 -kernel xen/xen -initrd xtf/tests/selftest/test-${XTF_ARCH}-selftest \
+                                        -append \"loglvl=all console=com1 noreboot console_timestamps=boot dom0=verbose ${XEN_EXTRA_CMD}\" \
+                                        -m 512 -nographic -monitor none -serial stdio"
+    export TEST_LOG="serial-${FREEBSD_BUILD}-${XTF_ARCH}.txt"
+    export PASSED="Test result: SUCCESS"
+    export TEST_TIMEOUT=120
+    ./automation/scripts/console.exp | sed 's/\r\+$//'
+
+  always:
+    serial_artifacts:
+      path: serial-*.txt
+      type: text/plain
diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7201c484f899..16c14e933c80 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
  - On x86:
    - Option to attempt to fixup p2m page-faults on PVH dom0.
    - Resizable BARs is supported for PVH dom0.
+   - Smoke tests for the FreeBSD Xen builds in Cirrus CI.
 
 ### Removed
 
</pre>
    </blockquote>
  </body>
</html>

--------------uHe4yYhL36akIsXWa8Ahth68--

