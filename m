Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B98CBE43A2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 17:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144597.1477956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Pts-0003P5-Jb; Thu, 16 Oct 2025 15:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144597.1477956; Thu, 16 Oct 2025 15:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9Pts-0003NM-Gt; Thu, 16 Oct 2025 15:28:20 +0000
Received: by outflank-mailman (input) for mailman id 1144597;
 Thu, 16 Oct 2025 15:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cZm=4Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v9Ptq-0003NG-NK
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 15:28:18 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd49fc6f-aaa4-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 17:28:17 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b48d8deafaeso170735966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 08:28:17 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-146-38.play-internet.pl.
 [109.243.146.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b5cba45ad2fsm540376166b.35.2025.10.16.08.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 08:28:16 -0700 (PDT)
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
X-Inumbo-ID: bd49fc6f-aaa4-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760628497; x=1761233297; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTqLoNBKMI3RDTaFnrueWXi/0hFdS6n7bOY1iV5ZrbM=;
        b=k0fypZtzWaYBpr3xY8iPl5Wc/vj64jFkhQGEqd63sF8Pzd9sx15QMwzuKyC1QKuKs9
         Nk3gSxbgOWG3yWL7TqZ2j/XbveC3Yb1mFvCJBXC4WXFQcyTRa5w+UdrgpICADriMSZ4z
         0C6/OkXTm/yO5vqB3IK+B9qpkMN9y5Pmct4/284csv42loBBw6RiZxZxI2x/zs8k/TH4
         cY1X8jxvjP/JsWaGk2fN+9cOzmt/rDTodWleeKVnuSWunkJds+wnpmmxkgf/H33MrhS5
         tCW3YQ0bDg0+tkrOIehtQgZvixVSui5Ew645shLiu/lLD41ATpDwnJ8R1Ke73mLUt8sN
         trSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760628497; x=1761233297;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WTqLoNBKMI3RDTaFnrueWXi/0hFdS6n7bOY1iV5ZrbM=;
        b=c9AYrW7ZOBcAjf4bFZYGZNoZe5JRLbOP4BwmqvdPf9fmJ+uxTy6SbqiPQvaK0UGhQX
         aePfVmjoVXiFd148lwiy4GvdMLu8+vI2CMBUrOBxbxYUUYBYUP8OkQ6XN+UEx0GXsCpr
         HXhafzvhTJ16fARGbUmGsM3q8Dgb0KgOcnR0qoaQYJH5UysLj0EyJNEBYcya9jR9bXwE
         ecYXnCgGmNQ1KoicmN0QrXuC2Q8aWqVth8jFTFfUgFhl7OcCCwOSO3XmvSaRYC3ybgNX
         S8XhIcggBjsVk4c+Vw98fBeBy6Bf0Gq/cCLW9Um/eBHHwYqZviU2rjukKHRl3Fb1/WZx
         HByw==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ0OqENBi4BBjMS7Ww/9uQb3rJ4dXWSdIJGWWO9YS3ihTq05Ro2gVFQ+VqQCOv7uKKlqpM0Kw2xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNjdCV6t93J+SARtx0Gx09e/M8jOqWx6h+d4SITgfQ52XP+o9W
	+aF8TZf3YSPWXGJ3xmhk2AGsmdZ8CVEWU+Q5qbVeRsTgme94mlSTnAP5
X-Gm-Gg: ASbGncsg5i9Xb22iPxVGuRhfRqDqyE2vIGBktwleoekicZAENL7P9FxmAcmEF9LgQrS
	wxF9ozmeDLbf388pKcp/m3zfOlZUyQw6KTpq3SegOT9IX/usEQ6SCS+Iqtb/Ld+QBMT3qKXz898
	9MOG3KSSkhuj0RRu9cJdMBZW+NyvqNwvuII1FPEunkaUWPMksRAah9RstPRXK5ufsG5mSd3aQPv
	natP6ZwIEiAGTOP9NbNxvktF5V/XvPINi+PLuOVf12cZ/wXKtbog21+3LqB8euIQyD6cQr89SdK
	c/qPJ2+Vowzs/pc3UrSkvnN6i3iIRml1T6Hmu9E6Krak/NjytBesdZYkEwIWH/0r+AxaOV/yp3f
	21hwYxJuOUCOtOX9H8vUpQaiHRub5VQ6IXwgoKtLNzN54peZ9BuFbgOvPLQMStOrR6c9Vzdney1
	dY/7KAJEp0unrEkZoExj+vM4IeWIXmA7ovg3AmP0ZZCqCoCjwahYTHN/BPvvCfSl9GONI=
X-Google-Smtp-Source: AGHT+IFaYyxju/wUhxiZ5biPGBL8HSG5wXDgvprn7ffWvTOoB7u7/zW8eGSXN1xejAnj/L4x8olG0Q==
X-Received: by 2002:a17:907:6d0f:b0:b0c:b51b:81f6 with SMTP id a640c23a62f3a-b647423c403mr44368866b.43.1760628496737;
        Thu, 16 Oct 2025 08:28:16 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------TExmECWNxnJeHpyGTOEStcn6"
Message-ID: <e811c6dd-f395-42eb-b7ac-0f0f8f6e72e2@gmail.com>
Date: Thu, 16 Oct 2025 17:28:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] libxl: make gentypes.py compatible with Python
 older than 3.9
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <751bb140-3f00-47f1-9492-464c01ea1429@suse.com>

This is a multi-part message in MIME format.
--------------TExmECWNxnJeHpyGTOEStcn6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/25 1:22 PM, Jan Beulich wrote:
> removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
> always going to be there anyway, switch to a less specific but more
> compatible construct.
>
> Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
> Signed-off-by: Jan Beulich<jbeulich@suse.com>
> ---
> Sadly this is only the tip of the iceberg. Some minimum version of the
> json-c library is apparently needed for the toolstack to build, but no
> minimum version is being checked for.

Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> --- a/tools/libs/light/gentypes.py
> +++ b/tools/libs/light/gentypes.py
> @@ -384,7 +384,7 @@ def libxl_C_type_gen_jso(ty, v, indent =
>           s += "int rc;\n"
>           sub_scope_object = "jso_sub_1"
>       else:
> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
> +        sub_scope_object = "jso_sub_%d" % (1+int(scope_object[8:]))
>   
>       if isinstance(ty, idl.Array):
>           if parent is None:
--------------TExmECWNxnJeHpyGTOEStcn6
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
    <div class="moz-cite-prefix">On 10/16/25 1:22 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:751bb140-3f00-47f1-9492-464c01ea1429@suse.com">
      <pre wrap="" class="moz-quote-pre">removeprefix() was added only in 3.9. As long as the "jso_sub_" prefix is
always going to be there anyway, switch to a less specific but more
compatible construct.

Fixes: f6c6f2679d49 ("libxl: libxl__object_to_json() to json-c")
Signed-off-by: Jan Beulich <a class="moz-txt-link-rfc2396E" href="mailto:jbeulich@suse.com">&lt;jbeulich@suse.com&gt;</a>
---
Sadly this is only the tip of the iceberg. Some minimum version of the
json-c library is apparently needed for the toolstack to build, but no
minimum version is being checked for.</pre>
    </blockquote>
    <pre>Release-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii</pre>
    <blockquote type="cite"
      cite="mid:751bb140-3f00-47f1-9492-464c01ea1429@suse.com">
      <pre wrap="" class="moz-quote-pre">

--- a/tools/libs/light/gentypes.py
+++ b/tools/libs/light/gentypes.py
@@ -384,7 +384,7 @@ def libxl_C_type_gen_jso(ty, v, indent =
         s += "int rc;\n"
         sub_scope_object = "jso_sub_1"
     else:
-        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
+        sub_scope_object = "jso_sub_%d" % (1+int(scope_object[8:]))
 
     if isinstance(ty, idl.Array):
         if parent is None:
</pre>
    </blockquote>
  </body>
</html>

--------------TExmECWNxnJeHpyGTOEStcn6--

