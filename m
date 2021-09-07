Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 790EF402DC6
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 19:37:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181283.328374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNf0s-0000wJ-PH; Tue, 07 Sep 2021 17:36:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181283.328374; Tue, 07 Sep 2021 17:36:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNf0s-0000uS-KD; Tue, 07 Sep 2021 17:36:02 +0000
Received: by outflank-mailman (input) for mailman id 181283;
 Tue, 07 Sep 2021 17:36:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JcTc=N5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNf0q-0000uG-Ml
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 17:36:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10316374-1002-11ec-b118-12813bfff9fa;
 Tue, 07 Sep 2021 17:35:59 +0000 (UTC)
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
X-Inumbo-ID: 10316374-1002-11ec-b118-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631036159;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GsjaAJfgrCNlIL34Yd1ZnN8XhjsnG6kdA+YSA8g09jA=;
  b=WAQi6ntvivcCU3IKdj+sXl9/mFNwrqOYo9Y7wk9wHWu6bcBQqnwn5cnY
   UuYtp0X82tN7vUS8MZ4m84gIMb3gGFeR7eo9+tohZM47/W80+qTQycbGN
   nDKGWMplvb9gDNB/9YoxaPpIf6h1DWQ0IAOcNH/E208PgOnt1tnmlVL4q
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zB0VZmyGTwWt9Gp2YY0ZTcUaN4I7s/9xxEWc7AgJRZaxRmpIWhQMJuigtR8tFbt7NGDlCQix9V
 Yl9sg4DS7rpdvBt2YyErcykB2PvKaQO5Ip5x4TwO05QXEwkcwam6akdwwmhqUMa0Bszih1rhJn
 T3e0IbaYBEu13hOeI/RzW1IC0aBLed6LM7MXX9Bt/tQYVORXhTmjMmMdK1P+AacTL/eASdr6vA
 0QzFo9cBMqu1B7kuLXXNm5gIAharup2oiII8tEDWzCrW4j392qA7GZ4pfrtM00LDy04Ge0z0vs
 3SVpeL6365z04GXdqiR9lzP+
X-SBRS: 5.1
X-MesageID: 53939861
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:IhhBFaoFt/emnMtespdSRMIaV5u8L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBbhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFJSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHJXguNbnmNE426gYzxLrWJ9dPwE/f
 Snl6h6TnabCA8qhpPRPAh6YwGPnayGqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD09jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU911rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxzr5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtgrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGYgoBW+q3oYp0PJGbDfqBb0fbllAS+3UoJjnfw/fZv3Evpr/kGOt95D+
 etCNUhqFgBdL5OUUrRbN1xNvdfMVa9NC4kBljiaGgPJJt3SU4llKSHlIndxNvaMqDgn6FC1a
 gobjtjxBgPkgTVeJWz4KE=
X-IronPort-AV: E=Sophos;i="5.85,274,1624334400"; 
   d="scan'208";a="53939861"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2kVk7IR4CL6JHvSHeBqgj7uXWQIFar8/3EJ4/kHNDSFAePmw3Oj4bI/4MH/ufqBRRFrsZWxWJBksQuRau3ZappG/N9KkG8XnSkJORDiCE2ldilCu+JD9VHyaq+HY8t4EEERDVyVYDwdmjbSE/wFh/b54vJKMvydBrCQP0hXl8+eut2d+FERIrWnukC5OJd8lZsXL/0911FS640w34VYFFX3ExSQzoJRK1kJlD6LSXk1k+218E3Jth2WYKf0wirGR8JQiTR6KKehLwjGxWliZTBY4lJJ4Cpe8uKsLP0JzB81c9jyATCWbzqwOBnK+xlrYkL+W/Lwk1EdE8Z5trOZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GsjaAJfgrCNlIL34Yd1ZnN8XhjsnG6kdA+YSA8g09jA=;
 b=X51eO0bU1D5ZcbYB2zRrRkfg6zzGrgHoM9AyyCVWlNpFbRT9qtBIqyDk1JhfZuDH8nMrqpjornwS4KwjMwofGrBAELdvC1ywcwhwjFTptq7MCyb8U/afX7DnuHFiY8YzNQCrctBTzzWMsvzet85RngdlOW2wMG1PMCL2xEZJGyYFXbXQhDxbNS7dNqi9JA9oOs/yAhx9KQK6j1fhJ/OC/KU12EXqenZ4ZZ90qR3hUYQiUZf9f59B7RH5API2ck8PI1IuesWxH6O0XAm6m7hFKtGJ5y0HdqwbOymzehiPo0zPm7AUzxh6tl+ZoGsgKb484cJP/3mMkwKiboxyjznT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsjaAJfgrCNlIL34Yd1ZnN8XhjsnG6kdA+YSA8g09jA=;
 b=jE7LUW1ixHrrRoSkONH1AZ4W0O5FXvXESxNZROtkmuDbK+DaZ2zjJmv9JWuxD27/u7M4SQO5sHNpXDlns+oxe96bBo9xTN68h8/5J6xAhOEsBBdXNvJPUHFlhaAzaYa6K4USu4N6Yfyy5UeMYXu4dVxfnPymaRlje2jjVx7F8KU=
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Henry Wang
	<Henry.Wang@arm.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
 <1631034578-12598-2-git-send-email-olekstysh@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
Message-ID: <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>
Date: Tue, 7 Sep 2021 18:35:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1631034578-12598-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0428.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e5916e5-4c9a-4f04-6581-08d97225f265
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB49989FC05D74565F4B512858BAD39@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcN3zlvDev2j8AMCOBLN/pXs3Lo7SRWefXqY9EFbyd4gOIVx2v9mn7UCFfyF4i2SmAyZ4/aAemJ6sclTEG3C4nDaImq0goLM9/A74Uzh9Iu3FZiwx37Pc/LS+XTodyRSHr8L42hYqQYWyH9pmWWUHzNl7ya21uRYk4b25nLIihdMwtlA4ApB3RkikrZGaAaYxDa3q27+9tvk3eqPViiFUKxGMUp0fORnw3co8OIBsAgJAQy8ktIwLNB1q7g1SRa146gQVBQ4v944UY1HQa4HdlaH0WdBGy/wmrhvPUoJ9zz6U7SJdp7DG7C078Wfyf33U2vIAVOSMUj7Je4zhbqAXXcSoH2hMCaL2revHGPdVeBxGYD+pksMfHyq2Vg9zGyCLpW1WBf5vEd1YYMaODPyOC0aPftCFDZXPLRkz9ZGPbHFKhSx+AV3nwmBJl8S5C2W0kuB1zPfsUidqnDuSWDxp/UofMG4Gx5np1wHBAXuZqdyt6oWwqXHXgPv4j6qooF7o5BnuhACYBzZFbaljLzvvHa900+c0FBzRynGIH0jd9TBSga+2vRjZcb5YUv8bve1QEgsBAd0Nf8xYgnRMNAJmQ6MWlYm7ydwUz5C0/gUF5F9Pk/iEfhJw8fnWC/oyYGvzp7VqFDcbsU6SDVBixXRSmoZN0MJvPJnLr5aLE3fUCHG82VdO9rWkEsUxOZ/J8ju5LKcpKyCG9yF26YpJQEk+wJLKFWMmM24acTjPuJQ3jQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39860400002)(136003)(396003)(36756003)(4326008)(66946007)(186003)(66556008)(16576012)(478600001)(86362001)(8676002)(31696002)(6666004)(2906002)(55236004)(7416002)(5660300002)(31686004)(2616005)(8936002)(316002)(53546011)(38100700002)(83380400001)(956004)(26005)(66476007)(6486002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJaL0JCclZPL1R1RVFZVlhFb3Rsby9mWG9BVUhDemxmZUIvVlhzRFJlSXRG?=
 =?utf-8?B?Q3c5T0N1UnJxMGZDMEpRcWhMMmVPWTltQnppMjh0LzhyY203dXNlUUorL1pF?=
 =?utf-8?B?V0I0Mk1BTE1VUTVMWmlCLzZiM2trcy85NVVINW9jNEJ3c21rNVpWZExxUEFH?=
 =?utf-8?B?ZzJiMHlqUExlbzR2WXpUVXpUKzJDNEo0bEhuM280MHAyMzJ2cjhSeU1KODFw?=
 =?utf-8?B?SlNSdXBUQksyNGErYzFrTE1ibWVoTnlZd0JIeFZRMVlTWXRtOCt6WTMzdlZp?=
 =?utf-8?B?T1kzOEt1b1JnOVVsTDQ2NXVpMmJsNUZjazA3a3NwZjNUMHhSNmFVcWt3d1I0?=
 =?utf-8?B?dXB4MzFTbHVvQTRPNWtWRmdFVFIyMHpzMjB2TXp1clBUV01LVzBTQzhCQmJp?=
 =?utf-8?B?RFNIQk41N25EWEkxNGtBQkdjOGE4aEt2U3BmaFRBVWlNVkJFUXdQVnNTcVZr?=
 =?utf-8?B?VURNWVZMbGFpd3VMNkZRRGlPWExXWmF4ZkpiVGFmb3ExV1JnejZ2N3BJMHVG?=
 =?utf-8?B?TktLTDYyOHdqSHFFOFZsU3psYjhKUmF5SkNRZ3RpeHVJVWlhUVo1MHAzTDhO?=
 =?utf-8?B?d0w0aWYwWE9NZFR5ZTVjMlJWSXE4VEduVFlWN1Y5QlNmdnhyaGNNKzVMaTA4?=
 =?utf-8?B?bHR4ZzVVOVYveWpLWkZlSkQraUpoYjFWdUk5Sm01dklxVlhWb0hnbk5kaTBB?=
 =?utf-8?B?NiswQUt4YXhQZENCU2h3d1QzS2JnTkdIMFVMcnNXVTc0ZVl3WW01WmlFVVBN?=
 =?utf-8?B?SDJRTDJwOFg4KzNoUlhrR3hBdXpoOUo2cUlJSUhMQ2RHUDFKUk9GOC9UbXhF?=
 =?utf-8?B?empieVRZbFB6V0dQVEtaOEpCVE5BNFNPMzZVRUpab3JGUFh0YTJuU2N4OGNP?=
 =?utf-8?B?VTFXMDhIb0xudjArWElEaDNoUmxTM3h0VXp2aTF5ZDFWOXMxcXllWGFsSk1E?=
 =?utf-8?B?WVN0elNWdVAxdEs3dXRvZGpLOGlMNjZoZ0NvSVFubVFteWZlMmt6SDJMQndQ?=
 =?utf-8?B?WUwwakNLQ3l2ODZSa2xDb3RObFc2T0FkSDc4OUpTSmlMeGNjY2tZK1JlWHhI?=
 =?utf-8?B?clVnRW14eUpReXkyZkFyNlMvOHVsenNJZURaVjBOZXVZV0xLTFVuL1JhVFBo?=
 =?utf-8?B?bk1KeXVYZEJScXFzUHNsN1paVzdpQmpFU1NhbFdRWDJBZWF4Wm5uNXkrSlQ3?=
 =?utf-8?B?UkxxeWEyZlBSRUVrWkw2M3pmc3ZHcEpzN0Y2eGpvME9ZT2NzUEdnaXc4TkZY?=
 =?utf-8?B?R283VnVtcTdMSUgvNVVWd04zRlhaaGt4emNTK3plNGtUdURPTm1LUmZ4c09F?=
 =?utf-8?B?OFRNaUF5bzQ1RE9VK1BOeFN3dVhUYkJBTDN1UGhZc05Jb3hRNzhPbmE0NzFs?=
 =?utf-8?B?azl1TlAxT1ZvTTBXVTRVRXpzcFF2eTRNNTFOa2EwSUN2M0FYcnhMcFhldTh2?=
 =?utf-8?B?L0VLMThqTWJldmFwTGhqV3d2ejVjSjBEVy82T0lvTzJTTEdvY01VWmxLM0Jm?=
 =?utf-8?B?SElhTTBmVnRZRUNkM3NBMnFwUnl0UWttV1pwbGltbGZ3TmNwdUdpc2YvOC9y?=
 =?utf-8?B?dnVOLzdyUVNaYU1vTTR0by9HMjk2WHVYUDdaYWdzRDRyQ3hIdGNnNHVUc1py?=
 =?utf-8?B?RGFtZWF3K0JjaVFUbmQ2cEdNR2RQakUrU0hLMEw1b2dadkllQkRaTDZDRUpP?=
 =?utf-8?B?c0p2RWVoeENtdHZSUFRKZGVRVm41UlJiSnZZN0lDUEw5Y3RUN25aNmJLZnlk?=
 =?utf-8?Q?x+PyrvLZ9dB5Y0b5QxvhrzSNzmcEbM3RBhIUl1v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5916e5-4c9a-4f04-6581-08d97225f265
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 17:35:55.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKfelRUTQgcj/sY8qnpXk+x267fov9x5Q77tzuRe73MReXT4u9XIWkCwXGHPPR+5G9NC/Pkin230/B/f9AIGUUWmvrqtdONgaEyuQIJNpz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 07/09/2021 18:09, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> We need to pass info about maximum supported guest address
> space size to the toolstack on Arm in order to properly
> calculate the base and size of the extended region (safe range)
> for the guest. The extended region is unused address space which
> could be safely used by domain for foreign/grant mappings on Arm.
> The extended region itself will be handled by the subsequents
> patch.
>
> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
> hap_paddr_bits.
>
> As we change the size of structure bump the interface version.
>
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

So while I think this is a suitable way forward, you're painting
yourself into a corner WRT migration.

On x86, the correct value is d->arch.cpuid->extd.maxphysaddr and this
value is under toolstack control, not Xen control.=C2=A0 In particular, it
needs to be min(hostA, hostB) to make migration safe, and yes - this is
currently a hole in x86's migration logic that will cause large VMs to
explode.

The same will be true on ARM as/when you gain migration support.

I think this would be better as a domctl.=C2=A0 On ARM, it can reference
p2m_ipa_bits for now along with a /* TODO - make per-domain for
migration support */, while on x86 it can take the appropriate value
(which will soon actually be safe in migration scenarios).

However, that does change the ordering requirements in the toolstack -
this hypercall would need to be made after the domain is created, and
has been levelled, and before its main memory layout is decided.

Alternatively, the abstraction could be hidden in libxl itself in arch
specific code, with x86 referring to the local cpu policy (as libxl has
the copy it is/has worked on), and ARM making a hypercall.=C2=A0 This does
make the ordering more obvious.

(As a note on the x86 specifics of this patch, hap_paddr_bits is
actually unused in practice.=C2=A0 It was a proposal from AMD for the
hypervisor to fill in those details, which wasn't implemented by anyone,
not even Xen, because the important field to modify is maxphysaddr if
you don't want to rewrite every kernel to behave differently when
virtualised.)

~Andrew


