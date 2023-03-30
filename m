Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181496CFB7A
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 08:25:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516429.800486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phli0-0004M0-9S; Thu, 30 Mar 2023 06:24:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516429.800486; Thu, 30 Mar 2023 06:24:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phli0-0004JP-6O; Thu, 30 Mar 2023 06:24:28 +0000
Received: by outflank-mailman (input) for mailman id 516429;
 Thu, 30 Mar 2023 06:24:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKpO=7W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phlhy-0004JF-Ls
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 06:24:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83ad2ecf-cec3-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 08:24:24 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7016.eurprd04.prod.outlook.com (2603:10a6:20b:11e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 06:24:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 06:24:22 +0000
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
X-Inumbo-ID: 83ad2ecf-cec3-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FA1pWKPh0iX+ELyufR4wQJU6p9DOsoxA4m37pT5g/QHVVzsS35Y8I8ktASJZ+oyU7EVw52g06h/lr/BxsFGRMC5YOhMxjFGiSPvXie4BlTHiGn1R/t8+BO10/YLcSkHo8dPc3IxXEF0SyogsTQUVKZoDtIRUrj19rrgUyntyGka0GQY+EW+VYFC6ibJzPB9fvDV8FxrcaA6fTUl11+jc2W9R2EoAuwE+13wNwZHyew2z1jwvQvZ3CqOuh1I08BhsUABXSbvRvFN+2WQJFwqhtx0/EgNs/XTbnsXvw1z8ROMRfdcJahItsnvIPV7VLU4YT+Qc+MfxAJx1QNp3+a+Y0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mOdC9rQoLl9g0HVThCVCan8x/t97IU3MikBflDksjk=;
 b=QVZWywIcwLqyC7ft/O/1cr30ru30ocC9VSZ83q/NgAhs/0cNpNRFoSfdXSRmjY73nW1FbrNb+jZOtHUCDmrLJzcQujXcTJGSe2zRZgjhJmJBNggDCQghTxidPO6wa/4Z46qXASN6diig2aGqkFCdeW1xW1Jy15IwlccHMpEmKGAEAzk+2ib3EIbTHozChkAG/bVDmQFytSs1t0dOT81EwB6jRyTFKNqkdN6OFz/LrMaEbKClizEtafTKa/O1FPAGsNS2pihjrp7Td/sEyuhii4mHr7MKQigbwdXDyK3LhrtxpL87/32TiDL0ua1ZFRCywZkdNvwXyMSZNCLOJzVUYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mOdC9rQoLl9g0HVThCVCan8x/t97IU3MikBflDksjk=;
 b=e996EoHfB+H9pWAEI7i5UH+0wL3kKxRTVWVD4052b0M4THWwfTezUbD+cg8T+kpXUB4Wl3vIgycbscPPK8nt0IKLKAekVGqmFNLcJPK+4Qn4Yn46VmjS9DZdXPHaPkSkjbz5YzThU28WFcsMsT1dVXb1QaG7b+ZtNJQBjS2OlbEa6dJoIyNavYxUNLubWidm1Le/s/fMRTlCFNJDCyd1ABY5NX+PX6XiJsIxlSCsxtZ3OmLbkTtUELviNNccYGocon7kiOD+BoR4At2cit6AwqSdgLgRG9FMSAy/5RYLprUhrwhhzvkBzTa23x8JNBlgMvcir61sWisTWDnr1s+pqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fb2f771-3354-3f52-f923-e7fe7861cfbf@suse.com>
Date: Thu, 30 Mar 2023 08:24:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
 <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
 <ZCRnU03XDCpqZQ5u@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCRnU03XDCpqZQ5u@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: b435fd20-5700-404e-04bb-08db30e766c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1iAF5i61gFq/V2CWh3ooXkVG9T7xaud/GslPLy5h74FlKvczjNTF84R3Y2nJS0ag1p1Tn/25SYg1ZaEaGG1T3r3viLPXe9I5PKzt3SGqyLcE+oXTQCkus1vawjQuLJii+Tu2CLO2sDa4U/uIiZ/dbx1n/gUm3wecWkrz8mwKhdXuJkm9BVSCu/1HtwbYqx8Ju+DrOkIfZ4t/mm/Knt3eCnFx8sG+beeVNSjPRFeuQ0HboqyTjXXJbW2lYw4yguRe970xtr9kZjTfHKhV7qI1HU1SoWp2AaE2QSPD9/TnOhJnElaQJwvCp3op3tVpxItQ40UiYwSCJlDj7/5jNRTpRM5/p2F5h04VqGqGa8QplWOaQ/fYTfY2sQazHVSFxE9uy8qur8gliCA6ggU/TOENqB/IrRLLef/LwYYFdTEWApSSSLQN4AaA+sD0+FPX73Q5/MZ2iwxxMa7n8mqdJfM3rHrXNU3iA/OF3h6RtboQPx3oVBl9sVCMX/XDdYVn+zSfXEq2wlNq0Zum+UlgDZXzThiKnYkbdi4jpT8vLPv1H+BR8vXGKbnKoXlS7dD7dLvgAo3cTSEp4zi+m7uJsIIFmhuYrrzLCh9O5ACEKZVb9HxV4QJfMNtWIUYW3Sl82x19YR/6S50US8LSLnILI8xawA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(376002)(39850400004)(451199021)(54906003)(478600001)(316002)(2616005)(36756003)(186003)(38100700002)(31696002)(86362001)(6486002)(53546011)(8936002)(26005)(6512007)(6506007)(5660300002)(31686004)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(6916009)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STBkYjVKeGRiUkFWRldNV1pRVFl3aWcwNVQrYytOSDNiODdjS2trV3pYdVU4?=
 =?utf-8?B?UGpmNkdMZjg3UHRNVGNVanduUTloMDNzTEs0R0w2d1NtdVZiQ0dWU0hYdEFk?=
 =?utf-8?B?MzNFQUx0WGNsRnE0UVM4WElSeTR6MHNqZmd5OS9tTUtBMkRkQTVad2xUZ3Q4?=
 =?utf-8?B?aXhkdmtHbEdVSVZ3Vks2OUt3TE9laEY5V1ZIM1lISFlxdjdyQzk1VXRiMFRH?=
 =?utf-8?B?ay9XQjJkanFkTDRiTW4zbFRUbHM3Y3M0dDM2STAzQ3JQUFE4N3AyVzIrTmNs?=
 =?utf-8?B?TUtadmNoUEtlOGNwSFlwNlI1VDhZUnV4cWJIY0thT0N3eWpxdUZpVEFxZ2pH?=
 =?utf-8?B?TmhOVzh2ZFUyUDF0Z1JQWTZkL1BCVXNQSU11YnU0emNqMkowT250STNsUUww?=
 =?utf-8?B?QnowMklHc3ZNaTZzSTB6VGxtYUdlUWdmTk1ZYWZ1cHdQL2lseUtzRlFwdk9a?=
 =?utf-8?B?QWdYZHBVMCtzOXlNNSs4OUd6UWdnVzhTQ0dGVDRURE1ibUF6emtvZys2cDcz?=
 =?utf-8?B?MUJHNThJNTlqWC9qdlZ0c21DZDJvVy9STnc4cGpwMnRpWHJPVjRFek9DbXJL?=
 =?utf-8?B?dmh2M29nd2tqOXVmMTl5WU9kaGowSE0rRjVVMHZVTFlmRlB1MjE3Vkw5VEV0?=
 =?utf-8?B?bGRPSXpTUlhPWU1ZZWZzanhEUUdYT3pNVkNpUDNjcjlmMjdXTm9kQjlYdjdP?=
 =?utf-8?B?MnpiNWdBUWkrd0p4bnJwTU56QXNDOE90SW1JNDVCdGxmcmhkaUsrSXJHenlT?=
 =?utf-8?B?WlE0RTZOUjAvWEhOS2VGOEFqZFRQRlp0azdGaVhwT29WZFFlY2crYTZoWW9Q?=
 =?utf-8?B?SUU4TlN4bEY0ejRKUExiWm4rcG9UZ05EVEFCQ3lmcC9TaUZCUWF0THRsMGJU?=
 =?utf-8?B?YlN4QmhUMzFEd1JZTDVjS2RMd0dTT0NqQXpaVFprUjNYZkZ5WnFHR25ib3ZT?=
 =?utf-8?B?WS9oRVZwTitWdFJWeGY4RTdnWlBqUThjc2VuV0REbTVhRks0dUQ3S2p2OEhP?=
 =?utf-8?B?Wm1nblNNUE9XcVR1RC90ejVLRlk1b2VsRVU0RXJXeHpDYXIxMWswNlNObEFB?=
 =?utf-8?B?VGhpNVcwRFYySFYrNU9PTWtlVjdqYThuQS9sdGJjZVJMcXEzdllFNHNUa0JB?=
 =?utf-8?B?c1Z3dE5PNXJKMUdPcUFGZGNyVUVzblRqd3NaQm1iVlBsSkkvUGJLMEl2YXRk?=
 =?utf-8?B?ZWlMZktIYWczeVVMdHhWNFNqVEdpWU5xdlFCcXNxOWgzd0MxY3Bha0pJU1gr?=
 =?utf-8?B?azNzZ3JPaU95RENZeFhnUyt6S29VL0s0ME5Tays0R1k4N0YxRUVZdFU4Ym9s?=
 =?utf-8?B?WFVmR2dpd1I0OG4rWXNUamNjdkFwZUxEWFJEQzFoOXRBenpYM3A1bGRURGc2?=
 =?utf-8?B?dzR3ek5RbE5Ed1BMQ0hOOUdvRStnRkFSb2wzLzYydmgrY2h3Vi9vQnBDNVRF?=
 =?utf-8?B?dW9YOHhxMXR5MDYydGNsZjBISkNmK0Z1Wm5tWW5zK3JBVW5XWGNvbG9abVFN?=
 =?utf-8?B?d0NQakFDa3NHWDY2ZExpdUxZcmNTeXE4UStmdjNGK1hOTmI1SVpya29XRjVo?=
 =?utf-8?B?UDhKa2JjT0NtUVBzYTloNnJBTTh2UnZiVFllRWk3ZlVweWRzU2YzR0ZCSTlX?=
 =?utf-8?B?RUswbjFXQXZZSWg0L0loM1BjTmRkd1Y1OVNWYkhBUFozWFdoeWxYSEFET3Vn?=
 =?utf-8?B?REoxRFdYWVB5QlBGMldkdE0vQ2dnKzNDZzNabUd6Q0x1aTVsTFFKUC9JbVBu?=
 =?utf-8?B?emgvSUZHYkQ3MGJhQ3ZqS3ZmZWFWMnEzUmE1R3F1U3kvTk55Z3RXcU9PZSs3?=
 =?utf-8?B?UGwyYWtHSG9acFlYTE5NNUhnQmdiYVU0SzFpdndMald6NEpzMWFEUG9TVkFp?=
 =?utf-8?B?N1YxTFJkZnVSY1M1dWc5ZTRDMFQ0U0J5b1NWQXJsTnhlQUV1anAvN1ZEdjRE?=
 =?utf-8?B?RGxpK2V3b0QvWXlnSVhhU3poMXlCUUdUWnZMaFVlOEtuOTNFZE5KY3hxMG5R?=
 =?utf-8?B?dVIvQ2VjaWhDRXVSOTE3WU1hTzlNTnJMaU5reTE4dGRNNTMxVStXdVlIOGxh?=
 =?utf-8?B?QURDaGxGSHBZY1U1SmRIbU93R3VrSVdHNmlrbXd1c3J6c3lJclJ6ZHM1Znlz?=
 =?utf-8?Q?A3tVMR75mnePHzCYL8ZRasSig?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b435fd20-5700-404e-04bb-08db30e766c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 06:24:22.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wD8E0j2CseHDiVcvmYPj6sbs4q+DV3xhv0b2+6t+wCLkqNkQAN2b7T0eCEkVHSepq73Hq6QMn0rcrkikU9L/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7016

On 29.03.2023 18:29, Roger Pau Monné wrote:
> On Mon, Dec 05, 2022 at 04:10:28PM +0100, Jan Beulich wrote:
>> On 23.11.2022 16:45, Roger Pau Monne wrote:
>>> @@ -265,6 +266,15 @@ __efi64_mb2_start:
>>>          cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
>>>          je      .Lrun_bs
>>>  
>>> +        /*
>>> +         * Get command line from Multiboot2 information.
>>> +         * Must be last parsed tag.
>>
>> Why? And how do you guarantee this?
> 
> I think the comment is misleading, must be the last checked for tag in
> the loop that does this in assembly, because it's not using cmove.
> I've adjusted to:
> 
>         /* Get command line from Multiboot2 information. */
>         cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
>         jne     .Lno_cmdline
>         lea     MB2_tag_string(%rcx),%rdx
>         jmp     .Lefi_mb2_next_tag
> .Lno_cmdline:
> 
> Maybe there's some instruction I'm missing similar to a conditional
> lea?

There isn't. If you want to get away without conditional branch, then
you'll need to LEA to a scratch register (unconditional) and then
CMOVcc from that scratch register.

Jan

