Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380771A2466
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 16:57:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMC8K-0006jE-Jw; Wed, 08 Apr 2020 14:56:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M0gu=5Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jMC8I-0006j9-P7
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 14:56:50 +0000
X-Inumbo-ID: 2cc45be0-79a9-11ea-b58d-bc764e2007e4
Received: from mail-ed1-x531.google.com (unknown [2a00:1450:4864:20::531])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cc45be0-79a9-11ea-b58d-bc764e2007e4;
 Wed, 08 Apr 2020 14:56:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id cw6so8862687edb.9
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2020 07:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=w2bNjyeNbR8dDoyFIG9+onqF8z4JwEVYO6Q75i1PMZM=;
 b=SW95wqrmyF4y8WQHhmplrhdX5fZoNfOK0Laa8q5teEl3xiVDy8o5KLIIrzIBGG2r1m
 t4fGlPMZ/CshRUj+AJckuMRMqVlZy7KvQeAJMqgN9pmvvf4QevbGKZBubjHGtHNEPv8A
 FeSOCJ3mj89xFPNoaWVyGNdPUD67qFKiZhR31pNlJQCjQv+03M6zF3d8yTkiYeooc8lQ
 uwSbT8es28tFIKosC85D8O0WzAD3QB/UVOJ/nQ1FYD7Zhx6Fem9iBHQyv6wk2tkEeWwI
 IjYqaoFgmzVhTvAWAk9G5qttbEbLxM51d3jarO28i/Pgs/T75c6BpodnPUxsoMTqTnBf
 SwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=w2bNjyeNbR8dDoyFIG9+onqF8z4JwEVYO6Q75i1PMZM=;
 b=BFyeFSBON1eE/WTYjcZZhXwZFTAgMovR42Ty8zb5fWFbyp6bAK7Ir71iWaREVHEZbK
 aToikT425M7crih+5wQecPgAO2VJG4vgtN+spH4kSePl/ZA0qJsdUBTCyqnRCXleJoNX
 oG1cs8rVIXy9LuyQRI30as29Nl5uT7NjpwslWL10jKT2D8LzlHAfIsU/Ig59BgDtYB+H
 GHosp284PU5UHdVhH2CMJpDy5cUYKzk9bzKKyvP2wqXJZKkUiFGFjfCxGBrX3auy4mM6
 V/G4S1FPESHrx5tc/FaAQshe2cGMQER7ygSCHkYE1IrzCzpEvsyUR0WcIFMOb1JHUwBa
 rE2A==
X-Gm-Message-State: AGi0PuaaS8buQl0qKWG3EJ9DnnbFyg1XqMGZwbLcXwmt8J4VR0yZItz6
 HODLWoqpgJvOg4kULfFFyfk=
X-Google-Smtp-Source: APiQypLVSpvlUPHxjdaaLBZa4OzXmNMbDhxKM1yp8xyc7mWY5FOzuOxU9Q75L4JlTNnenEXWoeZBZA==
X-Received: by 2002:a50:ef16:: with SMTP id m22mr6943938eds.82.1586357809248; 
 Wed, 08 Apr 2020 07:56:49 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id i23sm2953133edr.54.2020.04.08.07.56.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Apr 2020 07:56:48 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Maximilian Heyne'" <mheyne@amazon.de>, <xen-devel@lists.xenproject.org>
References: <20200313123316.122003-1-mheyne@amazon.de>
 <20200313123316.122003-4-mheyne@amazon.de>
In-Reply-To: <20200313123316.122003-4-mheyne@amazon.de>
Subject: RE: [PATCH 3/3] xen: cleanup IOREQ server on exit
Date: Wed, 8 Apr 2020 15:56:47 +0100
Message-ID: <004c01d60db5$eddfff10$c99ffd30$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGvBAjA7hxOW9V3ZNauiodGQFqJFQH4ZnISqK2Qu8A=
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Ian Jackson' <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Maximilian Heyne <mheyne@amazon.de>
> Sent: 13 March 2020 12:33
> To: xen-devel@lists.xenproject.org
> Cc: Ian Jackson <ian.jackson@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: [PATCH 3/3] xen: cleanup IOREQ server on exit
> 
> Use the backported Notifier interface to register an atexit handler to
> cleanup the IOREQ server. This is required since Xen commit a5a180f9
> ("x86/domain: don't destroy IOREQ servers on soft reset") is introduced
> which requires Qemu to explicitly close the IOREQ server.
> 
> This is can be seen as a backport of ba7fdd64 ("xen: cleanup IOREQ
> server on exit").
> 
> Signed-off-by: Maximilian Heyne <mheyne@amazon.de>

Reviewed-by: Paul Durrant <paul@xen.org>


