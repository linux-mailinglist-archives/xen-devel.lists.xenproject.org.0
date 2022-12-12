Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F80D649BD9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459386.717118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4frT-0006Az-2Z; Mon, 12 Dec 2022 10:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459386.717118; Mon, 12 Dec 2022 10:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4frS-00068k-Vk; Mon, 12 Dec 2022 10:16:38 +0000
Received: by outflank-mailman (input) for mailman id 459386;
 Mon, 12 Dec 2022 10:16:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4frR-00068O-Dt
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:16:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f3269cc-7a06-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 11:16:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9052.eurprd04.prod.outlook.com (2603:10a6:10:2e7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 12 Dec
 2022 10:16:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 10:16:33 +0000
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
X-Inumbo-ID: 0f3269cc-7a06-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXtCbDWF74U8a+PJiygDePglcU8ObDgULISazoubdZDCJOHvCb6SYqVaJzvWdGGuSzs5noadR4wIyZYnDOQ8BFnLcD7xvsWxqrvrpuKjIcOsCk8e0PldRTtCKs8T9rw3xhORyApJEg14VYVF8pbUtIJLh43cJohjnHWqb1UD4g7rkfyM/yR99C//+EUmHFvG11kDn4QeeixuMNoRwr498Sr+Xyvpj+jef05SU6U7QkAhL+rj0CPRjx/m8TgLL8Q51aU+D1EhxfKggBOv9zQCsRW00019iDmomeMhaNp2v+/N1Z102fdb5WGGmi7WJ7gCdmx3hPjtt0m4oIfIp48qvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jbGHzMBvgmBaiIv9+VXOj2aJ1FlY6Hs46cyEtiVHGw=;
 b=mb61noCxPkFHaU301Xu0yB/pZtTOpYVmVhfdkWpVwlLJpNnkitH6CDuVa7xV6VvSlGEVkGURCDqZY0lRMlg0nKLvX7tBsbIOjXzGUpPjOrTFLvRPD1hNviaocDbkVZXWtOQS13ufOq7RRC/Nzq8SdOYInRK67Mnc8kN6s6K+UWynj+haylVAusw0T85eGwa6AmhrTw3ay2ajqXVd+gNu5JUqzfZu73z9fTUxaj3Ztf9yDL7nMZoRfAc929g8T8fSYNTchtb3Bnju1pe4TZ08GFoBUD0Hc+9cArUnQ58VtpDe6XvxXluq0lHgz+rA1MQl+jwQ2ickK0IqkJhDa4YHiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jbGHzMBvgmBaiIv9+VXOj2aJ1FlY6Hs46cyEtiVHGw=;
 b=noywfDX4omvu7C9VN9ZT98FRhz6nL37FXOLno7wOid/JlYLeLCZnWUnL5QSACMmBe5iSjaf6Jje4ccDLK63FZdg81s2YUSyAq/gg+nXjTw+ISUgLA71qUCwEQKYlmcgdOgwyxvg/sHyGGcK9QS5czfulxrtToaDcl/Wzii1cpzDgKoRv6e2/xFTECekc+UmVeixIZHrJ+tGw4KVLSAul+CC8HIzG5w3RB5Uh1qxDdRX4tVTHIkJQuujoPmd67QE2oc2JEkE8bdQ4XZo1j3xRMK3ONHoKC23/5P4OSZ+GvGLgpGwErK0byXLiU2/TGnDVlmGd/zNQX3DdGjmTYBwAAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2db63a4f-10ca-8612-cf12-4ab7392bb4f4@suse.com>
Date: Mon, 12 Dec 2022 11:16:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2-ish] x86/boot: Relocate Xen using memcpy() directly
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20221209214244.17965-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221209214244.17965-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9052:EE_
X-MS-Office365-Filtering-Correlation-Id: ab000489-0684-48af-06a9-08dadc29f1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NIcP0szyqm91ThRBE2Mq223kPTp1QFDQIbH4dEIPl1oC3aWxiULsmHJKkbAO0N4Gn5c4yvY1irmLlgGy0mEMUHoWthBIEuxVvJuz8hcoczw8HUeAN3lv7qRe+3dkWT2AIQ/0IXN5ucmKoJrWOKK4UvzMUUmNlzbJEGi0WD/SoBJqHIgjNpZGEtZFq0kl4SX4NZJ1mZH3UxLwRklMLN7/Bj57erDsNZVGSUWdSXKwQy+qEcHlyFfrN1SH0AxR+kfXXzvORsEl/iVAmxytJydC1PG8lzAQ7EyMUd8PfsUVEG/+qcNSsJQhZBIdjwoax5eawZdwNicdhnovuWuGsPEKMJVCKuQ/2xMi5EsczmnLEcR/0fWHb+yE4HX2B/OlP772sA41vEEKHsf4osgMfkI6dSEX7beYIVqJiuiNO+M9NbvhkGddtfTjOfhsVHlizM2St3G6/d4o3OETUpwL4Z49/cIXKYEU5GiRAoz+v+8SgfBCSS44BF4l5C8Fn0R9OFEUz5e0Xf4eDbwOSyDgTDQQcUIRqDTleVVeDbKrMCnS1WyGS4QRggfN9esxuEroXBKgc7qx9YWelk1aAAj9akSlVliayvxhLDsQ0tgHnGl5zS3c9pW0lKkDLcPAE5T5ODh7wU5Y2wjOLov01LPldc/ozC51JuOs8ysDxk/GABP/2tNxlXoi2eiPcFxvSu9TlllWswah2CbIpXxvM3lBiLHa0FT/L/5OIbckYLMj8umBzZY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(38100700002)(36756003)(86362001)(6506007)(31696002)(6916009)(53546011)(478600001)(316002)(6486002)(26005)(31686004)(6512007)(4744005)(2906002)(54906003)(41300700001)(186003)(8676002)(4326008)(2616005)(66946007)(66556008)(66476007)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkxvdmE5RXkyRGp2dlMxM2NPUk5mbytueUdqMC9XM2R2NFZWRW5Jd1hqTlJZ?=
 =?utf-8?B?cFJPOTdMaHVCZzJ0dEk1SmdxdTJHd1NUeDlDK0pGWW8rSVZoUHFUdnJuUGFo?=
 =?utf-8?B?NjhvY2c0NW9oMElPZ29hZmV6cUFTMTh4cnQyVi9QUEdYVmQza0tJSVZUUTUr?=
 =?utf-8?B?M2xJeXdMeFlSRE9MYnQyKzhvQkpFTk9RM1E1V1pZcjBzR1Vnb2JXb09FVXFY?=
 =?utf-8?B?VVBWSU5YTm1uUHB5QzQ0eWExY3R6NnJHdVdwVThaVFo5NEpSSml6RDFKdi9V?=
 =?utf-8?B?V1FxQ2tBUUd5WFMveEVLUTlxUk04YmhESmZKQ00yY09CTW1lWjl1NlpyNGR0?=
 =?utf-8?B?N0g5ejlyZzhrOXhzYmJKRWt6Tkhua2xZaUp0L2t2UWF6eUxUOTRRK3F0eGMz?=
 =?utf-8?B?UlUySFpDckdCZGxUQTZjN0xpTEZ5UTAva0UrUm5ZbXNIR2Mxa2FPcTVrVElw?=
 =?utf-8?B?Qi9kZCtrWENkMEs3c2svL2h5eHBBWTRzMjJMR3BrNkJQaWx4MHhTQmJKT2Yz?=
 =?utf-8?B?SjJaVEwrT2JJZ1pFc0pmZkhhaTltdDBPajRmTXFJbnRxRFlVTHhvbThyYUZa?=
 =?utf-8?B?QzdwRHRLd0JScFNGKy9TT2NPSkZEZm91S3g3emRnV1psL2ppc0x0MTl3RzBJ?=
 =?utf-8?B?c0ZKUTZLaFZyb3ZLUlIvSk91MzdUR2wvNEFkVEhvUkdDSzNUbHY1RUNvQis5?=
 =?utf-8?B?V2VCMDRXUHkvQU5wRDJWcmovQk9QYnpDWmVFNnNFTDI1V0FxNHFGS3QxTzBy?=
 =?utf-8?B?N21NTjZ5MlFEWUhVanpUYTNtQW52MUZvNUJPR2lrVmt3MTV0RzB0Rkh3eG9L?=
 =?utf-8?B?dlVPVmpDOFBYL3VzbWNRRDN1M3AxQW1mbVR3eUVjam5UUGt0QmRKWi83UHBl?=
 =?utf-8?B?ZmY5MDBqODBDdGU1RHFFV25JZ3ZoajhrNTNELytyeHUvMzNLdEtTbWNQc3FG?=
 =?utf-8?B?MWdhb1ZpTC9VV1pVWDMydElHMVZFSy9JcVNxVTBxK0FybklMWjBjV1M1Y0dB?=
 =?utf-8?B?Y3VXT1dWNFBkNDRQNUpXZXgzeXVxTWM3UlBhUURsLy9XL3BTcVFLWjhvREk5?=
 =?utf-8?B?Rlp4OWtrTy81V3Z2NDVrSjVmcnJoMjdBSXFxSy9NRzBHc2lzUjBYWVhyZ3hC?=
 =?utf-8?B?Q1hHYlc0TlJnTHp2SWRiNnF5NVhlSDR5cHdYelE1cmhyZ05nT1o4bkJKbDEy?=
 =?utf-8?B?MXhETC9vTThHKy85YUhUREVwTGJ1WnBhdDVyVDhDWis2UzRXMjgyT2ZlMWlP?=
 =?utf-8?B?YzJYOXprdHE2SXF0L29PWGd2VE5pTklwOEVUdHBldkZzczJtYVJycEQ1eU1z?=
 =?utf-8?B?YnZsNWRhaEZzLzNaeTNsTGFVVkN4RHA4eHo1ZnlSc1ZQb3RpM1hNdXU1S1BJ?=
 =?utf-8?B?am41bEhvVXJia3RvZG9XSVlZSFdOOUVQeksvcUpBUXZFTHMycUNRZHZMM1Z6?=
 =?utf-8?B?RHFZYjhpRlBvY3YzM2FsaUsxbDBreGV6NFZNdU80bnViM2haQWliYmUwbG13?=
 =?utf-8?B?aG50cTgyeTRIQ3ZDVFZhL3I1VmVId21qa0JIclRkdk1yazM3dzRkNTdpcmNz?=
 =?utf-8?B?b1VCS2FqSUJUZWllK3lBQndzeTlhWTZWTjdiMjZJc0FKQXZ5R05tY3pYT29X?=
 =?utf-8?B?clJxdDRuaFFFdnBzbExkTzNzQ3VsQjhlZXZFaWlUTGVVL3NBOW5YdkZ4Z3dE?=
 =?utf-8?B?dW8zaWdoZTdhSmtISTBKcGVYcEQ5eUlRanhqZ25NdjN3Y0VpMnZlQWNMdm15?=
 =?utf-8?B?SzJlUmtRSVV4TnhqYnRIMWVsYnhDaXFyTDFvck15bDJJeWF5WGVhdjZBZWxP?=
 =?utf-8?B?Y3BMR1RuUml5T3NGak4wanlzZTlkUSs5MHNCR2o5TFpTejZnK1FtbnhkVVJZ?=
 =?utf-8?B?NEhtMFk2aVZrUGhPdlI3c05jZU1HbnM5ZFlrdWZYSUZubmtxWG1tTzZlUW9J?=
 =?utf-8?B?bHByQUt2YXpkZ3c4RXhxcHBCQXdTS2dITm5CUFpEeHJtdE1uOXo4c1EvNnA1?=
 =?utf-8?B?WmZwOGFzeE9tMXptUmE4M3p4aHdieG40bXV3SmJnbUJmdFZzQTdoY2ZzekVD?=
 =?utf-8?B?bnJPYVJDSDNzdUQyRXNlU0pyK1V1d1lPdjZWbmQydG5wTzh4SkJtQm1sYzZj?=
 =?utf-8?Q?kZEgANhxbsX2OCg4KPvQu73HT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab000489-0684-48af-06a9-08dadc29f1ad
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 10:16:33.7139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J1X6gtHmVd61jY1J9vwo8cbDXwDHZmpaq7MSqZGGSO/yU+rxSKnXPR8m/71NeXOnmfztDPb0Waujoz+o4ZUYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9052

On 09.12.2022 22:42, Andrew Cooper wrote:
> We can relocate Xen by reading out of the virtual mapping that we're executing
> on, and write directly into the directmap.  In fact, this removes one
> dependency on Xen being "at 0" (the XEN_IMG_OFFSET passed as src) for
> relocation to occur.
> 
> This removes all the temporary pagetable handling under the covers of
> move_memory(), and results in a forward copy rather than a chunked backwards
> copy (caused by move_memory() always constructing src and dst in a way to
> trigger memmove() to copy backwards).
> 
> With the penultimate caller of move_memory() dropped, clean up the API.  Drop
> the keep boolean, folding in 0 from the final caller, and drop the return
> address which has been unused since c/s 0b76ce20de85 ("x86/setup: don't
> relocate the VGA hole.") in 2007.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



