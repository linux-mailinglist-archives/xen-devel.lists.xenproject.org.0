Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC3DB051D9
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 08:34:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043512.1413470 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZEZ-0004rn-CT; Tue, 15 Jul 2025 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043512.1413470; Tue, 15 Jul 2025 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubZEZ-0004pr-9n; Tue, 15 Jul 2025 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1043512;
 Tue, 15 Jul 2025 06:33:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ubZEX-0004pl-9h
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 06:33:45 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a67f7b3a-6145-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 08:33:42 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so15303675e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Jul 2025 23:33:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9e07793sm11491904b3a.69.2025.07.14.23.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 23:33:41 -0700 (PDT)
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
X-Inumbo-ID: a67f7b3a-6145-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752561222; x=1753166022; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Om/A6i9RqqHYT6kf+chZeQHyAlK8ubsHaOpGn1TvUI0=;
        b=NIuNxkPaJfc48ZaIEgIoacAh6c089xR3YEypCJVpz65kT5U4NrLLR4wRsahbD5PLJy
         RahGht7JXib/A0pT5gTql8cx8Qs/vb7htc73rlMPXuImOXQXqf1L18PrP4eJngAqpd+d
         o1dSkM7NTNurQ3TzuF1MAJsnQPpvqYR+Cl1YwldIOJ2kiyScEgXFY5B0tISrR+YHPFhJ
         09IClYtyaCUvd4lou9o63EJNFT0N30oaNL1zsXWfy2V1gFlTPl/vaU4XpcGlVoukqgPR
         zoLGCM2mIl9gTMHc2bYHjICxCTsTZUe8CaZa4S1mpEHZXB4yERipRP6WCeo33ERcCSwI
         jyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561222; x=1753166022;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Om/A6i9RqqHYT6kf+chZeQHyAlK8ubsHaOpGn1TvUI0=;
        b=Sua4RrLlQkAT909at6lm/UCxUrMVXrxPJn7FECw+Df1ZHlu90z+bcP3xyoswnm6CtR
         C/DpwG9/xOjtV6a7xMJOrt4fTTRTIyH1cikqyA3G2rkqI2bnKsZFaslOX1kef4Bmygjd
         NWohsRABqGRtqAhV5sx46l96w9EusV4JRlTc6JPnREJr7wDnbzhHTwgzmVzApeOYG5vR
         nKF7QEgQtMcR1QOL+X8tODVjidi4VOpuc4Eip5+OWhuFZX9ZCnbjZ68aloZzFwolXYGk
         fc2i1Go1skvtaAMjKCztNwyksUMNGCc1Yh7YUF4JMkrPO1HUcPsK1dRyjH5PbSSILK1L
         SfpA==
X-Gm-Message-State: AOJu0YylcvLUjVW5izP+0HEnkJgPyk99AfMY6XaKdcecwkyyl69xhLbL
	V2WX8G5CH8qit80PKUb0pYQJdsc0f1x9RdxYnW6y/uRgFncs0mIJEEg0cSoTPhounmzInceYO1z
	6TgI=
X-Gm-Gg: ASbGncuFSGYSEwTfZUlyGIveb8RvDtotdHjbaaiLFSlTG+Aqtq0fqPV47NDHgku81EL
	Cq3gf2Odlr1b5EjeGiKx1wDohZDjreOaOoWkme22XQ0xWhKZpX2heNS6/pabbEauKomsgmSNL6d
	e3TscaWlIU+rmqnjucmplkAYRESMI5N7AmhpvmLs7eccFuGD5Y8kDnCPhaGr4c7hxYQog6lAr8W
	pdYBJvPTHfGg35nOECd05mY7oCqon1zRAO4H4p2sv7dUmqbdlo4hhrgZG1NAzxJ/RNUFg+hkTMw
	6llwUt+MoWrzT0pRQjPxAX/DBhY2/XfuSsiKLhDLX7v6pWjlyWS6Z2rMmzUDXCTSW1+FltiUGS6
	UQpJr7ACUyqDcB/c8DDjFjqpDzvKlo73Hapxe/iOfx0qbq77eWmNBscy3vO2o8AjULVqrLUtiHi
	dO8d1GYgg=
X-Google-Smtp-Source: AGHT+IEV7FpTKdvy98kG/itgUwDXBXjEG2hcYT2eHSJky06URiN7zJSmsd2NXOPCb86SICndJq/LqA==
X-Received: by 2002:a05:6000:2f88:b0:3b4:5a9d:8323 with SMTP id ffacd0b85a97d-3b5f2dac649mr11953268f8f.7.1752561221624;
        Mon, 14 Jul 2025 23:33:41 -0700 (PDT)
Message-ID: <fdd60576-c852-4ce9-921d-9e77a86a3e66@suse.com>
Date: Tue, 15 Jul 2025 08:33:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] releases: use newer compression methods for tarballs
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

In the mktarball script, don't rely on the tar used supporting the -J
(xz) or --lzip (lzip) options.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Question (to the release technicians) is whether this would be adding
undue overhead, primarily as a result of anything done outside of the
build system.

It's unclear to me why we have git create a tarball, extract that, just
to then make a tarball again (without any special options, like to
override owner or timestamps; in this context I notice that tarballs
created by Andrew have file ownership of andrew/andrew, while ones made
by Julien use root/root).

Without passing -9, I observe lzip to compress worse than xz; the win
of passing -9 to xz isn't overly big anyway (about 100k, compared to
about 250k with lzip).

lzip, unlike the other two tools, doesn't really show a progress
indicator with -v. Merely having final statistics may make the use of
the option here questionable.

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
@@ -31,4 +31,14 @@ git_archive_into $xen_root $tdir/xen-$de
 
 GZIP=-9v tar cz -f $xen_root/dist/xen-$desc.tar.gz -C $tdir xen-$desc
 
-echo "Source tarball in $xen_root/dist/xen-$desc.tar.gz"
+if [ -n "$(command -v xz)" ]
+then
+  tar c -C $tdir xen-$desc | $(command -v xz) -v -9 >$xen_root/dist/xen-$desc.tar.xz
+fi
+
+if [ -n "$(command -v lzip)" ]
+then
+  tar c -C $tdir xen-$desc | $(command -v lzip) -v -9 >$xen_root/dist/xen-$desc.tar.lz
+fi
+
+echo "Source tarball in $xen_root/dist/xen-$desc".tar.[glx]z

