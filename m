Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E485FA169AF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 10:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874870.1285238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoCF-0002qA-NX; Mon, 20 Jan 2025 09:35:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874870.1285238; Mon, 20 Jan 2025 09:35:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZoCF-0002p1-JL; Mon, 20 Jan 2025 09:35:51 +0000
Received: by outflank-mailman (input) for mailman id 874870;
 Mon, 20 Jan 2025 09:35:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xfr=UM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tZoCD-0002oo-Qn
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 09:35:49 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8bd8d89-d711-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 10:35:40 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3061513d353so39259311fa.2; 
 Mon, 20 Jan 2025 01:35:44 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af07437sm1245908e87.25.2025.01.20.01.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 01:35:43 -0800 (PST)
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
X-Inumbo-ID: e8bd8d89-d711-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737365744; x=1737970544; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/q9HFjah82H3fpeLxRupwWEr0ySBimWHo8tSEFu9+qw=;
        b=mstCHx/xS2Qf4Mrezolnpy080OF01JBYGYV+xhTieoYUHCTYLmGysD3YSUbC/U0kgu
         M0MKUc2BJcxpYPfk2OU40v5f859LWw+RvYvKg+ca+jN4dZgcCrQTS6QDM8sYcHWLT2g8
         a8boUqHBiOMD/sHq8OtZhEIotawJ6foLiqtkXLWUfkNMiGWGncJ2Nok/JfrNkFNXksbI
         OVQh6Ue2GHPzFb5OfK30RMpEFQKuS7S3tkL1ATV8m+CSoA+q9F37jh6XxqT2XrtXgYjD
         MF59pr0DUc2gNm/b/N16NhQTl5eTcpSR3ygYxA7rx5LFJf+osPjMxU9vweTC2PoHapnC
         /wfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737365744; x=1737970544;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/q9HFjah82H3fpeLxRupwWEr0ySBimWHo8tSEFu9+qw=;
        b=ZsbDE2y0WHvJuhVAkCLbHdxMUv3OSTbNr8XX4JTsGXXOuHyMalsItyg5HXF8gQeNjn
         O3/M64hm5AY5Hm/1OOhC1uaS+Jj6wU3VgAMhIWydriOuFXe3yKJWC5uyxPwel/kLwkcf
         rtyTnZxf8P3NLkOPK6a3MOJRpnzToUP076Ph6WGPuM+K/oQrSXpsDFn+42UBbHwgDF/C
         TpW3WpMiCFQloy9765tYPT+ZMJ1ZVrVQQGAxL9UTxON0OHU3dM4LpY6P8YOBL3dgEW2l
         DMGBxwIsS542rak17wekZZkINGHkDMVGJNP/MILs0+OOKzW0wFvz/6QEPbKfAx27lJj8
         6AqA==
X-Forwarded-Encrypted: i=1; AJvYcCUomROg9GN0OJ7K1+8OiFNcGKbrHYYR2B6GOUgE1fhkksJN/yyO8CyuH8L++vtsURZC3d4WSMK/r6OFM3E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVoFuqtfcNEZ1uhb1nz9kYezi5axJySPtAQ8sL0E85wUSn6Xyv
	O+ISQmhdaAaV75D2Ykeax0V7iSi58Fk6Hujm7xgNQRFJ9PlfbgYr/BA+8A==
X-Gm-Gg: ASbGncvanPn+AMlDz+oc0nHh2XnfAnRzx9thrqgJRz4QlF650Be86NV4WiEstiZ8yKR
	7K2vUkEncephZOptPXL424HDX7TMBpG6j59mjQfGjPFfUVMGjJ7QfHUgLcFw5K9IOQ2DkdWQcB+
	PuoLEw73YfaSUA5XbykeM/Fj7l8j49T8w76Un124ewNuCoXkUn5MgxdDxvkDvXDgwcFWPTgR9Md
	ey/lIWAd9z7O43wdYP4aqSIN2/1DRF2FxjSx5mUAKVc9CNnN7mdYW2kTyGPpnCXjYQzjbAuJG4L
	bDGmoO8=
X-Google-Smtp-Source: AGHT+IFOh9LhNdkDnTT/D7VE43v91V2HBSphEUYtPPz+mPOPFdzrJRiJgU2BqZaqilhGPNYH7Y5AYA==
X-Received: by 2002:a05:6512:398a:b0:542:1b6b:1e8f with SMTP id 2adb3069b0e04-5439c2412b8mr4457490e87.18.1737365743313;
        Mon, 20 Jan 2025 01:35:43 -0800 (PST)
Message-ID: <7bf2ec2f-ecb3-4136-a979-6111c11447b4@gmail.com>
Date: Mon, 20 Jan 2025 10:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.20.0-rc2 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Xen 4.20 rc2 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc2

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc2/xen-4.20.0-rc2.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc2/xen-4.20.0-rc2.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Have a good week.

Best regards,
  Oleksii


