Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C096B0D60
	for <lists+xen-devel@lfdr.de>; Wed,  8 Mar 2023 16:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508100.782392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZw4A-0006hV-3y; Wed, 08 Mar 2023 15:50:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508100.782392; Wed, 08 Mar 2023 15:50:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZw4A-0006f7-15; Wed, 08 Mar 2023 15:50:58 +0000
Received: by outflank-mailman (input) for mailman id 508100;
 Wed, 08 Mar 2023 15:50:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZw49-0006f1-1x
 for xen-devel@lists.xenproject.org; Wed, 08 Mar 2023 15:50:57 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe16::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02ea22f3-bdc9-11ed-87f5-c1b5be75604c;
 Wed, 08 Mar 2023 16:50:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7015.eurprd04.prod.outlook.com (2603:10a6:20b:117::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Wed, 8 Mar
 2023 15:50:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 15:50:53 +0000
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
X-Inumbo-ID: 02ea22f3-bdc9-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZDCmaFl5ACfft+lXtDmjUTja2uGDqrdOPFbYIVLsQwJcC62QrnBI61fJ2SviUkrkf8AX8wxj5UBqr8ff2mj18KRrEpLoY5enJhWI5HpaXw8UTFqyGLSWBPzyohDRXR4PL5vLAtgbOgo/QESFoUzjzA33miSVmfWpjFyUuGE9BwHwJx/eK21oUr6QEY6KWpEXHysC4TOtvSa8lWUVDT6gkTjDartgaAm97IA3LuW5g9Q1AcAeWhK4/FsDs6ILCsncRIyXQKQRhggsbB9oJp5+O1KI91eDvX1Uu9s9LUsQ1Mvj45BMO5opifpf32TLvJhbxz0GZ3aatLf5MVWGXU7bzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVJTkEd2Am/7yZ4M/sSjafvc77TzID74PbmD8WXNn+s=;
 b=GBCBx9MxJltba6s0jGIGFGJbx2Tqz9Ikek9nvfMsQd0zAJ1i1EMYy77anBkyUWVh11/XBEDCld2LVZboIzpboz9VxLB+XbU0g3hY0etgwJhw0NUucupbYyGUS02M1ZqswmggUf6w2Sr6/NXegLRo/yrqkrzpSnuxnZTlfmuihvAsfs1qDIeiuyHFKDFozYHgCgFWUQ35UujR+AZzUkXkYVqZSn9Mma2w/pWzneqZmwdrA2cc0QY0ts6Lhdkfe2MK2Y/U9XQ9CS6FG6taRVy+I9VTNdiKx0D5b+BnGMoi4lmAp6Jn94F3NgUtKpIu0toKYNOgGyk09twmesB9NMTx5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVJTkEd2Am/7yZ4M/sSjafvc77TzID74PbmD8WXNn+s=;
 b=2JXX+52HFr5t6ObnsI7QvEyz9pg0aaU0KDUPnlWwkU5NUYXGxvf4YEfot6EYB4C/IgLK2pcdTQjR61jE3C2Ry+VM5rYSVCUyqBVrPDiRwtmpouJ2+GUu4wt6ByZOhMmeyOI4MzCNQ5neiweTOTETiTPWSJ4vmr9oYmUx7/obc4/zlbFo77ESycJd5At7CHes3U9/nkOBRo08cERBa0XjWyzxCDpqIvRJoKcDTv0s39ag8yOC+aIR3l3W/ASSJoEoSDsLMAd5cBWirOyH/qMU7bHfiXLKFNWNfwYEotRURF3iYonAfEgu9lzCzU9JAv5tXJ4ULZOVInTQz1/X6GkpFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
Date: Wed, 8 Mar 2023 16:50:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c44d8d-bd95-4a43-54ae-08db1fece619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4OgzWuIxQjpleWG19mAFv9zpvgIMvRVHopayzp4/WPZyfGzZ9PcN7dhekYP736MUUmg/AKHr7DDOhi7IDlLRsRnfE3wlh6BEsQxuzqeBelUvWYWAqPST0mLKPih1NbP1PhcKhcPVtJ0s9eMJor/6wtk2i1n3HRyJmdlluDI3JcW5UYA17hwU6kV6cHWBJCSNL23FvhqlhMm4RkQ7lUYBj37TBD/Xc6q2WgSyeJMTZk1gM57lj/RLO3NNKJTjvUcq1tREdEvaUqpejHvnnQWbrqY9fwFEU03wLuo0xwgZmYNMfGAc/U436IH97tnhwXWvCS8DCxsnZwbJz/Rmr/5HnWvg6tHYxu1SM2I7RQ0SCCYW8QXGASswsgPsUpBl8YfQNQloJJrq75Q4cB6P80o6i5iCQQfWd9PWxz32LALYXS+xo+n9xZicbVXsL4mZDyAAmPThaAKWboUb0VZqTKTyylT3JsA/n5JoymgVNhycy7kroKGOQ2BFydM14VqG6HdqxVGWticaG1wUKwZEC1AxuQsLeiUpbNh+iFYenknQfvCVbCzJGVGz4gOiil+V2wGu05yxSJ8h4Y/Llh1qLH4iqpvnLo+XzPSzSKkQtqWZelvrOvCsGZ54UZU7E28zzGpv9aROZXwzVBX88hNCABK0Qs2ZwXGp8ISmU119M800bPj4qf+W/AS0ndQ2UrVSdCw6x6IW2j9z/Pk46Z8RS8Kb9YSWxP1egew2dkySA7n3eN8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199018)(2616005)(31686004)(41300700001)(186003)(8676002)(316002)(66476007)(66946007)(66556008)(53546011)(26005)(6506007)(6512007)(966005)(6486002)(86362001)(31696002)(38100700002)(4326008)(2906002)(36756003)(5660300002)(478600001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1h0N0V0cTBRanU4bUNpbzF3ZVZmMWd2dSswdFNYK0dWdnRjd0IwL3FjeTRL?=
 =?utf-8?B?N0Y4VmlwQnpNQ0VtRzVTWGYyc0hQSWpYQ0MyT1RteFlRNXZIdFlxbDZnbS8r?=
 =?utf-8?B?Mlk4Ri9TTEFGMFZPWDg4T0Z4NElhVHhSZkI1TWg4MnRhWTk5aGNyV01PdDRB?=
 =?utf-8?B?VHUzT0lMc3ZnQUtoVTJJSUxGell2ZEhuZkQ1ZkxORlU1b1BxRXhsU2pTUUFO?=
 =?utf-8?B?TktzNFB1L0h6a3hrcXJWWHBwNTlMZzBwUVZpamR2b1A1aUNVT1ptTU9sVm9m?=
 =?utf-8?B?bWxINlJZQko0b01YVE02aGlhTUpSUkhuSVVBNDlDVEYvSGpHTXpWcUtocEph?=
 =?utf-8?B?ZVljdkl5Zk83aG5wLy8xOUNHK1VybnBYOHI0Z0UwRHFQME0ya1Fib2J3ZXps?=
 =?utf-8?B?M2NLbmFwcUxPS1E2VnE5Ny9sK2diOWxsV3JHNzV6cXEweWhqUUlIVGZaUHhs?=
 =?utf-8?B?dFE5RWJJWFc3NllQdkk3dVI4NXcwTEpvdUNnMmdLRkxkc2xFNnNvYlJwYjJ1?=
 =?utf-8?B?a2tkaHVTamU5Mm5SaThhTFVSTGdwOUFwYUZTMEhkZXlUbEZVd0w3M1A4NVB6?=
 =?utf-8?B?MkcyUUQrMWtEVUZJbzQyeXEvZjUzMDVtcUVFSGtTcXllN0ExOXcvWTJzeENW?=
 =?utf-8?B?ZXVIUFpYRkxscituWWVRa1pFaTFUZ3N0T1RHMlVHZVh5dUZpbzlkZnJxSG4y?=
 =?utf-8?B?YVNtUjd2a3RoUVpjV2pPLzZRZzFxOGdoVnBqOXg1T0JuamQ1ZStNK0hlREJ5?=
 =?utf-8?B?ZHdWTHUxV3l5eG1OTFgrMlJyWFZwNGpMQ3ZhaDVEUTZlSFV0K1ZlWjIyRHlk?=
 =?utf-8?B?YU8vMmFBR29NQ0lrVGZuZjk1Sjk0M2ZhK20zNDVObS9yMFdrNVdVNmdGOEhH?=
 =?utf-8?B?MUZFbE5jMjZxWThPZjNtWFNSVWx1YkJDVWtjTllSZGhEbjNQUU1wWlZITEFa?=
 =?utf-8?B?Z0s4SlJJWnMyeFhrSDZIRjdaZjR6TkdoVGJTdmJQR2ZYcHE0RytieU54UjM0?=
 =?utf-8?B?UWN6aHNFbTczNXk1d2tXVmFsYXVIczFJRmJYTWg1NEkyMHBRdGJDalB0am1E?=
 =?utf-8?B?Y2NTZ0xwdVJPRDlWYnBiRXhMYUlKWVFiRE5pVTAvOHh2Vko3eWNMMVFQN0xr?=
 =?utf-8?B?WGZJQUhpdXEyUWFva3FhSmJRNWViMjVxcmdqaU1PL1VVS0ZVVTlDWXEwRTVI?=
 =?utf-8?B?UmEzUGZjS1ovUXYyajBtdjVlY01UYVlJRkpnNFJCb0I2SFZNZG40S0tSRUVI?=
 =?utf-8?B?QzRBbmZGTE52Q1JDSHA0TTc3TUl3bFNiR1daK21FaVpndGdUY2VTdDJ3QjVE?=
 =?utf-8?B?TERHT1ZVNkhqZTRFNkhyRWpnT3locVkyZElaeFV3MHpxK09rTUUrd1FIRVFy?=
 =?utf-8?B?WE5maGp1TlhlcVFuL2MvUUpTMEpna0hnbDY5YWNtaVk1Y1hNa1dzQ0lqUkla?=
 =?utf-8?B?anZFdjNneG5EWXRpbDFRK01WcjZUU0dGMWJHY216NTc3dVB2RExMb2ZLZ3Bl?=
 =?utf-8?B?UVI0MkJraE9Zalk2SkZZWjZKZmhpNjVzSFBBMktEWGc0OGNFSjEvNHBQS1BT?=
 =?utf-8?B?MkZhRjdFWFpVcm5xYVEyc0VTelAzZElzL2pPTFU1djFleFFzdFdJRWpnNll6?=
 =?utf-8?B?Y1FoQldCUGJNS0lPTHJNVDlUUmtzTWFWb29SRDJXdjgyVVRnV3pqU25pM1M4?=
 =?utf-8?B?cTlqZjB0SlptQlU1dnk3MDJXcmUxYXAxbnJibnB6Q2VNVkdXQktMVG41dVJT?=
 =?utf-8?B?L0NkKzA1Ly92TnI1V2ZjV2ZvZHRvZ3lEYzFYWmZvaHVFNFZqK0JQNmFaNk95?=
 =?utf-8?B?WUc2Q3BiNXdwU1RRTjQvUForQXk3aDVlQXRNMnNPaVlicFV4NlFPbnR3S2hn?=
 =?utf-8?B?NTZkdzVMd3dGbWlXOG5LaVlMS3puVGwzOUZ5emhhSlNnenU4M24wcHNsSHNP?=
 =?utf-8?B?ZTMwTm41K3FDUDZTMFcyaUcwRWs0R2ZUZ01SQ2lPZEpnTEY0S2pxa2htello?=
 =?utf-8?B?NDBCcWVZd0w2Z2ZkR3kwb0RvUjN2U040cExySGtLT1gzaGhCaGhZQ0szZnhX?=
 =?utf-8?B?bVVzeURyWU8vaTZOTE1uU3BrNXlNTHMwMGMwYk1LdDNWb3dvN25TdlVqSkRR?=
 =?utf-8?Q?RB3EDmoXQnXfLpKB+BMXyb1Fl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c44d8d-bd95-4a43-54ae-08db1fece619
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 15:50:53.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUsOnzbH77XwqHms2ceKyafpyx34fyCMG/1vxgC0QpXl4+eDiTii6CJgYwxe87kOcJZaS6TQDBuTbfmGPsQhZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7015

On 08.03.2023 16:23, Elliott Mitchell wrote:
> Mostly SSIA.  As originally identified by "Neowutran", appears Xen's
> x2apic wrapper implementation fails with current generation AMD hardware
> (Ryzen 7xxx/Zen 4).  This can be worked around by passing "x2apic=false"
> on Xen's command-line, though I'm wondering about the performance impact.
> 
> There hasn't been much activity on xen-devel WRT x2apic, so a patch which
> fixed this may have flown under the radar.  Most testing has also been
> somewhat removed from HEAD.
> 
> Thanks to "Neowutran" for falling on this grenade and making it easier
> for the followers.  Pointer to first report:
> https://forum.qubes-os.org/t/ryzen-7000-serie/14538

I'm sorry, but when you point at this long a report, would you please be a
little more specific as to where the problem in question is actually
mentioned? Searching the page for "x2apic" didn't give any hits at all
until I first scrolled to the bottom of the (at present) 95 comments. And
then while there are five mentions, there's nothing I could spot that
would actually help understanding what is actually wrong. A statement like
"... is because the implementation of x2apic is incorrect" isn't helpful
on its own. And a later statement by another person puts under question
whether "x2apic=false" actually helps in all cases.

Please can we get a proper bug report here with suitable technical detail?
Or alternatively a patch to discuss?

Jan

