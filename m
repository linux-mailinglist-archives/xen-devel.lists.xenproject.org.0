Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2275F6328
	for <lists+xen-devel@lfdr.de>; Thu,  6 Oct 2022 10:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416761.661437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMiR-000635-86; Thu, 06 Oct 2022 08:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416761.661437; Thu, 06 Oct 2022 08:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogMiR-0005zv-5L; Thu, 06 Oct 2022 08:58:51 +0000
Received: by outflank-mailman (input) for mailman id 416761;
 Thu, 06 Oct 2022 08:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fMX9=2H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ogMiP-0005zp-Fb
 for xen-devel@lists.xenproject.org; Thu, 06 Oct 2022 08:58:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1732ac96-4555-11ed-964a-05401a9f4f97;
 Thu, 06 Oct 2022 10:58:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9100.eurprd04.prod.outlook.com (2603:10a6:10:2f3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Thu, 6 Oct
 2022 08:58:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Thu, 6 Oct 2022
 08:58:45 +0000
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
X-Inumbo-ID: 1732ac96-4555-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WBhTYfzdGLKL9kdBx6PRRrEBQTzxwkRgNb3jUFI9e2hA6xeGoSSObBEVGxfvD05g7YSh2UsNlTkePIqHddn51q/9JeBTqB4P7agA1Mg8q9xY0bSUdGhjhyj7D2/0C3kTD0uXr3qNP7Oqf/MAir29Ky5u7XeCAyvnGnVLDXrfwetMPsmLcpBOekMxXOhTh2FX6wrSKjqvOpv9jeT5JOFxcOmkRQ4dF6oIOAnvKVQmXcKhMQZKbrjLGnhJ68YAPfeFZ5h/jonssdYAF5giTmtwfqi4Bg335WSq+rpc6qdepb64bp73unGeYPbrcoI+u/dnetUCZCkMBqYn46GEXHWF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g9Z81TrUgStBViTUU7+fdK5QF94vDa5G8ADkRzwww0=;
 b=AhUZyi1zOGC7Llu0uH+3Poz+tbEhAjpK/+vwLv7soqEJAZVYaawnkdVTcsWernN55ig/4gSmxfq0iO1DL/lDttI9ipY9niedCCXqIChbp5YQjjZmFShzeDbnDLA6aNlRCpZk0jrANHzID3WNsdaguRvf1qG/qc6rCKv1Nh4uOQEp2bJnPvFVfJiok6wNa2GRUdYwYgK8mC9jEW65cu+t5ExSsm10KXa47sUnpnyv5iCm2SSeaW7L8kQTr8tU5hbI7SJneYBlNINrIE04na8ZzvtXPISScyAq8NUUONbC51/1whQWzR04M4BmlJ+if9ENpvgA7EUKTgprttSs+409Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g9Z81TrUgStBViTUU7+fdK5QF94vDa5G8ADkRzwww0=;
 b=KB3F7G4xbQyJjBBBU9rWJ+AuWgWWIrQX7kg5lejs02jITmTuluNXyAwdJFP4CRkHQh7GKIiAtZl7vRujS5miAqlfjJOcE/pGAZRx8MpuwoOABd3zLyGOjWX+fOShkT0iL/zOmm1mYVxaKfPe0h3GunERlcXtmXOSYGicb0jD1k/x9JQ5ZuAFbs63aB7oz2hNTQrlanQrqFq9RpVnnBYDcUXxwymp+MR5d8s+JqdRcpa+alMCrv9hHTtahB6zsxM6swI5LeKlmZvGCe4kzTIlznURfj9LO+gHQOeFC76wJeG8W9z/SX1njCJCBh2MkUNxUoYZWkSd8YJkF/I/zacrFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <187834a6-6fcb-6e84-1247-ed7f4e23d417@suse.com>
Date: Thu, 6 Oct 2022 10:58:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2][4.17] EFI: don't convert memory marked for runtime use
 to ordinary RAM
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry Wang <Henry.Wang@arm.com>
References: <ca557de7-88e9-bf2b-0f5e-6a42dca3f9f7@suse.com>
 <Yz6XgVMd/a/XU7jr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yz6XgVMd/a/XU7jr@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd1eeeb-0e64-48f1-235f-08daa778f98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6c1Rx1k9citkD9y6WKo6w6njt2WHLkfJxOpnJ0F8kZPJyk5oykvpRsaqwjWkyKAuFn6B2nEa481BARYvrQ58YvcbE8tBQtq4GrD631DAoi8F5Fql1p0a/TggmePc2GoCMdDVTISA6LKseUtUmfiKhQA3N+OYEBxO2aLOjaqDOY4zYXQqB3N5nyDFuHce29aNFFgpVhjNb80wAHw54GSxZir8u/607xEYM1YJsO7DJu/mYt2hFNVjR9/64m14syWGfDqErRK/0nnkQ69YIFGKn60OlyXv1UNwVQdBvPUnHkeg4YUX+R3wWxLG9DbohogoUI+Wk06Z0rGepgUdoDCPuu8rr5KdL4xCi++ht7eL9wPBemWO6Zz4tuYSx0dR71D9SDqd6jBarzLJGL7PUQdySv86b6gUbp5dt8yj/JD+JT5UAQqJ+ubbsVu9ZHB/6OLdBsq/qPl8fsQVTxhZUmRIOEXDo0l4Ze4NQKKc/kPuIqn8mjoJ990aROJDwnu7X9mxN6N2Vx9OWwWLWakcB5Io8u57Ly824MtEDZIoJvhoxrLTeBXKf+wrBXY0amxtXD9bWPnKVLo3d8zDARwKuy3gW6Mnymvh2Xly4DaTp5Bnartcspr5Y2kE7RecKCnQa9T3ReXlgHA6ZLvzwQ0PEOvU09dCP1zNeDVCh5fvayRR0ETgFD5VurG2enkJMvGkwB26sJXRQ8iQjWltQUpSgw9yNheG/InxfmdalOg0CetpihGXUo9YEBOY1I6/f/6F8tOdd344pkuk2dM72IzXPCjR6OvQezmBNNDJVGLGnL9trK4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(6486002)(478600001)(2616005)(6916009)(8936002)(186003)(2906002)(5660300002)(4326008)(54906003)(26005)(66556008)(8676002)(66946007)(53546011)(316002)(6506007)(36756003)(6512007)(66476007)(31696002)(31686004)(83380400001)(38100700002)(86362001)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cm5kbnoxdUNQYjJGVzZLRFZLWm56eXFMaHdIR1JOcDZCQ1ErZ0x2d09ML1hU?=
 =?utf-8?B?cHp5bnNKMk1uOTc1TWNyRHB2M3AxN2VHanhWRk1xSVRRcDBuNXNFT3drdnBr?=
 =?utf-8?B?N0hjV0VPa2NJdHFTU2JEOTR3NUpGYnhKZ2V3bUM4SVlVdnBrYiswVTVYaGpB?=
 =?utf-8?B?WXY1emdSc24ybU10eGRYR1NEc0hJMmdkTWRPdlJ3SnpZbEtBOHBkSmJqVGVD?=
 =?utf-8?B?VlVuWVRDdkU0M3E0SXFLM0FiQXJOWnRySHJMSXFmMjJNMzRrRi9GWTlMcUhm?=
 =?utf-8?B?Q2ovUTlsMnFFbkE5U2VML0srYUxESzJsbWh2TTdMWjJ1eGlVek0xL3VqKy9a?=
 =?utf-8?B?dlh1aEpHbTB2a0JzMnJaUlVQdFlNOUdFNkZXV0RZcFF6UXBxd0R5V0VhTnp5?=
 =?utf-8?B?WXZxVEZWUkNudWtsckVNcklIUVZIL1lPYzdpelBCR090dEttcjhPRHgzRSto?=
 =?utf-8?B?Vlk2eFpSVk8rVVhobFBWaElSa3BrTlErVjBPNjFKUERabGI1YUZkOGVoRk1G?=
 =?utf-8?B?dUdNb3JwT0VJZ2QzaUFPajhzUStkYVRoNnE3K1BpdHcrNzI4Tkc4L3ZlMXlh?=
 =?utf-8?B?WEc2VWhPelNJYW5idE5Oam1MYUtxY3A5MGk4Y0hFWWw2YUx4WkZGc3JrMGhv?=
 =?utf-8?B?TEJNNExDaE5SNUEzVDEzV1RIT0RDd3Q4TU8xU2lNKy9odlFkUVJsMjlQU29k?=
 =?utf-8?B?TWl3WEdBbGtYcGozcnNHQ3ZRMURYVVJCTnJUcEFtVHU5Wmd6UCsvN2hieXMy?=
 =?utf-8?B?UTZCRC9TcmwzWDVuakJXTWt3Nklzb0dUN3l3WENQaHNDRW1yQm1FdWpWVUp3?=
 =?utf-8?B?WUhRTnRkc1JrN1UveCtXakVSU3dBaGJXaTFhQ08wYTRSa1Q0d0dMYXE1ZWRr?=
 =?utf-8?B?Ly9wR1Rhd1NNemg4N3AwWVRRYU5hQmxzdnhIcEJ1RjVCY2Y3TStqc1JCc2pW?=
 =?utf-8?B?bzhqYjBCdTQ2eXRpNytFNXFQYlp2dm0xY1VncDA4MTc4bU8xRUxnNi9neitW?=
 =?utf-8?B?OEptenRhKzZhMURENno1RWw2Tk5BeEhrb2huczFNbnhDKzFJTlRCUHMwOVVo?=
 =?utf-8?B?MENLS1BiM3dXMjJlWmsvbGdTalFickJlQlZVL0RKQnVpa2toOWJJbW9Lcmps?=
 =?utf-8?B?VVZyK0JtVU9CdngxTDRMdEc3Sld0aFlTbHhqWU1weWZ1U3BUcE54dGNyR3Q1?=
 =?utf-8?B?MVZZOGkxTitYNnhHUzMyWDZ3RVdvZ1FIWWwvZnBqUlFSRDBxZFBCV0YxNmdw?=
 =?utf-8?B?UEg5cGtFUE1ZMC9MZ2lZc3R3QmJ2OGdQS3JhV25GcVVtaDJFNTdUQTBDREFW?=
 =?utf-8?B?WDl1ejhvYi9nYW5XRWFuKzFFaG0vWFA2aGU5bFRrdkI2N0hMVnBqYVIzT2hp?=
 =?utf-8?B?TUdoMnhUdHBrbE0yN3JOaU1jeWhaT0RPVFVMdWNkN3hkbkJaM1Q1eFB1VlRE?=
 =?utf-8?B?L1JITnU5dnNIR0Rtaks5bTlzTG5LRjZtSW1mQjRUZDZxeWRuQXMxcDV0N1JS?=
 =?utf-8?B?M0lhSkRGckhUSFFFdHh6ZVh0SUdUeUplNHQwbWZWZ1hqNGZlVVR4M2hsVkd6?=
 =?utf-8?B?TGloalVBUzFrTnpiR2dBa1NnYlVIVVlhQ2JkV0p5QThrT3A4MFhUY0MwOGNF?=
 =?utf-8?B?R3BMUVFjdllnckFoVFF5L2oxYkw2Y2hCWnRTVFZzRlkzZVRGNGpUclRyYjd1?=
 =?utf-8?B?TUVzekdMcWZCekhtTytaVlhNSkd0bitxTFl2VjMvRHVhWnFzd3hyZlJsNjBD?=
 =?utf-8?B?ZWtCb0wwbUFFOTBmeHhZODlIdTV0MUJsVy9hYmtJNmJYcGNBRmhhVUdiOWlN?=
 =?utf-8?B?Y2t6UlRLbVhqQkFzM0RRR2U1WXd6UnZxQzgyd0lsbzVzcWF6WXk5VDQ5M3RC?=
 =?utf-8?B?NFBwcURiemR4UWpZRm5wSEpHbzVrUkx1Q1ovQ2psdVpJell0YityZndDRWNP?=
 =?utf-8?B?S3RVUVhLVXhlQ0pheEhjbFhia3VlbVl2dlZadmhIMlN1eHRsM1hZMUg2Tkw0?=
 =?utf-8?B?UkkvWDNpN2xGWkdBZllOdHppbnI4WW9Mc1lGZzJBdHFHWDd2azhHMHpvTHZo?=
 =?utf-8?B?Zy95bFJzWEZjRVNEcDBLUFBKV3hqdWFHVjgwWDVrVnN1bDA1MnlXcnBxajFU?=
 =?utf-8?Q?7To2b6hAZsma1iE9MI88W94fD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd1eeeb-0e64-48f1-235f-08daa778f98d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2022 08:58:45.2286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20ytIvYTnFg4qjHhRX4eSyGp/e5G2D4bsPMqn0H6QAvdUWMNy2nZWPSBtFCA11mXIPeet/GxUmNZpD++tnMJlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9100

On 06.10.2022 10:53, Roger Pau Monné wrote:
> On Thu, Oct 06, 2022 at 10:40:56AM +0200, Jan Beulich wrote:
>> efi_init_memory() in both relevant places is treating EFI_MEMORY_RUNTIME
>> higher priority than the type of the range. To avoid accessing memory at
>> runtime which was re-used for other purposes, make
>> efi_arch_process_memory_map() follow suit. While on x86 in theory the
>> same would apply to EfiACPIReclaimMemory, we don't actually "reclaim"
>> E820_ACPI memory there (and it would be a bug if the Dom0 kernel tried
>> to do so, bypassing Xen's memory management), hence that type's handling
> 
> Strictly speaking I don't think dom0 needs to bypass Xen's memory
> management, just overwriting the page would be bad enough for runtime
> services to not work correctly I would think.

Then how about:

"While on x86 in theory the same would apply to EfiACPIReclaimMemory, we don't
 actually "reclaim" or clobber E820_ACPI memory there (and it would be a bug if
 the Dom0 kernel tried to reclaim the range, bypassing Xen's memory management,
 plus it would be at least bogus if it clobbered that space), hence that type's
 handling can be left alone."

I didn't think the clobbering aspect needed pointing out, as the same applies
to all other memory which Dom0 is able to access beyond its actual allocation.

>> can be left alone.
>>
>> Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>> Fixes: facac0af87ef ("x86-64: EFI runtime code")
>> Fixes: 6d70ea10d49f ("Add ARM EFI boot support")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com> # Arm
>> Tested-By: Luca Fancellu <luca.fancellu@arm.com> # Arm
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com> #arm
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

