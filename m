Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6810682819
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:06:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487445.755053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMma6-0001mF-5S; Tue, 31 Jan 2023 09:05:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487445.755053; Tue, 31 Jan 2023 09:05:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMma6-0001kL-2b; Tue, 31 Jan 2023 09:05:34 +0000
Received: by outflank-mailman (input) for mailman id 487445;
 Tue, 31 Jan 2023 09:05:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nz19=54=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pMma4-0001kF-G2
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:05:32 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2088.outbound.protection.outlook.com [40.107.13.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ad3ef1-a146-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 10:05:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8366.eurprd04.prod.outlook.com (2603:10a6:102:1be::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 09:05:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:05:29 +0000
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
X-Inumbo-ID: 69ad3ef1-a146-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bqqQSxLvoyU8bLA3jQFW/+tbYaxU+N75YQ4o2c18ZCGYCrvOv5OY5NMK+Y6i/oeQ0k+U5daPh+91vQtLZ1t74RbenTrsHqAz/CyPKreynQGfpG/c63Nb4RoHpVJqAw57G0IuUct9W7aOLlmWe1PfLPtUK/rsV97WDop6MrfsAJdNj9V5NHI8x10yZYC42ydWZQWYSsuy1YK/rGZGTAUtsXcDzp4OcuDDtIcdWWrINAosM/ZJ+ikaZk0LMk4DAZKdLvjTGzUqlzKgFtX7HTN5CvvkrpqtHPfGuGrctnqvsjfrqrW2H1xEG4DY7ZNcb9w0vyMVDQP2Pw397Dx8qDv/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lchttXlb5td7/Pv+1xrYNwaTzv15GP55gP8SAkuZPME=;
 b=niptkvmsQlQs+s392BU8HXfW/cVW6cIvjTx3535F5eUw+u9KMlnUnhjtD3D2BAzbCrvixHJ73UqOQN1n0tQAa7++vt/v+BAAw67L4RIf3zONTQq7SQMmJuEdRblHuk7bmtZ95DhchVo3ydVwhSgnmLqMjSOOJOsZAQmQPj2ieiBUXcF+V6uBEHOfZmIoFXkhc2yLGCtldZH3IipFzm0kuW/hDIyx7BdO8RP1hAfptRFiJUFfqqGCduGE9vwhGA8XvnuOjSXJ7JE402d7MGh8rAOuvK0C8lCev+8wgYlj8jw7bj3SnbYZMMS/HfZvzxZh14JQZB7k/YQZfWf5zdJz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lchttXlb5td7/Pv+1xrYNwaTzv15GP55gP8SAkuZPME=;
 b=5i8HLUIg+dJhiq/rqGtd5kKY9ZyahVkybItgdK8ETS7LcamwsDn+QF1/We1kq12KvOFa4QlBVe8OsamQwm56uWFahrEHFdy/DtzY01KrTMty3wRZn5YDDEfDjTwAWdMEus7IWdRT0F3EtTUEpqHHYWp+RoulXp7duqzjDBVm9omxEKDCDHUW9JlUFcBH4AIyl8dflAkXueFPQIJP9e55hy3rL3qr6S2pLOkJjg14yGh+8GvYeEDXqJ91UTmy/8BI0bsUdRs45ysqPNLucapsKU+A6rTOrDs+nYOuUInSeVcPV0LBX7SmrgOlOQaLPZ8qxG5T4Yhdj1OLej7/ApCoXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <29687fb9-eeaa-4501-61aa-3a3e3cbbf156@suse.com>
Date: Tue, 31 Jan 2023 10:05:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: idle domains don't have a domain-page mapcache
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
 <2edca838-2616-7434-62d7-a69dd9e00797@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2edca838-2616-7434-62d7-a69dd9e00797@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 84dfe13b-ed46-43f7-90ec-08db036a4c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MwdP/4Q5ZgzOyDJtp41FHraO0YpYoT+gEfy/HlDRG5IgJJN3qFEHiLFlX2ulySorlPQovZ4m8aRdB6U4ZzHYNplGWcQGMiGhBuIXtIZmQDeMEcuzJjBMvfsL5lKqn2XzedHYWtJ7YH487vYcPMbbgSgpb8Atmeey4L9vjjxmcMMwsa1K9NptZ+jdhbpoj9di3epklfFHaEfTvzmX/0d5p9hKcIrCw4IvJcG0icgCjFnMsCMpDe/JrleYVjHDosXoTDY0fFvnTfM182Sg6Q1aVJP+/WO3caH4ZKk1mmN4C6pug3IulDOR5RqGrnDLhsfWJd6RlRyxOW25qKxrsVPY5vA11DC5gT7sksUBWi4xh7vKArmg76qzQEMD6c7F/ijuWC03gGAOtlb68WDLReqsB1xC4pJ3EM/nUGY+JN8FYM6YT30qv9b70lrWjquuRIc6OxRCVsY4hz9ma7BNUIAwoJl/ApTDr5MKaG5Bay7A4ie3/RKwgak6hHaJZY+14TP7J0VYk2jPGHp/h1KOEKN3L2lDIUAHdiDjKeK88Wb5iP6sfnTJJvcFgrOA42cL+Vho2uamgclJw7SBqU4yAQFQ54uwtKX0fGJnF+AkTeK3fK7KXPcD21wQt0WgVOOSy0nGDZaKuu5mpmE9oNOk20GouW6G1VEafr8m3BAdYr7LKoHPekjXtNaA3xCDLJR9DKknGieoqWYTlf8/P2CEJ27EXvx0ZQEORSdn81WD2Jxitj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(2906002)(31686004)(186003)(26005)(478600001)(6512007)(316002)(6486002)(54906003)(86362001)(36756003)(66476007)(31696002)(38100700002)(6916009)(4326008)(66946007)(8676002)(8936002)(66556008)(53546011)(5660300002)(41300700001)(6506007)(2616005)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlZPbXhhaG1lREIxSEFhNjYrc1hOL3oxRTBOU1A5MllOcFdWRzJ0cCtjREZK?=
 =?utf-8?B?VExoWjJQZjZpaW1qdE5YN3F4VXhMUjdhTlErL0Q0eFNXemNseklrNUxCU2Jj?=
 =?utf-8?B?cXExY0RLVzl3aGREV2J0ZWFPaVM0OUNFUlFSYldNQ1laT0Nld0xrbmFCRGhs?=
 =?utf-8?B?STZPUzZCY1A1Vlc0VTJDMHViY09MVERtMTFZdFpORmU2ZVRmTFlYQ29IYXNE?=
 =?utf-8?B?REtkRHg4YlZLb2U1Yis3M0R2dXlUMEVuV3FXMk4zNFI3b2hjU1BlYS9Cb3c1?=
 =?utf-8?B?T1B2emQxUzBuYXh1bDNPRXNFYldRb05Hc0xobk1hZ25uZVBYOW82RTVLcTNl?=
 =?utf-8?B?RGtQVURwT0NmbHo3bHZjbDZjdWJmWTM3S3prSkFwVnBEQnloMzlpTnNmcTVJ?=
 =?utf-8?B?SFZONWVscnZETFFWdExvSlRZLzZoY25zc1g4aHVVV3J0TUlTRWt0ZTFmclc4?=
 =?utf-8?B?MWFVZXBNc0Rva1BsNTJNR0xPUVJUek4yT3ZlaE9QZkU1QjdCdGZSUmN2bDJG?=
 =?utf-8?B?ejAzUy9XOGw2SHA2RHVONllRNzh1dWdrTTluTEhuTVk2a0pRWmd4clVwN3dP?=
 =?utf-8?B?Ui84SFR4ckZBeHd5Sk1lbWdSTEhxeWFBUWk4UmFsNVVoRHcyT0JPUHZ1Mm1Y?=
 =?utf-8?B?RGtYS3N4ajBzaDRjc21MbXljNzhqZEVHTG9lZlljM2RxWDZyTUo3ZThRN1Zs?=
 =?utf-8?B?dE15S3JRRFdpK1RNcHpXY0F1NnlkRk5zMWtmWXF5dDRXalFJSVNwbkF4K3Ar?=
 =?utf-8?B?NW5hTjFEbGlyUFlKUlcvcnhLZHZ5ZUw3cVRZbDlpL0VlNjR1aVZsQ1NlWEtl?=
 =?utf-8?B?WHJoWG54NmFZZE50SlFyaEtxVlVVMXp2UzlmQ0YzN1pGcnhqMitqQzF6MWZj?=
 =?utf-8?B?OURwaE5wVUg3eGtrc01wSWFJdlZQQWx4UzlqQUpuaGhRWXlsLzVRcVJ4UGlZ?=
 =?utf-8?B?M1pzdkJtUkZ1eFBUQnNXZVh4RE44blMwVnRrd3lOV0ltWFVnVWlLWnFUdFNi?=
 =?utf-8?B?aENOakFJZDFFODhFWFBnOS9VM1Fjc0pSUWYwUlpQWHhnSVZscVR2NzFTamhE?=
 =?utf-8?B?aW52WXBNYlBUYUFsMXpOWUZ5alB5VnZpczQ2djRncHcwd2hGZTdZVU9xYkdS?=
 =?utf-8?B?UG8ycTdrZzlXUmxVRlVwOE1wcElqMUUvaWRoK3haTGtFanhFN05neUp1cGcv?=
 =?utf-8?B?aDBBdE9rbGphSk1maisxU2FDRi94YkRGWXI0SG9QWUF3TGFCeUZBbCtwS0dL?=
 =?utf-8?B?U0p1enpsOGFOamh5MTZKSkNlciswZ1ZjY1RZaWtZWEQvSmEzTUxFV1V5Lzlz?=
 =?utf-8?B?Y0xPZzhOcmJoVU9SRFV3L1FBRXlTWmF6RVErUkR3cWpONWg0ZTBkMGRpMTls?=
 =?utf-8?B?NGhONm9kZjYzd1pQWEt2TUErOWVySkZmUDBqR1hqSm5NT3plN1FUbmZJUWxm?=
 =?utf-8?B?cEdpbENFeHZvcm5LamNVRy9Jc0JnRnZRYXRUb1RSOFh2cFRtNkhmbDNwbTNG?=
 =?utf-8?B?MnRsOGxjWXI4KzRYRENhQnFMNDlFbnJiT2Z1dGNaQXB4K2o5NlRNN0h6akla?=
 =?utf-8?B?Q21lRm9IRXhaTDJueHJPMElRM3gvcEpjK0t3TE1NTDVIRHprRURISk9VT1Qy?=
 =?utf-8?B?WTNnM1FPQTN6VXUwWUd1VG5sTGhja2JSckZLTEE1cVAwNmtML3JTQ2hnRVFu?=
 =?utf-8?B?OWJIc2VxdkVWWk1TcjVvUlQ4dXR4M2Y5aEd2MmpzY2QyUmdPbFFnblE1ekVr?=
 =?utf-8?B?NkQveGpSWHFOQXhMb2JsTjJhekphZkY0VWZCalVpRU5uSlc3ejVhNUVKT1lU?=
 =?utf-8?B?ZzJ6ck9KMWpWNDB2WVRLOWdVQkNiVS9ldFJuV2lWL1VDdEZUdzFORkJXYk9Y?=
 =?utf-8?B?Zkd3SXdERE1KK3k3YXJINE51VUlPek9OU2NlTnF5cUl0MDFlUXdwdTVZRVdv?=
 =?utf-8?B?TzZPcTBlZFVkeU5VYS9GbzYvTXd6NHdYZmw4RkhDR3NDSzlVaGgvNXFDQWVC?=
 =?utf-8?B?UDBKWkxVMzU5cXljSlg4c1ZPZkdDTmx0WkVxUitUYlpYSUtnQnRsQlpPS1Y1?=
 =?utf-8?B?NmZpb01vaXJQd01OU1VQcnhKa0M5dGtjUUYyZ054TWp5SWl3NHAvNzJ6YzZn?=
 =?utf-8?Q?U/+mIljIsL13XygnyT4+gPGBN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84dfe13b-ed46-43f7-90ec-08db036a4c95
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:05:29.0906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DELQWzp2VxJLpErXRC9hpiWAKFHP8SCd7aZUln4ofD0QMe1HjZFCTYbP1u39EWGFxfA6BTeUin45OlJx7W57tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8366

On 30.01.2023 20:00, Julien Grall wrote:
> On 05/01/2023 11:09, Jan Beulich wrote:
>> --- a/xen/arch/x86/domain_page.c
>> +++ b/xen/arch/x86/domain_page.c
>> @@ -28,8 +28,11 @@ static inline struct vcpu *mapcache_curr
>>       /*
>>        * When current isn't properly set up yet, this is equivalent to
>>        * running in an idle vCPU (callers must check for NULL).
>> +     *
>> +     * Non-PV domains don't have any mapcache.  For idle domains (which
>> +     * appear to be PV but also have no mapcache) see below.
>>        */
>> -    if ( !v )
>> +    if ( !v || !is_pv_vcpu(v) )
>>           return NULL;
> 
> I am trying to figure out the implication on this change with my patch 
> [1]. Is this expected to go before hand?

The change here may not be necessary at all with your change. The main
reason I sent this patch was to augment my comments on your patch. If
yours gets adjusted to account for the (perhaps just theoretical) issues
(if just theoretical, then description adjustments may be all that's
needed), then I may be able to drop this instead of seeing whether I can
convince myself that some / all of Andrew's requests can actually safely
be fulfilled.

Jan

