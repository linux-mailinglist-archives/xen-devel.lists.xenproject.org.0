Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0F5BAA3D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 12:29:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407917.650590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8ab-0002ry-Lt; Fri, 16 Sep 2022 10:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407917.650590; Fri, 16 Sep 2022 10:28:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8ab-0002oz-Ia; Fri, 16 Sep 2022 10:28:53 +0000
Received: by outflank-mailman (input) for mailman id 407917;
 Fri, 16 Sep 2022 10:28:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCzl=ZT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oZ8aZ-0002ot-GE
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 10:28:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60064.outbound.protection.outlook.com [40.107.6.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a5aeaf8-35aa-11ed-9761-273f2230c3a0;
 Fri, 16 Sep 2022 12:28:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7331.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.16; Fri, 16 Sep
 2022 10:28:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5632.016; Fri, 16 Sep 2022
 10:28:47 +0000
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
X-Inumbo-ID: 5a5aeaf8-35aa-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bquvh/Zq01soxvTur9C8gb+AWAGFDQu0svPOh6jtoYxNDlLJzYDhTqQYJn8j3/+yzYJnf+VTwqbiKvxSGeZVjr8+BiJwYSXwgyLMWLCN3aQ8w37JteRms5FyEo9/y4ysLrOsQ7CR4NHmZLvYPKEWBraN4zSo1sdUz5+VqZelHVzQp3k7AP4FPqSPIXyuQW7keh0nTDN8grsgTb+L7OUMi/Y6EuhFoxL4ln46BWO+TnLfGZty+7+mGI7Fm1a+HmQ7NSvEmuqSkwgsUARsipvZsB3S2a8wVW0bjdsoDkscSACuswcgrYQQv0DkjZjGMTeAT/NELTed843ZGBEIe1RMug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQTYyB+8lI9R9twfp/m7oqt+qDJkVuIRiztfjyjIo2Y=;
 b=VWv+fRbflDaTxVvOFd44LHe8gaJ01agEHTJekafGIOq+GDtmu2sBRwcU6f4+36IgO5FtfIOe8WMORzuIY/0AgryiODwZBXedou37K3fhTqhTmrCySKhjkDdUhcNKfEHOnHZiuKze9+nzI3XilOM5+YUDEgyDDgZN9plNtfCo4vw5bf+AjsC8BPVhEVU3iopIv/LPEzkQrWvbFYks+TdKlqRNkEUBaFh6AmCjDSAXeijbzqTC4URWLCE1yXKBO4zxHuhuZmhsMD9kaADXQbD5o0z6N1ZqlWmdICWv6vAQJNVRVpCHKxnuVRD5sb8GUxJ4hdJXAEoPoTknEFDqgQ7MMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQTYyB+8lI9R9twfp/m7oqt+qDJkVuIRiztfjyjIo2Y=;
 b=vewWXD5ToPCKCsDZiIlfKB/aTjnG+VwLxjSgUxx3WqEnbLt7SA2gD+WrQBlkGu90+ddZZQsChkSpfXKroGwlkFsIpsCZ2W/D/jTyudwIx3CHgSJTAwWmdB3hnPwmj7pQNCPxEckT9oxtad2ogA7ss/UirKIDwzFnM5x2SyMlSpedqHd5cAK9Qnx/eQsjmgNNfMQXw0SZBNE6gvuU1yuJnukqIsdS2CXX9M5fbjpmHdV3RLGCZPkzZuAdBQnv6F91mEgsxItFTh9CeYWDvoQCXdMugIVwT88xI8WS6GQ/009DWXaCM5K0zPcvHXRjD46HuTK4moPYWRcGDlsjEeuiQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92a8ad2a-9b9c-b147-c175-0a9b4dab4821@suse.com>
Date: Fri, 16 Sep 2022 12:28:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: Default reboot method (was: Re: Console output stops on
 dbgp=xhci)
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
 <YyJOWDWYVpShtAU9@mail-itl>
 <CABfawhnLzmBLjeVGAFVMy27MCGMrddaic_31FvuJ3sCevsvXww@mail.gmail.com>
 <32e97d9a-a5b6-05bb-5cb2-bf9a1461c851@suse.com>
 <CABfawhmdja_qkomOq=8HLGAW1MWA6rcG=Aqo+frM6eYrgUYkSw@mail.gmail.com>
 <7adee56c-607e-7d3f-8aa6-1ee5b2fdd133@suse.com>
 <CABfawh=y_ACt-YAOOxiLVQoHGJZ_K8Axt4TyXMAaRpT9cYmJyA@mail.gmail.com>
 <6bd99d37-f9e6-647a-6e2d-d774fcd597a3@suse.com>
 <CABfawh=si40W3foBq_W0nZ_NVXxPyeT02c0+L9k70LwsP=jjsA@mail.gmail.com>
 <2697981f-8ae2-d3e7-1a6a-046927a66246@suse.com> <YyRHiV/HHisshYJl@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YyRHiV/HHisshYJl@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 6666fc17-b0b5-47b2-2508-08da97ce3d2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/WKmrV14YzfLCc2XqgIcTWxXUEHhuwTL4Y2YqQbfDvwEh0dpB+KIa4Gy2k96enORFkCWQEiaZ2fQQVQkLnWb9e5LX2t43neGmYzipLZyhoS/CUG3Su+JYUBdfvIBIHVmJeufHJPignQPv0+VEI1NePBTG3ZjdbuehQnXTev3leqH363L/simz6rAbRzGLXr0XJns2DHvxQrp4maBvjJYlygYTOcZyi03j2+QBkM8C0MtfJYVwBseZ2aAjebdFNfmbCyO6kxn8L0S41V5EtgLOK6mKrkF5CDBw86myzhCQXREFypC5WgROs+n6j+E6Zq2eZTi23yiu30GmCvTTfW046P1ArGo9LiVJnrDvRLVi4PEiN6iKOPKFwcQUSK7JB3Yw+/uIUNdQyk61iIoZeTBoxPVQCkfUH4AKfAsCql6jw8SE6btCnoRRDhCcq5LpdKhaRsttjipEef/AzghPbY1G61u/XgaMo5D6H99Iv0n3zzhjuiiUGzve+4Msh3nXPhKHCm7F8vGmIRjX/NU8iMUGdnytE1NYd5zZ/RqSRwVOxXzJgQ5JCFu2/dxczTz30/N6amIKIEqhB7IffqRxln8JM3gaAU/HrOIph47lUu00MmBbSgi2iYiYeZqo8Vkw45NNM3+lX4GqV55SV9GG2JeHLU1bgwtukDwUdkKAMbN29IrFskmAcFoUAY20KwfimZEFdEoi00MyLKtBJeoba15Lj3clBCq6XCqOD0D1AuLlzsjjrXfbBk6lL8IPmpiSKnd/8z3EbaD2wujtG7zWRymYlsq+aDd082qgo7pBPwx+4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199015)(66946007)(8936002)(2616005)(6506007)(4744005)(6512007)(26005)(53546011)(66574015)(186003)(316002)(86362001)(54906003)(6916009)(6486002)(36756003)(41300700001)(31696002)(478600001)(31686004)(5660300002)(2906002)(8676002)(38100700002)(4326008)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGlVbXlPYVJXWEhMbXByMkk2ckF1dEt0SUIvZUIxQzlhcVBIUTJvTklFVVpB?=
 =?utf-8?B?QjVEWTdSN2g1SUU5WDJmNmtKdjZ6TVBBRjBOYzBtbWdVM3k2aWg3ME9hOCtX?=
 =?utf-8?B?TVhYOHhhelpSdnBTZVNPUVZERTVTbGhoN1p0V1R6emk5Sjd3S1BKNExzc0ZU?=
 =?utf-8?B?RXJvVEZzRjZtSDhKZlByWnY1WW9aUDRtUlJCS1VKemZVS2JHMEhFZFUzT29D?=
 =?utf-8?B?ekdRMDFrVXdlQm52Qmc1Qnc0ekt1VnJrK3JTbW41dnAreGYyNFFqRkd1M3pq?=
 =?utf-8?B?ZU1RSWVjL3R1aEJQZ2RudE9Od1VPYnh3S2UwNStUT1lCSVBjN3hqU0w5VjRV?=
 =?utf-8?B?YVZ4MjlJVmJqZEN1QTVPM2tFWXJMVWxXWEJ0QjRVc00rRGt2a2VlV1RHcDFp?=
 =?utf-8?B?Z3NQMjJEZTZUTFU3SFZZMlJIaDRma1EwemtnYTg1L1kzU3RnVVozK3diUkxB?=
 =?utf-8?B?clUrUU1OOVVhVElWbUx3cDVLL0hVM2hXU1hQNlY5R082dFp4TjU4VFlZaDln?=
 =?utf-8?B?TDFwZTRvejN3cEdNR1pkL0MxMjZUQk92dG40UC8rR1FrcVRNeUdRd3pXdGtI?=
 =?utf-8?B?WjAvSTk0cWpJMVlXQmsvMjRVNStGZFhicVZ3cGsveVh4QW90akpLcTNyT2Ra?=
 =?utf-8?B?Mk1nc0VyY0ZOc3FzSjhOcnN0NCtPcWlDaVUvYzg3bktDQ0xSYjY3WnRrUVB0?=
 =?utf-8?B?N0x5bVhid1AyT2Y5U0l6MnRjSG5UVHVRdEFYM25EUFl3dVRuSWh4MVMzeTJY?=
 =?utf-8?B?eDVIbzlnNVpyQjV0VG5VZExPSXFrUGMxMTdiT0c0SGlBbGR1c2pRNjI4ZjhP?=
 =?utf-8?B?V3NqaGFGN00zYXFDNVQveUhRTzF5S3F3clJGM2hYTWpra2sxM1UzRjlzdG52?=
 =?utf-8?B?R2J0UllyRjFmUVYrdzJkMUdFNjJUeDBiTDJnYWxjOTIweTJ2Qm9rZnhJcjRU?=
 =?utf-8?B?RXNZU3NocWJkL2pUNnFIWUlSUW9DcUhEdEJvMkQzeWFacXNqV3FkUytFVTh6?=
 =?utf-8?B?cmdBZ0NqYm9lWjYxNkp4VWlYckRJdjFjNTJjcGJ2STBiNkRmWnhPOG9ZVWZU?=
 =?utf-8?B?VEMwbVEwQ0hyQXprMUtaYTF2UktRUmFEMVowYzJBZmlCRStxZVRCNFRiTWFS?=
 =?utf-8?B?Q05rNUh5YTNwMFd5LzdISWVHV3pVeTdrYjNHMWMzK283NFpqTnhxT1piRUV0?=
 =?utf-8?B?QUZ5T2xCUlFaZHdEU3RxWGtXUEZ0ZUdubkJlbUZ0dDlaS1ZuOFlrRUcvNGZa?=
 =?utf-8?B?a1Z1c2NXN0lvSXdCTEFvdkszenNHNDBKZ3VldnRSaUwvRXVCQVg4TjhNU05i?=
 =?utf-8?B?dXBrUGhyNWtUcjRPR0YrOVh6ck5YQk1nbjcxVEYwaURVeW5VV3R5UnRId0py?=
 =?utf-8?B?OWd2cUg3a080U1pSQlVFS1dCZ2htdWdDV0xpeGE4Ryt3ZnRCWFBqakdFbGh0?=
 =?utf-8?B?YmtoVGtjaTVJb0NYcUxVU1Z4YlZGeUZyQ01HZGVvT0ZrQ2huaXhPM0Y3dU85?=
 =?utf-8?B?TTNDcTB5SEhjcUlHcW0zTTdudGYrOVFTd3BDY3BEaXNTWDZaeHlrOTk1SjB4?=
 =?utf-8?B?bk1xZllUVzlRWllRODBQOXVHZ3BwRnE2NDI2b3ZPdUMzdHRZQ205bTRTUm9G?=
 =?utf-8?B?K2NzRXFpeHpwVEpNdDBUb2RWckhQclBWc2kwMXhZVmdzMFE5NU93VTBGdHlS?=
 =?utf-8?B?azlVdTZPT1FQS3pzOGFSQzZvdDBFelllRnA4SEN1RnJuaGlnWmtVRVZyN3Ji?=
 =?utf-8?B?a2VSZjdxZFdEd3luSEMvL0p2RGx4Y0lyWlkwZXYyYXdIcjE5WnI5QjIvNEVM?=
 =?utf-8?B?YVA3bWlLM0ladTE3SmYwTG9Xc1RudkxRTGdsaTlxekJpVFhwL0xYLzRtRmVW?=
 =?utf-8?B?ZUdITThxMnVHUGs2ZlZBQlgyclhyQTB0dk0zN2pCcWRWZnZ2MWVQclR3RGcy?=
 =?utf-8?B?RUM2bTUzeTJRUDlVVFJzUmR4ajlINWVwVTMzUitBVGxiZXhxZkJQTEduWnFw?=
 =?utf-8?B?M2tLTjVpVVdtL2tPS2dadk1MYzFuTTJZcjFNUnhOMU9sTzg0RnNpdm4xbUtq?=
 =?utf-8?B?bHUwVktVbGJxMXRoaW9Kb1d6YzFoSU45bDh1Q1FYWE1yMzQ2WWIrcWpyOW8z?=
 =?utf-8?Q?M5yk2GZoWWTuDvkkdGijLqtGZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6666fc17-b0b5-47b2-2508-08da97ce3d2a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2022 10:28:47.3294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEyZ7CeaOlI1VNxRGDhEl2XxRTO4jkuJcmbacmx6jPd96ch1G649Id6IR5SW+GFoG+U9XsGu4Bj8EzfvbzdxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7331

On 16.09.2022 11:53, Marek Marczykowski-Górecki wrote:
> On Fri, Sep 16, 2022 at 07:57:59AM +0200, Jan Beulich wrote:
>> ... this leads to the crash, which effectively tells us that this is
>> likely yet another system where one needs to override the reboot
>> method (e.g. reboot=acpi).
> 
> At least Linux, but also XenServer uses reboot=acpi by default (even on
> EFI systems), can we make it default in upstream Xen? Issues with
> reboot=efi are rather common, while reboot=acpi just works.

But rebooting by means other than the EFI runtime service has always been
against the spirit of EFI.

Jan


