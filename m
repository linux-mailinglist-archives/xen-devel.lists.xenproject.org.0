Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F3062D6C7
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:28:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444811.699890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbBS-00079X-Q8; Thu, 17 Nov 2022 09:27:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444811.699890; Thu, 17 Nov 2022 09:27:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbBS-00077T-NR; Thu, 17 Nov 2022 09:27:46 +0000
Received: by outflank-mailman (input) for mailman id 444811;
 Thu, 17 Nov 2022 09:27:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iQoc=3R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovbBR-00077N-Mg
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:27:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 176f5a7b-665a-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 10:27:44 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7940.eurprd04.prod.outlook.com (2603:10a6:20b:240::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 09:27:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 09:27:43 +0000
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
X-Inumbo-ID: 176f5a7b-665a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ky8uqcKQPFaAXClqnl3xcZ1Q2SlKn+qu3sOXpCMSmaGQ0iwUhQhKI09tWj8uVlwtBKSSab4m0yGfUxw4b/MOdqbV3DX7l3jaHXZ8/xGM3B8J8Nhht+V9ECkyZaX3uEFbIu18ZaroK31cx82T4xk4XhY2f7+Pdk0HuQvk2aaVertMFYrBkelHpPgb733q7vEQPm4cooGtVjvq55U4x1IZtINdfjQGTSkAu2PTNgw5d/nlfDy8I6ckmHhV29hGeq3Sdz4CvS6FfDSi1CxBNcQM8jiUj+8bRPQ6OKNFMuMRS9ymi1ZdgUm+cgVZKL9XMW4XpbvDuWtVn8kHXkFFznAhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVo5WaeRDymC7yCopczXUzOTLCa5bghCYDb5eD8uuBk=;
 b=E8rt2nkxDI/xcwy1TOsGb9Pg78QT6gwE9yTxZ3lO4/IdJtkADPIjj2H163cqUGJ81eDcKJsz4PZHTbi33KMWTV4zig22UAl56nQrN9retnSLAt5bA72vRT2OOPDPuLoxzq3BdEXU2ySHyjNrrwcSnKnYRhauO6EgPw7fUz34K+pJzhnbe/vMQuNBj8eowcE8G4v5ssmGwJLwEtL9IsyFZCN4/A7t2+sZjQR5Kr8ilTym/fF3BDDYNYshCGH7Bdi9AbqMU8TANG9oyBrYX3ph/cP8qgDJGa81IuE1QJh/FCVaIVdtZn2TiwhtkKBg9/ljkXWFcWtxiZhvjQHhObsm/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVo5WaeRDymC7yCopczXUzOTLCa5bghCYDb5eD8uuBk=;
 b=e8FrbSRKJpHGy79lxu3Aygpm8EjZWT3wxGG0fEgY2aXpW6abI314s+Cn+kWM+i5ia1SWDvu2CdkyoF/Xq07XKu/sb/384hpocIqKJlqAjrF3EBTO9LgaCR4h/UVlKAMadOmVrgyIU1C5w3ZMtSEQ3b0Tnd5uKNt6bIsoDY/zWsnhrMn9S6Ou5goox5uDE34OK3GKbJMdP/acX66/B5vasY3+j2gLCuDnTDGFm2uGTTo7KnowIhtGmaFc8ozAjEhcclcP8K4K0G5XjRu4d7OfAYVXPsNuFLi0WKxU4LFDNyCDjyGhIxwjNO0puwSyBfPCX/qZB8GN0b1jK1f6qV6Frg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b559146-11d8-f848-d6fa-baed7e0fa06f@suse.com>
Date: Thu, 17 Nov 2022 10:27:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] x86/pvh: do not forward MADT Local APIC NMI structures to
 dom0
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221116164216.7220-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221116164216.7220-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: cf591427-0159-42d7-d7ec-08dac87dfad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yqshM2rslEXoZfFipMXa7TM8wcJgCoJHtedlhmrR1AKd3yNRU/GiY3ZRoTlj7d2HPNqhE86E7BhBHNNS4vY+o2SOy+LUb3BWziPST+SkcOGdabu5Bh4OQxkkUn0+i27XRXYqMKy9VVPV56pXsWElQieu2JUZ5N5o3PnSR/TwGy08YWKji0Q0Q2Zsz4sGEZKUV4GO9xTdXZ8lZhgVmUxUxKkWZQkh4h7NgQQaCkCORn5qPY7nsDTIT/e04zjeksrO7j3yINTFzoQR2Ib5NtRs0QeJMNBu0TqaBGaigSkraaVntLA/5O/4IjLLNmnTJzgxmzfGKbciyJrv9/Qz6vEkGFu5sqJ/9eKyDX28f5ZsMgWksDwiSKx1IvmEuPlgq9z1Ev824pQjiFfBNqCE/9bR2zsmslb1Az6ct6jd4SaezIrBjTPePUX1n4NVOzoeq7mC12SmwMy1Wdj20jAZy+9n9iQd7cD+y4eAtljDrs27+1NhFlXIshEJoNv2kvB0Vr85eh/NU9yNS/9Ou1FVEvlhg5ydUixPlJGtYBLyDa3NeJeNBl7NtaLfee5D6zrnMkqEOxhSFZZQTHZol45bOO5Oz0pJ3v7HLZbBPJevkcNZXyQDpLIz9/s30blWa0BdMQZzBe4Cef5i1uxX+WODO4Bu+2TmnVLdtPojyYtdr0LGKRywpVqH8uMmAxobPLpxssfuYueO6iP1VLhcztQGPnj35jPsCsgmBjuHSflaSozXQTk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(86362001)(31696002)(2616005)(66556008)(66946007)(66476007)(41300700001)(5660300002)(4744005)(8676002)(4326008)(478600001)(186003)(26005)(316002)(6486002)(6512007)(53546011)(6916009)(36756003)(54906003)(83380400001)(6506007)(8936002)(38100700002)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjFmUG5aWEJXNGUveUFrRHJaT0IyNm5RRkU1M1pjS2VWWmZwLzdYRVVNamFi?=
 =?utf-8?B?YnpVZHJzY1dIenNrOHJRVFg3TnFSTTdGR2FyYWZndTNTRndPM3BqSi9zWEVm?=
 =?utf-8?B?ZWJkbXBuTlg5dGlGZGREYkM5NmdMT3oyeUtLcFhFY2JFbTRxM3dYWFNKVitP?=
 =?utf-8?B?bTQwM01sWnZPU2tFb1FvUlVHNVVldyszczJDQ1ZnTllRVE1zYW9jUGRnMWdi?=
 =?utf-8?B?RXd5WmhUWDFYTFVyczZKbmswZ1RmY0w5VFE3bkNLeTZHYWRUNFRsb1daRHdJ?=
 =?utf-8?B?U1A3cllSSTVPbzlOWnNBb1BxUmVVdmxaczVlNlZBRFc4SDllY3NsZXFaZFE2?=
 =?utf-8?B?NFplNnA5cEt0aGtMa2N2SFQ2MFRaOVlSZW5MampiU1JmTGNlOHVPR1llZFlz?=
 =?utf-8?B?SHNBV3dvbERSd2VleXFoRmhpeE9PVW9DVlQ2dEtEb0pqNWVuRXFGblFYTmNC?=
 =?utf-8?B?VGJSQmdCRDgrUFBWZElZYnVIWjE0RGZ6emw1eE9vS2NRdHR3RnIyREFUdmtB?=
 =?utf-8?B?ODYrZ1JGb0Vud0xyM2VMaGFiUnBTY1VkOWN5SytrVHJzOVNSUGpydXJGalp3?=
 =?utf-8?B?Y1ZISHJRa09PUGlGOEp1YlVaMkZUcUdCN0M1K2ZIRzYxQlFGK1lldUlQR2Y4?=
 =?utf-8?B?MXVHWlFId01JL0M4VUFXUENQWTh5d0tsV1VsUGZNejlUQzN4OUVEenJqc2xK?=
 =?utf-8?B?SW5CcCtCR01iMmMzRGxaMkJ3bmczbTZmekNJYUxKZDMwWWFJSjdpRHhiQWRC?=
 =?utf-8?B?VUN1WUxlbS9LV05NRjJ5QklzTUJQNUpCemZ2bUVJMGVwNXpGZ2ZqRnVobXAx?=
 =?utf-8?B?VGYzWHlNU3ZXaE9NbzNkK3h0WkV2cUdCVVlPb0lPZFZHSzNxSHgya3pJYzFx?=
 =?utf-8?B?eVRTMmJ0aTFaYmNTYjhGaEhpQmZDVFFKSVBhLzZ5V1VBRW51YkdmQm4zZ2hl?=
 =?utf-8?B?K3g3RDZYc3hWcno0bXVmYUt4c1dtSW81SkNOVnpqbFBSNWorOEd5eERkRlJu?=
 =?utf-8?B?MW1NWXNITVpBWUs1bFJKS3RpZXBFL1RNMmd1eEpKYU5WTVZVdDVxQ0V2Wk4z?=
 =?utf-8?B?OXFKSVZ1b1d1dlZkZ0w5ckNvVS9vTGZZWU45bUFBenJjbWFGL1VEWVN2UndI?=
 =?utf-8?B?eDVtSkFjSUg0Z0sweVJJOGxDQ21KcEVJOElzSWpGQWY5SkVRUmxRQTJwWXBz?=
 =?utf-8?B?NUNqSE5xa2VYcmUwdkVab1UwVXdSSU5yTTUzVmhpZENSNk52VXAreUtjUFo1?=
 =?utf-8?B?YjZKYkhFMFUwWEJaWUFtRm0xbXI4UmxNTG9oTFlMZkpnZmlYblkyWWFqbitE?=
 =?utf-8?B?M0ExL3BhTDQ4eEgrNDFIY2syWm5xTHZvd1hPK1J1SHhaNkl2My80N0QvY3VF?=
 =?utf-8?B?WjRaaDNERnBNL3VUQUo5Z2tjT3BCK2FwdUtyN25hUGQ2d0QyU2xBS09yWTBE?=
 =?utf-8?B?cmgzb1U5bjhtbFFaWmQvdmM2eWIrMk5qWFRrM1NIYVJ4M3RiTDYyY2wxcGxI?=
 =?utf-8?B?VnlWSzh0NHhhVC82di9nSkh0Z0dzZ2MyWmFWcUFNMVYwaXJKNWNkNE5yZ3ho?=
 =?utf-8?B?ZkgyYlh2M0NDUUdReFQ1ZS91aGNkWlN5czRkYzJCTnhybHA4ZWVwNDNtNFdw?=
 =?utf-8?B?VHRhbTBON1Z5TXVaT2c0MVdHdjZleTBlRUE5eDFhN2RsdWhEWEVEa0RXTTlq?=
 =?utf-8?B?N2FMcElyUDhpNVNzZU9aaUpVR3F4VVM4a3VjdkxFUGRKZlNZT1l2Szh5R1pl?=
 =?utf-8?B?M2xmVWJVdWsxb1ZONWNqU2NTUnNHN0FxOWJMZkpGUUUzdS9hWXk2cUhVOXFN?=
 =?utf-8?B?eWxrdFd3M1FVaDMwUGJ3Z2NKYWpmSnFIcHZkNGlQdnhuWFdqWFZ0MGI1VUx3?=
 =?utf-8?B?MHdzdkxqV0xmSkNJb0NuZnk4Z2hGK3R5WldWTDNUS0VXYXdja3JoQXIxSGFl?=
 =?utf-8?B?OHYwK0NWSmxLVnkvYVRkc0lic3lxbUpnKzN6andjQmVncitQU3h0WGRBbmdr?=
 =?utf-8?B?ZmYyZzhWVisyR0VVVGxaV1dNc3JsOEFWSzlMbWd5aXdidzBJRmw3MzRueWlp?=
 =?utf-8?B?ck5ZNHBzRWhha2RySW91QkswMXYzZ3p2dCt1M3dSSFYxcmhqcHNKbFZRbjd2?=
 =?utf-8?Q?H7NQAtLt/dXHYSwltWLZbpOt+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf591427-0159-42d7-d7ec-08dac87dfad4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 09:27:43.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaDbJ1ilvfekdJz3VSN0seCgs2scOAOP9ecc3ojG+UyK1DBhxxfW4+lcdGzen6QmJwde9WKoQlpOH7U+42cnPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7940

On 16.11.2022 17:42, Roger Pau Monne wrote:
> Currently Xen will passthrough any Local APIC NMI Structure found in
> the native ACPI MADT table to a PVH dom0.  This is wrong because PVH
> doesn't have access to the physical local APIC, and instead gets an
> emulated local APIC by Xen, that doesn't have the LINT0 or LINT1
> pins wired to anything.  Furthermore the ACPI Processor UIDs used in
> the APIC NMI Structures are likely to not match the ones generated by
> Xen for the Local x2APIC Structures, creating confusion to dom0.

Plus we should have passed through Local x2APIC NMI Structures then as
well.

> Fix this by removing the logic to passthrough the Local APIC NMI
> Structure for PVH dom0.
> 
> Fixes: 1d74282c45 ('x86: setup PVHv2 Dom0 ACPI tables')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
albeit with the implied ack in there provisional upon Andrew accepting
your response to his reply.

Jan


