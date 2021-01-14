Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203712F6AC9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 20:22:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67516.120578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08CO-0006MH-VK; Thu, 14 Jan 2021 19:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67516.120578; Thu, 14 Jan 2021 19:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l08CO-0006Ls-SC; Thu, 14 Jan 2021 19:22:24 +0000
Received: by outflank-mailman (input) for mailman id 67516;
 Thu, 14 Jan 2021 19:22:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUaL=GR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l08CM-0006Ln-Ny
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 19:22:22 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5642901f-b1dc-4191-9b9f-03dc999afb80;
 Thu, 14 Jan 2021 19:22:21 +0000 (UTC)
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
X-Inumbo-ID: 5642901f-b1dc-4191-9b9f-03dc999afb80
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610652140;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9JdjAYvWUQrk4X8s5meiTkEdZpC/XiFO10RJWOGkFXY=;
  b=dj6qV+qbwA8tsXQaAIgqGH3AHvZ32VAJMyDjazVdQ3SoOcyusW6XsifQ
   K+Vhcd/MwFt8I3d8cI5aWuYhgZ+uurt8L4/Ds5Cs6SmuPd8PY7c+PUTnJ
   1fLpRa1Lhfu6h/GGDBybYpguDiWVcY8G5YHpL0OhcqyJ3h9yctAS79PKD
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4zjJrOME5EGS05wmIDe9lMxWir51pP51ICcmZBM0+cnIxi2KxX/uaSYTQqdcSZKHlQBr8YDOZ1
 xr1VHMSeQBP3vx4voeK03MV4/J/XyoCkkuZvELy3qQ89/1oe1nzDAjvtSwZHI+X3oaqH3JE16t
 UfSFanGCLe/xQ5rqgF6hYC/8G740rc7nHaLdXhMTha6ggEyoxESCeWrXcUKe3Ya2Zo+3Uwk6qK
 sDXpunRf64EA/AyzJ/gBPwja2Nrpc7f6tQ8RHPJx2GvlVbxlVzT9/7fAUPBKb2sRKSApjOQZ0B
 tZY=
X-SBRS: 5.2
X-MesageID: 35165510
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,347,1602561600"; 
   d="scan'208";a="35165510"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dojyrngJXFT+W6fTjynO0f9nZSTvOG7UAO2j/q45dmmp78WbvHKScd1q5jOdybz/J2/3GSMjeKTm7ororyK38MYDaf64EUSCBd4bL0rd5kq7pJISuYOqny7Xup1ytwA7esrgRBUa9ISRh4EFYnWfb8sMtYsWBLTOUvD/Rb7RRiMWOijMFkPNAFy5tEkbYdDq+gr/f79sovlGswHS9Kuz4S4ZBkcG4lmTKPtqMbucol6/j9bm1W95gfYiQXsPmJgIcHDfO0zLAR5DvmtySItC4J4N6XyWs28ySQ4yLayJtZScfyVvuZLWCHhJs7XDMvZAO75OaYvpJxpStuZszphksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JdjAYvWUQrk4X8s5meiTkEdZpC/XiFO10RJWOGkFXY=;
 b=cl/bdyBHdJirfcHeXbynmpWMKrPeazHy/td3BhZP7z2n7kHMHTaGqyw7Di2Tqb7PIlYflQWBdGcMCLrnNkpq9F33lyC229RIIJCyq2xNaL4FjuaIwuMvtjoBcr4THVLSkhEPPyYmAopXkffR9RPBuOwa3BZhvybUb3XDeA6TZhShRElkXy6WAU3d2Y/Knryk0sDNYfDAYh5076snXJOknBZtzREqQHKwQe3GXbBO/qr4oyi/AAP6nUvwo/rlr4W9K+qhyASYnvI4gfBceXkLCVKvIyaBjYVPYKf7IX3Dka3GmVrXiS5TLCbCXBZNxnVS2ojZfoqle9kvFlNyCZtakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JdjAYvWUQrk4X8s5meiTkEdZpC/XiFO10RJWOGkFXY=;
 b=rSWxX9WUQuSUf15MlVtOjLYcAoyAujurW7hLuUqy6SOy1SxboKsrBMGBdpPFOo1KtX34o+QbL65Bbt/g+Cwnxy9JJkuVPf1EMs5l+sY5ZFU6Gj/17FsTOBbHQp2sQPko96HjBTD7qyYmaiI57mVjVYE4O5QL37ZyRDRbWRzJFrw=
Subject: Re: [PATCH v11 02/27] tools/libxenevtchn: rename open_flags to flags
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210114153803.2591-1-jgross@suse.com>
 <20210114153803.2591-3-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <47ad6cc3-e75c-0a92-27dc-a6d42286d0dd@citrix.com>
Date: Thu, 14 Jan 2021 19:22:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210114153803.2591-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0126.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::23) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddce9618-fccc-48d5-8858-08d8b8c1b1ac
X-MS-TrafficTypeDiagnostic: BY5PR03MB5063:
X-Microsoft-Antispam-PRVS: <BY5PR03MB5063A2E36F6330203C5B6C2BBAA80@BY5PR03MB5063.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qwCRA5jxqkHj9azX6XnpQ9pJD4AGB5q7t1M+VlWaV1YvqEjXZMaIYSItyCbX7++BPzaamBERZsOJsbZ+T8G6tDroTGVWQMaTLafUsryZ5Uczzxqyfxci8cwijnBpbDDJbUWnI4lbJkjjiFmUIwi2lv75GdD7ehJtaKhjTsfoDcfAFHUi0i3UtGs0On7IjD5dcqGEWob4o/PRCGpS9aYxHLlAGsQYRqeothvKeDEfvLaq06U80/DX9lO0xCobvzeWN6yFYOHhodHyuFO8UuTN3CaF28YR0n9TVAV5rSvMfbRTmGgXcbup9v/r13Hfzsw+ZdMJjwO2x5oY0XULAjhbCN09INVivoMUO6/YhVdEUS7l2+cBwfGvWLOspBYxiibH75nPEhdUObGOnKusQLpZbHcDxe/yXzn1zEapAUgMMGxV0UXfefFuu0ucgyoGEahf4DUgU9leDaCSeFBg2uPOb/8PZw2VGtnwNVx8dJqxhkU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(956004)(66556008)(6486002)(498600001)(66946007)(6666004)(186003)(16576012)(53546011)(4326008)(5660300002)(31696002)(36756003)(86362001)(16526019)(26005)(54906003)(4744005)(2616005)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWJxc0NSVVJUZzh2Uk9rczVGSE1xTFFPRUlOVkxWZ1F1d0VoTFZXZXhLSVE1?=
 =?utf-8?B?ejM5M1RFZkhKUDZmUTJEci9YRTN5TVp6bXpVU3FYeXpQNU5MVm1TWWpJblBa?=
 =?utf-8?B?Y2NmNjdWeUVZbjMzQjM1bC94YVFSZVBDWk1iS2doRXJJd3JHcmhpTGxBVy9m?=
 =?utf-8?B?dCtaU1VJTk4yNlNPcHhNZmRKYkZndXdyTnhtTzJ5aW5PYlJKejBnc05QbjFx?=
 =?utf-8?B?RHEvVkxGeEFIK3VBTXpKSkVNdG5PRVlRaytIVzV2TFJnZStsanNTc0dvRkpX?=
 =?utf-8?B?Y0tZVVZDd3liZE5SNGNBaUZrdXpzeVlFOUFTd3B1ZElvMXlhOFpOY2lidmpo?=
 =?utf-8?B?Yk9LZjR3VE1DTisvTFZydGpRK0FUdW0wamlObDJwTm9tWjlndjRheXNPNmQy?=
 =?utf-8?B?ZS8ycnl2L09ZQmF4Ukp2RnAwSFRObDBna2lSYnpVS1l2eHFiVm1UKzJMR1pz?=
 =?utf-8?B?d2VGN2IwbU5zbHdtNmZOeG0vcGZacDdFM0xtelMrczM4bTlkWmM2U0RRNElW?=
 =?utf-8?B?NExudDNrVlQrbnJsdi9aWlVGWnEyNHF3V2F6aHRpeFloOUl4SWgybDVFR1ZH?=
 =?utf-8?B?bEJ6MnpoSS9EaHhieitYOHBXWDg2S2I3d0Rieml3aXRHd2xZRGF6dU4wZWpi?=
 =?utf-8?B?R2c1Vm5YWnRmRFlXL1pteFJFUXZNWEJLeFBxS09kdVV5RUJXVjVRbGhKa3NG?=
 =?utf-8?B?b1JBTFNtOStFU2VvRmpIUkdWRTgwQkEwbUNUT20zY2JDNlBLL3cvRnhXaU5I?=
 =?utf-8?B?Y3lsZlVpRDl3MUFNazFMNEF0OEhsUXZ2bE52V1ZsbUhWeFBXVkRrQThCS2tx?=
 =?utf-8?B?eEJFWUdISGFBbHVHUnpyZUt1aE5nN2VWd0xMdnRDbjV4ZzIvVHFVN3hSM3Uw?=
 =?utf-8?B?UFo1SXk5TmhGMHZtZTBPSlIvWnJKczlmSW1zZVoyTzNObDdrQTJWQUQ1Ti9o?=
 =?utf-8?B?T1FzVlljSDRveG5ZUHpDVkRyUmVTaDZXTWE5VWhrelNwM2JGTTlWVG0rZy9j?=
 =?utf-8?B?Sm5RakNXTjNZOHBTOWtrK2IxNGZKN3FjZmRCWmpTVkk4NXRYZXZGanhUSHAv?=
 =?utf-8?B?OHFubkJjQTF5citjZHIzV0syS24rUEFwcjJZU1Y3WUpsdHVRUmlLMkxSZDl1?=
 =?utf-8?B?N0EyclNEanJ6cTJpbU9uM25ic3I1K0NIWmJ1R2o5SCs3TW80SFhENTBnaUhF?=
 =?utf-8?B?TFVzL2ZDajJtZzRrUnh6cXJmWjI5NVlTMC9aQjlmdi9FUTYyQmZraGFKSEF2?=
 =?utf-8?B?TytQOUFlYXN2eTlHZG1Edi96M0ZBYjJtQjh4cXJadmVzbVhGZU1xTmx3b2Ey?=
 =?utf-8?Q?JglUD1hCaSb2bgD+CZXKHjvqbZlNOKPVQf?=
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:22:12.0789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce9618-fccc-48d5-8858-08d8b8c1b1ac
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pd/JMYXk+ufQjF0RNvv/gomN1/7o7wffQb1gpueLgSRdbEmfs3oioSYWWZSmfPmLVg/+XOw0E+cfWWbLnyukd6mNqn4b3ClHPtYl+86BcT8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5063
X-OriginatorOrg: citrix.com

On 14/01/2021 15:37, Juergen Gross wrote:
> Rename the xenevtchn_open() parameter open_flags to flags as it might
> be used for things not passed on to open().
>
> No functional change.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Possibly worth stating "No API/ABI changes" seeing as this is a public
header?

