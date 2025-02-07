Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C20A2CE03
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 21:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883929.1293763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUmS-0001w7-Np; Fri, 07 Feb 2025 20:16:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883929.1293763; Fri, 07 Feb 2025 20:16:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgUmS-0001uf-JO; Fri, 07 Feb 2025 20:16:52 +0000
Received: by outflank-mailman (input) for mailman id 883929;
 Fri, 07 Feb 2025 20:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4G/=U6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tgUmR-0001uZ-T6
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 20:16:51 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 772bed70-e590-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 21:16:51 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7917fc0c2so133657766b.0; 
 Fri, 07 Feb 2025 12:16:51 -0800 (PST)
Received: from [192.168.209.66] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab79298641asm104318566b.90.2025.02.07.12.16.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 12:16:49 -0800 (PST)
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
X-Inumbo-ID: 772bed70-e590-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738959409; x=1739564209; darn=lists.xenproject.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBLOOmJfSN037N/pk7DeRIvhTXG/9VZorS0vLVkrr60=;
        b=eWetPBkZ9ZH1z4QQzRG7l0QcM50Y8CkLxih/Rr4EyO7UyOTNyzB+h9c2FixKoHpZtD
         huix0HYyQtIqnI1cFiW2DSOQRnnpA3Zz5gUhgWLfmrxpcF3eHr+K0I9RtbzW9EFlFoIM
         67MqbcOUo09V0YleubdroR6NiUToz7K5kQndZq798mZibQlJONWLD85iXLPIW98U80bE
         hNQ1LNu3ItsR7Su3eIC9d9eAnzjRvdxn8COnOtXlRVEq3pzMBXxhoJnXCpRwOSI3Ct4A
         QYYFoOyCjf8WeDKCbRj+HqjcplaBITIDgWIHkgwCj8jMS7q3J3Fq5MnP4LjQvQVpbqqm
         rqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738959409; x=1739564209;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBLOOmJfSN037N/pk7DeRIvhTXG/9VZorS0vLVkrr60=;
        b=A4JWkyCv57Hku/6SogEL6W8mi5A4vJVcaRX+E2a/boy0Iicd9GsSWIM1dp1IIRww0X
         oRRwrbMWUPowkt8HNdkE/KnIFCLYWXgmpykiY27LQqnRR0iVJM4eAEod61y9/fJ0/S/j
         L0xOG+mgpeWgJecnA4VwQCqNAwArNINVcUwEqB0xccY7sPIPoNHg/5dxorYYb78FCg41
         CBKtzb25sGLASbSDeMsACDEIRm3cNlzAzRh7YtpJYABSFFcScfRM4OiozTdIDhCPec+b
         QqjfuSzjTqg13NpZks6QR5eVWkbF+Y/Xq50ayD787cKKjPkd6Kuj/fHIVlgs0vj89Igg
         UOag==
X-Forwarded-Encrypted: i=1; AJvYcCXIpoPrnGJhoL3vcaoVf0i0ZancYVQKadcJ7bX7WeFrsoF6DJm80MMOl9db4RKr+UzFVAy1vXV+ftk443I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxB36bxCchwV2L3KARMOqh68lFat3QM8IXRIgdFUWhxJpzR/c3y
	D+qSOpZjlqkyO1H18Z4ETdZGMRqcT4dfbfd0DwMy5xGR4h8GojZZCPs89A==
X-Gm-Gg: ASbGncuNxPJ/zS+f2dRjmMgiknv8xTw2sWpR9BKIz7HovQ30bMWsiepy1x+M75ANuLn
	9OToReSz93ZdYzLSkBc3QXFh16e9q08gXNfBdKxnW1vswW0JkfEo1gq+bTbNjnxmqAz+3K7jFDk
	SvDE/WVif3Ht1PUJEUg1UxqcxheikfcYMDn6pNpcCm8y8Th9/nHMsJj6BbYNtb0fYZHKQMaJ34d
	+foNoyn/dWklRWx1cPBwGE/DTOPlRbatp/6JJU5xm4NIszz1yd1hNGZkuGb75HoEoF6y4hUBDzM
	D/OapjrioXkaoWifrWLMEOiV4Z4=
X-Google-Smtp-Source: AGHT+IFLaDBBte+MsFo3lEnhu5oGswMHYzibf23fSzfHiaXpaEK41L3FSkn7xxJxQ6oaugcJepn7ng==
X-Received: by 2002:a17:907:9688:b0:ab7:9ccb:c941 with SMTP id a640c23a62f3a-ab79ccbc9bemr66337166b.51.1738959409307;
        Fri, 07 Feb 2025 12:16:49 -0800 (PST)
Message-ID: <5cfe36b2-b980-4f82-af24-a87108cd227f@gmail.com>
Date: Fri, 7 Feb 2025 21:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.20.0-rc4 is tagged
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Xen 4.20 rc4 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc4

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz.sig

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Have a good weekends.

Best regards,
   Oleksii


