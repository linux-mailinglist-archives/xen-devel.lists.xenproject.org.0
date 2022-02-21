Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF3D4BD944
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276160.472257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6Lr-00041G-6o; Mon, 21 Feb 2022 10:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276160.472257; Mon, 21 Feb 2022 10:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM6Lr-0003zS-2e; Mon, 21 Feb 2022 10:55:31 +0000
Received: by outflank-mailman (input) for mailman id 276160;
 Mon, 21 Feb 2022 10:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3jq6=TE=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1nM6Lq-0003zM-0L
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:55:30 +0000
Received: from ppsw-40.csi.cam.ac.uk (ppsw-40.csi.cam.ac.uk [131.111.8.140])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7229619-9304-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 11:55:28 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:57080)
 by ppsw-40.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1nM6Ln-0010lg-jF (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 21 Feb 2022 10:55:27 +0000
Received: from [192.168.1.10] (host-92-12-45-187.as13285.net [92.12.45.187])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id C3D781FB2D;
 Mon, 21 Feb 2022 10:55:26 +0000 (GMT)
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
X-Inumbo-ID: c7229619-9304-11ec-8eb8-a37418f5ba1a
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <085e64bd-b32f-6162-f5d0-69ac9d0e1a2c@srcf.net>
Date: Mon, 21 Feb 2022 10:55:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] CI: Coverity tweaks
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <20220221100254.13661-1-andrew.cooper3@citrix.com>
 <20220221100254.13661-4-andrew.cooper3@citrix.com>
 <YhNrhuvBbZ43hcA6@Air-de-Roger>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <YhNrhuvBbZ43hcA6@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/02/2022 10:37, Roger Pau Monné wrote:
> On Mon, Feb 21, 2022 at 10:02:54AM +0000, Andrew Cooper wrote:
>>  * Use workflow_dispatch to allow manual creation of the job.
>>  * Use parallel builds.  The workers have two vCPUs.
>>  * Shrink the dependency list further.  build-essential covers make and gcc,
>>    while bridge-utils and iproute2 are runtime dependencies not build
>>    dependencies.  Alter bzip2 to libbz2-dev.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  .github/workflows/coverity.yml | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/.github/workflows/coverity.yml b/.github/workflows/coverity.yml
>> index 9d04b56fd31d..6e7b81e74f72 100644
>> --- a/.github/workflows/coverity.yml
>> +++ b/.github/workflows/coverity.yml
>> @@ -2,6 +2,7 @@ name: Coverity Scan
>>  
>>  # We only want to test official release code, not every pull request.
>>  on:
>> +  workflow_dispatch:
>>    schedule:
>>      - cron: '18 9 * * WED,SUN' # Bi-weekly at 9:18 UTC
>>  
>> @@ -11,11 +12,11 @@ jobs:
>>      steps:
>>      - name: Install build dependencies
>>        run: |
>> -        sudo apt-get install -y wget git gawk bridge-utils \
>> -          iproute2 bzip2 build-essential \
>> -          make gcc zlib1g-dev libncurses5-dev iasl \
>> -          libbz2-dev e2fslibs-dev git-core uuid-dev ocaml \
>> -          ocaml-findlib xz-utils libyajl-dev \
>> +        sudo apt-get install -y wget git gawk \
>> +          libbz2-dev build-essential \
>> +          zlib1g-dev libncurses5-dev iasl \
>> +          libbz2-dev e2fslibs-dev uuid-dev ocaml \
>> +          ocaml-findlib libyajl-dev \
>>            autoconf libtool liblzma-dev \
>>            python3-dev golang python-dev libsystemd-dev
>>  
>> @@ -31,7 +32,7 @@ jobs:
>>  
>>      - name: Pre build stuff
>>        run: |
>> -        make mini-os-dir
>> +        make -j`nproc` mini-os-dir
>>  
>>      - uses: vapier/coverity-scan-action@v1
>>        with:
>> @@ -39,3 +40,4 @@ jobs:
>>          project: XenProject
>>          email: ${{ secrets.COVERITY_SCAN_EMAIL }}
>>          token: ${{ secrets.COVERITY_SCAN_TOKEN }}
>> +        command: make -j`nproc` build
> There's already a 'command:' parameter set just before 'project:'.

Oh, so there is.

> Are
> we OK with using plain build?
>
> If so we would have to disable docs build and stubdom? We don't want
> to analyze all the newlib &c that's build as part of stubdoms?

The problem I was trying to work around there was that xen&tools turn
into *-install so we also spend time shuffling binaries around the build
environment.

What we actually want is:

make -j`nproc` build-xen build-tools && make -j`nproc` -C extras/mini-os/

~Andrew

