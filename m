Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855F78F94F
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 09:45:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594462.927795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbypZ-0005T2-Ez; Fri, 01 Sep 2023 07:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594462.927795; Fri, 01 Sep 2023 07:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbypZ-0005Qi-Aa; Fri, 01 Sep 2023 07:44:37 +0000
Received: by outflank-mailman (input) for mailman id 594462;
 Fri, 01 Sep 2023 07:44:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbypY-0005Qc-Ej
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 07:44:36 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060f.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 650bc4ee-489b-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 09:44:35 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB8064.eurprd04.prod.outlook.com (2603:10a6:102:cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 07:44:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 07:44:31 +0000
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
X-Inumbo-ID: 650bc4ee-489b-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bc2R6YtWyGjuxUgBXxHm3qUvaM8/kY3iLm3e57WonI9ixJdSDZwc4RGXH2sBzesk0XqGqzijr2SaRiaBG0//xnfGLOxy+wb/hgCcTzsKMIgMCGe2vJfb9XZzroQ7NyzG5rx4ZlOIWdriKAqFRb7LIk6Spq5bfBO9u9DUt5wa7uB+CGDjOggSyYJzIMA8X6mt1pZ9TJkMKWHaftNOoG89JjrU2r9FxXju3I1C2ibLuqWoo1WAPdV7zo+vvDOcnXIJeNalAZiYAHJ0Dybdoqu2ZDI6/3QhuSqz596iO/9sLGN9UN4g5gkfeqEriFA7bUzEyxedpkIJu6yW7nZ6yHE+pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DotymbDAi8cUClpNc9fKcWdmy7p9FUp+OUWHV31d+X0=;
 b=MMTIPwBBXYIeO+2ilN+cSXeBNQNBIMvP+mToQ6LlJ6Wh1Pch+0fqdLfkshxsHgvq3dcp2u7vuU4m76sWfwQ+y76PMFXVKShE9WUMHyQrv5oFqz658YwTq/j9138fIY2e7VXXLCbcDOtnmMGIp0CBQSEZ+x8+MFVy4dHneri6fw87/XxbnaaSnLycl7By4m4boHfAzxPROEqBSCw2PpMkOMAg2bPdVlKjrQN8NQellvkzl+2Ccgr4jnAo5FMOjETlG4I5dUCjqs3+YT3QgTUEXxdsx5nvvnhxvdaJR/Zc474+CriUhk3nxjRsQWWljWOdSqJZC+Od+U8mpK244fs+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DotymbDAi8cUClpNc9fKcWdmy7p9FUp+OUWHV31d+X0=;
 b=l+TsADxPyqjS9Q8NBUBei56Z5x6Hw/Mf4Hq7dx3iwHHqJSenY+1sATQS+HKw0Eoo9ZEY0zmXpVHSsUSdrxjiaIuSTxOYK/FcBilGFi6YOxibKyOaiHVAOPn3beqt9wJNY13wfOZ71cWSupT5uJ3g52Pp34GxuNZjN11VRunTvfdAdjeigG5adN1I4NF2CC46YGh4OQhfqJ7MR2YGMmv+z7eLw1Zha3isZrAfTLIpfnm9+GG8QWWkGV5sT/xrDkQn4WUoWK6my91/uhXA4W6inKR91bVJ8WBWvQDu/kwSnMmDNdtpARbqYzqJfBzmB/Pn7+ljv7oEehv7QltpDPBANw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
Date: Fri, 1 Sep 2023 09:44:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 547b43a6-84df-45fd-ad19-08dbaabf4762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8GUbb8NdFHS5fDs+xOLcX1Nd7TuLEpY41S/+bP/PMKQEj0LgIDlQKIJZmahWf/cbpGF7KYHA2w4hcrcr+kx8iy6C6bDU2nrhhrqUOVBFawPto8B+4PEMuhSXw1Uh09pJ3ZQeglzRzo6QBhn5OcO7wiqao68/9Drd86RzJ1IhglvEw4Clg2GbbKJnMInsTB/bMLFJfbyIw4w4Hwdd6N3uIjPYTqcz7TnSyERa2I9J9ZN0XDWrMD97en03JvciLS6G0XtcNOFjx05WI90ZgRcUZNY9ncbmhjJC4bjtp0OZ6lB+PCXj6ixNj9UsL57XBOPDMHSxRebHnhevsMR92Eug0o6lriSMnKlc0s0jwyRgHrzNkpUOK93g/40M5d9XtKhx76CioYc+8jm1Wh/dHKGZBgtvomCvzbF8GB+7T9g2Bq8nfdndyp4LGwOLncvKAxDOgv7n96g40Pnf/7zNpC2FeFaleWtlJyPNEo59YLOhdIiiWKbOSPfDGkNcFSVKPGjXfv091m9IorPmx/dHb9YguOwwjV2rVZCoZjOWcGKaUz33ZX3Ng66dkiwGk63Qq3wokbJPNuXj9Nbv2d97FdUM/C0bKx2VBP2hUtg9r2wDPNEnAWTAdrN2Zpm7D2lGiHf5AG2LTBkNYoXHV/0SVPk5cQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(1800799009)(186009)(451199024)(6506007)(6486002)(53546011)(6512007)(6666004)(83380400001)(86362001)(31696002)(38100700002)(36756003)(26005)(2616005)(31686004)(41300700001)(2906002)(110136005)(66476007)(66556008)(66946007)(8676002)(8936002)(4326008)(316002)(966005)(478600001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjFrZDRoYldjWEJWQTN0NDdsUzhkUUQyUGdEMnBUYWFYNVRVQWg4SDV3dy9Q?=
 =?utf-8?B?aVRKK002M2hXWitwR0NLeFNGWmtFbk0vbFBKakJTSVZTYldGNWJTNzYwZ0VX?=
 =?utf-8?B?YVZ5d3grVUlDajVxMUFEdXEzaThrY3JXWWJmb21DTlJjdkZWMy9nbk9wWUlP?=
 =?utf-8?B?bXBPVTJHUTN3WE1xQ0pYNFJyS2pOM3N0eU5TQnJXZ1FaWkEzN3MwYWJLbWFH?=
 =?utf-8?B?RlBrb3BiejQ3aTRUNzdoZkpybHJ0aVZMZlorVzd4cVg1Q2NyYVZqalhPQ1A4?=
 =?utf-8?B?L2JuS3VTTjRJblhLNldrbm5nSzVGUmtVaTNiTmU0RjAyVCtNaVdZdlpKMDZC?=
 =?utf-8?B?NTk1cUswTitHem0wcDcrRjlPT3F4M0JLaGdYSlc1TCs1dHJ2aWJkdHI1ZVJq?=
 =?utf-8?B?dnJ4UkhqMHo2MnE0blRoQWtsY2dUYTdkSjluQ25WZEdlaHo1WjFXN2MwelRB?=
 =?utf-8?B?aUE2aFVrNlcwQTRINzBMdXhCU1ErKzFzM1pBRVhkeWhjUXg2YlJVMlpDN01v?=
 =?utf-8?B?ZGEvV1pGZ0xSR0tHT242WnVTRnArUms4bUI2b2JXVmZUVjF4ZmdEN0J1U09l?=
 =?utf-8?B?SEdvSlkzVUFacDNKMEczR1hLOXkzTHZkL2VsV3JWZi9PN2tLc0MwYVR0QWxO?=
 =?utf-8?B?dEN5Y3ZHcjF5b0x2cmtRb0x4a21adkFxQnRRck13U281OGxsZ2hRYWNCVWdP?=
 =?utf-8?B?OENPQUp3SEVXSDZlQldNdXVSTjZSTFZFdGxJRnl1NlFIVE5MdjZ0QnRsaW95?=
 =?utf-8?B?ODlBV09uaFhUQ25jRW8wd3JUNXZOY29Ocm9BWm9pSWM2UFJlMWgxamlpRHNQ?=
 =?utf-8?B?TG10bTZuR3plSkZzWlQ1Zk1udG9vTEh3N0E5TTZOc2IwbytVOFZnZDA1eEg1?=
 =?utf-8?B?eVRYR0srT1U2TFlsRzgwcTdiLzhwMU5CTFBPVTZrbE1haXFiOStqNG5rN3Fq?=
 =?utf-8?B?YVZMc01WQUJHVlJWRGR1VjBxdFg0YXk5Z3VwR0pxaEFZdjF5eUllb09QT1Q0?=
 =?utf-8?B?azFjOTZVVFBxRUVPTjFpLzhnNWQ2Nkd6NWJsSVZpS0ovd0hHbDNaMlkxb1kw?=
 =?utf-8?B?YnNkMEdCVVdGMFk2bWJsSzJYQlhlRjlhd1pjSkFUeGQxc1gzQTIvb2xTL3hi?=
 =?utf-8?B?QVNscDJXdm5Gc0Z6UE0ycHZBT0ZCMW9qT1lja1pValQ4SE96TzVpeDl6US9a?=
 =?utf-8?B?ZGdLZWttejZmUjVYcVo5TUhHU1ExTHE1Wnl0dmFJVEIxbWxFdlVXZUdHbWUv?=
 =?utf-8?B?V0lOVWo1ZEVMT1U5ckkwNWEwbHNQVVBZZk5YTUNpaW9jUDl4ZWdyQS9aT2F5?=
 =?utf-8?B?b2t6SGduWlEyWHlPWFBhZ0lEd05wUURmNm8yMyszMVJNVHhMbUo3dXBkK1U4?=
 =?utf-8?B?RVN6L01hWElRdUxSbnVybUYxQVZ1SGEybUJ4VDQ5VjdsZ3JaRFZWdzhNaHcz?=
 =?utf-8?B?OVNEcXZsVk1mcDQ5UlZJRm1mdUx3dktZQzdQK01Pdmd5cnFKTDlJeDRqaVVD?=
 =?utf-8?B?ai80NzFzMVp1VUZOWm5aY2ozanhxNGQ2SUwyMTVwdllqYnhsYWw3NFZ2QTlx?=
 =?utf-8?B?UVJFWmY4RmdhOGUvcld4R1huNUhlSGxMV3psTkJIYXBDYkEweGV6Z3FhUG9K?=
 =?utf-8?B?RXZsWTJnWFZZbUFwS2s4ZjM5T3ZLNy9YYmNTdkkwMnh6RmpKbFBZd0Q0M1d4?=
 =?utf-8?B?Q0lmdmhOU3hwcjVHaTlybG1YSURVWUNuNmpibG91V09CcHdhckxISVczdUxo?=
 =?utf-8?B?OHFsLzZ6UFdmRGI0S2lIajRia3plVGpUaTRUOGJVWlNaNjE1S2FlekllTWVX?=
 =?utf-8?B?OGxWOEVMM25rZllKOHEzT0pFaUJuTGo5a05XZVFqaHpDOGlQTUdzeTl3K2Ns?=
 =?utf-8?B?Y2hZcFdqY1ZteGFKSFp2VlZVVWhtT01SMDNlNG9pb3BkN3VXWjhuN0tVdCto?=
 =?utf-8?B?dzhlV3VXRWkvOVRIZ2J5MnhNT0ozYm82TlEvNFNTZWVZY2JlOEpSaVhBb1p3?=
 =?utf-8?B?Vk1uWWY3S1IreWZ1cXh2NE9MZHlDT2JhNWdDZEl0dk1nckQzdDRoTXhleXlq?=
 =?utf-8?B?Yjl3K1JoY2RUSUwrY1JBSGk4VXF1cVdLWHV5bHRtdWpKdXlvZnpPblVrZGRT?=
 =?utf-8?Q?wsPRTARn4BHlq3Xs6tAXVYwGV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547b43a6-84df-45fd-ad19-08dbaabf4762
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:44:31.7738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVchVxZnWhLetgraxCqX0Qv9YKdSAw+7cEZ9NSat0pmSMu5oCbyTsKBLRph51yAwsZew+kg1zwy2gLEs9WEC6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8064

On 07.08.2023 11:38, Simon Gaiser wrote:
> It seems some firmwares put dummy entries in the ACPI MADT table for non
> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
> 0xff. Linux already has code to handle those cases both in
> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
> same check to Xen.
> 
> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
> entries with a valid APIC ID. Linux would still ignore those because
> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
> this check is only active for madt_revision >= 5. But since this version
> check seems to be intentionally I leave that alone.
> 
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>

This patch was committed with unaddressed review comments. The normal action
in such a case would be to revert, expecting a v2 to arrive. One alternative
here would be a timely incremental patch submission. Another alternative,
considering in particular Thomas's most recent reply, would be to properly
downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
CHANGELOG.md).

I'll give it until the end of next week for either of the alternatives to be
carried out. If nothing appears by then, I'll assume I may rightfully revert.
(This timeline also allows putting this topic on the Community Call agenda,
should anyone think this is necessary.)

Regards, Jan

