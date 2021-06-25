Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9B53B491A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 21:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147382.271638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrAA-0007Fe-Bg; Fri, 25 Jun 2021 19:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147382.271638; Fri, 25 Jun 2021 19:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwrAA-0007CS-6y; Fri, 25 Jun 2021 19:06:50 +0000
Received: by outflank-mailman (input) for mailman id 147382;
 Fri, 25 Jun 2021 19:06:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwrA8-0007CM-P9
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 19:06:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da136eda-1a35-4a21-892f-a25e36c401a8;
 Fri, 25 Jun 2021 19:06:48 +0000 (UTC)
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
X-Inumbo-ID: da136eda-1a35-4a21-892f-a25e36c401a8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624648007;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9QYXDcFXZk0aAgorQhIjJYkbL6evADUdI8LiYEvQg7o=;
  b=caiE9D1yrzyR6DkPDGw+NFTo0rWzUHHs50M/TbAsjmv+PsfLEHEtlbYx
   Qvtdj4Lz//HDaDOS4jgRxxn6QY8fApdxsUXUkn9t2c3i3wiGAMoJUcHQI
   uENGYgM5uEho+CqPfV09I7ix4lHJzWqKglgFKL+vb4P/msK7tmLxWRE84
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BKop2HIsPA1n3awfKgOlgaTxFyqmCSnkkr7ai02wl1ShErbICGXirhNoRhfFK27+Fpp51wpZvT
 4p/epPmB9ENLhaZkjPussgTAJFYB0td7LzaSSgaNB0LauoaOaXTk5PdMZl1Azin2rpGwVc8Bhw
 KPsph5Fv2UYULliV+MGgQ1+Z/Vla/2c7gcnSo3nYD9K4Q4P0tFn2QoMbffGlKeGBSLnyHejxll
 4v4f8c00RKE9Hy3dpwkuhkED1hb+K9UgZQgpk7sNzgEo2Kh9QXk22YYlqtAjiWmeSRmKHLSsHv
 FlI=
X-SBRS: 5.1
X-MesageID: 46713856
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:bl6SUapAFHsuV/T7qVlRvtgaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkzVQcexQueVvmZrA7Yy1rwYPPHRXguNbnmBE426gYz1LrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh1YwGPnayFqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD79jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU811rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1nkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMgjgYdq3MgiFX5uYdA99HqQ0vFgLA
 AuNrCd2B9uSyLeU5iD1VMfmeBFNx8Ib2W7qktrgL3e79EZpgEg86O0rPZv10voz6hNPKWs0d
 60eZiApIs+OvP+UpgNctvpYfHHR1AlEii8fF57HzzcZek60iX22uDKCfMOlbqXRKA=
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46713856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isFZWFdX2y/BrZwN+fxo9UaAOyScxmky63k4IR0CzcULhS5xTucwmxLbTGuUDQ1om8/4x8XUCmiSNEBaHvJ5nzZdhnbY8sN9fSseQ3n8XMuhXwoVIobRYWA1QfoNVjJ6iL9UwRPcqsWR93vnHJoIVbYSg3KGOtD0aw7YxWQfmt/8Hl7i6674LMRVW6o9H5LJUoNom9tnP0PK2mehA7gIKPdnwtE8sjHAglyvWiuSS+UWs+J0lDd5l698J4LdOkhbuDO7AxdNpP7cU8gGVNjsmiyZe82tuD3pjTeDzYK7k3ondEdLA6Kj2FAwHFP0Yq0d49M2+i2IiTMQGX9EMtWtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QYXDcFXZk0aAgorQhIjJYkbL6evADUdI8LiYEvQg7o=;
 b=n+Fk2QbizZuJDP/wkEl/wxAw5JNc49liYKJvSoEmWjDqo5SrYYhVVk1To1zFUp3y2zsdgpEq5kuwllXIbOr7xfwKw1+IBUjnS6OL59nA837wGtSfgmH9KMRMsX0a68uA0jcrpSizUpVSAYX1mfiZ+HQJPT54Jgb+UszG9ApxDmQfGSyNZQM0H/yPX7VIk5FWetBYqApTt3GXtqqoMAwhID45kdxKi/gmATLXyfpKULRqat4YdpbWtQqYKAAv/C0YZ7PxBfyZwV4y5nUprrdF0ilzLJ5q6sTzZwFuO2l7S0t0FE/kB5N7WwNvKkr62NdEEk/fnLTsRI8uENzWKCMwfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QYXDcFXZk0aAgorQhIjJYkbL6evADUdI8LiYEvQg7o=;
 b=eI84XKwEL2PEiiSK18nzKZSouBmO7HpQZg93xL5xnba7R7vJgaLCUFCA9Cd5cBFJ5veIH2S43IuaZ7wdqxpHqaPU19O17uMplqcNCz8AkqPkFfvSqYhY1DeXxl8Q+W3ogJHZuMzs1lRGzySsqWOLKYJKPAbONRW8KugzV7h5+TE=
Subject: Re: [PATCH 07/12] libxenguest: fix off-by-1 in colo-secondary-bitmap
 merging
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <cec4594f-f346-c951-b0aa-55d7a56cefbc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6bb4fd84-a25d-206b-8e82-eeef06d87bae@citrix.com>
Date: Fri, 25 Jun 2021 20:06:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <cec4594f-f346-c951-b0aa-55d7a56cefbc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66541ecc-d633-49f1-17c9-08d9380c5f75
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5438E87A84E50C783477E0C0BA069@SJ0PR03MB5438.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:203;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRlCjrTVwMYjeTfYkBs7QL7RjENgVhDPUzCJaR5Xs9k75LcwTDqxZGBnYwlJZSkp4+IYJ2c5n94tTMxRTfxJjM+qFo9OKyYlo3bDkDJECZtBiB1VVVHbAdeq7r839XTYh/VsfTQ+WXN44IIHoJKcG+jA+AI/nEFR6HvPGuLFSzLv2Rcu2FAVcRoe6dATzS4yTB65lgRM3JTqEsaA2J4RQeZwJUdqGB421WhUS1H+hJXA6sM2poMAQ67R0u3lJOpagdDrS0wZLf0p5GJUQYirpsVoAXqkpEFgDYAH9U0R5RZ4idGpuxVQWlegVu0Z1+2XWBRggCCUUd0s7EIEWVj/kovn7ncx32sP/3KYhVGZnGHBT+6fsU/DJewjWW3fEEh7F7BrI2co31idFVGhLJSr4p9yjj5DE+HLrGsB+OZyY6pki2YMZFydNmEc3wDYWXuxLLuMPBKDfxvD9Cq+woZF+OIPclakrGw3daKkmwKA6JV7Pgb5wevPgo/7R6x6Yfum6vLohVKoIoRJCfcAx5qJf6fR6cjg5FrpuHtQgTmvS2/JLqlBS3Zx1D1Lh/mq/WPkNryUSBApGn/IEeVP4xjpH98mPDI1OI2VZKA9fTIepezHjhiJ00VrefTUTE2HQNdyJNGpZ4wb6PkR26g41EwbsO7FycoJl63xgX+a2/ClcDGanO4LUtAaFYb5QaIpBSEBKKqkRDHcH9kE0MBA+TXSlxcbHrEWKaXfV5x4QHve0eHmDeNe6BwrvpItG+xuOFIx
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(5660300002)(186003)(53546011)(478600001)(8936002)(8676002)(6486002)(54906003)(86362001)(26005)(110136005)(31696002)(36756003)(16526019)(6666004)(66556008)(66476007)(2616005)(2906002)(956004)(4326008)(16576012)(558084003)(66946007)(316002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjRXRldHY3hYY2E0M2U4dUoxZkpyb1lIMFVISnl3SE80d2dwRlkrc0tsZkdW?=
 =?utf-8?B?cG0zVzlHS1QvRzlBcVFQWlE1TGVOUWlWcVRKOUhVWmRtRStNZkxCbnZ5dk1P?=
 =?utf-8?B?NTFoT2tTK1NvWWt1Z0FBZ0dQTUJTQTc4MzBGREdiMTVJaUhIaWxVb2R2N05k?=
 =?utf-8?B?ZXpUSzkreWFtM05CY1VYRG9TU1lxdUt3KzJXSkVzQmJldkp2cURnMTJ4UURY?=
 =?utf-8?B?VHlicHRrL0xHQjAwTWREWENtSVRoRXIzcTBHeTI1RHk2VzlMMm1iZ1dzd0hE?=
 =?utf-8?B?MHZKOGhwMC9qUDFXVUdMOW9tS3lhQU4rYnM5REpJSmNCQ011VjR0TWdNc3FU?=
 =?utf-8?B?dW85R3lQNDRNNU9NMkw0VWFkSkhrcmN1NVBKeVpRT1hob0dVbUdXdHlXQ1pG?=
 =?utf-8?B?NUgzMjYxcndqRTlUVkViMzhzRHlUSmw0c1JyM3BLSDdoM1kwZ0RxcDUzUm1P?=
 =?utf-8?B?c2ZPaFBLaFZRZlppMU1CczlkbWFiMUZwQ3Y1QXRDRDVCTmYwRVlZRnZrVEJs?=
 =?utf-8?B?YytoY3NHZWp3czJHQWpCTnRCS2h1bm0xUmdOV3cwclB0YmE3bldqMnRac0xu?=
 =?utf-8?B?VXg5U2IyYS9jdjdkcTRmNFFmTDBsYi93ODJUU0VKUFB3UzdNcmFBU21XK04v?=
 =?utf-8?B?dWlmME5HdDhVL0hRcUl5WlRjRjVaU3FRMy9YOUVjbzhoRnQwczlFS0lWTkh0?=
 =?utf-8?B?ZjFnQmxvNkxlSXlobTltWUszQTRQaTRwNWt3MmZKOGEzcXI2Q0FpTnBKTWR5?=
 =?utf-8?B?ZmNOaWppc3dRb2M3UHBCZFhYWjRoOU5lRXV3amF4WkNxcDk4VDBHdXZnN3Nn?=
 =?utf-8?B?RlFGM0QvV3lBL3dVaGpFUkMrQlFiL1pkRG1YV0RhNDdOUDFWYW5xSHprQXhu?=
 =?utf-8?B?Rnh1SG9ObXlrNk93a05jVHgySkY2QURuSTdaUGlZL24rNlROdkxXdXdtM1Js?=
 =?utf-8?B?ZTcrSm5OM2s4RHFmWlpIS29OdHV1emRrQjQvUlVlYllYRjVxRnk0VDgwR0U1?=
 =?utf-8?B?azFQdUZBSXVLaXA0VVl6STVNZnNKOEw1Uk5BbVFGVStkY0tqbmd1MmVkbVo0?=
 =?utf-8?B?eTJoaG5ZL050eW16eTV2YXdMK0s0ekdCa2VJSmI4ZUlvTW56NEN1NmExaExt?=
 =?utf-8?B?OUFyamM4OWM5M1VvWk9rR1dCMTcvRkh6enBndnNBMHJQUU1MTlplY3NHUnpv?=
 =?utf-8?B?cnozSWFYVFVxOTB0TzJscXoxM2UwWnkzUE9vRVgxdlpqQnZoMkFCOVNYbTNy?=
 =?utf-8?B?RmJSTVkvUm52RlFBQXc5a2Qxcy9WOGFJRVdUYzdQSjhyd0Y1SlFDTGVzQVBL?=
 =?utf-8?B?dHpqU1U4MDJrQzBqM3hjd0pyMzJRek1PbVorc0lyUDhYaHdrOXBVZ3lsbVdZ?=
 =?utf-8?B?aXFHSUdNTlZVbUZ6anhDU3VZYWc0YnZuQmNDN0JYUFVRWDZaU3ZSYndEN2ZC?=
 =?utf-8?B?SlN1L2FqQ24wWnU4U1Zuc1F2U1lCdUJNeTUycXRHdzFHU0g5VW0zcFF2M1V2?=
 =?utf-8?B?RWE5M3I4MnB5blVOSlFDSkJrVlFIaE1YMVB2Q0Y4Y2VrUnZaN3NBUTRwTHFI?=
 =?utf-8?B?SnhyZjQzajM2Rlo2UFpsMFlnbnJQRGFVem1GWWY5MGRlMWRaeThCWDJZbFpS?=
 =?utf-8?B?djZDS2NsNjNMN0tQcEV6SWRYREFtZWF4ZmZPaFFKRTM3bDJXdW1aWEtVd3dV?=
 =?utf-8?B?NHpKUVA1L2hMaTBVQW5UQ04xUU95Wm1zOVZJT0Y1QUovY09KODVYV0dBRzc1?=
 =?utf-8?Q?rlAEv9v3KMoDBowzsTTbS4AcJ8YAkn42307D7ex?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66541ecc-d633-49f1-17c9-08d9380c5f75
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 19:06:44.3717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RKNq0DorW2tz1bzR+CaYBVGCdw9s47gKIORpgFkdR8izYRGFC7uj79L+P6MeWeNo65/dFYXc8Fjm6dHG86ewWt9zLc2g0xs4GfugUk58G58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5438
X-OriginatorOrg: citrix.com

On 25/06/2021 14:20, Jan Beulich wrote:
> Valid GFNs (having a representation in the dirty bitmap) need to be
> strictly below p2m_size.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

