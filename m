Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96906A67D39
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 20:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919820.1324179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucpB-0001HT-Mx; Tue, 18 Mar 2025 19:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919820.1324179; Tue, 18 Mar 2025 19:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tucpB-0001El-JG; Tue, 18 Mar 2025 19:42:05 +0000
Received: by outflank-mailman (input) for mailman id 919820;
 Tue, 18 Mar 2025 19:42:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZzY=WF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tucp9-0001Ef-B1
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 19:42:03 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 100bce69-0431-11f0-9abc-95dc52dad729;
 Tue, 18 Mar 2025 20:42:02 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-abbd96bef64so1059424666b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 12:42:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aec28sm911756866b.12.2025.03.18.12.42.00
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 12:42:00 -0700 (PDT)
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
X-Inumbo-ID: 100bce69-0431-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742326921; x=1742931721; darn=lists.xenproject.org;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yMfa+v19HXgoC++sUdgkuVlYUAFkmTc/L/XmLwMMcI4=;
        b=PlpwFPyrCxtnU/RAQP4KoP3OhGNCcJukgGyLXHnQM7UCZxWFKpVBk+3xZaJOzhLykc
         /uYSFwNux9gVkhUPQhV2W5MPsegsAZTLvUvbdbrKF/E0+ZUlOnOC2SSL5bd8Bqr7RoAW
         5WrGkCr2SijB98ozkUXeepmA0ErEXLGlGeTbt0jpiBszbE8i99gQjmDkUdL9IvhN00z/
         Mgq+JpiQytn3hH0McP031OXa2uZEbXyEyEPT5gYIbDZ3+UH0Sgztzi5XAckHV8Q+EVrB
         nSpa4uVIt0kXxb01Tn4cFUh0RExRSyccQRnO2wRiD57kG/lfOHZHYHYCD2ETsUT5//8I
         e/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742326921; x=1742931721;
        h=subject:from:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yMfa+v19HXgoC++sUdgkuVlYUAFkmTc/L/XmLwMMcI4=;
        b=VxjI1L0NXI3bHGj3GCZ/EBVZNQMomrxAoRDen6OWLHfOrjzTj+JnqyecpRbztZRvBR
         5dpeVl9NiPt/R0XPru62u4seBlh+2O5bDqXlstFlGxzC++nCruJBMCLGUScSW1jKu+8d
         r70q5hsZE+pi1FlZmNDiR57aEs+X5NNBovW1F7GF473+z8bVdMNTBQWy2TZy0k6tnAzs
         mqeuwOPt50y1TyPCJj2QRqp6ntfM+6I5il9jVLoUvVoYEjSkfNw3hvRZr4QAB7i+xtli
         WtPdpPwzFF6W1DZfW5so7gw8ECL85XyKVawjeAxUjFKMxzZazNdVlN6+C7kuzII0qBts
         4h9A==
X-Gm-Message-State: AOJu0YwjApiQPPJEmZp+NlnPjHtVcbSzkHfdWVAIZJnpPXY2oAMFAvmX
	LtGmsYbXWaXqYCe07ruD4tJ+AFUZURz78gDMi/nqLC0mbf24WoX8Das00Q==
X-Gm-Gg: ASbGncveZAMrzuLqwtQLKHFcQPOMRDqhu52VPY5k1kuGLIyY5dVnbQFQ9ealqRKs/76
	TK8PflV6V9koVtQHJcrmurwrod2ajQbWfjK8PYAjZluSjTl/6n4UWbzbqdPvuPt4ORCQmYI5du8
	A9obRHqDdnXtAMnhqwqsAe8/B53smLKgHn0icqYWS/3BKV9jNTDpxXwPrsnnR2Zrp0PyhjaLKxY
	xs8fGTFBgOuBtZPHnjx3goOksPTjAuW2fNcnocX+fI54xsZLAAkPGVl33dONAPWsBMZu5U3X/2w
	cWStYu85A6nTyjM4DUqEPZSx2JMWSTr1Ccn81c4k9EIMU5GCkDlrrHAA7i09lr2EOfkJ84tsCIs
	s+J1tZDq/GCgltaSpzUSL
X-Google-Smtp-Source: AGHT+IGIAJ8RH8/3O4BdJoYm/7IFQ8EvrEVbgqdzvHNZ2AK4asDZaPICC7Ynv092MAChFvyZU/H5tg==
X-Received: by 2002:a17:907:7f94:b0:ac3:abd6:8da9 with SMTP id a640c23a62f3a-ac3b32e389amr39851666b.44.1742326920781;
        Tue, 18 Mar 2025 12:42:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------kuMzBbnZO86SF93jjj0oXUI1"
Message-ID: <f4e77148-f422-44c6-a064-baaf2dbf1a2d@gmail.com>
Date: Tue, 18 Mar 2025 20:42:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Call for next release manager

This is a multi-part message in MIME format.
--------------kuMzBbnZO86SF93jjj0oXUI1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi everyone,

I have been the release manager for the past two releases, and I wanted to check
if anyone else would be interested in taking on this role for the next cycle.

If someone interested, please feel free to reply to this email or bring it up
during our community call.
If no one steps forward, I’d be happy to continue as the release manager.

Looking forward to your responses!

Best regards,
  Oleksii

--------------kuMzBbnZO86SF93jjj0oXUI1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <pre>Hi everyone,

I have been the release manager for the past two releases, and I wanted to check
if anyone else would be interested in taking on this role for the next cycle.

If someone interested, please feel free to reply to this email or bring it up
during our community call.
If no one steps forward, I’d be happy to continue as the release manager.

Looking forward to your responses!

Best regards,
 Oleksii</pre>
  </body>
</html>

--------------kuMzBbnZO86SF93jjj0oXUI1--

