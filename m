Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF71A5FD929
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421954.667686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixHh-0000zS-Fa; Thu, 13 Oct 2022 12:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421954.667686; Thu, 13 Oct 2022 12:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixHh-0000wo-Cf; Thu, 13 Oct 2022 12:25:57 +0000
Received: by outflank-mailman (input) for mailman id 421954;
 Thu, 13 Oct 2022 12:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0LZ=2O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oixHg-0000wi-I8
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:25:56 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f2b592a-4af2-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 14:25:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8726.eurprd04.prod.outlook.com (2603:10a6:10:2dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Thu, 13 Oct
 2022 12:25:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Thu, 13 Oct 2022
 12:25:53 +0000
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
X-Inumbo-ID: 2f2b592a-4af2-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKy7JFFYEBzRohL8f1rQjctU7wOHdv0Rm4NPhvdS6o9ZSNOavyG1orNTZLwfyWMOm6/2ysI8sL+dRAboW23Mu1WOLoaISBOP6+rECx5lLRk/FFOgABcXLbw8NHmtK+jlXfVJZHsqlaGlmk1cHKb740Ourd2gg3meYOENLReO0RRzMGocs9/tC6NfBEejlPrbYmdXGgjtXR/835gDZjVwWYlWbc1RIRcb9GAtKLUERgXUmDmjpBQDx11EdC5i3g3oDgSZRIM3vaH3gYRBvJ6as9LPtxNCIqse2zIg/JI7ZMyTQ6cJDaXHMDsmv++I6bnvasUnFCAxbOk5Ml/N79rYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPgNO8OYVwOz7v9x2ZIMijaOw8Llamy2RUbiOwJhtBY=;
 b=Cqhjg6ic4OBkggWfm9KfJLGzB/OdgXh2gEysB62cJ51i15UY0hZo3wPOx9j/FGvoS2vLRNOlr7EtMddKAAJiNhiathc96tVW1yReZy6OLHCMk4Qmi1ZBGW7J7Z1kaTPvV9wnIa429PHAd5jUs0450bhD7fZn4Kf5NS8thTqbA3xBfFYVxxhUfdPbMYSTPcEv7Cng7Z5OU5RbYmU7nkTEXKZja5JXWG0s4Qexxp1XGFTF23SNlNg0AVwmisLp6LVcdavYTJaW5H0lq+M7HhTu0NSgzwWxZ5ZskaQwGuVEpHycnuub8Kq4bLbN4IdM0YKSPkp2e/2bErfXxdgfzrEmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPgNO8OYVwOz7v9x2ZIMijaOw8Llamy2RUbiOwJhtBY=;
 b=thAQMEF0FiYHUx66iyrYQEzzDcM4LYwwB9FQv8J1sMtVmvQqTwKaVGLFW+YJGreWptKARAtY5pILoXEjXzxQfrl2nUPGu5lsvxg7/26szvxcMY3WiNBOmGDmD67Cd/+JCkGS7NyILayLqES1aNujm5BCa3sO0D233ft5Bo93fvGAnh6MOi27cnUN3xZSX3r3CtrBdI0mIahcvkwc/RC4Q7bj86C9LFRJVWX6jUB5C2/v/2Z3Ry9q4YiHCQMls0rybRMdNtz8RYNSO94SuN6OHlCe8dedxxF1KnXY5/0j3cemQF1n6saoMHgBqC8q7uSKVlxn6RKp5TCGe9INZJUlIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f8fd1b4-e84b-a211-eaef-c0abe9c0056d@suse.com>
Date: Thu, 13 Oct 2022 14:25:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: [4.17?] Re: [PATCH v3 0/5] x86/mwait-idle: (remaining) SPR + (new)
 ADL support
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
In-Reply-To: <84200e9c-ee22-c240-826f-6c7006c0ef57@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:69::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: efcefc27-11cf-4cfc-53e3-08daad16125b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hlLQ6dVFQPOqrMka/jWopRhTfJG9qdUwvtSKzXB7EvzRzNJ2AkqxlbeGV01a2BOr8ca69TZMxWn8QhuN2jKbDmKrBrJI5NYJ3qnrcFQ3LqaCN7kh/cW2ZqooUcX/KJAUjRtRlXnO0rcxk7OO2ZniYtlILR/nK87Rbi/LLMEXau4D2KNyxqAuG2W6w0CkdOflMjyLIg0tQUJ4xyNgVlnSUZXUY0+w5lqyLx7FbQNLuvpHqaBrxXqiPruwwttFBuHVEPEajcK2otvBRGzWB3VcXbv9DrIdWBiKIz6z5/kUEbmJrv39anT5Gw5b0XVJflWeNdMny7G/T7etYLCIKZMn77EEO8/+iDul4OiByD9XRmx6/sWxZttN2GGaf3nzdRkdmgqYqLjDf6k1IkWY6R29LEqR6aKKsmXNylb4Rd5BJX9FyRGUQ1h2QrzjZ+0Tk7Vd8T8kIhkiPhzv8UPa7GBoTdzFma3kGCnMKxPwyWHGx8vXXVt/FbX4zAblfWAkLP0gCUF4yXSw2RfW95/HDLXJ8Y5DXUECkDzW2T8VNa68c0Js8iK8lCtt+TzbjuKieUqQdWfuwZ6SNpnVhre/P4Gk7338IXExTQNhtdQJ60DUpFTGxLMp8hvhMVRKNMiTg/oNrthF8TzQ7C15079QKFi2M/GxMMPp9yatqD2SrZj+NWaMXrJtQSoMD+Y5JPoo68tIkytRA7uUaO2s4Q3KNNSn4hPU3zWnRhiMNAv616rYbHuyYmu743qX9iOkiFQ/SUT1BiQtqRUNbhscf+2zj0kC0DksvXFaASNSEWgLojC8Qj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199015)(83380400001)(2616005)(31686004)(2906002)(36756003)(86362001)(8676002)(4326008)(53546011)(6506007)(41300700001)(38100700002)(54906003)(478600001)(5660300002)(186003)(6486002)(26005)(6512007)(6916009)(8936002)(31696002)(4744005)(66946007)(66476007)(316002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE5tN1pDSWV6SDhlTkNYOE5DV250TitwL09LajBoN2FXLzZya1lDeG5tUzV1?=
 =?utf-8?B?RGtDTUl6NVBFZUxrOGx6TkVhamFmNkw0Ym0wcEdaYndLeVRQclk3azNYaHhV?=
 =?utf-8?B?c3VhNlp3V1Z6bVVva0ovNnZTQm0rZnRMcjhqMHJIK2wyOTJGSkJRY3prOEZw?=
 =?utf-8?B?TFF0aXBBSUpoMm1EUTdDZWlHWjFvOFRFaXN6eWxVRkJOeWh0UGlkK0lWUjh6?=
 =?utf-8?B?K2lpeFh0dzhLRnlVbjN2UjljQ2RkaW54cWJ4UEZ1RjZKQ1VFdlRmZGw2bzhE?=
 =?utf-8?B?VzFodTBQN3QwMW5sQmRnWDBta2E1VXVQcENlRXdlVkd1eUxHQXIvK1ZsRXpI?=
 =?utf-8?B?U01PWG9Nb0d6ckJ0bVhWSGpCbTcxNGdVUTg0VGZiMHNKc2tJNlRSTkh5R2NY?=
 =?utf-8?B?Y0R4UmJDWHlwb1hEdko1b0x6bFZURUpHMEdnMlpIL3FjRkpEaVlFYkpzSzFj?=
 =?utf-8?B?QXp5VFJmRVBtSmpiYTV0WUlxVGE5b0sxVnJGS21FT1lSazI0TUxLWEVGK3lj?=
 =?utf-8?B?MEw1VXdsQmI1NVhHb293NHNQektpbXJSMjAxdjFLcHdqSmxpeDVZVnRQamFJ?=
 =?utf-8?B?V3c1SkZuMHVNdEZ1SjU1SUJkQUN0L25OZnNPc3NoV0kyT3pqL1lDN2tUY202?=
 =?utf-8?B?UE1TS24xMGpOZjhSZndkbFlwbUY0czdoZVNtMFQ0L2laSmoydk9vWGozNDBW?=
 =?utf-8?B?Q1Y0YkdQcjN4Q0RDVmNFbHpVRjlrdFV1dzNDbXBWdWpGWTZqTlZQc1pKbGJm?=
 =?utf-8?B?bUoya2JKVEhkalFYZmhQaW5UNU1hc05WN2ZhYlNqbzhvY3VjR2ZuRCtyaE5p?=
 =?utf-8?B?ekw0RVp0eGErQ2hURGVOdE85eFBqa3VqeFljdTQ1TzIrRTcyTm5NMTluMEMz?=
 =?utf-8?B?UnNxL2k2a0Nka3JYNEdrNTFMb0RLUzNOV2dINHNTbndJQzFHd016SEtLR1pH?=
 =?utf-8?B?VFB5OHVqdHpMeDNwbVBEQ0VhVTY2V0ExRkRwN0dKbk1HM3BqOTF4RGRGeFcz?=
 =?utf-8?B?T01IaEh4eVhQaWIvc3B4S1o2cDdUU1F2V1dkREpybWxveGVMNmxMSUxOekNS?=
 =?utf-8?B?K0pXUzBjZWxyNDZFdDZYVFZCWG9qY0d2WldmTUJmOE9WZ0xteHp4V3FkN1NR?=
 =?utf-8?B?dlQvOXYzRkRseTIvUTF4UE1SRGswaGtGeE95QktkQ1NKa2U1Ymw2WFJqeENI?=
 =?utf-8?B?SW5DZ3JaUkswM3duL1JCU09QRUN2U0s1Ym0xYVFFVUc1OXM5cnRLUDVSRGNM?=
 =?utf-8?B?MldiYmd4VkR4d2FBMFdwaml0UitlZ2J6SjlROE11SmtYOTAwNzhCQmdMa3ZB?=
 =?utf-8?B?ZTRqRkNjU21RR3NTYW1kQ01ZazcrMTNWRVFIMENBcUNzQ0xFY0NTYUV1QnNs?=
 =?utf-8?B?Z1A5eUxFY3VpMlYvWjJWakEwYUN2OEJNQUdwYzlVU3lXSEdJL2JLLzhweG5G?=
 =?utf-8?B?TXNueHFqYVYyRmgwN2F5SDNyMDJwRHlXbzE5NXluVkNsNEVrZEl6cDJwRFlv?=
 =?utf-8?B?SVRKNW1lVkpocnc2eUNlOEx2VnJtbjFaR0R2NnpDRktJUFVIWTFRWmlPeklz?=
 =?utf-8?B?QlJuOTJVYVc5QkM5c0F5WW5GL3JISW1nbXhObXcvVEpiTDNLZTU2MHlLM21o?=
 =?utf-8?B?cCtGelZNMmhKcUVQT01mSktxZ25zNkxOSUVjcmovcU1HN2NnTVpUZFFicmFP?=
 =?utf-8?B?eFJtRE9CN0lMTkpnQW1jbmRsSHA3WU5GSDJvMmdnOTFLM1kxZ2V4VmM0S21Q?=
 =?utf-8?B?aVZrNk8zWlhHd25HeW5TVzRZL1piOVpYUmZmdXBhWmFpbDNQR1VRU1owT1gw?=
 =?utf-8?B?YzZvSmU5N2ptNEpVV3pCL0xKL0lTT1FlYUdhZnpmR2VkUUJRTmZxbGMxMkdz?=
 =?utf-8?B?UzZhMGtKUFNXd0YrVzg2WWdqcjllTWZNZGJxcHRFamtjdW9OQ1JYZ3V4ZExj?=
 =?utf-8?B?SFFsQlZMdFdUR291UUVzRnJzcmdiR3poL2w4aDRmbTVUUEpSdnZKcUxTbG9n?=
 =?utf-8?B?cHZTb1JuRXNFa0FDZ1A3Q3dGajJGRkdwUFYzbkYwOS8veHFWMmlkdGZnVmQy?=
 =?utf-8?B?eE9FRWo5UXI5Uis5VHhobHU5eWF0ek93L1Y2b2FIY1cxNUpvc0xvUiswYzZh?=
 =?utf-8?Q?9f0KQEqZyBHLZyDZkouB7wqk9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcefc27-11cf-4cfc-53e3-08daad16125b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:25:53.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEuy3vWicyXRQb0hQV2K23rv8tM1ZOTQKqeL4wlyRwgaLT8+rbcxcLQhuQeBeVRXxR/7oo4i60ZQrvNXl5gUOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8726

Henry,

On 18.08.2022 15:02, Jan Beulich wrote:
> New changes have appeared in the meantime, in particular one partly undoing
> what we still haven't merged (patch 1 here).
> 
> 1: add 'preferred_cstates' module argument
> 2: add core C6 optimization for SPR
> 3: add AlderLake support
> 4: disable IBRS during long idle
> 5: make SPR C1 and C1E be independent

just now acks have completed coming in for this series of ports of earlier
Linux commits. This all targets newer hardware which of course we'd like
to properly support with 4.17. Unfortunately the series was kind of lost
with all the security work which had been ongoing. Therefore I'd like to
ask (in part also motivated by Andrew to do so) that you consider still
allowing in this series. In the (I think) not very likely case of problems
(first and foremost because of the changes coming from Linux, rather than
being homegrown) people always have the option of simply turning off the
use of this driver on their systems.

Thanks, Jan

