Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC743B52B4D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119627.1464905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcS6-0002jn-2F; Thu, 11 Sep 2025 08:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119627.1464905; Thu, 11 Sep 2025 08:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcS5-0002h3-Vg; Thu, 11 Sep 2025 08:14:45 +0000
Received: by outflank-mailman (input) for mailman id 1119627;
 Thu, 11 Sep 2025 08:14:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwcS4-0002ge-Ci
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:14:44 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ec46337-8ee7-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 10:14:43 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-b042eb09948so82860266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 01:14:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b312940dsm79904866b.40.2025.09.11.01.14.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 01:14:42 -0700 (PDT)
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
X-Inumbo-ID: 5ec46337-8ee7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757578482; x=1758183282; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NQw/pHbMKgZN/DXXg055zLw+8Gh5oTQyodMBAbDaFjI=;
        b=UHI5AJzo0fVDaIC7QMRZWF/V2LHiSGcCmkOl2K/n3YusEFiLAhNK9GufsK23Qld8gX
         yNl22Ov5XuHB4eg+dIeXGgOrxeVgdVfxQjnvlng7LDS7qufETrMMLHbH3uQRjqorziA4
         rD4PNkEt3bo60gZj+nNbchm+SRtk30qgRw1U0N+V1iUlE8kLOI9FUY9dTolgd86gkdZJ
         uvbNWV0oBbZs5+adLHvVjYq5Ax6ecBn21gI3xeWCHo46au7zdyIgfrCmAGEXgrij6KAN
         RLDGkJD9Ws0Oy5YHkD3yP7UWmCrYKg/Net5J9VMA5aJk560tLkAUPVwHbunfC0yryxlB
         Tg8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757578482; x=1758183282;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQw/pHbMKgZN/DXXg055zLw+8Gh5oTQyodMBAbDaFjI=;
        b=E1FmZ2qnOMMuf+L7oPYAi4dE42rhnspfRVgDLvOIxmjY6DyYENtPMuAMQf9Ioa9yNS
         AQXcrdCLaH4Xl9PVjRD/zjdMkCiCehmq00I5sPB87mU72VdaDo0QmDicmmFOv00ODVKn
         pyJmDS/vIWCiYfo62cJPzrrfAqQb7UdfT/9OL6cEcYAgbnGGzWkyR2Ow5BouFIyui3nf
         nmb9ba2WIoQch/crkPSHbrcVLv75TPDbDY02oR7Bdrxe9yfPtxoQ7EhtOwAwLRm7wX1v
         cgTS9am9MYP54WH6/3uCjkBheloh1iu7GwxJh0K8s0fAY55GG0EPeXj5va6zrITO7fPG
         oLcg==
X-Gm-Message-State: AOJu0YwLPzinCdRrglXLM4yV+RYMHnZuk48VRJ8FKvx7FhlINcIYsNPm
	P9t6gh3ZJDOT2Ui1bK3dVXbmZVasH3UdkIrxC0csr9kDJOQMfw/5IJ+exm0MGoPD8cq4hboWRTm
	V8es=
X-Gm-Gg: ASbGncs/efNId+UgiY7IkgdfDOHVQeyfV0SC+cyr7NMXnkz6yZF0en44IXPrL+8DDmE
	Anx5BjE9/pNSy4IDWS7mQk55LJnxFxzLBOPvySV65TFy/u3JY3qrkoEHRXK4/bj6m2VtyTqUIfF
	1NTnnyTBUDGC5egUPE3kx72mIq9FZ+vv44vmk8HuzBhaEflc4jQ6DtiKTdrud+SrO49heRuhbiP
	m4H52lpmcddI3b05jX6g03gAmzxcKXcUT0hEj8SaQX5uQZRB01no0uePXlyftdANzS+i8Ej/BnN
	5g1wH2P1DfNBckQ4iNiQB2S+J/zTz1uOLec6Hn85CFYMesTXNVg52NfqXbN3Fu5xxlq+M+NIqao
	gmaHggUdZUka+pi1Tb9Vhz9r+4BJMkoRlxlMP3R9ZbNpZdki5pZlur6g15gREwk7sop/Z9CUlBq
	hLDpgFpaI=
X-Google-Smtp-Source: AGHT+IHcHr7bZSbiyPPn4rsWRyGXyT1oS0YeJ0x4Iq2jsmYaMLXLldlIk9Gu0QB678SNj1fMG9YtOQ==
X-Received: by 2002:a17:906:d555:b0:b03:bc9c:ee9b with SMTP id a640c23a62f3a-b04b14aec03mr1720018666b.26.1757578482231;
        Thu, 11 Sep 2025 01:14:42 -0700 (PDT)
Message-ID: <a9b52101-c332-4791-8034-2d3043f82356@suse.com>
Date: Thu, 11 Sep 2025 10:14:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] releases: use newer compression methods for tarballs
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Other projects have long switched to xz and/or lzip.

Tidy things some as well: With the removal of qemu from the tarball,
intermediately extracting the tarball again has become wasteful. Drop
that. Invoke compressors using asynchronous lists, to reduce overall
latency. Drop the -v option from the (previously implicit) gzip
invocation.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: List tarballs using ls at end of script. (Don't alter the rm-s, due
    to lack of feedback there.)
v2: Don't expand intermediate uncompressed tarball. Don't check for
    commands' availablity. Don't request statistics. Use async lists.

--- a/docs/process/release-technician-checklist.txt
+++ b/docs/process/release-technician-checklist.txt
@@ -119,7 +119,7 @@ RELEASE TARBALL
        make src-tarball           # uses git-describe (best for RCs)
         # ^find some way to add git-cache-proxy to this (done in ~iwj/.gitconfig)
        mkdir /volatile/iwj/website-thing/xen.org/oss-xen/release/$v
-       mv dist/xen-$v.tar.gz /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/.
+       mv dist/xen-$v.tar.[glx]z /volatile/iwj/website-thing/xen.org/oss-xen/release/$v/.
 
        # website-thing/xen.org is cvs -d mail.xenproject.org:/home/downloads-cvs/cvs-repos co xen.org
 	cd /volatile/iwj/website-thing/xen.org
@@ -139,9 +139,12 @@ RELEASE TARBALL
 	cvs add -kb oss-xen/release/$v/
 
         cd oss-xen/release/$v
-        gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' xen-$v.tar.gz
-	cvs add -kb xen-$v.tar.gz
-        cvs add -kb xen-$v.tar.gz.sig
+        for t in xen-$v.tar.[glx]z
+        do
+            gpg --digest-algo=SHA256 --detach-sign -u 'xen tree' $t
+            cvs add -kb $t
+            cvs add -kb $t.sig
+        done
         cd ../../..
 
 	cvs ci -m $v
@@ -152,6 +155,10 @@ RELEASE TARBALL
 	# should show something like
 	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz
 	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.gz.sig
+	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz
+	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.lz.sig
+	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz
+	#   U oss-xen/release/4.8.0-rc2/xen-4.8.0-rc2.tar.xz.sig
 
 After a .0 release, update XEN_EXTRAVERSION again (to .1-pre, see above).
 
--- a/docs/process/xen-release-management.pandoc
+++ b/docs/process/xen-release-management.pandoc
@@ -274,10 +274,10 @@ Xen X.Y rcZ is tagged. You can check tha
 https://xenbits.xen.org/git-http/xen.git X.Y.0-rcZ
 
 For your convenience there is also a tarball at:
-https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz
+https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z
 
 And the signature is at:
-https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.gz.sig
+https://downloads.xenproject.org/release/xen/X.Y.0-rcZ/xen-X.Y.0-rcZ.tar.[glx]z.sig
 
 Please send bug reports and test reports to xen-devel@lists.xenproject.org.
 When sending bug reports, please CC relevant maintainers and me
--- a/tools/misc/mktarball
+++ b/tools/misc/mktarball
@@ -5,14 +5,6 @@
 # Takes 2 arguments, the path to the dist directory and the version
 set -ex
 
-function git_archive_into {
-    mkdir -p "$2"
-
-    git --git-dir="$1"/.git \
-	archive --format=tar HEAD | \
-	tar Cxf "$2" -
-}
-
 if [[ -z "$1" || -z "$2" ]] ; then
   echo "usage: $0 path-to-XEN_ROOT xen-version"
   exit 1
@@ -21,14 +13,21 @@ fi
 xen_root="$1"
 desc="$2"
 
-tdir="$xen_root/dist/tmp.src-tarball"
+tdir="$xen_root/dist"
 
-rm -rf $tdir
+rm -f $tdir/xen-$desc.tar.[glx]z
 
 mkdir -p $tdir
 
-git_archive_into $xen_root $tdir/xen-$desc
+git --git-dir="$xen_root/.git" archive --format=tar HEAD --prefix=xen-$desc/ \
+    >"$tdir/xen-$desc.tar"
+
+gzip -9k "$tdir/xen-$desc.tar" &
+xz -9k "$tdir/xen-$desc.tar" &
+lzip -9k "$tdir/xen-$desc.tar" &
+wait
 
-GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
+rm -f $tdir/xen-$desc.tar
 
-echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
+echo "Source tarball(s):"
+ls -lh $tdir/xen-$desc.tar*

