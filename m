Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9207D935149
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 19:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760678.1170573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUV3R-0003Pj-J5; Thu, 18 Jul 2024 17:36:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760678.1170573; Thu, 18 Jul 2024 17:36:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUV3R-0003ND-GC; Thu, 18 Jul 2024 17:36:33 +0000
Received: by outflank-mailman (input) for mailman id 760678;
 Thu, 18 Jul 2024 17:36:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MiOu=OS=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sUV3Q-0003N7-Dz
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 17:36:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45146824-452c-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 19:36:31 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77b60cafecso105886766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 10:36:31 -0700 (PDT)
Received: from localhost ([185.25.67.249]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc81ddf5sm581927566b.191.2024.07.18.10.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 10:36:30 -0700 (PDT)
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
X-Inumbo-ID: 45146824-452c-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1721324191; x=1721928991; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Us40ohKc8SVL5iuesi02O5HQYFBQ+xnDu9VyYFEiNw=;
        b=Cbtn5XVLhdhIH8kVeWxkMsWJIYu8/y9eFudYq9AXNf5MXcHhO51lZU0RRo1aH7nDAE
         rqpCd4nzZacF/JnpOOXhAFZxy7r4/7lxHz0e06AyzPFwK7JbCWDQ4OPgOob3JGKdzC4j
         4dcRXsJJAbDJZ5fhU4CLncbPER/91+PmIHhOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721324191; x=1721928991;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Us40ohKc8SVL5iuesi02O5HQYFBQ+xnDu9VyYFEiNw=;
        b=wPhCLjjLVS5Ns0rs/+FnlPbKDWBX2htoXI+Z2CcM2NnWSylw3cKYH6vCBDlWkTrrdJ
         U5RvZbs0PjmzIFbfmAYF2SyCg/z+e+NeWNX6fBis8y7eHNgxqwOrs9XyGFESZpXscNi2
         Ulh2Bbfw7X8oxukePa/GEbD+jpM9f8PzdfQMR6KyQ81LNg+Y93fK/6Kk0tttJupvpDdC
         Ulf6oUPUMD21Wq78fpooY/1ogUPmbJJ/nLXIFzBqZwFFvKN32EAMS1rXEZoj3FCeu90y
         DszWVbCsh2ObnenTpT0ddxcP8HIyroPKY8XyTtoT1aTc3BkyfwzY8A9QL7/0p3Mi9xvZ
         /7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUh2YmlujcRuF2NnEZVjsOYW1U+aWrjKE+JWeN6Tf2iSdSyNXjGjfEv+RiQv2tQFHcZjpNawFBimj984IB8s7vuGKilNCSzAAyXGqPJsuw=
X-Gm-Message-State: AOJu0YwIsitbV18rTxC6nf8vGhLBPmBzwv38FUK+LiadWBVrZMWzkA6c
	BtCnhRNSRhjuA++hrJ6UY34pV35LQ3Cp0d662//MNfL2B5/tcEuBvSlm14j9iTs=
X-Google-Smtp-Source: AGHT+IGAb5WXQ8HndK/HoCdyvF7A1SQzgrq5icnSVcsdoJ/3suDs2XF3zezsvn45LHJDQ/PvTJE8Yw==
X-Received: by 2002:a17:906:7d48:b0:a77:da14:8401 with SMTP id a640c23a62f3a-a7a011382dbmr374534666b.10.1721324190579;
        Thu, 18 Jul 2024 10:36:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jul 2024 18:36:27 +0100
Message-Id: <D2SUHZ78N3M5.231Q6OE5GA3GE@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "George Dunlap"
 <george.dunlap@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH v2 2/2] Add scripts/oss-fuzz/build.sh
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.17.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com> <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>
In-Reply-To: <d0974cc40ca68fe197ba7941edd934970d3a92cf.1719355322.git.tamas@tklengyel.com>

On Tue Jun 25, 2024 at 11:47 PM BST, Tamas K Lengyel wrote:
> The build integration script for oss-fuzz targets. Future fuzzing targets=
 can
> be added to this script and those targets will be automatically picked up=
 by
> oss-fuzz without having to open separate PRs on the oss-fuzz repo.
>
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> ---
>  scripts/oss-fuzz/build.sh | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100755 scripts/oss-fuzz/build.sh
>
> diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
> new file mode 100755
> index 0000000000..2cfd72adf1
> --- /dev/null
> +++ b/scripts/oss-fuzz/build.sh
> @@ -0,0 +1,23 @@
> +#!/bin/bash -eu

The shebang probably wants to be "/usr/bin/env bash" to account for systems
that don't have bash specifically there.

With that "-eu" would need to move down a line to be "set -eu"

> +# SPDX-License-Identifier: Apache-2.0
> +# Copyright 2024 Google LLC
> +#
> +# Licensed under the Apache License, Version 2.0 (the "License");
> +# you may not use this file except in compliance with the License.
> +# You may obtain a copy of the License at
> +#
> +#      http://www.apache.org/licenses/LICENSE-2.0
> +#
> +# Unless required by applicable law or agreed to in writing, software
> +# distributed under the License is distributed on an "AS IS" BASIS,
> +# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implie=
d.
> +# See the License for the specific language governing permissions and
> +# limitations under the License.
> +#
> +########################################################################=
########
> +
> +cd xen
> +./configure --disable-stubdom --disable-pvshim --disable-docs --disable-=
xen
> +make clang=3Dy -C tools/include
> +make clang=3Dy -C tools/fuzz/x86_instruction_emulator libfuzzer-harness
> +cp tools/fuzz/x86_instruction_emulator/libfuzzer-harness $OUT/x86_instru=
ction_emulator

Cheers,
Alejandro

