Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F6EC2D3B8
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 17:48:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155460.1484952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFxjL-0007re-N4; Mon, 03 Nov 2025 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155460.1484952; Mon, 03 Nov 2025 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFxjL-0007pU-JM; Mon, 03 Nov 2025 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 1155460;
 Mon, 03 Nov 2025 16:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5Dp=5L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vFxjK-0007ix-72
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 16:48:30 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec45124b-b8d4-11f0-980a-7dc792cee155;
 Mon, 03 Nov 2025 17:48:28 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so2784753a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Nov 2025 08:48:28 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b710709270bsm296837166b.21.2025.11.03.08.48.26
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Nov 2025 08:48:27 -0800 (PST)
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
X-Inumbo-ID: ec45124b-b8d4-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762188508; x=1762793308; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=00l7RiZz8HXspLJB30M47vbkOxUg/EJS2mfYagz5+Vs=;
        b=gT39pBfZS4MPOrf0mS5qfbnvLmhpAL1+S8AuHDNnokOQvGsMvukYDRqCQykWK3CGiB
         VzoUWiEKYk0VLr9mIwbMwp3Zwxp4gmvU6rnp3fXXGlS5jtW3/J5euSE2UIozyM4L7RHg
         WD02mXAmLgp3nb/FqdMtXz3qgxJXcwcrlivceNhJYv6WjheMsqhO6PUG565scp9LnqPf
         FHVyqLNOOavq3RbWdeg2f9oyf2jKG7S9rMfTHQWeahIzaNe5b+im9PnC++x4qDfICQPI
         NksFBLkRDVxnkxN2AsGi4cJBq0FsEkXz+MCGwgoX4J6tOuzgQ/fqSEL2f5PO78nZ5iQu
         SQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762188508; x=1762793308;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00l7RiZz8HXspLJB30M47vbkOxUg/EJS2mfYagz5+Vs=;
        b=FeX/PbQE7Tkcl5nWG6ahWEl+gR3H+89Dw7EXcv8Q/u/z7aPlRsDXSOkv2fCirnP3B3
         2ydHl/VMwsNqhf3nNqyNhhJB8ze9XXXJE8CsGZo7jVJZifHQkueZvEf40EvajZHk5sSN
         tn8dxK6UFiKhsr2FsgChMu+p7jsVBhf1qlAjz4fEpVYPGB1fvENh2Du7blC8Yna0dhla
         tz9tKTg8UfF8myUn4TRUGOc5vVOYEG2Mswirr1hcTdyTbOqSl6xN9XCyMuiIReNCnUfc
         lhnwRNDmziecs0yHiHVGHGfo3F/Lvrw82x8J+D1cBXOFmWzkni7q0GZgz20KV0juCi79
         gGsA==
X-Gm-Message-State: AOJu0Yx+rHryNy1KtBscsCMSIZjaI7fBPNNq8761HXsPU8pzJWhnMghr
	RJfcsojxkj7NCV7l1/mqwr2LBYA4u+GgPZ205LcD7YdKwKWi9cp5oDxOy+kNKw==
X-Gm-Gg: ASbGncvdiNn5t8gexnfYdWZNke436qfRgRplKupVDzvsuBnhHXVj5PTAcVLUsaxXAE0
	N8pYE7S4cZcivudk+1zyT9GRfKHFarCB88hTCqLx1G7IJu2qaciDNpU5dZ/Vn9s1XWe9d+M1i1W
	P01aizGGYk/61/3DsMOlLSXe2VsnE3xroTTCbgyZOi2eYN5rSheQxYMoxnhIsbpg7bMh7Phdi/h
	m+R2gDJF7dQi+9hs1YmWhzmNnvyi7w2O4k7O1qHEiYloUc5RMIU6Heagqml1m0c/2JtpcHDHy0l
	qzpwDv3SrL+4mEuL8nT2bARD+ykM260H2BrlOtCvCZeyw2kKF3qJJL5vmWdStUoTFDt+LxAe1al
	LjqJ9vJw1so0TSvaPqJaWCcyp0d9CwP6Fr2p3ge8YdDvDUW4PYRtfHuVXofbi/avK6+rje4QuFP
	mSkoN//B7CnOvSP/bJM2cpFi9vTZVuk4+gyzqPWPIeq2uIBbxgVyTCzTH6VltR
X-Google-Smtp-Source: AGHT+IEj3w7tV4xHJEYJYjs5OVo8U0t5kTrm224lMMAc4jHEb8inXSUl3Pfn0gw4C1W+9BJbU5WEZQ==
X-Received: by 2002:a17:907:7ba3:b0:b45:1063:fb62 with SMTP id a640c23a62f3a-b707019f735mr1303451866b.24.1762188507657;
        Mon, 03 Nov 2025 08:48:27 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------tkvSb5RnYcYjlIEZ6XZlO2Rk"
Message-ID: <2e6fbd4e-7285-4d03-8f30-c756fcc1547a@gmail.com>
Date: Mon, 3 Nov 2025 17:48:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [ANNOUNCEMENT] Xen 4.21.0-rc3 is tagged

This is a multi-part message in MIME format.
--------------tkvSb5RnYcYjlIEZ6XZlO2Rk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Xen 4.21 rc3 is tagged. You can check that out from xen.git: 
git://xenbits.xen.org/xen.git <http://xenbits.xen.org/xen.git> 4.21.0-rc3

For your convenience there is also a tarball and the signature at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc3/xen-4.21.0-rc3.tar.gz <https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz>

And the signature is at:
   https://downloads.xenproject.org/release/xen/4.21.0-rc3/xen-4.21.0-rc3.tar.gz.sig <https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig>

Have a nice week!

~ Oleksii


--------------tkvSb5RnYcYjlIEZ6XZlO2Rk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre id="m_5618967425681729801b"
style="white-space: pre-wrap; color: rgb(34, 34, 34); font-size: 13px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; font-family: monospace; background: rgb(255, 255, 255);">Hello everyone,

<span
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">Xen 4.21 rc3 is tagged. You can check that out from xen.git:
</span><span
style="font-size: 13px; font-family: monospace; background: rgb(255, 255, 255);">  git://<a
    href="http://xenbits.xen.org/xen.git" target="_blank"
data-saferedirecturl="https://www.google.com/url?q=http://xenbits.xen.org/xen.git&amp;source=gmail&amp;ust=1762274889187000&amp;usg=AOvVaw13wgFl3zrhLM4YXGGqRUGg"
    style="color: rgb(17, 85, 204);">xenbits.xen.org/xen.git</a> 4.21.0-rc3</span>

For your convenience there is also a tarball and the signature at:
  <a
href="https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz"
    target="_blank"
data-saferedirecturl="https://www.google.com/url?q=https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz&amp;source=gmail&amp;ust=1762274889187000&amp;usg=AOvVaw1u4oaCcMXcEY33Fo9mgt47"
    style="color: rgb(17, 85, 204);">https://downloads.xenproject.<wbr>org/release/xen/4.21.0-rc3/<wbr>xen-4.21.0-rc3.tar.gz</a>

And the signature is at:
  <a
href="https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig"
    target="_blank"
data-saferedirecturl="https://www.google.com/url?q=https://downloads.xenproject.org/release/xen/4.21.0-rc2/xen-4.21.0-rc2.tar.gz.sig&amp;source=gmail&amp;ust=1762274889188000&amp;usg=AOvVaw271uBhxEJ7rgwu1nHkaCVv"
    style="color: rgb(17, 85, 204);">https://downloads.xenproject.<wbr>org/release/xen/4.21.0-rc3/<wbr>xen-4.21.0-rc3.tar.gz.sig</a>

Have a nice week!

~ Oleksii</pre>
    <p><br>
    </p>
  </body>
</html>

--------------tkvSb5RnYcYjlIEZ6XZlO2Rk--

