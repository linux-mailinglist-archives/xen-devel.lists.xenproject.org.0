Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C05E9A9B
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:42:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411444.654377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocilH-0006IN-82; Mon, 26 Sep 2022 07:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411444.654377; Mon, 26 Sep 2022 07:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocilH-0006GM-5P; Mon, 26 Sep 2022 07:42:43 +0000
Received: by outflank-mailman (input) for mailman id 411444;
 Mon, 26 Sep 2022 07:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocilF-0006GG-Lf
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:42:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2051.outbound.protection.outlook.com [40.107.21.51])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc14c3d5-3d6e-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 09:42:40 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 07:42:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 07:42:37 +0000
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
X-Inumbo-ID: cc14c3d5-3d6e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c28lD02pMYbIKtwDFqpdYlccudgLKmaTYqMY6UDXagr5YBSL1tcHJYt89IEyLAkYtliu1J4Vuo54qHUzkZRoip7Dr8TsYBCS1SjbRexRGCBCMV9UM46OAao90S/YO/IhWuygeNS4Ec67SeD5wSw6k+MrVHOJzMxXQ0kFe/zahEhH+wJivCDdP8Isd5Gf4nw7bKcfYMXv4uCdrXho7CH8mfvp8O6/mHVnYWMJHlCwLZj466uCABbxxbFflL7+60dCzJtXzRzHD/kNR8hl8hCjebu/cbMSD9G7BVs+2Tz66VmtHrdCAZg4uDANkWJnEAijG1bLb/UlFUI7pva59uicAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrl+0t4HVCxfUUCLQFD4YZwU3HuGZkCOs0gxsxWPuI8=;
 b=EkuniNpaJaRC8VRBQQQv8fOLY2RJ2PcinLZ7+tLVaKi4LTXla7Ne3esnKWcT46SlVumUtMGrQcAuYm4v+0b4xJbpR8EOEEyTV8ScQQhOWWK1LzXl9gT+QeCj5KJs99KUq8CzbHvLVkaQNKhTITn4j1hVD+zFbdvDwouz7LIsSbUJxpPUlDCA/qyZPeX4UtDvtlGxGY0vLzDZsalQ9PJhGSYHG5GqHg5lrHLCTCrvsuSLi3KSeZNB3nd9lsyc6DFbsFk6MG3pyfILjKK53cm8wYY/4QlA/ZlBBdJa4M0MoFZ0varS9sAx6bu2P03Xh2TNDyEmjHdijNti/DvQtE/TLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xrl+0t4HVCxfUUCLQFD4YZwU3HuGZkCOs0gxsxWPuI8=;
 b=ArPE6y/9ynT3CM0bDCJP7gFfweA7HMUZLTA9fMCLqFVOM2FujOPuXQxRBEV5+CnS1MVMrNOZipTh0BT9stCQqZs8z917z5dLYFKckQPdrunREphezwyUAkxjBEkeCmdOlSvlD0SsdqX906mfUm9RyzrzqpTZJ9HTuIv902uT+X3mt2eeLb16FjAJlzvNXvTOLxEz9nTE+C2LxapUo/RquEsfbo5odG+cnuVGJbMRT8Yu0VhFPgF7Z1V2G77ARFe3gHffTdYNJKx30FDBSwfmPLMzVsJ2VjLGGo5tie8GzMi2nK6EhJ0PswBHME3L21d0cm+lAuHGRFORD1kIidmEUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <467b204a-1aed-4cd7-b401-8ff01b8d343a@suse.com>
Date: Mon, 26 Sep 2022 09:42:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 01/12] xen/arm: add cache coloring initialization
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-2-carlo.nonato@minervasys.tech>
 <1369a435-ad92-3bbd-60e4-27c1e49c1bc9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1369a435-ad92-3bbd-60e4-27c1e49c1bc9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 5949fdce-819c-444a-412b-08da9f92af04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v7SQvpVLN0EIiWDEy4jqqbcWsaYtaszzq1nJ1YgMW82lJJG9gYeVPip77KXNRtFUp3KNjNaLKYc8iOCHQYhGf/yJWxT0xLL3V5NwrL0YVdFIY7IuQXe90z9g2HJ8zkwNGptHfJ3dyu6ASpBElYGeJ/8c3ZldCqz/oJ2xYaLHc29AZphf69Yjmt4/fKKVFYRTMGNKmLNpkYle1ntk/a6Feumq4XRBqY1dpXvoKZLGYNZnthhiSig9n09mskQcboL7ZjDLpEt5g+zg8kWO5v0juVpiOzO/9j5n64dSDOXuH9ib1PBt7LQ1FId4pVQDKnJcw/tuIPZbMfrChP2URQ3xQW2vebWEJjFtXmNTM037uNep+08kj+dolBub4On2XpAZZrpz92Jcy/m2EJGrQ7tO0H+0cVQ6YP5MWgsBOL4v/CjbXlw0PsOtgwNo7v/DZbKYDXRQI9SR3XvI7DnMdiGGMDqdmPhN069OA6/o/gyFKEIjqrfVqrlhwhHVCCoUp62fSXxlpU2PHvpWrTpjKvmxkgMEebOKHFX/5yE9GhYVDiY432tgFVTOdRbzyBh4A560ED8ya1HT3XS9JmIOAydW2O6yGT2+ni/RiToz2gFA96Dr55REIJi47yzGVnF5paNoYBM/IOTvuokqveGmSY6xaOdNRo1o7SOiPXcagkIHW4tYx4Yi2xPSR5wSSNF3RjgoSiV79mZMPsLSmHJGVOVAFeH4tWVEW4lR1qabhzF/k9hVeT0WagyF9M57vy/dnP1Hssnl1lJpXX1Qo8I9cslnzuipI2ESUEvUjA3T00J4r5Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(346002)(136003)(376002)(451199015)(31686004)(110136005)(2616005)(36756003)(31696002)(2906002)(186003)(86362001)(4744005)(5660300002)(8936002)(7416002)(6512007)(66476007)(66556008)(41300700001)(26005)(4326008)(8676002)(66946007)(316002)(6506007)(53546011)(6666004)(478600001)(6486002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qk5mYkFTcXBJN2loa0dmQUc0VEp2L09ZQzRrMElncUgxeUEybll5cXhSb0sr?=
 =?utf-8?B?STJHZHpRU1FraGFCLzRsODZMZEpjaXZXWCt6WXRaOVNFVnF6WmRZME83eXB1?=
 =?utf-8?B?UDRUZUNiM2Q1ZFZ2QkFrMGxEY2ZSQ0o2ZFNUdW9VdFZZRngzNlNNbmxHSjVS?=
 =?utf-8?B?R25tMjJvbWJtd2pnYTRYcGt6TmlKeG5NMUVibHVPa0dRaWxCVmR1allXRDNI?=
 =?utf-8?B?QkNBazNObVB6Z2ZQMlF3VGJUU0lPcFk1VHI5ZnB2QUgyTHVvWTh6NEVSVGNm?=
 =?utf-8?B?d3VtbU85NVdheDcydkZZaTBsZnpxOWN6ZUNRZXB5Zk1zSEdOVlFyQVVPcDRG?=
 =?utf-8?B?UjJqZTU1c3FLWDBvU1BuRWJHclhUcSthRjEwNHQ3WjNjV2hRVmlFd0Y1bzd2?=
 =?utf-8?B?TkZPclFUZHNmYUpqS0lrd3g4Y280YktFaVBaQW4zOUhDWGZVcW5jNDBSZHBE?=
 =?utf-8?B?c21NQmNxODFmUkwvUWZZRlM5Q3lYMzdTVlBkTHpjUkxCVlFVM3JpcVJCdzc4?=
 =?utf-8?B?eVFRQUttUUNobDFYRVd4a0JrbXRvVFdTdmFSdEJEODd4TW42cjNTL0xXQWVF?=
 =?utf-8?B?djFCT1lwb2pZRU80WmdoWlgrU09QajNEY1ZyQ2ltRjQ4Z1dBNUJEd3M5KzZt?=
 =?utf-8?B?NWJpOURyQU9mL09SVnBBWWRiako5aGxVZ2Jqb2hzOEJvMzVrWGRLNnEyYnlS?=
 =?utf-8?B?WldzVlJ2VmM4UHhvUVgyZDVOQVBmYmtScERLQkVaV3gvQU9uS3ZicFNMOFh5?=
 =?utf-8?B?SjYxbzhYWDNQREtHeXg2YWRsVTJJYTh5STV3YUxacTJIbjhGQW1HbXRFdWVs?=
 =?utf-8?B?UnJSdWNycTZIa1FYVUtZbC95T0VuOFJZWW5GejRVWjRSVDB6eDRJdDAraXRB?=
 =?utf-8?B?MjdMVDVFeFRzVjhEYkJCN3RvMHEwbERFUGpsdDlFZ081TmRCY1B3THdhMEVK?=
 =?utf-8?B?WE44UW9tSWowT21CMkhTMnYvV0FnSDh5OEtyQUZsRzREZHM4eCsrSzd3a3ZF?=
 =?utf-8?B?RWcwclZyd1N6bnkvUnF3OE14K2FNaFRnOTNHQTZOVlAvZC9CTjhwN1lDa1hD?=
 =?utf-8?B?UnV6THlBampWK1pjcGEzbE12S3orT3ozUmsxWktIOG1Dbjd4bHFUZ0Rsek5x?=
 =?utf-8?B?VEtxN0ZSaGszR2RtcHAxSDZjK2tyaFRDVUplRmREWWd3V1IybG82bS9NWm1G?=
 =?utf-8?B?cDg5d1hFTC9oYjNLc2xIYm0yUGVYaGxRMWRlSEo5S0QrQ2Y0RjA1eVNJb1JE?=
 =?utf-8?B?ZTNCV2dNSkw0Y2RaTXRhYVhqQzY0dDNFT2tZVWl6Tk1kclh3eTNnUnJRSkQv?=
 =?utf-8?B?dnJLV2FocTBTRW1ZUHVOLzVVL21QNUNSTnl2MTYzSGZlR1RVTUk5RlNlTEVJ?=
 =?utf-8?B?M203aks3dXQxaUxxRDBPYklZR0tlUE4rVFdWR3hRd1ZtRk53WCs4U2FudElk?=
 =?utf-8?B?TWlmV2xLMkRGM1VxRW5Xd3ZCOEVkcWpYamc3Q2UvZy9DZUYvRndzY0NQN2J4?=
 =?utf-8?B?UUhiUC9yZDdEM0IvQW1KUDdVbUJxQzV1MWUrMytZVWM0ZTNRRk9VMWFzUlor?=
 =?utf-8?B?enY3UFB5Rys1T29TSVRRWDMwamRIV0x4WWtoYW45My9pUEhJUVkwd3g5VE1p?=
 =?utf-8?B?MUt0Yzdib3FXYUUzZldjZ1c1RFlFL0VYS2trVzdZMkJTTkx4YW9JNWtHZ3ow?=
 =?utf-8?B?eWF5UGRYV0RRRWI4V1ErNmFoWVV6U3Y0ODlscTZ3elpGVmtOK1hWK0lMMzBv?=
 =?utf-8?B?bHBOcGNyV1MvWmUwZFVDZUpaRGVGSS9rQ3gyOVpjZlFiRnJGakdoREkxSTU4?=
 =?utf-8?B?MXptcy93b1l5aEs4RjNrMkJQcVVqbDhpQW5LaS9iRVBoMklqUnZGa1RJb1FO?=
 =?utf-8?B?TzZIdkpEOWhsMzRwdFFrT2xybkxqWUt3aThLYm40SVJYQXRWdjB3d1g0dG9F?=
 =?utf-8?B?eGJOV3NrYk9leUg2dzJEb2dFRHRzdWpzc3RlcGQ1MFJabHl4SnVyb0c0VDgy?=
 =?utf-8?B?b3h6dVV6bkw4UXpGMzdjc0FybXlvR1g3cnNmSC92QjB1OEYxbXNNTFJuVi9m?=
 =?utf-8?B?WGxCMUhhZWpoYTJ4Z1VGcms3Vm9ON1hpRG1ETlphSE1GL3lQQnRJSEtqVWZn?=
 =?utf-8?Q?y+s25zeHeONh7wK0UseKfraVs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5949fdce-819c-444a-412b-08da9f92af04
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:42:37.7773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wf1rqrOgnu0buPQGS25BRXKflYmsJke3qW3/IICCqeH3JZpGUEsGOIufEsuOAF52dhXNDXSq0iKfQ8/trRBiKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

On 26.09.2022 08:20, Wei Chen wrote:
> On 2022/8/26 20:51, Carlo Nonato wrote:
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -131,6 +131,22 @@ config ARM64_BTI
>>   	  Branch Target Identification support.
>>   	  This feature is not supported in Xen.
>>   
>> +config CACHE_COLORING
>> +	bool "Last Level Cache (LLC) coloring" if EXPERT
>> +	default n

No need for this line, btw.

>> +	depends on ARM_64
>> +
>> +config MAX_CACHE_COLORS
>> +	int "Maximum number of cache colors"
>> +	default 128
>> +	range 0 65536
> 
> Just curious. Why select 128 as default vaule here? Is it a classic 
> implmenntation for Arm64 cache? And the same question for the upper 
> bound 65536.

Going beyond that: What is the meaning of the user picking 0 here?
And isn't 1 merely mapping to the allocator we have, i.e. the
CACHE_COLORING=n case? IOW shouldn't the lowe bound of the range
be (at least) 2?

Jan

