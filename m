Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF886C61B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 10:56:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686909.1069499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd90-00075p-BD; Thu, 29 Feb 2024 09:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686909.1069499; Thu, 29 Feb 2024 09:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfd90-000748-8O; Thu, 29 Feb 2024 09:56:02 +0000
Received: by outflank-mailman (input) for mailman id 686909;
 Thu, 29 Feb 2024 09:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xh/y=KG=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rfd8y-000742-O5
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 09:56:00 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcf2dba3-d6e8-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 10:55:59 +0100 (CET)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-68fb3a3f1c5so3513646d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 01:55:59 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 nh7-20020a056214390700b0068f35e9e9a2sm562125qvb.8.2024.02.29.01.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 01:55:57 -0800 (PST)
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
X-Inumbo-ID: bcf2dba3-d6e8-11ee-afd8-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709200558; x=1709805358; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=09Gvp0FqPrs4OCB/d8XxpIF80agD7996UJLIpBx9qPk=;
        b=tOFAvGdwonq+A4FdFr2+Nl5Clqc6vQlp1o3iy66Pg8YFZlPkXQFlzsz4ukyq9s6da/
         4eUQa2m7pKzfANsUg8pa0zOppMVhRZgVVNfls1kEf8WzkFOLswLl41HiEXOCHElfzPti
         94h4rHBlu1mwANbsIJE6dgKRSKoiRmndcftn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709200558; x=1709805358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=09Gvp0FqPrs4OCB/d8XxpIF80agD7996UJLIpBx9qPk=;
        b=XHhbLnt41Bc1RD78WzhVUw8q+Aj2kjkc2PhqEduTqlHOcGXHR8BxouvGUsOVUsuEg2
         6wpsOwzxSAfOqur+BpBBSNRaMl6ZiuKLLKS+KtQjoDTfF/2ZBGRSb/Z48kmBJtJOIaNB
         2IOqV9k6i+DwBFMJBz3l37MdAqmC4/VbixVGzqqS0DbKh/r138+eG6CKXZsWTWam9I2S
         KbIE2vi28qgt2zTzfnPfv5QeR51OSQLsRdfS2vDTlw6+JQtQZeJOE4tUj8IBHlQcO64i
         L/Vkhwe8joWWpely4rJZXfeM1eiaREzJH0FCBKJQ1lVDEbbNdDoZMu/tVUuMzgWfiW64
         ifKA==
X-Gm-Message-State: AOJu0Yyp/GieesrNH2u7gNa4JnbdLTv69pKv/UBbKDxk5Mw6Sk0kyNSJ
	xpDPSwEpQbuV7Wu79SB3/4m3GMS02SF9gXZlCI2RWwTiGXDQlGn1x+0jlQv+Rtp5AJfQW0QfRsK
	I
X-Google-Smtp-Source: AGHT+IGRHRg4kDIvqPMEQtw2h50mzs4HISfZldU38u09+ifRS3hv+VLMcpw/n5LNL405fsibNskB+w==
X-Received: by 2002:a0c:9a9a:0:b0:68f:e80f:a27c with SMTP id y26-20020a0c9a9a000000b0068fe80fa27cmr1545620qvd.47.1709200557783;
        Thu, 29 Feb 2024 01:55:57 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 0/2] Restrict Clang/LLVM supported versions
Date: Thu, 29 Feb 2024 10:55:27 +0100
Message-ID: <20240229095529.17723-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

The following series limits the supported versions of Clang to what I
actually care about, as I seem to be the only one that actively uses
Clang/LLVM builds of Xen.

Patch 2 adds non-debug tests for -clang builds.

Thanks, Roger.

Roger Pau Monne (2):
  README: bump minimum required clang/llvm version
  automation: introduce non debug clang based tests

 README                          |  2 +-
 automation/gitlab-ci/build.yaml | 45 ---------------------------------
 automation/gitlab-ci/test.yaml  | 18 +++++++++++--
 3 files changed, 17 insertions(+), 48 deletions(-)

-- 
2.44.0


