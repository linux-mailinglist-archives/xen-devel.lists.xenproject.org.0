Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0927724AF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 14:48:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578367.905833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzey-00069Z-39; Mon, 07 Aug 2023 12:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578367.905833; Mon, 07 Aug 2023 12:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSzey-00067H-0O; Mon, 07 Aug 2023 12:48:32 +0000
Received: by outflank-mailman (input) for mailman id 578367;
 Mon, 07 Aug 2023 12:48:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qSzew-00067B-Fj
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 12:48:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b54507f3-3520-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 14:48:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9338.eurprd04.prod.outlook.com (2603:10a6:20b:4e6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.25; Mon, 7 Aug
 2023 12:48:27 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 12:48:27 +0000
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
X-Inumbo-ID: b54507f3-3520-11ee-b27e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YIBhfmGmEU0rIcnUEGdrKg7dhDX/78PznGGKqxie5dfk9dET5rXmLvLabt+TbEePUGsUR2Ig1iLxCFBkwu1eXWDw76TDeuaR78kzpWi5D6iTquQ/fHtFOsIX5xnj42HFJw11L89JeCzi610Ni7RdYk/T0xL9+s7O4mpT9UD61AO3uK+E8DHosKWgv1H4t7pjmvJ6uu0RaZ/svdCK0xcTA+BwcZ4N7kPZfBNCv0H7x0iVA+BleqeRH+NUaBwEz/pR4unTeKIfh1eQAi67wwarzOEN4oJDIqWC2BgRRNKK+jNUilGjZxMpY4dZf+Eop5v1oj3SLEPHYwn/Y62bDNFYKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqR8kmPEt5MhrMoM3F7CxcM0ZcMpf7kT7H/gmtH+LgQ=;
 b=ZMKCG6iToE+ZxSIXHZ2zkKJKivizWquXuYVwsmBMgTW/ljs2OZqIILE1D+wIii+o+A6Q0mm9YvdrsZRiFNj6nmUrZ0q3l+v/yVloa1GWVF1BpfzDrq1b2cgYYaw4eFAzSPweeDni/HsbfN117E9gk1N4q3ZnL0tqsK3S1TPubfrP0vuI+MgPU6nmBCjQOTrihFjLOzatZRu1SoenFxXdCstbwXgT5+OGcV9F2EyqWFzYDIPGqAJjBY3fwnwqmBlYXOKswTfMl2o8SZJ+uzMoC8lLF7k/Rc3wIhKhY4ZWZnOOeljAQkDrawJW+qHP7USXXwSzXyi/OKRC76REUfWOfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqR8kmPEt5MhrMoM3F7CxcM0ZcMpf7kT7H/gmtH+LgQ=;
 b=do0V5Rz0BDaaumhFmMNwi0cp7TmtlbRx73ATF/KuGDRIfgeXlcYAnQphLDstCa6dSafLa6c7BaJxBro97aZMjTG7+Onep8+8CDigiDhKvgKuey0u37enKZDiKZwT1jjPHA2MeCte4K6STCSOyPUm9OVprKEkd95CC2Jy8gBqRkMGnKMOJZU4ZGXRX4a7kVvDOIpNNHaXv9ZnORsvqcV7VOPLdkeR73GaEcbmOUWizgVcPIlSVE7oqXJi4VpKrqMCGzFJ0T31Ksct0qxTL0cXRyT8bIduoFgbY0cA7e9oIxpsg+y/t9OZTPHklhwbOlxqqYw7gpZ3xPSGVTpQK/7Ttw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <17069ab9-03ff-9f7b-6480-d50e1349e16a@suse.com>
Date: Mon, 7 Aug 2023 14:48:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH v2 2/4] x86/mtrr: address MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691135862.git.nicola.vetrini@bugseng.com>
 <2f7380396ee146132738dd5c6b2a80d62a8035d5.1691135862.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308041345360.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308041345360.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9338:EE_
X-MS-Office365-Filtering-Correlation-Id: 05488938-ba6c-49c5-bec4-08db97449855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XupZlijlHHRatPAVw5/7/mLzQZ2B+6yYKzFUzftJ9B+kbJUVZvHtqXF7XjXX3vGnpumHqVOaJUk3GB7maI2/SwAtt6EtESd6DA4d8Df6JlIfecImyrWhIzTY8uUC6YyNp2mDM/hpp+AFQ4YBaczcFBezVmz6pazCzb71ldKLB8lMsDGz4RB7c9TwvP+2e6ncmGNiQgFw+gnjNwc64DsrUMgczgdlXJaIQZD1nTpzgJJBmSeaIH05HrKbKf7WBIbnXDuCuuLKkRgKC9BMaW+ipOWATPWi1PtkLqZwGqSyr+n+R+ZF+kf2g+pHMFruLwFSAdjvnBoWVLNmimhPifF+DAawkxf01CLykEOVm53iHRGaJAK0pgpXe52ZZK4OoFdbZf590oxtwPRA5eu+Llxq4cv0EtKvTd0LUiyTzDakgRt4VBNRY7j7+lVY4oshcLghOLec6hJN0mJbxb1ngw7/Aznc/tsQbaKHmYveO1eQ/Nm8bXFxPQVOo/2MoF2Nf0nSaP5jE4z5JI2z1zDB/xRvYhO1jAgU849mKkSkAoKDc57vcbwcFhdgombCGt3VNhYrbgs+wI+vx74qBidVq62buJqfMkGTLTPBQL85CjLIsU4Z5EMZ2ZfrXPeOKUceQpbpt4k7wdAsKPcDw4yCiz83kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(7416002)(86362001)(31696002)(4744005)(4326008)(2906002)(6916009)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(8936002)(478600001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1ZQb3Z5aSt0aEtQc1IyMU5MTjNJWUFodE1SZWR5aGswdEdzWm5nSjF3UEtL?=
 =?utf-8?B?K3FEUUd3UTJaRVFydzNlWExQUUZWUWlCWTJyaFhKRjJHWGVCUWpybWJuaDE1?=
 =?utf-8?B?bW9yNXZVZDVCRmZRK0grQkV6NUl4ajZzdVZZR056cy9GNjIvOG5US1lFQjNm?=
 =?utf-8?B?QjN1QVl2dWRqMHBHcThXZjllTWNPSHkyRGxFTjRzcW9ZS0NjS1lsRENqQTll?=
 =?utf-8?B?V2JjVFFzbldDa1E3ZllTYU1MbFk5QzRPc2tZTXRHblNHNGRJT3J4cmh0V1Y2?=
 =?utf-8?B?aW4yTHVzay9WK0J6cEUwcHlWUWQyVU9UV0QxWlRkc2MvSEVPQmYzN0pOY2F3?=
 =?utf-8?B?UWpENGFlVXkyR1YwMzZYUWVBeXlQVHZNSDVNZEt2VmlidzBoQzU0bkpIZWxE?=
 =?utf-8?B?QVQ3U2FOQ01WQ2pNT0ZaNmR0ejlKV0NjdmV1a2FkWFRndDhQVTBVeC9wL1Bq?=
 =?utf-8?B?VHA5S1F2WTJsaUg3OUIxT0ZvOTdXQVNrTEc4QVVSdksxdkVtYnpML1lxTDVX?=
 =?utf-8?B?QklqK2o2Vy85dHlRNWFXaXpHeWlzV0oxWDJ0Mlh6K29JeGdnT2tJcVgwWWNj?=
 =?utf-8?B?dWN0RE1lQ29yL2FFR1FhY1ZoZTJCV0R5Qjdkb2RxdFoxMEVNM0paeDV1Z3Nw?=
 =?utf-8?B?V0p1VU9xVFZ3WTZLZnB4bDYxY3pVMWNHeWFRYnJMQ3RJdEZVOU56WkJYajVR?=
 =?utf-8?B?OXJ2MVo1VkF6aTdQM1BKdENvekhLeThDUjRkY2ZXNHVyKzcxcno3NXkrRjhW?=
 =?utf-8?B?QTVwTzZrVDlMaVJOcjhIRytOU2pKNkUzVDhjejI0ZmRkaFBLbU0vYWVlK1ND?=
 =?utf-8?B?RVQ0ejkxWGtNS2Uvc3F4dGo4WW9EUEo2M1M4TXRGdUEyYWFjRkhDTDk1bk5D?=
 =?utf-8?B?MXlRKzA1UXI3dFZUa0UrMmJKYmJSRjVkNjBtWGs5T0xoaytIUXZxMkpnbmNq?=
 =?utf-8?B?dFgzVlVTL09DNitEYjE5Tk1VRUFmNjBBRThmYXJWdXhIdHd6Z2wzWTVUZGJw?=
 =?utf-8?B?WGVSQldYRUI2Sll6RjlMQTIxZno0eHVOK3UyQzM5MGNrSkRyVUFKZTZ5RERt?=
 =?utf-8?B?S3FzVm01QWRpWTFrZjNlSkpRZTJSV2RXakY4ME9BcGdDVjlJTEZ3bjZmbkpp?=
 =?utf-8?B?Z254TnpVbTlPejJiNjBrNTVNWmIzSUUwcFdNTUR3dWgvdjd5UWovTE16SGtr?=
 =?utf-8?B?K0JwL1VpbFk5MlAwNWNYeW5iQ3l1N0pDWUxXRWd5c2ZkeXVnMEZOUEdSb3pz?=
 =?utf-8?B?bkhaQ0dJNTBManB5TXA5RUJtMm1oc2JoQ3dBY2lFZVdVY0dvSGd4MUVKczZ6?=
 =?utf-8?B?NHAwTGd3M21QTDVOSUhjQnNOc2JBZm9EcXdVbXhOdGZTNzh3UThOKzJtRTZR?=
 =?utf-8?B?UzhNZm5wN21OWEREYW1YVkNVM0R2ZHNhdENaRnpxd2pUT3Y2YmUzNWozZGNy?=
 =?utf-8?B?RFZ4eDBSSE1sd25qUFFOQ2FSU3JIMzlaLzZoUnhlbjVPczNZV1A4YzF1a3I0?=
 =?utf-8?B?dVVRQWFNS21PRDhUY3dOb09UWmUyaStFeE9LZHNCYjUxWU9tNFJmYVYyRVpK?=
 =?utf-8?B?NWw4bmdWZGdOTXZZYkM5UERpMm1zVzZBYk42d0pPZnYxZEZxOTFQNEFFOEVh?=
 =?utf-8?B?ZFV5UHBEVk5FRmdMeHRISzBwZHhYL0VRZ2M1dVZnVzNGRWxLbnUzMDAzYjJN?=
 =?utf-8?B?V1ZiSXROVnBkUVhCNkN6MS82aWFteHloTkpIcEJmby9XajVTaWVuQzZKMXI4?=
 =?utf-8?B?ZmdoblEyUG5qVTVsVGZ3Q0FoZDB6MUJONlRyd3pFYWtsa2xGT2tsK0FkbGk5?=
 =?utf-8?B?K0JGbTNJZ3NsL241STVoRmNXUm1rZS91UTNvNXdzandFVFIyS0k0cjNBU2po?=
 =?utf-8?B?WVBua3ZhVnZWVE4rYmYvRWdSSVFPWXBzMUZDeEhkRVJENTg1UE9idXRVd3g5?=
 =?utf-8?B?WkpYdjJaTkNublhCa3BtM0hYaUdhVThFY1kzZndSck9YWXpMWnZENWNTODlE?=
 =?utf-8?B?ZkVwbHpkTVF5RmdJSk1rVlBCb3hjNCtWeUFUNWFudGtxVHNXNU8rTWU0RGFv?=
 =?utf-8?B?S2hWUHFZZTlONnVJblRXK2IxMDErMkIrbHpTSGNXNEpSb0FkSXhCcFQzV0Ns?=
 =?utf-8?Q?HnGi97+uGBW1rxpPcEaP/3KH1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05488938-ba6c-49c5-bec4-08db97449855
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 12:48:27.3446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4w+lPASI0fllJbIxLEisikwEaNUOL4Rk8NmYCo1POascy2sQOgXKBmtUfE9q7ghj4Ldmtd/jW030W2z0UF3Rrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9338

On 04.08.2023 22:45, Stefano Stabellini wrote:
> On Fri, 4 Aug 2023, Nicola Vetrini wrote:
>> Rename variables to avoid shadowing and thus address
>> MISRA C:2012 Rule 5.3:
>> "An identifier declared in an inner scope shall not hide an
>> identifier declared in an outer scope".
>>
>> The shadowing happens between the struct declaration 'mtrr_state' in
>> 'xen/arch/x86/include/asm/mtrr.h' and local variable names.

Let's try to be precise: The issue isn't with the struct declaration,
but with the declaration of the global variable of that name a few
lines later. Afaict - please clarify.

>> The latter are renamed to 'm', which is used elsewhere in
>> 'xen/arch/x86/hvm/mtrr.c' for the same purpose.
>>
>> No functional changes.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With - as necessary - a suitable adjustment to the description:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

