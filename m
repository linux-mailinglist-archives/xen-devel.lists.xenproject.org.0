Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5D347797
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 12:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100939.192647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1uh-0001cc-Bz; Wed, 24 Mar 2021 11:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100939.192647; Wed, 24 Mar 2021 11:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP1uh-0001cA-7y; Wed, 24 Mar 2021 11:43:03 +0000
Received: by outflank-mailman (input) for mailman id 100939;
 Wed, 24 Mar 2021 11:43:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i1/+=IW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lP1uf-0001bk-CL
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 11:43:01 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62fdcfb8-007a-45b0-a975-3c300bf6f149;
 Wed, 24 Mar 2021 11:42:59 +0000 (UTC)
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
X-Inumbo-ID: 62fdcfb8-007a-45b0-a975-3c300bf6f149
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616586179;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iTj7N4pHuE2hgcgKYc+FQbdTmxFmFJV05gHlobsYi+0=;
  b=KnlqJkkp1b+9H6t0pJ1sUdjlRH6XZBOxvstilIf2OtXsJJ3bI6NHDMwf
   UKiEgSHa4Wh9XArrh3hEO14K2nzfJd4EE5EECRBsqqiuOqjMtpJIy/O3D
   REwvaTspB0JX01ez2fPOJH3S156P3wHOwMMUEuUYe2JAshff/C+IHN27e
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xm8KVo4MB8Sx3+daxYp6XgfvZ+ispejru2YQuMCnk6PvQ++HQsCnkoEJKkeurAKvgUBSgPtL9B
 2i9Si85tucmSYaXXksLtYeYluKfYNtl2P9VcXro5phBYAcYgfBj4cnqdCg2wCMxwnwvuEU97Ue
 JA67Gz3t0oflwD6vismM7G3xG8syXOgRSHdqej8egsr2y+7ZSSYO+csDmSFnAa4UDNyjAfBgCU
 yoqjR6t+6XZ8hqSXYdqWeK5nOq8SJRnqpuoNGVWabw1n8ZEJRYOPllWNkVLnPZB1+HqRRIgc55
 0iQ=
X-SBRS: 5.2
X-MesageID: 41445545
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FKPoRq012CbDQSChREYnmgqjBTt3eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrd3Febg9AGJY/Cd
 647s1IuzKvdR0sH7uGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTfj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+36VTat7XbnqhkFTnMiO7xIQnM
 DIs1McOa1ImgnsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmK0oA3H69fFTB1snEavyEBS9dI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Meav302fA+SyL5U1nkpGV1hPSjUnMvdy32OXQqi4i+1jhbm21B1E0IxMATtWdozuNNd7B0o8
 vDKahmj7dIU4s/ar98Hv4IRY+NBnXKWg+kChPfHX3XUIU8f17doZ/+57s4oMmsZZwz1ZM33L
 DMSklRu2Iec1/nYPf+k6Fjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agi+93OLyaZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/v4mRlO1pN7RIIGCjJ2bTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDfLXXfAfVH+4IJQHKDW8/N78vlOCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4Um6lFy4qllBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR31HuDLRlvctPOHG
 dk1hBK0JPyC6bV6TEpCtqhPG7fpWAUvmi2Q5AVnbDGwsv5ZJUiDNIDVLZqHQvGUzx58Dwa5l
 trWUshfAvyBznugaKqgNg/H+fEbeRxhw+tPIpzsnLQtUKVoOk1XXsFVzuSUcqa6DxeBAZ8tx
 lUyesykbCAkTGgJS8Um+IjKmBBb2yRHfZ7FgifXZ5VnbrqYQl0am+PiVWh+lYOU1uv039Xqn
 3qLCWSd/2OJlZGoHhX3pzn905OenyHc1h9bW17toNBBX3L00wDo9OjV+6W6S+8e1ECyuYSPH
 X+bTweLhhH6vq32BSW8QzyXkkO99ELBKjwHb4je7bc1jeRM4WOj7gBBOIR1o1iLsrSvugCVv
 +/dweZICjjMf4g3xWYqx8eSW9JgUhhtcmt/hLr7GK1hiFiRdXTJUlrXLEdLZW36XP+S/OBzZ
 V+ipYUsIKLQxLMQ+/D7ZuSSThJbi73iyqRacoDrJhPp6I8tLdpBfDgIHP1/UAC+C97Fdv+kU
 MVfb9y77/AMLJ+ZsB6QVMswnMZ0PC0aHYxugP4AuUCbUggon/SMdSO+afJo9MUczu8jTq1HV
 mU6CtG+fjZGwOFyL4BEqo1SF4mInQU2TBH/OmYcZfXBxjvX+Zf/ECiOnv4VLNGUqCKFfExqR
 l9iuv40tO/Rm7d2ArKuyF8Lb8L22G7QdmqCAbJINV2ybWBSB2xq5rvxtWygjfxQSa6bEpdpb
 QtTz1vUu1zzh84jIM21SCuTLfQuUxNqSoG3Q1a
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="41445545"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUBSzl8nJ1glbG1xdkEmyJCktEUo979yBQrpaGYCHl1RK8ePhsuZigtTG0KCWp8e9QU7z7b6jgnwfCOBXJCvlq1htubZWdSqLexnpBulcycFoSQQYBSzxhwZYTVMRH+DQxLmsQTM4mfZUdCDkqQ3A9ffOk3mZqaVDtsVM7z/PJl1dhLwDbpulszVlcfc0AMYiNd540kH736k/qp6RCgZcXWKZgQq0NFQrdg4R8rAJ0RpQ7gWFDGeriubzlUWP4C8vFdG3O4Q8kZg7p6C7tmLvvahAjdg39SbK9diXmrwP+r2ZydCgW8G1PaiePUcBUKs4ZYlOsYApBYZ5O7mhHVvlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKd9B4wxj3mHQdzJbIbkPAbgWlz5P5GDOl309bUAC5E=;
 b=SovTRgd1xrU+4yyjPPsSQ6g8rob/3fKl3G/Wailhxt7cZiNy7WnLhH/lWcXUVHBiTks+fxe1i4lrPAwq015bIwCzsbUXWW0GMTu0nAZYOvBFUDKzL8HLUOACR68jISV1anFm+CkvHinLRWCsl8FYYYls4HyXHscno9luUoRfXphHAcZkHoPpHwmU9O80Bhvk/NCspeqbrXTZM6kOZhWl4PZBHxDvJxft8p+rBqGUejgB5giTBurO9Lwwm1inVMvmmMTlZb9qWoCF4GEM+8PdPL/WroQi7YC7XQ+wrOfqCLhzDTggmttBD6sLkCTh4eeRl+BLUUqu2fwXzXis5VtC/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKd9B4wxj3mHQdzJbIbkPAbgWlz5P5GDOl309bUAC5E=;
 b=pZrlMvPNR//cfrel2GadBhifzL1vNfSZ7YHy6psfYLMbYEdywt+sHnMDXEpP+HJzuXkHrDHdsFketlxjrX3ftVuqK/lfYUvPU75yHXxNn3V3bbyiMz6hku54Ln+eaJxoHojcbxDDAsuPp0Q491CBkJWEdw0bPzkg6rbL5z+cm2M=
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210324113035.32691-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
Message-ID: <5c051a69-44fb-f878-98da-9d6773cca72d@citrix.com>
Date: Wed, 24 Mar 2021 11:42:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210324113035.32691-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0073.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae6411e2-2cac-48e6-63b6-08d8eeb9f706
X-MS-TrafficTypeDiagnostic: BN6PR03MB2417:
X-Microsoft-Antispam-PRVS: <BN6PR03MB2417C8832B100525B78EC045BA639@BN6PR03MB2417.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b4qBOuvQOLw1eVLmSUgLTvkl/0nPP2w/qVdz653Oq5wjd5QbMueVIR8vmQYkx7OXtxv3dTGNrmeRHxLOrBm5FRddTO6pDCeyr1HRIMkN1c08akRjAXCLuKt0Nmf2N6dUzm4q0Go9EkBQzxKwJ3bakcirch/1T9I4nsptqdHC8f4MHQZvguGPJzRzNsJKxUbq11HN33GBE5bOKRnlPVN9JQ0grl1bhZCmnf7k5czkQ9np0/O2sX1yrj276E3HnEkvDY6svH9XuqvcOp5QLvvAam4WSszPIjVG72QYK1801AJykgzWnfDDTIa9h1o3dolKDiV9kP8dDhZHi9zKRNbynF7KgMvKHtEZ0tARMDhP0G8VhTQwDcSSyE/LkeLP4WfAolpqVYQng2uneLlj3ed9aCQnKxI0P5uLSW17LmlLvN3578GFcAQB7v+Xid82b6dNITCfMCM+pJG1o+T1FNQgdxDFp0ZAkEQSpjr3RwC6YmMNppYBWnlsp02zYiYmXTh8aMWZePRuRgCnjPHQWyKTpRBBPuX+JhRWXhU8l0IiUv7UuAmahl+zWa20os+7oEL0qbbHXNF+mdXJpCFyVqs/e2CE19J9VWpaVstZpo61LIM7pesm8QzybKKKoKeL0ZhCzzKSU7o7Fp5FYdyzLjMtmnoNGzV7JCTcMWP1lArwhoWZE8XAWVWilkarvdCUwgqm3sAOxczC+BHNEeiVgb3kZUnij4X0MBKrZ5zW/IG7Kgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(53546011)(38100700001)(66556008)(6486002)(86362001)(2906002)(478600001)(66476007)(956004)(31686004)(54906003)(8936002)(5660300002)(316002)(16576012)(8676002)(26005)(4326008)(31696002)(36756003)(66946007)(83380400001)(16526019)(2616005)(6666004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MjBGZTJ4WUpYc2VjNjNzUzN6d0FzSWtobnRCNTdHWGlQSXcxcFNHL1VVTXpx?=
 =?utf-8?B?dmpUODkyWGdhTks0SkgzcEJVMlltRmQyTWdrT0NmN2MxempMcUJjMTk5cWRG?=
 =?utf-8?B?dTRwMFAxbEpDa2Npdi9LTUFIbWVpQnZ2UWtBMWQwcnptNVZ2Y2x2SnNEMnRy?=
 =?utf-8?B?MHFkbFBSSmF1c2Q1TEN2U1lDWUlOd1BMWklxQjJLRnZJaFRtUHI0aHMwbUZv?=
 =?utf-8?B?TUF0bFRDNDlra2FwTTlmcjZ1ME1STlA2alRnNHNCdjN4eTZYRW4zeVlvNW1u?=
 =?utf-8?B?VGpicUFCSDBjcTNXbnV2aENpTTNWSmZyOUxzTlRvemFadFVCVTJTT21OaCtJ?=
 =?utf-8?B?R0dXZHFkS3hwRXBMTWZsNEJ1YUUvQlNubnhjRStqMkFDbXE0bU93STU0TllY?=
 =?utf-8?B?ZjE4SktmeVhVMDV2QjFqTkJmU1BoT3ZBajY1eUtIbnFRR2lDL05WNDN5MlNo?=
 =?utf-8?B?K3F1MVF6cjdlSjVGcGhmNnJDSDV0cm1SWXh6ZXk3MnBNb0pmOUdXM2lldzNF?=
 =?utf-8?B?dStsR0xJa0t5K3FNN2cyOUQ0NHVmWXJmT1F6NmFFRDk2ZjdYQkl0MkQyLzJ2?=
 =?utf-8?B?NWpvUncyUnZsaTgrZXZyUEJkd2hucWJCNlJ3Z2ZITldoNXM2N0Q0c2dVdU90?=
 =?utf-8?B?aG5QMHZwNXdxYlVYdTdaYlZYMVVsbGNDRkF1bDdpQS94WHNaWTM4UGE0cldN?=
 =?utf-8?B?TnhZOW02ZHNBNG5jQXpuMXJaU0pJbzdvZFNwM0lydVFOeDFIem4xUHdJREhK?=
 =?utf-8?B?WDB3dGEzQVJBcktjalVYamJqVmRsRWRrSGUwNmoxcXVpZlVBcWNkaGd1ZFNU?=
 =?utf-8?B?azNuYkVOdkh2V2UyaG9oK21QeDRVckRZb01aVlpJV2l2dnlYQ0VyRHpyUDdE?=
 =?utf-8?B?UUxVRWV6RG5Pd01OUDhSNFlGNzFnUWtyL1pPdFRSOVlUdmN0YzYzck9wT1lU?=
 =?utf-8?B?dnBROEIxR0k3Q3lyeEw4a0hvNlJDdmZrcjFxRTUySGpRcVJyaG1FUlU1cU9z?=
 =?utf-8?B?dEF0dmM3UllHc2c0SHdtY1BlN2xwYnd2QmRIUTBRQ1FMN2JNamw0bnM3YUl2?=
 =?utf-8?B?N01YdGZQRytYSXo5TmZsWXp1VDdaSmJFcGdZMTgzS2tqRkUwNGp0bFlBdElB?=
 =?utf-8?B?OWlxa2Qwa016WHNqWlZJMEN0ZWpCNTdaeDc1TVhhZjFZYjN6OWJOa2JJdHV2?=
 =?utf-8?B?L0VmTEgydWZRdTlCMVdoR0RWeVFEVXAzTVdNeUNaclhJQkJKQyt3VWkyQ3FE?=
 =?utf-8?B?Z3gvRHVyeFROVTZDYXgxb3BnS0tXRFF1Y3F1eStJaUxNNjFKNCttcGVWcmJp?=
 =?utf-8?B?V01IN0RxS2RHREd3QllaWkFxdHp1K1B4S2NjYWxuL25tWFNRVVBNZ3l5cm9J?=
 =?utf-8?B?czJ5aWkzRWtDYk5QWTlpN0VMcDErYWM3N1NlWjFnUWRLOWVETG1TNGs1NmM2?=
 =?utf-8?B?WCtzQjZmWURTYnpEanljRVZjcGVTalYrL2lmMktFVFAwVXVqRGYrb3k1TExi?=
 =?utf-8?B?ZUMrc2VySVNjbFlJNHhEazRGWVlJUjhhSTRvQkhnNjc3OWJ0TEh1OS9yV1Az?=
 =?utf-8?B?SzBCNHBZbjNQVjdRNGFVVVg4MmVPTkpmTWc5MFpWZ1BqVXc0QWwzdWpFTzNO?=
 =?utf-8?B?TmEraEhhSmhZZFdZL08vZGg3c09XRjkrV1d2bkxpYlgrVEhORGEzVytVenFX?=
 =?utf-8?B?UG93ZTg1NXptdTl0WWd4TFVTUWVIYUZxMngveTNuTGNnT3czeDhwdCtJNnIv?=
 =?utf-8?Q?l0yUSbO7QKzNDvVjDwgXTpLy2E0WCloLeQrJFfi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6411e2-2cac-48e6-63b6-08d8eeb9f706
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 11:42:55.5685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F5wvqhQt49DFPjcXTBmDCfQkvjPszRt2dVdLnKpt0miNJPNBF0jwSWE20KT2Smx8J40sW6G/UcqUhBeFulJE7eESgoonWrmmAxA7ZEiuu5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2417
X-OriginatorOrg: citrix.com

On 24/03/2021 11:30, Juergen Gross wrote:
> xenstore_lib.h is in need to be tidied up a little bit:
>
> - the definition of struct xs_tdb_record_hdr shouldn't be here
> - some symbols are not namespaced correctly
>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2: minimal variant (Ian Jackson)
> ---
>  tools/include/xenstore_lib.h     | 17 ++++-------------
>  tools/libs/store/libxenstore.map |  6 +++---
>  tools/libs/store/xs.c            | 12 ++++++------
>  tools/xenstore/utils.h           | 11 +++++++++++
>  tools/xenstore/xenstore_client.c | 12 ++++++------
>  5 files changed, 30 insertions(+), 28 deletions(-)
>
> diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib.h
> index 4c9b6d1685..f74ad7024b 100644
> --- a/tools/include/xenstore_lib.h
> +++ b/tools/include/xenstore_lib.h
> @@ -43,15 +43,6 @@ struct xs_permissions
>  	enum xs_perm_type perms;

^ This enum is still a ABI problem, as it has implementation defined
size.=C2=A0 The containing struct is used by xs_perm_to_string().

Substituting for int is probably the easiest option, because no amount
of trickery with the enum values themselves can prevent the compiler
deciding to use a long or larger for the object.

~Andrew


