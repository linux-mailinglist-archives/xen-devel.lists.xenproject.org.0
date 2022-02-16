Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B384B8CBE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 16:44:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274259.469670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMSt-0006Oy-0X; Wed, 16 Feb 2022 15:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274259.469670; Wed, 16 Feb 2022 15:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKMSs-0006N7-TR; Wed, 16 Feb 2022 15:43:34 +0000
Received: by outflank-mailman (input) for mailman id 274259;
 Wed, 16 Feb 2022 15:43:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKMSr-0006N1-5Z
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 15:43:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314d068d-8f3f-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 16:43:31 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-29-ubEfInxVMRmgZHIgM0aqdw-1; Wed, 16 Feb 2022 16:43:30 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by PR3PR04MB7386.eurprd04.prod.outlook.com (2603:10a6:102:85::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Wed, 16 Feb
 2022 15:43:29 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 15:43:28 +0000
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
X-Inumbo-ID: 314d068d-8f3f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645026211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5ywUzlXsfUlbcScrFPkd7jP1KPxdP8PhPk+LToxxHo=;
	b=Ugv2hilZ1gmXNxzuVx9Vm/RaE1+u9YgzSkNg6zfWQ3yNpX9fDwiZnkxvXW2+/Zr2jSMghg
	RqvNtkejC2zaJiSZ9aFiWiwD8sRo4P0PbItOwa14qTnNssu3w1Ck6tHHpwPgi4wOKGIYmT
	Uj4fVFnLe8YbgqBNTVQ2G7cg5OKyEt8=
X-MC-Unique: ubEfInxVMRmgZHIgM0aqdw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y5ADSu5PxkigULrPPen4VSVUPxGX0ToPyp9qB2GHMCmCxElNN50celRLl6yFgQM5gujJcl9N7XScejX2kYWv1TA4W2RmCJ4yt4lZY7+4ySiOaANrqakCdLH3awT8196EgM5+weoHHvBL9IwTUGTEEO5yH7d6WZ5wWNfF6RTBMjf7avfQ29yYVSZKaQEo/lAoV5MFgfpcrl6nG6KKje1rOcnL3OudbGaKnc5c+KOI1i+6QRxqNxeED4eodof5y3ZuavdtE1qR3PR/diYCP/UswMyD26hr5geF+pBJrf94jMwL8zDibIe3OMAEFr6HoiMUCIXZ2y455aV2jp0+IVLsiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5ywUzlXsfUlbcScrFPkd7jP1KPxdP8PhPk+LToxxHo=;
 b=OCzTv+B/6FElx1yf9voLK0h3eexm0Y5fNELkuq1ONO5hGbTzsqAOPe0NuQkm0tGSy5fUuuCnzMe+ulzFjaVYLkWr0cqLk/oyq+Ra5ooG06ErRVDRu8aaG5FWqOslAIlxbekWhW9qn9h4rZpqOJXnPFlf4WG/xlGbv/l7KK6Y2Snn3kNkcs698+0l7TBpm16kfnwWUn3rTyDjfwr3xZ+5DekgTSkUKBPp7o1jOOwK2rl/8dgdo7l549au5Wa5abkDhXsY1OwaTb/fZGSgb0t1TiStex2V3Fve22QGsC8YMNEvp9v9M1M/qG8EOUG+SbnRNKpDukHOJCu8XtP6eWOF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <979fbc26-925c-f58f-9c1a-9ccd72275c9b@suse.com>
Date: Wed, 16 Feb 2022 16:43:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/5] x86/cpuid: add CPUID flag for Extended Destination
 ID support
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: dwmw2@infradead.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216103026.11533-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3b548e3-5909-4b95-29d7-08d9f16313eb
X-MS-TrafficTypeDiagnostic: PR3PR04MB7386:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB73869351E2F14CC29C47266EB3359@PR3PR04MB7386.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K0MmkbfGDnJMIMK+bWHCGZINXeLo6eVhY/djhEdfdZ8mp5gmtAa+5mZ5jVRaODbSnBIweRchshX61N5hUtsmT1V7udfFNHhCn7p8dcoCBFZHun7KeQwcpLMgA7MBiMxfFhky/Q2nV8H2EkmjIwa56eYQFDznUi7L2niyGjfgboIUNiZAPC8zhE5RLk7c522AL1ZjM4jk62/fobWcPe2Oky7di9LHEOPkaiQ7NmGm8RaPiWkbh9gvQcjc2DLynqbbHPss8Sr1HCrn/EzqbDPrGUnCPjxm1PYZdECbEsfVV3QVrIkjjIHz0zZXMgllQs5b4BZuOd0a7NRxNp7Tig5ejkIoOgCKb5Vo/8DOf55MoF/ge5611S72F17keddnM6RDin3yt/8rLOwv0G/8i/56jFY08z1KWQJnVAISBJw9ZkfGQgUUBMcqbIXc/JbatrX8ApX/sQwE94UEgzTprvmIfZ723xoKzvw+MHAcDCDSd4fakWDeFXEEo0jNz73uGZtbRFgRVtxQEVXVzRnJ6DLuFDYQEhPujU3nEtRJ99pR0qvRdUl+aOr1kV096uGhyYkBBbS5pMag9ZdC5St1It8JC91PBH72GJiEB8hhi9sKJ5p/By5ghJSCJCxU8Rmt7KZQanuy0f0lpdSPuFBmMuQD2zA4rjiUwIArpJOxkLPbtnfGhHNTkFiXQAPsJVg7BqpGF8syZ8LxQXnE6072pLHhVIe3rCU4Bt8UJl86hIgpXh6DYcI6w8SwE7F1etBuRtcx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(316002)(38100700002)(86362001)(66946007)(6486002)(508600001)(36756003)(54906003)(6916009)(31686004)(26005)(4326008)(8676002)(8936002)(6506007)(66476007)(2906002)(66556008)(6512007)(31696002)(4744005)(5660300002)(2616005)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmhzV0xjMUJhQW9SSU8zR0NDazViUmNYbFdOUlNEVHNyN1hacDA1Mzd2ZFY2?=
 =?utf-8?B?Y2NwOVhEeUpKblVqN2xFZDNORU5iTzdaU2E5TXZLeVltVHplWFA4aGhUcUNE?=
 =?utf-8?B?dExrclhya3IwWnFuNXF0QjV2dmVjK1hRbGdZdDJuT3ByY2xFMzA3c1o5ZFpS?=
 =?utf-8?B?V3JNM1hLS004eVduay82aUdlL1UrODUvWGRTeVpVRHNlclY3ZGtOTFZpdkJ0?=
 =?utf-8?B?M1JRU0Z1czI2VFBoQ2pDTUgvcEY1UGNYOXJwZ1diTUdaakd3QXZqSzFmc0V5?=
 =?utf-8?B?VkVxSWRoaDZNYVFIcXM2L3gxMnU4N3VUdEpkbkFMMGtUTUhaM3B3MHAxTjJE?=
 =?utf-8?B?T1N1QmhZZDJqRjd5YVpDa3dJVHVZdllpUDM5RHlNMWVDTG1oTldyYURUckIr?=
 =?utf-8?B?UFNtaW00cW5kZCtpcDZjU1pjdlZ6L1BpclR4Z0JUeGs5ZVZ2TGxlb2FYS3FJ?=
 =?utf-8?B?VXBpUkl5YjRwb2Z5VnRQYmFoLzU0NUNtSVdPYjg4QzBlRlFHL3pwYjJaamhL?=
 =?utf-8?B?WWpzR2ZGblY3LzZWZ3d2OUs5U1IzUURhaXR1Y2xoWTl0UVdjSzlXM0lMd1Vj?=
 =?utf-8?B?VzM0anluL3lOVEVmUUFPTzZXS0twVWNjZTJVVFZiaG9kM29PQ3I2eHFJTGY3?=
 =?utf-8?B?SVErQWVkRC8vTDAzbFhxdm5QQjFFblBPUm5udkRxQzdSUFdKdkpZMlgxanhl?=
 =?utf-8?B?eUkvRXZuYnVjbEtZSHRNeURjbW5neC9JcFNWaEZIRFlyRysvMkVwR3J0c1FL?=
 =?utf-8?B?aytuSFdCeEhXM1NhbHpZWDQ4elcrVFlqTkhzbkFoR2MxVE5HM0IzUmx2dW01?=
 =?utf-8?B?R1ZTSlducCtzQ3JRQzBjcmVOUnBDd0lLMkk5R3FyKytpenhxV2V2RGw5SFpN?=
 =?utf-8?B?QnRrc2xFRHVOR1RGcFFuY3dJWkh1REhZcVNHSUt6c1N2bDVtU2M3UUo3aGRi?=
 =?utf-8?B?b3lFS09UTUhrNFlURzBwOWp1eXdwKzRNZ25aL1QwUTZVSFo4aDNlbHhNOWZI?=
 =?utf-8?B?elB4UmhraFNqM1NOMHRvY1l1dW1kYnNRRWNwZVc3d1krZHVRTFdJdzRkSEZR?=
 =?utf-8?B?RExrekdBeFZCd0wyeXY0RUROdTJkNjE0QkpnUDhlSHp6R0pEVUdrbEozVXFn?=
 =?utf-8?B?N0VHOVZsV29pcHVJT0IxWFVxcFBNYjU4OU15alJ2L25FdDRVSG5xVTRuRWVs?=
 =?utf-8?B?Y1pHNndCK0R1OFlPbDlKZGJEbzkxZUVZNnZ1bWJFcWpGcFlwYU1teU9FN2xP?=
 =?utf-8?B?QVVyTkpWdUtNRmRaVjVuM2pVR294MVZkSFhPdzJlN3ROMzZneUR5Z2ZPMkVG?=
 =?utf-8?B?dVFKVlBjTmQwVUJIUGl3Yyt2cDlJckppRUpEUWdDVldGbzNlbld3M2tBOTMz?=
 =?utf-8?B?WWE4TVhjeEhRMzROSVgyQWlta0JKZVFYVXljRlVQcXVDQXRoSFZhYVV2eENM?=
 =?utf-8?B?ZGNKcTBIYVd6NGllSENiWFN0S0NTOXB3UUYxRVBKUDRranA3enpycVd2MTU5?=
 =?utf-8?B?TGdXeHBnMi8vMnUvS3A0M1ZFQ1EveG9Cd0VRa0pjR2svL2c2NW9lUTR5NTgr?=
 =?utf-8?B?bFhaNDVydFNBSmU2b3QwZWEybitZSnhQVmpXSElRN1I3eExIZGRxK2JNQWhY?=
 =?utf-8?B?bmF6elNVTEJFcWdJVkJGUHBpa1cySFFERlByQ2x6ZFc0YVQyTzZHcFdkdElI?=
 =?utf-8?B?NDdrMGs0M3BrMG5GcldYMWVicUZnaEttU1VPM1YyOTQ3Uk05bXFxL0xGcHh1?=
 =?utf-8?B?T2RWRVV4MVdpcS9hVHVwcTh2a1ZySDRxNFJpbThtYmxmTDQvWlRXYU45ZHkv?=
 =?utf-8?B?d2JWZDhnS1h1WGVnTzRJYjVoQUtZd3Q4dFlMVlhPOHo1TjVQRXpSVHB0TStL?=
 =?utf-8?B?WGw3MVMrNlowWWtjOWhtZlg3d0VFcnFKRDRVSTRGK3M3SFBVeVNoVGRjaVor?=
 =?utf-8?B?dUFQeFV5S1lMOHp1VU80ZUd3bzMxUFF6dXJiRXZtN09UeEt0SXpJOTcrQXFa?=
 =?utf-8?B?QjAvTlRJT0hxM3duMkFTM2pRQUlDNXRtMENsWVkwSHc5dWt2dlkxaG5HOTVW?=
 =?utf-8?B?aEpzTDFLMXlyelhXOWtjNk9CdGhBUGY4Ym9VeVlYOWcybXJGNHN3SVJqVXJC?=
 =?utf-8?B?eml3V1MrRzc4Q0JTMXM0YlJpQjdYenQyR1ZQY253M3F5NmZXVDJqYjJKRGw4?=
 =?utf-8?Q?MM6wcE+B/SN71DkFXbuYosk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b548e3-5909-4b95-29d7-08d9f16313eb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 15:43:28.9433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Si1WwI1l/EV4WODW6tEmrJ5VWQc14VZze2K8LWqMctefPLEwyR26G/TpveJRJK4J7bP7wlozTPzCVbsUMo7bZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7386

On 16.02.2022 11:30, Roger Pau Monne wrote:
> --- a/xen/include/public/arch-x86/cpuid.h
> +++ b/xen/include/public/arch-x86/cpuid.h
> @@ -102,6 +102,12 @@
>  #define XEN_HVM_CPUID_IOMMU_MAPPINGS   (1u << 2)
>  #define XEN_HVM_CPUID_VCPU_ID_PRESENT  (1u << 3) /* vcpu id is present in EBX */
>  #define XEN_HVM_CPUID_DOMID_PRESENT    (1u << 4) /* domid is present in ECX */
> +/*
> + * Bits 55:49 from the IO-APIC RTE and bits 11:5 from the MSI address can be
> + * used to store high bits for the Destination ID. This expands the Destination
> + * ID field from 8 to 15 bits, allowing to target APIC IDs up 32768.
> + */
> +#define XEN_HVM_CPUID_EXT_DEST_ID      (1u << 5)

Would the comment perhaps better include "in the absence of (guest
visible) interrupt remapping", since otherwise the layout / meaning
changes anyway? Apart from this I'd be fine with this going in
ahead of the rest of this series.

Jan


