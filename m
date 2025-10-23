Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EDFC01DD5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 16:44:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149202.1480898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwYP-0005Kr-Gk; Thu, 23 Oct 2025 14:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149202.1480898; Thu, 23 Oct 2025 14:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBwYP-0005Hd-DD; Thu, 23 Oct 2025 14:44:37 +0000
Received: by outflank-mailman (input) for mailman id 1149202;
 Thu, 23 Oct 2025 14:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pfyu=5A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vBwYO-0004uF-G1
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 14:44:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8edbdc6-b01e-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 16:44:31 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b6d5e04e0d3so71562966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 07:44:31 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b6d5130d570sm229073166b.10.2025.10.23.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 07:44:30 -0700 (PDT)
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
X-Inumbo-ID: c8edbdc6-b01e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761230671; x=1761835471; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCl2HCRDV2i40PMplfn/hcDJ1SVM/uCEWPUsGMEipu8=;
        b=Nr5LFobVD7uWl1xuulxDfZGhPD2zdEySg9GktiuSI4aJRjX3D0ONriWWHxKKtqTcWg
         zhg/NUbA+uL3r3WyLWv1MJSTIrwsxHt35mNEUKXFRNlYuXrhmceBIWJiT16vmMMc6ezF
         LwZ5CiB0sOdP9Rd95foHG28sC1B+hZP40hh3M4M/YfzA57539leFp2VNkJTMZyDxDO8G
         PZ6N1BB3LC9tbXrZzSzuOJsT3R7znMEHeZdXlIdAC4vLzsodRNLY8WyO1ufufqznEfNk
         cImmeO1pTRTys+LfAAfexTXB9UVywJ565acyGI3zAgGOmQ3Ol0PFnJTF2fSgbtrSiRAF
         Kcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230671; x=1761835471;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OCl2HCRDV2i40PMplfn/hcDJ1SVM/uCEWPUsGMEipu8=;
        b=kMnaWRVnLjSi+RwKM4pmHqYl6fbyy3xU3Z5SWz1RB8r33KttYlzXWEuwOe29HLxM92
         ltjuZABBhGK8iwQTN3aexwMLDylUejfaX7nmwvhl1h8EE/nIwxGvlrc3Riwp9sblaJrh
         JAoaoGkW6yFoNOW67bkPtyqWnlhNiOX0yW5voEzrbnmcd7DvPz6kVULlE2m2V2c11BMv
         6pNsQbkIgOlOjGxifV4ggbFmdPtt0Ke8wUCmCTliCznB3efEvRFCgrR2OZx/PxGuwNDK
         QxVV69+IsFLuls3C98eK4j2fv7aLpQovNe7C1rfKhqGroP4TaX30r6c7GoqKhMb21qDq
         UAKw==
X-Forwarded-Encrypted: i=1; AJvYcCVKz9ST4SKZoakwAGnCRmuhKmUXT8K2GvReiqjAZ60LE804CGJXMbXkWYP0VwlIhoF/99NOz81a0AE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzKo9tWTH1EVMkdglxobuIJisA5FV59ttA2utQBaj00vXcfMCzC
	lUrNbM62t1mYVgeuA0cF2eLVp4WOj5sCBowTk/GJ/X13Uu3e+FRsjn1M
X-Gm-Gg: ASbGncs5PObGn8KiW/9bcxb2spxDMjS1HrzF/DhnbPkgPj/E3D1A38j9/+3puOvBW62
	DvXDbXRfpmPkqmBK1xIbPeN9Eo4DxpHt703PU7gmJ2A5+DvjrdIYNcXqpBU059grw8kV6B71AjI
	hSML6lHq1dEqXumMUzAozDpRj6vYb6OOtKhN9HbsEGccJCntElOMFOeB5qmX7D56Fm5ho0K5caD
	vpdGxu7Yxf0gbBcQHGbN7O0naPEpDWa+1tGy04z5RBGsINOupqmhTNq6RtTRRT6L4+m9Ks2bJhz
	swQUNZ4nLUXiMG06DXonbAImXfCF9MAzjjtaHlM18s2vBJFmcpn5mjZjd8g8RXIWZxddu6C7Gbq
	pTORNtdjd7OxbZYseLpqtbIq6QDIpbvDVz03jBd8IBtHqmH9jWT+Y1Ohrzeo/q0kGcXErFuUh2J
	2wjkIK2lL4RuzP48VruAvXn/BsNj8OOcKyEOCumkowsXnwW4BKtQT4sX3+9ZUenmli
X-Google-Smtp-Source: AGHT+IG3pHNIgJZev+8M+acscAebcHTNnZF0PAjtWoBycjKAnbmFmuZMxA9UcHZnRjfipDeYd2XS1Q==
X-Received: by 2002:a17:906:81d9:b0:b6d:5b0c:289e with SMTP id a640c23a62f3a-b6d5b0c447fmr121756466b.0.1761230670848;
        Thu, 23 Oct 2025 07:44:30 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------LQ5b6DOoQFRRaT8qcmI4FUv5"
Message-ID: <1a1fd748-05d4-4400-bf42-41a848cfc317@gmail.com>
Date: Thu, 23 Oct 2025 16:44:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH for-4.21] tools: require at least json-c 0.15
To: Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20251023085730.36628-1-anthony@xenproject.org>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251023085730.36628-1-anthony@xenproject.org>

This is a multi-part message in MIME format.
--------------LQ5b6DOoQFRRaT8qcmI4FUv5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/23/25 10:57 AM, Anthony PERARD wrote:
> From: Anthony PERARD<anthony.perard@vates.tech>
>
> If not available, fallback to using YAJL.
>
> The code is using json_c_visit() which was introduced in 0.13.
> json_object_new_null() and json_object_new_uint64() where added to
> 0.14. And the last one json_object_new_array_ext() was introduced in
> 0.15.
>
> Signed-off-by: Anthony PERARD<anthony.perard@vates.tech>

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
>   tools/configure    | 16 ++++++++--------
>   tools/configure.ac |  2 +-
>   2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/tools/configure b/tools/configure
> index 0eb7a0ab6a..d460f25529 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -9642,12 +9642,12 @@ if test -n "$libjsonc_CFLAGS"; then
>       pkg_cv_libjsonc_CFLAGS="$libjsonc_CFLAGS"
>    elif test -n "$PKG_CONFIG"; then
>       if test -n "$PKG_CONFIG" && \
> -    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
> -  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
> +    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c >= 0.15\""; } >&5
> +  ($PKG_CONFIG --exists --print-errors "json-c >= 0.15") 2>&5
>     ac_status=$?
>     printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>     test $ac_status = 0; }; then
> -  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c" 2>/dev/null`
> +  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c >= 0.15" 2>/dev/null`
>   		      test "x$?" != "x0" && pkg_failed=yes
>   else
>     pkg_failed=yes
> @@ -9659,12 +9659,12 @@ if test -n "$libjsonc_LIBS"; then
>       pkg_cv_libjsonc_LIBS="$libjsonc_LIBS"
>    elif test -n "$PKG_CONFIG"; then
>       if test -n "$PKG_CONFIG" && \
> -    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } >&5
> -  ($PKG_CONFIG --exists --print-errors "json-c") 2>&5
> +    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c >= 0.15\""; } >&5
> +  ($PKG_CONFIG --exists --print-errors "json-c >= 0.15") 2>&5
>     ac_status=$?
>     printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" >&5
>     test $ac_status = 0; }; then
> -  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c" 2>/dev/null`
> +  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c >= 0.15" 2>/dev/null`
>   		      test "x$?" != "x0" && pkg_failed=yes
>   else
>     pkg_failed=yes
> @@ -9685,9 +9685,9 @@ else
>           _pkg_short_errors_supported=no
>   fi
>           if test $_pkg_short_errors_supported = yes; then
> -	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c" 2>&1`
> +	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c >= 0.15" 2>&1`
>           else
> -	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c" 2>&1`
> +	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c >= 0.15" 2>&1`
>           fi
>   	# Put the nasty error message in config.log where it belongs
>   	echo "$libjsonc_PKG_ERRORS" >&5
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 7267d02a04..285b4ea128 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -424,7 +424,7 @@ AC_SUBST([ZLIB_CFLAGS])
>   AC_SUBST([ZLIB_LIBS])
>   AX_CHECK_EXTFS
>   AX_CHECK_PTHREAD
> -PKG_CHECK_MODULES([libjsonc], [json-c],
> +PKG_CHECK_MODULES([libjsonc], [json-c >= 0.15],
>       [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])],
>       [AC_CHECK_LIB([yajl], [yajl_alloc],
>           [AC_SUBST([YAJL_LIBS],[-lyajl])
--------------LQ5b6DOoQFRRaT8qcmI4FUv5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/23/25 10:57 AM, Anthony PERARD
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20251023085730.36628-1-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">From: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a>

If not available, fallback to using YAJL.

The code is using json_c_visit() which was introduced in 0.13.
json_object_new_null() and json_object_new_uint64() where added to
0.14. And the last one json_object_new_array_ext() was introduced in
0.15.

Signed-off-by: Anthony PERARD <a class="moz-txt-link-rfc2396E" href="mailto:anthony.perard@vates.tech">&lt;anthony.perard@vates.tech&gt;</a></pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:20251023085730.36628-1-anthony@xenproject.org">
      <pre wrap="" class="moz-quote-pre">
---
 tools/configure    | 16 ++++++++--------
 tools/configure.ac |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/configure b/tools/configure
index 0eb7a0ab6a..d460f25529 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9642,12 +9642,12 @@ if test -n "$libjsonc_CFLAGS"; then
     pkg_cv_libjsonc_CFLAGS="$libjsonc_CFLAGS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" &amp;&amp; \
-    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } &gt;&amp;5
-  ($PKG_CONFIG --exists --print-errors "json-c") 2&gt;&amp;5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c &gt;= 0.15\""; } &gt;&amp;5
+  ($PKG_CONFIG --exists --print-errors "json-c &gt;= 0.15") 2&gt;&amp;5
   ac_status=$?
   printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" &gt;&amp;5
   test $ac_status = 0; }; then
-  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c" 2&gt;/dev/null`
+  pkg_cv_libjsonc_CFLAGS=`$PKG_CONFIG --cflags "json-c &gt;= 0.15" 2&gt;/dev/null`
 		      test "x$?" != "x0" &amp;&amp; pkg_failed=yes
 else
   pkg_failed=yes
@@ -9659,12 +9659,12 @@ if test -n "$libjsonc_LIBS"; then
     pkg_cv_libjsonc_LIBS="$libjsonc_LIBS"
  elif test -n "$PKG_CONFIG"; then
     if test -n "$PKG_CONFIG" &amp;&amp; \
-    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c\""; } &gt;&amp;5
-  ($PKG_CONFIG --exists --print-errors "json-c") 2&gt;&amp;5
+    { { printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$PKG_CONFIG --exists --print-errors \"json-c &gt;= 0.15\""; } &gt;&amp;5
+  ($PKG_CONFIG --exists --print-errors "json-c &gt;= 0.15") 2&gt;&amp;5
   ac_status=$?
   printf "%s\n" "$as_me:${as_lineno-$LINENO}: \$? = $ac_status" &gt;&amp;5
   test $ac_status = 0; }; then
-  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c" 2&gt;/dev/null`
+  pkg_cv_libjsonc_LIBS=`$PKG_CONFIG --libs "json-c &gt;= 0.15" 2&gt;/dev/null`
 		      test "x$?" != "x0" &amp;&amp; pkg_failed=yes
 else
   pkg_failed=yes
@@ -9685,9 +9685,9 @@ else
         _pkg_short_errors_supported=no
 fi
         if test $_pkg_short_errors_supported = yes; then
-	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c" 2&gt;&amp;1`
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors --cflags --libs "json-c &gt;= 0.15" 2&gt;&amp;1`
         else
-	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c" 2&gt;&amp;1`
+	        libjsonc_PKG_ERRORS=`$PKG_CONFIG --print-errors --cflags --libs "json-c &gt;= 0.15" 2&gt;&amp;1`
         fi
 	# Put the nasty error message in config.log where it belongs
 	echo "$libjsonc_PKG_ERRORS" &gt;&amp;5
diff --git a/tools/configure.ac b/tools/configure.ac
index 7267d02a04..285b4ea128 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -424,7 +424,7 @@ AC_SUBST([ZLIB_CFLAGS])
 AC_SUBST([ZLIB_LIBS])
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
-PKG_CHECK_MODULES([libjsonc], [json-c],
+PKG_CHECK_MODULES([libjsonc], [json-c &gt;= 0.15],
     [AC_DEFINE([HAVE_LIBJSONC], [1], [Use library json-c])],
     [AC_CHECK_LIB([yajl], [yajl_alloc],
         [AC_SUBST([YAJL_LIBS],[-lyajl])
</pre>
    </blockquote>
  </body>
</html>

--------------LQ5b6DOoQFRRaT8qcmI4FUv5--

