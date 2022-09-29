Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047075EF99A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 17:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413860.657800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvtG-0008So-VB; Thu, 29 Sep 2022 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413860.657800; Thu, 29 Sep 2022 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odvtG-0008PZ-SE; Thu, 29 Sep 2022 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 413860;
 Thu, 29 Sep 2022 15:55:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odvtF-0008PN-TU
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 15:55:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60076.outbound.protection.outlook.com [40.107.6.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33ef614e-400f-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 17:55:56 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8394.eurprd04.prod.outlook.com (2603:10a6:10:244::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 15:55:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 15:55:52 +0000
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
X-Inumbo-ID: 33ef614e-400f-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fdxf3/w43/9yBQaMh3z+KZfjVmWDwPulXFOqpuo3WvIqQD3VTkzYbYO6aTDLoy3gFzX61f0LCN2CaM+bdwDZlc8pCbMEfHTAFHr18yokR+ODw4xyRPxlv/1uXW+tPo8uizkIg97JbbgtNLgKGGTa76ZgsOD6Q2pa631yac8r6BloKgk76Ic+SOO0o57tbungB4fNYmBRDCI3WieqwpmCeX+qmhid/MSEYYG80DG6mxzajY9OjKXjV14LmAjkc/mtqJg1ebXdEaU5RRiJRVV40WEfpTHRjWg9tr24RwtScL/KVZ1mKFsFOgt2ZjrW0pKitD4DKfaFtWikAFffk69r4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTJ0JxJTsuGT4ZSkMcbdE9s23cbnZWxbni1648Q9U0k=;
 b=L2IAvtzvYy48zM/aJq8tMONakdnFh5o0Y7WXqaIbnKFFV/kA2wdpGAxKAi/rKBETtGVluzLZZvHS35vJiB5ubak7VAqBClrkksztuuKTf2Hb+yivoHrlLdRLiVexhPcvT9a4LSUhqbSwy3tMuIVRzdgWAN3ajYFeaXTq3Mu4WQr/adUG/4Tey4K50atE4jx+Jd6W8s1yh7SVVjo5S4nQ7kZ6Y7JRma3n7Fi5MCWRZW/cVXY86/avfBoCkDFFORPx7WaApaoQib5/K1u6pswiK0vEzJ9hQ75m0Wfv9vR5rt5tRoMCR9YB+VVHxV4xEXwg5T4fFqZJOdkbX32H3ZT6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTJ0JxJTsuGT4ZSkMcbdE9s23cbnZWxbni1648Q9U0k=;
 b=wvxVsk/nnSbUMWfRP9R0GQPV/sWRTKy90fVpaA2lSgWVMaALXZ1ykIgXm8ejlaaV0tI7NiOYzX3bB/A9uu59AreznjpyWgkqukRWeSA2Y1kfC4l64ih1pwABBiQTxNu1+RvzMDtQIPMs6bgztrW2SaUoner37AH5aZpcsXYURCeByRiyGWeHLbwcCDJujvOoU0uG0zYix2XTpVGBG7MRuv6X0nAJjXUG7wp7uPJtvh/rO1vn7c/lbcDfMGz05BlbJ+wZ/AeEgVTI3kCFyMQZwNIYx+RTY2g8Ae0yJZfUi+9UisvVVlVNz6P5WNI1AKSwky3vLHGKO2t1OG1ZO57UsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <268f8c2c-57ba-e4e3-59ef-45ed3cd794de@suse.com>
Date: Thu, 29 Sep 2022 17:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [RFC PATCH v1 0/2] Add a new acquire resource to query vcpu
 statistics
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1661330065.git.matias.vara@vates.fr>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1661330065.git.matias.vara@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8394:EE_
X-MS-Office365-Filtering-Correlation-Id: 76855dc8-229c-4f54-fbc1-08daa23315c5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bq2K339RTfg+7KjfdsUQoq6xxwTG8VOv8DUw5WPTnDuCt0kHWzg4jb5+h0zCbFVWvMn/0/U2BrC0fentqTBUDkWtIo43lIPCGHBHiC5wBdjsTTWPJ1y5VHDva7gChaYtr3A8OtqRTtfQ+OFfq1E5R1XBpzwthSNadQTai9RrPyXcpSOg496vEnk3cTtXlExNtGy8e7/G4wWBftotvhKblNKcbtLEReQAqa4vDd9lZvxA9OcW+Ol7MSdB6bizF2VzyXEovx2zsxx06n8OkCJYlilLeMOpUoH8UPGQcNRWg/A36Mnyc8ZC3LzyrS8KfOn4dR5hmhFoXvnE6YzUNVBuZPVFKnhVXyzMiKSOzczYUWNJo2YIMyfAkmP+ec2VbZSGQwqS6mfFFj3t6FhJw3iP5mWhvZpvdLJwmFmjXlhzpv2xD5+KkaLuqUvYLbBollwdwKUObtPY5Bjka9FZVD/aQPzXpv4APGJjeM27IXvHJzLHlKtcqGmAukOLWzW2zpSq5wq5L12brOUB8l+NhrfoYGwih/imLiH2HqXIcn9SVVFSz25Fjwvaj4OjOTr9F146nr6vChJ3Q4si5XckW9Gem7vM39JmOB2I3PG/6eLhNqbuS2JzF5573Tt9jVg4EI+fPS4qIvcR5VLdHqwGar/+QWTMsoRQraUDO11iMAevGuGlfeko3Rt4UA0x/6Qc4p9e/bCNArYnUf48LelVlI2ueUX7ksqSRQkJNmvRszSlMKDUlRJnE9FopeljyZ0YkfEY9xo4rWacPt0WpRJhmXXSrAQk9mlp7nxw8TmaeHTjAVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(346002)(396003)(39860400002)(366004)(451199015)(8676002)(83380400001)(186003)(2616005)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(316002)(6486002)(478600001)(53546011)(6506007)(26005)(6512007)(4326008)(66476007)(66556008)(66946007)(54906003)(6916009)(36756003)(31696002)(31686004)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekR4QWJ5VW5xSk5VVEtzT1NJZ2I4OS93WVRZcktHVjVUMWFLbG4rU28xdXR4?=
 =?utf-8?B?OEFybG0waWJvSERBQWtORVZYYktHY0YydlpYZGo2bzJFSEgyZFU3SFdmSHdl?=
 =?utf-8?B?blh5VmVZRjRLS01TOHRPQWcyemZCZU54UkxqY1J1OFJLRUN1UStXOFBGYjRS?=
 =?utf-8?B?S2R5QTJSc1ZsdjUrdHhub3RDZnlNSkFDN2JJOHVxVkZHUEFCekI5SDNINWhQ?=
 =?utf-8?B?eFBRc1Mra2ZnWkcxZjBCV1N5cEczcE5qYnk2WklPT2hCN3ZwdXJNd3JaUHZM?=
 =?utf-8?B?NXI2SGtGYVRPODM1Vmw0ekVVOEo5MEtTTlk2eFV6S0xFcG4wbGFYTzltMGVV?=
 =?utf-8?B?MGszRXFTMEpqbnB5Z0FEUHVGcXNvamZyWEN3ejUrd1NxeEJ0ZVM1QktnZ0p4?=
 =?utf-8?B?WHpRZTNNQkFqajdUUkdad0dHaWJBYWlLSWZmUlVhQWltSjRlUWd4b29FRmtm?=
 =?utf-8?B?NkxlOVdiT2MzOWI4Z2xhTExJZnNtcWxJZEV3RWtLN3VmQ3Z5akp1Z2hDSDJh?=
 =?utf-8?B?NEJBR3duNjBOWmlkd3dTOFJkeDQ4M2VpcS9LZDJsZXNEL2R5Z0hla1YwSVhU?=
 =?utf-8?B?a3lCK3BUdzFWVFBHQmVsTHA0TlQ1ajBwemVYbEVhN09Oc0Z1alloRUJHaG9Q?=
 =?utf-8?B?SGtJRDFhSTRqbjJxL0oyZ2RrM3IxTFlYQ3o3WjRpWHRkcG0ydlZKMlV3aU50?=
 =?utf-8?B?Zk81NEVmYmlnbXlUbTlBNzUwVHVsd3d2VXhNVlhOMXpvWGNjSGJ5VkFDQnNr?=
 =?utf-8?B?Q0R1SlRMSWwwNlFiTGdQNVV3V3JySGt0cWUydkJkY3RLRndDTXBIUFdFdW9R?=
 =?utf-8?B?NEdneGlMa1c1QVBnUEZDMFdrZE5ubThPZngrOVJWUEpqaGFqdkVONUljdEdL?=
 =?utf-8?B?ZkQrTzJTMm9EaWxrbUlzcUpVSDVqaWF2cHlLZ1pBUjkzZEtzMElsRVNSMW5x?=
 =?utf-8?B?ZE5ubDVxT3QyY2pJRi9odkFORTBMUUE5anBSdU0yR2FpblRTb3oyMWoxQXZS?=
 =?utf-8?B?SGNuOW1zazdWSkJ5NS8wMjh4dWVQa3Nta3JMSSsyYnBuNEV1VTRSUG15MHND?=
 =?utf-8?B?S0NUT2JpdmhDK1d4OTRLS3h6SGs5ajdHM2FnTXppZXdCQm1lT0hHYnVzWFJ3?=
 =?utf-8?B?NUxwTGF4bWViNjY4T1RMeFVTSmtucVR3LzBZZnRnZ0NWWXZZalpaM1R3cGJ1?=
 =?utf-8?B?Z2RTYXE2SEg1czF6MURnVmFkSWliTmQ5NGVJYWRrVDBBR0I5WTV5dlFLL2pr?=
 =?utf-8?B?ckM0NHBuTnBpOEFONXV5ODR0aDR2dzlRdEcyQ3h5V2tSNkJlSmlYSDZWaGlF?=
 =?utf-8?B?c1FaSDlRWDBHSzNTdGdoWWFJbmhpQlpzOTVkR0FiTXhyZUNobXNtK0dJV3dw?=
 =?utf-8?B?YjhXWDJBNDViL0RkNTQwdHV0aDk4c3VuQy9DQWVTSzVxU2JhUVBud0ptUkxG?=
 =?utf-8?B?WDZheG9iVHVCRmd0Sm42UnZPQTFUdHlsUVhHNVJORUtOUnV0V0pUV09oQWZJ?=
 =?utf-8?B?R0NwNXQ4bDRHZ2J4RGpoMTBQS1FvNkN1V3FGNG1jeTladm9EMUltZUJTdmpz?=
 =?utf-8?B?ZnZtamI2NmJFdXpGQ0NQdWl1NnhzV091Tng0RHFseVdMcWRCNG1NNVBualkv?=
 =?utf-8?B?eTJsYnhBSmdWRDFvdnVZWmVyODBldVliY2pNbHBTS2p6N3hyS21SbTlOVzNH?=
 =?utf-8?B?U2gwUGJKeVRFeUNWcytEcnh0TUhQUFBtL0xwNkczdG10czhHQStMeFFGN3pQ?=
 =?utf-8?B?V2R0RUppNlNNbkRId3lIOTBnSWtEcE50bytrN05xVEdnWTYrdUdjdWwxTm5L?=
 =?utf-8?B?b2x0cCtSWm14ZVpJQVl1L3FWMjdqNXRQellkODJhTm93VGsyRFdKWG14MXJo?=
 =?utf-8?B?V1krOWcxSWdhN0p2bktac1NyTFUxTGF3SnNSdm5aR0oyWHM0ZklYOTZxd1R2?=
 =?utf-8?B?LzJqSUU5N0Z3SmFMZTRhZ3FSbVJPcVB0TjQrR2ZadXZyb1h0bGw5WEx0NW84?=
 =?utf-8?B?SEEyVkRVVmp5NFJiNmk3MVlNalk4amdac2JMb0JOYWMyNE9EVkdkOG45YlJx?=
 =?utf-8?B?OHB4M2Nmd2VVR0FwUGpQT2JpUTl6NnFpTXltbThHRWdGNEpscmFpZDdIbWcw?=
 =?utf-8?Q?WzSkLEO9JwYMerKfni6rkj4Fd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76855dc8-229c-4f54-fbc1-08daa23315c5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 15:55:52.4612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRI52cTzHgch3CF8KyvNyNbg76+fOCnXte+BwWFs5MUetEN9LcqLLpMFFEelaFH+uChB+Qmzk+adcLDKTB8JJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8394

On 24.08.2022 15:27, Matias Ezequiel Vara Larsen wrote:
> The purpose of this RFC is to get feedback about a new acquire resource that
> exposes vcpu statistics for a given domain. The current mechanism to get those
> statistics is by querying the hypervisor. This mechanism relies on a hypercall
> and holds the domctl spinlock during its execution. When a pv tool like xcp-rrdd
> periodically samples these counters, it ends up affecting other paths that share
> that spinlock. By using acquire resources, the pv tool only requires a few
> hypercalls to set the shared memory region and samples are got without issuing
> any other hypercall. The original idea has been suggested by Andrew Cooper to
> which I have been discussing about how to implement the current PoC. You can
> find the RFC patch series at [1]. The series is rebased on top of stable-4.15.
> 
> I am currently a bit blocked on 1) what to expose and 2) how to expose it. For
> 1), I decided to expose what xcp-rrdd is querying, e.g., XEN_DOMCTL_getvcpuinfo.
> More precisely, xcp-rrd gets runstate.time[RUNSTATE_running]. This is a uint64_t
> counter. However, the time spent in other states may be interesting too.
> Regarding 2), I am not sure if simply using an array of uint64_t is enough or if
> a different interface should be exposed. The remaining question is when to get
> new values. For the moment, I am updating this counter during
> vcpu_runstate_change().
> 
> The current series includes a simple pv tool that shows how this new interface is
> used. This tool maps the counter and periodically samples it.
> 
> Any feedback/help would be appreciated.

Before looking more closely - was there perhaps kind-of-review feedback
during the summit, which would make it more reasonable to look through
this once a v2 has appeared?

Jan

