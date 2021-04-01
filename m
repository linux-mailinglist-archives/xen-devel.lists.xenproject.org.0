Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B883515D3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104600.200260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRysi-0000pI-Le; Thu, 01 Apr 2021 15:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104600.200260; Thu, 01 Apr 2021 15:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRysi-0000ov-Hf; Thu, 01 Apr 2021 15:05:12 +0000
Received: by outflank-mailman (input) for mailman id 104600;
 Thu, 01 Apr 2021 15:05:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRysg-0000oq-8u
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:05:10 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b57ca2b0-371c-4283-9e96-969093e2fbb4;
 Thu, 01 Apr 2021 15:05:08 +0000 (UTC)
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
X-Inumbo-ID: b57ca2b0-371c-4283-9e96-969093e2fbb4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617289508;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eoJCUGWPEZDvA6Yg8CLrgwQ24zajYTDTqaaCkalI14M=;
  b=J7+YD4kYfauGj2H8e3ahlzEbsqRA2hBdm8RfO+vM50zHJHNA/C/nibnW
   9T2X3i2Fj3qbyIsenhvIIHBRfIFt6o9xGAiTntxAFr3cP5cchlpuVFO2N
   YXzD4aUKXRSp3b4pEgZ87HSGW7+brLsD1jHU6MoV28KyY0Cl0qg6hz3Uw
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: TEVvGx3fX4bQ2WFKIFxySNFf/+g79IiNpFxBCyAuLGqRKvk7pe6zHM3Atvw2fp4XGvzKUNQSrB
 7ccIdHdSMXgTnesm5tuHaqdwweySV7oTX2Pbgeh/3KtyPnOrzgvvAWFxH2eUITiujrJtUJc/Gx
 3Csw7hYbISvoe29j9TdP3lKerLQphD9Kp71iJAq8ttXil20brlIoam7rEzjN71QdVWhhH1twEv
 0IwcWYqajEkqH6lXQ59qExyPNXOhQuEKzZ7S0K9czMC9jSOsGxc0nxUmlSzkyUgL4gihMxcJIS
 CTE=
X-SBRS: 5.2
X-MesageID: 40847832
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:L3WlXq7Jrncyz3aAkgPXwWWEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoexzh3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdxHW3tV2kZ
 1te60WMrDNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2BXQotLhj0JbzqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAsqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2F2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW03RoymyYoAJYczkgBkUp6WV5E8ugJ
 3wpX4bTr5OwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OsjMTr6kCvw/NTOXR1x/3DExUYKquIPk2dZFbIXdb45l/1uwGpuDJwCECjmgbpXdt
 VGMce03oc1TXqndXzD+kFgzNuwN05DZSuucwwpv8yY1CVuh3Zpz0cU79x3pAZwyLsND7ZD/O
 jKKaJuifVnSdIXd7t0AKM7TdKwEXGle2OCDEuiZXDcUI0XMXPErJD6pJ0z+eGRYZQNiL8/go
 7IXl90vXM7EnieR/Gm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uu9HImYRdPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFOUIp9cAXU6UqM6jEPyrisXrNNLoYJb9GzctXW3yRl
 EZWiLoGclG5ke3HlDihhz8XG7sZ1zf8Zp8HLOyxZlX9KE9cql39iQFg1Ww4c+GbRdYtLYtQU
 d4KLT71oO3zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG6cWBW132XGw9nQ6rtYU
 lijmUy3ZjyA42bxCgkBd7iGHmdlWEvqHWDSIpZvaGf+8H/eNcdAow9UKJ8USXHfiYF2DpCmS
 NmUkspV0XfHjThheGOl5oPHtzScNF6nUOMOs5bqXXWsG2GvsExTn4nXzqjOPTnwzoGdn5xvB
 lc4qUfiL2PlXKEMm0kmtk1N1VKdSCqGr5cNR+EY49Vg7jvXwl1QQ6x9HqnoiB2XlCv21QZh2
 TnIyHRXf3QGFJStkpV1bvQ/Epuen+QeF9xbX5GoZRwfF62yEpb4KuuXO6ewmGRYlwNzqUmPD
 bJbSA7Dyluy9q0vSTl0gqqJDED/NEDL+bdBLMsf/XvwXurMpSPjrxDNeRT5oxZONfntfIrXe
 qTdxSOFi7xD/ok1mWu1y8YERgxjENhveLj2RXj4mT94WU2BuDKJk96A54cONOR4gHfNr+1+a
 Q8qehwm+S+Mm/8MIHbjY7WaiNOMRPVryqdSfoypZVdoKI1s/9SEvDgIEz1/UAC+C97CsH+0H
 46auBcxpvqP4d0Zcwcey5D5DMS5Z+yBXpuljazO/M0eFEmsmTSMNyI6YfZsLZHODz0mCLAfX
 2ktxBH9/jLXyG/xacXJqI5L2NRclU94h1ZjZW/XryVLAWhbOdY+lWmdle7bb9GUaCAcI9g4y
 pS0pWtn+WNcTD/1x2VlTxnIrhW+2LiZc+pGgqDFapp9NO9UG78zpeC0YqWjD3tTyG8ZFldrY
 pZdVYIZsAGswIctuQMo2CPY52yhFkknVtY6SxmkVCo+rHO2hakIWh2dSvDgptXWjFPNGOvls
 qty5nB6EjA
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40847832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AP4xvwbSJzC4xHVWIkcJkPAfal38RfL1MwHrImyvfkJ/th8cqd6ps22RDBhBQiGB4Epwkdotcvq1iyRswfbE2fY8Kw5G34sOagykNdNZYNstQDkm5+/+56fwUuIVS3/n+zjRYHn6adMi/EGer0gElcMa0UCE4cBLoH/hry/ESivknJRrg4+2ULNlLD8FIMMBYq5p91aKN21hg+tfx0wCdhausAuVg0EYJxpMlrbI/pTHR+7eE6ptOP51qksEt55oXkKxdPV7uUnXjpf81kBlTqxv+1ZbCrQP/8n69894vyWecCghDwAhoEri/o3RXOAxuTR9T8YUol2I9qsFGciMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnfgfRZjGRorKcqd+4krhtohz7Ns1X3vDqoDDV02YgA=;
 b=lCbo92phgdio8S7R4uB+pceP/cf065JyoXPEw3GQhlT5Nji+gcjTZM4/IevKk2qG/cFAx7KWPfkQgbUJO3mr2jSrx695nyBkkcib3BbyV0upPEAf9lE1CwMN3mSUAM5ItXGIcClad5Dww0T33ppMsES8YrutsXMfsfPeF+h6Ig1It/xCzmCBTo+sBFK/LhBx/tL3pyuYFAnL2+95980epCBL0u5TuV2ORdtt1rJj+QvFklC9SqNuTrxyVH5ykilgAHqXvBVeG5OuThRiQrhFewmd3q7HSxRm2vt0Gqbrw2Qh398cYhyDFDbzstAZ9WlUOuiOLuuh+L2gswi7He5k/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnfgfRZjGRorKcqd+4krhtohz7Ns1X3vDqoDDV02YgA=;
 b=YMRhrkkgeU1Bf7tXODY1TrDxpePioel1wXx2xDzkim43f9yyai3ziWuUKXPlcKlTrhOr2WdGcs+Vhcy0sEz+woCs7YJYRnQXECbULlpV2qRcaE29T5sbBPvE38wLcThQuPXo/MR/YFYhG0DvX8Uhrrkt6IsbhSwA3OlUz0WRSO8=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-14-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/21] libs/guest: switch users of
 xc_set_domain_cpu_policy
Message-ID: <1cfae8d7-3708-79e2-715d-dea7f7ff5b2e@citrix.com>
Date: Thu, 1 Apr 2021 16:04:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-14-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 347cbfd8-3d57-427f-b132-08d8f51f7657
X-MS-TrafficTypeDiagnostic: BN3PR03MB2372:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB23721CB21F5538D11A4C76A9BA7B9@BN3PR03MB2372.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4/uLrhNxjHwZKfDRzuVA9gNKPJW79/eez13klzvnwVKiswKWKAPN89vg1Zw4dijfJTWKBxf5U4UbQTe6lJoj4mKyZPCt0fBQee0OUgiEQnQ/5yJsTGpoOpT9BE8dMj8yjvyTXHZ49VMGVGgnRanZcsXy11GJmDD6v1vKr+lYIwo7A9rCGUNrTBYRI1O2RUiH3IDWRT3CsBTyLokVHoxajzPga7oTChEBS3p4JIeJ2j+TRCuC1UUO6lcuO4O5no8UBqLBgQ2nXfxnddlFG6RDhvzRekdNA40utMgHSLd2Aq8IMedTQjVDY4RgazCFFclcybPGtrL/HV4t/+XBYz06yMae4RWAhb2J6whsVWqL6keaWKjVqloBut8gl/jmSSXEL0Yzl9HbHScV0QuDKCIW6qa0DGlA45pKkK9C2Jvs+CX7cIcdI1HU+2hoHsL0LECRkcCvCooQP2GJDRMtBLEaOhjdfMOL5X01ERk6Fpq28MJcvj6aMf7dYWWaUJqg8yuPoEcb3sdKgARwMu+dMW0MIuBWz4gNrItzC0roBkXt5PAVmeGDAKIBEjeeREuD4M21GJPrWlS5ABjF89l9X9L/5ojOEj1QQ88jqnZAnr1loElK2G4uc6D14tbLef2ToRVFwK7HHRqYWBpqxe7mrGbWT7T5OQuufT4+UDpLVip3J7n3aTgpTBdQP/ibtq6utpAxIZ5FQ18z9Iq55lpmJeMtjcVPdOyADmkgczvgUsgVpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(8676002)(31686004)(8936002)(31696002)(6666004)(2616005)(186003)(956004)(54906003)(83380400001)(16526019)(26005)(6486002)(36756003)(86362001)(16576012)(66946007)(316002)(478600001)(4326008)(38100700001)(53546011)(66556008)(66476007)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VzJFdHBNWUU3ck1ISks1SmZScmk4bFlEaW1FcXRIYndHUGFuQVFESm01d29Z?=
 =?utf-8?B?SGYyeEljNXVtQkhYRkcwMUZueXJsSDk2WUV4VXNtVHlzWC9nN3ZKSmJONkNN?=
 =?utf-8?B?a2c1eHN2eEpPa3VDZ0NQWlRXTFJNTWNDUSs4RUZDN3NWSzFvWmtNNThYNDBV?=
 =?utf-8?B?bUNPcTNIUVNQUUxkK0tTdmxHNXl3RkJ1RUNMTnRKd1p1TVY4M05GZm11RnFx?=
 =?utf-8?B?WmxqZEFuNS85Ty9Oa3pDMmNSODlJVVZuRER1ZkVlaUNDRXY2VkNKYjJXSU1Q?=
 =?utf-8?B?Nmt2OGlFWW1QT3pWNEdPUzZBY3EwLy93UE94dGRicFRIbVF4b3BFc3k1WU5o?=
 =?utf-8?B?UWVQS3pKZFVVTFhBRVU0Y0hMK1B4UnNrV2tYaHpnK1hpUFh4dUR0c1hjMzZr?=
 =?utf-8?B?OEx4Uld1c25GWG9jYWJQaG04aVpreGsrOUV3OE5RcGNvVFRScHk0c2orYkVM?=
 =?utf-8?B?WXVJbEEwTFFMZnhLd1A1UUtuM3hsajdaRldoSmZ5U0ZsSVQrQ0YwdkJNeGVw?=
 =?utf-8?B?YlU1TFJvd0F3QUdldmxJN0lBaXMxZ3A3VkZJVkt1MEJLcld2V0FTSkdhR2Zy?=
 =?utf-8?B?dTY1S3VyL1VqZ3dINXJQNVVyTHJNTGp3OXoybytUVHkrN0tjL2ZRekE1SmpU?=
 =?utf-8?B?N1ZTNjhEQXNGZXFBOVdzYUpkS29qWk1QNE1FQSthdnNBcitQMWk1aFVlL21T?=
 =?utf-8?B?di9jNFIvc1NrM0dPQk9ZKzZDT0psWWMraGorSCtHZFFiMWhDc3JpRmIyT1Fp?=
 =?utf-8?B?TUVhb1Y0MG43cGhiS3NiTkJ2NlhDTmVGWXd3d0lrdUQxRWJTb3hQUzRHZDYz?=
 =?utf-8?B?eDcvVU5iUEh5MVhVSmwweFBjaXlDa2FQZ1dkOW5iSHRFVjBYb3BBc2FybUk4?=
 =?utf-8?B?ZTg4SkRhVDBHU081bU5wVzZUTTVoZzNrRitpYkIxdkdqbDJPNXo4QS9XbzRi?=
 =?utf-8?B?dkQ1V3doVjgzUEN0RFNMT0UzZktSZFVNSXUreGo1akNVaXFhb3BCQVJPalcy?=
 =?utf-8?B?aEw2MzV5NFY2TXhpSWN5ejJkMmhiODYvRmp3VUNJWnhKUDd1RXFMOTU5dGM4?=
 =?utf-8?B?OGhSM1VxaEVVZWM4MjYwUUJYYk5XSTRGekQxQkZyOGZmUElnRG9EaU1iODJy?=
 =?utf-8?B?SXZNU3h4K2h2S09COEw0L043Vy94bDY5c0xyaU1udHc2U3dNKzUwTktuU1Js?=
 =?utf-8?B?WmIyRjBtdXBlSXUyU0tsNjF3UVdDZGgxVEMxTC9uMkdIY3U2azZQclpSakdz?=
 =?utf-8?B?bVZGY2FQU0dLbE5QMTNhSHZwcEVFNFVGWERsakZUTkkvOHFHZnFsMGhYNTdV?=
 =?utf-8?B?dTlLdjN4bXVnTXRvZTNmYmZVUG4vcEsxeE5jbjlLZ0tDOTd6ZUt4K01VY2VR?=
 =?utf-8?B?d0EyNXZlN2tiaUJreGlTb29FdUsrVlNpQjI0aXVvenRyK05yK2ozYm1Xa1R5?=
 =?utf-8?B?WkhmTmplLzRzRDhsbXJMT0Y5NFhOdjNTMWdhaGlYbHlKcGlVSjZ3d0s4TnJQ?=
 =?utf-8?B?UWhMT1hvM09YOU5HMVVacmNxNmt1RFFUWTdIdlYzM0J0SlNZZHJBZ2xjZysx?=
 =?utf-8?B?Tk11eWMzd3JnQmwwQnlDVnAwZ0lBQ3B2ZDFOWWN3dlVoTzhUWEt2U3pOUUo5?=
 =?utf-8?B?RWNkOFl4QnpDby9CZEQ5dFRCTUY0OWZ5cWQ2ekdJc3lRbkZielFCVVBONUZN?=
 =?utf-8?B?L05tK0EyUXJ4dWJNTi82dVUrT1JYNzBHTGd4b3VTdFhDbHhVZVdBSEdHTlY5?=
 =?utf-8?Q?KlxZ5GpcjPFCicWWURbswndHoNvshTT8dHL0mKI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 347cbfd8-3d57-427f-b132-08d8f51f7657
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 15:04:35.3403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C28o7fiYjatAfz0usAIXjYxok8YPgYyWnsLWNOclD5CxGw01FpBSmGrkuFNg9A4OqMPwSgGbpPBIG98SGHMrqZhmV1Crz9fzdEEbuHV2yms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2372
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> To use the new cpu policy interface xc_cpu_policy_set_domain. Note
> that xc_set_domain_cpu_policy is removed from the interface and the
> function is made static to xg_cpuid_x86.c for it's internal callers.
>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h             |  5 -----
>  tools/libs/guest/xg_cpuid_x86.c     | 22 +++++++++++-----------
>  tools/libs/guest/xg_sr_common_x86.c | 28 +++++++++++++++++++++-------
>  3 files changed, 32 insertions(+), 23 deletions(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 46f5026081c..164a287b367 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2625,11 +2625,6 @@ int xc_get_cpu_featureset(xc_interface *xch, uint3=
2_t index,
> =20
>  int xc_cpu_policy_get_size(xc_interface *xch, uint32_t *nr_leaves,
>                             uint32_t *nr_msrs);
> -int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
> -                             uint32_t nr_leaves, xen_cpuid_leaf_t *leave=
s,
> -                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
> -                             uint32_t *err_leaf_p, uint32_t *err_subleaf=
_p,
> -                             uint32_t *err_msr_p);
> =20
>  uint32_t xc_get_cpu_featureset_size(void);
> =20
> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_=
x86.c
> index 07756743e76..f7b662f31aa 100644
> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -204,11 +204,11 @@ static int get_domain_cpu_policy(xc_interface *xch,=
 uint32_t domid,
>      return ret;
>  }
> =20
> -int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
> -                             uint32_t nr_leaves, xen_cpuid_leaf_t *leave=
s,
> -                             uint32_t nr_msrs, xen_msr_entry_t *msrs,
> -                             uint32_t *err_leaf_p, uint32_t *err_subleaf=
_p,
> -                             uint32_t *err_msr_p)
> +static int set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
> +                                 uint32_t nr_leaves, xen_cpuid_leaf_t *l=
eaves,
> +                                 uint32_t nr_msrs, xen_msr_entry_t *msrs=
,
> +                                 uint32_t *err_leaf_p, uint32_t *err_sub=
leaf_p,
> +                                 uint32_t *err_msr_p)
>  {
>      DECLARE_DOMCTL;
>      DECLARE_HYPERCALL_BOUNCE(leaves,
> @@ -405,8 +405,8 @@ static int xc_cpuid_xend_policy(
>      }
> =20
>      /* Feed the transformed currrent policy back up to Xen. */
> -    rc =3D xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
> -                                  &err_leaf, &err_subleaf, &err_msr);
> +    rc =3D set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
> +                               &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
>          PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, m=
sr %#x)",
> @@ -638,8 +638,8 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t=
 domid, bool restore,
>          goto out;
>      }
> =20
> -    rc =3D xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NU=
LL,
> -                                  &err_leaf, &err_subleaf, &err_msr);
> +    rc =3D set_domain_cpu_policy(xch, domid, nr_leaves, leaves, 0, NULL,
> +                               &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
>          PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, m=
sr %#x)",
> @@ -833,8 +833,8 @@ int xc_cpu_policy_set_domain(xc_interface *xch, uint3=
2_t domid,
>      if ( rc )
>          goto out;
> =20
> -    rc =3D xc_set_domain_cpu_policy(xch, domid, nr_leaves, leaves, nr_ms=
rs, msrs,
> -                                  &err_leaf, &err_subleaf, &err_msr);
> +    rc =3D set_domain_cpu_policy(xch, domid, nr_leaves, leaves, nr_msrs,=
 msrs,
> +                               &err_leaf, &err_subleaf, &err_msr);
>      if ( rc )
>      {
>          ERROR("Failed to set domain %u policy (%d =3D %s)", domid, -rc,
> diff --git a/tools/libs/guest/xg_sr_common_x86.c b/tools/libs/guest/xg_sr=
_common_x86.c
> index 15265e7a331..02f0c3ae9ed 100644
> --- a/tools/libs/guest/xg_sr_common_x86.c
> +++ b/tools/libs/guest/xg_sr_common_x86.c
> @@ -151,7 +151,10 @@ int x86_static_data_complete(struct xc_sr_context *c=
tx, unsigned int *missing)
>  {
>      xc_interface *xch =3D ctx->xch;
>      uint32_t nr_leaves =3D 0, nr_msrs =3D 0;
> -    uint32_t err_l =3D ~0, err_s =3D ~0, err_m =3D ~0;
> +    xc_cpu_policy_t policy =3D xc_cpu_policy_init();
> +
> +    if ( !policy )
> +        return -1;
> =20
>      if ( ctx->x86.restore.cpuid.ptr )
>          nr_leaves =3D ctx->x86.restore.cpuid.size / sizeof(xen_cpuid_lea=
f_t);
> @@ -163,14 +166,25 @@ int x86_static_data_complete(struct xc_sr_context *=
ctx, unsigned int *missing)
>      else
>          *missing |=3D XGR_SDD_MISSING_MSR;
> =20
> +    if ( nr_leaves &&
> +         xc_cpu_policy_update_cpuid(xch, policy,
> +                                    ctx->x86.restore.cpuid.ptr, nr_leave=
s) )
> +    {
> +        PERROR("Failed to update CPUID policy");
> +        return -1;
> +    }
> +    if ( nr_msrs &&
> +         xc_cpu_policy_update_msrs(xch, policy,
> +                                   ctx->x86.restore.msr.ptr, nr_msrs) )
> +    {
> +        PERROR("Failed to update MSR policy");
> +        return -1;
> +    }
> +
>      if ( (nr_leaves || nr_msrs) &&
> -         xc_set_domain_cpu_policy(xch, ctx->domid,
> -                                  nr_leaves, ctx->x86.restore.cpuid.ptr,
> -                                  nr_msrs,   ctx->x86.restore.msr.ptr,
> -                                  &err_l, &err_s, &err_m) )
> +         xc_cpu_policy_set_domain(xch, ctx->domid, policy) )
>      {
> -        PERROR("Failed to set CPUID policy: leaf %08x, subleaf %08x, msr=
 %08x",
> -               err_l, err_s, err_m);
> +        PERROR("Failed to set CPUID policy");
>          return -1;
>      }

I don't think this is a good move.

All it does is waste time shuffling data in userspace during the VM
downtime window.=C2=A0 The format of CPUID/MSR data in the migration stream
is (deliberately) already in the form to hand it straight back to Xen,
and there will never be additional policy changes here (because that
would break the VM).

I'd just drop the patch entirely.=C2=A0 I'm not even certain if we want to
remove the thin hypercall wrappers - I'm pretty sure some of my low
level unit testing plans will want the raw accessors without being
forced through the xc_cpuid_policy_t interface.

~Andrew


