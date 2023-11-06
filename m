Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E827E2116
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 13:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627955.978898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyWJ-00014C-4z; Mon, 06 Nov 2023 12:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627955.978898; Mon, 06 Nov 2023 12:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyWJ-00012V-0z; Mon, 06 Nov 2023 12:15:55 +0000
Received: by outflank-mailman (input) for mailman id 627955;
 Mon, 06 Nov 2023 12:15:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fhP7=GT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qzyWH-000111-ES
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 12:15:53 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20617.outbound.protection.outlook.com
 [2a01:111:f400:fe13::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a24b4e1-7c9e-11ee-98da-6d05b1d4d9a1;
 Mon, 06 Nov 2023 13:15:51 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB10008.eurprd04.prod.outlook.com (2603:10a6:102:38b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.15; Mon, 6 Nov
 2023 12:15:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.016; Mon, 6 Nov 2023
 12:15:49 +0000
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
X-Inumbo-ID: 3a24b4e1-7c9e-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVskM7jerw/Rw780/Ez1wL93bVLo0UGcBJaPozg4OhQNmtrgQK5iTKXZlHGz4vuXVHxuV8i2G8e0tOz5f5R7tpAAaxazelFqjaaencciktuqnErhYYj9DwBf36oa+2HZYpxIc+lguM45h0kpDlEebbxK0lDW6EFrxGPy6EYg2mN5/zu17zgPItJZizOHOYzsdft568fxYlLMErT5tVziuC/gQqoAmAaby0w52/LfAU8LRAnRtUaFtdopfKNMnE/KBzMBCEOuL0FsqdVMapPnCZxX+jHq/cOORlFfx2c+PQjEHC81fsw3SyHVs7yHZ7bHJcsz/9nK3ugAZAjx006dUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+59P6gpqLr73SFZMAkxna4luEGQIliLF55Brt89zOlE=;
 b=VTOauYk/tCr9wyimOktpoBvyXKXi2zG+KgBVXjBeCsWAwKjOXPpwdXEznVe47IRJhyDZhtmUV6f5sq1fUmUElrjaq1qnTwp2qi5293IOtt3QouyMLTMsE7J1ym3yVnuyL3UgcErTcnq0uGbs5dCCI6Yu9jTImpxRYx0BAvydZrdPP3ELF9YWTPFEnyxMTppInHlNR1Tx4jwzo/Rh/QtKzpTGdfJuF/iOoy/LQrLA6ua72g9iTOylG49lQJuuH8ulD0F9vhu95Z7estJG6XAhD+3uCbJCBDL5n/Q2MKbeZTP4jYkeRdhq0wdTpmF2kbZ5XJeTMkpUTObxKiMbxEQv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+59P6gpqLr73SFZMAkxna4luEGQIliLF55Brt89zOlE=;
 b=4xstlmYs19yG/6Zz2uOF6mGgwT1cCCXsG0AzltmYNdDZ5NoFOlexTknzZDn/oVMoNiA90NRhA38rH494Y7N5v4ZssqKBEJR5zJICZ+Qgi6XJ68ORI0o9s1JwXMgh+VVTr9+rbB3P70ipRXlzfC8v4EY4dFjS+zY2ymQxgdDxtvvb4LAK8lHesLGgX8aIGENLFsnPDZwOqCV8D+ijLtv9ZdsVMI/wSux9W138K+HiK8rvbufIcwOIlgdX403RenvkPSac47cn8xMNVk9BuhAcAUyoCaYabJBGRmWdwQxxw31Wi7S66+Km66XmOoTWSTZObClleVQ18/GVAs/DyQViJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <56d0960d-eb29-194f-bae6-b98cc9652f02@suse.com>
Date: Mon, 6 Nov 2023 13:15:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
 <20231103194551.64448-3-jandryuk@gmail.com>
 <CA+zSX=YUkiwkNV_p1SsAYbyd2q76VfwWqi_mBoCwaVpca-GfXQ@mail.gmail.com>
 <CA+zSX=ZkswegH0n0k25-0nKXonGiLei-bA2TS=rqXWpNtOVtHw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CA+zSX=ZkswegH0n0k25-0nKXonGiLei-bA2TS=rqXWpNtOVtHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0443.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB10008:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f689f5-5854-469e-edaf-08dbdec21d23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUAbVqI7EzDMZOyImmax31+QjKvxlER73EEkGPjgzPgD8XGNxV+EI7M5KvhMiXwDj5tTqIrT3kXz9XLaPqme69g2RYZITS8JjbjiytPNI+kRHI25TQz0b2U+jimmhbUkPu5lD05McWPkjDweWxLRikbbMgVZpBNO4BRHfCcBxXWihQ8ERODFj0p0t9qcclgOqTYXzTp/xh2DY7SiOvLR1yWGzX112+Xp/x+XBYYJOkl8AuRMJRsH/ZJFS3BTrlPWFMULEm90jxyaKMjoVA5JWn4d0IjM9+X4mnQS/osu1fdVLeVvFUGyEaSDrflW+vdEN+LVbC0kIhSfP6gBF4ANVgABK2S3FfntXXUV4It4T0en85eCX+odz8h2ySiJUes5BubXGzNKvjkCLMrwMEb2xsnPsb2OP7/3KQKwgCrezLFte+a5U4FHH3Cox1hxoCWdJyWsHsX+WCa3FidWFf3NuYctVZCOxmWa3bI2wmpyL40HhJzEpv6XbHZy/1bJLNBOsmj1XRv2rX24N3Jz5d19encarKVwdF5ukxVrEZ4kNmm3o6QB4c02ICRK7/J7Hhl/7MW6PU/kzj6EPSX2d3JJzhsycEFBvAWUMANym7Bb5vWhLprAIt/Mi6E++ak0ZfmrefDHhg2IONT08nRgAUcSaA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(39860400002)(136003)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(31686004)(66946007)(478600001)(6506007)(53546011)(6666004)(41300700001)(26005)(36756003)(38100700002)(6512007)(66476007)(2906002)(2616005)(4744005)(6486002)(83380400001)(31696002)(86362001)(4326008)(66556008)(54906003)(316002)(8676002)(6916009)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2Eranptdlk3NE9YUW44WVNRK25TMVlkNXNmUldKWWhHTkdwQVptVnNaNzdI?=
 =?utf-8?B?UkY1ZVNOQzNvM2tBSVJnYlQrKzlNRFJFbTg5RGV4bG50OWUzMDBDWEtyTlNB?=
 =?utf-8?B?Q2RUazVDK0lxTDNKaDJnQjNVcHVmYlhpcmRpTGM2aDg0bFI3ZENpbVMrS0Fx?=
 =?utf-8?B?TDYwV25uTGowY004bk9TUEdWVTI0M3JqYjllcFhvQVE3SWpmMU9UWUtqdVhr?=
 =?utf-8?B?YlA2Z0VTb05iSExZU3ZodlJnOEVXN2hWSWVDUlduVEZKTThBNDVSV1dUVisr?=
 =?utf-8?B?b3dSNU1tK0M1dkwrWTJHR1NmSHdhT3ArL0IwSTR3YmptbllSMjdsakw1YldP?=
 =?utf-8?B?cS8yc2tsZFRGSEMxeStvS1dkVGhEMGZUMElrM1hmMVZuM3pURS9lcUFab3d5?=
 =?utf-8?B?SUZieGhFbXc0MXBud2EzNWJRN0VGUkVIRkQwUHA4V1FRNWdid3dpRVZnOVc1?=
 =?utf-8?B?TW04bGlXV2NHT1U2TUhtRnhQakVMVXVlWFBpMmdseGFBVnZtY2YrWE80S3Ns?=
 =?utf-8?B?NDZpWCt3b2ZISU90SWpPcnlrQ2FjcjFjUWFkeDEvcElyc2lGVTBEdU5DNUR2?=
 =?utf-8?B?STZ2RVYzOFczdW4vTUF2TTJqRmc3dm50djBZb0FhY0ZSdkhpZzh5bTAwWTRy?=
 =?utf-8?B?eDFuNzk0SnNoV0tyWkg0b0ZUK2hKNDJWSlIxd2NhQ0JhbDZCbkZQSENNeVlK?=
 =?utf-8?B?MldTTXFRVStHRWlUK1BLRlpUVy9ZVXVoTXBKeTQ3TUJCZFBLR2xUOVk5Z2Yy?=
 =?utf-8?B?cXZvZzUxZVVXcEQyR1ZHbVJUdWtJK3ZqQVFhd3YvMWwwMFduQUN3NXVCQ1BK?=
 =?utf-8?B?VklRQkxNQ1pEclFiYUd6cmo4MUpYNFg5czlZZ1drNHA5UHl6OWtwSU5BaWZU?=
 =?utf-8?B?b1ZObHFnWU82QUpuZkppZUxydnRiSER4ZlQyNjZleGkvUitiK0k1RWk2ZVFp?=
 =?utf-8?B?WWVMeHRPOUV0NDgrU2tJc0xGNXdhckJzZExXWS9QTTYzNURkVjVoUG55b2p2?=
 =?utf-8?B?SllIN0FwN0k1VnltclA3ZUM4bHJ4RWROaUk3eXFtUE96UVlQVisxSVVUWWVP?=
 =?utf-8?B?VUp5WXV6NmV4STNWQ0syQVZyVFc0WlluazNNZkJsZllqdytObWx0Rlk4blov?=
 =?utf-8?B?em0yWHUycnA1NlZMRXhrS3NvTFlMckR6VGhoRFNQMEFVV1dITEw4aU9kK3ZN?=
 =?utf-8?B?UTEzK1hjZWZlbVAvdnpZZmhXcFJudDlydVBMWHpqMGdDU1ZQZHZtb2xoeGJY?=
 =?utf-8?B?VnlTelJTTEhHOTRRSytDdTgzTEpnazFUSkVjcjJ2S0FwMWQvaFpSalBMcVU5?=
 =?utf-8?B?MG5iRDJUYUFpWEhrMTZrL1BGSjJIMFNJTHV0OHJFeHFVZzg5ZXRIUlZFL0Fr?=
 =?utf-8?B?NXduV0N6c0EyMUxzZGhZSU55WGhVb3pyY3VEdDhxcjg0TmlodFhia1YrZTJ3?=
 =?utf-8?B?YU9EdXBTcGcyeklUQkpGMjEzVjQ0YnRCZThwTGJIcTh0dXpPbDFlNkFPZmlW?=
 =?utf-8?B?UkZoYzhudzJudTdqekQwR2pRRnlwYlpRNTVJVHFKOTFWSTVmVTlkcWlwT1Z6?=
 =?utf-8?B?cUlkcHZVYWRhL2ZDdlFIQW5rUWVnbFRLVVFSaDBTNlRUc2hGNTBCckNwWTJz?=
 =?utf-8?B?TCtxUGRFRGlqSW81TVAxUUxkUy9JT1RkWXA3T0NDcmxjbVNzamtQUWYySW10?=
 =?utf-8?B?cDh6MzhZK1pZZFhYWVgwUGhCZElDNTNBRFJtQjVwNnhDTHpsLzc1K21OYUps?=
 =?utf-8?B?YW9lZWFaMnBPUzFkYWx4YWJCbFc4TVRBcXdjTVVBcFlFUnZJZldvVEJFeWwr?=
 =?utf-8?B?RWhlb09tZlJNMWIvMm5wbDdMcnNHblNZYTFjai9USHhnUjhuNTNkclZKQ3VX?=
 =?utf-8?B?K3pZNDk0Y0lmRVJkZEVLVmhGazN2U1VGQUtsVE9YdStJL0xObmJPYWgvc2FU?=
 =?utf-8?B?NzBoNVlVVXhxWnhyQ2VvbkYzNG9haTRHTWgvVmNBRXRpU0pBUnBWeHVya0lt?=
 =?utf-8?B?RFA0YnpvT0JpNlhzKzFTeEdoaVQwK093dHNMZ0NPZlEyYzVXVHduSFFDZHVx?=
 =?utf-8?B?UWJMbGtoQ2REUW45YW1IQWp3TTdnU0d5V1NXUENEQWR0UTNqRElxbUFYdlFP?=
 =?utf-8?Q?ZVmDsAGIBlzDpfyedfx/RDwJS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f689f5-5854-469e-edaf-08dbdec21d23
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 12:15:49.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXU4pa0KpxsrIQVyULL93YX5NhRI0g0oLGXl9aCzFwm3AhUrYox8c1c5AFgXQxIm34x3PRAKwXsyF7yxB2nmQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10008

On 06.11.2023 12:53, George Dunlap wrote:
> On Mon, Nov 6, 2023 at 11:41 AM George Dunlap <george.dunlap@cloud.com> wrote:
>>
>> On Fri, Nov 3, 2023 at 7:46 PM Jason Andryuk <jandryuk@gmail.com> wrote:
>>>
>>> The new bootloader_restrict and bootloader_user fields in the libxl idl
>>> change the bindings.  Update them.
>>>
>>> Fixes: 1f762642d2ca ("libxl: add support for running bootloader in restricted mode")
>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>
>> Acked-by: George Dunlap <george.dunlap@cloud.com>
> 
> Also, as Jason pointed out in the cover letter, we probably want to
> backport this patch; I'm not sure exactly who's in charge of that for
> tools.

I'll try to remember to pick this up once it has been committed.

Jan

