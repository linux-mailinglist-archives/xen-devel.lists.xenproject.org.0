Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0336428E6
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 14:01:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453591.711170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2B5Z-00006I-HJ; Mon, 05 Dec 2022 13:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453591.711170; Mon, 05 Dec 2022 13:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2B5Z-0008V0-E8; Mon, 05 Dec 2022 13:00:53 +0000
Received: by outflank-mailman (input) for mailman id 453591;
 Mon, 05 Dec 2022 13:00:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2B5Y-0008Uu-1z
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 13:00:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d76a6a70-749c-11ed-91b6-6bf2151ebd3b;
 Mon, 05 Dec 2022 14:00:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 5 Dec
 2022 13:00:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 13:00:47 +0000
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
X-Inumbo-ID: d76a6a70-749c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUqLYdqCtiCJppvjjNdvxS9EqY6bfoKDttLnrhkSK2c3A2UBabEG83ZEOmLxPQFg36w+TdmpJeTkYOx/N0KIaPKY/AZVUfyss1yQivK1/2S5triAp2EhYV03doMxa1jqdR2sIS6lR9f2+YexSHonv4pTEtJbsLa9eNGHUEmoTkBDTznYGOkIThOd2v+gz1Bif/sV2k0PruKmt3VL6Rghvae5QkC8q0m1bXkKTsIbB3F+fgHlMXUGDw9jz/NBjmtXPYcUECs9pPM1dIRymjJl5sSe3t5FK1UzJLffUHDry3KfCpfAxDG/Zsm0o3aE4ZIOD78c9AAeZtWyL1CHNlQZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WD601j0h9c8FpBj4o2zuup7BecZ07U/aFRWUX4aVJ88=;
 b=PF4sun4E/9tMS58q52Z/SUAb6WPoW0W+fSszloJzfDKPHKnuU0v8F0XCqnqgMcWMY6hu63ods+LjKqiXDa1QAlygnmE7SZcxsLohh/C787dvZG+sUfZrl6MeW7rcX4K1NzhpmaQ6OVtlUHQ241+50Nl0jz1lWfMRJJrTEgX+dd0nRcp93dp0sffrH2Y9g2Owdf2a8STHSkX3JUKxYRZ1+Swqm0sGzr4x7NbSdBOYLpmRWcFszFhTmDrvlyxa0wne02qB0zl03ovzArPcPbkmS3BFZJDfCNy+UtABuGDvoJDAO641gxRsFgaH/7rVeRsb2Ujf2V5nRB/3un1ulfuyNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WD601j0h9c8FpBj4o2zuup7BecZ07U/aFRWUX4aVJ88=;
 b=SEcATz6ruZEF9vWIY5/0cVW5WVg2NLfQHbqJ3meVGsfZ5/jKmtPmXqtLe6QvgquJT9yKxScFUe+/phO9aDaGVP6FNyE8aEuvn7uhf/ArRzL174v+mr3YRGFlA85MuhYSz5TcMgd2swaBrF5WP/txxRf2po7ItRW1Toz93+WyegLIQ17tTEcv6//GjldE3uhcJyecaXlXMKa3fpUMYByMxcyKurM1jU2QLV7A2Tt7dN7RWF/gMzcIgID98Ra1pPx0z9eOPOt6L+5fouGieam3204hW27db4iPPtaHP8MP2FHyVqS3GpTaTJcwv1f+gQHL0g4EdEbDyVRRBykXt11OFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0c5cdda7-e305-a40a-cfc1-f6805afc9147@suse.com>
Date: Mon, 5 Dec 2022 14:00:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/5] x86/platform: introduce hypercall to get initial
 video console settings
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221123154525.63068-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ff4f31a-e9d2-4f5c-da7d-08dad6c0ba44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZfuM8iAvDyc/FyQEXfIwZsVX1E7ZYn5ZmehLLfr2OD7JouSJh6tiKbAPgkvw5hSm6nQDv2UiU+i4MeGaw2/8Lp5fkh1E5C3dJvDcB4dD64xbFUcZZcUNahVMAXbQlSDBB82B1Px9nVLa//ApFbEDkJQZWMA2E9wysG0ItuqrIIG7bqFgkuXCfjSpNIPocKhfg3NxsMfbt/Oy9Zra/167j9x6NIk6xcEWAIePwCqN/e+sBeggdKDcXYbTnAOynlFGWLYGPdoZwBE9puZD5cJ1Qo3G8WlZA8dH12mmSG+TX7+Kc0rxQMaXoK06sklXnLtjRdkmU9UYymNLGV6ZKVul0CNNp69qiKo8rfZKTIa1OjKdEh/o2ZP5ot9sXunGbBBcemFNihLvMR4TGdbhkG25ZM1wbh9nobW2oiqzgrkvHZ7rAZShfD3MM+coMnBpj4V96C7sI8tRIvXedZDzl1XS6G/7+Fcmk5EPHVVqPnizsSSueskGgYOum6AfjggWAsWAbLDLZu39zjP16aWINNqTA8tYkV8Ab1u38FDF3+PZ/vGd2xH1mSLI4uTiJmThkHL2aUP0FfgP5ZsMzzxwZj1Y0uXG3c1tZ/yg/hprf442F8S3hxWiJfw+MmY+rpGfgIgI8XmU0MZmJOH2qpGgt91DAQTzfQYHt+SSLEFPLIN4b8Eni97UWc3DHjVYX2duZ3hXD6cfi96J+fbPliYFZ78zJERj1THkMNyWjSnsBFw+rak=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(83380400001)(186003)(6512007)(26005)(41300700001)(8936002)(38100700002)(2616005)(5660300002)(54906003)(36756003)(6506007)(6916009)(6486002)(4326008)(4744005)(2906002)(53546011)(478600001)(316002)(31686004)(31696002)(86362001)(66946007)(66476007)(66556008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cnI2Q0ZwODdhNmJwemo5Yi9CZnBRVlpXQTY3YmhjWEE3bDg3MGVUekFINWN1?=
 =?utf-8?B?Mkg4NjUvWkYveGhYK05INmZLTkNET3ptSWlLenVpNVBxVHZQdWdXSXVqVFJk?=
 =?utf-8?B?YlhscVJiSEhRaSsvTTkwVzNUUzdvM0NZTmltc3l4WEtGZEM5SkJwWEVzN25R?=
 =?utf-8?B?c3RveThKbW5FOXdKbTJwZmtpbnNqbjFNbmU1aDJHOFFUWEl5TXhEN1NoQW0r?=
 =?utf-8?B?TXVpVmExN0xvR2Uzdmg2T1BnMVVnYWp2dWJXK1k4WkpLUnZ2Q0YybHljWWEy?=
 =?utf-8?B?ckFhWWJTR0VpU24rYzZvQ3lLTmlqMUovbUJKVzZHOVl1V28xQit2Qk44Vnlu?=
 =?utf-8?B?MGJTMGlLSnd1YUV0Qk9PMlJUeS9xejc5VUFhRm5YNHR3Ymw2YmJHM1lkMHFs?=
 =?utf-8?B?aE9UZnRYWGtvK2JmejlRSUtCRW01S09VbVc2VFNQckJ4ZWxPcnlTckNKZWda?=
 =?utf-8?B?bU5jUkwwcEIwMjhtc29GVEZDZnlOMkoxNThneHBreEdkWnJ2Nm5ieG00N3FI?=
 =?utf-8?B?TnJKdnVoWDI4cDB0ZFA0Y1RLK0h4UFdjak5pYmVKUXVsRVhqaDJvbFp0bFh2?=
 =?utf-8?B?WFp0VFN1SWVQdCtEVWF0Z29ZeU9SWjdFQUg1MFlGdWdDa25rTU1jUFRPcU85?=
 =?utf-8?B?UTMzVnk4ekdaMzYxZjBvVU5yTkdXY0RxWFpoRHhxbWFqcEtoaTk2elFGWW0x?=
 =?utf-8?B?cU4zSWN1Z3ErbGJhOHMwWElEMC9HZ3RsbW03U3RVU2F6cnZtckZaS3F3Mzdu?=
 =?utf-8?B?SjUvdmNWcXZoUWlhaUx4aERCN003aStBdzhCK1drRStWOXJuSUVabXBvRkxW?=
 =?utf-8?B?eTAzelU4aHZ5NHJ5N0paTGljWUtJbWVKZXhSVGVPTU1xN3B6eUtxWUNibzR0?=
 =?utf-8?B?ejAwK0lnSTlMSnd0dUFIMTluMm83WmZvR1psSUpQamhocERPOHM0M3Z1ZDV1?=
 =?utf-8?B?bk1NNGMxVVJDazU1d2VmQmxJNlYrUERqTkUvaFpCR2Q2V1h5ZURZaEdYd2ow?=
 =?utf-8?B?c1MvaUhINm1MQk02Qy9yQklOREhjWFVoVWJDSnhjeW8vellkamJWZlFCSFN1?=
 =?utf-8?B?UFJXZGhYMElhb0xOZi9ZTjJZQm1rV29FT2VaZXNuaER1VndmRjRGN1dJWitp?=
 =?utf-8?B?SmNOOWYzeWtXRjhKaE1SUUhVZ3JMOGt6WTJsTnpWMHAzWDh5WDREYnJqaHFV?=
 =?utf-8?B?S2NCNlRIMG44UnRRNWZrTk53dnl0M2tnaiswZlI2eUJ6VDRsQnE1TDVway9r?=
 =?utf-8?B?N0ZHZHJiZm02SlVDcGFBckhkMnREQlU0d3o0VjU1cEwxZjR2ZVlzc3RsbTdm?=
 =?utf-8?B?RFFjNnNkRVhOUTJNYndpR1J3amtkRHNaVFVLQ2ZqQ3ZrVHRlQ1BvWjNoZW52?=
 =?utf-8?B?OUNwVTJnOWdNNWlyYUFSVlJhQUk0Ulo4bGRGa2ViQmlMRElveXVwU3pGSGhk?=
 =?utf-8?B?dGVEdWlpRXFMVWxHL3Q4VXZVdnQ3QWE5YU50WTU3TE5hMU1YUUF1Rncxc01z?=
 =?utf-8?B?MzhJb1hWaTNLZUMvdUtubnYrYlY5L1VwNStPUFhHa2trWW9SUUZlQVJwUVdJ?=
 =?utf-8?B?OEM3blBHdEhrQ1NGTUUycmR2aTdvdDVRN1dLK05yTjVkelBnRVdNcEt4NDZ5?=
 =?utf-8?B?VTgwU2hhcFA1VnFPMHJjSjZvM2ZGNjRwdkVWOUJwQlV5dVVCUDFhbm13QWNK?=
 =?utf-8?B?U0JXMTVuYmZ6RytpNFpjM2hFUnFMYnhwZ29ieDNaVlVPWGRjZngzT1Bic2Q0?=
 =?utf-8?B?NmYyNzB3S1pWV1h2OUtVM0pSMnMvTC85aG1ZRmpRK3QrcE1nc01qZVlLZzJy?=
 =?utf-8?B?a3QrQWdQeHVHeURoVlFEMHNIQWFyQTJQSjQ2V3hVMEd2ZnZETkRWRHZXam0v?=
 =?utf-8?B?UDdSSndKL1d6a1pMZFJ5bkw2eUZDSkM5NERkVlYwamxMbnI2OEp0V0JxRE5t?=
 =?utf-8?B?VEpiaDYxTVdXaTRGYmx3Q1hiMDlCdGJRSmFiU1ozaG9Db0UvK3BFUytGZURp?=
 =?utf-8?B?Rk1KU0NxZUhTK25PQksxLzZvWlJZYnltSkhWclBabkpiMGs5T3NUdG5IckZt?=
 =?utf-8?B?a1FRb1VZMERJeDluMlZ3NExGTTV1eEIvQ1ViUk0zRVU1YUlKaktKWndzN0dV?=
 =?utf-8?Q?BBc4jdg73RLf+JhgkP+P1jj5Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ff4f31a-e9d2-4f5c-da7d-08dad6c0ba44
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 13:00:47.5204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H64MbTLfsnKnncjfpf23xUqeQfBT2U7EGjB6xsezsEq5DtbxSlyQibEb0PApoVeO7PbYR1rjRiHEtrDaWvQCqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298

On 23.11.2022 16:45, Roger Pau Monne wrote:
> This is required so PVH dom0 can get the initial video console state
> as handled by Xen.  PV dom0 will get this as part of the start_info,
> but it doesn't seem necessary to place such information in the
> HVM start info.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm okay with this as is, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>
but ...

>  xen/arch/x86/platform_hypercall.c | 11 +++++++++++
>  xen/drivers/video/vga.c           |  2 +-
>  xen/include/public/platform.h     |  6 ++++++
>  3 files changed, 18 insertions(+), 1 deletion(-)

... wasn't the goal for Arm to have the same interface?

Jan

