Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1746E599782
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390162.627435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxZj-00077J-QE; Fri, 19 Aug 2022 08:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390162.627435; Fri, 19 Aug 2022 08:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxZj-00074r-NP; Fri, 19 Aug 2022 08:41:55 +0000
Received: by outflank-mailman (input) for mailman id 390162;
 Fri, 19 Aug 2022 08:41:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOxZj-00074l-4g
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:41:55 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50063.outbound.protection.outlook.com [40.107.5.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66a50d7-1f9a-11ed-bd2e-47488cf2e6aa;
 Fri, 19 Aug 2022 10:41:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3193.eurprd04.prod.outlook.com (2603:10a6:7:22::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Fri, 19 Aug
 2022 08:41:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 08:41:51 +0000
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
X-Inumbo-ID: c66a50d7-1f9a-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBdaPGCY/Skj0T0D++/kFCtP4qgvei9wqT0T6FssPGsg0uznROLqpicR7WqaPk/fNFkzikcR6flqWQKxjchZJ1z6gxI49go5O6lbxdytZO9qyxVS8rP1v8X6GWBa0XFMcld9ss1JxYA+cl+fOO3AnBwAj4yI6k88pI5wNY/JgXiN3735POgZ448Du4sv5EZCpYCScJi24tSp9+0/Q4xQYXgO5+gRCM7p3lv5wZy1CGkVYp136w8AwAk7Dz7tKzA4kJhjf+kKhbZcpmlr80Wf99x/Fw+cQwsNZkPU+t4ZeJ868OZS0CY2+mFoTI0gfu2U1/F7VmSEjbZMdSaMZcVOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=636AiH3eaKDcqxeFitjbegrSs3QrDKscxxDIBtSuMU8=;
 b=M2G53cAbH+cZbehtpD1q9zGe957s659pTfTs100bEydBBPfFR/9/ylBYZ4VxDbE03M8ZUHWG4pbyk3MepnsU916ObKqROMRy5I6lQ4Vt+w44aCr+gptef9G8ViDbMpKCNK4s1QUOoF+edZkBkN8zW10ldGhw+hhCYTbJ8rveZvSsEQYVNS6u7/wm5GCGvsJeE+o4htFgHldyl8nxOIicMKPRqOg0x0YC9NNe/36xeUaS3b+U61nfSx1s+aUBU4vIYwXggLGuPh2scOAYoIl4wQHaY+TF1I76XKBYnrFdtPv46nLEU9Q90KtMOsw9wKG4MICJfjc7g+Ph7XH3XLTLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=636AiH3eaKDcqxeFitjbegrSs3QrDKscxxDIBtSuMU8=;
 b=NhJNRp8Qlyh5U0M8VWxB6HRO8YTulq1sk2GC3YWZjK1BymK9vNsaX/SElXVzUNPdiS9VRQUgvg7FGEA8dUcOsa3VL2w0iYYLEodfMH+QZsmOxmN/CECFBlmjYGHmUaOU3pjwtGsifz9a8WmzQYJG5LY1BMXebaQiSBGYJzttZTCp2ElJjxfIQAK2gnBcRA4NJ/QCsKtXT4ZR2AvFYaEScIAjSvi3ceLND0VrJQYekZC6pvT4jNlDlA2XPQZBVFRj8Z3DfAegPwVA1CM2FL1ei+z7fRhmy3Gr4eFKpQs6EwQ5tSOGXmms4bq6+iVvxkyfOQKZqF6GVacI1wD9QjSCpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8ab4650-a8bb-f847-762f-fde16d2a5d1e@suse.com>
Date: Fri, 19 Aug 2022 10:41:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 0/2] Arm32: memset() & friends
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <c9df0573-044f-615d-f170-36ddbed6b50a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c9df0573-044f-615d-f170-36ddbed6b50a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 377a1411-17b4-482f-d403-08da81bea9a5
X-MS-TrafficTypeDiagnostic: HE1PR04MB3193:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UOaE6KYRwJIw1MntUTfTQBWIqKE9ZItePaySYNPTrz7Tq4qWKJzQ45KZ3idqzOCejY5nKDN1QAi16vzN27S9P5PU0UeYed3TkprAlwfEFRdjlzV33MWZ6jyDKchLuC2lCajqyaVVwC2lCsW1XbfmR55RuJyfGN2wVr+WJlazSdZjz1IsmU2YbGdfBa91jYTC5PovL57VCWtOlYlFYuU3DfMkJeL7Gu85VfX7O0+F8R37qWPvmClO86+lPEUexHlbDd0JSS6RJ6TxRBQWjcTwKp2IaLxl9MBp6mSriRDmiwNeoit8sqwmwMk0pigBG8uK6aHjtME67vmuU+eOZmT19BPqgWzy0p4QkR3qK6ZfZOPD5wTcEqVZxb8WS+41sgcL1HmbSAMGJXYB/SXQ6EEGGIYazQU2oVLNkffSjdKryjvAX1oL8oVxVN3eCEYE16gCDagIf1JfLzmE+t4CCrQbLVeA5XyAIMQJGHmbFcH9+i6ckjma+1zASVdMFdBD9VBu86B14bCKRva1k5XzGT1InaPC7bsWlDG+3wBeVNWEp/T4JG0h+si+AlpjGF43ninjkc7jGq12DSKMmbxSrxNlyUKIZq4iWd1uvCX2PZW0sOYr1mQl5oyqmDJElFeBXH8cRayuw+gPZUrF6EzlVsp3gQgUw7smfNxwGEP3C7i4cvJFU2e71zex3ydBnIq8nV9l+lSqMvRzLtJmdx7C7D9xnsaOm6kMpd3k2tdl5ZzFiQc4ZGuU+MrBb0RCHTsqXzKXpM6JkL9JD8BBmI9xfdeE+Vt8c+b72osb5YZlefLpgfZTnUzSvlHInz+M65qKfxTXxInt9oLjQfauP4BOm+3xo/RR3MJIIBvcVQjh04rqyNk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(366004)(346002)(376002)(136003)(396003)(31696002)(86362001)(2616005)(186003)(38100700002)(31686004)(66476007)(316002)(110136005)(54906003)(4744005)(5660300002)(36756003)(8936002)(66946007)(4326008)(66556008)(8676002)(2906002)(26005)(41300700001)(6506007)(53546011)(6512007)(478600001)(6486002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WFB1by9NdWpHamxHMFV6ZFUzcmdLSlR2MGREUjE4WFg4cUdyUnROVS9lekM5?=
 =?utf-8?B?UkNNOCtrL0UrSkF1amUwaFJVak04dkMwUFMzc3hzSDEzQTV6UjNQbEY2ekY2?=
 =?utf-8?B?bXlKeERaSDNYZUR1amJDeEF1RzlXL2FrbXhNQ3JrQVBJbjBVbTQ2a01KcjVs?=
 =?utf-8?B?QW5YY2dXYlpXVkxBS0xURXMvcDM2cmxjZHdlVEZOMmt6MTllV21iRm04WjNp?=
 =?utf-8?B?Rnd6a0FQQ0RpMFUzUEc2MktiTVpFWVlNT3VuUHZRVHEwaEhaOVo4cEZOOEp4?=
 =?utf-8?B?V1lRMFNrTGF4NmptVW55QjNVU28rYVByVngzMW9tZjNzdGFyVFZoeC9QWFYy?=
 =?utf-8?B?MldDcFE5Ym5sRURrRmFaYzRnWm9UaEE1aTdIdFc4Y0JyYXBCZzVnQ0lRdnlO?=
 =?utf-8?B?SG5KZG5CbDl2MmI1WUpSZ0tZT1VmNlhySDdXQWMzUWMrVkFqbUV6VHBHbysx?=
 =?utf-8?B?OGpKc3VabXVCUjZrajMycGo0VXZpRFFBTlF2QUZxQmJWTzZHdjgra1V2ZVgr?=
 =?utf-8?B?d3ZyODZNTjBGWUlXeFh5cGpuOUZMUzJtZGpPR2l6aXM1OVBZNXBnN21yOG4v?=
 =?utf-8?B?THRueXZYOGw1Q09uT1hRajdWR21JcURlNVFNUmFST2g1ZWV4R285L2JlQ0VM?=
 =?utf-8?B?bm9lRitmcEY2dzAwTCtqYkVjTFQrRFh6SjI4RjRORVJEN2FHM3RiUGo3ZjQ5?=
 =?utf-8?B?SDVHMFpxekJSYkZ3K1RuTzBTakV1MVVvRllVaVFMejNXOXFIdGVUZDI5NWdX?=
 =?utf-8?B?TTVZZ0RCKy9VYWtWZHk2T29Ia296Z3REcGtZUHQvalVVdEZWbXF1RWNCeVZ3?=
 =?utf-8?B?MDRkc3hlVUgvdnk3UlU1dUJ1eHBCa2ZOWmo1NTlpd3JoVDJ0MG9DS1d3Unow?=
 =?utf-8?B?WEJtTk5sUSttUHpuU3MzT0hkY2JxSEdBclp4cjl5UFgvT2h4cFFiQ1RxR0Nv?=
 =?utf-8?B?NyszNmEyam5nai9ESHFGc2tSdHk3TzA3dTVUN3RqMi9peG5oVmkrZCszNlU1?=
 =?utf-8?B?Z3Voa054RFNUR0ladzlsblFralF4S3ZqSXdnd2VuUmtZTzlPUEd3Vy9UdEdJ?=
 =?utf-8?B?WVBidXQxMFZJbFNEWnFITkdhaEdGaldraVVGbWtpaDBVMTlOTGRQNkNlZnhT?=
 =?utf-8?B?VTgreUJBcTVRcmJ2ckdRbFdJQnBpc2ZiMnQyQTBVbDFZVXkrY0RQWmZXenhz?=
 =?utf-8?B?NjhVVWxMaDNDMythZ1hwN2UzTjhVdlRHS3prUnVSTVFiMk81VFBPMkRXeXBs?=
 =?utf-8?B?Z1pPV05hT2tyWFdTdHJIcHRVNGVnMXNHT0IvL0tkT0l1RXgxR2FqdldCRWRn?=
 =?utf-8?B?SDZvaVRJdjI2cDd6dVRJZzIxclQvcVcrOW9WRzdkMS93VUtXUXRjeEtPRHFM?=
 =?utf-8?B?bVdidE1KVFZDQVBTaHYwa3VvS2x1Q2ZxeGg2cGlDdVVVT3ZUV3pwQ3Jpd3pv?=
 =?utf-8?B?V3Q1TEpyNGZSWXVYaUdPSnVGeW5WanJPUjQ1WjFjWlVpTzVYQWhpR205RExX?=
 =?utf-8?B?T2JoQ3lkdlU4bGZrcWpoYmxqZXQrdW5NSDZIdnMzdFBmZElCcDRtSElSc2N6?=
 =?utf-8?B?Y2tTQU4yYi9zOUFJdzh4MzlReUlSTzJhYkJYV2xSM2U1QTBKV09TbjJwdWhV?=
 =?utf-8?B?amdWN05HT3dON2xDSkxKS2YyMDMwVVdZbUxwM2FZazJuN2tTeU4xS2R3bGpo?=
 =?utf-8?B?ci9RR0planBDcUUrVjc3Q1phb1J4Q2UvRit2RTVPK0dLNDlBZ1JqSFNlTHJo?=
 =?utf-8?B?RXhlQVJJdHlqcWlaTFVoWENOSmtHMlY1czh2cG5WNFA3SEZQbnFnczBFdzlY?=
 =?utf-8?B?VkNSNmc2REdzZ2NiZklocktsaCtGdTJ0UmdJWWZjZUlhNnJIUWtHVHFqSXhr?=
 =?utf-8?B?bTM3RktHQjY3WFY4aG10NGIzYjE5UHBVZVBKZjliTmRQeXRxR2RidzBad0dT?=
 =?utf-8?B?T25kdEVWOHlsbVNDUWpMVDE3RFpTZ1Z3cU9MaVZTVkRUVzNxZTlTekRDV1p0?=
 =?utf-8?B?MUVnYjViZXZZc2h5Q09YaUNlSXRxcEpnYVRobktvUnNhaGNiQ1BkYWUyTFZB?=
 =?utf-8?B?NUkwS0lLcWlMaUE4NFBKcnM4ZUJmZWFKRmw0aWp6VW00SGh2ZXZBajlKU1pz?=
 =?utf-8?Q?82K0iXyPOZMHYm0HJvNh6RdkG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377a1411-17b4-482f-d403-08da81bea9a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:41:51.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmpnosxtbEUPypQCzUjCLwMgdt/oisc44y4iCrmOcrq46bUy9Hl54L+wihVNdL7BfTDj7gpgLdFcELFfbHzQzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3193

On 19.08.2022 10:32, Julien Grall wrote:
> On 19/08/2022 08:48, Jan Beulich wrote:
>> Note that while the original Linux code has the same issue, I don't
>> really fancy sending there a patch similar to patch 1. That's because
>> my XSA-307 related "make find_next_{,zero_}bit() have well defined
>> behavior" was entirely ignored, so I would expect nothing better here.
> 
> Would you be able to point me to the discussion?

Hmm, I can't spot it on
https://patchwork.kernel.org/project/linux-arm-kernel/list/ , but
then again there are only very few entries there anyway which pre-
date July 2022. I've been able to easily spot it at
https://lore.kernel.org/linux-arm-kernel/5809eac9-aae3-e111-7301-a1aa76c0f626@suse.com/

Jan

