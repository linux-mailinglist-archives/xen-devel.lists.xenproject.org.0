Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED613262D6
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 13:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90288.170841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcST-00075g-5x; Fri, 26 Feb 2021 12:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90288.170841; Fri, 26 Feb 2021 12:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFcST-00075H-2H; Fri, 26 Feb 2021 12:43:01 +0000
Received: by outflank-mailman (input) for mailman id 90288;
 Fri, 26 Feb 2021 12:42:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSsz=H4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFcSR-00075B-05
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 12:42:59 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2835eca6-d918-45ce-af5a-c95a4eb760f6;
 Fri, 26 Feb 2021 12:42:57 +0000 (UTC)
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
X-Inumbo-ID: 2835eca6-d918-45ce-af5a-c95a4eb760f6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614343377;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Plcln42Bxmn51jEPOQUPEgQUTHPDDOSPKgUz/zOKVoo=;
  b=eo+hnzKB6fgTnFB2rhs45XpWgRCcioZlQ2EKhFG7gSdGO3d44sWFoLsg
   dH2q4kn2ARrUb4e02Fzg3xrAM1qJ7l9QtVW6WlsrG4XWdmUWypcef92NX
   /FADa6iK12xW9Qe61QoK4k74pQz5O/sHsjy6619RWOWMuOVCgKt0cXpIj
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g6cKc/XBmyRulc3N+O3hjjTNbEo9YqhlzPA1WlhInS2S60gA8wAXvN4PDMXgZHJ9JSJLsdcjMh
 +Fa5Uw4VFi6L/nbKYXluk4u1xEna/KtKmCUhv+KcpAFf20FHpVrj7fXEfmZ4zz1ja9ISstSIv9
 rMvWEn26L3kXTfxTE+0v/nDF6HObI9x3xWXq863LwoAQuuX98iYl2dCR3v1m2qCVBVfXI8340y
 p/9mgwy61PiMez5Cx3RVDTj45MIuxwcbrjCzivo0EsJcsonbGYE6zw6B4F61gkrPM7g1OB9cyD
 v2U=
X-SBRS: 5.2
X-MesageID: 38292476
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,208,1610427600"; 
   d="scan'208";a="38292476"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cd4HtjIHt1Q7JqcAgGcgqlT9EI+Xp3EU/7KAs8mtRlgqt99nU4s8yse4eciIGMpK/D89RILWZLp481ISbbn6n+nvRZuiTNvHbBNOM+dF4ddt6WblM3U+cBEosHt3/oyBWYgL1yGkvQ7cdy7NoxV31H+g406pCJ0t91qTl/6FGAYj+7PsNCYNbp8mn79S84r1RyMYabLr5LgG6PEsKateCkQMGug9nxrPk+6PlWbhv5ojZk68EjvCAeHaPGBmy5xXWJ0087hv+XwzO3/+yZVAK9IDXmejugxvznBD0ZoShzNsMbQAJ50jY7aOX6Z0dnSfQIWQudqT1JZXfLDf2oLjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJkm1mjHEZI916fYf+gCBZniTqvzXzWhCGrKE9LdiVs=;
 b=ZMUZyVgjexr/xRXWeJ1+yCaLq8djm/sR9eKiEDactKycgVf9AquMu1p0lgCAsWNCUEz/4kmAVKPDWfjbgnWkpVSyLbGnpYnPxD30iFoUfFUUBR8GXgwXFpYFA+LoMAtRm6rcq26ydbh85XdAnJCigdkI3i11kQyZqtFoSBjGzfpgchO585m6TxdwfvJ559W3gUD1e+8t0U++OiX2o3IpIYaVrK2YmEuK0T2GEFoaYZOqkryR5EC+GEaldEkT9DwfTdVYDcg2YwKRoTzEiIGDh9F/8EqI9jxFzOwI4U6QiYbAX7guLPci7fna6haxsVkUiZyubB3fT5dxwQP5cl+JuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJkm1mjHEZI916fYf+gCBZniTqvzXzWhCGrKE9LdiVs=;
 b=p5UQns8rTTgDzDPIZfVBED3o/XbaPKvsHJsV3HHJJ4UIKM90oXy8ra3VMal8+InUlIv/rttq3R9xJH+tYFSLBjukme3dZLapuEo+kdGfHQWaXtFebbo4ftnRMA6n4N7X54FhxUnuHdDNtISL0NZ18j2lH94cxLtVXxOC2tAZInU=
Subject: Re: [PATCH 2/3] tools/firmware: Build firmware as -ffreestanding
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
 <20210225203010.11378-3-andrew.cooper3@citrix.com>
 <23f64cfe-8908-79e1-253b-ad07b7aee00a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b7292a46-b5f4-fd94-af5b-31c709110219@citrix.com>
Date: Fri, 26 Feb 2021 12:42:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <23f64cfe-8908-79e1-253b-ad07b7aee00a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To DM6PR03MB3627.namprd03.prod.outlook.com
 (2603:10b6:5:ab::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9bf0654-12eb-48fd-7cd1-08d8da540634
X-MS-TrafficTypeDiagnostic: DM5PR03MB2938:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2938A99B41AAF7E555E1DDF4BA9D9@DM5PR03MB2938.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WB12l3/4/8X69Z9Eslbtpk0pUKlRae98vzAAvK9TS0rafpbNlCPS16z8gSQU97EVeRalEWPrdJhVytyFjxy97X3BPBHTuRdI6AhUMxPpcmnaueBvt/g2uOLs4y2J6KyVKD+onZqynFuSsHxh+r1utjDGk8BuzhENSGzljeuCYuZ8lsQdQs7UL5pYOFrpwTnkXFjjnQXxsckfJeIsoZqy/WMIbTIB99HoCrT0KeRDLoi36dOYOSvWx+khcpEw65qDl5EhezxniF43fP8/JNTyBOPw/k1wjPI1zzJxKcdetJjlO318FZwFnIlBc+xsULAUFmkmhixr8UZSsAvAvA6NnPsQj9A8oI1bq1LNu584fHHFXDPODc9GR2t4oN05fX6Wa2tMokUbUj3wmGOAEaEY5AsnzVy7oFnWbbTHxZGrhxdKBHzZhuH8e5P/X6HI3HogQCz5p83yyAku+xBBltLdcqY8HTF14RA1Lbqy5QYs4W9TV0oQ7lXHirmZeQcOINuoy1c86CzqMy3+E7dGqK7YoDw4p791tJpZe3FKX8Kz9UljyOZ9B0mAGWTbjakp6ucyyMgIOpLGOIVyMX3DdYRklQKXBQ3FL1iKUt4evgyIiDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB3627.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(6916009)(83380400001)(956004)(54906003)(31686004)(478600001)(16526019)(86362001)(5660300002)(6486002)(26005)(2616005)(186003)(316002)(53546011)(16576012)(2906002)(8676002)(66556008)(66476007)(31696002)(36756003)(8936002)(6666004)(4326008)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aEFFcVo1Vm0rR1gwQy8vcDFJYURpNVM1RnFtYVdkbEwxOWI0ZHVwUnZTNllF?=
 =?utf-8?B?RVdvS08ycnZTNnd3a0MxY0JINCtlMVA1SXJPYVQ4L2N6bWNuc093UytzNTM0?=
 =?utf-8?B?ajlpSU5DTGcrOUJDcUJKRUFQVkl6cWZ2K2pQRWszbGQ1RXRyNGNjcVhFWmpU?=
 =?utf-8?B?cFBXeXo4Rk0yNlk1QWRxWktTMWNCUFZVRGJnZEsrS1ZjZHhhUnJtYzBKVWFj?=
 =?utf-8?B?R1NjWnJuZkM1VWhlRkFSMER3STVibDhiTktwN2ZkVllWTWNYU2lweXRSd1M4?=
 =?utf-8?B?YzF5c05hTzg1TkRUYk5zb1h4YTRNQkZnSDc5QmVadklIdjNkYVZ6VzBmVHQw?=
 =?utf-8?B?b3F6Vll5dkptdHFzUXZzTE1kbHhGYTJDeVhxaU80Q3VEUEcxL1BqbC9IZith?=
 =?utf-8?B?TjFEdHdpeGxRNXVYaEx1N21WUXU4TEZTckRVamhQY05zRmltN2hkc3dLZ3Jx?=
 =?utf-8?B?L09DenBIYndOR1VmOXdjeWVQM3U5aHA3clY1bnU0ZmFDL1ZnR3dLRjg5Qlcv?=
 =?utf-8?B?c21YQjAybURpMnJmd2xTUVRITkZDTlJaa2o3OWVUM2lhclZwcTVsbFdmTlJN?=
 =?utf-8?B?R0tMODMwNEVta0c3WGt4UEZ2UkRqNERmZ0dlTFZJYzFOK1pYdC9VeXJvNVdl?=
 =?utf-8?B?RHcyb1lacnk4Z2E5SjZJZVpobEptZWR5c0tQUEIrWEJrWE0xVHhXZHVzMmdy?=
 =?utf-8?B?ampLalRDRnpMT3ozWmlBRVdzOFlid2RHN25oU0JSdUZFTldFN2NWcGZ1Ukh1?=
 =?utf-8?B?M2lHak56T2JPYW9ZNDhHT1UrblBkVGJYUEpUcWxjRXNLMnh1QkVLcDRIVjBE?=
 =?utf-8?B?UnNrNS93MFMvN2FidnBUY0ZXUG1pb1l1ZHFORlpJdVNtM0V5bW4ybkRBSzEx?=
 =?utf-8?B?aHo1ZXAwZkYyTS9wdVdZMTVIMjZQMndJRUJUODZBb3dHdnRGV29hU05pc1Zy?=
 =?utf-8?B?QmxwM1k2YVRZNTZ6MnVLVzdzcDlHRHhrQlErWWZwSWV3THNTTSs5aXUyTG5E?=
 =?utf-8?B?cENMNUxNVjFLQytDMGxUMHc4ekNYK2pmUG1jR1g2aXQxc2ZQdmgvNHRTbi80?=
 =?utf-8?B?N1JCdzVrdGdScDJ2cFNtTGpOaVlPUXRDYlQrNnFLOGNESWZqYXFBMmdQclVI?=
 =?utf-8?B?eXNvMEV2L29QTlBaZjl4SFRUVTVlczJERll2ZThPN2pEVWtXUVZpV0xVRWpk?=
 =?utf-8?B?S2UxWTNqbkRXZ0s0TXBITzlHNk1FV2NGY2RqK2tLV01TdkNUTisxdkw0dXJX?=
 =?utf-8?B?MVErUW9FNjFsNWN0V3ZUSmQ5VFZwRlduNXlZZUc4eGsrVVY3S1paeE9MeWZ2?=
 =?utf-8?B?RkFCSm9uUGdSWDl0dnpHRFF0YnFwSGhHUThKS2xzdXNNUFdNQnFmdm1XRDVz?=
 =?utf-8?B?Vzg3UzhKRnZUbW44dFQvQW8wT0t0eXA1eUY4c0dYeGhvT2pLVHJvUTBZZURK?=
 =?utf-8?B?Rm05bmsyN3ExVTlxNXhpdGY3VG9DYThubkx5WTNJYzFTdjFqNnZuOFc5L1A2?=
 =?utf-8?B?UVA1YjVZL1hHdWo2N3lmTHZNRHBwYVZXdGd6UXEyTzVycGtadVRUeGtPazNT?=
 =?utf-8?B?MHYyTnBFSkFrWXVFQ2xscUJGSnowTmVKVTMyY0p6enN3WkdqWUFaV0F2aVpX?=
 =?utf-8?B?QnlvRzFqVDJtTE5EU0xjT0JWcGhkMDdiekZpSEFPY3g0ZmRrdjBZZk9HQm42?=
 =?utf-8?B?eUdlMWFOZUc4ZWJ2cTA3dHRXOHNBcklSc1VLUG9lNWJqZHZZNmY4OXE4K25N?=
 =?utf-8?Q?YuB3ut57q4cr7BjhFt630QAXymWGtzFfkIvbnNS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bf0654-12eb-48fd-7cd1-08d8da540634
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB3627.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 12:42:49.1554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ta0NponF9oQye5WSaw54QrcP42RJJJ8K6Mv+wZn0Kf/n9V6uux32UgZI9nfedn6maS2PWqjwQmwrjgbzJLHNN0357JGl2UovF4seKIoZdWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2938
X-OriginatorOrg: citrix.com

On 26/02/2021 09:10, Jan Beulich wrote:
> On 25.02.2021 21:30, Andrew Cooper wrote:
>> firmware should always have been -ffreestanding, as it doesn't execute in the
>> host environment.
>>
>> inttypes.h isn't a freestanding header, but the 32bitbios_support.c only wants
>> the stdint.h types so switch to the more appropriate include.
>>
>> This removes the build time dependency on a 32bit libc just to compile the
>> hvmloader and friends.
>>
>> Update README and the TravisCI configuration.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with one further adjustment:
>
>> --- a/tools/firmware/Rules.mk
>> +++ b/tools/firmware/Rules.mk
>> @@ -16,4 +16,4 @@ CFLAGS += -Werror
>>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>>  
>>  # Extra CFLAGS suitable for an embedded type of environment.
>> -CFLAGS += -fno-builtin -msoft-float
>> +CFLAGS += -fno-builtin -msoft-float -ffreestanding
> As per gcc doc -ffreestanding implies -fno-builtin, so I think you
> want to replace that one instead of adding the new option on top.

Oops yes - fixed.

Thanks.

~Andrew

