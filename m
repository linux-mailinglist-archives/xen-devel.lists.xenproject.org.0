Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D9A31E814
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 10:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86513.162500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfqs-0004ge-VU; Thu, 18 Feb 2021 09:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86513.162500; Thu, 18 Feb 2021 09:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCfqs-0004gF-Rl; Thu, 18 Feb 2021 09:44:02 +0000
Received: by outflank-mailman (input) for mailman id 86513;
 Thu, 18 Feb 2021 09:44:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/a8=HU=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1lCfqr-0004gA-Bi
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 09:44:01 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e99db446-47e3-47f7-ac96-8939532d7a74;
 Thu, 18 Feb 2021 09:43:59 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-ppBynGg2PLObngwSRJiYUw-1; Thu, 18 Feb 2021 04:43:57 -0500
Received: by mail-wr1-f71.google.com with SMTP id y6so765462wrl.9
 for <xen-devel@lists.xenproject.org>; Thu, 18 Feb 2021 01:43:57 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id e12sm7570704wrv.59.2021.02.18.01.43.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Feb 2021 01:43:55 -0800 (PST)
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
X-Inumbo-ID: e99db446-47e3-47f7-ac96-8939532d7a74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613641439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/oUH83yvgTbTgpGRwfa+lYGHr4STadHNFna7DZctk8=;
	b=Tozs2pPi5zwHQS+CNc+GCxwCn2NCzr5U5tOVoI/siy6FbOYgUq1skDOKzgPfh5LsTqJJOn
	QnBQkXZQsMbGbl7yOP1sUJzjAXCBmCk66un4VE53prTVT/Ejlyzy8qPlzTCJr2C/jq1TsT
	vpCgQC21Rcx/53AoNzAzB4AU33tZyQE=
X-MC-Unique: ppBynGg2PLObngwSRJiYUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z/oUH83yvgTbTgpGRwfa+lYGHr4STadHNFna7DZctk8=;
        b=trEkTbtF+tjtmyxoSWN4Ww9rHc2bH0nPWkjD4PgU8ExILV+OnhLy9Z9hVumUNwuC5p
         RRjYL5n99vjk2xTpci6YfhbDQWV3NB0G4IlDC2FPsjJwuzn2zE5JjaFBlpBvuB/VJbke
         rfWW9X23uG4kHUFuXmNLspIPAgxDpOTHpN+Fkk5jFVZtsALUhAUYU+32af9ylMHXlzua
         iAz2qCyeRJs7My+Ltvyn6sYQMq/y0eDp+x7jYbAhZ/D5opK+6UWmcEXvQ4S29RSUzIaH
         gRp5rOssr6i/1No1gXfPhqlrMm3EV/plKynsb4NDoLxeUZhqw5sgVTOVxKGXyivY5d09
         iLLQ==
X-Gm-Message-State: AOAM532K69Qcr5vIY8DZmzx8Kq2IgdL7/4fkwd6Qr/nZu43RZFM40p8R
	kOOIapXJqj6wG2B0+tH3zSPM4RhfGv0PMjg2rLHKfhS9CUFo//ClSjpAkvVeXvM9tFcnn0NEU/N
	5x/3HvOZSH1ditVEWn49rnMYxH04=
X-Received: by 2002:adf:ce91:: with SMTP id r17mr3344094wrn.219.1613641436361;
        Thu, 18 Feb 2021 01:43:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMOb3IDgaYqdEW2tkZ33eFn3YO+zdFXyxi+LRDW60vFVymK1fuZ5dq/fUeAHNxFm21ZFgR7Q==
X-Received: by 2002:adf:ce91:: with SMTP id r17mr3344076wrn.219.1613641436195;
        Thu, 18 Feb 2021 01:43:56 -0800 (PST)
Subject: Re: [PATCH v2 7/7] tests/avocado: add boot_xen tests
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Willian Rampazzo <wrampazz@redhat.com>
Cc: qemu-devel@nongnu.org, julien@xen.org, andre.przywara@arm.com,
 stefano.stabellini@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 stratos-dev@op-lists.linaro.org
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
 <20210217204654.GA353754@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2948d7db-2168-7c5e-a73e-969a67496daa@redhat.com>
Date: Thu, 18 Feb 2021 10:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217204654.GA353754@localhost.localdomain>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2/17/21 9:46 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 05:19:45PM +0000, Alex Bennée wrote:
>> These tests make sure we can boot the Xen hypervisor with a Dom0
>> kernel using the guest-loader. We currently have to use a kernel I
>> built myself because there are issues using the Debian kernel images.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  MAINTAINERS                  |   1 +
>>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>>  2 files changed, 118 insertions(+)
>>  create mode 100644 tests/acceptance/boot_xen.py

>> +class BootXen(BootXenBase):
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_411_and_dom0(self):
>> +        """
>> +        :avocado: tags=arch:aarch64
>> +        :avocado: tags=accel:tcg
>> +        :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=machine:virt
>> +        """
>> +        xen_url = ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.11-arm64_4.11.4+37-g3263f257ca-1_arm64.deb')
>> +        xen_sha1 = '034e634d4416adbad1212d59b62bccdcda63e62a'
> 
> This URL is already giving 404s because of a new pacakge.  I found
> this to work (but yeah, won't probably last long):
> 
>         xen_url = ('http://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.11-arm64_4.11.4+57-g41a822c392-2_arm64.deb')
>         xen_sha1 = 'b5a6810fc67fd50fa36afdfdfe88ce3153dd3a55'

This is not the same package version... Please understand the developer
has to download the Debian package sources, check again the set of
downstream changes between 37 and 57. Each distrib number might contain
multiple downstream patches. Then the testing has to be done again,
often enabling tracing or doing single-stepping in gdb. This has a
cost in productivity. This is why I insist I prefer to use archived
well tested artifacts, rather than changing package URL randomly.

>> +        xen_deb = self.fetch_asset(xen_url, asset_hash=xen_sha1)
>> +        xen_path = self.extract_from_deb(xen_deb, "/boot/xen-4.11-arm64")
>> +
>> +        self.launch_xen(xen_path)
>> +
>> +    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
>> +    def test_arm64_xen_414_and_dom0(self):
>> +        """
>> +        :avocado: tags=arch:aarch64
>> +        :avocado: tags=accel:tcg
>> +        :avocado: tags=cpu:cortex-a57
>> +        :avocado: tags=machine:virt
>> +        """
>> +        xen_url = ('https://deb.debian.org/debian/'
>> +                   'pool/main/x/xen/'
>> +                   'xen-hypervisor-4.14-arm64_4.14.0+80-gd101b417b7-1_arm64.deb')
>> +        xen_sha1 = 'b9d209dd689ed2b393e625303a225badefec1160'
> 
> Likewise here:
> 
>         xen_url = ('https://deb.debian.org/debian/'
>                    'pool/main/x/xen/'
>                    'xen-hypervisor-4.14-arm64_4.14.0+88-g1d1d1f5391-2_arm64.deb')
>         xen_sha1 = 'f316049beaadd50482644e4955c4cdd63e3a07d5'

Likewise not the same package version.

Regards,

Phil.


