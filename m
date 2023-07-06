Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B867274A220
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 18:23:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559946.875417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRkp-0003il-4W; Thu, 06 Jul 2023 16:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559946.875417; Thu, 06 Jul 2023 16:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHRkp-0003gi-1F; Thu, 06 Jul 2023 16:22:51 +0000
Received: by outflank-mailman (input) for mailman id 559946;
 Thu, 06 Jul 2023 16:22:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHRkm-0003RS-K8
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 16:22:48 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f72967-1c19-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 18:22:47 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6852.eurprd04.prod.outlook.com (2603:10a6:208:18c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 16:22:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 16:22:43 +0000
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
X-Inumbo-ID: 57f72967-1c19-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+OsARf3630O7JzDGdYUpxqzq9d1br5GepZSPyj57hC9r/p3i4KUgJtvgOVPPfat5YAeg9oKy6aiLW4LMuuTk7lxnfxFeqoznG8VJdkTrvtNPPqcFsPymEKzYS83GIAa5WLzGw7XcUPyR2P7AJLdCPWDT9D3LvZKBWVaiH3E2Fjx8OSaZaoi3m+p4syijJES0pXymslJkKpykhiWCMezEIzNNkjRFlkfKuq0xmegdnkkpGtUsMsVz+MZjR+KVY5AxypXpcH7LIGcWu6Lb8s2gB/bCxSCRjos9/XeJqAZ74+O79s+ETOHdyPqzSCLRBN2hcbuu8V8vtAoUAWBXAoEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VUaRakA8WXAnt74HRa63Lz7G4ULWu80U3CpXtW1wTI=;
 b=IuvRYFh6MBo3CnBMC3mROYiOmTPUY+W+8f65HKZFU2F0Ty4JgXS5wJ0RLi2Rgjta68whQHz8PrPrvk2YB6Z3kv43SKazGsiKQhvelVGCesoAzE0ZQmDwSXhyk1PGbRyio/+Q1mjQO7Ne7EqMChlYqAcL0/Q7uZ7/mGn+7HNARktyFVbIyhzp8lyooA8zb2ANF63QML51WuGc1CpHx91b1R8dM5KDTY270PS7vVL4OGq/5N5Ly+d5PPvSRayJbPqPNpwB/xlD05vk8+UccDc7MqybisalldDCQij603yqamHmWxYKGsmx2gTAb3Cee9lbkQxP41NdisEoFJGr+JacaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VUaRakA8WXAnt74HRa63Lz7G4ULWu80U3CpXtW1wTI=;
 b=v//jmLFxVC2JVQhDqCOeAU0LndvkfwbqtiLl/k2pBU3QyK7stQdB/dvwYWVGTiplbVyvWQgnkWzU0bXA3s4p+jebCxv9DhxYSJl0WaW0xulw7jOWd/vQMfGvC1LSn5XC+bKQ2XTHWjEiiDjYRW3Rh5Fu1GSc3k2MV8gsS8IoqjW8IgfBRtvITApW47Md+72QKJxLSgEzEw2XSK5bPxiXi6N+HjMVlIeyk2cQUwliQE3oFR+cmgB4DNh7RXtNafPkjoTY72HsQHhgKTlJtxyZpBvxS0OzF13isDXFkWrgHH6JTeth3x/GX+Pa0v+10uweejO+kCq7ZDwFcUYvUcJ56Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9f02a81f-648f-4f80-ad79-9f70eb50d296@suse.com>
Date: Thu, 6 Jul 2023 18:22:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
 <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6852:EE_
X-MS-Office365-Filtering-Correlation-Id: c213a86e-b366-49fe-8ec0-08db7e3d39d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HKBU5TDFlVfTEPD6tgM4fIe7yRcDjtR1zmib+EkfVItGHa6Jy+roBXtJYnKOWfoC9+9+026ZdTFyJVX+0NE11O55TW+fb0hpjoKzBXdfWezOv8MjIB0pYkORGunkJiX1QJRXbqGM5w3zF6PbIe46bVoOZGOGkRzuHf8WtNjMX7+svQpHX4nSh9Bt8WFmebQnBCHltCgIgiXdAZRjOuj6/ZfOkiC5h1HlpOu5GfcS9R2r8RFBbHmvrjdTWcbFXUXkRkd+h3JaMpeMnOB36UN+cPCObEJEXKPNJYiU1Nl+abD3BpyFsIUOvNJ5XdhJdi6/KvQZaVtw0ppz/DdeFC+khoIZxawVL3hdRW1eJu3a/ldbKO5RzdwQXVtcKRB0F6LSBYy27oE+lpnqfEC3h58ZSKXzbyNAvKCgsS2M22JamO5Bh2np/Xlpq8eNb3ji9AWkq7z07SqMmRXcAtFeju3aYikSK+ZfLazEs/011Nj5Xi0FxYLSn+2s59ShYGdOARJgFpkOgq+BoxUqddeBIter/zM+ZLfXEVndN1CoeANRrYHh8xio7bd8ewSjkMh0j9TL7g7Bu/4GtY0IVdGEto52ZDQVw3q1qPPF72mTgh2S+sM6o+5168ovfRehC32XZY/GAR5Ntw1JrPxj8YnepkAD4w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(7416002)(8936002)(8676002)(5660300002)(4744005)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(6916009)(4326008)(66556008)(66476007)(86362001)(186003)(53546011)(26005)(478600001)(6506007)(6486002)(54906003)(31696002)(36756003)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjVMM0lXbGxKaUU3bTVoUkZkZHdaSExWVXl2MHRUS2pBM1pxdi9CcXI4d1Vi?=
 =?utf-8?B?UFJYc2p6VkVWUlFoVWpZUzVlcjNJaEdHcnpNdjVQbk9wcUtGT3FOYStzR0g4?=
 =?utf-8?B?bnZUMUEyWitDeXRNNlpjOXcrdW15UGVDT3hZWStZRjBKbDhnZHpPTktZQnEw?=
 =?utf-8?B?QjdNMFNmSCtFK2xwQTZORno0RjVOQ2c0bHFKSDRNRmxZS3dscmpVNzFrYmh4?=
 =?utf-8?B?TkNGSHQrejYrRUs2cDltOS96RjdNVWpGU2dSd2pXVnlQMkRSN2VyZFkxWm1D?=
 =?utf-8?B?anluWGk5OHRuRUxsS25qWlFCRG15QTRrcnp1dUpBK2NES0tnRVMrUHdYY2oy?=
 =?utf-8?B?RzNjWWlXcDFqL0NnNVl0dE5hUDk4bUZyL2gxSlM0Y3kxNGhlelJucVd3VWhN?=
 =?utf-8?B?aklQVjNjTHBFZGlqdWpZRjNsaHBBbTd3cUZuTXhPb1JCNUZtVllFUnJEN2lq?=
 =?utf-8?B?Qm9qMDcrVitNQy9tSnluandWaEpqTjFESTEvS05UUmErVk5RbzdvUGNDY21x?=
 =?utf-8?B?OXYzY0JObTF2bDJGSkpMalQ1SEdIMWYxSDZKODE5bjdsbnV1ejJUSXowUUxY?=
 =?utf-8?B?ZWNlRlFqeWl3Yld6YjluZEJFc2JtMGNjRTlRSTFRV3Y0K0VqOHlZRjFncmw1?=
 =?utf-8?B?bUpOazAvQWNjTVNTNys5aC9makhjT1lmODU0MTdaSFh0L2JJQ20vYTRxWnph?=
 =?utf-8?B?Q2lYcEcwa0lLbmM5bTFCSmhQT0o5UVFpNStLS3U2aGpQSGlsZFlsYThCdGgr?=
 =?utf-8?B?Tlo0a2pRMkd5TzBGYm5oUGNzSnF3ODdEMnRZZ1RwUUtyK2hSUGpLMDBoUVdG?=
 =?utf-8?B?STdFWDZCZ3pyU0ROT3YyZmFWbW1VNHZHZy9xbzBibWN1QmtmWVhXMWRNb01t?=
 =?utf-8?B?d084ZmV6bnpLN256Q21QVm9JQ3VoNVdsVVd3aU55eTkyZmRmYXlITGF6cVNo?=
 =?utf-8?B?TUdVemRUMDltRjFZYTA0Rm9oVFRMWHI1a0JsMHB6Tm8vM1c1bU5hU0duNHdH?=
 =?utf-8?B?ZVdQNktOQk9lTm1OZHZMM1IwcW5CT0NmSGxwZ1IzdFhEU2JCeWtER0JMNjVw?=
 =?utf-8?B?bGtsUzVIYis5dDIvejVBNjdsNC82YnU4UkM5bkMvSHgxbVQxdXBzZDNUbmxH?=
 =?utf-8?B?NTc1cnltQzl3SVg1bzRHVDJZWVhyT2hTb0hjdHFGSkQ0ZnhHbG1YYzJnd3Fi?=
 =?utf-8?B?czMwWnEyRDJMRlhRd2hWNHgrZ2xZQTlSeS9tK0pBWVZVVmJ3NHAyaVNuMmEy?=
 =?utf-8?B?TGwwQXhRMEtyV2ZJZyswU0RBam5FUFBwdkp0R01reXZ0eFVXOTdXeG41Y1JO?=
 =?utf-8?B?aDlNK0MxT3NuZlZsbWg4eURlNVQxak5tNFV3emVwR2ZPbHJyZFNqTjk4MkJ1?=
 =?utf-8?B?WUluRTNDMTFmbVZwWnpIeklFNnFSc0VHQkVnRkN1N25YdjFDSktXVGlRRVZu?=
 =?utf-8?B?SFVEVkt2SHBVZTFxMjFYQS9nZ2FLbWFWZnBrVmNqYTU3TDJFZ0FrSUhyZ1M5?=
 =?utf-8?B?NGoyNUt2eEdlTlpoTU1ubU1VdGtieDl2bHZEVWdtNUZ5OWtkZ0pxZ2xQSVBD?=
 =?utf-8?B?YUltd21VYUlPVFB0ZnEvdllKQmpHZ3JqYWVaZUdjamFrUzA2TkRSRkZSOVF5?=
 =?utf-8?B?NTNjNHB4eHVtVytsamF1Wmc3N0l1TXVTeURIY0dwOHFGdCs3RzIrazNBRi9h?=
 =?utf-8?B?NHJlbVBzM1EzUng3emR3VlB6R3RBS3B2SDkzcGc5R0Q2UGYvblA4SWh6ZXVw?=
 =?utf-8?B?UDFQNmRDMnVLbkZISXFnM3dUaEtlVUcwY3hFWVV6OTI2Q283d3hia3RqNHA2?=
 =?utf-8?B?VWNvZ05TNjdvL2Jyc00xYTNpdE12UU1RK2J3M0x4ZEdJb1k2ckU5bnJKbUQy?=
 =?utf-8?B?R0VHWFFNektOYUZiSFFhZFRPMmxaK3lheFJxOUNWQTQzN3lqYUIxcW5JZjVv?=
 =?utf-8?B?aVRLMWNtaXByMDI5eXkvN2FwNXVRUkVUNFArdUo3azdjSkZkSEtqTjhWVEpo?=
 =?utf-8?B?OUZ1WVRURDE0TVc3clZXdzdkM2RNZDFVK21qVGxnY3ovdlp4MWtSeHVNVy91?=
 =?utf-8?B?VlJQNkxEQlFvZWtLR2FVclJ2VzVuSjg1bjIrUlVQSElGaEM5d0gvSEFCcnlS?=
 =?utf-8?Q?oSWfoHnGoagmfpjEVLEKFPkR3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c213a86e-b366-49fe-8ec0-08db7e3d39d5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 16:22:43.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqL3anNBVWXNEWlAux0tX6kK9rQ473WNuJAI+qSftjzKPHSvINtAS4NWu5sUhva6d7jmAx/kr0YgOzJYhXYQEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6852

On 06.07.2023 18:08, Simone Ballarin wrote:
> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com> ha
> scritto:
> 
>> On 05.07.2023 17:26, Simone Ballarin wrote:
>>> --- a/xen/arch/x86/apic.c
>>> +++ b/xen/arch/x86/apic.c
>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>>>       * Setup the APIC counter to maximum. There is no way the lapic
>>>       * can underflow in the 100ms detection time frame.
>>>       */
>>> -    __setup_APIC_LVTT(0xffffffff);
>>> +    __setup_APIC_LVTT(0xffffffffU);
>>
>> While making the change less mechanical, we want to consider to switch
>> to ~0 in this and similar cases.
>>
> 
> Changing ~0U is more than not mechanical: it is possibly dangerous.
> The resulting value could be different depending on the architecture,
> I prefer to not make such kind of changes in a MISRA-related patch.

What do you mean by "depending on the architecture", when this is
x86-only code _and_ you can check what type parameter the called
function has?

Jan

