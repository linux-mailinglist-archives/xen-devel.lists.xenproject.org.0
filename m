Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0B76678E2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 16:17:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476275.738368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzKD-0003mo-3U; Thu, 12 Jan 2023 15:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476275.738368; Thu, 12 Jan 2023 15:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFzKC-0003kr-Vs; Thu, 12 Jan 2023 15:17:04 +0000
Received: by outflank-mailman (input) for mailman id 476275;
 Thu, 12 Jan 2023 15:17:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFzKA-0003kl-Tc
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 15:17:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 29ceb453-928c-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 16:17:01 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7752.eurprd04.prod.outlook.com (2603:10a6:20b:288::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 15:17:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 15:17:00 +0000
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
X-Inumbo-ID: 29ceb453-928c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6GMulc/9imHLAvIEFRdJHiQqCGubAwSQuruJXVbrI4SnJ2kHRndP17nqIfJVIrpXwlouhhIwiRyBdWUVSlatL+shbcPbeCbNHzrHlwlOkmfPGZtg6va2GidE8G6y8/lXbMRZEZdLZ/FrUoDBIYgpbUwlq3LnLBsYFVCLOKPpp+PTKbhvbFuC5D28y2jTn404l1GR7VvxjGN/e2xX6Ztf+cVmoJfSOaU5nFxJgwQj3IElX9eRiYm2rgiLsbPBfSBqQH32atgfCMbAiA9/xvzigVlxeYtsuQviCShv7YC1xTtmn46UZ6l7PCbfTpgUBM2M655YtvV7yAWB/wC+yay7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkSZomSlQTVH2dS4wNry2udyFyEzoc56R83Z8NYcgRc=;
 b=WCt3S0F2fXvcx27oQvVQeZ80iW2B770cxgy6eNplXeFDh6VRZdNo8UvkRk/RuVy96RhtU1ikmPcTal83lWxyslcPA2b/WPp5Tcuz5tvESQcofgsKBrkZhTcR15QU/IFhHrAfiaVVbLv8yx1mLCoeTHdKNR/g9qYdbh12ktDhK4g9gxRbtCRgQIEAdyJV2FwjGzQ+7Cs3YY3GQ7kV5MbZfpV2bhQBml7VfTuNbHAkhlDiE8gmAJzsrYONEiouQhQ7L7E3EJ7BFDthGnZyGSz8yhcFU3fWTevQi/XpHrd4ZY9FbKpP4xhpMA7N9I8ZbLiQSrS18E5ZUcvSdWhhwZQ/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkSZomSlQTVH2dS4wNry2udyFyEzoc56R83Z8NYcgRc=;
 b=ErypFlPdepOya6zA8kF1bQFbDunx9fjuBj02rPJWK/vqnIlCd+uG3SsKx1vzA5Y7b/vZ4bb1Ydkd3UAm3FfCZykBs51PLmRSsV52ddoybOUeinblCd4tjGdBhy5vEvkCnYq+5ccNU3LX4pJ1U7ItsJtDX1Kea+nq5fcdDnB/k4nXlYh73Pxvk/CbgVDagHaxb2t93T0khrv6zbdMWX93seFke61FKZsBOuUEAH/lSneBYpoy0WHVNKYUSicbgVCOtRsa3ZMsnR0BqZ9jmMXXySn600AmvlYGqfK6z9NE4CxbEWTl/zbdL034WNBg//kJXrNBOX0wT+s+MfBAMGe+/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f19eb724-19ac-552f-37f2-cc10d3db9144@suse.com>
Date: Thu, 12 Jan 2023 16:16:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 6/8] x86/hvm: Enable guest access to MSR_PKRS
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230110171845.20542-1-andrew.cooper3@citrix.com>
 <20230110171845.20542-7-andrew.cooper3@citrix.com>
 <f64f0bbf-8f47-e897-eb7c-51f11c9ea4a8@suse.com>
 <f1e2d71d-5fad-962d-a7a0-af1044f40de6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f1e2d71d-5fad-962d-a7a0-af1044f40de6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 289b5a13-5a7a-42ac-682e-08daf4b00d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XesXdIuaUVoPID95j7c80M+UI4oGKcDgQFvHhO64GYw7P7ZwcHwegw3bqzlvRz2/qjvpPfOeXGaU8pRlD8DvJOekUK9SFK4JIKZh2JvQB2OpQtTuGIvtCT1VaV4NiCqNJ4uhN+Y/JV7pqCGNiMl363o+XxzwQJ6ZrDIad/3sLAgTT2tkdIu7VdjBOvVCWDXahZ1Y4IirT3gR8lZnbsbfNxeA8nYQBTOZVo9BGXtZ5y9tF4q30hjRxfPhSiuovTEr2FxedTv+fB/BokeKU/WeWnDdzQBPwts7HU3FLfby3XbmbP4CfZ2HPnS1vE1Bo+WforkNyk/AIvBekCykkKrA/2KCPJ/LqbNu1hilkx58fmBUIcr8Pg1U0UN0RYrE7G2xdmiOvyFWJKOl9I0K5bQz2yqdvFW+lTplYdCCTlFE23ZGhzxQppe7yudMMVKgXr+gFEaTJRqARQJpP1OAxU06W8samFM6ZbgVgfprJ9pkFzPJuJabwqFzue62qLEOeFnWdU7VV98x4ekW0R6MaTQn2AIXdwn015NPbRts0E8KMFnKZzWiaMdEBj3exYpP0CMvxh+LzYAjuYejPOlVV9sUWfV1ic2puB4S7fU70i987HWO7JMV0npqdy/Tia9HurWK7bpYU/AMKl0XMIlaTsxIk02KM51mbHzfj76pN3MwSwyJp22sxEjqjOTmSUKQa8r43+VeSBSNTnyOD7As7AEoHNstxbIVrv9FrP18S947Ojk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199015)(6512007)(478600001)(186003)(31686004)(6486002)(26005)(316002)(66556008)(66476007)(66946007)(53546011)(54906003)(2616005)(6506007)(8676002)(6916009)(4326008)(38100700002)(8936002)(5660300002)(41300700001)(83380400001)(86362001)(31696002)(36756003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjJRQXZ2OEl6cEN2WEYxWTl5NFk3aHlESVlCeGZtQTFtZnFCTFJ3aG9wR21Z?=
 =?utf-8?B?KzlKZ0VEa3Q3cERjWlNzSC9qR3lXK1pnWEIyMDBmT29PdTZPOGpGSW9tN1ZM?=
 =?utf-8?B?N2c3bDNocENreEwyNlNVOUhYK0diY09VVDE3T2tEYUhrUlBKTnFheG5qa3Q3?=
 =?utf-8?B?dVNxbVZmaFdoTzgzRm9oNGlIbUROQzBUTHBUNlN5YXpnbGM1UUhXZVJwa2Vp?=
 =?utf-8?B?akd0dTZXRlVFUmg2eTRwRDNIRHQ5RjVHOUVKaW9Gc2RpZFFrWkJIendYV1Zy?=
 =?utf-8?B?VXh3Q1ZzdmUxZldqTHZ6UmFUWDk0aW9FM1RQOWpZNlJONGZlb3dCUGgyYVYv?=
 =?utf-8?B?SUV1a2piU050dXltWXdDMldsWDFQSEJ3TTVhQWRIWnlTZURZd1hPS0VLL2l2?=
 =?utf-8?B?bm5oRXFDWmVKM2NpcVBCaDBVQXlGNU1ZZ0E0MXFoNFpUTG5jVG1kbTg3WDFl?=
 =?utf-8?B?MkxZOGNEUnBTVUhMaGd1cUczVnBKV1ZMcjhIOHFXZk15RFJuVkRxT2lEeEY5?=
 =?utf-8?B?U2pYY2xOa25yd1BqZ2hqY05qYTgrNFR3RW1CaVZYaXFDc2JFM1FaVnd0UWRT?=
 =?utf-8?B?dW01a2tkMjJFM2NoL20xK280MDRoc1B4bHNGRFJvQko1MnBkMVF2c3lzR0xx?=
 =?utf-8?B?NVd3dzY2d0NEd2pLUVFiTEtWcTdsTzF4bW9JSU9xL252ZE5QYTZMdmwzMmRx?=
 =?utf-8?B?UkpqZmJrRmkwOEhKZ2JQekhXUE9NbjBhaW1ZcW94dU1hR2JBOGhIQk96Tjdi?=
 =?utf-8?B?Z200WFBSUUY1UG1YcFU3bG1lamxJYkNGSUZhL045SFpKbHdldnBxWlVwY1dL?=
 =?utf-8?B?Zk02VzdBRldOZEdZMEVTUS9QY1dVTGQ5YzFTRmlYQkdnZ0Z5RVdXWVRPV3A3?=
 =?utf-8?B?TUJ5M3N6M3JyUkxDQXZNeHF3d1dyYTJ6RU9MTEh1TG5DaFBpK1RaUXJvcXhy?=
 =?utf-8?B?UncrL3BrU0pCRUx4QU0yKzhtMEJiU1l4MEw4OWtPZmdQZDZGanlYZjVGeHNW?=
 =?utf-8?B?NEFBR081OHlRdm1JKzRjVXRJS2IvaFUrcWFXSlNYTlBMZHpGWWVQR0NqblR3?=
 =?utf-8?B?Rld1Z3lhajNQSTZ2SXNuUXhBdHVYYm5VYVRzc0M2NndvVHdsQngwdUVPdGJj?=
 =?utf-8?B?NVJzc000V21qMVFIY2J0RUsxTXd5RisxN2s4MHppQVdSRmNjeGVSdGlyNmJl?=
 =?utf-8?B?eisyUENFRWxrcnBBUGhFWTAycXRSNWdIRkN4cUtoVUp4dldZVDZlNm04b1RF?=
 =?utf-8?B?NVFhaERFZWJvS0hzNUlLNm8xZW1FOHFBSS9kUmdOMUYzdWd3c2dqUWkrek5o?=
 =?utf-8?B?T2ZzUVBsMTYvOG1VaENoa3dVdzJGSVpvRjhSRDh6U1BRbktuRUtmdU85OHF4?=
 =?utf-8?B?Y2hidmhjUEI2NUkrUXpKRlVtSFFlTk4ydWFRcEpsaGY3ZENxRHdrWGdScDhK?=
 =?utf-8?B?ZmRUTkZBMjNzQUxweUtBY0lCb1h5WHFlR2pmUmJhYkg1RDZ4RDQrVHQ5cTBL?=
 =?utf-8?B?YXloSTlWVE5TZzI4L3hYQUorcElXUURuMTE5Ui9IZlhIb2o3OTlxTk1TKzMv?=
 =?utf-8?B?cmw0YUZGdmRhVm14eDRocDZsVXAwRk00NWRnOE1KQXU0d3pNVmM3YUsvN3VO?=
 =?utf-8?B?R1JPc2NnUXVvRHdSd09maFlWUXhCQjAvY01XaUwyejlFZ2NFYVl6alUwZEN2?=
 =?utf-8?B?VHJVMmhUanljRTdnM3FiOFNtdmljTGp3MEpaWVZkL1NERitxVjI0ZVpMQktJ?=
 =?utf-8?B?V2V2b1pmMm84ajFWaWdCblc5eXhIemlOeFJEekx6aFFDZnRPOUEwOUFKa05C?=
 =?utf-8?B?cUwzMEJESk03TFd2Q00yNjY1WS9tZTZzUzhvVVVOaDB0TG9jMjEyWlpRYjg1?=
 =?utf-8?B?OGZ4VUo3c3dtL0x4c04zZ3Z0Y25tb1EycmpUb2ZjZUVLZzVULzJrNmZYako2?=
 =?utf-8?B?K0pBZ0trcUszZ1pwdDlla09Kd29OVi9OVzBUSzNuVnJSYW1JZk96OWZVbjNl?=
 =?utf-8?B?cGxBTzR1WURZYXR0V0dKZ2NBdzE5ZjlNWUQ3Q3VuTTVIL1dPekNwYlFISDk1?=
 =?utf-8?B?U0xSU3NmQVZFbzZPQ0lQeFhXbjl2Mjh3RUZUeFpSSTd5TzFjY0FScE8yVnVr?=
 =?utf-8?Q?fuRZWriSpLQ4FjPyIY06iu2Qb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 289b5a13-5a7a-42ac-682e-08daf4b00d5c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 15:17:00.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nI6nFM5Hip2RLath4XYehRJVREFJDiJHHJeVVJfcM+HLGckjr6DTYwtRRwa2XHCTFcPwJvHj13+QnkhLEU+Vhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7752

On 12.01.2023 15:16, Andrew Cooper wrote:
> On 12/01/2023 1:26 pm, Jan Beulich wrote:
>> The other thing I'd like to understand (and having an answer to this
>> would have been better before re-applying my R-b to this re-based
>> logic) is towards the lack of feature checks here. hvm_get_reg()
>> can be called from other than guest_rdmsr(), for an example see
>> arch_get_info_guest().
> 
> The point is to separate auditing logic (wants to be implemented only
> once) from data shuffling logic (is the value in a register, or the MSR
> lists, or VMCB/VMCS or struct vcpu, etc).  It is always the caller's
> responsibility to confirm that REG exists, and that VAL is suitable for REG.
> 
> arch_get_info_guest() passes MSR_SHADOW_GS_BASE which exists
> unilaterally (because we don't technically do !LM correctly.)
> 
> 
> But this is all discussed in the comment by the function prototypes. 
> I'm not sure how to make that any clearer than it already is.

Okay, and I'm sorry for having looked at the definitions without finding
any helpful comment, but not at the declarations. Certainly sufficient
to confirm that my R-b can remain as you already had it.

Jan

