Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02829619227
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 08:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437357.691679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrOB-0007gz-Vj; Fri, 04 Nov 2022 07:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437357.691679; Fri, 04 Nov 2022 07:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqrOB-0007eC-SU; Fri, 04 Nov 2022 07:45:19 +0000
Received: by outflank-mailman (input) for mailman id 437357;
 Fri, 04 Nov 2022 07:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wJf7=3E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqrOA-0007e6-4q
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 07:45:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fa3513d-5c14-11ed-8fd0-01056ac49cbb;
 Fri, 04 Nov 2022 08:45:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 4 Nov
 2022 07:45:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 07:45:14 +0000
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
X-Inumbo-ID: 9fa3513d-5c14-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwsEoRcxPDPIoP4v68lEtcYTRPsKVhSz8H6VPJHTxfojBNcYPTkGifh/Ldu/wCFMWYeQdVtdgLJUxt8c4xMHn5gKfMvIySs+i8PALr+5821DiQLn0qpEH5jcvvYwGJkCyMfystmCDppGdWIejAtITr5KpLdXeyTJDTqhjDFh2AiZsPO53DedgTJFQ9Mbs8Nit/wqv+moiNDH0IaQvTmo9MRALpfOw+gj3La4W1jkebtzQ43a66j2vk60+x0V13bFzib4Eoa0XPRI73vGk62Ls7CDyTcBbU7E0DpU2ufGBcApjfm7Vn5y4TmswZPcgOfOHif4g0eRafGoy5HATQDjEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFe8VA6JYs8yWUXGFwAQdEhirvPHmkE2JympZj9mJb0=;
 b=lH11faPCjbKupEoPNu9LQIjAdWe3E5qfGaUOGIazacIiz+ffwwI+3pVQkNiBmbl+WtskGHyom6HybXKW/czuOqBS5Fhf8UH02MUKbUCJTk1PDQFIuCTO7Bs4L4ZL4W39cJx4j2o0aSGLlSfuyT7YRyBX53HBVqvDPoIcxSiCTXXBokuEziQHLtg9xp4cdEA3aTpPX0N68WWziw51pN8KL2I39krBF/W2sDWY9OO3c2W9p9t0ZWVz3lUyVK+EyPf2ynxfQEbswxArFJQHjJEBy9EUrH2OsAf0AOyAUM3GpgU+ji1nY/q8+R/KMmAgXUVf0NWTcSgA37N0A/pW74qt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFe8VA6JYs8yWUXGFwAQdEhirvPHmkE2JympZj9mJb0=;
 b=zI9VGe1Hxk6IfcaebEeHJV3r6Tr2fGNNEZa4WQYbR7kZzZia++zmPzvOup70ZgcaMHbmPy3EDPSUMLAQ3J+A2eXLcmGmsXrF4xqAkCHr9+8FCLiC/0sM5QMpTHuaeo7FQomSRM3pJ2/9+KZPe3dHzoJNrDi+wdTKIslRNdHmpPL2C6F9ND/4sfBRQYPyK2yYLg5tIWPC6leG2xlVnTz+ZHuPvFVc8K6W9qJtq46oBda17oHl4st2CsyJnP1cIbxsejSQSQBoJ3ML6zZ4Ain8lw8Jq3hcxeASqXMGj5clH4qvLYiRrQANYnNwuCyhhdNjcQ/7yaq+vaN2av++s7cnQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76e4e06e-7c48-57c5-f73b-5f59167a0e4d@suse.com>
Date: Fri, 4 Nov 2022 08:45:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Need updates on some release blockers
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Juergen Gross <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Julien Grall <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <AS8PR08MB7991C675A83D83C5172B0736923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991C675A83D83C5172B0736923B9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9485:EE_
X-MS-Office365-Filtering-Correlation-Id: 71172e87-b8e7-426a-e83d-08dabe3882be
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fqZwNPLWiJV4kBLHH8HFTiF36fQc8e9X73RyngIT+VEX3PuKai6ttxjVaj6k5IRYGC1CWXjrgM27i0b4gdQtsByPhughvSsSYkoNa1HhY4iEGYvFVrX6GD7j+5UA+EcKoEiEFhJaJYhxIe3g7bCeN2of+1VbYEI0c38lGvLs6Pv2fL0v76u3ehrE7N0pUdDiWe1iHwlkQ4gA4zIDKzyW2mNJFK9LtQ6DXWHZ4715D/Fhn+ej9U74Y3HqtnaQnMw3YyMz3nnrurEOTS393SNo+o12lM7s9ZH+jw98ozmlb0SNa8oukQAZbXaUpoe+d0lLjXLGRsu+hJq/v5fFDuOVs5yfV0Uv2BvsBlY2T49ynfatRB+0FMWmN4x5bi3AjYg2Eyd99ngAUzESpWEC1oZDrylBnz4Y8vcLaD0dVfOreoToVUOke2QfuQjQFPFuEi8FycShbHo/TmHX5lU1jxADQ49A4Ahers3pSU0O4H8lTu2/2Y0nP43NGLma/Isnl72U8ZUbFk1aD7gb9fBxauD0qgzVqK64xZ2GbSSCq5H/2X3P8Obp7MUXl94HmrkmwXqvggKdabn8uZr03jq4v1WJclm1fbm1INTbOZUh9QzolaB2A6GRqMjEScNpmM2lBcSXHn/cgHTIQCaLGpqfwbDexKtQqATDMEMJrBVNvPlq4ujlY1keW2WvibmX3p8Yuy0zH26H9qg1x0nAUCYkE1peUsH9iSumvLh2FL52j2KY2zyu8yZjG/71ejUEoHoqFAHKIuC50FlR+v2kqU9ANPSuJln0ZUB2HVtdv6zUySwTN7c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199015)(38100700002)(478600001)(2906002)(8936002)(6486002)(41300700001)(31696002)(86362001)(6506007)(53546011)(6512007)(26005)(2616005)(5660300002)(4744005)(54906003)(6916009)(316002)(8676002)(186003)(66556008)(66476007)(36756003)(66946007)(4326008)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDRQUUl0Wk5sNUZJVUVXU29JRURuYU5hamhkbFdoS1JTQ2M3UUNWQWhPaGZF?=
 =?utf-8?B?ZUFGM2VqVDMxQnpCRFV2ckUrWEd4R1NuRy9VUDRQWmdTUHlOTlZ6dFlpWmtQ?=
 =?utf-8?B?Q2NyRWpmM1Q0OXppUzRBcVZqbTlTbnhTQTNaRmdNRm5sQTNwYXBVRHcxSDRO?=
 =?utf-8?B?UWlab0JKTWhtOE9LNXhjNTduT3FRUVYyRlMyY0ViRFVRdGp1OFI2M1pFcFBU?=
 =?utf-8?B?ZkpObDd3QnFiQUtpSEVrNkpVb255bUw4bUp3dWNkQTUrTVVQS2dFdGNUa29N?=
 =?utf-8?B?NUh6dHgzWXVHckFMaUREMXJNNXFkdlR5VUtSQi9BMVh2MHJ5YVFRWVgrRXEw?=
 =?utf-8?B?eFk0dVdyVkpWZGVsVlN4OG5rUzNpNUF4QnNxcW5oZmNvdTZ0L1hyOFlOOFd5?=
 =?utf-8?B?Z3hmQ0VoQUYxRWdHQXFySFZGNzYrTnpDblA5YlpJTGlWMXlrOHBVQmtNVGdq?=
 =?utf-8?B?T2ZsSncvRUNGeUNiWTZPdXM5RStnb1AzeEtLZTAyaEVMTTFFODFVc0hOaDE3?=
 =?utf-8?B?UVdMMUxteGkzN1QzYXpBdENMbEI3NXJidk5Fanh5ZWRENkpQSk10cmVwSFN6?=
 =?utf-8?B?b1JEMFBLTHZEWXFETTZSTG8xbktzRmtIUm9zK1Fyb1NSSUZob2k0bFFJVlJK?=
 =?utf-8?B?RXE1d3JjK1lXWjJtL05sRGZ4RU53MUJSL2NRUXhIZjNuYjB1RE1uak50QTVs?=
 =?utf-8?B?QVFiWEZSK3ZFQlhiNW5aVkRWLzZCS0d2M3phN2UwNEVrSktoOG9JanAvMjZx?=
 =?utf-8?B?Y0tXaXRNRVUvSDlLNS9sZmFKZTB3b29oSk0rOXhzWjlZKzMrU3ozYUpkL0FS?=
 =?utf-8?B?ZllENlltSmJ5bGs1ellKdzVnN21GRG81VGhvcW1MQWFZNDhaUjM2SjdoY2FB?=
 =?utf-8?B?SnBKdDcraUNGWUgwbHkvUjJVN3FnbDBZczAwQS9uZ3IzV0RCYWMrREZLMVdS?=
 =?utf-8?B?N3VqQmo2OEt5Z0FWbE5tSURVMEROQ01PdDJOa0pyM2ZLcTJBWHRGbEFEM3hk?=
 =?utf-8?B?MGNCZTFIUnc0QWJOdDUxcjJmNWlUbXNVQ3hXRGw1SUw1RER0S2RCclN6RTVY?=
 =?utf-8?B?TWZPNkhUZnhpanlxS25peTIrMGhkeExrRVFrNkFvbUh3c1lzazRLOHJ3Wkw4?=
 =?utf-8?B?dXFKeTRaUytqT1ZLMkp2K01ieC9VY05IQm93REk2RG1YeGdPZUhRVTlNUDVv?=
 =?utf-8?B?WFZrWmJUeFc5c2QxYXl3QkFja0pOM1VJN0R3VHlROUU3ME5mWFlPVHBJVy9y?=
 =?utf-8?B?ajJQMU5aT3h2ZkM4T0VwbklaRHZRZUY2Mmo4WVdrS2NVQStBckgrNjJOa1dT?=
 =?utf-8?B?a2QyMGJYbUdRMW91WnBsc3F3L24wbVh3QUlmSWJlbEJuVEFIZE9MbTJkcEJQ?=
 =?utf-8?B?OERZOGo1MFpIaDlkRDlabFpjWHpzcjFDV0thSVZqUW1KUGx3dmRxNlBrRm5u?=
 =?utf-8?B?VFRIVE9RQmZnVlBaUm1vbjArT0UvWks2aUl0dkZYMmtMbllPWXZodDdScm1P?=
 =?utf-8?B?VVZCczZDalNYaXgzNFlneDZHZ0pidHNjWE1qOVptUllQaUFKRkc2U01QYmJ2?=
 =?utf-8?B?QXdlb3MxeXBBV3ZwRnZ4aTlYZVprRERWbTUvWW1xMWNrNGJrUFFHejRGb1Ex?=
 =?utf-8?B?bU0rekdObkZxT1RBWUVEdVhpQWM3VWpLRmJMbzQ2eUFSMUlqb1NDdk1iQmJ2?=
 =?utf-8?B?RHkvbFpNSldCc0RYc0ZpK2prRHdURUg2czNEaThlL0szaGQ1ZXhTc05kL1pw?=
 =?utf-8?B?QThDZnRONkxsNkxDV1dwTEc3RUhZM2hrZURHQ3hDTHZlRFNzc0dwWmx5aFNl?=
 =?utf-8?B?TThoWU1WeksrN2ZEWlM4TnFTY3Q0YUpJS1dMT3BWRTR3WkVRVTA3VzFGMUZT?=
 =?utf-8?B?bzJCVUc0WUpzRnlWTWZ3TWtlTUcrSUpBTytlYnNzeTg4THBhMHQvalI2cmxT?=
 =?utf-8?B?cW9kdEJyVEhZWVNjNzROL05ZVHQwcm8rOGFNdzhZMTVtOWJrSFp0dVgzTmY0?=
 =?utf-8?B?UjFPSUJqUHpEa2hiaUx0S3JubzhYRktjU2lSVFQva3B4cDBzc1AyMHZyRlRD?=
 =?utf-8?B?MTR2cmgwMUU2MWZndjVuSkJXN1p6ek1lSDgyUVRhSlcyM2d6SWlJWk1uSDdi?=
 =?utf-8?Q?M1HuE25kfaU0At14DFIVoAbZJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71172e87-b8e7-426a-e83d-08dabe3882be
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 07:45:14.8435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4pkCTV4hlTcxDP595ic38rNVW4rC1MLR9gyoLBfMpqxpUxRgiLXz/Umm+hlADqiASqV3f+yJ79Mzx3YC9BhBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9485

On 04.11.2022 04:06, Henry Wang wrote:
> 4. Patch: x86 :Enable interrupts around dump_execstate() [5]
> - I think your opinion is needed so that the discussion can continue whether this
> patch can process or the previous patch needs to be reverted.

On the last x86 maintainer meeting the decision was taken to revert. All
that needs to happen is for a revert patch to be submitted by one of
Andrew or Roger, and it to then be acked by the other of the two. I did
clearly indicate that I do not want to put my name under a functionally
regressing revert, even if the alternative of addressing the recognized
issue with the present approach isn't pretty.

Jan

