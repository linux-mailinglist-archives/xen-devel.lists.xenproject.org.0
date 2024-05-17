Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1258C8260
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 10:07:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723899.1129035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sc1-0004a7-Se; Fri, 17 May 2024 08:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723899.1129035; Fri, 17 May 2024 08:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7sc1-0004Xb-Pq; Fri, 17 May 2024 08:06:45 +0000
Received: by outflank-mailman (input) for mailman id 723899;
 Fri, 17 May 2024 08:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q70L=MU=cloud.com=christian.lindig@srs-se1.protection.inumbo.net>)
 id 1s7sc0-0004XV-NE
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 08:06:44 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65ec4a14-1424-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 10:06:43 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so639222e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 01:06:43 -0700 (PDT)
Received: from smtpclient.apple ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781cf91sm1087447766b.1.2024.05.17.01.06.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2024 01:06:42 -0700 (PDT)
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
X-Inumbo-ID: 65ec4a14-1424-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715933203; x=1716538003; darn=lists.xenproject.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxV1hJF49YePmCkWfVoIRzVzYu9CpcUHmXWTZF3b13c=;
        b=MJkO6fSbxNS0+PB5X2li0CrRsEKXwWSqcZoKRQF5rhGgmVLVuyBEuqwzdfqcHFIlBG
         5/Db2Dy2Ckne89w+CCYKrRXK8dnas1jVSTnYfZYbCFfM0FAp4F3YcMUxeAt8nkO8+OS0
         bCR9DSvhNi2lbpIeUC/0keLYE4XlY3MG2nbJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715933203; x=1716538003;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxV1hJF49YePmCkWfVoIRzVzYu9CpcUHmXWTZF3b13c=;
        b=Ze6ojv4mJcmgV62CmuU6HVj5hJ3CWwxax+spIebqj6UhBL5poYDr+5Y+DqTq5ZPiXj
         AEcy2xdw6v6twnN/1jIkg+onw36oDwSIhlSMVzhYHWEkd9rg4zbhy91G6FUOBZLZL1+M
         YPd0CsYIBO4qOeTTXAntcrfEcyikFVOAdev6EdBskFR+i+40L9RA+BUJwvgcoYIQUff/
         0KEE9konCh5FiES+IYFMAE+lVUmmB9JlGTq+iDTqTTdNVJ1Dr++VhvgAqDScwvaiR7ou
         dZ3bO8PFAA4j7bQ53XArsM+ShAgdLOFyTrOnBSBoNhMQfT1lBlwx6v552m2QKGymk0XH
         eFkg==
X-Gm-Message-State: AOJu0YyFd8c19kLanLqYTZZQm0GZs2vhngYeF2HxW1MU7IYraXYQScYk
	tgPQSi48EKchgz/hOfDQtdIeYTpLVktbSQac43TGLXmMnn0mTDTDgyfFt+/TAbg=
X-Google-Smtp-Source: AGHT+IGOfFUSvTUnVB89H81Wq5EJL4RINiDv7O/pKP6TVa0pl30QgRGD06Xsp+wwOxeR85ni4aN7iQ==
X-Received: by 2002:a05:6512:2310:b0:51b:9254:91e7 with SMTP id 2adb3069b0e04-5236e7185abmr10038677e87.61.1715933202396;
        Fri, 17 May 2024 01:06:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v2 for-4.19 0/4] Drop libsystemd
From: Christian Lindig <christian.lindig@cloud.com>
In-Reply-To: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
Date: Fri, 17 May 2024 09:06:30 +0100
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Juergen Gross <jgross@suse.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Christian Lindig <christian.lindig@citrix.com>,
 =?utf-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>
Content-Transfer-Encoding: 7bit
Message-Id: <C4B17A26-6959-43AC-8ABC-9F8BEF4EFCEC@cloud.com>
References: <20240516185804.3309725-1-andrew.cooper3@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)



> On 16 May 2024, at 19:58, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> 
> On advise from the systemd leadership.
> 
> v2:
> * Import the free-standing example and use that to retain existing
>   functionality.
> 
> Andrew Cooper (4):
>  LICENSES: Add MIT-0 (MIT No Attribution)
>  tools: Import standalone sd_notify() implementation from systemd
>  tools/{c,o}xenstored: Don't link against libsystemd
>  tools: Drop libsystemd as a dependency
> 
> LICENSES/MIT-0                                |  31 +++
> automation/build/archlinux/current.dockerfile |   1 +
> .../build/suse/opensuse-leap.dockerfile       |   1 +
> .../build/suse/opensuse-tumbleweed.dockerfile |   1 +
> automation/build/ubuntu/focal.dockerfile      |   1 +
> config/Tools.mk.in                            |   2 -
> m4/systemd.m4                                 |   9 -
> tools/configure                               | 256 ------------------
> tools/include/xen-sd-notify.h                 |  98 +++++++
> tools/ocaml/xenstored/Makefile                |   2 -
> tools/ocaml/xenstored/systemd_stubs.c         |   2 +-
> tools/xenstored/Makefile                      |   5 -
> tools/xenstored/posix.c                       |   4 +-
> 13 files changed, 136 insertions(+), 277 deletions(-)
> create mode 100644 LICENSES/MIT-0
> create mode 100644 tools/include/xen-sd-notify.h
> 
> 
> base-commit: 977d98e67c2e929c62aa1f495fc4c6341c45abb5
> -- 
> 2.30.2
> 

Acked-by: Christian Lindig <christian.lindig@cloud.com>


