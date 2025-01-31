Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C73A23CC8
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 12:19:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879913.1290118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdp2T-0001pH-F4; Fri, 31 Jan 2025 11:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879913.1290118; Fri, 31 Jan 2025 11:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdp2T-0001mY-Af; Fri, 31 Jan 2025 11:18:21 +0000
Received: by outflank-mailman (input) for mailman id 879913;
 Fri, 31 Jan 2025 11:18:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a7eC=UX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tdp2R-0001mS-L5
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 11:18:19 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 111a6969-dfc5-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 12:18:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso13099735e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 03:18:16 -0800 (PST)
Received: from [130.190.75.105] (wificampus-075105.grenet.fr. [130.190.75.105])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102ee0sm4453159f8f.37.2025.01.31.03.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2025 03:18:14 -0800 (PST)
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
X-Inumbo-ID: 111a6969-dfc5-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738322295; x=1738927095; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHfByAdV8A6fu7yMamCu/dnF6oizcEA2sQW109vUEEM=;
        b=GSxe5jb5vMSpZ+3NJFxVej7wdU8JMW05O+jF6w4q5AjzbszGyauaYF2PiuHFgPOtAo
         mUg6hvgNRF7Ls82m7baloNlW/CZ9LC7wVKe1XxHEic7i84mS1vOZG3tbxeC4fO72CiED
         iG6K0zwy4bO8DKWbiDRGFmWTPOk2jR/HPq6q4tI5wurflHEII331vHYWyyQJ6m4JWt/r
         iUiM5LSOFRSPc0By5yD4avg24hKNfFiTeNqw+9cav9igghHpptd70Nj7U8roG7IFJD7+
         SFdxzo3YUWw0L7HASM9JUtFwv23eSHJ9A949jurQ009TM35xDRKAWPkMtLLaa/DT07/s
         vySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738322295; x=1738927095;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jHfByAdV8A6fu7yMamCu/dnF6oizcEA2sQW109vUEEM=;
        b=vVMZ66gy9gXCBtpK0PMCGVJGZEDev0ZmIwdW43pCnvm7OOuXIz3loq8+jVf+4tNRe7
         2WVHcn2rhqkVcdLowEdEOqRaiA20nKnzh72AzvqVhrd3ZLqao2JmOOaPHI5NVAq+2I1A
         ng0HhC68jWGXW2/HQyXUminxyC8PlpXYhZyUTv0MtVcLGKVzsSploD+3uO1y8sC7cPN8
         3TWLaz/ZI4oGeW57d4/Y6AgwIsHiuQfxhQG501KWe1zRT+Q8WoveNPX5yUv6CJEc3JkO
         b47gacxW+qjQMDAZhtAVpJhHBczEDYIZEqx8omueEDQI/sdr0ZYUnIHG+RPLsCNdssul
         lECQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVt5/hPs2qdmq3oqnUQkKMcAMFtoTVzwyfRL39b0s64XYndubFS4EP7q7yn0xOlz8xn9tDy2rohp0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxRQq9UuCrgjAaoAknh6neFN2sjnemYaR+GgBxjuhvl4Yc9zQaj
	GrHMKVrhGS+BWmyOZSx033Q45S8ZOX10AWys4j9/vwskwHVYbrns
X-Gm-Gg: ASbGncv56Yi3jzEmUBRgZejVIZ4pthBlCtktxQSV/r3h5+QyyL10ETOhTFi9nKQW5kI
	ZEE30c12B+laFK7dBDExI0GUMKoiBaqgCRlEGUUujxle7u5y9qnhb6TrxFX+P+Upiw2hr1gIdOQ
	QwVLDwvxFp1GsRL5QgVhDUqQeuRg9xN0MMtJ0uNm/Kx66nQCWYHG5upYDQ7l6WGenBXymKMuY/+
	RwtRRKcmgm0+alx5NY+pQMVnfZVxdERbXMPZmAGD9+CqfaJOUHGR1QYFO9lGMnMmwlm/ZZ9W1X6
	Fs+x6btylF2iNN5QhqOWHAavDj4/Snvwm6zUUYE6nS6dhxX+EnDRFT96NQU=
X-Google-Smtp-Source: AGHT+IEZU+i9NM9gL4lDu9rrho7ftx3XorMt3TA5odPPV2tpWxSwYufwZ3dwEpFXhUOPxXalEmzhXQ==
X-Received: by 2002:a05:600c:8711:b0:434:fd01:2e5f with SMTP id 5b1f17b1804b1-438ea3c1ceemr16858705e9.29.1738322295256;
        Fri, 31 Jan 2025 03:18:15 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------mkN6u23kiz0sY0SZ9Wm6est0"
Message-ID: <3002677f-f786-4a79-9073-7a5af1bbab9f@gmail.com>
Date: Fri, 31 Jan 2025 12:18:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 0/3] AMD/IOMMU: assorted corrections
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com>

This is a multi-part message in MIME format.
--------------mkN6u23kiz0sY0SZ9Wm6est0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/30/25 12:10 PM, Jan Beulich wrote:
> The three patches are functionally independent, and they're presented
> here merely in the order I came to notice the respective issues. At least
> patch 2 wants seriously considering for 4.20.

Based on the commit message for patch 2 should be merged to 4.20, patch 1 could be merged too as it is pretty straightforward
and I don't really mind to merge some additional logs. With proper review:
R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

>
> 1: AMD/IOMMU: drop stray MSI enabling
> 2: x86/PCI: init segments earlier
> 3: AMD/IOMMU: log IVHD contents
>
> Jan
--------------mkN6u23kiz0sY0SZ9Wm6est0
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
    <div class="moz-cite-prefix">On 1/30/25 12:10 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com">
      <pre wrap="" class="moz-quote-pre">The three patches are functionally independent, and they're presented
here merely in the order I came to notice the respective issues. At least
patch 2 wants seriously considering for 4.20.</pre>
    </blockquote>
    <pre>Based on the commit message for patch 2 should be merged to 4.20, patch 1 could be merged too as it is pretty straightforward
and I don't really mind to merge some additional logs. With proper review:
R-Acked-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>

Thanks.

~ Oleksii

</pre>
    <blockquote type="cite"
      cite="mid:2bb9d3c4-0761-4d63-8193-29293e35eb04@suse.com">
      <pre wrap="" class="moz-quote-pre">

1: AMD/IOMMU: drop stray MSI enabling
2: x86/PCI: init segments earlier
3: AMD/IOMMU: log IVHD contents

Jan
</pre>
    </blockquote>
  </body>
</html>

--------------mkN6u23kiz0sY0SZ9Wm6est0--

