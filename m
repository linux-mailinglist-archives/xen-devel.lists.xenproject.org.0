Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED0A3E2B1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2025 18:40:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894032.1302854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAX2-00031e-VH; Thu, 20 Feb 2025 17:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894032.1302854; Thu, 20 Feb 2025 17:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlAX2-0002zy-RH; Thu, 20 Feb 2025 17:40:16 +0000
Received: by outflank-mailman (input) for mailman id 894032;
 Thu, 20 Feb 2025 17:40:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zkM0=VL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tlAX2-0002zT-4E
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2025 17:40:16 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc96f639-efb1-11ef-9aa9-95dc52dad729;
 Thu, 20 Feb 2025 18:40:13 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54529eeb38aso1001800e87.2; 
 Thu, 20 Feb 2025 09:40:12 -0800 (PST)
Received: from [172.24.85.51] ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f10cc28sm2465900e87.201.2025.02.20.09.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 09:40:10 -0800 (PST)
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
X-Inumbo-ID: bc96f639-efb1-11ef-9aa9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740073212; x=1740678012; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lo/XU2sbk5tTBuBCxcMj8uYZYtE2Qa5FDlweole+YdI=;
        b=E9A5f8q9wmwmak9CioxCL6Ak9SJInYBA2G7Lb5ZJ15/Dp7PNS4mxu4MdgeQhLSjOPI
         6YGAh/GQWtySZULczVAIOLx8WSPuaUBmGFtxI3yeZKf7Kd2QzGUKpfrrkH0HmWRgZsFj
         xnL5SAgi/JtNpGFHCyiuqGi1WRm5mRRsGNFU/ibnzOvhkADP9uvVQAiAhcjdiWLuHdLW
         xgRyhDeDTT79QHpGcqvAsBLNMMRM+D9gMhSP4D4c9LLHKEPVjW/E/FOCC3h8HSD5Pc8D
         vUtOmVTg2KNFwhp1n1mLTknJOOU0g46h0/k+U1HEdFl/mDh1fK2tl53Pw1FYt0LxMZEO
         ROjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740073212; x=1740678012;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo/XU2sbk5tTBuBCxcMj8uYZYtE2Qa5FDlweole+YdI=;
        b=rQxstNBrCxDk0MRDjKHZfRdketPf4Onf1Pg5gGVBfNmqE1tIpKKb11kqXbzujLYsCG
         L5Li2exlLUHBxhRIao4C8SGJaE3u+0WCA9jaeEpwxNozss+JDDJXjgtx6vw9Wf18vt0O
         VrrONLtBPF/52mDxYTc4LLjQtBs62/WlvMn1mJLKhmUUwrYpk+vCcjmCLezE3tn7FOTB
         B6N6YTOaPv0jgsHmrtP8A0d4sQXufJpHEuEblviZMHu5pcrjFpXUOs1orlYUE5sJkH63
         bZM3TL7K7ScJ0s8cPQq3z7P/FzgmzK0f4mQ8gqqIXU963mAVXFYkkfRgR9ap+mD8pNgo
         0Mbg==
X-Forwarded-Encrypted: i=1; AJvYcCUM/Cw5N30FOMHpq/OecBEp/qWGiEG8PJejXXEq4MFiDQ5GpXBwtHqSUdjxRla82VrbjFZpAPMhthn2@lists.xenproject.org, AJvYcCWtpoogS9uzcrgIv8OmNZfDIi71vVzZfYo2n0dSEeZrAThA8d7bdaIDaQ4KD6oL6+GCDYXmn+aeE+GlIGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYe4r4K1/P3oAMMoa2oiwqLbmlJnvLUuXKKeZcos0NL/v5opz1
	uC/cdIgsw/XJ/NjYBEYvq6lBufKjRg5GbUCqfXdLunVmNxaVI5w+cv5oBQ==
X-Gm-Gg: ASbGncu7ko73uPQ/Igf1vD2QZDFOzclTlOYq2COEMH4cUU4fALWO6gTDnWyvhvfnmGi
	xzJOTD30IZyVeHOnH/xHybzJ1SEjtVaTNtKe8kv6/0qAdmSlh7NUhJYrtOmfs6t9wgObe2fjp5u
	vowIZ12qEL0/V6XT4ZETxNlh0Qh5cLnercmAs42gDrI09UgFWzuR2agrK7vtuDtTQyf2Lu9ncGU
	yOOeT8PfhbgOfCAgEqDNxCEo1EwjMzZsl3gGMbiK2Lzxe8B0PAtmcvxYYJsHoxIQ2iGmstxD8oV
	wcp/N03ycXc+wO65wmqOXv/d
X-Google-Smtp-Source: AGHT+IG8i8lU7sdKw7XP/V7o9VrbuNei2BfBEBlDkuODnRgkmqLT6aQ97kj6JCFSFwAB5A7CEtm93g==
X-Received: by 2002:a05:6512:2249:b0:545:b89:3098 with SMTP id 2adb3069b0e04-5462eef4813mr3891682e87.24.1740073211125;
        Thu, 20 Feb 2025 09:40:11 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------7gPF83Tm5fItVWA98Kq0MaHy"
Message-ID: <bdae8315-dcd0-44b0-909e-4d01352accd5@gmail.com>
Date: Thu, 20 Feb 2025 18:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>,
 xen-users@lists.xenproject.org, xen-announce@lists.xenproject.org,
 Community Manager <community.manager@xenproject.org>,
 committers@xenproject.org
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.20.0-rc5 is tagged

This is a multi-part message in MIME format.
--------------7gPF83Tm5fItVWA98Kq0MaHy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

Xen 4.20 rc5 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc5

For your convenience there is also a tarball and the signature at:
https://downloads.xenproject.org/release/xen/4.20.0-rc5/xen-4.20.0-rc5.tar.gz <https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz>

And the signature is at:
https://downloads.xenproject.org/release/xen/4.20.0-rc5/xen-4.20.0-rc5.tar.gz.sig <https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz.sig>

Please send bug reports and test reports to
xen-devel@lists.xenproject.org<mailto:xen-devel@lists.xenproject.org>.
When sending bug reports, please CC relevant maintainers and me
(oleskii.kurochko@gmail.com<mailto:oleskii.kurochko@gmail.com).

Have a good end of the week.

Best regards,
    Oleksii

--------------7gPF83Tm5fItVWA98Kq0MaHy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 51); white-space: pre-wrap; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi all,

Xen 4.20 rc5 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.20.0-rc5

For your convenience there is also a tarball and the signature at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;">https://downloads.xenproject.org/release/xen/4.20.0-rc5/xen-4.20.0-rc5.tar.gz</a>

And the signature is at:
<a
href="https://downloads.xenproject.org/release/xen/4.20.0-rc4/xen-4.20.0-rc4.tar.gz.sig"
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255); color: rgb(0, 0, 255); text-decoration: none;">https://downloads.xenproject.org/release/xen/4.20.0-rc5/xen-4.20.0-rc5.tar.gz.sig</a>

Please send bug reports and test reports to
<a class="moz-txt-link-abbreviated" href="mailto:xen-devel@lists.xenproject.org">xen-devel@lists.xenproject.org</a><a class="moz-txt-link-rfc2396E" href="mailto:xen-devel@lists.xenproject.org">&lt;mailto:xen-devel@lists.xenproject.org&gt;</a>.
When sending bug reports, please CC relevant maintainers and me
(<a class="moz-txt-link-abbreviated" href="mailto:oleskii.kurochko@gmail.com">oleskii.kurochko@gmail.com</a>&lt;<a class="moz-txt-link-freetext" href="mailto:oleskii.kurochko@gmail.com">mailto:oleskii.kurochko@gmail.com</a>).

Have a good end of the week.

Best regards,
   Oleksii</pre>
    <p></p>
  </body>
</html>

--------------7gPF83Tm5fItVWA98Kq0MaHy--

