Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512038B33EE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 11:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712605.1113411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hqt-0004xL-P2; Fri, 26 Apr 2024 09:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712605.1113411; Fri, 26 Apr 2024 09:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Hqt-0004uy-Lg; Fri, 26 Apr 2024 09:26:43 +0000
Received: by outflank-mailman (input) for mailman id 712605;
 Fri, 26 Apr 2024 09:26:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6fR+=L7=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1s0Hqs-0004Dy-A5
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 09:26:42 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 169a0c6a-03af-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 11:26:40 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e6acb39d4so2384738a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 02:26:40 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm9770934eda.96.2024.04.26.02.26.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Apr 2024 02:26:39 -0700 (PDT)
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
X-Inumbo-ID: 169a0c6a-03af-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714123600; x=1714728400; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N32NRcpopNjHd1DfO88xoFNUzUXDyaEjvtd+l55qx+s=;
        b=fMEhI6IiG+68O3yzRQEmvFwSsFISQNgpUlpLBah37IXQGl0QtV3JVd2GDRC1CoFnRj
         ZLVgLFh/CQWRSifFFivQnMP1ussr9+HZttAudM7ukLsVmfixGY3fTGELDx7K3Pj3x4zZ
         JcI7x53IHQpcg9iw1lC5Imf4qJSCeraXkb3tY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714123600; x=1714728400;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N32NRcpopNjHd1DfO88xoFNUzUXDyaEjvtd+l55qx+s=;
        b=GeMmn1H5AlZ46HQUoE2l/xqq2jlms+cRpC4oksjbqo8tMt87eWw7+LfMXbtDv+QoBf
         KNL3YscDWZUb5hBAqV2Z6tD4mllwzoxLN5eHGbx2/rkodkpluRJCPbz8YHCqiHqFsfcg
         XoEyuI+83P9PNcS7vKrL5rZPUE6B6X/yKLVas85k0QtRAeu/d50bkdA1aCAiK+b+mKH8
         5KzWwXSxfUN6+PDtyRSBArfEQ8VsCTd1HE8Z+6S5GPCwtvISFKW7lVrXv/kuRbvxknvU
         SNGBMbIMvuxepC4tZbcImIbfF6H2Vb4SYaUKmjaF51fjd8/VNEcv+EzhPgZ/P3Abgsdo
         cPAw==
X-Gm-Message-State: AOJu0Yzf5ZRXRGtzSqFEIhW/MpXBNIp1aUiH3JkYd2/GgIhPmC03jrIO
	Pa1dU2ehFbD+5YG3btzuthIbxAzrEZsdb6JfVce4TLUiY9LBt5ZxZ8pEF6iOPHw=
X-Google-Smtp-Source: AGHT+IFiahPKAAYNWfJlrqrkilTCUqUzjDnoFMli2fbfj8iG9pDdhRTT+2xd48Z0oDYoGQezs4pEnQ==
X-Received: by 2002:a50:9fc1:0:b0:570:3b1:5aa2 with SMTP id c59-20020a509fc1000000b0057003b15aa2mr1292059edf.32.1714123600142;
        Fri, 26 Apr 2024 02:26:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 0/2] Drop libsystemd
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240425173216.410940-1-andrew.cooper3@citrix.com>
Date: Fri, 26 Apr 2024 10:26:28 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EB058553-0C88-425B-A778-2ECCE8A7CC5E@cloud.com>
References: <20240425173216.410940-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 25 Apr 2024, at 18:32, Andrew Cooper <andrew.cooper3@citrix.com> =
wrote:
>=20
> On advise from the systemd leadership.  See patch 1 for details.
>=20
> Andrew Cooper (2):
>  tools/{c,o}xenstored: Don't link against libsystemd
>  tools: Drop libsystemd as a dependency

Acked-by: Christian Lindig <christian.lindig@cloud.com>

I agree with the general direction of limiting exposure to systemd =
libraries. The exact way is currently being debated.

=E2=80=94 C=

