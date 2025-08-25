Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBAB34229
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 15:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093212.1448757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXef-0002bI-9k; Mon, 25 Aug 2025 13:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093212.1448757; Mon, 25 Aug 2025 13:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqXef-0002ZL-77; Mon, 25 Aug 2025 13:54:37 +0000
Received: by outflank-mailman (input) for mailman id 1093212;
 Mon, 25 Aug 2025 13:54:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqXed-0002ZF-K7
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 13:54:35 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 070b6477-81bb-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 15:54:33 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb78c66dcso607570566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 06:54:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe74f5672esm299976066b.59.2025.08.25.06.54.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 06:54:31 -0700 (PDT)
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
X-Inumbo-ID: 070b6477-81bb-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756130072; x=1756734872; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o3KE+yMg72cd6ZH0eiZidqOGquPn69/4hPkJ/gsUKsk=;
        b=T50HuwYJ1t/56l/cEn4srBEUw/IsiMjVcen9nLYIZnjoIXVXrtJFvKe8Pj6AHP2hgA
         C3v3j+wDmai0KAhfyd2wD/8uxJFKWH+nA0OzAfU+r8l50+77X4cH2VRxyxe2eSpgJZ/N
         MabkYSHrvDELBKNAHc+lCwy1wOZuCLdza/y4bxP52GiEIJltGmYdJrOfcjuLC5YVbHKo
         g1GRWPgdnU0QMDqa+KpsY6dMrz//HNiJY9pNECg3icLZEL7f37nzDiD6pHT0zJ48gKFe
         kwWTgwfS7mnyQ8fYnbStPkjpgE1/Ar126cf0NYBrLN+uDhX0u8E3ELTJrCKW53qlJYUO
         cNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756130072; x=1756734872;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3KE+yMg72cd6ZH0eiZidqOGquPn69/4hPkJ/gsUKsk=;
        b=EdsBubbyFM3fSqKW+I5uCgMzMogQWlSTa0+RQGgz7MT32fPUovqubLw1kqMs+0yeB1
         N+R/LlcfHRAdeYusEesLEe03cr3eD7TLfJCcMLkz5s3YS7JvE/y7xlSU5//SVjxrTguG
         r2pzQIMLRhHEwZtrrqydH8se5t3fo+SUW+DOU8X/P1WVzKg1SVGY1EHt+5MQ9QtvVko5
         hlYW5yILNvKMS/anPh+hwkmaXYQn456An4Q8sTfymlBuGD2qQTkrq0n8XG36V5cp+RHO
         jk2iPOGP1zo6ycHC/z5JfaAtp8XSaosm4zyNW3MLzLq8I10iJrbmSPALIn8kcmIeebAa
         6pIA==
X-Gm-Message-State: AOJu0YypaZhLRvw7oao9KVS/0VlRyGRxj07aO9oWNGOunf/IfHuotyz9
	177OGuxcAxvvBFKe7iF0bOz+H/fc/GymrfDS2MaIkE0+7l/69VaksBGJlMZM8QjrvUgr333iOB1
	C6qg=
X-Gm-Gg: ASbGncssfZgxHcoigPYyGkTYQ2RJgQKS4J6coMc6nOAfP6hGy4nF0P3te2LKTUZJkYE
	IMmCZFuO+o2hdQ4TMGS62hzwbCciWSQdbhnhefKgWkpgM53bo8d2bVT+Cv1zOSA3GfwE+QirdYX
	8yNDZup65SYGsDYhO63CbV367knV/J47im2AZP0ckXA3anLw3MqcGFw1ebgTuKZS+/FMxEJkvo2
	65JcXfe7EjxsPYCV6xgp6R8MupIkG2/BtTutbsrhhQHZIIrmG4qOlJFSCALvPBmD1ALzRW9mRnV
	J5ckERWz0j2zJ57Jp86q3F5/rSFnwSp0W2/dKssrp9AgQo0a4yGGyTtZnpo+hEdBCL8o4N8JrGN
	4lnMKhpxGpq8Qpt0gTsaUT5nfdyHhebVLkmOYVXSwbsJNDdWnPvfFnlZfTr5GKThSh+93P5Keh2
	nexgb68Vk=
X-Google-Smtp-Source: AGHT+IHf1JOrTaoqwCJNVPW1HfPWVD9To2PTYy6wPBoo1HYFDKRZw9faXS3RvWPCjSlAez2UAu7+fQ==
X-Received: by 2002:a17:907:985:b0:afe:6648:a24c with SMTP id a640c23a62f3a-afe6648c0damr484091666b.52.1756130071923;
        Mon, 25 Aug 2025 06:54:31 -0700 (PDT)
Message-ID: <b07e8b46-06b1-4f41-958a-d8739778c50e@suse.com>
Date: Mon, 25 Aug 2025 15:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] releases: use newer compression methods for tarballs
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
@@ -21,14 +13,20 @@ fi
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
+echo "Source tarball in" $tdir/xen-$desc.tar.[glx]z

