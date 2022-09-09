Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3B5B32F2
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:10:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403960.646244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa25-0005Um-1H; Fri, 09 Sep 2022 09:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403960.646244; Fri, 09 Sep 2022 09:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWa24-0005SX-U6; Fri, 09 Sep 2022 09:10:40 +0000
Received: by outflank-mailman (input) for mailman id 403960;
 Fri, 09 Sep 2022 09:10:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWa22-0005SP-S5
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:10:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bf8e6ad-301f-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:10:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4291.eurprd04.prod.outlook.com (2603:10a6:208:66::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 09:10:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 09:10:35 +0000
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
X-Inumbo-ID: 3bf8e6ad-301f-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxHQdpehqm6C4YZMtgILwYDnU055d5/hSFAZgeED9dAtLNitaykvUDCEuwRIstqZjc3rWWaw2Tp1lAnSvjNbENmCgnVfvUATI0UUum+s2E4znfSAEJcN27FftcNyUSjI9wTUDWK3eFbaqHf0xugUlpXRP/z7wCizffHc+1a/NgAH7QsOxugo/lYXHt18ObYZvFbpfZymMq4V5nOvkVdS/imdrf9fkpoctLJLbHY9mBsFKJn+UsBKvglWTC/lJTx3+usyUmdt9GBF/OSXIAozadQv8BYEoBWpBBPlilYXDZSU9HYvGPO30izra7aPeHZCEige3UjrprUKrpB+VogJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4leNG+VrJdYg+MIQVhXu3KNlCCkFR1QCWJeZuhOCIg=;
 b=PypL360EVfz7yj5GZ6MkLGpPZa/wW4ccezciKUV8q9inrQAgQJPpLeaOEpa7gz2tAU88fevaBPC+MAUODjZVgkt41gYY2OobhhPzY+v6iooCPKiSMEcJ4JO1Wy4qwnxHvHD53No5BK0X9bqYZDaObBdSS6YRS04yBiUokcRJuNY+FFNwUioEwBqa2eftRQMxj0VX/mPkwgjhwubwzQDmnT/1jE6/qHxZpFZsYDu5XXEZSjCirbS515NA74VPVzS8i2/EY5qaDZdUYd16mKF6/YKqPVmEtuaXVuznzYA1fM3o59p+xi6KwMJSBGKVo1P0afy+Gh3yM8x4vGPRnIH6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4leNG+VrJdYg+MIQVhXu3KNlCCkFR1QCWJeZuhOCIg=;
 b=Bozl1M8wS+TjYyRPnW48HI1B8dSEG7GiMIjhTJbEv2SbyGH/0MXLg0T4IknxkZXOj8PIcl18RmZKQ+Un36jajHbXE7ZF6GuY5faVMh02PixTjZ2TLnAR7tstH+KFPbIoK/zUkG5gcobVcVC/zJHlhAiweU0POrSE5aOFqYQ2sxFiCvMzQl1cU4LE/dcGBmPd8g5x1LT6Yt95cY/A3rfT0/2RfTUXF4CGrPesIT5wmBOV2PWam2CX+mMS3VxbNegFSeWAxFIaIVmAXj+i9d9iItr+c2Edn9PLItOH3UBogZvLM2+UeXVfb1kzhYcmhYAAuftDFUJTmcVvxFl6lm1grQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a01caa0f-9db2-e1a9-1330-5bec6e9b4009@suse.com>
Date: Fri, 9 Sep 2022 11:10:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220909080944.28559-1-jgross@suse.com>
 <AS8PR08MB79918E22F292563B320F502592439@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <29e45aa2-910e-33ae-cdaa-be2f9e9d2942@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB4291:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f1a11d-d24f-4a6b-3bd6-08da924327b6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	affKYvygPDuEO9h0gjWEn2eQlIU+5gy5cuP128U0bA/wDW3pz1lqExeo09LS8RCVoNwvvKYzVLodurQCB0myxyJGJHlUabrbPMvlEt+6PJljAjbISY1tTeVcoFksK4p0pCjfiILgN315yJmkpzAR3X7gHq/++mUQ+V1a0LuW+ZxW35PeRFmkBPXXoX2a7sl1gZyv/RkuRFqaMAfHtVUMlUj3KMY+wSng1hA994HSW1UOVl3OJbw4fTUkHlA81+rJsiNEFh/sH02ePpxXAuPaAdUqAz4tB3AmxfGNBQy2yX5mfOLBndpQnomPQyDP9bS8YkL7H1ekn9F6QCSSzb7XEvlHYbSzVv228UxACG1d6AjYYuVyYS2ck5+r7wg7gI+QnPli0/rtxbkmoZiYN/z1PZ+x4/JHwBN6i039MueVbcoH7EF6S5eaI+X7B2ofFTr4/mgNXJWhbZJ2ILPbQmwQdjyS5CiNLq3r0ADYAP68uqXgMssJ0dZ7tlZtzk+U2SxKIINeyHM3beyd4X3rjx6MguGxwWKSqGfju9a0mnJOmjX7hoJYbc37c3NerXMvatfqS2xw9m/SyPcQeHtn1qKDnpQFK62ZWutLDQqS7SRahn8xQYRNtYgB7jnZGbNYIMkLN+0TVZ4hrYyW9Lb5vuUHOz4Z8SRgdzMur96NifGG+f3bC0sslm/S+INJjsSNuZj35QmK9d7gzUSDqgIvbTXPZ6W/xTzuWC10HBEANoh1D3Lt7r4sM4dPRFb3zpyBq/MinGlkpZ+e88SLV4j7LiwGWZRV4uqrNXd1xSGmRoEQ7Fk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(186003)(2616005)(5660300002)(41300700001)(54906003)(8936002)(316002)(6506007)(26005)(6512007)(31686004)(66946007)(2906002)(478600001)(86362001)(53546011)(66556008)(6486002)(8676002)(110136005)(36756003)(66476007)(4744005)(38100700002)(31696002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExxZmFtblhuamZVT2x6ajdwODREbHhIUExpUlozWUxVYjQ3Y2JUREtIWTdq?=
 =?utf-8?B?K21jYjZ5U1F3RXJNenZ6czE5MWExZk0vSHN1SUVpTWtrTVFSemlIRjdBYU94?=
 =?utf-8?B?TTRHQ2pJMDZBMmdhZklMQ2YzK3JBajJuZkwwV1dVZnZuZFlBREtiSm9CMW4y?=
 =?utf-8?B?RzRXZWV1UDc4Y2FGN0RYUC9Ra0ZVbEhDTnltQUNXNlA1NXd0WmlIWHdoejhD?=
 =?utf-8?B?c05FeXVGLytzUjFXSGxJOVhCVlhkTG4ySFQrQkF6WmZsNzZjZy9xaktxRkNy?=
 =?utf-8?B?VHpBSy9WZyt2bm9VVzlUOG1WaEFUcU5LNjBRYjhSVkN3c1RMNGM1cVZuWWxR?=
 =?utf-8?B?UGZNUEpQcWI5UTNvOFVjRlJRMU5CUHpyWENabUNhUHMrdFd3bWZaS1JXZFB1?=
 =?utf-8?B?WXkwYXZSZ0FBeTZIc3VRZEpIcjdrbnZoZ25uTXhXWG42UysrVXppMjBqMVNa?=
 =?utf-8?B?WE9tQi9za21sbUE3YlhTN3lxcVlRM3ZJcklBL0Y3bVQ3M1FRMXZhTzRjRFlQ?=
 =?utf-8?B?cG9CT2lpNnFKbUVOMC9FWG1CRUc1a1g3U0hMbFV4UUVzWTRFWTMwR01CNkVN?=
 =?utf-8?B?MDhPczdEZ3BnZElhbXEwV2xnellsRWRhK2piZDhHbHNLU3ZrS1BIbUZFVEN0?=
 =?utf-8?B?dzIzZE80dXhGdjA0T2h6T2kzSlRPdkhUaTNwVndJZmRQZEMrbW5nalRSVUhj?=
 =?utf-8?B?bFdBdkVpeU1Wd2J6bi9Gd2RCR1dxQXRzSHllN3ZQZXM0WVRoTmtaR2lBbmdo?=
 =?utf-8?B?MVRIWUdYYmZtVXVZMWpGdTVWejZEU1NXL2RkQzROT0padEZlYUlER2IzTjZt?=
 =?utf-8?B?VG4rcVpXR3JTbHRma3VJV2tYS0Zqdi91azJNL253R01NZUxXT2pLV1FlQlFs?=
 =?utf-8?B?Tk9QOTFrcUEyb2FxdjJmSnlYL0ZwaFd0YnVVSVFLTjdUMG0wYkI5OHFYR2o2?=
 =?utf-8?B?dlRyaXZNTThDcUZ1RFBMQjY4QUl6QzhOS01xb2lEaXFRL2QzY21vQkt5enMz?=
 =?utf-8?B?Q3lzOVVrbkxPckloYlNnRG5ITWZ6QWlPUUd3MFoxYlFka3BaemZEbXBSWWpL?=
 =?utf-8?B?K3hsNUdyTnMyWGRyeWszQjRKaXlpd0ptbDZHSzZwZHpnaXZmN0wwbjJKQTB0?=
 =?utf-8?B?VTZydWJOUzMyVEF6SFp0UUgwNTZTdXl4U3lRWkNRWUd6WXpPZ0NiYzd4SVFH?=
 =?utf-8?B?MHZGeHE1bVJEOXZzVUYyN0Z6WGRkT0t2Q3BTODBDdytFVitXd3RHLzloZThC?=
 =?utf-8?B?VGZWN1h5bjU2VXBYWW1zemZ4NVkxeWxJOUFiWktSTEtxQStSWElNQ0dmU0xt?=
 =?utf-8?B?TmV3VGhIblFmcWM4MDUyOU9qZ3VyNnFCRmV0TVB1SXJoTnE0SzdPNXJRaUdM?=
 =?utf-8?B?bVBkdzdnOWprUUxVSkZ3Vk0yWWZyd1c5ZnBMZkNmak9EQTNHMEhwTjlKdEhm?=
 =?utf-8?B?M3VUOFQ2cFNaR3dPa3F0dWpDdk4vRkhIdXMvZTI1NXFtd2RTd25zN1EwMGVG?=
 =?utf-8?B?VmhxNXd1WlUzMmZMaUo5R0YveVlodlVHSXJSQkVXbi9tT3ppVXdFekJVYWJB?=
 =?utf-8?B?ZWF5bDd5a3FueEJPS1YvZ0VaOUt5RG5OalhmZUY3M3lwb0lhVEtZSERxeGZ5?=
 =?utf-8?B?YnZqTXdNMVpFdHA2dmRuYi9KT0g3OWZNZkMrajVSVTM4aVVBOVVzeFQxODFB?=
 =?utf-8?B?TjY4MUV4a2plMHU4dHZqNlR2TGIrUW1LR3BoY2tEMFdQYjNrUG1NM1dQa21m?=
 =?utf-8?B?bmdBSHUzTENlUGxqWlAvU3JPRCt0M3FucGZvSndHVDBqR2JhczdPdHE5WG9O?=
 =?utf-8?B?dzlhZjhkRTNzSndpYTZFeEtDd2w4MVhSK3B4R2hDWHlTaUoraUM0SzdKajBa?=
 =?utf-8?B?amtSVFA5cGFBZTFuc2ZITlRraGoyRGdZejUvZ1Y2K1RCVUJkb1Y3aDV4bnQv?=
 =?utf-8?B?amhmTXFkOVp3d1BmZWdwcnphbk96akw4U2hHS3F1Zk1vWURnU0hPdnFnV0Z2?=
 =?utf-8?B?ZVNjNWF0UW5UL0NaNFRWZFk4ZlNCRWlPMlhTdHZYZmNUa29oZTJuakNRQWw1?=
 =?utf-8?B?biszQWUyZlBNNlRZTWpHdTVBZ0NjS1ducXZWdzJsT3cwNXFmY0wzWEZ4anFP?=
 =?utf-8?Q?rkCHVsfyNteHiF4j5WZxQUSPL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f1a11d-d24f-4a6b-3bd6-08da924327b6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 09:10:35.4783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEomDeTPfTreAkItoQYa+6OdcjUh7tWar+obn4OZCyojEtAJhF+C30H6eooF3yty3wwV2d1VQImjbb6WosO8mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4291

On 09.09.2022 11:04, Julien Grall wrote:
> Unrelated to this patch, but as this is your first Released-acked-by 
> tag, I wanted to check the policy going forward.
> 
>  From now, will any new patch need your approval before been merged?

It was my understanding (from past releases) that bug fixes would be
fine to go in without until code freeze (in 3 weeks as per the current
schedule).

Jan

