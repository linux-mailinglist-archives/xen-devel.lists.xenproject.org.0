Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A076358381
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 14:42:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107304.205137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTyd-0007Vt-VB; Thu, 08 Apr 2021 12:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107304.205137; Thu, 08 Apr 2021 12:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTyd-0007VU-Re; Thu, 08 Apr 2021 12:41:39 +0000
Received: by outflank-mailman (input) for mailman id 107304;
 Thu, 08 Apr 2021 12:41:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgsT=JF=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lUTyc-0007VP-LB
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 12:41:38 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5c438e1e-39d7-4b1f-aab8-597a9ee522ad;
 Thu, 08 Apr 2021 12:41:37 +0000 (UTC)
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
X-Inumbo-ID: 5c438e1e-39d7-4b1f-aab8-597a9ee522ad
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617885697;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ryIe4pgpMmnJqJcYeYmt87EIqCxsBLYZ3RceGTTqfhU=;
  b=JkQ3eijc2eegGmLeB0kxpN60soQ0Icjkg5zcBNZmVKX4YB9QZuPnwkpR
   mXyUW+3lbZJqBWjLMMx1gvREfTPXdDT6Hj03TPJVZJRa8Cf90fW+sZWQl
   cnJHhFloTDoJDk686IhZ/XPETG5u6bkhWriKUkdz4A8oZIJWQMWtL6rV5
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tgTyZo0bmUY2npILjJwtJISM5FVgkhyln5zzHaoiLfgU+LWWndisKe+c+t0F3s5G6C+4rPV2Z3
 ZWbpx2/6Mv4Mg6VcoaRZSa5cv6hQPSFWSzgS9fSfyjAKW/qExGlP5uwn+TouMU2P6tmIq6wocX
 1cdq77NlKObSot8RnwbNQRj+zKBQjBBhUcxVsbfkTPzqGhkY/90UapXx6EXEgxlx6C8EMd0Ygu
 7//RFjeo+Sq+5j81+Hj1q5Uww827mKu+hq0SSBGDmQOnOKiTy0NrG0UdarbdJdLpvMlP4ZpzOU
 8/c=
X-SBRS: 5.2
X-MesageID: 41159486
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7RhmA6/DzSF4mxbq6Vhuk+Ejdb1zdoIgy1knxilNYDRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsS9aFnb8oN45pRUAKe6UGDdyQyVBaxBza+n+T3vHCXi6vVQvJ
 0LT4FSAMD9ZGIUse/U+w+9euxP/PCm9+SSif7a3zNRS2hRGsJdxiNYLireLUFsXglBAvMCZf
 6hz+5KvSCpd3hSTunTPBk4dtPOrdHKi57qCCRub3IawTKDgj+y5LnxHwLw5GZ9bxp1zao/6m
 +AqgTl58yY2M2T8APW1GPY8v1t6b7c4+ZEbfbstuElbg/CpyztT4RnVr2EslkO0Z2SwWdvqv
 bgiVMNO8xy7lnYY226pwD8sjOQrwoG2jvZ5nKzxVflvMzlVBI2YvAx+75xQ1/ixGcL+PF6za
 5R0GqSu/NsfGL9tRW43ffkfVVOtCOP0BwfuN9WtVNze88iTYUUiool8EZcAP47bVjHwbFiKs
 ZCJoXh/vpMGGnqFkzxjy1U7/GHeG88JRuCSlhqgL3p7xFm2Ep0yEYV36Uk7w893aN4T5FF4t
 LNObhzmIdPSdcLbbl8CP1pe7rNNlDw
X-IronPort-AV: E=Sophos;i="5.82,206,1613451600"; 
   d="scan'208";a="41159486"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4HtEJreRJ1zEoRgtXRoZxpULV3nV6J6gurLfHBIef6jv1meENEjMF6/jLaFHGAia3y8HncFfy8aO10r1no0ocgq9PsTwLqNfSlzg+uVyTzUuzlLl+DwaSBWkImLslS2fVZq/yHaW92Azi/uX5oOGadnB8AClJo5g4PbOeU3Ab+j65sMyHiGj+cPXXU8G0rZRqKTK0G3sk2h4xEQdKT/GTIsaWrlBqFAdvSIPvdLgBLYO6zxi8ALbg8skXvHzzaPvFVyxnOfkVehg6IVZpSKrHi0JrUuyGz4JTsSbEnrRNSw+9Bx6FOUEHeQ3ZzUyygxk9jY1FwM9Yk9BLGQ0sUQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If07qClRzfX0OUuucXHsjLGpnpVLjYgZmOcpmshGLqU=;
 b=eQBv1T9Xu3F3zFX9r7S8wxcKmJAcaN3PdHVoSKP7y6vVEBJZo/xI56PKhwJl6KKVc9I/N30sGghSC6GEg0ryLhYN8wwBySpHQIG1aG3ccUoqc22Qn3UytUXJ3qJUQ0FsPf0Pz04F6W14aLqC0Gm0aBKrjF0MskBPqjlrK8Uu59/QU5J0pvdSZsCFcUgT/SZz/2jGTrsNQy0pvmytB1h+L7OZNI9bYxRRJgk/+jGyEjjc6yK3RjAlFHUbJ+AbT6ykODHYT+rVsDWtu+wl8Vjv7uEL5JGAenOY3ONTYDuBkEg1MCIWrmks1M9+pS0WFMPSFXG8wmO0YgVRGEKYiWqyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If07qClRzfX0OUuucXHsjLGpnpVLjYgZmOcpmshGLqU=;
 b=G7+8gms9lYouS4rPQFf2mQuwFUBUL6TwDxJZQ1vDfmQvsvNn+CbNt5VfSjtMM5KQ8flav1TGcLauu5iMTy/ihOV/24HwAPGqPQIqjE9ylFzseaeVV+ShxR7bar5XQ3XM2jb0zydpqj3B2cjWHcRfDi/F5PryoTho3iiV2NMrhkw=
Subject: Re: [PATCH v3] x86/intel: insert Ice Lake-X (server) and Ice Lake-D
 model numbers
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <roger.pau@citrix.com>, <wl@xen.org>,
	<jun.nakajima@intel.com>, <kevin.tian@intel.com>
References: <1608755520-1277-1-git-send-email-igor.druzhinin@citrix.com>
 <2da9c816-fbca-d486-b602-a31e6bb97e38@citrix.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ac4adc10-4c4c-85c0-389e-fd6516810cf3@citrix.com>
Date: Thu, 8 Apr 2021 13:41:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <2da9c816-fbca-d486-b602-a31e6bb97e38@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0110.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::7) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f97848c-3f0d-461f-e411-08d8fa8ba3d0
X-MS-TrafficTypeDiagnostic: BN9PR03MB5977:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR03MB59772DAB7CEC8FF81C080705E4749@BN9PR03MB5977.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rgl+B40hc8vYsUOr99npYR6T/Or8VBtxU+BKJn5qxmfNX/ofRM2cyeLUzofhSN2EF14+cEQKq+wxCu+cRdLyb2YpSO4unewQZoK1qDkaWQwWBW5WxY70D671FGnKbHtzMZ5pTIP/lVr2J3vO/bgN5hnSt76b8pPCNLQNCd4C2CjKyLikbyXtpgYF05bFmc3Vv4BK62RMaebw+53WtXJiJCkT1HclCygQkBIQFbZeWFIZ7S3vpcmDNg1rm9lw3MegmOVnCoiLbRb3E6B/HZoF1vvTv3Hw+DAo7GDcwrqdEwj4sOf2pU7OSPki4V9g5aiB+g3WqB3k8G0Hv6fLvtAlTrad1aXy3z5KEhOWNXS9VfRk9FTJyWhaPh8tg016g8cQ7FkvKb3FDI+ZR5l6cLOKTBT07QqM/ZEygISkeUAGY1wp49lvnacGiaI4aY5fupOsB8+az+jwOIyJ4J9JQfN6WjmkcUvjnLhSOBG49mpdC9HR3Vi78GnBmaF19P37i6pw0Q2rqafliGDIvIUDJ/RTAMom3R+gyh4cif+nqEc4at9B7uZtHl5nTk2AW/cveSGpuBj3GIvBryiKP/88d9Ri0LuiDZU33OBPK3bN2hPxQW619/3peCGSrzSxoEqaDmAr0cXwxsQ2KHQd9QXyKYkJIio1wzvxTeKaVKWgRcGnNqNfqh5qhuJNIYJGalZi4l6Yh1BMRtDS6rTWXns8MpsmHfqS/3/p9Z6VYgAvvBkcJss=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(186003)(83380400001)(16526019)(5660300002)(38100700001)(26005)(36756003)(316002)(6486002)(16576012)(4326008)(2906002)(66476007)(31696002)(6666004)(2616005)(956004)(31686004)(8676002)(8936002)(44832011)(53546011)(86362001)(66946007)(66556008)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RXl3MElrd3VQclBtZEl1RUVsZis2eE50RGQ3bVpZb0tsT0h3aC9zaTRNYkxv?=
 =?utf-8?B?T0JBOWpMNlU4ZkxobXhIRUt0bE9hNDZSS3FwdjVRaVJBU2cyU0JIRmIvZTRi?=
 =?utf-8?B?RDZqSEhTV0oxYXNkd3QwMURJNmtRWlZRWG5TcXMrcVNPcjB0a2NmNTR2TC83?=
 =?utf-8?B?OWFUclcxSjJ3RmtLL3BlTVNwTEZCVERDYTJNZU9mTC92dGdkUjRKOG92RldL?=
 =?utf-8?B?QzdMdCs5eFZEb2U2VjZhWHcvbk55ZXd0K3lWdTVxdVRrSG5hSTNLb0hSUmh2?=
 =?utf-8?B?RzFaamJzTWo0dnJEc3lVUWJyTWpUOWFieU1kN1ZRR21QQ1dLYlFkaTYwOGFY?=
 =?utf-8?B?c0N4Yy9SY0tKYXdyKzBMSUs4MENnaEhWSDVCY21PWjQzdkloeDF1eXVxV01m?=
 =?utf-8?B?WDBGT0NDaDdKaHlVRzVyQ3M3bDdITllKZ3B1VmNkbUUrUjZ2Tnh3RzBueGxO?=
 =?utf-8?B?Tm1wWStLRGpwTUtmczNBWXM0WmFQTU9MQUtoemZLT1RnZ1ZEU0E5Q2YwVldB?=
 =?utf-8?B?bWFTRHdHMXNrV29mdGRka201ZlQ3TnM3VjBNa1N6YVd5RDdDZW5UK2VzT0lr?=
 =?utf-8?B?VjluTWRYbHFET1UrR1lmK21WcHc5T0dGRUUvazdRd1ZDY3BMeWhDMnp3a0hl?=
 =?utf-8?B?UWZ1SmpMWk0remhEdjZpeTdVTkxBMGVlbVNVUHNWWVRMTVFvQm0rRUk1RjlS?=
 =?utf-8?B?RGgvKzBZb1JKV0NIaWoxL3RuT0xNTXErUm1lWVFLYit3TG9Fa2dMc3VhR01p?=
 =?utf-8?B?RGQvb1pSWi82ckRaUXF1VkgwVUxmdkxMclQxK1hZNTNPV3RDMGg4YTJmUnpJ?=
 =?utf-8?B?Y1hyOTJtc1Y1WHdJdlNDL0ZUQjNYSHE4VW5sdEkydm5Uczg3cWtqdXhLZG51?=
 =?utf-8?B?clBVSkM5S05GaUhiOERLV2RJUUNjN1VUVzQrR3dGZTdPMTZ3Mkd5cDhidElZ?=
 =?utf-8?B?NFdMeXlRaWsweUJnTDJtcFM4cjJqZXdvZ1grTk1OZFhseldMUEZXcWVEclVu?=
 =?utf-8?B?VUNjUU02VXQ2eG83d2hEUG40c0FJZ0sxWjFXTEFVYUlTN3EwRTdTRzdOR3k4?=
 =?utf-8?B?RXF3QWVKRk9aZWpUVjM0aG5VaGQzZjV6SFJzR0VsWm9PWklmTyt1NkdCbjV1?=
 =?utf-8?B?RE9QWHkrbGRSSXBoa3FaR0JaK1gza0ZkL2hlL2RTNUJUSWE4Vlc0RlUyMnBN?=
 =?utf-8?B?bE9VVnZLWkdqdm1rcU8vZXpxcGtCMENicGJPcGNmeVVadGR2aGhXWWdZcnN2?=
 =?utf-8?B?aUFQODJscHIzaGhNVk9rVDV2bEphOFNPYStzdE8ya2pPZklma3pLcnd1TGtI?=
 =?utf-8?B?Ymo5V2oyR24yakRhWW5yRFBPSjZ3KzF1eXJkbk5rOHNLajlrVmZ1N3ZHdCtx?=
 =?utf-8?B?ODAzVXBGVWN6cFA2WC8xSWhrQlNyM3piRnY3SEh1Y3FPVCs0QU9kSVBNbEps?=
 =?utf-8?B?bGtQK2V5M0hyYXRsR2REUnVnVDVtNllneXIwcXVSdmxJbFl2RHJZaWtIWU56?=
 =?utf-8?B?UlA4ajlkUHlwaC90emNhN28zZ09DL1FyVmU2VkNzcUljYURZTVZYMWpOL2dT?=
 =?utf-8?B?Z1VZb05WQVF4NU1tdHRSWjJhR1JoV2hYOUttZnZRL0hnQ29waGJwZ1hGQnBq?=
 =?utf-8?B?U2JLU1NqdzlrT24rYWFOZDBSOFV2YTlZWU81azF6aFA0ejdnMTRiZGtOb3Nu?=
 =?utf-8?B?cUNXWFVMbFlvV05XRE1tYTd6dTdzVExtbXNpSDNKWU1Rakl3Q2tIL3JlOFFy?=
 =?utf-8?Q?oB2IvrmMC2/0OVlYsn2/9/zHfoiMztUZR2fKzHY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f97848c-3f0d-461f-e411-08d8fa8ba3d0
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 12:41:33.1538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztcB6u4oz7y8smTdz8exZRpQ3W51Jo4MwxiMM921ugf5lmtb2o81IiN6Aty0l0Fnh5iZaafb1tGmw+6+Iqw59DBKWpPiLFZJDfhpeBTWqNc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5977
X-OriginatorOrg: citrix.com

On 27/01/2021 09:52, Andrew Cooper wrote:
> On 23/12/2020 20:32, Igor Druzhinin wrote:
>> LBR, C-state MSRs should correspond to Ice Lake desktop according to
>> External Design Specification vol.2 for both models.
>>
>> Ice Lake-X is known to expose IF_PSCHANGE_MC_NO in IA32_ARCH_CAPABILITIES MSR
>> (confirmed on Whitley SDP) which means the erratum is fixed in hardware for
>> that model and therefore it shouldn't be present in has_if_pschange_mc list.
>> Provisionally assume the same to be the case for Ice Lake-D.
>>
>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>> ---
>> Changes in v3:
>> - Add Ice Lake-D model numbers
>> - Drop has_if_pschange_mc hunk following Tiger Lake related discussion -
>>    IF_PSCHANGE_MC_NO is confimed to be exposed on Whitley SDP
>>
>> ---
>>   xen/arch/x86/acpi/cpu_idle.c | 2 ++
>>   xen/arch/x86/hvm/vmx/vmx.c   | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
>> index c092086..d788c8b 100644
>> --- a/xen/arch/x86/acpi/cpu_idle.c
>> +++ b/xen/arch/x86/acpi/cpu_idle.c
>> @@ -181,6 +181,8 @@ static void do_get_hw_residencies(void *arg)
>>       case 0x55:
>>       case 0x5E:
>>       /* Ice Lake */
>> +    case 0x6A:
>> +    case 0x6C:
>>       case 0x7D:
>>       case 0x7E:
>>       /* Tiger Lake */
> So I think these changes are correct.  TGL definitely has deeper
> core/package states than this interface enumerates, but I can't locate
> extra MSRs.
>
>> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
>> index 2d4475e..bff5979 100644
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -2775,7 +2775,7 @@ static const struct lbr_info *last_branch_msr_get(void)
>>           /* Goldmont Plus */
>>           case 0x7a:
>>           /* Ice Lake */
>> -        case 0x7d: case 0x7e:
>> +        case 0x6a: case 0x6c: case 0x7d: case 0x7e:
> IceLake Server has what appear to be new aspects to LBR.  I can't find
> LAST_INT_INFO (0x1e0) existing in any previous generation.
Strange.  Updates to SDM finally got published Apr 2 and those contained 
Ice Lake SP details in it - this new LBR hasn't been mentioned. Does 
this mean we can skip it for now as it appears to be undocumented 
functionality (at least publicly) and unlikely used by software?
> However, my investigation also found LBR_SELECT which has been around
> since Nehalem, which we don't handle, and Linux *does* use.

Good point, I'll make an additional patch that adds LBR_SELECT to the 
LBR logic.

Igor


