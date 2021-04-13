Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7527835E0C8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 16:02:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109768.209521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcM-0004vB-1h; Tue, 13 Apr 2021 14:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109768.209521; Tue, 13 Apr 2021 14:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWJcL-0004ug-Ti; Tue, 13 Apr 2021 14:02:13 +0000
Received: by outflank-mailman (input) for mailman id 109768;
 Tue, 13 Apr 2021 14:02:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=51M0=JK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lWJcK-0004rK-98
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 14:02:12 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48c99015-3a53-41f1-8730-55d527821831;
 Tue, 13 Apr 2021 14:02:09 +0000 (UTC)
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
X-Inumbo-ID: 48c99015-3a53-41f1-8730-55d527821831
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618322529;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=OVrwr3BA9em1iIl+C3YJ3vNrkONASrz74AXCzhLJFEw=;
  b=OPhIvVgtDGgWBs1bHMIP9Sc/ELKEsdBbPMSjvpxr5y/+rseriBVD/uX9
   gVkCS/AxV0/48a8H6Ltji90UuO/9rWV6UygI/Z8u41hBIqx+9779HxFFr
   kv13Oodh30zUHQMIcJR+uhRzkmVkhUWSO7Sex1BIWVqpBIk4EySLAn6Hw
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: SeCTuAeuUTjiNEw5xG0CgRsQnlCMfV0xcotneONWGIvmP/zwSIl9G0eajD6fFwGIKOStOGSvNc
 aWpQsM6YXBerPURXrIm0E4kkHgNRVNCC56csl701RM3YFVY0RE6/DVxmWwfVx8QRNUueo2XSUk
 Z8ov5TJLPo1jXsfuIqoUy1ayizIbVhur8uH6d2me3JIZ06D6dWQKe/bZEH83s0YC+C0wA4y4UH
 wFG7TYPC1vwn3AO8cWO4fYY4oqa6/l+WF5SBQP6rAbITtmb4K3CzVkj8Ezcz3tBqcvkqUwhMgK
 kEY=
X-SBRS: 5.2
X-MesageID: 42955875
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:7t9B8aCGp8u4YT7lHegptMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmNEIyycFVB7QxQDOIEwE4
 CS6tECiz2rf3kWacrTPAh4Y8HoodrXmJX6JSMXHhJP0njysRqEyp7fVyKZ0BAXTi9Vzd4Zn1
 TtvgTl6syYwpeG4zDG0Wu71eU1pPLAzZ95CNWImowpLFzX+32VTaBAf5HHgzwvuuGo7z8R4a
 nxijMtJd565X+UXkzdm2qV5yDa3Dwj62DvxDaj6BOJy6yJJ0NJN+N7iY1UaRff4UY71esMqp
 5j5G6Fq4FRSSrJgSWV3am4azhRikG2rXA++NRj6EB3bI12Us41kaUvuGlREJsGARvg7pEmHO
 REHKjnlYhrWGLfQHbDsmZ1xtuwGlw1AxedW0AH/veYyj5MgRlCvgcl7f1auk1F2IM2SpFC6e
 iBGqN0lItWRstTSa5mHu8OTea+F2Sle2OCDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJxrwcJCgLTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSWopj9Crr5wkc4zmcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQlc08X36Iv8LXOqznvuHWa5/oVfjQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oWkGXx+M0LIHqu8wojKQdPIxFtQYYzX6j4NuQFDFEuqsqOG
 93ILbtlLKHtXC7lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR00GaYIAR8C+fbCh
 RWqVgy2a/fFe3f+QkST/acdk6KhXoao3yHC70GnLeY2MvjcpQkSrA8WKJwEg3PPwdvmRljrV
 pCbANsfD6dKhrezYGeyLAEDuDWcNdxxC2xJ9RPlH7ZvUKA4f00SmAjRD6oW86PiQMITz5Z72
 cBtJM3sf6lo3KCOGE/iOM3PBlpZH6MCLxLNgiDeb5Zg6vmYg12UGeMiwGLkh1bQBuYy2wiwk
 jaaQGEc/DCBVRQ/kpV1avn63tYXGSQdUAYUAEwjaRNUUD9/lpj2+6CYaS+l1aLYlwZ2+cHLX
 Xuej0JOD5jwNixyT+YkDuPDm8d250rJ+DRZY5TNY376zeIEsmlhKsGF/hb8NJZL9joqPYMSv
 /aVAmPLj/0YtlZrTC9lzIAAm1Tp3Ylm/+zh0Ggw2i8wXIlAf3dZH5hXKoWJtmA727iA9aEua
 8J+e4djK+VCCHWbNXD9IT8KxhkATnXqXStT+4ppYtP1JhC/IdbLt3+a3/wyHpD3B8CN8/6m0
 MVfbRj7Nn6S/pSVv1XXxgcw0Egm9uOJnY6qwDaAucxelc2kn/QVun5lIbgmP4KCk2FqBCYAy
 jmzwRtu9PEVTCEz7gUFuYZJnlXclE17B1Zjam/XryVLAWhbOdY+lWmdle7bb9GUaCAXZEdtA
 xz7d3Nv+iZcUPDqU3tlAo+BqJF6GC8R8yuRCqKBO5T6tS/fW22vZHC2r/7sB7HDR2ha0oZgo
 VZdUsfKuR74wNS87Ef42yVUaz4okUsjl1Exypo/2Sdg7Sb3A==
X-IronPort-AV: E=Sophos;i="5.82,219,1613451600"; 
   d="scan'208";a="42955875"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3XokpEHaMnhaA3jpVQSpPGCz28oHwcnso4E3it17TPbnWfEDHblv6E8X4E05soRfgHwv31L2BFmgsUFzSytfOK43Yun9IPHImhhqtDxCauTodzGEi1SA5nCJ8UV9d7tdQSWJZ6aCj/YQe9bUmS47l7mH1rtp0/wcFDFLCo/59P1tuNGxLYU5Oy3bceztzWIaIS2IZzgWRM2zvYib3A6f6Lmi1219Oo163HQor46Jv9TccMW/qU+XGTblLTs8QCrlPcy47dfBEqXf0OyB7MObtndIvAhIzzY1ucyOe+kPL9Jx8pZBNA5479R+JVuR+VTGhjm+xGVh1NECS4WhnwsGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoWJS/SFtHWRRkap7XLMIw8mpVF2QgzC+GpX7sO6F4c=;
 b=W7edqZkYpnseA/m33je5UCCLA8cwe5dCjViWAXgE14MGUdY32u/JuXBqI4QvejzLdbA6ECAPZJmiq03TKN7P58bBULr5t4VuAhcMFxrojAj8SprSq3WXZOaaarYC/P9EYyydxd4JPUnneQf3o7ECRrsVIs7J4lle8llAppBnYrWTB9TMzjJi2RFqwLuuMCmMK1nJ2G353Es8ynAvqgBT7QuV6EY+ayFb2xWSAogoCGgszZSJN2WnbtLpnRI5NGKZq0WkAou8dp2YRXCdJpXUD6QYE6kX91Ug+5oWasiQEaoMbrxm14xwODE630cyi1G4sWhGc30+ofwdhXNGgHp9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AoWJS/SFtHWRRkap7XLMIw8mpVF2QgzC+GpX7sO6F4c=;
 b=sS7038EEzn81OYlq39E8SeFvBUnN5DNNw2ZRy4VvK9kUoB7OhJg4U7ZGcfI+93WAecHIrKI3pZCYB13Guw5tDdv5FF2WnXRNbUax6dvgoxahueGI9855/DlKY4cl0r8fNPbZDs/5fOukJjGiYkuiy5l8DPGbNDlwDabBnty1l3w=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 02/21] libs/guest: rename xc_get_cpu_policy_size to xc_cpu_policy_get_size
Date: Tue, 13 Apr 2021 16:01:20 +0200
Message-ID: <20210413140140.73690-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210413140140.73690-1-roger.pau@citrix.com>
References: <20210413140140.73690-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0146.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::9)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a425bd-6181-4761-2d64-08d8fe84b9ab
X-MS-TrafficTypeDiagnostic: DM4PR03MB6096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB609607FAD102A90B04FE6E848F4F9@DM4PR03MB6096.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2asjK6QgMbZDc/csizUOK9m+dMKrGmxI/EyH2CXZWt35m93mly94Lgt1SUd5ueffb+p8ckGbcgCYEedtkYpjQKN1KmuAgEGtBbEuekmlsIa411aRJ19kb7g511Nv8l+CyNZrHi375ZZoykgc9fN1hbqSuHXWYY2jfK10Csf58vqdDClo8ki9oRhrn5p8eE79Knlxeuf0htt87LUi1gIurpPOrL3ujZ3SpBmd5b9djFpImb5O36ZqdkZLxIO4I5Wly9oo/8Yuf/c+7OfslAgdol5PUCdpyZ9RAtzxV+f16AZy3brNTpPy1T+HHpJtIy4qvfa1n7AOoNVcIjH5U1ZcGW8zfdPxQHKZEXjXJV44YE2aUadf9X0ldZwOrRKkbegvBMvWdA95QFhMKUayu1fO8Qzy2Zs298/admYVq5IdLUYgjT9itjrwtgmUQPzd36dCi+QcqxMywUPssj8NFum897/9dEwH8InzF4G9mfrtKZOqywyyiDTjHT4UCsvQFqQ1VK+DxrgLkRmbqeCXIRDrRnsRzZAA0YMrjkrx3xyRa+q+tslf9m3JkVNobipMI2bLT60+oNeo69cskPQdKnp4p0KGBiZbfJsSuUL4WmQK8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(39850400004)(396003)(346002)(26005)(6916009)(86362001)(36756003)(83380400001)(186003)(8676002)(6666004)(16526019)(66476007)(66556008)(54906003)(2616005)(6496006)(5660300002)(956004)(38100700002)(478600001)(1076003)(4326008)(2906002)(8936002)(6486002)(316002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MlBxYm5nOXpDZHlER3NBS1dCQm9HTmFOdWM3RTNTS0Y1cWE1d0d0TitCTnJi?=
 =?utf-8?B?VzlOWDNhRmNWb3Ixc3lmem5oZmxwR3RQTU1CZVJiamVnSXNpS1VETEdtYW93?=
 =?utf-8?B?TVllT1hzVDJPUXlhZ1JVM3UxQ0tSb2plSDBlbnRaSmVpaDhzZ2FiYWVORGRw?=
 =?utf-8?B?UC94YXpIMEFybXJRNHFNS01pTWdWbHBWMmpYbHY3UHJKYU5YTWh4QlY0Y2gv?=
 =?utf-8?B?MGZSUlkxa3VMclRoSDh1eVJnc0pDMXpibEdoVEVQZzNpd3RtRGlPYW1wTzFI?=
 =?utf-8?B?Nkh3eDM5a3hxalcvck44YmZtQ0s2Yi9NRWFZeWpUemt2SkNraWlVMzJaa3Jy?=
 =?utf-8?B?R1Zjb2laeEJKaW9FUFpSSVF6eGZCRnVjU3p5ay9icDJHTzRNeEIwWE8vcWsx?=
 =?utf-8?B?aSt2MkpPRDJYRzFPSnBybkFtM0ZuS0ZQRnRXd1RRb2hZeGVraWJVOTFmNTFl?=
 =?utf-8?B?cVhITllrYzdMa1ZqNm5rVjB6MTV5Q3NjTk9xbHcwWUQvUHpLeWxsWjZZT0ZS?=
 =?utf-8?B?dWc4NjY2TXlONFYvbitLWkVlRGkwZWNDb0g4d0RhbmQySWdpVGZEMktVZzRF?=
 =?utf-8?B?THlIMkw0ZkZJem9VZUI1ZUVvQUFpYVdpYlFQQlRUU2M5ejBiT1JrQ0JtUmxX?=
 =?utf-8?B?NnVsR3djWFR3SVY2QzRPN3lQMTNtWWE0THJ0S0JZbjltdWFENjJYSHovdndZ?=
 =?utf-8?B?eFBJZmg0WGRKbEY5Vk1vNVZkK2l2bWdxVCtzNnV3emRXN3JBUDdsaEIrc0Yy?=
 =?utf-8?B?cTNZOHhOZHdJZGU2ajZGa1IrblVCblM2NXFKRE0yQmdQdFZpOXVmYndUUVEw?=
 =?utf-8?B?M0dKQjl3SVQzWWNweVpzOXN1eFlhKzdzSytBU3lFSnk0TVFLTVcrcHhQOEhu?=
 =?utf-8?B?OWZXM3RVQkV1SXNxNEhaQ2ZHc1J3SXE4OUdkcnhDMEdoY01zYXZINld5dGtC?=
 =?utf-8?B?ZnJROVEySWNGSlFCZER6T0JhLzRFZUM3OGVEWlhYYXU1ZU1WN3Bqamo5VytQ?=
 =?utf-8?B?Z3JsRHlHMTZTSGhna0VZdm5TWXJ6THRCblVUOVd3Y0Y4dXNEakJaRi9KSFcy?=
 =?utf-8?B?cFNaRE9FbXBXSFBBY0FML0JYVVI2SVU1ajNPRnlwcU1rdXJOZG5uYWFpRmQ1?=
 =?utf-8?B?ZmZqVytUNW9XeUlYYmpwU1FiTHJDWGsxTWcwTFBYR1FjVW5nRlV6WmhyRnVx?=
 =?utf-8?B?SlFya0ZFOU1LUzdEeWR5TWFMM3lVQ3B3cm1NTTBoSm5sYmlWYUMwZ3lza011?=
 =?utf-8?B?MGZnVlFHb0hxdUVuZW9vaW5WU0d6YXJ2MzVFNUgyUG5JN2NzUHJSVWdJNU0x?=
 =?utf-8?B?dGlsNG5ITldPQ2hLZTZ4WDhFYTRtcjNNaTRZK08zMzZ5dkdSUXk0VWZlVmVS?=
 =?utf-8?B?RTZGb0NmRHlzYUxyR2xya09TVDJsRVorWkdLUFFWeXFLbUN0eG0rOGZhc25z?=
 =?utf-8?B?RXl3SUFmbi9sYW9BMDlxdlFoREg4NWxQV2hLdnljWHdQQ2lPT0hCTkluSDJu?=
 =?utf-8?B?SHlwbFhiMmpCTkxvTVAwUEx2eHpnbnlRd0lhWG1MRnZyQXNIN3N2T1BQVmdZ?=
 =?utf-8?B?b3JuVzBjRnhFQ1JRN0NCR04yNFNpM2k5N055L09nbkRtQTlIM0V1dVdYQk90?=
 =?utf-8?B?NUIxNjZiZWEzTGVUNzdVQVA4SDBHK005Tmh2cG16amdlelZvOTZydXFMdVgy?=
 =?utf-8?B?RDVGR1dLVDNPTnVnMGV0bE1PTWhOcHAwZmwycC93V0I2VXdsc3k5c0FqUkFM?=
 =?utf-8?Q?Qha/tAjRnEuhTaH0p+54XOg13eKOSKbXgS0Xt+S?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a425bd-6181-4761-2d64-08d8fe84b9ab
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 14:02:07.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g2Fzh24Z/ay5DGmpo/3r0qkbvzyuHJJGNEwtO65VlejzaVUcXhDt6EfAGjOpMgprWOKf0WCn147TOExvFj0hNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6096
X-OriginatorOrg: citrix.com

Preparatory change to introduce a new set of xc_cpu_policy_* functions
that will replace the current CPUID/MSR helpers.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/include/xenctrl.h             | 2 +-
 tools/libs/guest/xg_cpuid_x86.c     | 6 +++---
 tools/libs/guest/xg_sr_common_x86.c | 2 +-
 tools/misc/xen-cpuid.c              | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 318920166c5..e91ff92b9b1 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2594,7 +2594,7 @@ int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
 
-int xc_get_cpu_policy_size(xc_interface *xch, uint32_t *nr_leaves,
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs);
 int xc_get_system_cpu_policy(xc_interface *xch, uint32_t index,
                              uint32_t *nr_leaves, xen_cpuid_leaf_t *leaves,
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 5ea69ad3d51..cc5cae95725 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -109,7 +109,7 @@ const uint32_t *xc_get_static_cpu_featuremask(
     return masks[mask];
 }
 
-int xc_get_cpu_policy_size(xc_interface *xch, uint32_t *nr_leaves,
+int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
                            uint32_t *nr_msrs)
 {
     struct xen_sysctl sysctl = {};
@@ -302,7 +302,7 @@ static int xc_cpuid_xend_policy(
         goto fail;
     }
 
-    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
     {
         PERROR("Failed to obtain policy info size");
@@ -448,7 +448,7 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    rc = xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs);
+    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
     if ( rc )
     {
         PERROR("Failed to obtain policy info size");
diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr_common_x86.c
index 3168c5485fd..4982519e055 100644
--- a/tools/libs/guest/xg_sr_common_x86.c
+++ b/tools/libs/guest/xg_sr_common_x86.c
@@ -50,7 +50,7 @@ int write_x86_cpu_policy_records(struct xc_sr_context *ctx)
     uint32_t nr_leaves = 0, nr_msrs = 0;
     int rc;
 
-    if ( xc_get_cpu_policy_size(xch, &nr_leaves, &nr_msrs) < 0 )
+    if ( xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs) < 0 )
     {
         PERROR("Unable to get CPU Policy size");
         return -1;
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2d04162d8d8..52596c08c90 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -462,7 +462,7 @@ int main(int argc, char **argv)
         if ( !xch )
             err(1, "xc_interface_open");
 
-        if ( xc_get_cpu_policy_size(xch, &max_leaves, &max_msrs) )
+        if ( xc_cpu_policy_get_size(xch, &max_leaves, &max_msrs) )
             err(1, "xc_get_cpu_policy_size(...)");
         if ( domid == -1 )
             printf("Xen reports there are maximum %u leaves and %u MSRs\n",
-- 
2.30.1


