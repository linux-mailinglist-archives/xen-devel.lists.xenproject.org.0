Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4997E63D52B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Nov 2022 13:02:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449837.706822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Lmu-0003Z5-Ob; Wed, 30 Nov 2022 12:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449837.706822; Wed, 30 Nov 2022 12:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0Lmu-0003Wj-KL; Wed, 30 Nov 2022 12:02:04 +0000
Received: by outflank-mailman (input) for mailman id 449837;
 Wed, 30 Nov 2022 12:02:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4wzj=36=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0Lmt-0003RW-0L
 for xen-devel@lists.xenproject.org; Wed, 30 Nov 2022 12:02:03 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe02::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c99e6c9f-70a6-11ed-8fd2-01056ac49cbb;
 Wed, 30 Nov 2022 13:01:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 12:01:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 12:01:59 +0000
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
X-Inumbo-ID: c99e6c9f-70a6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2TQgGMkUCFeWM0NTOy+QTXn1sc2EWau9YIkZOD4k3eEWPReYBXBW9wcQJbIhaev5Lbxol/x/b1TmQWmXQgPJ1h79UXxuL6llGbd/jyV+lZ1K2Wo6i7GpTrWKiROlMh+pV1eJUJmzzAKQHLIZEqoOvp0NuknLtw/9HNWF/uxas98fi3VzgJHEFaJLwb+oRGCdjCmTH8U56Hq3jIDZ2DYxoEMrWA2F4ounf5rmFq+KbkY+T4lP4WXlVvnIY0e24RQ/EawsPGxUjWUzdY0aGlrQYFW0QcCCbmHKuTnhe2FBUcKohRjz1k0m4N7cGiwvlV0DCyD03wL5GaWb9896fqvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxGDAiMsGhspSjRoO+ViyEmOjq0u3fEicMhhyFsshd8=;
 b=fGMdhEqwmQGziYoZ9Bu6peGSQDiVeZ8YssAlrDmTu9z5h6Z3p7mbBb77+t6UYP6T+Ii4DuwhK5VkjUO61aIZ/v6S/kJX6Vdo1V1g43+g209Z7dS035//MEdWDm42fJ1Vzr6ssN/2hs0+ZKm5A9U19hPhcwbupix91fHiwBXuz21APSksHEmYEpWOxkfg+btXB5vqgg5A6fBvcrV85EYxGCBYFa05wjtQ+Q/oQa94MRBp106/NW8nP9d0qp3/k1CvKKz/HKX82Frai53F02kB9X4TJ2/WZl5cpEi+L55FW8jR1Jl4EgUINg6nQujUlLHJF3Djq1aqdzfYhVszYqgllQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxGDAiMsGhspSjRoO+ViyEmOjq0u3fEicMhhyFsshd8=;
 b=h8Gkret/0HEZcwq3qehg//iJl+1pqWSzW9nniBkEBRsGz+5bwOIZyfwj6P7D4RCz275R0bXcgJkMlHyGKX/8oPBRZbPg8i12uIfyebqxknrNx6oAsi1eEtiwIll5nA1sWibIhX90jE3cDvzxfm0qk/xecBzZ8IFRw5bNbCyso9qrIlQabuBgSATjaYDzknQ9MN88kqxjMdpd2/yxthAbIVpEZo0Py/aW0wcYCQTb4M7Hr0batyMlT9qI66kliWT+EL99l1oIqmsUwU216BmraXS0XmnIUQD34YC5MGBoBzuGyZolxN43JWQAVKkz5iPNr1MIw0bVNZmA2DVlcIn+Ew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fec9fd11-7bbe-da64-6417-264878b06ec1@suse.com>
Date: Wed, 30 Nov 2022 13:01:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Arm: AArch32: Need suggestions to support 32 bit physical
 addresses
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, Vladimir Murzin
 <vladimir.murzin@arm.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70651dbc-085d-706d-17d0-a419086a0700@amd.com>
 <a352eb18-0ae6-a1f3-08e6-87f53494ad8a@xen.org>
 <65891843-db28-e5dd-6e9e-3fb003fcabc5@amd.com>
 <ddeb7a03-cab3-2a26-7f64-3a1b5f0882d6@xen.org>
 <105a0d45-5b3d-7986-92c1-9a13eb803bd8@amd.com>
 <22d28805-8889-25e9-6d18-c868bf5e51bb@suse.com>
 <21ae8452-167c-88d3-1604-162018408ea6@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <21ae8452-167c-88d3-1604-162018408ea6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: ae4d96f3-0435-4e40-7568-08dad2caaefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	16KUo2HSsD6S2WMextSk99OAmJY9d2qlnsmBdcZzrGDu/DJfHXUcc+o0x0Qaa7He+3g+S+6YwHVEQZgT9Xp20vJwVNyeCiQ66RwiiLb9os4wPvymZ83i/zX84KVFMpeQkO05iG3Va4AgJDSqHxVfwJaGzGvVevEBKJ1S+tSfkMt1KcensqURO+4XlqDXUDjs8GwDGYfn9OMMSY8nO/3FaLUqNAoWYVaysZ5BKppEyBZVmuDiaTS5rB+cAwJlNCUNt53T5E8hYpP+p5ILsCrlwht23otcZJ00nAtjCYlfGnGW1dC1tkaOQFtB3vTr4rSCuRjIwZyk9NjpoUtqPkTw78yEFQKNHLwE76DdbW1sbw91YB5uBZKO+uxauQwCGh+yg/hekMTHBptzhkz4/9te5tG+fAMnqSfvzaGjystdcD+cEDC2VvPbFHPwgzzQfip5UegfM6T/wHgcw+9VKCdj3xgt3HOmPdXup3qepwYTufA5T6z2zY3Vgs0OekRiBx6GGlZixjnTm3wtt6hW+Or4SQLb/q4zCobvBCNrWTzjohehn8dNd9JUTaDs+perSSbxaVB4HEy7CBXUO2DX7RaHAnj6RCr/NnuNi8dUufTCYcLnQ2a8DSZuh2QZVXovWLvKgfsLY4975qe97aykDY+AQauZsO9euJRHYjmVrQL3IApy37aGrMMqpaFIZQJOgLJAU41vc5Yo1hTvWmW0L+PHw3KJBNCdneJlwteQDrQB7wk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(316002)(6916009)(54906003)(7416002)(478600001)(38100700002)(5660300002)(86362001)(31696002)(41300700001)(36756003)(4326008)(66946007)(8936002)(66476007)(4744005)(66556008)(8676002)(186003)(6486002)(2616005)(31686004)(53546011)(6506007)(26005)(6512007)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXE1Q1VoVGdGeW9VaGgwOVBOaGpaTGQvVjRrSGZ1WnRUcmJicHFrRVV3aTVI?=
 =?utf-8?B?TGwvRjlOdll4VDBVd1BwVlB2dU1LdGlpZHR2d0NCTW1Ydi8rRTRlbk5VWEZH?=
 =?utf-8?B?UE9GYW90QXAzM1RJekNqa1ZDRjVXZVBKTGdTTXdkNER4S2w4Z2VpVm4wM1k2?=
 =?utf-8?B?SVNjUGpuZExKRTRMK1N4Q0xUeEZndndBU2hZaW96VlE1cDVleXdkZ3JvdURZ?=
 =?utf-8?B?QXA2VGl6RzR5MHowQkRycllRUEQvS2oxajZ3VEhzSlZXdHl4amJBZ29hb1Er?=
 =?utf-8?B?VVJibUl6WTdhTXRnd1BmdGpDc2VFeHFpT0c0cWFTY2RubFFMV0VLc2hudnY2?=
 =?utf-8?B?d05ld0JDV2x5NG5IQ1B5dW1RbUxzU0xISk5QdUVQbkZGNzFwdlRSVWVjb3B1?=
 =?utf-8?B?L0M1aXJuTUpQRDRLMzBIbmRqVUJkSEYvSTBCbGV4R0pYYThvK2NIaitsd0Ro?=
 =?utf-8?B?dEo5U2dJc2gwaDU3UDJJdHNoRUgrTDhKRnh3bTlEZm13Z2xlS1JxenIzZnp0?=
 =?utf-8?B?NUZqcmtiUjJ6NlpvTnk5U1VnZXFjNzYxc1N4N3FrYWl6TzVFVzQrMWlyUUhE?=
 =?utf-8?B?dGJ3MnU0aHFuVjlSdEh4Qm1iMkRhVjhZNlBEbzg2SmZaNEp5NzNyOTFSdGlZ?=
 =?utf-8?B?ZGNML2hSb3hrdjZza0pPZitlaDNPWHFhUC8xQnZnMUpvWU84bHNySllaa3V3?=
 =?utf-8?B?Z1VOTm9nbnFOOGZjdURHcjVmcUJQUE5aNkdCNExxcC9QeTRPNzVUSXZyVVNM?=
 =?utf-8?B?MHZrQ2lDL1hyQi9RYktHdk1xZy82NkMvYmhkb0VtWGFDb25FVlJiMTFheEJa?=
 =?utf-8?B?bUFuOU1MQjlsVEZyVFppMXp6U0s1RkdjdkJLTzVySEoxaitvK2hRLzhXYWtV?=
 =?utf-8?B?WjhiODIwNjlkL2lIa0tOOUtLaTkwamxhb3lGb0RUQXh5TEhRaE4yY3dCWHlD?=
 =?utf-8?B?QzBvVkpkWHR1MGFPYk1KbFFIWmozZks4WStkYkRHT01vSHYzeHJEUDRDZGp1?=
 =?utf-8?B?ZlhHeERGc2x6TUZrNTRjWG1GTkUvWTB2cU9HQktRbkJzSjN6STE3MFdLWTNR?=
 =?utf-8?B?c1ZmN3lTU2h6VitVZFBWZ1phdDVDbUhuL2lydTEzOTFXdEtreUZPN2JtREJu?=
 =?utf-8?B?R0l3TXdSSHFETjRkb25BcjYrQVRSZjRTZHkyUFB6dlJxS0g4dU5uTTg0Nzh4?=
 =?utf-8?B?bDhTWTdtblVqU0U0bVNlaEt6UXFWVXRyeVZkWHVjTFArYWpzU3ZzQ1A3QWt2?=
 =?utf-8?B?S2dTSFV1bWNUVHhRZmlpMWFqcUttOVVnRnI3bVpEWGs3d0YxUXVCVDJ2U1hn?=
 =?utf-8?B?cVlvbjNNUmJLRklHN21SbVl5UzZra1NmaHVTZkpsOEYzMDkwTWxUY1VvVExk?=
 =?utf-8?B?cEQwUnpqOGw1elg4RDhMWk5Bdzg3elVuMTRFZG9rQUlLNlI0ZnRZeWxWNUR3?=
 =?utf-8?B?QjAxNDFuRDMyWHhCcmxNb2ZraDY3dkp6aW8wcE5iNURBZHR6OHVXRUdVTFl1?=
 =?utf-8?B?aVh6MndHb1N1MjFQSXRTMVo1OW9vUHczZEhXR1dyamdUL1IweDRydmlZVmx2?=
 =?utf-8?B?c1BFTlgyTDczSTlOUVhIcUsrQ29oTlRaclhvTUNhSWVxSTJpZXpITTVLY1Y2?=
 =?utf-8?B?QjdGa1RqZDZESzBiM1ZaN3QvRGVUbGF5NXBIdTZRSHNmVUZ2WWpKVGdJL0pH?=
 =?utf-8?B?SFMyTUtLQ01kQ1VtVml3WjUrQlR6UmUxV0J0NWU0YnQxbXlzT0Y1OEhEcmpj?=
 =?utf-8?B?R1k4QmNSOEJhcVQ0d0RnWmNOV3lsb3U3ZjZDUFNncitReEpJbEZyWTIvOUJV?=
 =?utf-8?B?T3ZpZnoyT3NGQ3Q5RWxsMDgvdytaNWVCOTBxdG93NVZqNC9FVGlCVkl6NGh6?=
 =?utf-8?B?cGFsN0ExKzNkUnhiS0ZQV1JEWmc1RW0zNHl5QzNtOUh5cWFFVURsNE9sdGJq?=
 =?utf-8?B?NlpuR0VSdXFOK2dzcHVuRHVwclFTNmhzVGNjZ3Qya2NYdktnUk5hR1plb1ZS?=
 =?utf-8?B?QVplWG8zUFBHYVZkbkFNR0xTVE5sWTBGZ3FkWU80Mm5xVE5qUTlPNWFsRkFs?=
 =?utf-8?B?ZnJtMVNyeEhvQm5UTzJ3bkNaNk5QNjNZMTcrZkZrQituOGMxL3ZIbktRRUZ2?=
 =?utf-8?Q?fi/A4V9mqRksdLNVMFBVJOPaJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae4d96f3-0435-4e40-7568-08dad2caaefd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 12:01:59.0231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7mJ9BDLQNDtm2oBBEfOub1MPmmHPMlLaCn+YjnAcos6o6nANPFZXnLkEOLfIQaWNpAiK9o0wJdktbq6LjfAvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595

On 30.11.2022 12:27, Ayan Kumar Halder wrote:
> Looking at "min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);", I do not 
> understand the reason for "... -1" (ie subtracting by 1).
> 
> Do you know the reason ?

That's because fls() and flsl() and friends return 1-based bit indexes
(with 0 being returned when the input was zero), when we need 0-based
values here.

Jan

