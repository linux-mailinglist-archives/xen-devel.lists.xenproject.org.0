Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EEA6427C7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:46:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453523.711123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29vV-00036E-2s; Mon, 05 Dec 2022 11:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453523.711123; Mon, 05 Dec 2022 11:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29vU-00034T-VI; Mon, 05 Dec 2022 11:46:24 +0000
Received: by outflank-mailman (input) for mailman id 453523;
 Mon, 05 Dec 2022 11:46:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p29vT-0002xi-Vr
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:46:24 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70c6f3ed-7492-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 12:46:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Mon, 5 Dec
 2022 11:46:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 11:46:19 +0000
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
X-Inumbo-ID: 70c6f3ed-7492-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnj7mpk6XrUC+aXR+0RVfvcNMHc1iiP+JOdq0OzUnbofCyYolJi3EYB9p+eKVTKm/WixrOPTQj+Mqn1u1WrvvXP3xdjFpisf4HKuGJBRGvqN5Ye89O4DjOaLUarzdDGnPob1fovQqCCQG/+zJetNPaKfL63GNXN88MiNB0EXGPunTNP14Kr0iB3KDHPykP2RZmXUgNRPFB+kKnliLjgqmojzMhviDmYAOnoJ4jsuafqTKzb7hH/6n75xW5VYbg5/U5265SnqmRwDMBNBg8NRmm/u/Fu+XXOFhc2dMl/Gmcf5MJuxEg5tV6NLRHvmfyH3+jApTe9VHQ1sIHxvfrYJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4uMqlszxZ0mJbFNuNvJaoVNgRkxAW+T2BdokKWruKM=;
 b=FyLwEiYuhf/LYRfVkEGlxuHEij+PmRBG00LyQqdjE4Bl+GHsSsCCkXObNyPpoVCeYx8BKN0EqBLqHPjo6tw757DM6/StDjEhnNpVYWQPiGuJqSD27fo9ivraGCeuW8PBMRq/Z1LIIOTQaqWDCFP+aAhgaNcNvgi5PKjqX0eL6Cd5wzjxOypUSPLVPGvNBXqF/Xy4eG0TAbskert/NkA72H3aLLAm70A5FnTaK37GYvlcjUDzIIEXULSKObMj6L+cNOd4SbyrBSKLs5Otw7OieUHHS4p8H7pp0lke/HQ/k5tjFW89kuWJxbqH+D/tp26LLbNMI2XczsqUh9QdvE/cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4uMqlszxZ0mJbFNuNvJaoVNgRkxAW+T2BdokKWruKM=;
 b=oSOz0oa63fNyvgRTMaQhXVw3di6PJwXU1F8dze3aqvxtg8zdl7MOGDfeR2zir8S0TzB4okcC66r/KFJ5IZEMpBAY5u1BFH0XwM9JfLzG3zJ5V+y2KLRVQP3kz/Itk7eXn6qqv4kWcrrX1GWC/abKfH9p0Tk0rAZ6ojUdgAjVyIFQcKyJnMUfjA/IlDZhE5okOSTIv8pY85kh40xtKVyKNTplhSFrJzkjdcEVxKolV1j00kd3AjPs5GpTPkkq+9Bd60DrBsuA0oT+cZ8kIj3u/MNzJ//FWeZ6KjV9v3YJMwRjVZKA9IFWgcdU+87YgVVJ+2CC/5d6Q2Ed1mZ5sNqPcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6508b704-771a-be12-8572-7c25cde3d566@suse.com>
Date: Mon, 5 Dec 2022 12:46:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [XEN v4] xen/page_alloc: Relax the BUILD_BUG_ON() in
 xenheap_max_mfn()
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, wl@xen.org,
 bobbyeshleman@gmail.com
References: <20221205094817.21062-1-ayan.kumar.halder@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221205094817.21062-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: d96d2ed5-b2df-429a-7cfc-08dad6b65340
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LS+v569DxnGO3pbfVKLw6SbX3HknsECDwsJonCmpqU8byfD74DbxqlI5wGBAW3Elh7ukPoj+WG5MozD0mp7MRGZw6IpaeIb02xzjxYA671nUw5mZwpfabvFwjl/vnQKjYxDvCDJZgXhkNp1ZDK1xCaYSc85xtYQ06f9u2VhaJzq3Bx0bUOMisuBqAFJCajLXn7kTcMYONbXkcth+bCRjFdRAEXXOjiywGJhXbHzFIrcQe2chIhms0T6nRRL2EAuxPBMSJ7ursZz+1QrRgw4CprkMZrLpIg21oNKPmvo1G5w3u6wFjUg8xKaB5AZIMmU4VjRZ22tfRwCMX5/11q8y1NmmgWpbApFzbBOk9LCk+LKjmoy2SebMFE8pebm66EROIBOyhuaEvgQe5d0TuKZMAfgIvPvE3kI7ElWizlUmE9S6kzzAq5HJr3gcsxNkRVkvSHNZWVOvArM1+o5QNrC1aAZJ3Zi3D9X3NsaHuH4nl2V/CFb3cSzkizzbgsfEDHhb1lcQC/yOFqnuHB0Y2HMuD7BFNe/wJqXwDHhyP6SA7p55lNLPf1Ys4Qq6wWMvvUGjbLlI8fZMR1WgFuUUQUGhJtJ4QWQ3p53dIsy5JPqOW8oiKW7cEbcNNNN84T6Kt+L/KM/QgLqiHuJF8cYxRPH7V/Bhp3DivuUdCKq/jdwYCI75vMBipHYhLO5e2MZztqaTqyapzg2i/GwPDWN5mlFBjgjAwfrYXILT/9nnFi1J/dg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(83380400001)(86362001)(31696002)(2906002)(38100700002)(4326008)(8936002)(41300700001)(5660300002)(26005)(8676002)(186003)(53546011)(6506007)(6512007)(2616005)(316002)(66946007)(66476007)(6486002)(478600001)(66556008)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnR3VS9WaFJLcXpmeXJyU0NveGlJTWFleEJ6UDIrUEhyRjBXZnlxY0IzbktO?=
 =?utf-8?B?SzNNYmUzZ1BhaXNuaWFsRXFEUkFhYVN2Nk9LOU1LbGtkdGZTdzJScHlxYW9S?=
 =?utf-8?B?NFBjUG5mQ0IrUFFGY0EwVmNicTQxSktQQTE5Vlp0djZ5azYwd2NxM1NJMGJH?=
 =?utf-8?B?TDl5UmNJZ051cTFhbndYTzVCQUR4ZDc3OFlTUnQwRy9SSTYrbngxVkppdlFQ?=
 =?utf-8?B?eTZkcmE1Vk1aZXB2OVFRYTBRb2M0T1J4emxIblBiYjFNSDdiNkllR3JrN1lq?=
 =?utf-8?B?QitQRHRFOUhmSFVIZU5EVFA5dlRnRjA3YVp0b1dUK2trRFE1THdUdXNXYm5o?=
 =?utf-8?B?VzBKQmFJZm5DUTBVN0hWOU84bVhQZTRNYjZ5bWZxM2VQQW13bDZ6a1REbWYz?=
 =?utf-8?B?eVExN3NTT2ZvaEV0WThHVEJ6aHJQZ01jM2hSVUJmcEgwSXNDSWFZQ0d4N3Bo?=
 =?utf-8?B?b0JMYWNLSGRMWU1MeG9hUE0wSXhYajBSNDRQN1crdFRZbVd6YjhZM0ZCQk8v?=
 =?utf-8?B?ME95eWdnZVRoclAwc2x4cGgvOG5TN05mb0VaVkpvR0Q2RUFqQTdNeTloYUtm?=
 =?utf-8?B?UXdOSWtlMlgrZWtGNENPSGc0VzlxZkpyYVA2TmhkVGxvUkZ3cGJCa1ZTdEZ5?=
 =?utf-8?B?ZjVYbHZSdW84clBjN3o5RUZ3NjNNK0djK3drejZROTgrZlJDbk5laHcyUmNx?=
 =?utf-8?B?d2MyWjZOdDlUTjJhOXQzVkh0ek9JQ05oaS82TUU2OFJnNXdJNDE5dU16YjR1?=
 =?utf-8?B?cUdOT0cyWG0zNkY0TERxR0JiWXJza1BITGJXbEVqWURzeWptM2UwUzFPUmZQ?=
 =?utf-8?B?WEdKUFhNYVJNclF1VFdrWVluVzBuRXNHa1hzbXREckpNUVlFUzArMVVOeFAy?=
 =?utf-8?B?RVdWdy93SEpjK08rYjcwYlRBTUFxQkg4cERyWVMvZzFpdlZGOUtTWGQvU2VJ?=
 =?utf-8?B?bWcwU2ZQMlhJczJsOCtGaEhTYkRDVm13WDVod2V4TExuejVPcml6R3NXWTZ5?=
 =?utf-8?B?cjNkTGdDaFJXbitkM05NY3UvOXN0UysraEdGZ1ppUXN3eVVLYS9vRzAvakts?=
 =?utf-8?B?dmR3MEhFZlJpVWVxdkxQQWxZNUVmUUZaN2VETEUvNmlPYWFsTEk3c3d2ZzVC?=
 =?utf-8?B?SXFBK2w1Mzg5LytucTN1K2FQdDJtdktncWpVeDZ4ck4vbWkrUDdQZ3kvZ0k5?=
 =?utf-8?B?OXhPVGVaanBqT0xNWGZFamIybTRHL3lObm4rVUJtTlFCVGY4Vmpsdjd0eDE2?=
 =?utf-8?B?MHI2dWdEbU81dWx5azFteTVudkhrWlZZcWdmQy9LNXJyTldtdVBiUFJPUGFE?=
 =?utf-8?B?YnRBTXAxcEhvYks3aEFVMmFzSWE1eXdYWW9lbWhMQ25qQitrMVFHWlBqa0FL?=
 =?utf-8?B?YVFPWWRHWnorQll5OUh2QWR1cFNaNHVGQUxhczV3YkpiSTI0TURseEErTkt1?=
 =?utf-8?B?cGM4aTV1MkZGWkdTc0w0MnhGWnV1TCt6T3dtT2FGS0V5WVlGeFkwOEY4TnFG?=
 =?utf-8?B?bTFSNCsyUEdwUkVONFVDZVkyaFhJYklhMEhsejdBdjZjZENpNlNoWE05TSt2?=
 =?utf-8?B?L21NcGk3c0pDcTYwZ0ZmUW90N2dDU0FweldIWjhqeFJ6VlREMFJBL0NIRFI5?=
 =?utf-8?B?MGZlbVZGVWVDREJnWk1ZSUIzeC92MlpETVdySVdmZTlHRFVRc3AwT2Nmcitj?=
 =?utf-8?B?Y1NtaW5nVlV2UG5OdU1iVjRBMjNJbDhtalZXNzdjc1VxekVxSDN2TEJoU2ht?=
 =?utf-8?B?Ullpcmpod1E1eHA5MVZraEZPdVFvTktqcDd3THBGenBmVkJBSHJoVXlmZEl5?=
 =?utf-8?B?bTA4amQwcWI1SlRNY3VuRStoUDQvWExMcnVXRHhMZDBkSXNCeEhsU2pzZjl1?=
 =?utf-8?B?R2VwK1I5MFVGY1UyZmlOYXI3OWNMKzdBV1Zwb2JaZlZLbzhTQzJlbCtVTXBJ?=
 =?utf-8?B?OGg1K0dQWmFVMTZXU2tjdkdrNzdXSnhkTTNlc3JXa01LSko4MG1wRExRVXl5?=
 =?utf-8?B?dUxkcnZxTGliUjNkd3FrTDkrMlFnQ1J3emMyUXNrR2ZwbWEwSlRKQVlzMFBB?=
 =?utf-8?B?R29kMzhNUm9KNFZSV3c4UFlpTFNyTVhKakd1blBJaHlYditNNHZqYVNaWHV5?=
 =?utf-8?Q?iE6Ydw56WtJ/NKseIWzxBrAEo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d96d2ed5-b2df-429a-7cfc-08dad6b65340
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 11:46:19.7348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e10gMjNey6zGRQ/ZgG77nvVqq+7iDP09H7pXpNbBSUQZMu/2xsxJ4uS5w+DpTwxGjjYt54B6Os6R082CWbRVSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

On 05.12.2022 10:48, Ayan Kumar Halder wrote:
> In the near future, we are considering to use a common xen/domain heap for
> Arm 32-bit V8-R. In this setup, both PADDR_BITS and BITS_PER_LONG will be
> 32. Therefore, the condition PADDR_BITS >= BITS_PER_LONG will become true.
> 
> Looking at the commit that introduce the BUILD_BUG_ON (88e3ed61642b
> "x86/NUMA: make init_node_heap() respect Xen heap limit") and the current
> use, it seems this check was mainly to ensure that the shift of xenheap_bits
> is not going to be undefined (>> N for a N-bit type is undefined).
> 
> So far, all the shifts are using "xenheap_bits - PAGE_SHIFT". Therefore, the
> existing code should work for 32-bit architecture as long as the result of
> the substraction is below 32.
> 
> Therefore relax the BUILD_BUG_ON() to check that (PADDR_BITS - PAGE_SHIFT)
> is not equal of above BITS_PER_LONG.
> 
> Note that we would need further precaution if we ended up to use
> 'xenheap_bits' alone in shifts.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Signed-off-by: Julien Grall <julien@xen.org>

Acked-by: Jan Beulich <jbeulich@suse.com>



