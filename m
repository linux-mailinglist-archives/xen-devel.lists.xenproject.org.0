Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B1293AF75
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 11:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764050.1174350 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYim-0007x1-OD; Wed, 24 Jul 2024 09:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764050.1174350; Wed, 24 Jul 2024 09:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYim-0007uk-LX; Wed, 24 Jul 2024 09:55:44 +0000
Received: by outflank-mailman (input) for mailman id 764050;
 Wed, 24 Jul 2024 09:55:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7SE7=OY=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sWYik-0007uc-Vi
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:55:42 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e338674d-49a2-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 11:55:41 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so5379271e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 02:55:41 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7ab1f45134sm49614266b.91.2024.07.24.02.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 02:55:41 -0700 (PDT)
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
X-Inumbo-ID: e338674d-49a2-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721814941; x=1722419741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhpSEukQ6m/m2O/CMOQous3Lt4aKITZyFanRBaLnxHk=;
        b=dagB4kytnzlck9nuUJ6PVjeQWuR9iqjJ2elfJYaUMVamap/pk9R5O57Cdiobsa49Xu
         5CcEQCr8CZRCv6gYd7KYfuCA0KdCRfRz4guYZmd5bqCFdaGwqM6xD1xE1M545Q29thNb
         94slKwIgqofL4rynA4N2K+w7vnesZOdzRbw2dj5o2E3RnaXpGL78N6FkT+buQt4BMGHW
         vhKv7PRxzXiKUpSYWxAMjmGiPWbHGS89ZL+iC6355aZI7Fcl0g9Ogr+pZtT7uqPZRxy+
         ieAkYc0dOv6ut8KyGKGrSet+3r6IsxKRDn0valPCJjXMmJu0OjCMEKe+tFdOSiszuMwP
         dHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814941; x=1722419741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhpSEukQ6m/m2O/CMOQous3Lt4aKITZyFanRBaLnxHk=;
        b=IJncD9kbUtZxyKCZtiGDCoxIrNYGSROq2+1CuJUfkxzpdtI9uGACzpy+XRrrSSTgNB
         JhJigSBBCWL8Y1IARQw1imuVS6J47OCkNPAwFDdiaPM4RbBDAcUjYsNDxrY1b/Ttf7rW
         KBthveujoyv1s80mnIfCQt0DDlnosmrlZN1HJPpUhCcjAKWr8thrDRyFkkY7t6rWNJQx
         JcHPZAx272K2q3Vk/Pl05C4L8QttLAJBEqdPdZdDQVWzaj7zxhNLY/qgc3WNLmupDjlu
         fSTLAgWZxPD+KnpBMirlppvbO4mHuuf1hVWdppPay9MqzB99ZyX+0xeMHBsg/CcbanPu
         NLkg==
X-Forwarded-Encrypted: i=1; AJvYcCWAdiKvJ19J0DU/pe7qt/MJyWAznQdu7QbAxI6XaESFwMB8wHP3vbf58HneIFz//oDC5SV+DycTWZKPksGfp/PY4omUS2MZsPRtLy0V+eI=
X-Gm-Message-State: AOJu0Yy6QkumsaVHMxMSpXhF1Z7r9Z0nFgITtssfaMdgBMNDAamIggg2
	tqjO2lT61IJB24kTGsOySekZNfoqRRX8M/70K3wFpatxZ+cB3odX0vJLzwU1DkAfoDT5aMkhSgs
	J
X-Google-Smtp-Source: AGHT+IHSkQpsRs7vF2BLN0MDZhxdQ+UXOH+qiSLTm++pHNnEuJkjIxa1gpinn8CjHy6QcQic+o/nnw==
X-Received: by 2002:a05:6512:1114:b0:52c:e03d:dfd7 with SMTP id 2adb3069b0e04-52efb7a0d3cmr9399006e87.39.1721814941243;
        Wed, 24 Jul 2024 02:55:41 -0700 (PDT)
Message-ID: <3a847f18-750f-4bd2-9cac-37c4b9bdc84b@suse.com>
Date: Wed, 24 Jul 2024 11:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-tip:linux-next 12/12] WARNING: modpost: vmlinux: section
 mismatch in reference: mc_debug_data+0x0 (section: .data) ->
 mc_debug_data_early (section: .init.data)
To: Jan Beulich <jbeulich@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 kernel test robot <lkp@intel.com>
References: <202407240907.u0NJHgTu-lkp@intel.com>
 <a9b1e875-5bf8-4755-ad2e-78ab2eb02c97@suse.com>
 <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <fc4b5a0c-19dc-4741-b184-08b704444a1b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.07.24 08:54, Jan Beulich wrote:
> On 24.07.2024 08:07, Juergen Gross wrote:
>> On 24.07.24 03:08, kernel test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xen/tip.git linux-next
>>> head:   368990a7fe30737c990f628a60d26d9854a9e690
>>> commit: 368990a7fe30737c990f628a60d26d9854a9e690 [12/12] xen: fix multicall debug data referencing
>>> config: x86_64-randconfig-012-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/config)
>>> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240907.u0NJHgTu-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407240907.u0NJHgTu-lkp@intel.com/
>>>
>>> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>>>> WARNING: modpost: vmlinux: section mismatch in reference: mc_debug_data+0x0 (section: .data) -> mc_debug_data_early (section: .init.data)
>>
>> With current infrastructure this is not easily fixable, as there is no way
>> to tag a percpu variable as __refdata.
> 
> Would it be an option to drop the static initializer and set CPU0's value
> from xen_parse_mc_debug()?

It would hide this warning, yes.

OTOH I have another patch pending which will have the same problem, and this
time the solution would be more ugly, as the code would always be active in
a PV guest (yes, I could add an init function called very early during boot,
but ...).

I'd prefer a general way to handle this problem, like e.g. some kind of
__refdata tagging for percpu variables.


Juergen

