Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21E5B95E68
	for <lists+xen-devel@lfdr.de>; Tue, 23 Sep 2025 14:57:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1128359.1468735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v12Yw-0006vo-OA; Tue, 23 Sep 2025 12:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1128359.1468735; Tue, 23 Sep 2025 12:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v12Yw-0006uE-JG; Tue, 23 Sep 2025 12:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1128359;
 Tue, 23 Sep 2025 12:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcE1=4C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1v12Yv-0006u8-Au
 for xen-devel@lists.xenproject.org; Tue, 23 Sep 2025 12:56:05 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9e11ee5-987c-11f0-9d14-b5c5bf9af7f9;
 Tue, 23 Sep 2025 14:56:04 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b04ba58a84fso949298666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Sep 2025 05:56:04 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-67-38.play-internet.pl.
 [109.243.67.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b29f45b5384sm671968266b.27.2025.09.23.05.56.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 05:56:02 -0700 (PDT)
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
X-Inumbo-ID: a9e11ee5-987c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632164; x=1759236964; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tBdwgS747dBZVBV0IIJCXA3915gEcA/QF5qizjHD+A=;
        b=l7R+VeEjazLebv+Nby664WWBpUTsnUd1J+PtLer6MDv8aU62iGoxH5yD/TJJlJZ+7Z
         a0joDS1hTYtmmvpHEkozzMLJln/DPCgeDmQekZdcPC0UJT6hLH/ntoC6mNMAnPmAqx2x
         Yyl5rERPEiCffgB3x8UnaaC8yNEpsSpTojOlssX3XhCATvs/iZ2W3N5pDVO6CP335+GU
         ZuqdJHQoq6Hrq0Tjvd+i0ZMQ+UorHvU6X01kUtSQeAeSntteEc6RJ/S2vercaNw54Deu
         ydaOpNZKl7lMkrj1WEirheWZq5e9HjzLMzg4AlbrKvcuG/M1nUV5O+rR7o/afksPj8GV
         NS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632164; x=1759236964;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5tBdwgS747dBZVBV0IIJCXA3915gEcA/QF5qizjHD+A=;
        b=IM16iCWvXDNBZUaP5A4m6bQLrIgd6feSQQvEa7HLYIl/kZjR1bkUe4dakvhfyGn6eM
         p8BqTSARDLe4+sBhl9BVwGYNj8CLYwEA6k5yOZku84XUC5J84b22HfJ/OwTt0YIpzMhq
         c3htjAMhQtlgGoR846tcwIprPJVYUvMaYb3IAt0zYN0sy2s8TTPeO+N8dyJBPDvs412C
         aestWq77nwti95babF4BWde6YiIjj2Kkik35ktrRGCPIIu9OHyr9CfwtWHt0EatHTy4M
         vbTw162jefi9QSmNJhHbTWW8osQ704SUZPgQGYcEo3G+LbQDIx1Jqp0BoRwQx9xDG21H
         M9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnE6LnMrpubFVTCj2gHtYArL2uGVCKv03wxOhugV180VrvW8ftgkg/6zD5yw/ZZuJ8/4gDij0NCdE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuqTvx0zzFe7b+w8kDHEc2BmHyP6qj01puhTzx07rAK4Mu7sZQ
	saqQ4VIkMIXfpNMpDk/39pWgGEH+QCrVyBC5b/0LaUo2BxFVKqszgSQU
X-Gm-Gg: ASbGncuMS0V/nr2AztAFiODSdT1mobm8vxbgUr+TyAj6yTEADKu6CX8qUZS10R53cjo
	ZmIA2nEEiGm1jir6ecV2WHMFWNLOVZregJXWDsov1EvxJ0f0RGQ1Y6xOv1q67P5kfnp45bK+IkO
	TFGxyiJidz1NWKbGSFZR+3XcHT2moM7gRaYrVi4QLAPDLMbuF0E+SiYpHjr8732Lls6wMX35W2F
	gF2FkoAPByY+q9pQXozZRQgiA6dGynYFXTY1ExMUIgdn7Deh9oYwqmOeF8d94QhLa14KDOjo8WV
	ak466zXm8jnJWeJ6Y9MQxwB5u3LD9ZO7WjgvMrY0NyaLsu7wC3GtnklrATLIXenUhxEySx2C3Oa
	2nPNSa5aCyr9aC4XSBwI0lGJqYwQsInKcB59VuH5wD0VIEiJtzs7eYqR7Jl29NKjzjBbeV+5S
X-Google-Smtp-Source: AGHT+IGvTj04ixM3W6kjbnuE60+qySvz/SpECJ8DcJ/qV6ivZLIh4aVbvFs+qCHj/BZDKJlZg/tLAg==
X-Received: by 2002:a17:907:7f91:b0:b04:848f:a0d4 with SMTP id a640c23a62f3a-b30263b8326mr239483166b.13.1758632163362;
        Tue, 23 Sep 2025 05:56:03 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------D9E9RIuLltWrosOGlBe0fF4b"
Message-ID: <ff9b5c10-dfb9-4341-ba8e-19ea6a22e2a9@gmail.com>
Date: Tue, 23 Sep 2025 14:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 8/8] CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq
 driver support
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Community Manager <community.manager@xenproject.org>
References: <20250923043826.3831957-1-Penny.Zheng@amd.com>
 <20250923043826.3831957-9-Penny.Zheng@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250923043826.3831957-9-Penny.Zheng@amd.com>

This is a multi-part message in MIME format.
--------------D9E9RIuLltWrosOGlBe0fF4b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/25 6:38 AM, Penny Zheng wrote:
> Signed-off-by: Penny Zheng<Penny.Zheng@amd.com>
> ---
> v9 -> v10:
> - s/Support/New/ and add a full stop at the end
> ---
>   CHANGELOG.md | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index ca1b43b940..7b9518ff08 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -36,6 +36,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
>        Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
>        and 28 (Temperature Probe).
> +   - New amd-cppc/amd-cppc-epp cpufreq driver.

LGTM: Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>   
>    - On Arm:
>       - Ability to enable stack protector
--------------D9E9RIuLltWrosOGlBe0fF4b
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
    <div class="moz-cite-prefix">On 9/23/25 6:38 AM, Penny Zheng wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250923043826.3831957-9-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">Signed-off-by: Penny Zheng <a class="moz-txt-link-rfc2396E" href="mailto:Penny.Zheng@amd.com">&lt;Penny.Zheng@amd.com&gt;</a>
---
v9 -&gt; v10:
- s/Support/New/ and add a full stop at the end
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ca1b43b940..7b9518ff08 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -36,6 +36,7 @@ The format is based on [Keep a Changelog](<a class="moz-txt-link-freetext" href="https://keepachangelog.com/en/1.0.0/">https://keepachangelog.com/en/1.0.0/</a>)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - New amd-cppc/amd-cppc-epp cpufreq driver.</pre>
    </blockquote>
    <pre>LGTM: Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:20250923043826.3831957-9-Penny.Zheng@amd.com">
      <pre wrap="" class="moz-quote-pre">
 
  - On Arm:
     - Ability to enable stack protector
</pre>
    </blockquote>
  </body>
</html>

--------------D9E9RIuLltWrosOGlBe0fF4b--

