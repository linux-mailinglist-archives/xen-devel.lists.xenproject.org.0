Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FE3666E98
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 10:47:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475938.737854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuBE-0002LL-TL; Thu, 12 Jan 2023 09:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475938.737854; Thu, 12 Jan 2023 09:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFuBE-0002JX-QY; Thu, 12 Jan 2023 09:47:28 +0000
Received: by outflank-mailman (input) for mailman id 475938;
 Thu, 12 Jan 2023 09:47:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFuBE-0002JR-2L
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 09:47:28 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2066.outbound.protection.outlook.com [40.107.6.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed35518-925e-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 10:47:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9354.eurprd04.prod.outlook.com (2603:10a6:10:36c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 09:47:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 09:47:23 +0000
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
X-Inumbo-ID: 1ed35518-925e-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3kU3/K17peqCx/MgJ7ZCFWAjEM+gleocgwPRMQS8WgxMZgR8WDXu+VGKxRQCJbqcmK7Zjzco3KcNGmN9vwpgsCiujqs6/wz1yMSYUoilw5Md6Ovi0UzPC9deIfWJUVD2eCzNjjUg0C8OBHtp5OnsOc2ITnhHCKWJ9MMsStbHNg7VyrVH8xp0yM6XXY0oxTpdQd3RxvZvV7rmne+8MiHykGlPP08Fcks7lWjIzFjIqoCzrr+SlHSANwFPDF4ZV+QO/2A/qekOHUWM7hQJXaiiIiBFgAnfzVSpzHOgKuw5qlBGDOxolJq7OUZb3mdU+YGn9vszEPE45j3tx5ni1PxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+eX77cSMdawL4nZwmXFSn5kJuDxSijDU8TSMLh4aOU=;
 b=Vj2T75Y6kJC8vFFoWvW1lPJX8fARo2Gwy46zGK7ECriCfIw+btZzog4YY1ar0dOuK+loyDnucw/7rc/SXieSdigHiXP6/AJ9SvBEKz07ff7anp9D1Iwx26VIgR7XUyDCGKdC7uenOafgYLvB6CjEpuv9kifpkA3wo219QTi/B+pHsZpNMXH41qBfYwxJ+rb0LJW0bRVwBq3FRsuLwsJZ+Q22Z5thoBLBs/F1+Ov5ZEklGz5sfpduQoFX6jZDnUC5uSEAJnoAIQqgGOJ5qEMu/LMR+5QCQZ83km4J9GXme/j27RX1FSPCryZ1Ic2ln1JWQZfh0fSeiOTbJUBFwBtpDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+eX77cSMdawL4nZwmXFSn5kJuDxSijDU8TSMLh4aOU=;
 b=TSRRFsi7ywMB8QbrvVw9MTI78UT+01Rg+tAe1ceFaDK2KpoiQGqwqUfJzl7ApICnHWvpoWXsvVzDIKOiRnMDLPck1TfGBfFvBFBz49974a3JTw3pTCEsY0xIFoZyGtBW6547dJ93mHvU9KVtEZc8Eh4O+azT1J2mUcNbB0veh6Sxt0Z9lUXXf8JdLzLG0RjsZLhKesL//qr1DiACgek3z72yK4NdeF7AG0yDqljsb3DD3gcg5zH5jjWq6GFBpsH7TXiN7evLMVZh57+lWUIVZpIaC2b3hNBrPmrs/HX/s2Ejxg3uLXUuD8tiqMuYhYI/MRkkvq/iFdporpSQYP5qWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a438f16b-7d45-d7e4-2191-4ed7b2077785@suse.com>
Date: Thu, 12 Jan 2023 10:47:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 9/9] x86/shadow: harden shadow_size()
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <9bea51eb-4fbd-b061-52d7-c6c234d060a1@suse.com>
 <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c5d201ac-89ca-6baa-d685-5bef2497183f@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9354:EE_
X-MS-Office365-Filtering-Correlation-Id: 98776e95-58f4-4b2a-5320-08daf482018e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8U4sVuMCz19Juq6VjpHen1TNAHw/QDPgdKb0tVrFWL/fluvKV3plclQVSr1Oc/m2p1EZSfWnmFXuPJB+/i3docE1MyNB/m+FKAMI66BMFTWg/gzXjEHVt4hD6+FKlB4GglLHBgoB/l0C1ihJniUtL7PgxP6Y12Qt5RJCwv5bNPPK1HZFhap1CuLL90s8c7W6iOXsEqHwAviwSgFt+c9L7K3S5sHIoUenT5Ns4EB3uIz9hpOZf0o24Cjxdta98iUABgcFaM9p4canR7+TemKV2Ks22zXnFaSoVSdmDVlCLjZuqFPxPVA8CdrB7Sk+iG7aOTxFX3bQHQ22UTZwS9Vti3a+RI/1jblvFafbjDW/Vdn0GZ6dTh0UHRW9pS7ong+meUVc2Rp4Qzg7+Uwrp25RcWBm2Tk+eodqnMjEMxieZ5CVlA4GEAxVENft2H6tbjmEJiiSEcA9aL0dGShsfgIAOJMI3lFZJAPbDjeeeV6U6js6Ald0nIbdycJ9JieNDpvW/qVvIxShfkL0g4mqM68t94J2Gv4OT04f6hQSPmy8IlvDNomA7v9+euceZ49GdIaZlOwvmFlMg1pkEHSrkzJYUuuK6zACw2mR0Whxn+ZILTMbigyuI1lJGEGF25a1bVhJbS11UagkOF84ntNmKkiok2sK7zWRPuzfbBcp41AwXLA6r6juWz3GWn/uj5oxxM4x0M4pyVlghsOnvUi3r7efVXr7rbdxLVssy6AoOieiqM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199015)(8936002)(26005)(5660300002)(2906002)(41300700001)(66556008)(4326008)(316002)(8676002)(6916009)(66946007)(66476007)(54906003)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(83380400001)(53546011)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2F6dDZVbStpK1hhY2VoM0VubnFRTnZiNVpUNGhxM1BFcGxDSjZ1Njh4Y1Bu?=
 =?utf-8?B?eFBZZXZ4S0EwelhXWWVBc3hXaEtQQ3BwWWJyMUlJczVyZ3FvcktVbzkxUkJl?=
 =?utf-8?B?QzZhZWRZNWRER2FHb3pnZzU3RzlqWVIwS2NCbFRYUTE5ZWJYNjNBN043QUdD?=
 =?utf-8?B?ZWs2K21sNi9rZGFTSjRFVWc5SVZrTnJJdmFvQVZCMFVWR2ZuNDNlNlBNOHZT?=
 =?utf-8?B?bm9nUmZxdklscDVVa2sxd2FuUmlWZ3VaWTBiaFc3c0NtUS9oVnZKaUM4bWVG?=
 =?utf-8?B?djgzM1dSWHFHYTFOdVNmb2tBUDAxUXNrRGJQUGFzcncxdnV2Nk0vKzh6bnpG?=
 =?utf-8?B?V2tQODdIOEpQMzJsNmV5d210My8rcU9TOFhqLzl1Vzh1UnFxRjEwbS9TNTZB?=
 =?utf-8?B?dkpja3BxUDhUQ2lBVUFmMUVqNEdQM0RBbHVrMGxaeTNQdTlSZzFjTG5rTUtO?=
 =?utf-8?B?aGxiQytDQStqMGtSMWxDbThUbUJhQjdrczRmb2VBOW9FMnJ6bzFaQlRRRTl0?=
 =?utf-8?B?MGxVSFAyMFNYeFhzUEsrR0crVGJtTVVyY0pGcTl1dmM4a1luMmdYMEJKaW8v?=
 =?utf-8?B?RzEwYTFyNlppLzdpREtNcDNrSU5OWnF3VXhBSmRrc0YwT0d4MmdUT01na3Z1?=
 =?utf-8?B?czRaZ1JaSndieVJwdmdnenZDL0t3UGo3OTlGM0prcHhHdzBRVzN3ZnowSFVS?=
 =?utf-8?B?NHdDSVhaRTZyOUxDWXgzbDg2ZkNqdXArZm5nNXU1aFFUSGZyeWh3ZkdTUnZk?=
 =?utf-8?B?NmRUMEhRTFJMc3ZocHQxTnh0QTA0OXR2bGIrN3ZPcXo4WEowcXNZbHNmaU4w?=
 =?utf-8?B?Q280N05YRnUybVE0cDd2cXpvb3JJVzVpSHFoTHo0aHVFOExJZFNHSEtJUkx5?=
 =?utf-8?B?S1UxSEloc1RsOEdKR0dVeGJGYmdKSlBFYk1KNVg1SS9VamI3M2F6bzJKY1M5?=
 =?utf-8?B?ay92Y3NxK0VScWQxNUFMeGJwTittSVN4enlESFdTZ0FGZ2NjZ1dBUkFxMk01?=
 =?utf-8?B?YUJmZTZkeGNwTENHMGNXa3ZqYjM0NlM4YWRVcWxja1VBMm5kRjhxNWUrRHJB?=
 =?utf-8?B?R3FYcldZemhCdU1lazlvcmpwQUNZeDFhc2oxaVRGVEtlOUZhNDd5blpzeFVY?=
 =?utf-8?B?cGhpMDBkZEQ2NUR4Z2RuVHczUVZNRDdGZmwrUlJza2t1cWRMVkUyaGtEWERR?=
 =?utf-8?B?ZzY4Qmo1RFZSSWZpb0xiT2tkSVBNVXBtSGg3ZnJMUGJBWFhIS2xtZHp6ZFhx?=
 =?utf-8?B?ZlVSV0NiMm1vaEp4VS8wUHZ5S01XalEvYVRCUlJYb3pBUVRtaVpGUFNUc0o1?=
 =?utf-8?B?ZzNJMG55bHFYOFIvNGJucTNjTGJDaVJaMktJOXhMc1lCZlZmWTlBOUYwOG4v?=
 =?utf-8?B?UGpmaUhpOXMycUNBVitmbUYzSG1zY2tDa2VrOUpxNHVFOU43TS9EWGp1T25G?=
 =?utf-8?B?OGFtb21kSVFZeW80bG5yNjdLaU5SQ2hwUkpST21TWFNsTDQ1Nk4wVU54M29l?=
 =?utf-8?B?MUhWSVp5cFFkV2FoajJDZysrL0VhOXR0OExpR1gzRjdWSTFIRkEybGZDWXJr?=
 =?utf-8?B?cTNvdW0rNTk1SlEyYmg5YkVKSEtYVXJ3cGI2Wk92QmVDMU9tVnBCYm9vSktW?=
 =?utf-8?B?azgwVkJkcEJMeTNhS29EeVZGcXhTN0dNSUxxYUtEdnowZDJjazJkL1NlalhW?=
 =?utf-8?B?czVpcFpkYUpDRWdZUUxWb0hLWHFKYURCNVJ3bDY2UVh3MjFvVlIwblprbnox?=
 =?utf-8?B?ZjZJb2d0S3BkM0FWZ2xFOUlERmsrNFkySDJRcUxQNlpuM0pJMDhaMlpVRitT?=
 =?utf-8?B?dnRKNGt0Mk5UcXozVnRSd1V4V2E1NklaZHZTbEhGeWtpZFM3MndkVmsrWDBY?=
 =?utf-8?B?Tis2UHVacW51VlRseU9pRDdUV0E2VkJsaXVnTDl1eThjcU4yR0N5enpTa3Rp?=
 =?utf-8?B?SGNXUHo2MUdZU0o5UkNiN0gzZkdtaGV0cEJDNyt6R0JJMzZoQzZIU2c1S01J?=
 =?utf-8?B?MnVBazJtS21FL2R4eGdOK280N1pNQzlJK0RGeHRhVnNEN0d2SGxkcDRpc05Y?=
 =?utf-8?B?eW9BSC95MEppRy93ZmhMeFRQem1GdDgwT2xVNG51TG9QelV5U2toNVRvZ2dU?=
 =?utf-8?Q?WgD0piJ5M3FxOHWzDythdP6gY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98776e95-58f4-4b2a-5320-08daf482018e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 09:47:23.6939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIKv8uldeje7ySxPXiz+QR02rgtYRQ5/lvNJZvGX/ykNUo8dSyJnXxrO0O+rRLiV6fmL8z9j3ThV15QrldkzLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9354

On 12.01.2023 00:15, Andrew Cooper wrote:
> On 11/01/2023 1:57 pm, Jan Beulich wrote:
>> Make HVM=y release build behavior prone against array overrun, by
>> (ab)using array_access_nospec(). This is in particular to guard against
>> e.g. SH_type_unused making it here unintentionally.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: New.
>>
>> --- a/xen/arch/x86/mm/shadow/private.h
>> +++ b/xen/arch/x86/mm/shadow/private.h
>> @@ -27,6 +27,7 @@
>>  // been included...
>>  #include <asm/page.h>
>>  #include <xen/domain_page.h>
>> +#include <xen/nospec.h>
>>  #include <asm/x86_emulate.h>
>>  #include <asm/hvm/support.h>
>>  #include <asm/atomic.h>
>> @@ -368,7 +369,7 @@ shadow_size(unsigned int shadow_type)
>>  {
>>  #ifdef CONFIG_HVM
>>      ASSERT(shadow_type < ARRAY_SIZE(sh_type_to_size));
>> -    return sh_type_to_size[shadow_type];
>> +    return array_access_nospec(sh_type_to_size, shadow_type);
> 
> I don't think this is warranted.
> 
> First, if the commit message were accurate, then it's a problem for all
> arrays of size SH_type_unused, yet you've only adjusted a single instance.

Because I think the risk is higher here than for other arrays. In
other cases we have suitable build-time checks (HASH_CALLBACKS_CHECK()
in particular) which would trip upon inappropriate use of one of the
types which are aliased to SH_type_unused when !HVM.

> Secondly, if it were reliably 16 then we could do the basically-free
> "type &= 15;" modification.  (It appears my change to do this
> automatically hasn't been taken yet.), but we'll end up with lfence
> variation here.

How could anything be "reliably 16"? Such enums can change at any time:
They did when making HVM types conditional, and they will again when
adding types needed for 5-level paging.

> But the value isn't attacker controlled.  shadow_type always comes from
> Xen's metadata about the guest, not the guest itself.  So I don't see
> how this can conceivably be a speculative issue even in principle.

I didn't say anything about there being a speculative issue here. It
is for this very reason that I wrote "(ab)using".

Jan

