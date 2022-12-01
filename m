Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A7F63EB32
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 09:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450253.707510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f14-0004Nx-Pn; Thu, 01 Dec 2022 08:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450253.707510; Thu, 01 Dec 2022 08:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0f14-0004Lx-Ma; Thu, 01 Dec 2022 08:33:58 +0000
Received: by outflank-mailman (input) for mailman id 450253;
 Thu, 01 Dec 2022 08:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lVjU=37=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p0f12-0004Lr-OP
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 08:33:56 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4363865-7152-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 09:33:55 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9097.eurprd04.prod.outlook.com (2603:10a6:10:2f0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Thu, 1 Dec
 2022 08:33:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 08:33:53 +0000
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
X-Inumbo-ID: e4363865-7152-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdTeV6eLRqBzumJYMzjhJGGmNySKy++UW4zJKV4px1SVnSUd9N5UMKBRJOgZ/fZzXJ0bEliM6mW4bLyxl7/nEID9lbxKKDRAAARLEi0SrmcnW8gWM3FhJfj/bnwoOTD8/9yGekBRitztAiuniINaAzcK6MlJnF6Qg6ybmEOqaNNNvwSHH16rJXxnDDEuLbenDvmezpf9gHsOs9bcwFcyGUqlo/wYxmHKmUGin3oZOwAV2O+Ua72HTGvYidiRPW2QPYX68DRyITbFbtLd9AqetonnuOLX5iuvNvPTyUNd8MiUkoBOTZGQqPBYY1/tBZNFJQO4slJ2LssXvqlDB3p3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeQ8/Wy2RogStjqmjqkyo67HpC4bAaSGIO5p4rpEzd8=;
 b=WTCV6IGCT7cC+7AgqQA9fklQMpCCjJaQE9IpvOZJxIPWCIyHCvvi+mDdlSLWT/ed0NrZY63a3go2RIbY+XuK6CEa3Z35FqbIMgsvxaSegoUu0yf+PasIMi5UWvq//KnMhMs7/ZD42dimWVveQ6Nx1b4yDoI5+SID4roNkcMgkxV+kA6YyIzB/f4hmG6VYJCcF37TtNJ4r0wY5Id0zSeK92UUFGA5F87ST+jijeX396yMJhquRfH2TC3BNqBBum8SSZ5+xxTYvWcoqdgR/+6Aql7NTyA7t5dr3dt6w6BeCwzOHmgstOicYtgf03sWIK9tKiHv4rudfWFWyS8HgrgOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeQ8/Wy2RogStjqmjqkyo67HpC4bAaSGIO5p4rpEzd8=;
 b=xM2iu/lW39TCuE1V87m2vde7POK6vmC3UL9jD0VjeudERxxLwUBGD052hjneHzBZ1xdqh7zkILKqoZr9KXvbzreAq0H9Mdb99K0xUJHi3RIwFNy1LB2QgUWadw7grEgkfCuMY6D/J2QOfjyYSZ1C9fFXGY+CPzRwIkmUz0xRzI20jECBja6L4Fjj8VIE14wYvxzbxAEsIgGdIlfzoljiiLISj0PvSxKFJYQQJSySxK87Swo4aeDtbt54+7Ko6mQ6r+PIA4u/VcUMpqha0bOzoby2XHFfo5jq3VG42nxubAjML6O6ulcTQgzC0kMKromkkCcgPv6JhzeH8fizEp9txw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <471b6470-b0b7-a97d-2114-a1871e237a89@suse.com>
Date: Thu, 1 Dec 2022 09:33:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] xen/scripts: add cppcheck tool to the xen-analysis.py
 script
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <20221128141006.8719-1-luca.fancellu@arm.com>
 <20221128141006.8719-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2211291607280.4039@ubuntu-linux-20-04-desktop>
 <CD8C2F1A-B321-4E3D-907C-E6DBB1A5E2CD@arm.com>
 <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2211301145132.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9097:EE_
X-MS-Office365-Filtering-Correlation-Id: c53bc9b6-fdf6-4d57-1eb5-08dad376c742
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QG5uqIrZFH0ZEJ0ur2byhQkmvUlmVefJ9FUxwg6AJKXlRo53NsHV1VQjRaV9TZ8FewuDvR1M7sz4LhmIIbzuVjYIBGYxOnpsBUdA7sp/E9H7rJEkLrRHYkPxpStNdwWcfq7TERWup/IpsnxsICD5nWa4OA0uzVD4loBg//zIdqVf7c67CoFQJhLgdKZAPPfHjbpnpHDnlgLapNErdJZ/tr+5irRP0tm4cdoUJrBxwDKuxidKKXUhTQBShW0EA1vD8Jb2gxK//4o6EF953RbxwPVmoflgGatX8FjZshmwoE7GywlwyRnu15t3Iqr4ryYn6fNZZpdnzawgqQDKn14pYGVoFkd1v9mSTxbCzdavLSOj1lApLga0p4dd6MzmNT7Zd9NSwkziPNjZU7V2tmEPfbnaYNvgVZH5VsdZLtUl+vLJ/HL2AbaA3d2dElYL/lLhwvFoPEtvQ6SrrwWqUVCmIYHE0gISAD73JLIplo4Fvw9AF/BCcWP3HFathKEXUq9CSB3xar1AubMRlOpbzb8vkTp8zICLoGeB1UDOBAiuF+Z7xBs9UI6yDJRC+Fj+Ulkakyj70ZzvRgw1HZXGMCs+guEoB88R7vNhFVr/dQlKIKB2yjqwjGXZMbB7ChmbcBbqz5sNj8DK3jXeQvp8oxSb90PxpAKD/Xj612itiVUaLiAa9mEesVrvlsyQ8H1no/zyVIg2RvuO/rmKHfkmWydoAQ8wFN0EI2aUKKvog0UlIC4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199015)(4326008)(8676002)(66556008)(66476007)(110136005)(316002)(6486002)(66946007)(2616005)(54906003)(86362001)(31696002)(38100700002)(5660300002)(8936002)(41300700001)(2906002)(186003)(36756003)(6506007)(53546011)(26005)(6666004)(6512007)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEJoNFhPaURabkRzNUUzbjRJeEtXRS9PQkRYa3QySFpnZUlCMmZ4aGhRblFi?=
 =?utf-8?B?cDdiRERZalA3cUxYcjFOeTIxdC9INWczOHZNVkFUb2FUdThyUU5acDc5WE5y?=
 =?utf-8?B?YU14RTUvaWpLS2lFSCtTcytIcDRCaUN1L2hUMzRTOEdnYjlVUldUV0kzZEY1?=
 =?utf-8?B?NWRpUCtKN1BnSmp3M25UQmpWQ3ZCV2xyNWRCcEFZWlBmbThDZ1lpSEQ0Q3pm?=
 =?utf-8?B?K3Z1RFdjWG9yMnI1eGlDZDk1ajFXUlNPWS9FNUUyQ2h6ZVI1UXovZWR0eWtU?=
 =?utf-8?B?RFdvWHZqRWRYditYclFET3R2R0hEQTdQeDZLY0JoazI3UGtQV2VXTVJWYWhm?=
 =?utf-8?B?aUFyZ20vOWcxWG12cnVPZFpQcjNZOXRNTXIrdDk0VFF3SEVtdWxSQ3dMQTM2?=
 =?utf-8?B?VGs0N3RGKzM4ZzZiQ0hlZm1DSTYxVTlUQjcva3YzTjNUWSt3WnNrSTUvb1dB?=
 =?utf-8?B?YkJRWVNQakZCZWE2YzBUUm56UjdBUmxJTnBibGNsSGFDTFFFWHRVREYybmV6?=
 =?utf-8?B?ZkMxaFMwc2VneC9ITFZtbVloTGpqaTN1K09UdU9Pby9SQ083SHFtLzg5Mml2?=
 =?utf-8?B?TUcyeElDMUlad3lwVld2YjN0LzBaeXhkNjNYQTB1UlR3bVpudlZ3dk5CTDdW?=
 =?utf-8?B?VEd1dFE1U1NQS1ZHSWxIMkxpZUxKc2FrMUZZVnl6UlJqOWxFUFdONDEwSTNu?=
 =?utf-8?B?cU5meGJoUEUyakExU1ZObHBhUVBKcjdqU1VkdFdqRXRULyt4bVN3Z2kyR2V5?=
 =?utf-8?B?WTErQ2V6UnBJaHRvR0pjRm5rNmlsR0xFSGpubWYxM1FLL0I1bzNXTWpEOWxS?=
 =?utf-8?B?ZTNoMS93eGhjUzVweXFOOFBkNFVSUlFsY01sRHVMOGlFRmkzUXpTNzA2cHh6?=
 =?utf-8?B?RVdZdHFsa0t2bGZwRk5Fa2xEUzdHWlZhejJkTXhIN0hGMmtNbTFIT0syeVJr?=
 =?utf-8?B?Sys2VFN2bkEwd1drK0l3b3NiSWJOMUNSYWgvbFlSNHJVU2NnQS94bDBlZWNR?=
 =?utf-8?B?Qm9PNmUzc216WGNqbGZrOTc5eDkvVDFNNlNEZEpXUjBLUWQxeVlwUmh5WjNh?=
 =?utf-8?B?ckRndFNxTXNCcWZDTjVKSGRGeVF6UCt4R1BRMDIwcEsveCtKY2JsV2NaWTRn?=
 =?utf-8?B?QTY5MTUwcVdyMkhEOGdhcTBNdENha3RPZ1BrWDZqd1hlZWNEelZuNTlHSy9y?=
 =?utf-8?B?ZnpZK0h4YmI1ZGdReDlLOFBaZjZIYi9wVDF6TGU1N1hQenVKbzNPdzFOWDZ3?=
 =?utf-8?B?WmtadnlvM1IwNHZydXlXRDVJOWJvQnU5cUx3d2d6YTh0UW9CWCt1Z2YyZDVa?=
 =?utf-8?B?Zjg4TXZndmhZcmdGL3pGbmVnRHd2QWFwNFRnMFFDc2hKczBXKzRid0REODZR?=
 =?utf-8?B?alRaSkdJZ1VXNU01WDFrUFVvMkxzaXdiVXBwaW81MmtFckI1azE2OGswcDJW?=
 =?utf-8?B?YWs2SFRKV3krR043NDhjMDBjVUt1U3FNY2szY0Zab0VodUlENFFBTnZNYnox?=
 =?utf-8?B?c1h5dWxmaVFZVDQ0Wm83UWJoZWpIQlE2NEsrQmE4djBoblF6ZmtpaWtmbWgv?=
 =?utf-8?B?dlJRV01LRFV0UXpkMDRJbS9KdC90aC9CREhMSXRjcVFYZVpPVmxwZWJKTW12?=
 =?utf-8?B?NFZSSlZNcTlnT0xFM2ZhMTNGV0VPSXVWOWVUS21RSjRBcGtUbG5zTVhxV3Jy?=
 =?utf-8?B?V1MrMnJBZFhwT3Z4ZHlEYTJOOGFobnZGOWI4eDRDUE55VlRzbjgwcFIrbUVw?=
 =?utf-8?B?L1hiYVF3NE9pTFF1ZGxUVEcvTllySkJGc2VkSmJzYXNuck9sVmNPOCtJTkUr?=
 =?utf-8?B?NlEzeTRNR0NYNm8vcnlTQi9reFVvTCtVajBLdXFZZ3Voc3FsTDRZNXVmM0VV?=
 =?utf-8?B?Vmx1bGlUSnFLWGE3TVRWUk1MYmJxa0lXTm1PV2pjM2ZGOW1JaVRsbFowNGIv?=
 =?utf-8?B?T1dMVFloVjlHS3ZQdW5JN3daUGFpMlRZTThXQUxRSkV5SkdQSGdzY3V0NzBH?=
 =?utf-8?B?ZUttRzR5SWRoL0tacnZRbnlwbWowcjA3VDlFYmR5emhlVHR0YzgyUElSTEpn?=
 =?utf-8?B?NDM0aTAxWTRyN1VaNHB6WkNIcjFFYXl0Z1hUZ0Y3Ym14QXpjMmNTVnZubUM5?=
 =?utf-8?Q?iap2w7BNhqNbHenQQr1Mr8RrA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c53bc9b6-fdf6-4d57-1eb5-08dad376c742
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 08:33:53.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UAymnP4Lljwoy6gBd0CKe10r9f6rJylw2b+acsKJ6lP4Lp9kRD0FHLst5VD2bJ/LsHhJpSDbtWrBj9AOcoJxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9097

On 30.11.2022 21:26, Stefano Stabellini wrote:
> On Wed, 30 Nov 2022, Luca Fancellu wrote:
>>> I think the revert of the cppcheck integration in xen/Makefile and
>>> xen/tools/merge_cppcheck_reports.py could be a separate patch. There is
>>> no need to make sure cppcheck support in the xen Makefile is
>>> "bisectable". That patch could have my acked-by already.
>>
>> Ok I will split these changes in a following patch
>>
>>>
>>> Also the document changes introduced in this patch have my reviewed-by:
>>> - docs/misra/cppcheck.txt
>>> - docs/misra/documenting-violations.rst
>>> - docs/misra/false-positive-cppcheck.json
>>> - docs/misra/xen-static-analysis.rst
>>
>> Thank you, should I put those files in a separate patch with your rev-by before
>> this patch or this is just a comment for you to remember which file you already
>> reviewed?
> 
> If Jan and the other reviewers are OK, I think you could split them out
> in a separate patch and add my reviewed-by. If Jan prefers to keep it
> all together in one patch, then I wrote it down so that I remember what
> I have already acked :-)

Docs changes being split off and going in first is okay as long as what
is being documented is present behavior. If other changes are needed to
make (parts of) new documentation actually correct, then it should imo
go together. If new documentation describes future behavior (e.g.
design docs), then of course it's fine as well to go in early, as then
there simply is no code anywhere which this would (temporarily) not
describe correctly.

Jan

