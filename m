Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEE062B4AC
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444202.699138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDVU-00086d-Rv; Wed, 16 Nov 2022 08:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444202.699138; Wed, 16 Nov 2022 08:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDVU-00084E-PG; Wed, 16 Nov 2022 08:10:52 +0000
Received: by outflank-mailman (input) for mailman id 444202;
 Wed, 16 Nov 2022 08:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1l6N=3Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ovDVS-000848-Pk
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:10:50 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe13::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e224e7c-6586-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:10:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8794.eurprd04.prod.outlook.com (2603:10a6:20b:409::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Wed, 16 Nov
 2022 08:10:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 08:10:47 +0000
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
X-Inumbo-ID: 2e224e7c-6586-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G51QF2FuPCpN34evqYCSNQXCeG9yAu85nKKAgJPkG7AHpYnxCLP1c0ZqGkjbt61Rzz1HGHhXGcppoS0KZvOOIOQo0jEMWshfvjpk6yeDU/uT4aXJn+ch0qxF3SNQJmpJcUdOCNCdAeU2WKZX4Ke96soEHoc6dTr8keI+3lCI81zCjncTsJKgKJgFVr2PWdRxCTmBl7N3qlHae1rnoxRk60vm7SeUsy5PXNj/hefS50gYlMQ9YiuPow6kYjTP2FKdthCaK1XrIbu2UjXRohGKbwlGn8oSlBFodDALr7uifSSGCCLIaw5r/jt+EZNGcnbPGleUXoZhQ2lRhAKBR15vgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKzEfSxDSkCZhPYsUR73ssviqzn23fsjghILg9A887o=;
 b=WjNu6RFY9G6VMt854ElzxdslM3CZKyKP0qBaSZVbBwp/Iq6SFkXHS9yDYi8ZvEABymY7DreHq8T7xrhj5r8dRS2W5g94yeU+mXX2/DZw/3JyrYCZUzhSg8wexBbbH1TkYzZmKdHG05X/G0RIJPjas6j/Uxvp57ODRXLNfXfrVHjI7v2W4fpoSmSy/fw8zk7wyzJJl2984YtC7lASDjW0BajpIjcHBuClccD5WoJ5kcWOYZsq+ceNmCohwmXE19IE03yjA2OMcdY32GqIyqZW7ygRVOrk/4PcjCpgObYzxWQJtUqsYbWG8mAvTtFW8dOUH/xyRZVEPjwKQ9B6hXJaBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKzEfSxDSkCZhPYsUR73ssviqzn23fsjghILg9A887o=;
 b=2sIFeAbjddSxdn+gmLx+DPLjw5bQTDgkbZqOmUkXx3KvT1HytAlcGb95VTfMDTkY3RiGQJVFUZ6ljvx635GIbjyzNld3SFkgehMCabQB32dlplr3uGK0TYjBSTw1n4LMD+pbIM/EOJ4R5r8blQPw7cYx83LWC77SbfH+oPrbHY7NKIbn2ovE0/3hUJ9On9T7UBL2f0LRHJo0gJsf6/akCSwlV5zELAAxYsrZq/R+6wzz8IdcafeX+c/3uCbgd2QRD5jSupG0aPqvcLyqDENPJyYUe8cDhy/YI8UOw/yWDWygRdpfOUL/04AT87vcBTCDvG9D36S2iulit4gPGlRDWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <42e76560-24ab-7830-5a24-a3366dfbba36@suse.com>
Date: Wed, 16 Nov 2022 09:10:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 3/3] CHANGELOG: Start new "unstable" section
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20221116042634.50948-1-Henry.Wang@arm.com>
 <20221116042634.50948-4-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221116042634.50948-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: 559d729c-dc15-41b8-aef3-08dac7aa115b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PFGXbRcvqjKXdA0whtqaAgHVC50XssPFQgfyunZi3zWIxYLz1NEthrQy2e/3xflZiGx1bgZQfbncegCjC5ZWPIRKaYM5XW6oadI9kkPDFIfgtf/1rOMoU0i9p4Mithn6cOlHQH5QeH8TvhDZdFZ/ri6aWSJhb4pqEbq0CHgPDrShOc/m6j5g3wLJvlHGyZ2SDqBO7OKFOxwPTO/SrrSPnt4zRVqIOtRrN4f+VNw5aNJml3Q6yeGQQg8xzxsjSUM7jSn5Htaki7OpZw3tBUqRr+Ji+t9N3OIAcjdUWSe5MNQ3jUrhOgGEUtZD22BUfXgLUUIRnj3+gCrTmUgUeqMoX75o+TXEx5X8ir4f6L7+hyhGh4NeAEAZeteFaiK4T41cmgOSyp0LG6y0ziGEolv4uN9aKW3NpcB1tyJFiB7JPDBN6/vVl14op+nBDowpMRtWgzaKSr6OyM7sLqSIgd/hftudTqs3Bhd+/CjSd/d7x67q7Kf8r19RbVQPd9lCuPOwehbi1UN155DBwO1tPd4kGBkHE8jSOAGNCLuyEWtPeGv0+zxMF/x0viWAsTJ2eC/XAwTkRnHxkEPiCFDUKlUMFU15u0bd59+Zba4rcXFWSv7T6n1RdYiHy4ikazvVox5YPtp/1sdns9REzbH3gww9Y5dxHW6bCFQwcxPPXRkty5QWWRq9uHrjIW6ZwZcE/nD0lsbZor8FLOf3Xv17SvheHAjnUvPk7VcdCSAUawkKbGH3dxk6m5hzAnkhBp61Kf8fXLjBgxPN1TiEfQp6X29dlIAM9nn8WXo97OeCVWROzKaYWALbtQehivAWymtKZU6/thqE+NCqCpNW1rt6B3MjdQcXzhlDekpgjg5wTghU0mv+HtN93rnLnoDmib7kkU2Le9sUuKQg8+BhhWYda0vfiA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(38100700002)(31686004)(36756003)(86362001)(31696002)(8936002)(5660300002)(4744005)(2906002)(186003)(2616005)(316002)(6916009)(41300700001)(4326008)(8676002)(26005)(478600001)(66556008)(66946007)(6506007)(6512007)(66476007)(53546011)(6486002)(59356011)(207903002)(219803003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWtvSktZcDJDK3pEajlRSmI4Tk1lMG10UG5xMU5mOWxIWm5XcWsyOVRpUlNV?=
 =?utf-8?B?Y3hVbkpSZjV2aDNEYWtLZmNrWEpmeXpwQnZJMzRMelNVZlhObVhaZ2xQcTV6?=
 =?utf-8?B?N0g4OGRBRTdFTmJLNjgyU1FDai9ES2h1aGxnSjE5U3hUanJhOFdqZy9hUThl?=
 =?utf-8?B?TVY1L1VwenFIWlVMclF6a3lmYXBsbUpveEhITTNidG1GbXo2SHUwbi9CT3F0?=
 =?utf-8?B?eW5TVTQ0anhsVTVkUEZYMTFxcW9TdUpUOU0wZFQwVDkzaFZhWDl5RjZNS0V0?=
 =?utf-8?B?VktQUzdYcGtNLzBiQ3MzSnhRR29hazFPdUxWS2RxVXg3NXVoaGpnRjljSjNi?=
 =?utf-8?B?VENxYTdvZnJXRE1SeVpTT1poU1dSTXdCdmtQQVpoS2dPb2FrbWFCOXJ2Q0lF?=
 =?utf-8?B?cHV4VHVrSFE2eE82Ym81QW55MnhYWSt2dGJCY3h3cGdkeVEvSWNGcWNVSmpC?=
 =?utf-8?B?MXBza3JMdWtrSTJJMnlUeHMyZ0Y1VWJQRTQ2STU0NUUxcXVsR2ZyRW5TcHJK?=
 =?utf-8?B?Z3luZ1R1RTBSYmN6bDBsUnJmMkZiYWZkRFZWNFVVOEVJaHNtdHpUb3RQZWZp?=
 =?utf-8?B?b1Ftbkl1a0VVRHRiZWdVVjJ1dXlhQmpMZ2lnRkk4MjhjelpMVEhDR2lkeTY2?=
 =?utf-8?B?QXRDdTUrYTJRWGZMdkxBdXpRRHNpaVNjVlRwbDMwRHc0OW9DNkt2UnRzcWxL?=
 =?utf-8?B?ZVVUUjArK3IrNm1HUDJQaHBmcHh1N01QdEVMZDRYdVd5aGJ3aHdBSnNDL1E1?=
 =?utf-8?B?amhEL0JvZ3pCclpmSXBqYXBsVmJDcTZsdDYzcnlnWnFTb2NBRldTazRQN3N6?=
 =?utf-8?B?WWtzejZZTnEzM2kwSUl6VmtFZTNjUHJuOVhxamdXWGxyU2NubktFVzFWRlFi?=
 =?utf-8?B?enljaVpSbEFNOHdZTmFoTkVqMWVRdGVMUDBPWDRLUW9RSWdRMUtMdVJVNlB0?=
 =?utf-8?B?TUxZN0lDZGFuRHpHcnVnZE8rV0kxOTRTTUZqQzhId3BUSVhGZm9SSVFpNUZK?=
 =?utf-8?B?VlFzazFRRmxPb1lIeklxcHVUY212MWpDbUEyQi84dTlXcjNhMHovYkp3TXVa?=
 =?utf-8?B?Rmxjd2oyZEorMStXTmpXK3ZVMFN3cUhEV3lPUlo0eTU0UzZFa0xkOTN3QXNk?=
 =?utf-8?B?YTBHSWZIb0tzMEF6SnhrbEpCTTlNdU1HSWxrTGZJMDdOcWJVclVKMU15Y3ph?=
 =?utf-8?B?OURkRzl0Q29tWUpEMkVjTm55VitlOHQwUEd5bkJXVzVqZHNPYW83a3FDbTdB?=
 =?utf-8?B?N3NpWmFtcURZd0FNZEpmQlFiQk5ib2hqVWtGTUhSZVhhYXQrdUhOT0RGQXVs?=
 =?utf-8?B?aUZPVzZyTzBuaTR5Z1FGWGJzWER1SklBNVZkaTJDQ3B4Zks2cVBMQnpuV1hM?=
 =?utf-8?B?YXlPekMrRTZxOE54elpWYisyVFNJWG93ZkNvaWJLOWg1cEJwck44SXF5S2cv?=
 =?utf-8?B?cHc2UUNwVzhiMGlCTHl1QVBJc2E5RzlkTzRjREJCd2FmUXJTQWt2d1h2RDJo?=
 =?utf-8?B?Z3lWeG8ycC9sTUtPMTlldUFBYnBBZVc2dWg5d0gzaTYzblRvN3RPTUIwdXQv?=
 =?utf-8?B?MzBqbG50Mml6ZTBHWExuQWR1cGlBTS9Fc0FpcHBtQ2M0NlpTbE1tcUkwL2RW?=
 =?utf-8?B?akhNN3QwV2hHNEtmOTZoSkN3RHhXRExVNG85UHlWazBGSjg5MEFESGFKUTdo?=
 =?utf-8?B?V0FJNnZMRVdZSHlnbCtGVFRPeVBDc0R2d2MrQXp2MzZuWDR5dzNUQmhnb2Vh?=
 =?utf-8?B?c1JGQU1nbllsRGlBdjR0ZitpdC9Td2hoTGFOUWg3YmpyOTNXNFdkRURWUTFr?=
 =?utf-8?B?U2xrbWNmZkx1QnJOTmVKQXlGaittTU9zOVdhWEtxY3NHWW9wTkNLK3A2QnRq?=
 =?utf-8?B?bUhLMTgrb3ozSTlZRXVRS3loRnNqT3VvOXdIcU52dWp1WE5pTmZzaTk5M1ZY?=
 =?utf-8?B?MnBGRlkwRVYxTjFpLzlSNXpwcytadlp1MUcrN2FYYzI2U0FBRTAzazNSeGY4?=
 =?utf-8?B?Z0pJMWJGQnQ2M2JUbURRTGFLck80K1JUcWN2YnhaeGNSSG5VV1lVcm5aNG1m?=
 =?utf-8?B?N2xtcEU4dGRtM2VocUJ4THI0akV4bkVEYmIyWS80U2JnZjRoU2VJbEhKSWp4?=
 =?utf-8?Q?k4R07S4uYs/x0zvgL5smB6qcs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 559d729c-dc15-41b8-aef3-08dac7aa115b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:10:47.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aG5/fSCsG3RLjL4F221r/yyqwNObnYDg90PO3EKBF6avRM5YRbCH+CFz2bYRUDdJazqmrbHtZ7gXYAlX+aSnqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8794

On 16.11.2022 05:26, Henry Wang wrote:
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -4,6 +4,8 @@ Notable changes to Xen will be documented in this file.
>  
>  The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>  
> +## [unstable UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
> +
>  ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=staging) - 2022-11-??

Since the adjustment to the 4.17 entry is (I expect) going to appear only
after branching, and hence perhaps only on the branch, wouldn't this
addition of a new "unstable" entry be the right time to also adjust the
4.17 entry?

Jan

