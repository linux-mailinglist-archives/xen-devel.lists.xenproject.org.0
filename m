Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE76E4A51
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 15:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522127.811314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPE0-0000vH-RS; Mon, 17 Apr 2023 13:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522127.811314; Mon, 17 Apr 2023 13:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poPE0-0000to-Oc; Mon, 17 Apr 2023 13:48:56 +0000
Received: by outflank-mailman (input) for mailman id 522127;
 Mon, 17 Apr 2023 13:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poPDz-0000tg-45
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 13:48:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9764f684-dd26-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 15:48:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7636.eurprd04.prod.outlook.com (2603:10a6:20b:281::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 13:48:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 13:48:25 +0000
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
X-Inumbo-ID: 9764f684-dd26-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMFd10JHwOy9ErWL/PJuQ9WjiekFlTH77/OueyZrzFDMop/5ggiVh7R64NKo17Xby44PYOkuPRErJ+xbbnDGSBm+wJ3dD1hF9Gohq0f92oD7Kt5RRe17J4vntN1EeqXpzlStN/ihiu+78jHwuijK13FO9LtY8IG0pnbUm4fop8Oe4KROvgZmwViHWM7r2IP7b/gtwsx05mUJrxkRnNdMl7vdJxOnydVUaYktQULU9BSNc4DUK0/mRqShszv+WathKReuM4vuafyT4ha277zIJdZAkgetwgNKT+IDy5faE2EHli1btrNVQjI/qonBeqAVCuDk+ok+ZOMAclcxz1J9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXxoCtRRqAyKfgQX8GSwGx2PQHTZBmhvzG8VLrf1QOQ=;
 b=g6xgGZw/VMH80AmpA0fyX9e/i+S2SQURQ62zZNpoMAPeVPDwCnoC/rEEGDDurZjxnFKpuOuyJI4Ge5btdYAwiSFnDTV/mxywsNpUMZphtzSE2WBX1xYuTFgxfj7PqKV9UB8CbQForzY4blwnDN1bLRMeEp9Cogs5rWFRp8/MB77ytg730LuzXsO+WCM0orfswQB/ldnENY3IqGygxD/nHvE4MrK85NZqFcIX+f7+tsfzdQeD6NionU2Lg+u867nJjTaa+EL/l5yUj75hJC5gSAcn+LM1OLspjUfJvCDHTqLPrsxrQZn1dmSigJNH8B5PVMijlzUL4fKzRHrSl5o89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXxoCtRRqAyKfgQX8GSwGx2PQHTZBmhvzG8VLrf1QOQ=;
 b=Y8XAHXb2+hS47+2W2OJw/pqNZXbDGH0vMRlxhnBCOFv4vvsKfKGVH1nhO7obeYxGI5U5gyPHpFlqIGi8FVChydwocxcjqFHwG9ru+OYUWXwtetSl//ktJnjhobQLYXOrviyOJm0ayGxgR6w3RfF1ZY2GyOPs92zyNuLAoZiYx1i0kOU9xLXDXr5Mf5PmAmaZybfFuODloPiYqN5aE4ADgTYWhPWJeiwiaG/VLo3etT9Apd7Xie+SNaSIWS63xwJe81B1ZMc3wr4gP/fkdM0okcYUex5JxPZooMGYbOpP4fcJ++NdLIwrfxAXB/i7BHgxk6zQhZTlb8u32JyU588QUw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e11fdb1-88f7-4e4b-df0d-fe3b2039c98e@suse.com>
Date: Mon, 17 Apr 2023 15:48:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/3] xen/livepatch: Fix .altinstructions safety checks
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417121357.3738919-1-andrew.cooper3@citrix.com>
 <20230417121357.3738919-4-andrew.cooper3@citrix.com>
 <3b1f3719-c8e5-8a98-8325-d907c160d81d@suse.com>
 <881ec3af-19a8-a448-cb61-1667e146344b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <881ec3af-19a8-a448-cb61-1667e146344b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7636:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc3bb5d-af4b-48fb-c99e-08db3f4a6aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T0do0XMpZFOkXldzW4oAMBVBHzmxRrDr88mizXbLbvf080ajp/+1gU4s2OeJIJ/3VLySx9UGWttRy1D169/NqDynJVkkbP9AMQc91UwXYKTRdxFDsD9HFVPQamUUoRdM/eon2AlsxeEyRtBupDF+CG/Bxow5hoEmjxdVOUXiGRwby4/LBSyks3gQ+QKVsP7DZEzfoB/NAX/N8AkXsg3LDvTR/rdv+YCvK0ddZk8gY+fkFWftVnOIIrpVQ+By2T4rGtyO5s1/JddDbLb/ETqh/PUJwRpcZUWH/4vbYdJm+vTLf/516SZfG91SD3V924LJZMmMXxCVUtsL/+mvNcAFSJ9PKPCuvye0sW7HoT4n6N033Klu9u8XSNQMlUeiplW3S4wqc9RpYEoTJnGXo52Se06rydqzm1QcMPKKvtKKz3jmF0rex+qNQ32dD7eppbe1OXf7+kHEFyLaarjA5EplOsFjlyaAeeEHsB53Px+mnfrYCja5Eq73xzyU4wfZxzaWYWpBNU3KuOcNZnqLA6iBvcDu+1N5zDcj9eGb3CkqYijj0Z2Q+Cw0P7cqHpUAUrRmHE1BfaL0017/p3+tHBIN76O5D+hgbjshFXzvt//vA9RHb1QZusrOHFf4LCsFk1mHLWZNobFzAi1e5UKOWVmb10FMbV1/sbu0TeYTrlAUj2k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(5660300002)(8676002)(8936002)(41300700001)(31686004)(316002)(6916009)(4326008)(66946007)(66556008)(66476007)(2906002)(54906003)(31696002)(478600001)(86362001)(6486002)(38100700002)(6506007)(186003)(53546011)(6512007)(26005)(36756003)(2616005)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eWVvYW1xTVRRUlhraFVJMmpOZ1ZmR0VrS1p3a2V2NHFIcU92SUtINU5HVG5z?=
 =?utf-8?B?MnM3NXFML2NyVEtoQ3ltUExoSHdJQi8xVHdCWEM3WnZwaTkxSUp3TDFxWHR5?=
 =?utf-8?B?SEJvVVE3cjZadmdveE1zc0duTXo0UEs3REt3V3czclJUNGhoekFBQVNMMEZn?=
 =?utf-8?B?b2JNTVVhaVpMaWkzYTN0c1hWNitBamR5bDZRa3k0VUhqSG5OaVh2aXlTeHk1?=
 =?utf-8?B?WlpYRG9TMHBvak9yM0c3SmVLckZIT0tZaWdRbGFrUURFYmJ0TmNnOVVkMEtO?=
 =?utf-8?B?cm5EdGJkbmtTM2pqM200VVgyM0wrcVpsOFhEaFpPcXJlTkd3S28zRnRXdngv?=
 =?utf-8?B?UVNpZHEwM002bE5ZT2NYaUpzT1JaeVhWUnc3QmJzMC9BUnRIVmxJQmsvY29U?=
 =?utf-8?B?Z2I5dEphSWJKVG9zc1U4N2I1U2dxWlQzL3hLN3dIRU9FSmk2N3BtL0dOc1Rl?=
 =?utf-8?B?ektNUFlkT0k5bmZyYm0zM2JtSkZBVmYzSk44RU42SjEyMVJzeGZkcmtWRlAr?=
 =?utf-8?B?MFJaaVExUVYxYkE1SFM4bjVoaFRBZitrV0ZrbkV3b09yZlZoUGNSdGMydEpW?=
 =?utf-8?B?OFlCcWIrak4wS0h4WjUyaW81RnpUVkxMd291Z0djUmlQNDQyM0VGeWFoZmlJ?=
 =?utf-8?B?bUszdlYzV2hYZS8zaTVqWXpJRUtBVGl4dFBpbkU2Z01UWGJyRWd5cFFiSkY3?=
 =?utf-8?B?UzNwNFRJZnJsY1dRL0U4b3pPVUtHM2d3bU5lN2dOdWNlUHIyKy9HTjQ5ZTla?=
 =?utf-8?B?NHVTTU85M1daWlRqbElYQXZibXJlMVkxSW9BOXFOMStqb2RsRTRBbG0vNjAv?=
 =?utf-8?B?UnN5VnNBM0xiUFUzcXFuNllFOVFVZU4vQ1hJZDZjOFloU00ycUord2l1NUdw?=
 =?utf-8?B?NUltN1h1Yy9UQWIvdjNhZWRLUENyZEwwMnVSenliWVZTTjA5RlJqdFJDMU15?=
 =?utf-8?B?eGRKd0h4UjhjR3FzOXNtbUYwZFZkMFU2TENPR2lad3JrZWlXd1pjSzgzT2Rm?=
 =?utf-8?B?dDJpS0VleFdYeXB2VHJ0akJUc1VGYzlWbDNleWtWWWJTMHh4YldIV2x0aXoy?=
 =?utf-8?B?ZEtLSUdCTHJCUUVGQXRidGltZ2NsZE1GL3RBeU5acWdxRjJlUlBoZWdyYWRq?=
 =?utf-8?B?WG1pcTRxQVFDd2RQK3pJYnBSS1B3bERwTldWR3NWNGppWWg5SkF2dnZJUVhk?=
 =?utf-8?B?WlZXd3NpeGo0ZnRPeXIrOENQY1UxdkUxYWRRKzhFdkRSNm1wUVF5TEZpa29H?=
 =?utf-8?B?M2FMcll3ME92R1ZGM2VYRVZnZkxDYjVFeldPeEFmaGkxZlIxbllKMTNORzhJ?=
 =?utf-8?B?d3IyMjVXaEh1UHRRVzZCSkFNelovWHo2WGpNZ3d2RUQyVUc5eExOS05KVDcr?=
 =?utf-8?B?S29pZ2ZZaXB5Y3N0cjFLd3ZxMEwyVWtEQ2RyeTlKcWUvSnRUMHNiMG9oTEJS?=
 =?utf-8?B?RERkcUo5Wkw3aDV0Vk9rWFQ0WVp5OGRFem9IUVByS2dRQ3UybWJBam9QRVpE?=
 =?utf-8?B?TmFWcVo1MFcxYmEvay92VTNDQnNWQlNOc3RCSG1SV1RUOEViWVM4MU1TMVg0?=
 =?utf-8?B?U05kbFcyV0I4WUhjVHVFaFdqMWZ1b3JVdW5KdnpZMXdWUzFTNTVQTGhKRDY2?=
 =?utf-8?B?NE1FdUw2bnErTDdkUU44a1lNclQ3NkZoS2pEUkMxdXF3ejFEZ3FVczB5TjZT?=
 =?utf-8?B?VXl4TkJyUU9LYnliQllzcE04UHdQS3NOR2FsbTY2K2h4c1pDVld6cjJ0czV0?=
 =?utf-8?B?Qm8xYzQ4R093VTdyRzdUM0Rna2NKTU9HTlFxNXB5WWJqNjJsWTZkQVFKekZy?=
 =?utf-8?B?QUJvVVlvSUQ3ZVkvWE9PSlZLZFBlRTRiWnNjSjFNanUvMVBkWm5MZnBURWlB?=
 =?utf-8?B?Y2V6ZTdLdlF2YlFxTE80NFA4bVU0YzE0OUw2dkRkU2NLV3hzOGU2NGVWOWU5?=
 =?utf-8?B?ZVhvUnFPU05NVXVhc01XS0xNaUlXZkZhdWt6SGhwbThtS0txOURNUk5LRnBH?=
 =?utf-8?B?TlRpNUtPS3lOanlLdTZ2bGhRRWFRaWY4Y0V0YUJGb0lSaWFiMGp6ZkhuZVU4?=
 =?utf-8?B?bUlHb2twMHorOHhpV2RxRDMvQU5OM0JOREhCSlpBTlZhSXpib0ZVempML2tX?=
 =?utf-8?Q?ZlJd3ak7AS//fE4wBk73GOJ60?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc3bb5d-af4b-48fb-c99e-08db3f4a6aa1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 13:48:25.3565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbKzfyAl0ebhmsIkx3bBdT+j7WUs92sU5wrdi2JLyBYZ69u7vFcaE94HXxLw+1lRs17Hg0UzKpzK/C4t+2PRuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7636

On 17.04.2023 15:37, Andrew Cooper wrote:
> On 17/04/2023 1:35 pm, Jan Beulich wrote:
>> On 17.04.2023 14:13, Andrew Cooper wrote:
>>> --- a/xen/common/livepatch.c
>>> +++ b/xen/common/livepatch.c
>>> @@ -803,28 +803,84 @@ static int prepare_payload(struct payload *payload,
>>>      if ( sec )
>>>      {
>>>  #ifdef CONFIG_HAS_ALTERNATIVE
>>> +        /*
>>> +         * (As of April 2023), Alternatives are formed of:
>>> +         * - An .altinstructions section with an array of struct alt_instr's.
>>> +         * - An .altinstr_replacement section containing instructions.
>>> +         *
>>> +         * An individual alt_instr contains:
>>> +         * - An orig reference, pointing into .text with a nonzero length
>>> +         * - A repl reference, pointing into .altinstr_replacement
>>> +         *
>>> +         * It is legal to have zero-length replacements, meaning it is legal
>>> +         * for the .altinstr_replacement section to be empty too.  An
>>> +         * implementation detail means that a zero-length replacement's repl
>>> +         * reference will still be in the .altinstr_replacement section.
>> Didn't you agree that "will" is not really true, and it's at best "may", but
>> then also doesn't really matter here in the first place (suggesting that the
>> sentence might best be dropped, to avoid drawing attention to something that
>> might at best confuse the reader as to its relevance)?
> 
> Only that "will be at 0" wasn't actually true.

Oh, right - I'm sorry for the noise.

Jan

> Right now, the repl reference *will* be somewhere in
> altinstr_replacement.  It is discussed here because it is what the check
> enforces.
> 
> As an implementation detail, it is of course free to change in the
> future if needs be.
> 
> ~Andrew


