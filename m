Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE534B174A6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066010.1431414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVmi-0006vK-DQ; Thu, 31 Jul 2025 16:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066010.1431414; Thu, 31 Jul 2025 16:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVmi-0006t8-AP; Thu, 31 Jul 2025 16:05:36 +0000
Received: by outflank-mailman (input) for mailman id 1066010;
 Thu, 31 Jul 2025 16:05:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVmg-0006t2-RN
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 16:05:34 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3077728a-6e28-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 18:05:34 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-af925cbd73aso78544166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 09:05:34 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c081sm127050566b.97.2025.07.31.09.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 09:05:32 -0700 (PDT)
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
X-Inumbo-ID: 3077728a-6e28-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977933; x=1754582733; darn=lists.xenproject.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ALaMm3KAbV/JSsq5mEovcxhM0ntMEs56Rk5xRZq9YEw=;
        b=BZIKSj2SpLx+Ba5lACGpmkKmw7L3QvfN89D4iZn46Keqpw0fmJ7qjD9g3Zq8vCX7vC
         2YVtm5b81rhpG3HV0UQIsrW1pHwsITlO5savovpmyhVNKGQ3ivZ0+7acPXwHhImeZEUw
         sYfSXrvxRQL7AqCpJID16zmtJmdMONpKXC6A6q+KG6IzLXSiTwGba7XDsUzL2ixy/tOf
         xW/SXu+/RBoQwu2Qx+aYTJfUM43Y3YTpWWpp+UTYOUi0588tYdo/fFluXlRmQRqar7tc
         CseXb4+IkS9/RpqLoKLodTcWJVF3joNOTDBdCLG7LrYTE52Les85nf+ebcEflBANnkt5
         Qa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977933; x=1754582733;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALaMm3KAbV/JSsq5mEovcxhM0ntMEs56Rk5xRZq9YEw=;
        b=NxR43sdBJNAh42yr9sK2xz5jky4S7j9bQUuusNgiTVBvkHo1qXda1/VH7vPLksZlQZ
         dHSEiJJnZZNzqJMqM2NfFuFpBGaVjvT4F6UQ5nwq+62ZZ/qSg1hwKf4jNoQ640vv3MuB
         gn9fXtmmo3exoB1j+glst8alJJC5WhbHz7eCiM0zgTzUK9LIGlKlO/ZWwUQKVwEVAl3Z
         qB+ajI2gLRV4cQjMbQsQum7oqrv7m3z7BtmkSYFtdpZlpSCHthcu8NjD0VHhfTBEG/Uh
         u9IBRwDZ5FxB646Lb8nrfZzC19Beop/Ht/+34MjdUDtlhUKFc+AmNEHVqxOPNisReVcs
         3ugQ==
X-Gm-Message-State: AOJu0Yxp9AsQEZJ2BHs3ZVGtzng+fxm+zmNpMFTD2HXZxdwrI9jbqYeD
	hjCIRUA8kjPPtQXiuVhHWZk4WvcaYxt0qpdJ7+5uTsBBxbL9LUGJXQEdg6l1wQ==
X-Gm-Gg: ASbGncvsQnio9h1TT8dDO6GV2FAghjHk3ncr8WjbDwOPVI6uVw3ComvfStcw9LzDKai
	wLkG3kSkAzM3MKFBegTh+lj5xTQmab2loS+jlmQ5CK8DkNmBN2KAgPg7dn591MWVlvoGlG3xB5S
	x7Sluzdo4FUVqJeECsy5y9YeEvkaPMnWKXhV5UvZYBPdRqu+6aGPewDCCyuKWMkHLyn8M5b4lHP
	0HKoWyN7tJFlDNofRdMVo2GfiCcIYWMlvJGfR32FK4Y/HHCpuN6V7LURPrP96FDXhsKG73v34+0
	0CTwGTirtGq9IO08uk0dE/MKNnuaCAXsKj/kyLOz/Tsxib2eCijsEUzfzjQJJWNCsLz1wkYAiUv
	6DEQ44ThGeaEcxWkWsl81bPJ6JFGsBoYC7gg0tpGJvaKKtN+sBKF8qNj7ai1dQ9gYGLaTOrI=
X-Google-Smtp-Source: AGHT+IERMtNyjzeRzTRQG4jKmS+pmg/lK53cIjJdDxu8r03ehyx1B/idvXe2JUSS3TrSRet7TvOjeA==
X-Received: by 2002:a17:906:9fd2:b0:ae0:c6fa:ef45 with SMTP id a640c23a62f3a-af8fd9ef545mr930395866b.41.1753977932972;
        Thu, 31 Jul 2025 09:05:32 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------wPDqQ8iJ5sRCcVH1fBbystgB"
Message-ID: <7372cb8d-82d8-43f4-9a34-4b60526cae76@gmail.com>
Date: Thu, 31 Jul 2025 18:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 Community Manager <community.manager@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Last posting date for Xen 4.21 is Fri Aug 08, 2025

This is a multi-part message in MIME format.
--------------wPDqQ8iJ5sRCcVH1fBbystgB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

The last posting date for Xen 4.21 is Fri Aug 08, 2025. If you want your
features to be included for the release, please make sure they are posted
for the first time before Fri Aug 08, 2025.

Full schedule can be found here:
   https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes

Best regards,
  Oleksii


--------------wPDqQ8iJ5sRCcVH1fBbystgB
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi all,

The last posting date for Xen 4.21 is Fri Aug 08, 2025. If you want your
features to be included for the release, please make sure they are posted
for the first time before Fri Aug 08, 2025.

Full schedule can be found here:
  <a class="moz-txt-link-freetext" href="https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes">https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes</a>

Best regards,
 Oleksii


</pre>
  </body>
</html>

--------------wPDqQ8iJ5sRCcVH1fBbystgB--

