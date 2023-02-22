Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7612169F2ED
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 11:48:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499364.770469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmfJ-0005Or-IL; Wed, 22 Feb 2023 10:48:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499364.770469; Wed, 22 Feb 2023 10:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUmfJ-0005Lt-Dl; Wed, 22 Feb 2023 10:48:01 +0000
Received: by outflank-mailman (input) for mailman id 499364;
 Wed, 22 Feb 2023 10:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUmfH-0005Ln-T3
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 10:48:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7d00::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea99e88-b29e-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 11:47:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7194.eurprd04.prod.outlook.com (2603:10a6:10:127::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 10:47:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6134.019; Wed, 22 Feb 2023
 10:47:56 +0000
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
X-Inumbo-ID: 5ea99e88-b29e-11ed-a089-e9535cc0f9c3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaH4onAMUPUthJOVZB7o6UW0ZmGn0ACyhnQ801pqsPYd2LLDWtQbymrpHZamkexYgjI6M4v4I7pBxaGeQH7PPmNUIMnHyWOXyAoP7F9UaG+bnR02dxE3bT7SgiQ9z8ewbyqZbNpmx6f/AVpbKK1KMlqOkbDr9KBTladIYEA94lFbMKgk+bCTksVJgQ8DdD6svN94WzNl//EqWh/8/gsd8nJ4n8zieF8QHzmKOGM7Rj0ics2IACUWGx65WNW2Haqs5PdorEH8Zy1WisIbuX16iL6XvKVFTuu/VPOYxzs8ve2nBj+URlMiwIws7GFWotpBpgEVQLELiCkxtxGucBtLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czLsrhaeSt88jH/RsPNV2z++4bWSQlkbq8CPkJbo8B8=;
 b=VG7p5CdNT6tBVIxuvVWU81NAOLSoW5ryr/mpbW88NVW4Vh4YgLyDJU/onsMvJxjhFrCmdYid/7K/4EbwPIbmzJQLdko+8xYd5kbNmgKnCWiqJP9vqq8mnCoLkbfdovWNX2b6ACr7XIxGTsOWzAuA1ow63fA74y9t0dQfH3A9ErM/iNsGTSJfCWDTlGiYHu9fTpUsBWHOv/a/lCLM9RrGzmo4f42CJ1s5GulhOw6fEWCSXFALtYkTZs/YbrFJai22xEYrzfsbrxEFw+vMdMR2ZElh7RJLPvXpyyqE7Ahw1URocuKCqOTZmvkI350vxu/vEWQpYxFA5Yl91+X5YJ8CTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czLsrhaeSt88jH/RsPNV2z++4bWSQlkbq8CPkJbo8B8=;
 b=gro30kynY8tCMdzKmoX6CqPg95NxKBZ38rCCPRujMnnxMFJiOrZR9l4/kCjHrh5NfguNwGuBfreiuJT+UNyEKIRrQOudoQ3oq5ySWP6ak0nyrA1fNZcGs2NipJ7RLhnJZ34vEQOiTR46w4uZwh7vTp/kEB4O9GXkj16mANdhKBkhQNEniffI2ig188V7RHQKOKvKMiwnp798css6IdnlVtTBdCclKtNhEs2FBr0pSg6D26Gsqg4uUtaTDLo/HOQjgNF1Lxg7f5mdszJruYdfinz92Rz5kCx2ETFe8UC+ERX84aULdl0JELZtOs9RxLNVdw8ipKyhaoTI5m1M7sm4dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3dc23c64-8058-c9a0-55e2-68f99a6235da@suse.com>
Date: Wed, 22 Feb 2023 11:47:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] x86: Perform mem_sharing teardown before paging
 teardown
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a7df4a01d7b901eb7b43be08f6fd3dce82ebbcd0.1676480656.git.tamas@tklengyel.com>
 <2692e97d-b3d6-6512-bff7-c13941c10cd4@suse.com>
 <CABfawhkvb6EmW7HPd+sfNBwtbmFyEvnSG2vK=4_o9oYs=8OQjg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhkvb6EmW7HPd+sfNBwtbmFyEvnSG2vK=4_o9oYs=8OQjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0013.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: e2fc1ee9-54e1-4c28-80ea-08db14c241b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZXclMZVgoKx5WCWDiu3ZyFhkfT6Z3Cdst8BV5m2FOOy5kSOP2cMuwqzy8Iv+Sk2oPDgsnbPQbj/sCBIN5P2TQGVoWPx9ZbKAZIX1nrphqWdGCktMV4Hlea3eLtSZ/v25UhsOjA3gTrpKfzcqRIhwSIhcjp8MQRq2BjI0VVs5cuoDFmnLybVhJXO9H6dNQ4pmCzr8pdIyadQ38OPYgh4CwMDf71fEsc64WixcWI4VTSE4ajKG6WCabEZJzNNHpR5p+QShqx2OnE3QYQoatV+1/wq3BPGka4F+gDfEHIRKDuVRFa9g68vlq2VYi6a5ONK9YUPLcNc7bFSSldXI1Lulb/mSENyr2g7/oVcbUy4PWleUYhx7OnxU/UID5hjRh+ir/793GyGfOcicYs1FZHnWrIp1C6dRaTyQJkICQw/Vt7oq0bKoeZWJsYzwnf1oHO9mhqKLTa2d+CdXUYVuI8jdD87KO+ictfv8tVX2cpV0d55/LZRGWrC8a2JScwYZuGtKpR08YH69dPLVz6IRoQ6ns5KI1aHKj/0R/3WQMy60yKSREAgS7ymgSZ52E1OgB7bJuWR3P1JNxMkJ6u7Z8bpRzc7fcEBb60fXk38oUm9nUOtMcy/Vx2mdD7rNuyXImTMlQD4pVO+IUi+WiCuVtonNf+1e1jQwj/91ppSz7d5rYjKbV+DBJKE84vFI9FoAuDC5t6cLedvYkdJV7CSYNQc+jtRg5AOYykLSzHNEkoCNz10=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199018)(31686004)(36756003)(41300700001)(2616005)(66476007)(53546011)(6512007)(8676002)(8936002)(186003)(26005)(66556008)(66946007)(6916009)(6506007)(4326008)(86362001)(31696002)(5660300002)(83380400001)(478600001)(6486002)(316002)(54906003)(2906002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHVvTjBGR2o1S1QwaVRUamU3UFh4RzV1WUNwcENUK1RoNnFSVU5PblBXK044?=
 =?utf-8?B?L2xUdmRtazgrOTRkMjJFZThKKzVkbWh3a1N0ZVRPdUNGdzZsbE4zWEw0d1dE?=
 =?utf-8?B?K0RxZFE1TUxIcHJHYmR0enRZUXRpSE81ZnFXRjRTL3hqN1E2SHErUUFOVmZ6?=
 =?utf-8?B?RnVVeVA4OThnZXpNTnNJSUFpc1ozVFIrV0tvK2F5Q3EyaEQ3ZGlyeFFlQk9H?=
 =?utf-8?B?Q3NDV0t1MEhzU0pPOEErV25FYi9RL09RMTRJRU00dkcvWGZKUVFvS2hQNTBL?=
 =?utf-8?B?VzIvTFhSMHJhZHFiL0VsL0pmNUl1Q2k3VzZlYTdPbVBSa3ljd2FqN1pNVWpR?=
 =?utf-8?B?bDdvaGIvUVpoeVRDbS9RSWx0S0ZybUxTS1JHSjFKOVRYTkJZYjlrYXhmSFcz?=
 =?utf-8?B?c0dOU0R1MFNiS043KzI0WDdsMllkU3cvLy9JRjVuQWxvWW1KcGlvUnlQZk14?=
 =?utf-8?B?d3B0eUgzUFI1aW9tWGE0QzNtMUJJZWhIZ0NWTnk3bjRONkR4V1VkYzMydzJG?=
 =?utf-8?B?UjRndjdXTWpIdmhiYmV0K1VuVW5vdlRiZjl6NUFCMnk0MnZXUzVhUXVaRTl0?=
 =?utf-8?B?Y2tkWjBtWHc2YitURXZkQ2F4Q2ZlaDB6bElyZzN6dUtmM05GaDhvTzZaTkNP?=
 =?utf-8?B?UFhkRVJTUVlSR0ozQ0t2MzJXU1NudFNBTnpVVFNzQzY0NlZ3Q1JmaFVIaFA4?=
 =?utf-8?B?Q3BTVHJ3NDRzYVlJaFVxd1VkWlkwUUdmU29YTHNtY2lUTHRVQzdpL2V4UHYx?=
 =?utf-8?B?OWQ1d20xUWVZR3RITHpqb0ZSNzh5MVgrMVNTcnJxTmZ4ZWR5VlZYSXVHT1o1?=
 =?utf-8?B?N3VIMUc5Tm1aWTlIMUxCOWJLN3ljZlFxaGdZbDVvL3VMaWVnMmFjcXc0d2Rm?=
 =?utf-8?B?akF0bVU5MjAyRDNCQXovS3owZklsZWgyVkp2dmlER0VrbVZQWGdweFQ3cTkv?=
 =?utf-8?B?V21QWHE3RWNRY3BTbzJianJzNTErb3VQazIxcWZMRDV6L3AwK0JFbTFqclQ5?=
 =?utf-8?B?YzJlUXBzcHhPa3NUeWJaeFZaVk9Gb1VzNUYrSEZuYSs2MmdJdVljcndGZTY4?=
 =?utf-8?B?S0QxMVlheEhyek90UVdKVlB2Um5rcWZsYXdpVWRzV28xTGRjbisweEhKWHhw?=
 =?utf-8?B?akd2eWJ2WHBoMlJaNUN2Q0JVRVBQTmgxYXNLUkJScWFRN0R6ZkViYndESkR5?=
 =?utf-8?B?L2E5TG1wclJlcy9DQ0VxNEozdVUxbnJKUUZnQUhlMHluYjcwbWpoVVl4eEdr?=
 =?utf-8?B?LzRQKzl5dnIxTnJDa2ZKdkFvVGtoUGNSNTNBQ2w5d0lEY0syUkRERDRweDlL?=
 =?utf-8?B?OXVhdjVueDZtdHFOelBJaHlJeGlONGdvUGc1RDZ4MFRYY0w2UElSWHdBRjNz?=
 =?utf-8?B?SE5pWW1GUVdOaG8vNTVHbmtUWWswL09ORnhGUVl0Y2dRTVVSbDdjSGY4ZTZs?=
 =?utf-8?B?bTlqTW9sbWRsTVczbi8zN3dZc2o3SDF2NzhWSnVOM2c5MXhpdnM0WWozZXNj?=
 =?utf-8?B?WHdjdHNqL0FXclQ2OWVydEtsT09sMkdlWXIyMzlaaUxGdm1jMEF1TW8wZEEz?=
 =?utf-8?B?VFpOOUlZUlhVZFFYNVAwaVh6NUJodHdFeTdIb3lhUlFrMVdwNkkzSWJqYUpF?=
 =?utf-8?B?QmQ5WXRvaEV0YmptaHhUa04vZFdSdjVZaHQ3MlhjUWQrdDNKU2hkbWRPK3ZY?=
 =?utf-8?B?T3ZsdHlxclhVV2VHb3hZYmxGeGlSM3hUWHp1clVoK21YOHlXVjRoS0RIQmNP?=
 =?utf-8?B?Rko2emFuT2FFMTBhTWcxYktCNzIyZWp3ZGQ2NnlnWVRMRGhJc3lqU1AvRHZO?=
 =?utf-8?B?T2pJZTlOditiSDM5dDFCejlPdjN0dVRhd2g5Vm1qWVRSS3hSWmMxVnJKa2ky?=
 =?utf-8?B?d2Q2aC9RQ1FEcjIwaitHL3ZtMmJOT0NDVzBVNThUTHZiV3lWL0pqSDZTQUtE?=
 =?utf-8?B?eGpmbW4yb3Bsd3JpV0cyUGJhb0h5WE1VaGI3dG5LVndMYWlYZ0dHZ2pVMXl3?=
 =?utf-8?B?amY2WG1CV1k3ZmFzeVpTNndVaGNwU3lLS2ZpOUpnYWdBU0xLRTJHMGtrUVFv?=
 =?utf-8?B?WHdsRmVsalVqcWF1RkF6SFo4N1BZa2I5U1B6RlpwME52S20wbGVGU0ZteTV0?=
 =?utf-8?Q?rLgWceAz7MWrG13zjT8QCRjw/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2fc1ee9-54e1-4c28-80ea-08db14c241b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 10:47:56.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzKOCkoko6NHMlxgwM+OfQyHSIxxeJllxPZs6LiqtPCgx0r3rKwMtFC7Ps2L6a34DpkGjQE3F4zEEYW0xxtSeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7194

On 21.02.2023 16:59, Tamas K Lengyel wrote:
> On Tue, Feb 21, 2023 at 8:54 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.02.2023 18:07, Tamas K Lengyel wrote:
>>> An assert failure has been observed in p2m_teardown when performing vm
>>> forking and then destroying the forked VM (p2m-basic.c:173). The assert
>>> checks whether the domain's shared pages counter is 0. According to the
>>> patch that originally added the assert (7bedbbb5c31) the p2m_teardown
>>> should only happen after mem_sharing already relinquished all shared
> pages.
>>>
>>> In this patch we flip the order in which relinquish ops are called to
> avoid
>>> tripping the assert.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>> Fixes: e7aa55c0aab3 ("x86/p2m: free the paging memory pool
> preemptively")
>>
>> Especially considering the backporting requirement I'm disappointed to
>> find that you haven't extended the description to explain why this
>> heavier code churn is to be preferred over an adjustment to the offending
>> assertion. As said in reply to v1 - I'm willing to accept arguments
>> towards this being better, but I need to know those arguments.
> 
> The assert change as you proposed is hard to understand and will be thus
> harder to maintain. Conceptually sharing being torn down makes sense to
> happen before paging is torn down.

This is (perhaps) the crucial thing to say. Whereas ...

> Considering that's how it has been
> before the unfortunate regression I'm fixing here I don't think more
> justification is needed.

... I disagree here - that's _not_ how it has been before: paging_teardown()
has always been called first. The regression was with how much of teardown
is performed from there vs at the final stage of domain cleanup.

I'd be fine adding the "Conceptually ..." sentence to the description when
committing, of course provided you agree.

> The code-churn is minimal anyway.

Perspectives here may vary. Plus, as said, being the one to backport this
eventually, the larger the code change (even if pure movement), the larger
the chance of there being a conflict somewhere.

Jan

