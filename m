Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578C132D3D9
	for <lists+xen-devel@lfdr.de>; Thu,  4 Mar 2021 14:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93252.176024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnfC-0006Kc-2B; Thu, 04 Mar 2021 13:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93252.176024; Thu, 04 Mar 2021 13:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHnfB-0006KD-U9; Thu, 04 Mar 2021 13:05:09 +0000
Received: by outflank-mailman (input) for mailman id 93252;
 Thu, 04 Mar 2021 13:05:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TcPH=IC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lHnfA-0006K8-OW
 for xen-devel@lists.xenproject.org; Thu, 04 Mar 2021 13:05:08 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b22e9d5-8b18-4c68-8af3-813e6eec1f37;
 Thu, 04 Mar 2021 13:05:08 +0000 (UTC)
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
X-Inumbo-ID: 6b22e9d5-8b18-4c68-8af3-813e6eec1f37
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614863107;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0DIh/okI9xmy+VhqN46rptPSCx+sAw8vsVrdOeHdlOs=;
  b=ct9C2RE4waOCiEtOroBDZJrnHVI5AwoNoGkjdYzKG2R79sBiNOG0l4LG
   yQ6FZkokXzLHbpqFZpGTpUhFVtl2csqmgV9FPS5uC4ssBdTzHiEV0+Bpu
   iCEWBi4rlTTsjyRnH+o72m3JahS2Q/2cBYqUMJufvh1QFrSPj6zK9I5cU
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: I0einA/3+wRUOyZtR020a5K34qBBwtP57nVVNqow1sutT9K8A+Oqe+7LsOsUiCWA+f50OqksaL
 i21tB9B5IFw1dW6E3mnlIMMLCUGgFcEK8PIFC0KQUS+rTZHbDdoMfzoHjnLTNq15/c7Y5yrEfQ
 bHtZXi1m8rYxWBSl9ooZ1H+Ht6xPDZEp62l+HvRI8szIN1CvlynqmtVHnicMZYO2hjvye8BzNd
 nPhTAkaI4sI21RpjGXSCycqhIoMhGOSM+Csix1pn4LChh8dY+Bs8uhfGqhU2mN99qm3deyqolB
 j+8=
X-SBRS: 5.2
X-MesageID: 38542140
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,222,1610427600"; 
   d="scan'208";a="38542140"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nef2iYJNv+dqZL1ro6FAJSa7/cyw8C/AqgOmKLoycQPhYKgK4tNnGfBV4MJjQ4TiMLxPEtgWNPd+C8r0shSfcKw2U5ffC3fJz/33r07hzjJiAP+6+eL9+keEb1qY3LIR20DzxQp8ldtrk15vJC42ea/XrUpTuHlAkN8ezwhpprbvga8K7BH68CXg1uWMIDIxOL/l/sbqXeKjA+evfqbfl5TJHhO4HgrTvtrRPmN7CwqOBDoV1d50iFFKROtxwU30EjA2yqFixF2asdnZacrRzhjGRiRxwfTQHuZuzp6pu4+Gsyh/oLWEIhlTbEZ7Lzd8UQ7E5Pwa/uxo6ob7VC2zzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DIh/okI9xmy+VhqN46rptPSCx+sAw8vsVrdOeHdlOs=;
 b=kkB+i7IM0FXQvDiRp1c+XrIQUIoEdgl1ZMCYovzY0Por5hemEWrkC++yPrEMMEQW9P/9kLH4yYQYpL81LB2w4CmlLJ8DyUdSdeh6/rOBOHBKcTMyKZ0MC4oDVysQB9n7PcTILZmW+O4oWeOCBf/JNnEd386cLir/tsAfHpy46xTDtNWTbLUpY43KpizQlgbW6lEibKQZl/2GgTIxNZTd9Gl4SThFE9HE1pZLosoZN5ktPCX0EGoXfG/a+ZvoAPlIfF/aVV93cYZbk1IxIw9tZMhqVHHcY+hcDVSUfxMkgoyJsBbAk51zjAT6NA1L95dPGR9eLc06VLkM/IzJ+jnkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DIh/okI9xmy+VhqN46rptPSCx+sAw8vsVrdOeHdlOs=;
 b=N4fwQ3SScVfOYMwjM6NVQBdPSkZMeYmpNmZkSd8vk/OxiAGDqoiGkfUVwZEALjA2/hfyFE7IokPsmZGYwIEO1WRcv5dbzi0uAI7Ec57nr/WxX/f37KtKZ3yndfIOqaCOjRENRoag3hby/nTnp7uK5o3HDntz2kjaEnrKhn9Pnlw=
Subject: Re: [PATCH for-4.15 1/2] xen/dmop: Fix XEN_DMOP_nr_vcpus to actually
 return data
To: xen-devel <xen-devel@lists.xenproject.org>
References: <20210304130200.10521-1-andrew.cooper3@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <bb9f63a7-bae9-c29c-1688-35b9ac9781c4@citrix.com>
Date: Thu, 4 Mar 2021 13:04:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210304130200.10521-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93a82f0a-2611-46b6-d498-08d8df0e08be
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-Microsoft-Antispam-PRVS: <BYAPR03MB4679FDB78CABB13F06336860BA979@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v5FiZ89pv0Zd9Jeu7FV9eNMUtIlsiwCo1vaNcjghPUWqXlDaGB35RQyXM8oh01/omB8g22FIvmJMK8sS9gFD8wsL7Ze5M/pCyI3OVqASJXzyY8n73kQXMyxpmqml6xxS85FLNDFdAjMsaTq1dy8dWAKb1ByJ7u4qR9RsV4h0l6+Tdo5lMNofvQ3Tgf1GDyzEEngF2bt+ztS6LWZwidIyQiNiJagORJH7ZEmvJIeAVehMXL+BuYVmMJGga9MXBAGhQbdgt7kkx2q9gd9N2WMmR0gxmRh7JVnVLgaWo72faxcJ7nCRjJUUYeEzLyVacOFDmo1TIQE+IX8Bu6pTydcXog03qtQur6vvXk+RzPjCw7tYaHSpb0bTu2jexqdOi/Xer9/5viRZcg5kcbBf+8cuJHTHlYMYenwHSnKLslW4G6mTmj6MbbLc2tjSa5DV1GJv/RavfOv+KFIjw2y1JsnqV7k2/KWEY4NYUbkZ7p3rKIat3aM6GG6e3dgGmrYUPzSwa8wy4ya/LBh8aoQEkoTqhJr4NzZAgI65GKKpcLtmyvtOMFQqDHaAy5GNlV1eQ29jXxzbPATntVWsAo6MnVKQSB2NzC8nP7pf/d8vnwGSmsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(956004)(86362001)(6916009)(66476007)(2616005)(66556008)(478600001)(66946007)(53546011)(31686004)(16576012)(6666004)(16526019)(6486002)(316002)(8936002)(5660300002)(31696002)(2906002)(26005)(8676002)(36756003)(186003)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDd5WUhneGdTWEY2ZDBBaVVlbk1xczFqVmo4Ykg2SzcyUG9FK3kxUkRveVIx?=
 =?utf-8?B?Z3Jja0xJZ1BzTTZtTWFxUTU5aUc3Y1RPVmFFdGlKZnJYTGVISE01ek9Xb29N?=
 =?utf-8?B?d0tJQ204ajR1cTJPMFQ1Q3ZrWHVXYnF3Rm8vS3NmUnBsT1lENElHdmwrbjVR?=
 =?utf-8?B?cTgwYlZKUWE4Njd3R3BDdlRBdXA0aVZ2UnIrZ2NWS0UrVE5rM2orRkNUTE5z?=
 =?utf-8?B?SlBBbngydG50QTl1WVd2djF2WXd1WUttTXhhck96RjdwTzJHSlgvOGpTQmdt?=
 =?utf-8?B?V2V6emROdTBmM0ZPdENvTUNGU1lCS2xXQnF5dXp3VS9hTGdDenM5WUcweTFF?=
 =?utf-8?B?bWt6MTFiRHU5MlF4WHBNZ01lR3pwVDkvaHdNUlNMaFNmWFExSG9uZ1Q0amFH?=
 =?utf-8?B?anRJYnNhc0d6YXdyeERiSXpWSFFkUGxBTzhWdWlzTDFZK0FRUHM5YWljVU5q?=
 =?utf-8?B?VnpMZnd2ZitYVElBcXRUeVpjZXJEcFRCUXpIeGVHcTV6UGQyOEZ2dEtYMUJy?=
 =?utf-8?B?bDdKZHlaRUlUbWNrbU5UN1lTY0M1eW44bFdhbm1HOFVLQ1JLK1J1UmlaTUxM?=
 =?utf-8?B?cmcxWTNINDBVM2pwcGxoQnVIT1hBWndPaDhPTDR4SUFudGUvRnBWdVUwWDZC?=
 =?utf-8?B?SS9PUEsrdGNDM3N0VTNnR3ZpMkJWTUV6bDkzY2ZZY2s4SHlWaXFvYzZ4eFVD?=
 =?utf-8?B?UTQyais3SmcycVNMTkJSUWo1Vi9RYk5EQjlSQXJ0b2JyNFQ5RFZSNzhuQ2dY?=
 =?utf-8?B?VktlR1NqN3BCWlVLbHdHNW5xRlUwT0EybU55alJiSzlYcnhrN3U4SFFIeHhL?=
 =?utf-8?B?Y1JqaDVzemhHTXlobUxhUVl5QlYvcUNhWmpEa28zVjlxeTNjdU1rUk9GUE9X?=
 =?utf-8?B?ZTVzTVVJaThFOHN1WlUwYlU4K0l3Tm1RS0xWSzFrZXlXdVB4Qys5eXFqMEV0?=
 =?utf-8?B?S1dYcm5hTmhVTVBzbVRndCtmZDJ4aXhiUGVkTS9mT3JrSmxuRXdnMDBDLytn?=
 =?utf-8?B?blo3TlBPYjV1UjBtU0c2d1RFM2YvRnFxQ2p3OEFDcXV5dnR6M0dlNDRpK0xL?=
 =?utf-8?B?WVl6Qy90RTJEZlZiYTRGdnJJMEt1OVZITEErUVBhU29XOHhQRlYydDVGa1RZ?=
 =?utf-8?B?aGNPcDQwOE5xVkVtL3FOUWN6N2pwaEJ4d3hIc1Z0a0crdm9sOWpSVUFrSnVI?=
 =?utf-8?B?aGhFeUFGdVhRR2dhTFZvaFZweWtuYVFmR0JTYTZzaXNPS1dNck9VV0VTbWtk?=
 =?utf-8?B?Vlp0NUhsVTFCWExKRXVIQzZJMHNyZ0hUdkVnVytpMm4waStrMnN1dmRpOHNn?=
 =?utf-8?B?WmxlSVo0d1UybmIzaDdxL3p6NTU5cTIxejQ0c0VNbHQ3THhQbUVUdHROc0Zs?=
 =?utf-8?B?Nmo5UktmSjIreWZUSjhaaStwUjR2TXI1T0lIbWNnQ1Fzam1kZldKcVdZUjA3?=
 =?utf-8?B?Sis2ZDVXYkVGLzV0b1IzT2xMU05kZFpuTHhlSURmZU9YTzVSeWoySnFLTXdN?=
 =?utf-8?B?WG5nNThKMWp4Qm9GaVlEdElCUTBGdjRkbzBDYnhLajNpbVloK29DOFJnY3BW?=
 =?utf-8?B?M2R6N0FkWlhhRlA0WHR3djV3WU5XSldoWEFBWkxKNjNvektHQWRNUzlLRGhh?=
 =?utf-8?B?YnlZdUREeEpwRHV4SmZRU1VHZSt6M09SbjVMa21ydU84WGFOSFRpZWkrVVlF?=
 =?utf-8?B?RlErbEUydERmRDhRNmIxaFBlY2NHZW5MZnBlQVh5R3A4blpVM2Y5c3lBQzZw?=
 =?utf-8?Q?D101vkMdCgP4lVt7g5jJ2nvWYVnjloTNjnQqFQt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a82f0a-2611-46b6-d498-08d8df0e08be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 13:04:24.4873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKHyD9mEBGf1ATTlTVyRJcJx6yHNKb+IbmnOJMxu5Ie9tGhUl6g/vWmtxVZnch9iJNT6ADVQaB0gOJP1QpKArwtTGmlLGsfVPxYZK93szxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 04/03/2021 13:01, Andrew Cooper wrote:
> The const_op boolean needs clobbering to cause data to be written back to the
> caller.
>
> Fixes: c4441ab1f1 ("dmop: Add XEN_DMOP_nr_vcpus")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Apologies - I made a mistake with git-send-email.  No further action
required.

~Andrew

