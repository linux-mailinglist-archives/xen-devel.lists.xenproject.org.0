Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A36B3B5F0
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 10:24:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100866.1454140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruOl-00082G-WE; Fri, 29 Aug 2025 08:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100866.1454140; Fri, 29 Aug 2025 08:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uruOl-0007zo-T2; Fri, 29 Aug 2025 08:23:51 +0000
Received: by outflank-mailman (input) for mailman id 1100866;
 Fri, 29 Aug 2025 08:23:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LjVN=3J=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uruOl-0007zi-9i
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 08:23:51 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7da14f8a-84b1-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 10:23:50 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb78f5df4so310706866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 01:23:50 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-38.play-internet.pl.
 [109.243.64.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afefc7eedb5sm154643166b.6.2025.08.29.01.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 01:23:48 -0700 (PDT)
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
X-Inumbo-ID: 7da14f8a-84b1-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756455829; x=1757060629; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2BzkoZZ1sFyAEbwIhMMuSx1QvORDq+Ump/i0mVSkRos=;
        b=TWcTv0yzTRON4cdzMwJLXQZsW6AhG0ZyiGCAfkOt7UFjd0PhVw4PQKDpFhNI0ruG0n
         l16LiS0IXWmGFMWR9lGjEUb4fgt33G8nSB3hLb5R4TgCv/prXhOnX/ZDxSUD65WVlaBF
         aLDvqfd8eoyrTGk7DJPBqum/gE3TRCwcyaeWHUZ0sg2/23VpOBMExVZnRk+X9JV4tXzZ
         oZ05p7JzcGgnLfph1Jdr9HMZAdVCk5bFkQyfGR5REEnKqRUFjus1trHzAfJWz99eZrU/
         ftAxyflgKbOjqPtghK7ZTkocg2csAw8T+/8BnNE2utpfWg0v0VlvzOVz6AixxqK+Jnbx
         /WTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756455829; x=1757060629;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BzkoZZ1sFyAEbwIhMMuSx1QvORDq+Ump/i0mVSkRos=;
        b=ZhA4OSw/0l3AlZkdIczzPwkoEbo1L7YsBft1PrU1ZCjFm3g8uoPyKP/ln6Yj5+LBBv
         7XBPwMp/viZLZR9x1cU2wowgPIKfUz+dxU7IjA6PF8yxyMMsSRkPzC22mITUh5mwO71c
         OpHZarvUNEvNy9FjpxXqZufMtwFpSHyjP86mlH8UTIitJAq86m/hLLo+SaNByDMsDUtw
         EyT/sQcngTP0ejBtOOr//4PSj4JLhVHGM17V6T8fOOlKJs4HP2LwtVcvtnDHsrn0Vh5W
         Bwi5ceNo/ksCsUyjnzekSyt2GABVmE6SkTZTq8eDAWUv5crh2908QpjkvbIrXDQJ34Re
         fMmw==
X-Gm-Message-State: AOJu0YzY7qarCAa6Cj7gjE6WsKHq/fgb5gdamEJSkDK80gBmL+vH3rub
	YrIUNEeP/8vS84ix1O7ZAQzGRDqmA5wPZlEgpYz0yoyzrMl2TGpwdLmDqschgQ==
X-Gm-Gg: ASbGncs80tD3peftttmpxXoATNQbv8m+SbiBH6AkveNKebrWZdpbY5tEitGnwhssl+l
	p4R7TaGJ/vWkYjkHXrj9oZ9D5tioLxwJDoSGDEy8d0NFzWixw2aENMR1bMprJVx+efETraiTIaR
	oB3Ov+UTvmmQ8fTT8X+ubgf52prIfKsZOk8FX5qbl629ptAI79eY07BS9zBweYpYTka9PjxZG9F
	0/nGBb1zVpRAZ2m9qu4KookahW0/xp05gaHxFDlZncDzfPlhwgj8VUdf6DM0w/gIsnMvBFWtpCn
	b6h7nPF+xegtGxaX3/oH0cJ/yjkCwfHo3Q0vdaWejSHUCgsaRKY4YhUCA3RjOJxczOFNd7/r0+y
	jCdq9Bw7lmBzm3xmMDloOmxt3CLGGXl2K/vsWwjjLgl6oD5bN1C+EwMaMA5u9tLmhkXR6Y9I=
X-Google-Smtp-Source: AGHT+IHIliGvjzXdjJKlt/hCx5okVr+QM/vdOeHWZkYwyyWKbKavy5zAbJVUC01CO2MYlLTTxftKmA==
X-Received: by 2002:a17:907:96a9:b0:aff:8fe:357e with SMTP id a640c23a62f3a-aff08fe3952mr110091266b.60.1756455828889;
        Fri, 29 Aug 2025 01:23:48 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------0PZZI9GL0C2lCw8WsorB5PHG"
Message-ID: <4c248773-0f14-425b-b784-d5e9801f43f8@gmail.com>
Date: Fri, 29 Aug 2025 10:23:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>,
 Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Feature Freeze Extension until September 5, 2025

This is a multi-part message in MIME format.
--------------0PZZI9GL0C2lCw8WsorB5PHG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Community,

I would like to announce that the Feature Freeze period is extended until
*Friday, September 5, 2025*, as we have a number of patch series that
are very close to being merged.

Have a good day.

Best regards,
  Oleksii

--------------0PZZI9GL0C2lCw8WsorB5PHG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre data-start="147" data-end="177">Hello Community,</pre>
    <pre data-start="179" data-end="364">I would like to announce that the Feature Freeze period is extended until
<strong data-start="253" data-end="282">Friday, September 5, 2025</strong>, as we have a number of patch series that
are very close to being merged.</pre>
    <pre data-start="366" data-end="384">Have a good day.</pre>
    <pre data-start="386" data-end="411">Best regards,
 Oleksii</pre>
  </body>
</html>

--------------0PZZI9GL0C2lCw8WsorB5PHG--

