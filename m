Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD54BB90A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 13:22:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275334.471157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2Gd-0000xC-5D; Fri, 18 Feb 2022 12:21:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275334.471157; Fri, 18 Feb 2022 12:21:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL2Gd-0000uW-2C; Fri, 18 Feb 2022 12:21:43 +0000
Received: by outflank-mailman (input) for mailman id 275334;
 Fri, 18 Feb 2022 12:21:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N23X=TB=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nL2Gb-0000uQ-W7
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 12:21:41 +0000
Received: from ppsw-31.csi.cam.ac.uk (ppsw-31.csi.cam.ac.uk [131.111.8.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 531c6325-90b5-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 13:21:40 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:57012)
 by ppsw-31.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nL2GV-000XsY-KX (Exim 4.95) (return-path <amc96@srcf.net>);
 Fri, 18 Feb 2022 12:21:35 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 1EB011FDB0;
 Fri, 18 Feb 2022 12:21:35 +0000 (GMT)
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
X-Inumbo-ID: 531c6325-90b5-11ec-8723-dd0c611c5f35
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <0eeb8f5f-d049-8a8e-9e65-d1966c21a781@srcf.net>
Date: Fri, 18 Feb 2022 12:21:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20220218120042.32102-1-roger.pau@citrix.com>
 <20220218120042.32102-2-roger.pau@citrix.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/2] github: add workflow to run Coverity scans
In-Reply-To: <20220218120042.32102-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/02/2022 12:00, Roger Pau Monne wrote:
> Add a workflow that performs a build like it's done by osstest
> Coverity flight and uploads the result to Coverity for analysis. The
> build process is exactly the same as the one currently used in
> osstest, and it's also run at the same time (bi-weekly).
>
> This has one big benefit over using osstest: we no longer have to care
> about keeping the Coverity tools up to date in osstest.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  .github/workflows/coverity.yml | 35 ++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 .github/workflows/coverity.yml
>
> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
> new file mode 100644
> index 0000000000..12fc9c782b
> --- /dev/null
> +++ b/.github/workflows/coverity.yml
> @@ -0,0 +1,35 @@
> +name: Coverity Scan
> +
> +# We only want to test official release code, not every pull request.
> +on:
> +  schedule:
> +    - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
> +
> +jobs:
> +  coverity:
> +    runs-on: ubuntu-latest
> +    steps:
> +    - name: Install build dependencies
> +      run: |
> +        sudo apt-get install -y wget git bcc bin86 gawk bridge-utils \
> +          iproute2 libcurl4-openssl-dev bzip2 libpci-dev build-essential \
> +          make gcc libc6-dev libc6-dev-i386 linux-libc-dev zlib1g-dev \
> +          libncurses5-dev patch libvncserver-dev libssl-dev libsdl-dev iasl \
> +          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml libx11-dev \
> +          ocaml-findlib xz-utils gettext libyajl-dev libpixman-1-dev \
> +          libaio-dev libfdt-dev cabextract libglib2.0-dev autoconf automake \
> +          libtool libfuse-dev liblzma-dev ninja-build \
> +          kpartx python3-dev python3-pip golang python-dev libsystemd-dev

We dropped gettext as a dependency a few releases ago, and we don't need
python3-pip either.  Can fix on commit.

> +    - uses: actions/checkout@v2

I think we want

- uses: actions/checkout@v2
  with:
    ref: staging

Can also fix on commit.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> (mainly because I
can see that Coverity has done the right thing with this.)

> +    - name: Configure Xen
> +      run: |
> +        ./configure
> +    - name: Pre build stuff
> +      run: |
> +        make -C tools/firmware/etherboot all && make mini-os-dir
> +    - uses: vapier/coverity-scan-action@v1
> +      with:
> +        command: make xen tools && make -C extras/mini-os/
> +        project: XenProject
> +        email: ${{ secrets.COVERITY_SCAN_EMAIL }}
> +        token: ${{ secrets.COVERITY_SCAN_TOKEN }}


