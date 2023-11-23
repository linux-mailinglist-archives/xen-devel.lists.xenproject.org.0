Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F847F63A2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 17:09:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639824.997512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFq-0002qc-Lu; Thu, 23 Nov 2023 16:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639824.997512; Thu, 23 Nov 2023 16:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6CFq-0002ot-Hq; Thu, 23 Nov 2023 16:08:38 +0000
Received: by outflank-mailman (input) for mailman id 639824;
 Thu, 23 Nov 2023 16:08:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RRmN=HE=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r6CFo-0002oi-Eo
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 16:08:36 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d9007b3-8a1a-11ee-9b0e-b553b5be7939;
 Thu, 23 Nov 2023 17:08:34 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50abbb23122so1266546e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Nov 2023 08:08:34 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e16-20020adffc50000000b003313902cef5sm1990361wrs.93.2023.11.23.08.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 08:08:33 -0800 (PST)
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
X-Inumbo-ID: 8d9007b3-8a1a-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700755714; x=1701360514; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aURyiyPiyMSneeqCTcKlO10Y28aLHY3qHYUNFP2aInA=;
        b=mLgEKT0QfqJQS9ReE38KdpHxa/f+E+86TNdWnwMqkpVhWIh0DgyX0LVGgo9FUpKKpR
         RTOwqHUHzOGpmKJ97u1P9eNSxtC/hKQ0AN5D8I1pJEbGFTKi8z/sI644FKWQtRaM5vdP
         RpMnUnXcN5BFRn3s2UFdHDO0YX0f9iybssKmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700755714; x=1701360514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aURyiyPiyMSneeqCTcKlO10Y28aLHY3qHYUNFP2aInA=;
        b=P92/o1q5Rr818LMpUyohrG5ai7F5x+qq9oZJMatiaSWu0mlgk6NXW7DDNCTFdd+9VK
         JDjPh/U006r1UVayAWCeEPzest30LdNMUvVUMsjKKja/i8S2ySkRpNjX0LhbQcWotO/T
         KDOdYa1XCFiG0larfHc7lZpcJoG2BYUEAHfSLdus47Q5tg/J92SuK2XHxjHv3tnWfhfj
         G0QFtOMVbdcscUyfsTmfCj+qqXlw2r7j6vHKAaNxdVjVbVHx6c2YFJcKMTGr1ZmGb4es
         7wc3WlISjzgY2glqiNVl8ANVgkin1dOSRFqjUlHUTDDZHu0pJ+ExTTZom3lpFbfTwZjS
         taGw==
X-Gm-Message-State: AOJu0YyYxgX3tAYhbppbvDoZvbZxb1XdRXVEUoY+2H1+sSrAUKxVTmLf
	K+Wk6KoBMqiruh8KVbcmxm1d1UycYXolg83jbQ8=
X-Google-Smtp-Source: AGHT+IFQPuz4aPLq3vD06A9vaxqJQj6gO2Ro5J9uQL232UexWniO+ll+opIfvIHm0d0+iHqc9uJ/jw==
X-Received: by 2002:a05:6512:159f:b0:503:36cb:5436 with SMTP id bp31-20020a056512159f00b0050336cb5436mr5669905lfb.9.1700755713720;
        Thu, 23 Nov 2023 08:08:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/2] livepatch-build-tools: fixes for non GNU tools
Date: Thu, 23 Nov 2023 17:05:33 +0100
Message-ID: <20231123160535.18658-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

A couple more fixes to allow the usage of livepatch-build-tools with non
GNU utilities.  Shouldn't introduce any functional change.

Thanks, Roger.

Roger Pau Monne (2):
  livepatch-build-tools: remove usage of gawk
  livepatch-build-tools: do not use readlink -m option

 livepatch-build | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)


base-commit: e588b7914e7afa3abb64b15a32fc2fdb57ded341
-- 
2.43.0


