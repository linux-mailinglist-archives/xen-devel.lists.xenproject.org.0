Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C22C6A0737
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 12:21:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500244.771533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9fK-0001W5-3K; Thu, 23 Feb 2023 11:21:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500244.771533; Thu, 23 Feb 2023 11:21:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV9fK-0001U4-0I; Thu, 23 Feb 2023 11:21:34 +0000
Received: by outflank-mailman (input) for mailman id 500244;
 Thu, 23 Feb 2023 11:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5wz9=6T=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pV9fH-0001Tw-Qx
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 11:21:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387b2d9e-b36c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 12:21:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9248.eurprd04.prod.outlook.com (2603:10a6:102:2a3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.17; Thu, 23 Feb
 2023 11:21:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 11:21:25 +0000
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
X-Inumbo-ID: 387b2d9e-b36c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZExSY8i2mon/u5VnKg25lUSsa2GOOwwqW6ZPhIFvbJN6ushWnwg663sDV1UkacGfZvbgnVym70TKpcTW9D2NZzEJUW+qH7KIEiB1kI4yaBNMnzna1HXRfabejddz+5lYPa64m3n2MAoXhR9flux7Z8bES9D+p1etQsx9JKNK9VLTqd+ASOqLNIWelthfBvgu5K1x+J6YMPfSIRyYfMC852PRtVe3uLpsxqHOQbs0o5fVUQPortsL/uvYSAADP1AbngPRgdfER+H5TTx86JRWj6VEDnhmKfnh2TpePCoGxn/NzpYHuIYFGZCm0RlK3j5LlR2oAP3SM2i15+PwCalcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw9D5mdgKcnpvAMfjDO2OzSEn6KCENZiGCFyuuq0Vhc=;
 b=BT06Bxj/DW/FeOxLRW3+VLfpx5P7TsDjotQDLZlAXbPDDmKZsOvXoBP72u9Cvv9M/nU/Xo/yIiHyIB+XViIIAD5knLiNZmOTwYXjFSWzTnwtDuwSddrjIuwfdvB/kcUsAkYIfSDkcEKpWMZpsCytLDcZjQYUI+5VGjQwIlemEyPbfvctZETuZM4ddqSngqVoy+y8HD/GZpXhvaxVTceQKtyrbYSGSC24SpvKq4YSUhL3+4cVu6I8kwOkWn+x0pSgs6HTEvZC4ruJdxmyRFelIozk19TO9iAGHWCOluUkZupayc7hj1XP5FM8U5XR1haAuBrrCsaZTlI71hApyp4X0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw9D5mdgKcnpvAMfjDO2OzSEn6KCENZiGCFyuuq0Vhc=;
 b=fRFHayCeopu/oABywD2ksdKTFGZBtt59mec4kpsdUXyeiBif7gsFMkcdaRLyAOib7wsq0m+qbPFk8UuGgVQpTz/d0nbr1mU8YfmUPOiLTSWlS6J81aJaqsSAiZ7bRucIXhrwFPa7SteMwt6lCjZvygV8xyWutNl653LMiV1I0JDnLVcZU3uvCFTWb7/SZ2SvZaJdXMdfb3pugvX5/K1XygeiFbtZsneQIm9XcGZz9VqQiDUTyhPRcMQbjMCqcq5RKjQQ2rWj4MD7WETtV74NDSJ9ZJXEUCDcpp688cROXPTHH8IsBjZKCyAlmjQuwc832+M8DOLB/RnlqUm132h/2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae65b06a-edf2-b2af-ca14-2c4ad1c071c9@suse.com>
Date: Thu, 23 Feb 2023 12:21:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 9/9] x86/vmx: move vmx_update_debug_state() in vmcs.c
 and declare it static
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-10-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230222120023.3004624-10-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 7013fba4-6859-49ed-e943-08db15901982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MnXUBxeokfVUfXF+wNylDneaK3amavQIDsug1s6DloH44QAO830g2OJQkMe3crE2Fz3apD4scE3r7V6lkUNE9N+tmNp/1/07NXotu76b68LrYovezQ4LPLXk7tDFxBb7lPlHgih3/elIzcfArXxs5jH7ACF0+Uajiy3ljCkbZlmcY2KLZ2AssGFhYgqUdAkWBunN9IRK6EkfnomAub3qDWCHcKWUinAblqAmMUW9W2PuMUXapyA+c0JRIOo+0NFMBbaJqbKiM7s0+kkjkNj6z7CtnKGfDWxG+7z3BcGQVvL1HivfqfAnbzb8fxzndQAoZ1juaDfnYgshjsb7bS47QyLq6GbtH6cVgdNVqd/fxAp1jX7pcGbPNhrZsa9zNGwMEH2qA/s00uaxD8ghVLiVJBew8tDwY6bLVcX2B9DCQwp+Jf0vjFpXNF8i1sY+8eO2DZapDaCGcIet4JHIh2P9etqrgzHuZQlMbO4dJGBviiMC8/74qBhw27dLx4/TW+e+4WytlCIlPGQc0YETd9qpDU/Pe8X83Hc9mbUESsvkiXqnJe5LABmtOEGMPQ1RqbrAecaTjhhfssSj2eVcoHfWOiB1kFFPz8A2ohgvbvx+p2WF1k+DJPxX93b/KYZ9QTxeZPVzPyNsw8ajQM0FbYcetpCWpZs+Dfkt7dhwxZDHFMHsbjPdKE+OdAFo3/KB9yYKI/4L7se9Syz9yoUz5XaSHvDekQ1h8jKYTLF4NjJry/I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199018)(5660300002)(53546011)(26005)(186003)(2906002)(41300700001)(31696002)(6506007)(8936002)(66476007)(6512007)(4744005)(38100700002)(66556008)(8676002)(86362001)(316002)(478600001)(31686004)(54906003)(6916009)(66946007)(4326008)(83380400001)(6486002)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEZhN3JvMUlYbW1MVnIxTWs0VGhMNGN0ZmNqRjBnQTlmeklhSWlaem1UWFV4?=
 =?utf-8?B?d1BLNHI2MXRFWmdNTkdYcHFCWm9oTFRNSTBTTE5DWWU5c04rVk1ka3BYMmtK?=
 =?utf-8?B?ZklCdERLMkQ5dDZHL0ZrQXZWWVhPTGhsdm1SbFlkMGliUmlWMnY4QUFjbUJq?=
 =?utf-8?B?bGR5NDY2R1laVE1FbFEwOXJ6ZVBiUmZaemdORjNKcktTUXVEUTdlU0pkSE5q?=
 =?utf-8?B?RFVBdkRqcEd6L3BqbkVvbWxRaU4zeVJ1dlNjYWJwM2ZFei93Nm1oNHZzUzdU?=
 =?utf-8?B?VUZSNkUyQVo5Ym0ra0pGWERhUFpKYjQ4dklwRURpMm9hZVJzSU1IZGJMM2h5?=
 =?utf-8?B?WUovU05va3djK0ZlVkpJVzViaG94dE9uS1d2QXhITElTMUtZSnFuczVEeG1R?=
 =?utf-8?B?R1oyMnBiS01ENWZWcHMwK1FuaUdhUVdjelNsR2dSek9ON25CTlkxY0U2bmha?=
 =?utf-8?B?Z3ovYWFDcXVvNkVhME5JNWJDYmhMaFFmS1h5dGcrY1d3L3R6TFYwWXpwMDU2?=
 =?utf-8?B?K1hZdFJDYWVsUFJleUhtR1daZXo0Y2FjR0NpMEp6cnVpRkVEcmUzSE1qcUN4?=
 =?utf-8?B?U2tSZ21KTDRuN3VkdHZlMm92dUhGZlhLZVFxbjU5dDJialNsL0ppQlhkMjJ1?=
 =?utf-8?B?VmxvTjJUZWt0YVR3UXlQU3JKaFdCbzNSSUJBSGdzaDUyKzNhTnFoMS91N3lr?=
 =?utf-8?B?bFhFNkJWK3IrNDRaKyttYVFMR1orbTI5YW96dHk3bWpRM25JWXQ5T1luMld0?=
 =?utf-8?B?M1o1cnJxeWFkYkNvaXZqL3BpQXQvQ2RweThjWnBaL3VLVjNGcWZFN0hzck9O?=
 =?utf-8?B?N3liNmFnZGFRSC9wcG1nWk9RVWgzRjRNTnBnWTdnbkl4bCtIOWpRRkZYS1Js?=
 =?utf-8?B?NjJjWHJUSlEvemh6TERTSnhHMVVMcUd4cnFmSmttMG9sZTBXaG0rZzYrNUhI?=
 =?utf-8?B?czFNYmV1bGFOMFFpN2tOaE5BbENnVG1IaGNLcmVxbldFK2dURDhmKys3Y1Zu?=
 =?utf-8?B?Vlh3WXZZcEpWQU9BOTNMVXl0bHF4TnR2U1k4eFJjTCtqc2J3bjFxVDBZME5Y?=
 =?utf-8?B?dW8wcWp3QjIzTVd3WHo1OVJIaktrblpsNUY3T3lBaWt4K05iazZXRUxUMUxk?=
 =?utf-8?B?T3Vuek9hVklHQWNWMEdGOTVZMytSRXlhZTBraDM1cFpnV24wT2FqTXhuMTRK?=
 =?utf-8?B?VnVNTGxDMERqdERMTGtmZ1hwR1V2aXVvNWVPUzUyc3d2Zy9wRllpOFRSNzl6?=
 =?utf-8?B?MFNEa3QxSzZsRlI2b1VvT2RYNjloeWZ0b1A5UHZBUklnUHpMc0t2emVCNEdJ?=
 =?utf-8?B?QjFWVzRtQ2VWMU83cUdhTWllRHlOeHk3TmJhbHo3Vy9LZzcwbXdrT1FFRkhw?=
 =?utf-8?B?ZytLT1BjYkRQVnV0bFRqaHpXZHhnU2NjUWJtN3JLbmo1clZyWCtxVkg5YUVn?=
 =?utf-8?B?WFNFZDNoVHhWMWdWUVU2VkYrbUZ5Q1FLSERlN1RBNWRDL0pSdXRuOEtvVEdo?=
 =?utf-8?B?WDhYZ3dhMk9NSktaa3Q1SjVrS1pQSWU4alpkaFB2L01tR1JERy83c0lmM0gw?=
 =?utf-8?B?ZVBrNGhXMVFmOVI1bTFLSXBmLyttM0crK1ZiTmU5bEdsRDFabzRHY3k5RDRQ?=
 =?utf-8?B?cjgxMG4wa096T0ljYkp5SXFqdllUYytwZXpWSDVIUFBWN29xVUw0bFdyaEI5?=
 =?utf-8?B?MU9DV3BXTFZTUVhsZHZRTXVQMjE1ZDZYSG9CWHByS1drR2MrUFN4Z2VZeUtT?=
 =?utf-8?B?RGxsM2VlbnA0cUtlcUhqYjUvQXJtNE5BRmIvMTIyUFB4VHQvbmFrblhoTU1k?=
 =?utf-8?B?dkdEcTNBcmhBUFFYNTU1eGxJQk5sNFdqeTBkRTBFL1libTQyczAyN0VDalRE?=
 =?utf-8?B?M0pldFdqVmovSFlhZ2EycGFOTVRTNm1zbXpCREhKZEtBSGdHQ3lFdzZGQ0Jr?=
 =?utf-8?B?aU9Fa1VSZWdxVVdodlgxZjdMdXhBeXVGQjFDT3VuY2szZW1lUllyVkMxK1Jl?=
 =?utf-8?B?bEZLTFJHelV2RjFNOGhFUWZ4STREUmMvMFMxcGx3c3dZVlFiNWNXSUlMZ2ds?=
 =?utf-8?B?QUc4U0doRTBmcXdHd2g2NjE3b250Y3ZxRGdtcTRlSnJXMGFtd3QvTWkzaWha?=
 =?utf-8?Q?EAj+2tQR0VbXdD26aNKgOH/c2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7013fba4-6859-49ed-e943-08db15901982
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 11:21:25.1947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xssvfR4Ro5k7kX5nobw0hMDSsdsTiPt3gCgp+dTzOYvh8sSPxD3mvUNez1KUzSCtYyIsAm74rgFtjeUq3mQOGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9248

On 22.02.2023 13:00, Xenia Ragiadakou wrote:
> Move vmx_update_debug_state() in vmcs.c because it is used only in this
> file and limit its scope to this file by declaring it static and removing
> its declaration from private vmx.h
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Perhaps move this ahead in the series, so you don't need to touch ...

> --- a/xen/arch/x86/hvm/vmx/vmx.h
> +++ b/xen/arch/x86/hvm/vmx/vmx.h
> @@ -14,7 +14,6 @@ void vmx_intr_assist(void);
>  void noreturn cf_check vmx_do_resume(void);
>  void cf_check vmx_vlapic_msr_changed(struct vcpu *v);
>  void vmx_realmode(struct cpu_user_regs *regs);
> -void vmx_update_debug_state(struct vcpu *v);
>  void vmx_update_exception_bitmap(struct vcpu *v);
>  void vmx_update_cpu_exec_control(struct vcpu *v);
>  void vmx_update_secondary_exec_control(struct vcpu *v);
... this header again right away?

Jan

