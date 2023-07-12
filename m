Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CD475054C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:57:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562360.879009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXWY-0003iT-Bm; Wed, 12 Jul 2023 10:56:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562360.879009; Wed, 12 Jul 2023 10:56:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXWY-0003gW-8r; Wed, 12 Jul 2023 10:56:46 +0000
Received: by outflank-mailman (input) for mailman id 562360;
 Wed, 12 Jul 2023 10:56:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJXWW-0003gM-Q2
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:56:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0627.outbound.protection.outlook.com
 [2a01:111:f400:fe02::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8ff6c9b-20a2-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:56:42 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PAXPR04MB8109.eurprd04.prod.outlook.com (2603:10a6:102:1c2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:56:40 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 10:56:40 +0000
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
X-Inumbo-ID: c8ff6c9b-20a2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8KBwe6F6OK6F8Mlz4Reb81UFbIrkkC0+0SBTk2Obwl67dekZKxQrkwf4dCp8c92XNraVvvL5dXMZbzSPQwkhlMX14EGdCiFLoILrjqDyzJzYoOWF/SZXRSJAwxVCEOEF4Salr9TPZCUpQn6A0g3aDMK9eAOId6RAvVKeUewAABXwiOihQsBawYDmFkV/XCwAvPgAJmHhfge5wGYpwVQEPNFEg2fCghQC+4JstJPUu4TR8SDyrlZgVPtoCWSAkqQRwj9RMdgCljGhKxC182g21fLd158yepUQEaq4HT4xstR071EXJHcyG1d4JEHx4tFxhh/y5ImblJMp1bFk0dcxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0xDb9uFAjmFVHfWwROsyqVJ+c+Zi/BVX8RBoz3fGms=;
 b=NWgq+ppHOgWIGtuNhSB55YxZfgKgxoL8S99NoJbWz2FSKC4j6tE9pgZP+EnmRHnfHSKTwr7WTDtsi4cYngiLIOlAbhowr32AY8T5Xil8LwQK3OMSnNm+05OH2dCV++MpMt/WzbIYA8VGu+peYMwIe4ZMxKx/ejIBQjx7Q+5Y9xFtAwWjpIw84TwDzFZchKnTCrGv3Lts71lB3sLFI4A1YBk08oB1H0K1OTYLdc/bYOCE/ZsIcbsOW6SDXQ+HlU+sctOsBr5l6cPjJAi/3tWriPoAiRCDJBMTUvWqRuC3B3EB0Aa7wMPD9MKgBYfBu4fUn2p4lPHHOZzJRq4pOtOo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0xDb9uFAjmFVHfWwROsyqVJ+c+Zi/BVX8RBoz3fGms=;
 b=CYAPox/yD+k9l7vvDPV3afYvhmRxe1+VP4IGi/ZjT3rIZKGpqekzQ3tENOeYgQ8qakpLIZdOALlD1sqzbxRqoOkJmEOAaEyqx1asLvmwPWykiW+M9ymIUj0zut5cHBDM4radmFW7IwpijeFFYy6R56856vNSBwhsoA1au8RRBsciDvHMAq6MQXyngSabds9y6OFqn4W5Q4zJ8mG/Bqd2+EJPz52A3RGEb1uCO2wt22q5lLAQCzir+1WAznkrd+S2+9/xTpX6LaSo4C+/eDrQAQTtoPbew7GtOJBlz/ho6J5p2Xz45rjN7uAtgI3CGJiEGkuvi7cC7cZqj4ULG/9mow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c7b96fb-fe76-0969-c530-fba57c113d35@suse.com>
Date: Wed, 12 Jul 2023 12:56:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3 14/15] ACPI/APEI: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
 <9fa7f3b467b7efbe1c9f80269c4af942fbebea8d.1689152719.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9fa7f3b467b7efbe1c9f80269c4af942fbebea8d.1689152719.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PAXPR04MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: f2afe108-9a4b-41ed-e8e7-08db82c6ac1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wp2Z0HdEyVHQipvdZZwi1BZ8tYOdDz4DPt+gR48oR/7uvSbDU9uC6bi1DEWcUeMF1aeod3s7dnMw6SpdRi6cCi37B/1j873qCL0VNPQ9mV6lWQADQb5oGZK2CdFgsheNfUapaK3gUHp4J5c1qUxG2AdW6BqJhIurDeLZj4WgOSgiDH2hAlodPSU50piRE54HokR/u/3dEBqAccopAIss+pRbHUkm9bVGRrNCmeSrvFYJfB6b9vowVfNzlIv614BqjN/lqHTIZzAgj02tMDmUfMZI1ScOWvt7abGKDnX9DDgFhKLSSXFo2jtaRC/KVMy3BR2+/75iGoGJAj0xRTNe+zNprYcebZn5jp6KxGxrYv82A/LOETjt/J+Vv+ikP/T5dyu3AABGBt7XVag29+RufLayP0H9qNOtr2v000jXDLja90eIEs24jPZuF0RlZJbHexRVkKRYXCPu0vkuMy6MuvCjQr2Atc8eCfqJQef2P6EKooLTfyR8r9buAx5+KhkjRHXgwtgCcigAS/v7LEfOEOJWaVfVo9mnwWQKKPEMe6sYqB4svtziy4FgrnDOfZ1+BzwNiV3m9vgLubIgcUx2Rv8kboPdJx8TOfDzcZhpcvBte2+rOJqv+nNY+kMxAQrHXODcvyWdjxzhwBVAHr+c7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(7416002)(38100700002)(2616005)(4744005)(41300700001)(316002)(2906002)(31686004)(8676002)(8936002)(5660300002)(66476007)(4326008)(6916009)(66556008)(66946007)(6486002)(6512007)(478600001)(36756003)(54906003)(6506007)(31696002)(53546011)(186003)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NzlsQ3Y1U2RwNzNWQmttRmF0RFBCWUNrYWpTcWEvN1pvQ0U4b29DZWJjUzV2?=
 =?utf-8?B?eEpsaCtOTHBxUnBvRkU3MVRIOHJlbGxRZ2xiR21mZXBmaEF6ZkcwUzJjaHlI?=
 =?utf-8?B?Vzh1SkRRRW05ODZIVjA1ak9Xd25pTUhaRUUxY3MyYklJWU9WVHZneldaeWgy?=
 =?utf-8?B?S0JvSWlhOStZeVNCMDE5TjBsVklwVG5mMS9OcXIxdzRIeExhTWVWb2lOa1dG?=
 =?utf-8?B?S1R6Tm9LVWJYVlIzSElhcEpXU05IcWJqcE9ReWVnK0RiR01zaC9rT3llVHdH?=
 =?utf-8?B?cTg5Z0Rnd3ZXR2sveU5rc0NDWDVkYVAxZStzVUlaMzlyTkJ5U2w1aE16T2xu?=
 =?utf-8?B?VmtwZW0yeHlWanl3Y3VycVlhOWJaaUlUSFV0VFJCcmtDNU1hNFpoVHdVZWpP?=
 =?utf-8?B?V2JITlVLM2hKQWZJSVJqOTlTYk1oRmIrMHkzWk85UytGa3dvUnBsMjBSQmV5?=
 =?utf-8?B?ZDBwRUJxNUxEZFZlaUNCV2VDclpVNkREOUtjeGRNRHNQZnVadmVjSGNMVWxJ?=
 =?utf-8?B?cXNDUis3V2d1K00zd1hVUWxPU1lNZGl0T240TmphaEVla2tmR0lzSGhWVUI1?=
 =?utf-8?B?bXZ6dWZzMURKQ1d4bEEzbzhmb0p3d09GTU5XYjIweTJVRmd1SEhCMmo3WC9a?=
 =?utf-8?B?SFBZeUlBN2tPenUwL1QrdnA3MFl1Z1hXRTJOcFNWcUNDMWZ3SUJnWUMyWFRF?=
 =?utf-8?B?OUEzVTE5MHJ2NUhtSWFNNWFGUUpMc0RhcG9lZ3lON1h3OU5FTHZ3OEN6ZjVh?=
 =?utf-8?B?VzFLc2dyS1lGY1pLTFV3eVI4ci84VW54RmFhNHJMZkZQWGJYOFNCZk9Qbk15?=
 =?utf-8?B?akM0NUIyL2lVSkQvblJJNkVBdXpKS1V4bmxCNHlJQjl3eEtmR1d0QW54MkQ3?=
 =?utf-8?B?WHE1Q0FneHE2cWIzQWx6MzVqZ2VLejVWckRYOFdiZDlObkJFWnNuM3IxY2Uv?=
 =?utf-8?B?OVhPdjNCMmhweWFXOG00L1BERHJoV2o2U25BTEJBbDJTUUdZR0VCc2hrSnB6?=
 =?utf-8?B?VlQycjVXSFJmSGtKT1F2dlpGN0R6NS9yTmRFZzFScEJRWTkzbmhudFhlSzBL?=
 =?utf-8?B?SWQyUkpQcytrMHVEblk5bHh3RjVnZXRjQUNLREpERTlVSDRwdmhJbUtNL2Jn?=
 =?utf-8?B?VmwvcFVza0lJKzRVRDRZRWNDK0NnazFzSFBva2pOODVSWXAzMjF4bVE3MVVP?=
 =?utf-8?B?eHp6VU0wRFpzNjh1TzlockxLeUp5WWtKbGorS0NnVUo2aTZSMGZRbDB6aU41?=
 =?utf-8?B?b2dNRWJQTTVldmFpUDQ2VUd4WjdYTW9UYTZCK2E4QlJiRlphbFJpMnU1V1Bi?=
 =?utf-8?B?MThGTHhSRmlDQmpuWWFETGxQR0NNSm9hL1lMQTNrL0xYMlNEZitveXB6SmJk?=
 =?utf-8?B?aTBWQTRnRnpDSVc2N0p4YlNzMzZvR1hhTnhYTm05Z3dadkdkdFVpK2I1Vmxk?=
 =?utf-8?B?WVQ0aHhXMW40UjdTZ2gvd0NDSHFSWFpjY0hnbDNjK0lvV3NTWXg4ZnlZWDJu?=
 =?utf-8?B?RTNPNkFBc0tFY3JseEl6VEQ3WjBpblcvdldPajl4cTFwYmpQaG1YQ2laUmFD?=
 =?utf-8?B?U2E1bW9RcG0wTXdRUDFjL1poYWkyWmlYRUI5SStPUlNIbVo1a0VEMVVEQUJ5?=
 =?utf-8?B?aVY5UFk1SW1VdnROZitDVWgwb0FVYS9UZ0UvMlpZQnNwYk11cXkyc2RqRm9X?=
 =?utf-8?B?Sk14WGhhZ1U5S3VzODlxR1paQyt6Sjkwb3VPS3hyMklHNlBkMjBsbW52ZElz?=
 =?utf-8?B?MjBFbmVhcmh1aW9JWlBrVGw3Yzk4YVViYzZTZjdhUktLY01XSDQrK2Uzb3FW?=
 =?utf-8?B?dlhPeE5QdWZLSWg4SllNdndST29UUDI1MUJLaWt4RTYxeWZEZk9udEp1YlVT?=
 =?utf-8?B?ZDlSa1FkNWFZSXV3ODNIRjdsS095UGFvcUlLUnN3SFJVNC9DME5rVUhHZHJo?=
 =?utf-8?B?a3NoQXo3TUQ1K0tPVjFWRUU4OGtmUTFuTnZiemwwYTFhVWxDVmZ1MkJqR0dm?=
 =?utf-8?B?ZU5Ta2JYZk9TdlFxS25NMm5BYlh3RkRTWVluR1JLVTI1bTBLUHBvd0hWMGU4?=
 =?utf-8?B?T3hKVjQzcUJmWlEyNkVoUkUwREhJOENIeUkyWTFNRkl0ZHB2Z2Mva2J0anp4?=
 =?utf-8?Q?si9XgZzzOCSCn3yaNqsOTfzZx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2afe108-9a4b-41ed-e8e7-08db82c6ac1d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:56:40.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLFfu8IEjmjRCOgmPsa4mMP6yj74Ib8lFaBVxwE+g+82kr1QzFaSvMy9qkLKBjQQxPLCPXpfZ09ch0SIWse+gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8109

On 12.07.2023 12:32, Simone Ballarin wrote:
> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> 
> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline states:
> "A 'u' or 'U' suffix shall be applied to all integer constants
> that are represented in an unsigned type".
> 
> Add the 'U' suffix to integers literals with unsigned type.
> 
> For the sake of uniformity, the following changes are made:
> - add the 'U' suffix to all first macro's arguments in 'cper.h'
> 
> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



