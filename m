Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF097330ED
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 14:13:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550137.859036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8Ji-0001lf-EP; Fri, 16 Jun 2023 12:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550137.859036; Fri, 16 Jun 2023 12:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA8Ji-0001j9-Bg; Fri, 16 Jun 2023 12:12:38 +0000
Received: by outflank-mailman (input) for mailman id 550137;
 Fri, 16 Jun 2023 12:12:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA8Jg-0001j3-T8
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 12:12:37 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13729b12-0c3f-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 14:12:34 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7783.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 12:12:31 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::d5cd:a63d:6ce1:2be3%2]) with mapi id 15.20.6477.028; Fri, 16 Jun 2023
 12:12:31 +0000
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
X-Inumbo-ID: 13729b12-0c3f-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXkiUUWkfI9szS45OniiiQOoVTwvhp9tgC/rDKGbCqwLWKIfxssFFYZablJYdbiZ/vDxNd3VaFlP+7TXZFln3q3D/rG/rjDZ46hWIWpW2idtpF+0j+5cHOHgOlBxTin122lv4S4sKhBmTEIZSLs/CRQ9fm3DIbars226YAPvuo5Q0+VZ6CoTLNy96dEj6VhGDAhJwzC+5f+5ctDSnnCXhzXG4Q4W5DMOtREUYVHZEf4mZIY53Qz2ccQTsEX/oaE9LYQV53sC5mkT1DabJYDNLd1mkSDs3OmtYuhlbNKxt8AuXI7E79UXjEEbckK0ZRcVxeT7tosufyQ+ysetFiIWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdFKnM2x4eXMR1SRVIZtGdeSEii6gRJcWrcAs1rYC58=;
 b=mHk2iaZfFaDlumAMA00hrGezDZh3Z58oUc3xXc++if3ZcEDCarNIYPtu1TxuGwaZbIsDGUmaE6HF23vbjlKzixwoAUoN99OmUmT29aJRuqF4n6Ub2ccXuKZKoUuIne065d4t+96dwX1c59IYMX5oNVHeEK/JBQjl38fdJ8bN7vY7gbVZNG4kD9+sHRwpvrbfAFXODqQ097nYbUVyUtXkrziUc03juFmgcK7g+iE22qLGUSaXCtyOT5WDB/wnuSgD+ah3F0mGTFTddN9IFjPbPRThqgclwRu8ENKo+QPBYsaWIUGMXX1GsaqBCIuZ/ezyqWwLN3jkvcWyIqTrj9JB+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdFKnM2x4eXMR1SRVIZtGdeSEii6gRJcWrcAs1rYC58=;
 b=L7ajGMbHk1fgdRclNuciShhKhACNFY+pF9aF1pymHu52EN4QvICiIk8eK/b7BvyGvvisJco4VBXDjV0aEtte4uzpMsaNKL2m8KQQoZHwdvLA4Yw950JcAzEu7chg2qeRoDzKeYquPKNbbD1Jr5XPAEba15VO7IR0sD6eDOaotPX3thgUrLg98uo8BB5l1xzvwJg8wK3ihVXagmyrjz7ZiUXo2FtK06/cy2qE+IQM3AS6DZLKEEWz8c2RqSDhXYGoR1VUI2PbX76dUkuftzoEweoetgv8lGsPk6mE0/urQmIadm+i5DQboFDKqgrOaYJU/Un0XcFlU9MCXJlszb96mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39f2eed7-4a28-5c98-6e10-2171d630d198@suse.com>
Date: Fri, 16 Jun 2023 14:12:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/4] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230612161306.2739572-1-andrew.cooper3@citrix.com>
 <20230612161306.2739572-5-andrew.cooper3@citrix.com>
 <82ee7908-4597-433c-0aca-8c0ad22fff13@suse.com>
 <386058fe-e9a8-d0e1-c3a0-3f15a4585bd5@citrix.com>
 <cf30658c-daa9-7e4a-11e2-c56e4513fd8a@suse.com>
 <8a44c577-07e4-fbc4-d402-efa581042079@citrix.com>
 <35ac1ede-73ed-c748-9eae-06b156145274@suse.com>
 <50fe5a44-2e26-461b-1676-abae665816e6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50fe5a44-2e26-461b-1676-abae665816e6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: 353252f1-0ba8-4cec-f5bd-08db6e62f5d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JIa7MZZZcvVLJSZIHYf707Pum6bj9K32T01XReGws+XvNJ1Y4HL0UgkQUqcNqDFNw2+/6SbBTkFqT88nyS21cutZuEGDn8nVcjKu+PMKAwN4jBb4chGtK5T4zuIrlrBsLJ3qvtO2rTy4/bIOuQxhZkj7bH6IQeVxY3cjlotwpeFndWxyB1aPge78bb+t/jwyrLYHcolfcQlUgdHkIqa7sY5PhgGFV07g088969VP5CINAf5b/JUt7awIuMaHhBQej/LwzR0GRWCaYYaAIoaWnF5b4m6XFD77sA7J7ujneyQ8WfvHhOtXR8OJSxP6dL5YgYytX7O+RyTzDEgPA7eCMEPrIGRlgErHbZsxr+MYAq12Arn95+cGU0zZiTx88USfQi5Anv2dKhSGBHX/wu+t1yRwLDdBBn726hgjkczKUP+JMYTFvkjEh2980oZhWvd1HuXn7bf0Jo0PyvPc8auBgk+leBgRsOLOhoLBgQWypbqXMom4abUdn6XcFx9z/5vGxLWsZBwodYmBdIgxv9X428CpMoK8zebC1a9tv80JEKd4NdTsbhxhp9t3JDhHocK7j3aeHvm5P6QpUxGzZcpj6XMoVRcpyf0g2Jmf8K9w60/30yuV5wZOHKMzhv+e5AEeFIh3N9mWJ7inXJg7aYVzag==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(478600001)(31696002)(86362001)(6486002)(316002)(41300700001)(38100700002)(83380400001)(66556008)(66946007)(4326008)(6916009)(66476007)(8676002)(8936002)(31686004)(2906002)(5660300002)(53546011)(186003)(54906003)(6512007)(26005)(6506007)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDRGM1o5ZVhlUFRvQms4MmtkOEQ5OVZ6VnNVbFhTZzBaR2gyQ29WVUJHQitY?=
 =?utf-8?B?ZkxidlhBMVJSMTBYYVl2SFFaMzNaUnhVaDBIaCtEQk1qZEJKZHdSdTBjd1dO?=
 =?utf-8?B?ZzV5Yy95ZmVncXlMcWg0UThNSmJrdnUwSDZMU3A0RVFudFBVYTlZcUhxWjAy?=
 =?utf-8?B?bldlYWtmM2pmQVRyOTFUK0xhdTlWZ1dGVXp4M25zMmlabVNtNUREN0UxY1Zw?=
 =?utf-8?B?NzQyNTI1OEsrdFJPUDFrWCtkRWlua0d2eDA2MGRYbnFUanJhdzR1aVlDYVpE?=
 =?utf-8?B?ZjFCMkEycTA2NWl5MEdkc0pDaWlldnMxZWlMSDBnTmlFZnpVc2wwc2tuQ0Iw?=
 =?utf-8?B?eEdTRlhTWWZJTzA0NGI5aUUrS3d4YU5uR3d1ZXFJSUN4R2hVWHYzeHBEVjVp?=
 =?utf-8?B?RHc5RHRIRUZsOWViUjM4VFdtVitZeXAvNUxyNFVRbVlXNGt1SERVUGllSlRP?=
 =?utf-8?B?NnFjMHltUWVEcWhaTnBGNklLRXVVTkRyajh2ZnFjVnhYOU5IZmMxcE04aXlJ?=
 =?utf-8?B?TENiZ1ljclo2d3R0Rm1oK1hJbUk4aUp6QWw3Ymd0bCt4cXNOMFRVeER5bEZI?=
 =?utf-8?B?K1Y2MHgrQWNoek5hMm12TGloc2FsanUwQ2Fad2FaUkJEekhtR3F4TC9hSGNq?=
 =?utf-8?B?cXYyNmZERDFQUFlqM0IwZnZaejRRL25XdFNibGZBcVhGL2ZiUTRJOExJMkt2?=
 =?utf-8?B?ZFRMSC81NFJTK1BXRTNqamtqS1JWQXhET1l0ZzZRcXBSdVhLR3ZIbUFEVU5l?=
 =?utf-8?B?emVxa3RGNnJRKy9PQkVMc21nWjR1aHBjdWxlQmNJRlZTMDNZY21VNzBxVkZQ?=
 =?utf-8?B?OUtlUy9ta2thQkMrV1E2WG04dS9JaHovSGltNjZrMEtNRFpBYWhSdktFanBr?=
 =?utf-8?B?dmYzRkN1TU9IL3V5amlBYUxBNEFGZVQ1RGRRbk9oc0VDSXpBZU5QS1JYcXNI?=
 =?utf-8?B?S200SnRYODU3UitTeDZ4WjlRUDNnRkRnUUJQYy9Na0VYWXowL2RCaXBwRG5E?=
 =?utf-8?B?VGYrTGx3Skp6aUNFUWxXRC82cTRwMjF2ZkVGeTlseXowajdwOUNMSGNxUVM1?=
 =?utf-8?B?Mmk5WE11VFl3OXZ4bDZTZGJ0QlgwTktmak1WOFZKSGhvNnN5b3M5UnhqMUEv?=
 =?utf-8?B?TDhVVVJVZjgvNENQSUtRZWxlQ2s2UEgzeFgwWE52Y0YzZ3ZTdktLKytzbFla?=
 =?utf-8?B?eDk4a0l4T1ZPM0pQbFd6bnFvREcrMTFVSTdMK05uNy9tVUZ0ZkN5R2NmaDFn?=
 =?utf-8?B?aldMTkExdkV4RjZ2U0d4T3hDT2ppalJ4Y0pFcWZUZVBsU0h4MXBPSno2Tm1J?=
 =?utf-8?B?RFhkTU81Ykk3SWFuNStsVjlLdG1KUmFCbURVcmxUckRJaWw2SGgydmkrMkp4?=
 =?utf-8?B?Q3FhV2FQV3ZEbGYzdUFxQkhPajA1dUhvZk5hQmFhM3FQVGkvNXdyQ1JFSkF4?=
 =?utf-8?B?bjBRWVRwRUEvVkhCVXZMOGJ4RzQvbjVOaERGMGVuSzBWeGFobytMNWFUam9z?=
 =?utf-8?B?SFZLRSs0NEpUNVdSL1VsdG4rVE5xSklHc2xUN0h3KzNsWjhCZ3BMZ0ZNa1V0?=
 =?utf-8?B?Q3JXc1pycFRBamlLc25xL2U4RFlCeVhzZ2pJMmdPVDRSN2NHZ1I0ellBOXBl?=
 =?utf-8?B?aW5CTXhlNzk5d09haVNJU2JjQjVUOE0zUVR1N0MrQi9tdXpHWGpGUmQwQnJ5?=
 =?utf-8?B?TWlROHhMV0xHWmhGUzFITHJNU3NqYk1JUEpQeGZ0RWUvWmc1NmFQQ2NMQ3p6?=
 =?utf-8?B?RHJlMHV4dEdkb08xa1dYaTJiWEpFQ0NESHlBbWJyUkd2Mi9lcVRoOGNMNTRo?=
 =?utf-8?B?R0E3SlVNZmloQXdCRGRqQzdQWC80ZVMxRjNwdlZKdExVeUV5bThjcU52NlE1?=
 =?utf-8?B?aHpHbWhQSUsyejcxWDRMd3NQREF0K3Z5TlNjTCt3ZG1URFVrOXd6REZpSGdx?=
 =?utf-8?B?VlhZRk8vK3ZWVXQ0WTczTEJjaVlyajllV1pmbGY4cElpRCtlRmpnL0QrSGM4?=
 =?utf-8?B?d0hmNThrWjgwWGxUUHVjM3prMUlvWkVNRXpIQmlpbXNXalBrWk14VThoODVY?=
 =?utf-8?B?c0VWUk5oTC9aRHVrRTNaMjNEb25LN1FWU2xlc0pyd2IzNGNzMHlTOEFUaVNF?=
 =?utf-8?Q?Jj02YoS1hlouu4gRNGQcddGRA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 353252f1-0ba8-4cec-f5bd-08db6e62f5d9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 12:12:31.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PVPO49rd/qmQ0UCD8Wj58BV1htYPuHlT8wKSE4lkXKMulbL/gL6v6Mn6lXF37+ZhH2TRQWxN+LxiGvv4/7jkzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7783

On 15.06.2023 20:17, Andrew Cooper wrote:
> On 15/06/2023 1:13 pm, Jan Beulich wrote:
>> On 15.06.2023 12:41, Andrew Cooper wrote:
>>> On 15/06/2023 9:30 am, Jan Beulich wrote:
>>>> On 14.06.2023 20:12, Andrew Cooper wrote:
>>>>> On 13/06/2023 10:59 am, Jan Beulich wrote:
>>>>>> On 12.06.2023 18:13, Andrew Cooper wrote:
>>>>>>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>>>>>>> predictors when empty.  From a practical point of view, this mean "Retpoline
>>>>>>> not safe".
>>>>>>>
>>>>>>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>>>>>>> statement that IBRS is implemented in hardware (as opposed to the form
>>>>>>> retrofitted to existing CPUs in microcode).
>>>>>>>
>>>>>>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>>>>>>> property that predictions are tagged with the mode in which they were learnt.
>>>>>>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>>>>>>> alternative predictors but restricted to the current prediction mode".  As
>>>>>>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>>>>>>
>>>>>>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>>>>>>
>>>>>>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>>>>>>> linked, absolutely nothing good can come of letting the guest see RRSBA
>>>>>>> without EIBRS.  Nor a guest seeing EIBRS without IBRSB.  Furthermore, we use
>>>>>>> this dependency to simplify the max derivation logic.
>>>>>>>
>>>>>>> The max policies gets RSBA and RRSBA unconditionally set (with the EIBRS
>>>>>>> dependency maybe hiding RRSBA).  We can run any VM, even if it has been told
>>>>>>> "somewhere you might run, Retpoline isn't safe".
>>>>>>>
>>>>>>> The default policies are more complicated.  A guest shouldn't see both bits,
>>>>>>> but it needs to see one if the current host suffers from any form of RSBA, and
>>>>>>> which bit it needs to see depends on whether eIBRS is visible or not.
>>>>>>> Therefore, the calculation must be performed after sanitise_featureset().
>>>>>>>
>>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>> ---
>>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>>> CC: Wei Liu <wl@xen.org>
>>>>>>>
>>>>>>> v3:
>>>>>>>  * Minor commit message adjustment.
>>>>>>>  * Drop changes to recalculate_cpuid_policy().  Deferred to a later series.
>>>>>> With this dropped, with the title not saying "max/default", and with
>>>>>> the description also not mentioning "live" policies at all, I don't
>>>>>> think this patch is self-consistent (meaning in particular: leaving
>>>>>> aside the fact that there's no way right now to requests e.g. both
>>>>>> RSBA and RRSBA for a guest; aiui it is possible for Dom0).
>>>>>>
>>>>>> As you may imagine I'm also curious why you decided to drop this.
>>>>> Because when I tried doing levelling in Xapi, I remembered why I did it
>>>>> the way I did in v1, and why the v2 way was wrong.
>>>>>
>>>>> Xen cannot safely edit what the toolstack provides, so must not. 
>>>> And this is the part I don't understand: Why can't we correct the
>>>> (EIBRS,RSBA,RRSBA) tuple to a combination that is "legal"? At least
>>>> as long as ...
>>>>
>>>>> Instead, failing the set_policy() call is an option, and is what we want
>>>>> to do longterm,
>>>> ... we aren't there.
>>>>
>>>>> but also happens to be wrong too in this case. An admin
>>>>> may know that a VM isn't using retpoline, and may need to migrate it
>>>>> anyway for a number of reasons, so any safety checks need to be in the
>>>>> toolstack, and need to be overrideable with something like --force.
>>>> Possibly leading to an inconsistent policy exposed to a guest? I
>>>> guess this may be the only option when we can't really resolve an
>>>> ambiguity, but that isn't the case here, is it?
>>> Wrong.  Xen does not have any knowledge of other hosts the VM might
>>> migrate to.
>>>
>>> So while Xen can spot problem combinations *on this host*, which way to
>>> correct the problem combination depends on where the VM might migrate to.
>> I actually view this as two different levels: With a flawed policy, the
>> guest is liable to not work correctly at all. No point thinking about
>> it being able to migrate. With a fixed up policy it may fail to migrate,
>> but it'll at least work otherwise.
> 
> If you get RSBA and/or RRSBA wrong, nothing is going to malfunction in
> the guest, even if you migrate it.
> 
> The consequence of getting RSBA and/or RRSBA wrong is the guest *might*
> think retpoline is safe to use, and *might* end up vulnerable to
> speculative attacks on this or other hardware.

Isn't that some sort of "malfunction"?

> And the admin might know that they overrode the default settings and
> forced the use of some other protection mechanism, so the guest is in
> fact safe despite having wrong RSBA/RRSBA settings.

But then the guest would also be safe with adjusted settings, wouldn't it?

> I don't know how to put it any more plainly.  Xen *does not* have the
> information necessary to make a safety judgement in this matter.  Only
> the toolstack (as a proxy for the admin) has the necessary information.

I'm not looking at it as Xen making things safe by adjusting bogus
settings. I'm merely looking at it as not letting a guest run that way.
For the safety aspect I agree it needs a wider view than Xen has.

Anyway, I don't think either of us is going to convince the other of
there being only one way of looking at things vs there being at least
two possible ways, so in order to allow things to progress
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

