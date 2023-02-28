Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948C86A53E2
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 08:48:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503050.775186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuiG-0003bs-KL; Tue, 28 Feb 2023 07:47:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503050.775186; Tue, 28 Feb 2023 07:47:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWuiG-0003ZA-HR; Tue, 28 Feb 2023 07:47:52 +0000
Received: by outflank-mailman (input) for mailman id 503050;
 Tue, 28 Feb 2023 07:47:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWuiE-0003Z4-HH
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 07:47:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 310b9300-b73c-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 08:47:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9589.eurprd04.prod.outlook.com (2603:10a6:102:265::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 07:47:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 07:47:16 +0000
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
X-Inumbo-ID: 310b9300-b73c-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGoEEMMlOLCR8iis6atl8yW3/0EBhYG6czWVV8h5s81ayWMPEJP24EJZ4E/p7vN3/Wnz4d1e7ztkqBwGR53OvlKB4Y91HWhhog5HscrJvQM8Ki3Zx3IYQtEwi5oSk4PZ/bsWhJGqimBoQFiH46H2yziFwOSKDfiGhgK4u5BXwDHmkIM/2yPuzRgogcn4bocwzZxs8r8rNWrVZrbTmHvhqKFMOngaf0hJuqk0igonhuB1mwsKPjaWmmOOhHi4CNRzz3m0rCa1lg3/94F6ZZBuU/HkIMSziyXMOQkjcPN5wRY5iCzKrihrr6YmtdSqw+2G0LYq07YiWgtlQU6p442t6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNnsOQiKAvQXcsiEcmuTGgXBtv+6KrlSKkhh+8Zlcc0=;
 b=P6NCrcVbAdcT9VXgSmnBNyA7bDLAGQCdV8j92xJf06lEoE31ZMp07BhjeXuQvocPHwfXzWruAOZ7o47zK/POEHvE3HOUs7p0POWGvzNncQf/bBgu/RtlOMOpAB0tMnCDJjXKHQJT/b/l8+qyZl+V/RLSbVDKBKlfEqGNzsl1p493FYdkqbqS4UqyVjWotjXKWMpEbPO6hkVgErEPHxDj1I25u7XQjPOW+Bf2TEJNXyOMmXTdOcvLTqSPZ+IhBR0/vvCo6awd39yMzjT0GJJNwzkdK2cnB7QTkU2kVJR9GukwgBtp3RAGbEmdU9y4Nj7OU9wxE2+SOMJkJZF9BxL84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNnsOQiKAvQXcsiEcmuTGgXBtv+6KrlSKkhh+8Zlcc0=;
 b=rQGu+zhnAm24Hbjn6YGEXLeYQWUsMfV0bqNGhM6l85NmD7YKG4Lzveh/JyrwYz3Zcgw9Vfsc5v6zt+ryg2Y1883uSg9RFFzuF+7MGuAqJ1ZAx8iMZS1Zqi3DWb4Uhle/XjKl/0boPnoGM0lrBlHXJU1Q+cqJ436xcB+bApq72e5J6g/GBqeejIvT20XuTLfilZajcWgzRWLkiIuqreKWg0ovf6bjDRqioAOA0EPMd5yJGgSpLnfJVBGZsm/CY7lUecSMy+nBDUzGC/4LQAs8T6lH7p2+ZhAX+dWwVml7JUbOqRCSFO0LEV/LYef6PxOllNipNRXjZDV46fOszShqzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <863cd6ac-eb77-92bd-6584-1eace36e5dd5@suse.com>
Date: Tue, 28 Feb 2023 08:47:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 10/14] x86/vmx: move declarations used only by vmx code
 from vmx.h to private headers
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Xenia Ragiadakou <burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-11-burzalodowa@gmail.com>
 <12849cea-58af-e13f-89ab-a7e9d4200df8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <12849cea-58af-e13f-89ab-a7e9d4200df8@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0066.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0e8f6a-2723-4bbf-5fc5-08db19600316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FfZFCiibqlmpLvknt8LUwY66xoNCWp2osP6LxLvW9KoTTtxnqa02H1FMbLsb6UV+j6qIV1WYgKvI2K1pXZ0Bpz73XXTeIcFq5LAB8fmjALUorKiXRw+xnRjS/PAPo4Kumf2XAU+DYf1Qr7+MdskaaIRvq3SpwtJmTPvqEbH3ns068XHIQ3WV/D5QnpT6cMIVqStSDDe3QrSzhMiNzC335n+EEN8ys0O6FvuOrc9rJ0EnBP9zdEkmcQj4cALFeozoxrtkUke4H1uSDFmY1gPXFQqQbNnSEd0M4StCYDkzcBKZwnG8kAt38+cZXuDTHnJr5Yx3Pi/GOC1vreH25LGler47gc7Zm2dak3HDTYw4Aekjw2Nn3gWGIPwFucuxTvpsZeKTUJPHJwWA+TBR0Ir+21MB9D5qTNqO0Y7CZUeh+VxQAfyg4v0asAPePmc8x/wW3EKMAFjB8m8StNkimwEZXW2qzfTAhs3fCHRxaaLxO175Iz0+etHdznb8oF9xSy8RmUz4uzVCf+svbcFdRN+oixYdxPSYZn+1D1OoPF5slVFipt3Kks0z7eoLdkWD263ZJMeutJ/pyvTo4V6vQ0sZh0VF+ESYKUpZmUUVbUb9jqZeiGTuMtJwNlj82TdTBfI/RzSP0RnKU8MBq13qhg2ajhK06rpPqaEI5j0zhLPO1c9+/3VGTCSydwHrjOnUHRNj2ktSf3W90U40dFXUFGwh9RVo+OqJlB9oKWaaX5Z4k68=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(39860400002)(136003)(366004)(451199018)(36756003)(2616005)(53546011)(26005)(186003)(38100700002)(8936002)(31696002)(41300700001)(8676002)(86362001)(66946007)(66556008)(66476007)(4326008)(6916009)(83380400001)(478600001)(316002)(5660300002)(54906003)(2906002)(6486002)(6512007)(6506007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGpxMXF6VU5wd0dvcitFOFdhODdLdkI5S2hKMUFlc1IwRmFHck10RTk0MXJM?=
 =?utf-8?B?VU5YS2JKSXNwSHJwdytUb0p1RFRVbXczU2IvNi9qTkphMnVqQ040ZnZiaG5o?=
 =?utf-8?B?eEhBeSt6TmJnUmZlVGVpOWYzRjlGeVVKTm1FRmxXR0Erd2FKdll0L3dmWGtX?=
 =?utf-8?B?T0Zxd3ZhL2llOWpsNU5HWUJIbUE1eVFvcWJZQXRIeDNTcFhLNkpBLyt3YllQ?=
 =?utf-8?B?b2Q1cVBWeEI5S1JtZmFrODRMNnlQbVl6dVBhWkFiNmord1hrUUlPc3hDUWZn?=
 =?utf-8?B?Z3hmbzdpdmJhc0FGVnZ1dnpvNDdzNG43RE9BM1JkeU5wVWt1ZVpDbFlGWW9y?=
 =?utf-8?B?UTladG80alNwNS9WdVdIeXQ1aTRXK0ppQURRNnRLa0hUTjcvWjV3T3RQeHgr?=
 =?utf-8?B?ZHdMNW45Snp3QkJaY1RCYThzU3VvTDNJSHlGQXZ5d2s5Nlpld0VoL0lyRlBj?=
 =?utf-8?B?SW81Tnpud21HL0swRGdDNlFBZTQ5YjVNeEhVLy9SY0o3TTdSeGlhUk9JVURv?=
 =?utf-8?B?VGo5cCthbXVVbDJTUWJvNUlxZzZ2ZmkvMkVHUGxZSFJGbHQ0ekxGU1d4MG9w?=
 =?utf-8?B?V1IwM2t0R1JZMk9vK3dRQis1YnM5VGRZNXJ5STVXMkdFR0hQQVRRY29kS0c2?=
 =?utf-8?B?VlNoWTlEZXNaWlNXWFNOMUQvVnJZMGJjWDEwcmdwamdsZ2NoSzQxdGRLRkgv?=
 =?utf-8?B?bkRzcmtNd3V5TzJMQnRQd3VBaldXbitwaitmMFJUcFVnQk82a2VObWJTdmNQ?=
 =?utf-8?B?QXZWcklxcjB1Nk9mK0VFU2w3VG5zOTIxWWtLYUFRZUhXS3FiOGpTMDdzQ1Bk?=
 =?utf-8?B?RHBYMWtKeXhKZXMyTVp3Q3l6b1pWK0RtODIvK0FDSlduUFNuU1VkOWJmbnNs?=
 =?utf-8?B?R3ZnVUF5YnZ0U3RJcDdhMVJXaStYblJuVjlLNDE4Q2tmUm15L1V4MFRaSTBF?=
 =?utf-8?B?VTgwQjQyVnYrVU82NkxUR1J6MVo0RDJYRWJYbmZyWmlib3l4Zmp5ZUJzS1NR?=
 =?utf-8?B?K291QlYrL1hPTHNUVmN1QnFZeVUxbElLcGMzZURkTFRySXdzU1NGQmo5cVc0?=
 =?utf-8?B?SVMwK2wyVWkxdURKbXdRWFdhUGlITVpMWmlxZUhKNXBGdkswVXpFR3NvaW84?=
 =?utf-8?B?ODZ6VXY0ZlFNMzJRK3pIcElRN3FNd0gzOFJGemFCRzlBODk5amo4ZkRNc2dJ?=
 =?utf-8?B?V21NbFBpNDVScmRPMkcwUEZxSGJ3T3BpMUlpRE4rODVDYlR1dHNkaU4yN3JC?=
 =?utf-8?B?T2twaTVkSlZ3L000Y2twN0RaTkpQcUFWRDJ3NU83M0lkUlRjbjZYWDJEa2Y3?=
 =?utf-8?B?V0hBMFJnWTlxZ01LRituY1daMjhrMUd1eUthOWtBb3BDanJKRWxNNXVjVjZD?=
 =?utf-8?B?ZXIxZDN2aHZnZzY3VDBYMU5rZjdBWG1Lem8rWXA5WFMydFN0eHlNc2JlQUFP?=
 =?utf-8?B?ck02bTFzZHZKbVQ3Tm92amUvcHdNUlc2T0FndVJVb0d0SG9KejlIcVltc2RN?=
 =?utf-8?B?U0duUkRvYkxiZG5zNzhOeHFZQ1ZIb2RHRkZyZitzRzBjSncvajNQYnhsR0Vx?=
 =?utf-8?B?S1VxMnJ0NTc1VEVna3ZEZ2ZSZk9Tc3hZTG9mNUZzZlVUa0F2cUEyTHd2Q2xH?=
 =?utf-8?B?N3VGN0tmaGVKKzdueFhCL1I3RE1pa1dTK3JqR0xUWThXSGI3UFRlKzErKzJz?=
 =?utf-8?B?SmVDd3lBUVBRQWV0VWdlclU1Tlo4N0VFNno0QVdJejBEYWx3SUpoVWxuekpD?=
 =?utf-8?B?aFhzSGVpZE1jS1E5VHFVLzkxYzhTSk9CYzlvUjE3YWRMdFpnL2sxSTRkYzIv?=
 =?utf-8?B?YmVCcTNRQ3dOdy9sVGJmMnJLeUdPdkVqWVVaZUoweVNXQmpDL0NMSDJPalll?=
 =?utf-8?B?UGM4SEY2VE9BWE1uQVIvTmNKRWdSUGZKWmV2dDFXRlUwSXNFSy85NVMzdDNz?=
 =?utf-8?B?dmNyamJzS0JTd3VrR3RNOG1RbDNnWFlTdHJUUXNkK3hyNTJHdFRoRVJOMkM4?=
 =?utf-8?B?SlpoY08xOC85czJQOW5Rdmk5QWVad0JXSG5xNmVzWm9zUTkvSFplMWVDcm1P?=
 =?utf-8?B?OVNHS0pqbE1ESmhRWW1rcEc4T3ZoeTY0SDJUaW9aVEdid2R3bkkwZ0VSZkNC?=
 =?utf-8?Q?I97QGx0810Z2TRv0g7JjZU5y9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0e8f6a-2723-4bbf-5fc5-08db19600316
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 07:47:16.5066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDZ7pk6JtjKDLz0SnyW+MX8IEQ2og4PYoupaZh/8TAwpmppVaecESe8i1EHKcP+HBu928witkbkQsMgezGZ7/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9589

On 27.02.2023 17:26, Andrew Cooper wrote:
> On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
>> Create two new private headers in arch/x86/hvm/vmx called vmx.h and pi.h.
>> Move all the definitions and declarations that are used solely by vmx code
>> into the private vmx.h, apart from the ones related to posted interrupts that
>> are moved into pi.h.
>>
>> EPT related declarations and definitions stay in asm/hvm/vmx/vmx.h because
>> they are used in arch/x86/mm and drivers/passthrough/vtd.
>>
>> Also, __vmread(), used in arch/x86/cpu, and consequently the opcodes stay in
>> asm/hvm/vmx/vmx.h.
> 
> Every time I read the vpmu code, I get increasingly sad.
> 
> That is dangerously unsafe, and comes with a chance of exploding completely.
> 
> That __vmread() is in NMI context, which means `current` isn't safe to
> deference (we might hit in the middle of a context switch), and more
> generally there's no guarantee that the loaded VMCS is the one
> associated with `current` (we might hit in the middle of a remote VMCS
> access).

Are you mixing up oprofile (using NMI) and vPMU (using an ordinary vectored
interrupt)? Or am I overlooking a vPMU mode of operation where NMI could be
used (i.e. other than apic_intr_init()'s calling of set_direct_apic_vector()
and other than pmu_interrupt() invoking vpmu_do_interrupt() /after/ acking
the IRQ at the LAPIC)?

Jan

> vpmu is generally not supported, and BTS needs further custom enablement
> because it is only useable with a custom bus analyser.
> 
> 
> The __vmread() needs deleting - its absolutely not safe to say.
> 
> I'm tempted to hardwire the return 0, and punt the problem to whomever
> next uses BTS.
> 
> Alternatively, MSR_DBGCTL needs wiring into the hvm_get_reg()
> infrastructure, but I'm not convinced this will actually work in either
> of the two problem cases above, hence preferring the previous option.
> 
> Thoughts?
> 
> ~Andrew


