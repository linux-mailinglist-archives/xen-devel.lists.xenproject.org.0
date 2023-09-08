Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 954C6798B94
	for <lists+xen-devel@lfdr.de>; Fri,  8 Sep 2023 19:47:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598143.932688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefZD-0005YQ-TQ; Fri, 08 Sep 2023 17:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598143.932688; Fri, 08 Sep 2023 17:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qefZD-0005VY-Q2; Fri, 08 Sep 2023 17:46:51 +0000
Received: by outflank-mailman (input) for mailman id 598143;
 Fri, 08 Sep 2023 17:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6LDZ=EY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qefZC-0005VP-9G
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 17:46:50 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae2a8360-4e6f-11ee-8783-cb3800f73035;
 Fri, 08 Sep 2023 19:46:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EDA5B82857C6;
 Fri,  8 Sep 2023 12:46:45 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gFoL5C0nl5xL; Fri,  8 Sep 2023 12:46:44 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C01ED8285AC9;
 Fri,  8 Sep 2023 12:46:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id fr8VsiO2G7Sr; Fri,  8 Sep 2023 12:46:44 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 5409E82857C6;
 Fri,  8 Sep 2023 12:46:44 -0500 (CDT)
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
X-Inumbo-ID: ae2a8360-4e6f-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C01ED8285AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694195204; bh=QqCbA/mQ1v3W7sfSlIFMiZVaYvM10vbuNyoZVovap4Y=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=Xa2yHXs4U475waSj0GttbIxNpsLk3DI+5DElVKqwL1MNAj5rlVtcF25nVRL0OUmoR
	 V8KSLmxhiLxzOzKw5CQOGVh+63TInZa+h/ZHPM+RvAFlJemWWY4mtUIw9QVT7quVi/
	 YH/KpbW5Q1oRSE1YU11QQd9FIkQpJXOva2cwm6ws=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <e30b9b9c-20ef-2382-b104-5369ca8499ef@raptorengineering.com>
Date: Fri, 8 Sep 2023 12:46:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] automation: Switch ppc64le tests to PowerNV
 machine type
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1694044614.git.sanastasio@raptorengineering.com>
 <85b53762ba04a349ba099cf5629e7ac24f496d69.1694044614.git.sanastasio@raptorengineering.com>
 <alpine.DEB.2.22.394.2309061739490.6458@ubuntu-linux-20-04-desktop>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061739490.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/6/23 7:41 PM, Stefano Stabellini wrote:
> On Wed, 6 Sep 2023, Shawn Anastasio wrote:
>> Run ppc64le tests with the PowerNV machine type (bare metal) instead of
>> the paravirtualized pseries machine. This requires a more modern version
>> of QEMU than is present in debian bullseye's repository, so update the
>> dockerfile to build QEMU from source.
>>
>> Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
>> Implement initial Radix MMU support') which resulted in CI failures. In
>> preparation for removing pseries support entirely, switch the CI
>> infrastructure to the PowerNV machine type.
>>
>> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>> ---
>>  .../build/debian/bullseye-ppc64le.dockerfile  | 37 ++++++++++++++++++-
>>  automation/gitlab-ci/test.yaml                |  2 +-
>>  2 files changed, 36 insertions(+), 3 deletions(-)
>>
>> diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
>> index 8fad26e903..15827bbcf4 100644
>> --- a/automation/build/debian/bullseye-ppc64le.dockerfile
>> +++ b/automation/build/debian/bullseye-ppc64le.dockerfile
>> @@ -1,4 +1,36 @@
>> +FROM debian:bullseye-slim AS builder
>> +
>> +ENV DEBIAN_FRONTEND=noninteractive
>> +ENV QEMU_TAG=stable-8.1
>> +ENV USER root
>> +
>> +# dependencies for qemu build
>> +RUN apt-get update && \
>> +    apt-get --quiet --yes install \
>> +        git \
>> +        build-essential \
>> +        python3-minimal \
>> +        python3-elementpath \
>> +        python3-pip \
>> +        ninja-build \
>> +        libglib2.0-dev \
>> +        libpixman-1-dev
>> +
>> +RUN mkdir /build
>> +WORKDIR /build
>> +
>> +# QEMU build from git
>> +RUN git clone --depth 1 --branch "${QEMU_TAG}" https://github.com/qemu/qemu && \
>> +    mkdir qemu/build && \
>> +    cd qemu/build && \
>> +    ../configure --target-list=ppc64-softmmu && \
>> +    ninja && \
>> +    ninja install
> 
> It is totally find to build your QEMU but please use a test-artifact
> instead, see automation/tests-artifacts/qemu-system-aarch64/ and
> qemu-system-aarch64-6.0.0-arm64-export as an example.

Thanks for letting me know -- I've submitted a v3 that uses this
technique to build the QEMU binary based on the aarch64 example you
provided.

Shawn

