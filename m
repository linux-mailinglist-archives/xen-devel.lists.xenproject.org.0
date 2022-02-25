Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEEF4C4942
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279453.477155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcgG-0005LW-DY; Fri, 25 Feb 2022 15:38:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279453.477155; Fri, 25 Feb 2022 15:38:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcgG-0005IO-9o; Fri, 25 Feb 2022 15:38:52 +0000
Received: by outflank-mailman (input) for mailman id 279453;
 Fri, 25 Feb 2022 15:38:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=caTZ=TI=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nNcgF-0005ID-DT
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:38:51 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06dd7e2d-9651-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 16:38:50 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:58224)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nNcg7-0010vb-kl (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 25 Feb 2022 15:38:43 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 3161E1FB3A;
 Fri, 25 Feb 2022 15:38:43 +0000 (GMT)
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
X-Inumbo-ID: 06dd7e2d-9651-11ec-8539-5f4723681683
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <fdab0a3d-42b7-635e-2253-3b1ea8b5900f@srcf.net>
Date: Fri, 25 Feb 2022 15:38:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220225151931.99848-1-roger.pau@citrix.com>
 <20220225151931.99848-2-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] codeql: add support for analyzing C, Python and Go
In-Reply-To: <20220225151931.99848-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/02/2022 15:19, Roger Pau Monne wrote:
> Introduce CodeQL support for Xen and analyze the C, Python and Go
> files.
>
> Note than when analyzing Python or Go we avoid building the hypervisor
> and only build the tools.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> TBD: there's no limit in the number of scans here unlike Coverity, but
> each takes github minutes and we are limited to 2000 per month IIRC.
> We might want to not perform a scan for each push.

We don't push very often, and github is slower at noticing anyway, so I
think we ought to be fine.

We can always revisit the decision if we do end up hitting limits.

> TBD: should we also disable the shim build? I'm not sure there's much
> value in analyzing it.

Shim's logic is quite different in areas.  I'd say it's worth keeping.

> ---
>  .github/workflows/codeql.yml | 59 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 .github/workflows/codeql.yml
>
> diff --git a/.github/workflows/codeql.yml b/.github/workflows/codeql.yml
> new file mode 100644
> index 0000000000..5bfe478983
> --- /dev/null
> +++ b/.github/workflows/codeql.yml
> @@ -0,0 +1,59 @@
> +name: CodeQL

As a thought... As we're considering doing cross-arm checks, should we
use an x86 suffix here ?

> +
> +on:
> +  workflow_dispatch:
> +  push:
> +    branches: [staging]
> +  schedule:
> +    - cron: '18 10 * * WED,SUN' # Bi-weekly at 10:18 UTC
> +
> +jobs:
> +  analyse:
> +
> +    strategy:
> +      matrix:
> +        language: [ 'cpp', 'python', 'go' ]
> +
> +    runs-on: ubuntu-latest
> +
> +    steps:
> +    - name: Install build dependencies
> +      run: |
> +        sudo apt-get install -y wget git \
> +          libbz2-dev build-essential \
> +          zlib1g-dev libncurses5-dev iasl \
> +          libbz2-dev e2fslibs-dev uuid-dev libyajl-dev \
> +          autoconf libtool liblzma-dev \
> +          python3-dev golang python-dev libsystemd-dev
> +
> +    - uses: actions/checkout@v2
> +      with:
> +        ref: staging

This one doesn't want to be forced to staging.  The github integration
does work properly with different branches.

Importantly, it will allow anyone with a fork of Xen to use the
workflow_dispatch UI to do a one-off run on any branch.

~Andrew

