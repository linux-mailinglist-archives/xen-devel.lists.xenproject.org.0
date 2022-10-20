Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2B60591C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:55:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426264.674590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQOd-0003GM-K7; Thu, 20 Oct 2022 07:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426264.674590; Thu, 20 Oct 2022 07:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQOd-0003EZ-Gj; Thu, 20 Oct 2022 07:55:19 +0000
Received: by outflank-mailman (input) for mailman id 426264;
 Thu, 20 Oct 2022 07:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPXW=2V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1olQOc-0003ER-DZ
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 07:55:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2080.outbound.protection.outlook.com [40.107.249.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89076c6f-504c-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 09:55:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7833.eurprd04.prod.outlook.com (2603:10a6:10:1ef::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 07:55:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 07:55:14 +0000
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
X-Inumbo-ID: 89076c6f-504c-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKitq2LM5fsDo3RDeRA3XI0o6pmH5OPS1V73/w3X2wWGsv3y6UBF+o/DYP/a6hIX89qJivvTvkgmPL0VEFeoRS1j390+O/Ngbq09elSjvoIsieF8w4iBf9IgtT6iq5rGPeLbLZnpUMOmV5OPCpEfJgBUSuy0a1xffO4cjTxS0fjlYyQ8ksbYjng+Q6x6x8hcs0+hlMZtg/Iacy6NP2LCy7/QN+WjnkIWm2GRetptFuOCQQeGXCjrrqu6Rp88Xyl9/CVDIp2kIMeQRtaWFbfxPkEAdmHs/C3/tbruKY5g7b2u8NNSSp3CIh/KghA7pqpbq3B4r9ZV3oe3TEEHcMKJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k55QTnKmhTrHh2FHmVSyabaaWdqa5ydNMrO1x7S53zs=;
 b=bBt7woAl9pgqshgfPim2+S15Fnlu4KXh9OoStF8QvdFkig+Nd2Xc88JUBox7k3Ko6nHcxvRSkEkRMXJ4b4QXxhhfcf2nkOUuMQBqmIKPKpShOmQMODgqRnbe+oDJfCSJyuYr4aRRLpGHLSoFZ+8+6YdoYsQesBcIlG98anhJQcmQD9Nx+RR1c/8njnuONieXg76kJ5xcJBeztBbAgp9QfxxRrs1tYnKzhvpUyywQmsUw5UOEEELGS/gya9x2yRNJI+SPusrZcNdKRNowEAHWvUEqtSn/R4GeD6phYwB+RE7hyWIDxy1o7a9iWjmMOAVFQB+FgO+YHHRDvh57v+OipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k55QTnKmhTrHh2FHmVSyabaaWdqa5ydNMrO1x7S53zs=;
 b=kOSh/l/DjGBWeg36ZeOPtO+Nm89upPm+3YjzW1g0Tn+5GP0jGRbJ+zukAgZ8cPCVQWAeAEcVOmj7CcRp1pcdaeh/oQL0quXH46cfrk2Hp5qef7kUF2QaFNCcJobRpXybcOOnFylgi358hZTSSA/qka8oBE9Ri1ER2NpYEl1DNVYJRtYLEBpsBGMSYTAVDIH/c6ZCINlxAnHCIFkIurK6V5mR/6lSzKLBJ6gz3dR7lzFJM6TdjXlnaiaJpUY6P15PZnVUwq/VYrB6hbM1CC7tHqY2IkYiEp7RRZit/Mm5Qps3YMznIH6sKq6UUsXkRzldUPoTSGm1dfSZQLzTRFNEYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1dd7fe56-e545-12f7-5d49-5947734f3f65@suse.com>
Date: Thu, 20 Oct 2022 09:55:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
 <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
 <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
 <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
 <dffdc951-91fd-2659-ec7f-5c213138d785@citrix.com>
 <f200534c-c001-3ec0-7e05-cdbb76f456e3@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f200534c-c001-3ec0-7e05-cdbb76f456e3@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7833:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e111360-443a-4b71-52d5-08dab2706bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A/D5hs/7hoywrgSw1e15pztSfHgCLfD5TOhVZVuw0oQz3bn/6Af9mHBEruLP8eUcGfMRB1Qcdhfx6b/oGtCe/mRJUlyv8EJJd83MbPLThKx5vGthxi5/DIFEDdA/rjsopd0S/lae6vqAmDHKMhjHcDcUCrl4ne7f9KDqIVHVllpXkptMgHfRG2xclQBMPtQpNO4BzaaIg6dm2qu8bGwG9kycDzQXyV14cJV8Xw5y2ticbFlwjFzEdhjQQaQGXqGH80+KLOWbN9X49FaX2zW1B+W8A6i65TSv443IBEntYd7sx33Iijq0aY/duj5l9M6+67DpsJIIYPJqsANUPSGTGMUVwdwzgH94T0q5fHNs+bmQEzsM5FzOYwJwqwJXZVciu/ND0ArVxvBIOw8oIJ+d1NtPOz1ZNwAnNONauz0h44uHka94qgOJZKw40m/F6GzxqgNp4/bMm+4ItwjOCg7me7Yj+urb8CsZM3rKqH6wjSWCD7MSvY334fEcJomIreNdeImWU70A6MuaYaN73fI2pCsOOXFtqxD7XxsOuS/cmO8hZT1KYd1d8oyd1D17TLA7UnTB6o2Iyg17MhskH4YnG/7K+llMNNZKdq+ro+M9FnURyHrhuL2tQk5Wv3WuE4hysZiRI//P4I7ZWoiiyR4W9e5WA1uMOrr+1fc9WyrW9oYHsvUtPSNkdjG/HNv5c23Ajqskp9t3P/GfDqGq8GYFkQiy8ptOEFOxxhXS2iIGFgJ4gmXmFsCM6LRDnG6tJVSW5pavqtqZcWAJQ/xH6NSYCgU4mIHkLvnel2Qcwpw/6ys=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(136003)(376002)(396003)(451199015)(110136005)(54906003)(4326008)(66556008)(8676002)(36756003)(86362001)(66946007)(66476007)(41300700001)(31696002)(26005)(6506007)(316002)(5660300002)(83380400001)(8936002)(53546011)(6512007)(31686004)(38100700002)(6486002)(2616005)(2906002)(186003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QThvUVFJMkgyYktzaGtLdHBYc0R6cXJnU05VRDhQb1NHOHF3Zys2OXU4Rm80?=
 =?utf-8?B?MnI4SzlLZ01YQ2RjS1VESEFMVnNUbm55NklUZlQ0TTdKeEE4MGxsL3d1QWJv?=
 =?utf-8?B?RERIa05QYnhyR0VsUGg4dWRoeVIrdHdYWHd6ZTMrMW5nNTR6SzBEMlJDdEx1?=
 =?utf-8?B?ME9OY2tuTmwyL0FQM1VVRWlETjRpbmJ3SHhYQlB3YU9qTWVObkVVSmgxaUll?=
 =?utf-8?B?cHQzK09ycUttemlZaVVKRnhQKzFqWVowcTc0WDBWOEhlTmREUVprRFIxWUdG?=
 =?utf-8?B?NXU2MUIySDBVUFlHTzFrRXlDSkxoTFBjVkRPUm9id0IzdVVaMDlvOWpOaWl2?=
 =?utf-8?B?b0k2R1N5TW1LWHJ3dCtqbXAzWGdMbzZFYXMwN1cvZVV1NERxTFNETFJJMkI5?=
 =?utf-8?B?NmVyMkJZcFV1cFRKOElKdnV3aUhvNFdNRHZoNDBxd2w5RkhMcXNpL05MblBS?=
 =?utf-8?B?VkZwTk1ZMFZBUkdVMnlGQ0pxRm9vRTh1djYvdHZyMERkZkU1WnBIbzBJd3Np?=
 =?utf-8?B?WDBwMDY4ZmlsenZGZzhIME9hVVVta3pyenZ5UWQzM2x1SWFUQ1RGaURiSlJO?=
 =?utf-8?B?ajVzZmw3cTBtWFhkTGVBZWIxRUhqNXJGNEw1eW5PcmpYVkhlWjI1YkVrV2RF?=
 =?utf-8?B?RUlkWnVTYm1rT25KcS8rMFpvNkttQ3gvODk5YnlVV2JrVzJVdGZtS0l3TkY5?=
 =?utf-8?B?RENLcmMvS0FVajh6YmE1SnFZbGZkZSthMUVFTGRZQ0tJc29HUzFneDA0THp2?=
 =?utf-8?B?SGVLUzRMMHIreDg0RWorYmZBK0E2OGN3T2pocHkzVE1BWFNMa2pGZ1RZS3pD?=
 =?utf-8?B?TWRIMTU4T2lzd2p5TVY3QnRORGEzVWZuaVFwaFZsajBYNlg0c2RnVDFZYTBP?=
 =?utf-8?B?OTJ2WmttbDV4R3cvemMyeis3VjA3L05iZ0pLOEE2bzNydHF0dWVJMS9zOE8r?=
 =?utf-8?B?aEU5eXlTYmk0UkxzcXF5MzJiSVVSSFNQRWJablowZGRMeEFiVyt4QnNHS2Vn?=
 =?utf-8?B?TmF6c3JidFZ0dHVxV3NZell2bEtUNm1iL1FIS3pHSlBYbXIrek91ejZGcVVo?=
 =?utf-8?B?OHBnOWUwTmFxdWN4ODI3cUNPb0FVaFNYQ2VhVmc0VGdaUjRNNW5SL2NQMVhE?=
 =?utf-8?B?SXhwZ1JCZFZzVnlMSUdsMy9DMG1RQk9ZM29BaFJEdXNJblhOdTBTSTFMSmdH?=
 =?utf-8?B?SU1vK2NNUlV5dHZQRE5mbFRsbm8xdy93T3B4K0ViSm1IR0gxM3dvQTgyd0ky?=
 =?utf-8?B?WU9BUTA5OXZWcENYZlRSVjdWSHVSeW9PcitWSklOM29qQ0lCUDBTK2ZmZlZh?=
 =?utf-8?B?WTRZV3JaZjdkRGxSMW9OVC9LZ3FJZUFRUmZ2Y2hYTHhYaUlJc1k1ZGRia0NQ?=
 =?utf-8?B?aDFDS2RmWDFaUjhrakNLWmpiREdYTmFOMXpLa1Q1d2tRMjd3T0hrcHRpbExt?=
 =?utf-8?B?Y0VJRGs4MVFPOURLVDVnUXV6R0VpeUQxaldjK3g0SElPWUxQYjhNL0pnYVdt?=
 =?utf-8?B?b3pWa3Jqa09qMkdpNHZmV0x1NndHUjZaZDRTT3NlNkkwT1dYbmVaQTY5cGxQ?=
 =?utf-8?B?RVYzWmcwcW9yekxQRDVhMXN5czZCK0VvVVJkcVJES1NENlhKMU1ndVFKVGhm?=
 =?utf-8?B?c3ZOak9LS0lTZEtJVGRsZG02SjB0MTFmclBqdTVOVmRpODJoUCtmeE1iVTZI?=
 =?utf-8?B?ajJRRGxyZkVlSDE4elpIclZRZVhNbThUYVhuNUFQUEpmdzVHbVJYazBxM0w4?=
 =?utf-8?B?NU51VTRNVWhWWUxIRU4ya0R2K3FvMWpmeXFFT3NXQkd3ZTY4SWFTQzVNYTRa?=
 =?utf-8?B?SmFhc2FoZm96WWd0TzlnWUFMK3BQRjFDd1Mwd2V1dkJERmVrdFhXcGtIU2R2?=
 =?utf-8?B?amVtbkU1NG5UWU9ZaDNmM2xDd2FEZ3J1VXdDb2xZWEFhMWtJYWJBUUFPVDlC?=
 =?utf-8?B?T2U1UTVnV2hONVVFbTNxV2pqNlc4dkxiVlBONlZsZDhJR2lUQnFPYnA2RThi?=
 =?utf-8?B?SnJpNTJxb0JWeUxQLy9BM3JueE5CeXR2Q1ZQWDlhOVJGL0p2RVBIbWpvZ1JV?=
 =?utf-8?B?bjU1VnJpL252UUhBSmtiUnh0S0ZmcnRuTFU0UDZOWGlSMEp1UXZJVjIvZTBl?=
 =?utf-8?Q?IQuR1EWZejiVUSU86lirIRjC2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e111360-443a-4b71-52d5-08dab2706bda
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:55:14.3304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WayoxPY/6xzteTnxTc4IpQz8IwSvInLAiM+08JNvkri7ZbX+wrcivb2FxU3wMIX3nK6czv7ftdoL9h0yVTwMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7833

On 20.10.2022 00:33, Julien Grall wrote:
> On 19/10/2022 22:30, Andrew Cooper wrote:
>> On 18/10/2022 00:01, Julien Grall wrote:
>>>>> ... you are hardcoding both p2m_teardown() and p2m_set_allocation().
>>>>> IMO this is not an improvement at all. It is just making the code more
>>>>> complex than necessary and lack all the explanation on the assumptions.
>>>>>
>>>>> So while I am fine with your patch #1 (already reviewed it), there is
>>>>> a better patch from Henry on the ML. So we should take his (rebased)
>>>>> instead of yours.
>>>>
>>>> If by better, you mean something that still has errors, then sure.
>>>>
>>>> There's a really good reason why you cannot safely repurpose
>>>> p2m_teardown().  It's written expecting a fully constructed domain -
>>>> which is fine because that's how it is used.  It doesn't cope safely
>>>> with an partially constructed domain.
>>>
>>> It is not 100% clear what is the issue you are referring to as the
>>> VMID is valid at this point. So what part would be wrong?
>>
>> Falling over a bad root pointer from an early construction exit.
> 
> You have been mentioning that several time now but I can't see how this
> can happen. If you look at Henry's second patch, p2m_teardown() starts
> with the following check:
> if ( page_list_empty(&p2m->pages) )
>     return;
> 
> Per the logic in p2m_init(), the root pages have to be allocated (note 
> they are *not* allocated from the P2M pool) and the VMID as well before 
> any pages could be added in the list.
> 
>>
>>> But if there are part of p2m_teardown() that are not safe for
>>> partially constructed domain, then we should split the code. This
>>> would be much better that the duplication you are proposing.
>>
>> You have two totally different contexts with different safety
>> requirements.  c/s 55914f7fc9 is a reasonably good and clean separation
>> between preemptible and non-preemptible cleanup[1].
> 
> The part you mention in [1] was decided to be delayed post 4.17 for 
> development cycle reasons.
> 
>>
>> You've agreed that the introduction of the non-preemptible path to the
>> preemptible path is a hack and layering violation, and will need undoing
>> later.  Others have raised this concern too.
> 
> [...]
> 
>>
>> Also realise that you've now split the helper between regular hypercall
>> context, and RCU context, and recall what happened when we finally
>> started asserting that memory couldn't be allocated in stop-machine context.
>>
>> How certain are you that the safety is the same on earlier versions of
>> Xen?
> I am pretty confident because the P2M code has not changed a lot.
> 
>> What is the likelihood that all of these actions will remain safe
>> given future development?
> Code always evolve and neither you (nor I) can claim that any work will 
> stay safe forever. In your patch proposal, then the risk is a bug could 
> be duplicated.
> 
>>
>>
>> Despite what is being claimed, the attempt to share cleanup logic is
>> introducing fragility and risk, not removing it.
> 
> I find interesting you are saying that... If we were going to move 
> p2m_teardown() in domain_teardown() then we would end up to share the code.
> 
> To me, this is not very different here because in one context it would 
> be preemptible while the other it won't. At which point...
> 
>>   This is a bugfix for
>> to a security fix issue which is totally dead on arrival; net safety,
>> especially in older versions of the Xen, is *the highest priority*.
>>
>> These two different contexts don't share any common properties of how to
>> clean up the pool, save freeing the frames back to the memory
>> allocator.  In a proper design, this is the hint that they shouldn't
>> share logic either
> ... why is your design better than what Henry's proposed?
> 
>>
>> Given that you do expect someone to spend yet-more time&effort to undo
>> the short term hack currently being proposed, how do you envisage the
>> end result looking?
> 
> The end result will be p2m_teardown() & co to be called from 
> domain_teardown().
> 
> Anyway, this discussion doesn't make us closer to come to an agreement 
> on the correct approach. We have both very diverging opinion and so far 
> I haven't seen any strong reasons that is showing yours is better.
> 
> So unless Bertrand or Stefano agree with you, then I will go ahead and 
> merge Henry's patch tomorrow after a final review.

While Andrew makes several points worth considering, I agree here that
staging needs unbreaking rather sooner than later. I'm inclined to say
the patches want committing now, unless an actual bug was still known to
be present there (which I can't deduce from Andrew's reply). In the
absence of actual bugs it really should be the maintainers to have the
final say when there are multiple ways of carrying out certain
functionality.

Jan

