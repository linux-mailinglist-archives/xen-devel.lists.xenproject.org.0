Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C60F4CBDA7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 13:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283286.482262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkVA-0000tE-7Q; Thu, 03 Mar 2022 12:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283286.482262; Thu, 03 Mar 2022 12:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPkVA-0000qw-3E; Thu, 03 Mar 2022 12:24:12 +0000
Received: by outflank-mailman (input) for mailman id 283286;
 Thu, 03 Mar 2022 12:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPkV8-0000qq-FZ
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 12:24:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3525e2f-9aec-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 13:24:09 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-wECz8OxLNNSaZc7Pvfne0Q-1; Thu, 03 Mar 2022 13:24:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5386.eurprd04.prod.outlook.com (2603:10a6:10:81::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 12:24:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 12:24:05 +0000
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
X-Inumbo-ID: d3525e2f-9aec-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646310248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YJoEDkTZkuyQsVzjxbobMx52E/VrmcDk4QS4gEuUAvg=;
	b=NnLv5Xnu5xF2di2HX5ZM42Al5P0mrkCQlLGZ0rMclKhxp8k2vRQ3BQXIEIJK8QKQ64QGiE
	+s0VQKVlxHGvQTZ4Rl2+RhPU1rQCqr0+mENpqBXYaOskZ7bO0DySnagSYogR8fvyYPb6u0
	rSdYMBMueBYYLvQ0VjrngbI7iuoPASI=
X-MC-Unique: wECz8OxLNNSaZc7Pvfne0Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fyGeIaGUOvSRcyMQVyFMNJ8Lz+KtuT9IoD4Eh5EihNFlF+dfhzlYG/LZPTd3Zu73iuvQcl3EPGPB6SS9mI1d9SSPPvijL15P9MZgK1A9HioUnZyTK0Cc2pKdRZ8nAabG+78WZGLY46U6P7JrPxmtf4Hus6vOrEOAjIdp7GUojOs8mHlTBgYPcYaI8+NT9GkFnqlySY68V5L9oN9C2PeaL2966BEBTL+VFAnGT/FVZ1HVX5yXs4spVvWgjQmKo94V72A3pNvkFZX7kvvG7SUe1GUf1zqqs3la4zgQatRL3j9m7gsxI1atfzK9TFk26HfXFKggbO9Mgc3wvEh7TTCsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJoEDkTZkuyQsVzjxbobMx52E/VrmcDk4QS4gEuUAvg=;
 b=hLe5dcoRl959UehKLTzNuKfx/zjN5zZbGCdiaPT5pKpWZ1DmyDJCzTt+0LdvDkFFp/Yd2kaBhFunJUxYw0Nusr1hioNH4ILLXMDagCneBOdYU3M+Y8smWFza9zMP/Uc6jbVIdHUbtBHwek+nATkSF10iVW7/fmBc/vCG1c68wPoouKSH7KxycwK2hjJV+GhGUn0Ux+8gT/xK8MYonoMK4KnYL7dTUZsvx2ifdOJgWg38kYf0sFy+iVydJDlTE7HsM9+Gm2ctudMOQWyJD4uTBKsGg6h04uqerQKVa9exz/zBLD0RhVpA+tE7yJM2vBe5AUv14sKlCV6NWkElRhYpIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16546d42-900b-1548-fdff-79ba21716384@suse.com>
Date: Thu, 3 Mar 2022 13:24:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/tboot: adjust Kconfig default
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Mateusz_M=c3=b3wka?= <mateusz.mowka@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>
References: <fae0a082-8b39-9bd1-0ed3-35a660d704e8@suse.com>
 <18472660-3438-5c77-05c6-148b97bf4725@apertussolutions.com>
 <9d57dc89-779b-aa91-519d-3e4cfc05ef94@suse.com>
 <b6a19025-ed0b-1698-b46f-0ff726254e96@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b6a19025-ed0b-1698-b46f-0ff726254e96@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0049.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b2895d2-9605-4719-b82b-08d9fd10b598
X-MS-TrafficTypeDiagnostic: DB7PR04MB5386:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB5386A77147C39E6015118CB6B3049@DB7PR04MB5386.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dg0dxkRqMbKJDXhp29ah23TmzesppJMOORwaHFCpDp5VWYDATlIS1BOLx1+w/t3xNiBBi1WnVtWb746oVbaYefGrOcIe5a6TWdnhp+rvhBLSlA0ehua6iufjhExus3eG+XTjqITzrCWrjOkmUPmAi1eZlhR1ApLdzWNjKaQA0j0H3wqwJFQeHv/aC/k6pdrw3Ih+oem8cpcynUI+oM/NRO/OPNKtnhlprzZcnmGogwFkvvbLiWwAC3ANA+oNWq8nW0FqPft46Vji7PmGaOVR+YmgUBx2UDS6yp8L4QBmcqcR3hePB250BkipKVkGJ8b2Z2r0XeFE3c0iw0ZEP+9IHdEFsfjcP/oQ/AMQ9SGUdryLCM8DIEfd3sBxrGn2yK3qZ2SRL0gbrLfBPcbEVUmAdws/SVZdAxZcMRs2oxQdHhqR0uUP8ufP13iITl39hS6LLd+BGMUlZdj+RQPgtmcRLC4bw8pd2teuJz7NGTDYp1AWCbNLsu9i2iWCuv6jcgCzegSaz4FuPmQke2V807WAMH6RXScj3+JR2Kjf9l3qNdTmHFn8MTSWiXsdKZ3pCo3hYCYVP2K3cTfa3BLU/PW1UF4UVStzUQ/Yw+5z2W4rymxz1miCMhPjCfTNlPPyobsqp7pLIkzy/7I9znOzMovLVl/uxbtLwf7/pLkYcsbLUnm7vLZnEXgjcIPgcSbwoIMaH9jTdW0llOE3WQpd0gqNKMqmtnAwdeLEp0vIpNbzc0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(6486002)(36756003)(2906002)(83380400001)(31686004)(38100700002)(508600001)(8936002)(54906003)(2616005)(316002)(186003)(26005)(6916009)(5660300002)(4326008)(6506007)(8676002)(6512007)(66946007)(66556008)(66476007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SitSWFFyYktrV050UWFqQVJOQlFrbzRyT0JZbkZXWFVVY3BjNGNzREdIV3Zj?=
 =?utf-8?B?VnZPQ0hVT083WEFpc20zdFZzbDgydGFPYVRJTEhGQVJlN3c5V2pjdWozYWdo?=
 =?utf-8?B?cE9xNGgrcjdNVkI0SEhhZDRkSnozV280UHZERHFOL1J0TnBCU3dxY3E2KzZ6?=
 =?utf-8?B?MGhodjI2MmI0QXd2c1J5bHpHQmV4MU1DWlNIUTlSb0JwSUF4bzRMdlRhRkdC?=
 =?utf-8?B?azcrRU8vU0luVWZPdlRsQUdzNUhCSDdxb2xvMWZBcTkwMGcyZmpPUE1JZDNY?=
 =?utf-8?B?QWoyWW9PekFMV2JDRWp1WUVnQzVxZDRFWjhRM2x1MkRjTll6VDdveVV0c01O?=
 =?utf-8?B?SjBTY01mckNpU2xRemRCZ0dmdmlzZm9jNjJqSVU4QjI1TmZ3bWtKZkF3RzFv?=
 =?utf-8?B?eEdVZlBiQlAzUks3d29uOHNra2NMOUYxYjkwMkNKV2k4YnR5aUo5OUlJeTg4?=
 =?utf-8?B?TzBMVC9GUVV3L1ZQZUE2NGJ3QUZrQ2d5Q096Z2Uyc2RYeWVUOGlYUDllSUJK?=
 =?utf-8?B?ZWFlS3Zrc2NQRGQvY3FpNFFtUjBjT1pFTmF1T3pKWVBTc2ZZMmNjL2pIYjR5?=
 =?utf-8?B?TWZqSXBzSEZrUk94VGZhcTNzaE1jaUdDNkFNaUJUNWFhdkMzVzVZbnlGS0E4?=
 =?utf-8?B?bUVjU09tcTBTRHY4VCtYVGo3MHRkamwzV3k0YlFIZWg2ZStRbSttL09sekcy?=
 =?utf-8?B?N3RlWVc4M3RyemNhSnZMTFA1dWx3VWx6UlJLKy81OHpZaXRURlh4T3FCTEdy?=
 =?utf-8?B?dDdFSHh5QXBNQ3FZVytKUDJEczFiN3ByMWgzWGFLVDRPOHVacVNJUTBvY2w0?=
 =?utf-8?B?VldOK2Fvdk55eVUwaW5rUWxGNElmVjlrckcxNThYTWlQQ1ROckV0NVdTS3dP?=
 =?utf-8?B?d0lZRUM2OUZxUmFORVlrNExMUGp0V2lnV09HUlhlek95eHdCVkNTbllVenJG?=
 =?utf-8?B?dEJhdmNKdm5QSmhXZFlQUERsNWtibGhJVThIVFJWVDhWUEJkYmF1UzM4MzBt?=
 =?utf-8?B?ZkFCUmUzSGFuZFo4RWdLK0dtRFdmV3A4OEpWYkhUMWkwc293Wk0zQkxKem1K?=
 =?utf-8?B?T1c4bk9oNGNLMWRFcDIxUVNCTW5OMEVGakVTOFpWZUdMWTJaOVRVN2tIanNH?=
 =?utf-8?B?Ync1SXBPNFJ0QjkveitGU0pwcGQvcyszMkFjaWVXRlgxdGwwK3RINDhRVkwv?=
 =?utf-8?B?MGhlM0RxSGt3czQ5cmJ6N0RnSnJLRTV2SHUwK1J6a1J6Y05NQWN0NWFWazYv?=
 =?utf-8?B?RU4zUCtkTDJ6ZW56VFdiem1jd0ZxS2VESEJQdTFJK1N0NGUwNUZzeVdXMFUw?=
 =?utf-8?B?c3hNUkdoSnJTMi9oemVreE55cXNCc3VTQytpejVEMkUxWk80SWNCd2tQVU1X?=
 =?utf-8?B?MHFCRHdYTFh6L3dhWkVQOCtQbzlIMWNIQlgwMHpDOXdVanF0N1FjSXZ4THll?=
 =?utf-8?B?VkNKeTBVb2VwN0duWmozMTJLRktKYzNxNDJQYXpadm9ZWDh4S2VhdU5ud05D?=
 =?utf-8?B?a3hPeFBDVXI3ZkpmRVRsa1JzN0dYRENSU2xQc1YzT05zclBrTmhuczM5elBz?=
 =?utf-8?B?NUE5a1pGMVJoYytRc01HUXZrM3lGR24wSVdTMEh2enY4QTF5TjNoNFJQczF0?=
 =?utf-8?B?ZHoxTmtHejVsSFBXVll1eWpkcHRsRTN2Ni8yWGVFVTI4VVg2am1ocUtTak1m?=
 =?utf-8?B?b0d3bEJjU3RPSGYxUFlIU29XL0MrL0d2Yk5TUnR6dzVWY1B6MXFaQzRsakxB?=
 =?utf-8?B?OUdyVGlEOFIvL050QXY0eEhlR0tmYUhGelZqeVRvcmZZaFR5eVdhU1Q1b3N6?=
 =?utf-8?B?MnhzbEtnV0dDY0J4dlhpTTg3VEN4NWluTks4OWtCRW9TZnI1OUVmc0cxNGNm?=
 =?utf-8?B?emNWZlVrbHVYMWQ1MFRkUitzTitvTHoyc08xOE9lS1kyOEpodEdsWm9Ra0Jk?=
 =?utf-8?B?cTBzSWFHeWQ2V2pvdjgrekJjU3QxYi9TQUNNS3p0M1lJcHI0S3ViTjJRQVpp?=
 =?utf-8?B?OHFxOTJ5VktSUUE2dEdsRXVEeTVublZ4aWhCeE9xRVVTMEIvOEpiQ2poYXc3?=
 =?utf-8?B?QlEyUFViZ0ZzUEgzZGdya0VRTVBGRmIzM2JVT1ZqSHNrZWNsWFdxL1IraFF4?=
 =?utf-8?B?UXNPcWM3T1d0cnNDVHhnS0hybHczMTZDb3hzUUpjMG5EaHZIUFlnM2crdlQ2?=
 =?utf-8?Q?UMTKuKlZX4E/g2UIkn5bgNs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2895d2-9605-4719-b82b-08d9fd10b598
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 12:24:05.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ileclo9w435qRDtOD52/1KO4jE0Tp2TPNQLdvDbYf1YkhCZxtX9v7WwWkRRRO8ECJbBz1XJz8PS0fD4qbCKYAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5386

On 03.03.2022 13:16, Daniel P. Smith wrote:
> 
> On 3/3/22 07:03, Jan Beulich wrote:
>> On 03.03.2022 12:50, Daniel P. Smith wrote:
>>> On 3/3/22 04:49, Jan Beulich wrote:
>>>> We shouldn't include unsupported code by default, with not even a means
>>>> for its building to be disabled. Convert the dependency from merely
>>>> affecting the prompt's visibility to a real one.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> We could of course go further and make the default also account for
>>>> DEBUG, as is done elsewhere.
>>>
>>> As in you would like to adjust the default based on whether DEBUG is on
>>> or not? I guess my question is what motivation is there to adjust this
>>> selection if DEBUG is enabled or disabled?
>>
>> This is to have functionality enabled unless overridden in debug builds.
> 
> Maybe I am misunderstanding you. If I am wanting to debug either TXT or 
> a configuration with TXT on and I adjust my config to turn on debug, 
> then I would have to go turn TXT back on. Is that correct? If that is 
> the correct understanding, honestly that concerns me because if that is 
> being done for other config options, it would create the situation where 
> turning on debug to track down an issue would result in a different 
> configuration than the one I was experiencing the issue.

In the scenario that you describe (aiui), the default setting wouldn't
make a difference: If you alter an existing .config by turning on DEBUG,
the .config's existing TBOOT setting wouldn't change. Defaults matter
only for items which have no values recorded yet. Plus - I'm suggesting
to turn the option _on_ by default when DEBUG=y, not off.

Jan


