Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E39777B1362
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 08:53:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609277.948261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlktE-00011u-Ij; Thu, 28 Sep 2023 06:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609277.948261; Thu, 28 Sep 2023 06:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlktE-0000zZ-Fs; Thu, 28 Sep 2023 06:52:48 +0000
Received: by outflank-mailman (input) for mailman id 609277;
 Thu, 28 Sep 2023 06:52:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LRrN=FM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qlktD-0000zT-IR
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 06:52:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a13eaba6-5dcb-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 08:52:46 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 7AF004EE0738;
 Thu, 28 Sep 2023 08:52:45 +0200 (CEST)
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
X-Inumbo-ID: a13eaba6-5dcb-11ee-878a-cb3800f73035
MIME-Version: 1.0
Date: Thu, 28 Sep 2023 08:52:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, jbeulich@suse.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Henry
 Wang <Henry.Wang@arm.com>
Subject: Re: [XEN PATCH v2 3/3] automation/eclair: build docs/misra to address
 MISRA C:2012 Dir 4.1
In-Reply-To: <14f44178655243a94ad3e51a72281637@bugseng.com>
References: <cover.1695801813.git.nicola.vetrini@bugseng.com>
 <bc2d62ad97a821f9c8e17a1ff3c9ed55922dbbd4.1695801813.git.nicola.vetrini@bugseng.com>
 <14f44178655243a94ad3e51a72281637@bugseng.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <0b5ff4ad22f42622befbdaf5ef3a9ae2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2023 15:29, Nicola Vetrini wrote:
> On 27/09/2023 11:52, Nicola Vetrini wrote:
>> The documentation pertaining Directive 4.1 is contained in docs/misra.
>> The build script driving the analysis is amended to allow ECLAIR to
>> analyze such file.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> Changes in v2:
>> - removed useless make flags
>> ---
>>  automation/eclair_analysis/build.sh   | 6 +++---
>>  automation/eclair_analysis/prepare.sh | 4 ++--
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>> 
>> diff --git a/automation/eclair_analysis/build.sh
>> b/automation/eclair_analysis/build.sh
>> index ec087dd822fa..ea7a1e5a59b0 100755
>> --- a/automation/eclair_analysis/build.sh
>> +++ b/automation/eclair_analysis/build.sh
>> @@ -34,11 +34,11 @@ else
>>  fi
>> 
>>  (
>> -  cd xen
>> -
>> +  make -C docs misra
>>    make "-j${PROCESSORS}" "-l${PROCESSORS}.0"    \
>>         "CROSS_COMPILE=${CROSS_COMPILE}"         \
>>         "CC=${CROSS_COMPILE}gcc-12"              \
>>         "CXX=${CROSS_COMPILE}g++-12"             \
>> -       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"
>> +       "XEN_TARGET_ARCH=${XEN_TARGET_ARCH}"     \
>> +       -C xen
>>  )
>> diff --git a/automation/eclair_analysis/prepare.sh
>> b/automation/eclair_analysis/prepare.sh
>> index 0cac5eba00ae..ebd5a2dde676 100755
>> --- a/automation/eclair_analysis/prepare.sh
>> +++ b/automation/eclair_analysis/prepare.sh
>> @@ -35,8 +35,8 @@ else
>>  fi
>> 
>>  (
>> -    cd xen
>> -    cp "${CONFIG_FILE}" .config
>> +    ./configure
>> +    cp "${CONFIG_FILE}" xen/.config
>>      make clean
>>      find . -type f -name "*.safparse" -print -delete
>>      make -f ${script_dir}/Makefile.prepare prepare
> 
> Hi, I observed a failure when running the analysis job of this series
> through patchew, so
> I think it's a good idea to put this patch on hold until I've figured
> out what's wrong.
> Sorry for the inconvenience.

I found the culprit; there is a minor issue with patches 2/3 and 3/3.
I'll submit a new one and address the other review comments as well.
The changes will be minimal, so perhaps I will be able to retain the 
R-by-s.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

