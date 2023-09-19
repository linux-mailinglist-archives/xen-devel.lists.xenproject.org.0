Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0297A6881
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 18:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604924.942477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qid9X-0000qp-PG; Tue, 19 Sep 2023 16:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604924.942477; Tue, 19 Sep 2023 16:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qid9X-0000o2-MX; Tue, 19 Sep 2023 16:00:43 +0000
Received: by outflank-mailman (input) for mailman id 604924;
 Tue, 19 Sep 2023 16:00:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qid9V-0000nw-BY
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 16:00:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad6add1b-5705-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 18:00:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8098.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 16:00:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 16:00:34 +0000
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
X-Inumbo-ID: ad6add1b-5705-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTAGPbKYryr/qXOrlKws9QpZa0rLR8tf6/33DWbXD+j9OeYo6170KFRnxV4prQ6ds5rf/CJUM2MnDlFk5Io8PydXesDMZs+MkFSLz8GDHHujFClremoxBSJjtUajkRVrdPam8bGFvGUJOAodGsq0dVsyVuW6moIPNXT5BGQt6902XxZKv2iQGflTqFbJm/jRlKNlb9d9vlYG451QvjbqQUbHwX45lp6W8iEyFPNOn30rfNNDjMCr2lH7zVcKkc3JsiHWnbKibbIJV2I+s0gRd9hDIaGMpr5M0YLmJcaupSvGpQjVPB0TiF9bIbnRR52hVg2b4Svcs1Oh2Scd6B+IdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GjCrAgWlyvI5Uvxzc0UklKUXmA77zIQqSDflY5FDbDo=;
 b=SXYMT14cEOYR1Y6bF3YJ0Ps0iWRZ8cGUgH3R4s87Y9ri+rO56YNiu9gP3LRvRFXVSo66SSllhMlqV7bFJKA2dk4SWdnYRInnQOaQqqAvEGRMgX5h6mCBLNwGwjCd9DcswzCfZQIW8/S8vDF2zipMMCb0pascKVL66RyNrAxJhHUZrgHgBOLuUqf6Vk8qmN2vJnZQvl/6PBto2dNvNterxqL+RMWJyxUKbn7IHVIlYZIk9351Qjp+85a1OUrMwckCRio6OU207J7Wn36lWnx6YcnNmex/rOpva121P/KW0mbtrixPk32muh+8uNOFRi24TYQxeHtT+ZmRQ2OXAW/nEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GjCrAgWlyvI5Uvxzc0UklKUXmA77zIQqSDflY5FDbDo=;
 b=yu0owtTYGNZ/IXtY9Q0anX8Qs6kF4SBGxe+JGLYI+SMzqsBggDBih7b7sTomrwi1acHWXBRZJ1MlCjw0WZ8XvwIIKavHNwFiw1/6I3jdw8BzKWzEV75dIECo/iPRmO/M9WFL+t86DaMfbAr0C13TWKEqWsW/RZAQjl0vE0P4RMp8Ij2tY8B92zwZVC3zTcB/iTNMPC/SjlPodtuLd94u5MRsl+c3umnd5+OgwcVLUqZGFuCu8tAhjCxoyOW1oYwtNuiKi8Pjx4qUVr79MgTYOChkmg/Ffv9GZgUqfUS/8GMnSwnyE9ixTydlKMgVwc9NaQyLfEl/6q0DuwueTh6j6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62c98f14-1559-16c9-f070-e3e6112a6dd4@suse.com>
Date: Tue, 19 Sep 2023 18:00:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: xl dmesg buffer too small for Xen 4.18?
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Chuck Zmudzinski <brchuckz@netscape.net>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b20bdc7e-4c07-4bde-b206-4142310211d4.ref@netscape.net>
 <b20bdc7e-4c07-4bde-b206-4142310211d4@netscape.net>
 <9baf6bec-49c6-474b-a5e3-5f0473aaffc7@netscape.net>
 <640f5a9d-913e-494b-b2c6-c9b3694f7cd3@xen.org>
 <ZQlHj5rjMaYj8Z4e@MacBookPdeRoger>
 <41a2cdf9-8fd1-418d-abc9-1fe4f3fd8b5e@xen.org>
 <232644f5-b0ad-414f-a4b5-03724f5ac053@netscape.net>
 <f40ce805-b6b7-46c5-87b2-3fe8c331072d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f40ce805-b6b7-46c5-87b2-3fe8c331072d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: fc9bb227-7368-4b76-f4a4-08dbb9298eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cv/NE9Yq3y0T9k+kfYHThqMz2Ifn6r+t8AZwYhe+hUGQZUk+cuMpF/aOgE1SYHcVtEUou4sTJKX6/phoni0SvXPvcj/jq5xGzwYr2Q/AwxouoRlQ9NbeD2os1zBwsfqbXsGlcBbSIGxYSd7fO0+aeieVzroQm4cEOuVTgjDbN1oR3Aso2Vd41liz6Agrwx4T/QKnOlUxMtj59gzYfe5wDlFe2T2cJ3NhVmD5GcIRF6cxMofq3DGTi3fqmt6YEjsAB+maGXBQGGUlu6exZXIIJSIMRrshUx4fhcZrwoyfLYoGSxgYJky61T5haS320DvjH+ugaH0csWVC2UFHflCByj/hg7gqizn4lRTnzceSsx3j7aAgYOE5i1nKF4va9ZXJPnuMzvy5ik0OAnSo5ho2dhH7GBetzJ0+zqJsgMdkWHKDvR9I9tzqkvCH6Lc/3xpriISECqzwsG8Q8psaIo5J/RKgx2qGPAM/0rAqX5LvMlxvsD7OKBRoMB7vgtX6zY0D9BEQp5duisRhV0SdzLIbaumw/36m1Imt2jrg2tivP+DwmK8ZQNV8g4pwO2ck48DJsHqZJWOwJsWxqhmIedJUXjEahvG3ZBM0E8eeACRwfC68UrcAaapKQYIn3sGyohaDcEvxOgsCMLzAdQ2SP4EaGpA+QtxF3lD6tSt4Ja4qR7QqkCWFTk+hKLRIxHsGPdaF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(39860400002)(346002)(376002)(186009)(1800799009)(451199024)(6512007)(83380400001)(2616005)(26005)(41300700001)(6916009)(316002)(66476007)(66556008)(66946007)(54906003)(5660300002)(8936002)(4326008)(8676002)(6486002)(53546011)(2906002)(478600001)(6506007)(966005)(31696002)(86362001)(36756003)(38100700002)(31686004)(160913001)(15963001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2I2UVorYXFZK2p5VldBU0pyeTlLYjBPeGFqVUlpbk9CTUJVV2F5MHczejVW?=
 =?utf-8?B?ckhQV096eHNNVU1DcUpyemVlU2RxQ29ld0szb1FYQmthQXcvcmQrOEhoYjVr?=
 =?utf-8?B?NVNOcG16MGd5TjBBTmpHM2dkcUZoNzByR2dzcDZldW4vbVk0ZzlidXdZUHJz?=
 =?utf-8?B?T0hIQko5R2NGemVoUWI5bFR3NG9xbVlCRlVoWXV5dzArMXg3dXR6VkhVdVBn?=
 =?utf-8?B?RDdIdi93MlBUbFk1Mi9LQTd4MDhVOVhXWnJlWVlxYnNZMXRadmJFYXZISE5u?=
 =?utf-8?B?RExRZnNzRVZKYms0NVE3S0t6ZGRGaFpEbUhVbG5NSzNkdzUxZjZzZk1FNjJG?=
 =?utf-8?B?ajRoRkZsQ2psOEVQNDBMYkJMU1hodXJHWWRoYTNKT2xRL2hJSHRuZU5QL2hH?=
 =?utf-8?B?RlhyZXdOeUZJUVFsWlg1MjJhTVQwTW5ZaDJpaGFnQnpCVlAvOXI3REJZbnIz?=
 =?utf-8?B?Q08zMVNPYjVTTk50ZmZ0NkplNU5hdkd0aUdRWXJ0b2RKY3RQV3Z5V1VURU1U?=
 =?utf-8?B?MjE0NmFyeDdtV3dDNnBRa1I5ZjIxY3ErVzZuNWlsUjBkSVpud3pSa29MZkw2?=
 =?utf-8?B?dVFhQ1k0NmYzOHBac3BpWFpINDZKN3dQZ0tuWWF1MUtmdkpicDdGYnQ1RlZs?=
 =?utf-8?B?SWQ2TVhWcDUxeWpQcjdUOTlyd1RBK1ZqVWZXN1M2MWs4bEJ3NGRpK1pGSE9n?=
 =?utf-8?B?MzRsZ2x5UWdhV1NSR3l2dnVqTWFhdk9DaWlWWTJvNW85NitDTThSVmdtckJQ?=
 =?utf-8?B?NmpkdmNPTlMzZFVmdnVCbERLdjZzVFhpM3pPWFpHKzNmSkJSK3NrSm9uOTM3?=
 =?utf-8?B?MEFPeFprQ3dIamdsb0dQdEFGQnh3YkV1Vkc2RHNZTmduWTVaeWtRWk8yUklU?=
 =?utf-8?B?QWIwcDVxbVdSQSsvclBxdXloNlVBT1VkaEprZ1hYNE8zT0V1aWpWckd4OE9Y?=
 =?utf-8?B?em9WdzBXOGNrU0RYa2g2SlJxa2l5cFFlb3U5YndyMjR1Y2cyaXdVUXRxUTNh?=
 =?utf-8?B?UXc2VDVxb1lWdDNrTWVydUI0MlIwNWRFNHR3K1RHY0pmanJkWENLOFp4WDFN?=
 =?utf-8?B?VzY0RG9ERlV6RHpsL3pYamoyd0NHd0hoc3BoV1FWbTNRQ2lBVW9vdkN0c2h5?=
 =?utf-8?B?ZEVkVnkrd0RlZTRDa0JVM2QxWitETHBIaThZTlhyZktBTFlKNzhZV3hmRE53?=
 =?utf-8?B?bE5hV3VuWVdkdWptVFJpU3lMeG9mVTBZdHFBaXBaQWplVnc2TVZZZExCeWdN?=
 =?utf-8?B?NFNsY003Z0ZGeXRmMk5YWVQxczVxUWdXZGNyU1g1U1pMTW5BUGtTd3M1UFF5?=
 =?utf-8?B?bU9teHdrTkVnTWpsdU9VNzhPVlRKYkdMWVo1VktMSFpZbHVSd0JsaTFwcjVr?=
 =?utf-8?B?MEs0bUVDWHFvdktpdktGQ1V2NVpMTTNMenRTRE4zZkNMemdJaXR1ajF2Vm5M?=
 =?utf-8?B?bmJzNWRwQ1RYNzBwNDJjMzlBSm01SE5ZN0N2NW1LbnFvVjhXWDIrOWhVTGY0?=
 =?utf-8?B?NkNGamoyYVpZNzJ2TFQ0eHU2VWxzbDNUbVBJdlpadXN0TldxbzlpYmEyaksz?=
 =?utf-8?B?RUdJdHJYY3BPODNUWG51aWhWRDNiaDRaWE5QWkg1eWpwOTA5TzZNVFl3V3V5?=
 =?utf-8?B?bkhwL2pzc0xUU3BwVnRxRXZ1YlczQTMxMXJtak9tb3kzYTJlNXBsS0FFQTZ4?=
 =?utf-8?B?cElnd1RlMVh1N3luMFBZNllVeWRUaWVDWWFqc0IyZzdVczRCRVBOQnhhak5K?=
 =?utf-8?B?WHRteFpJVDBYekNtdUlmby93YlRISkZEV1g4Z3loQURhTjRHMnhoQjF1RnhZ?=
 =?utf-8?B?SHpGalZFbXFubVZJWFJQbUVjWmlzYkRod0ZEaTNzbDNxcU5NczNDT0dWY2tO?=
 =?utf-8?B?UkRxUGl5RC9YTk1nT3J0SVBRc09TMG15UFI3Um5Ca1JUaExicGVaSWc2YVcz?=
 =?utf-8?B?cXNDbEZDVWpJVkZmRWo5OTdkeCt0NjNUK2NjdkJ0Ui9LS1NLRVYyV3Q4UDQ4?=
 =?utf-8?B?bGJWRVVBOXllMmxzaWJwc1EwY2JIK1hkVmF0M2tZS0ZHQVk3RHhQZDdCcXNY?=
 =?utf-8?B?RXJweTNVbDFSQ1BwMlprdVpCQ29FelNwMmRvV2p0MDJaejlPZEpTRiswZGsv?=
 =?utf-8?Q?UavfOIx3O0v3rsYawuZUds6I5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc9bb227-7368-4b76-f4a4-08dbb9298eec
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 16:00:34.6828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NQWZNzr49GM9omwx586/nRjvTUYzy2SIXwD/1vya9LVZFW0xtMiW0cPtIrOmbcLSBF//l/FPWxqqLcGN/MXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8098

On 19.09.2023 17:56, Julien Grall wrote:
> On 19/09/2023 16:09, Chuck Zmudzinski wrote:
>> On 9/19/2023 8:10 AM, Julien Grall wrote:
>>> On 19/09/2023 08:02, Roger Pau Monné wrote:
>>>> On Mon, Sep 18, 2023 at 07:49:26PM +0100, Julien Grall wrote:
>>>>> (+Roger and moving to xen-devel)
>>>>> On 18/09/2023 19:17, Chuck Zmudzinski wrote:
>>>>>> On 9/18/2023 9:00 AM, Chuck Zmudzinski wrote:
>>>>>>> I tested Xen 4.18~rc0 on Alma Linux 9 and my first tests indicate it works fine for starting the guests I manage but I notice that immediately after boot and with only dom0 running on the system, I get:
>>>>>>>
>>>>>>> [user@Malmalinux ~]$ sudo xl dmesg
>>>>>>> 00bee72000-00000bee72fff type=7 attr=000000000000000f
>>>>>>> (XEN)  00000bee73000-00000bef49fff type=4 attr=000000000000000f
>>>>>>> (XEN)  00000bef4a000-00000bef4bfff type=7 attr=000000000000000f
>>>>>>> (XEN)  00000bef4c000-00000befbafff type=4 attr=000000000000000f
>>>>>>> (XEN)  00000befbb000-00000befbbfff type=7 attr=000000000000000f
>>>>>>> ...
>>>>>>>
>>>>>>> I have noticed the buffer fills up quickly on earlier Xen versions, but never have I seen it fill up during boot and with only dom0 running.
>>>>>>>
>>>>>>> Can increasing the buffer fix this? How would one do that?
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>
>>>>>> I see the setting is the command line option conring_size:
>>>>>>
>>>>>> https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#conring_size
>>>>>>
>>>>>> The default is 16k, I tried 48k and that was big enough to capture all the messages at boot for 4.18 rc0. This is probably not an issue if the release candidate is being more verbose than the actual release will be. But if the release is still this verbose, maybe the default of 16k should be increased.
>>>>>
>>>>> Thanks for the report. This remind me the series [1] from Roger which tries
>>>>> to increase the default size to 32K. @Roger, I am wondering if we should
>>>>> revive it?
>>>>
>>>> I think the relevant patch (2/2) will still apply as-is, it's just a
>>>> Kconfig one line change.  I'm however thinking it might be better to
>>>> bump it even further, to 128K.  From a system point of view it's still
>>>> a very small amount of memory.
>>>
>>> I don't have a strong opinion about 128K vs 32K.
>>
>> I am sure 32k will be big enough on my system, and based on Jan's comment
>> about release builds being less verbose, the current default of 16k may
>> still work on my system once the release is out. 
> 
> I think it is quite (actually more) important to capture all the logs 
> even in non-release build. So it would makes sense to increase the 
> buffer to 32KB.
> 
> An alternative option would be to have a different limit for debug and 
> production build. Not sure what the others thinks.

I would certainly like a two-way default better than the uniform bumping
to 128k.

Jan

