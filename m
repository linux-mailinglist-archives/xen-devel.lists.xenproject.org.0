Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78CB53A7C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 19:38:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120713.1465513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwlFm-00061i-7b; Thu, 11 Sep 2025 17:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120713.1465513; Thu, 11 Sep 2025 17:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwlFm-00060F-4j; Thu, 11 Sep 2025 17:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1120713;
 Thu, 11 Sep 2025 17:38:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8rd=3W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uwlFk-000609-GW
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 17:38:36 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 248c03a2-8f36-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 19:38:35 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b043a33b060so150832266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 10:38:35 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b31291bbsm176732466b.42.2025.09.11.10.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 10:38:33 -0700 (PDT)
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
X-Inumbo-ID: 248c03a2-8f36-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757612314; x=1758217114; darn=lists.xenproject.org;
        h=cc:subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fg6U/zUUNT5guRlToLkcmCkMbxQgwYvKIezKtcB8DA0=;
        b=GdE/RpjKmMyYj5Exy3SIcEXh4jy6D+f+hOaQIeEuuicVC5rts8CI12RwszzJpXxdc9
         xx9MqrDNPwg65FI1V4aNUp++M/9ZUgpuDBEuxImnCZbE/sYXOClrPP0vUKP6sSbaIzMC
         3Mud1M0GdF8pRp+577WNnPzt7AHv3U+MFUHsV1H74NrAovhM7XSx3SzgFBTwK8Jnxbc7
         L8mpzvShiGtXYNjr3R8miVpO+2RVEm4FzAuomIuSu8typGBuS/oHDwmbZRhT1ijXa/W/
         3JBsOtBb3nrISrzpD59DOooF4rOQzTkMkzu81JxOBByM84YBToi4+TlxvchAv2oiDXcu
         sDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757612314; x=1758217114;
        h=cc:subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fg6U/zUUNT5guRlToLkcmCkMbxQgwYvKIezKtcB8DA0=;
        b=U542oytS67CN6+gzS6gJ8rFrBpwzFO55WSSt2VURvVOKFkJHByLpxISb2pkHKgOkOB
         ujx7RIfKINfR0OL2GGruwxMC4+yqP/kY/QKSWh0kf6Nni2zSvGY8aqmRV2nIBdevkRW9
         aU1dlqneccmIpe+RbGe6HZhLec6WqWwG8a7yhQhiiNugSJCC0ptWBuEi3DLqIgngh/7S
         oNEsYbB9GTjOWzUdbAp6KsBLXz5mzYIc8xvHefuUydWa02J1jzkolmMNkZ1Fw/+UTv9P
         LsI1wizIQILZyv0NWoo8wz+EKtSIuQeahSn8Kyv+w7kgvzmUFDTKwpK/XHt2fcDgGSyt
         S47Q==
X-Gm-Message-State: AOJu0YxYXo8SZjBtP8TfHUY/AyzwyioxSKGmg0ekyjrx+KizZssfJzMi
	XgK7Wp5bvyzaBte1Qdhx44Y70k+rA1TgiKDcrf90zuwJ8MmM8jJ5sWcZHMZ5zw==
X-Gm-Gg: ASbGncvHKSJefM4UVkv8n4QpohNNVhHF9uRXJm1OKMC56EQ1nCveQ2MB2ToK5whAlXD
	3xrzyWcq7PqEIUauyT6w+oWL/9TtzxgQDJA6jDNOML+pU2wR+GtjQp+4ZOjXUsSI8aqCFGVAeB5
	qumqEpCuQX1fP0Ae8JGxKVgdFZr8fT5ov3cSEd6klCx8l45D5rvJSRY+AkshGlDdwrkHFsvpGPQ
	WXX/Vb6hyX8z0Lph+xeQ22Eu7dv+2r3dq0BzqQ904fcElGrMw2kxJtljHUzZdFDGq+rOXIWXskw
	QmZbJDqMLzIstKsqLknsE14PqVzYXr1f5Q6W6P9j800Qul/eTV6eoy5LsxhR/L2dlOnrE0hz6/W
	K69in5UnIBNFTB+M2BOqW7qK1m2y5Svns0fcn91eQIUjUa4seGYKZCbL6tULeiziXhxZLBY4AEE
	CDmbkq2PA=
X-Google-Smtp-Source: AGHT+IFyCnlj1AKoIK+JOCfX7ooQVOLLkUhOpB1E69W0nkfe2fk9WJSnW0WLpZTkfice2u9e2Bas8Q==
X-Received: by 2002:a17:906:9c84:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-b04b173b495mr1765918766b.53.1757612314245;
        Thu, 11 Sep 2025 10:38:34 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------ziRazTzCRRdtO7kmyc9E8GfB"
Message-ID: <1248fd0c-08c7-42b1-ba10-755ae8696528@gmail.com>
Date: Thu, 11 Sep 2025 19:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Code freeze is Fri Oct 03, 2025
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>

This is a multi-part message in MIME format.
--------------ziRazTzCRRdtO7kmyc9E8GfB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

I would like to inform you that the release schedule has been updated due to
an extension of the Feature Freeze.

The Code Freeze is now scheduled for*Friday, October 3, 2025*.

You can find the updated schedule here:
  https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes

Have a good evening.

Best regards,
  Oleksii

--------------ziRazTzCRRdtO7kmyc9E8GfB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hello everyone,

I would like to inform you that the release schedule has been updated due to
an extension of the Feature Freeze.

The Code Freeze is now scheduled for <strong data-start="282"
    data-end="309">Friday, October 3, 2025</strong>.

You can find the updated schedule here:
 <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes</a>

Have a good evening.

Best regards,
 Oleksii
</pre>
  </body>
</html>

--------------ziRazTzCRRdtO7kmyc9E8GfB--

