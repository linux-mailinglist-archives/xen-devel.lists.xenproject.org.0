Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CF076B026
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 12:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574043.899245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmAa-0003u0-PP; Tue, 01 Aug 2023 10:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574043.899245; Tue, 01 Aug 2023 10:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQmAa-0003rX-Ly; Tue, 01 Aug 2023 10:00:00 +0000
Received: by outflank-mailman (input) for mailman id 574043;
 Tue, 01 Aug 2023 09:59:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQmAY-0003pU-Vg
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 09:59:58 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a36be2c-3052-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 11:59:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7073.eurprd04.prod.outlook.com (2603:10a6:208:1a0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Tue, 1 Aug
 2023 09:59:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 09:59:53 +0000
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
X-Inumbo-ID: 2a36be2c-3052-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4VofkmLQJnVK7TtnIiTIP+LEq4uKurD2dvb0A+tzBbPFSF5FzphGjAALSC7uEHEZhgv1A6ToU96MDbEQ1UdREGVnFZGlPGBkNRiFXG04inxAYgPOAdu9KEN7WPLArXb3CKOfh1+1YXGPkXF/f6EmoVHrWh7x2Z2Z9OK0BqAoEDaJcSlK0P3mSi9xS3SrgUPwnD6PcjK7bwAmFKNNlAAoSyWPzoVWn2FSOOTWlDRqxKWCrT82pw/zOK4onkeZQLiSAu2XZHux3xCHq8T27gv1vaC+HbJ0oJ2hbxt9tLvQsWq70Vhk8JqI3KD4I0j2/V4aF/B27XAzRbQ9hsGTgdqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sy2fHjwQKHBfHzb7HKzlmPo3cQ4nWBIyPbHqvTuASvM=;
 b=mK9DDPT127gI5dLLOZOZB0XUsKe82EFhIBkdUAOf8vyOgL2nRiqx8Bba5tCKvZbTUr1MCSB7hPUAfXWZoh6rKyioiwkC4RfW7DZUjRrKiveZ0NWhAKxkkh/RhVGRZLg9xzk8Ntx0UVJYSzK8qOyEiDrJcfrLRDnlUdM4jewgLxh/Ooegteehy7RIXV/oHrPRuVPBQ+PwvDmAD/bwZOHNi/7G8zCiiKvo2OomB/y0TllY1AZY0pYTh/pZQqHAjYc2oABceMXntubMk+4wmAIMAybPxNN50pVDWd9ZUo7AQ45L2uPfURcqLFYfAlNHUlF1f/7TZZ3OHqkshuOkUYR/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sy2fHjwQKHBfHzb7HKzlmPo3cQ4nWBIyPbHqvTuASvM=;
 b=aNByDxaLz3UxCE5vlME4jTC7g8g+FN0u04les7EPDxBV0dcxz+sMQ7BVXFhhE+YhojR1JZziV8QRobt0FVXeDhVo4o5VWxttgdJLnQKIOu+hjCALHfKLj1+0YX8gNl4CsB5fJGGwJYKNp5vYKxtVQt4TjlgQ13f6Ak1WiKLpZEOrUzncIEqNWSKPus8gKvdd2Mzj+5SdqNk8XA6YzNOCmzzNGPxIW6ii8feyMWcAF0LX17vJ8+1PfbyLpw6cn+7QV/z4RNbdUkEFcbUrPtM+KNayj/Q9UKiVF4hp1lE+MtKUmBcogTGaO9GK1V9hnv1rDnRvxu5IxATQz6Bwl+TjQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9c74b2a2-450c-6932-868f-6109374de6bc@suse.com>
Date: Tue, 1 Aug 2023 11:59:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v4 1/1] ns16550: add support for polling mode when device
 tree is used
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1690475512.git.oleksii.kurochko@gmail.com>
 <6e8f243284b53a9c56e7faf5e0e5ee5e20de9958.1690475512.git.oleksii.kurochko@gmail.com>
 <98596d8e-6c11-715a-7842-910806abda77@suse.com>
 <75cd58c00ac6b9f49f1656d6793888ef470c9eff.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <75cd58c00ac6b9f49f1656d6793888ef470c9eff.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0072.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7073:EE_
X-MS-Office365-Filtering-Correlation-Id: 97027dd3-0332-48a3-ec3b-08db92760d6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vRtrThVAVCB1ND9uwvBBUsThTOzJJhWIbzRzNIxLb9cN0459CimuQSSJ1dSbBnsiZxcN2B4e+Zp0IlRMaeUScM88YX5nJQ3pFdjRe5tlK62d3V84laAZ6DTn2nWdXwfbbM7/y59qhdBe0X2Dvt7XJyky13SMQ7uDU83YZFUYXXiEKCWs3ziYPfIfw4jklE4kp5oTqucT/QPpoQXPQNCqrj5YBmrrBlZ8Hu/v8g9ERuRHS2x4D2pwzMidBqRHyoKhkBnqDTZCdWa6n642tLCXN6gGhiTc8tDQPBW8OaBk8guXmyzKan6Bkai6oXWt9ntszHGSxIWV8WjQGWCJetR3HGbMqOjbyWGe7+6v9BW+T9O8Usm1dgX5r1yxXLJFGTKDBx2MkBwiWc9ZaTWXWNAAxWebRn4lENc2lPos5y60aZvwy4HQS+9N4LHSH9V73sURJHNcnCvsqlBqbtNPaz3GOMQ70Cc0XM+wCgPSJtAeaE4V94s7CqSWhlvHE+6yE464zptC+KPP8kUbOch1SwWRXh2Fh+QdD1I/CX3kNmPfO6UcqaB6Fj0aPgrAIVwjVAPLnm6la4hxuH0mQoaXQsrb/AhZ3l4xSCtzo4VAg8QiN2bO0L4RlsONX1aPvmUL+6DPNIVDpmoK8ADn+7T/m3aVaw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(39860400002)(376002)(396003)(451199021)(8936002)(8676002)(36756003)(31686004)(6486002)(41300700001)(478600001)(2616005)(2906002)(83380400001)(26005)(316002)(186003)(31696002)(86362001)(6506007)(5660300002)(38100700002)(6512007)(54906003)(4326008)(53546011)(6916009)(66556008)(66476007)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWk1bHhBRlRoYjdxQVBjQkkzRm9ydHBYcEZsNWxwemNQN2JrVXJNcHk2d2NZ?=
 =?utf-8?B?dHM0RXd2TjROemZ5ejlqU2hCN2dLY3JmaDJBeFZTVFplZW5GNGt1b2Z5Y0tY?=
 =?utf-8?B?R0hNNXNMMW1BMWp0UzJZRE5nSnU5b0IvMGxFWXpsZnV3VlBGU1FlOHg4SlNp?=
 =?utf-8?B?SC9zellvRXJocFppMjZRU3hEbm03VU9VaGtPcmhjRjg1NVBzUkFERFVPbURL?=
 =?utf-8?B?RWRNaVdzbUROQzkwQ1Y4REJYUzlkMUk3ank2NlRLQkVWY0h2b3RzbjhiMUs2?=
 =?utf-8?B?R1J2cVRNRjZQaHFVSTFOTlhmd25QUWdtK3gzSVdKc1VRblJIQ1VQQTUyL3pV?=
 =?utf-8?B?WFZHME90Mmh0NHJnTERveXhyeGx3K29mQkZ6SUN2RFNrMTdaeHBLNHhrNUpQ?=
 =?utf-8?B?Z010eE15ay9hMmdYMjd2NWUvQW1mN2hXV214WXFlRzJFdmhGT2l3U3BGUEpy?=
 =?utf-8?B?TmNWQTJ5SkJyUDdMWG1ZaUhVQkZnbGRXaWRhRjBNY2dOcEcxUUVZSXRXb3NR?=
 =?utf-8?B?OEpaS0ZLdzNXeHhFTUlnQmpOSWNhbVYxUjB0OXUyNys3WmtZOFJjVDg2Z3NY?=
 =?utf-8?B?Y0t5WE5tT3NKTTJSaXFhUkNSMUNDaHZjeXcwUWcvZWt0T05mQXN4YldNcC9q?=
 =?utf-8?B?OC9UZFpHYzNiWmg4cVFzQ2tXM21EY3BSUFdGUDllL1JMdUVCQnJCdDZhSWN4?=
 =?utf-8?B?THZmU2lFM05SaWhGQUQyaHFLdWRkcEtXL3BXbXFZcDl6SFYxL0w0V3AwOGQ5?=
 =?utf-8?B?MmEvQjlhOEFCcndLK3YvU2VaTm1CdTMwTGhNWjdKU1dXTzJOWU45c3JQZ1N3?=
 =?utf-8?B?Qy8yblJaajdmU2FUaWM1dzNxVS85UXBYSForSnVjM09UN21nb3pCQzR5MGNv?=
 =?utf-8?B?V0F0ak44NFZRZk42T1p0Wnc3SDRMZmdIcmpGY2NrYko3VzZrUnFJc1NrK0Vu?=
 =?utf-8?B?K3o2bDhQbTllcmY1VWxtOHBmRnJRbllwOUZXUjB2SHRJMWQrV2lOQ3JrSnov?=
 =?utf-8?B?LzRxcTdQMWRKMmFYajF6U2d0dHJxcmlGeDBuNTNySWgwNHY5Qi9HQ2xuTjFY?=
 =?utf-8?B?SWtodi9SRm9kcklFMkNoOFhVdWdwNExNQW9lM1IvUEJndW9OR2o2SlNxeGJS?=
 =?utf-8?B?bWpDUGVqVnl2TzNNRVIwTUpHMzIzNCtuY0NydFRKYlhNNWdudmFBb3djUlpo?=
 =?utf-8?B?dzdDQWk1OVhoTVV6Zk04UnN4MkwzWk5LRVN3N21qK2t2d2NPZTdLd0JORS9w?=
 =?utf-8?B?NkpLWDdWUVVTL3p3ZnhhM0FWcnVwR3I1RFVSaFBQVkcwZHVpUnV0Uy9iakdM?=
 =?utf-8?B?cUdobXczeXBKdlpBRjlodHVFcHVrRzhZc29RdTVoZXhzY05CK0xKUmd3QmlE?=
 =?utf-8?B?b0dzSU80cHdzVllXc005TjhnYS95WXlIZ3c1R2V6KzRMNlcrdXBkZUVReHN6?=
 =?utf-8?B?MDMwakMrR0FkbStEaHh1RVRvWlJNMTVIWFNIS0Qxb0xKOSswRnprVHczRjR0?=
 =?utf-8?B?MDVIOHJwaWNZZGVEZmRnNkYvUnZLWTBob25XZ3JnaXFlYnlWQ3luMVZpdkNN?=
 =?utf-8?B?WG9GWWZhOHRqaFBKc1RWdEJlMzJ4WnVKQ05WTkxPQmVsTjh2eFU3dWFtVXRR?=
 =?utf-8?B?cUpML0FuWm9HU3RkWXZQMXZMUEFuWnFwUmdzcis3VGV6elVabWJVNmxJcnhE?=
 =?utf-8?B?bDVYdExDajZnTjI5TGFVTTZER3llTnBKejlxZTVKak9JRWxxRUVvVlRpSFkr?=
 =?utf-8?B?NTNjSjVMbWw0WW1xbGFTSW5xOXhZMTNMQVhBK3NrRnArZUQ5M0tjWkdkVWVT?=
 =?utf-8?B?b01ReGk1TXN3cHhOc0h1K1FFUnh5RzZ3bmVDclJpZzN1RkFnbjVBb1FYNzVL?=
 =?utf-8?B?WjJSdGdJZmtZZWZUZldOTTNWZmlxSGEwYmc5OGVicGdkYmJ4azJNdzhoQmtM?=
 =?utf-8?B?ek82eWNjWmsrQmVzcnpQalVoaDB3dVpvVkpZRkppZUxQNmtDYm9rc3hQMFZt?=
 =?utf-8?B?TVYyVUluRnpVdWRiNWJJMFI1RkhhVmNadHFjaERSMExYUHFhcVNKYUMvQlFQ?=
 =?utf-8?B?MWw0UTQ0T3BsYzRoei9FRXFxeTNwdm1UM2pEbUJqUkVySStsYXdiVlRIcWxp?=
 =?utf-8?Q?wJ6+Hlm9MG23aJ+9RsLEoSJ1u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97027dd3-0332-48a3-ec3b-08db92760d6c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 09:59:53.3277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNkmsfpq4hGr/9XmGufFt+ORpdNS9KvvKRdh0L9FHnihCmX3I9NSWz61nICqe5TgCU5tywonIfkybr8sQKym7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7073

On 01.08.2023 11:46, Oleksii wrote:
> On Mon, 2023-07-31 at 15:24 +0200, Jan Beulich wrote:
>> On 27.07.2023 18:45, Oleksii Kurochko wrote:
>>> @@ -654,6 +674,9 @@ static void ns16550_init_common(struct ns16550
>>> *uart)
>>>  
>>>      /* Default lsr_mask = UART_LSR_THRE */
>>>      uart->lsr_mask  = UART_LSR_THRE;
>>> +
>>> +    if ( strstr(opt_com1, "poll") || strstr(opt_com2, "poll") )
>>> +        uart->intr_works = polling;
>>>  }
>>
>> A non-__init function may not reference __initdata objects. But
>> strstr()
>> is too lax anyway, and you also shouldn't check the wrong port's
>> options.
>> You want to recognize "poll" _only_ where all other command line
>> options
>> are processed.
> Just to confirm, do you mean that I should use parse_positional() ( or
> something similar ) for the device-tree method of initializing ns16550?
> 
> I checked the polling behavior as described above because
> parse_positional() is utilized solely for X86.
> 
> It appears that command line options are parsed only in the case of
> x86.

Hmm, looks like you're right. Arm folks will want to clarify how they
got away without any command line overrides so far, and how they think
now necessary ones should be suitably added. I recall I had reservations
when the file was massaged to compile out supposedly x86-only code.

Jan

