Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514C47774E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Dec 2021 17:11:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248060.427833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtLj-0006tX-Gc; Thu, 16 Dec 2021 16:11:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248060.427833; Thu, 16 Dec 2021 16:11:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxtLj-0006rC-DZ; Thu, 16 Dec 2021 16:11:19 +0000
Received: by outflank-mailman (input) for mailman id 248060;
 Thu, 16 Dec 2021 16:11:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxtLh-0006r6-J8
 for xen-devel@lists.xenproject.org; Thu, 16 Dec 2021 16:11:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe22609-5e8a-11ec-85d3-df6b77346a89;
 Thu, 16 Dec 2021 17:11:16 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-IDoZ6GCFPFaXd--Mh6cKDQ-1; Thu, 16 Dec 2021 17:11:14 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7024.eurprd04.prod.outlook.com (2603:10a6:800:124::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Thu, 16 Dec
 2021 16:11:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 16:11:13 +0000
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
X-Inumbo-ID: cbe22609-5e8a-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639671076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I92ZBA85YhkaIz1utKS+c48AvSwviGrRAUr86FhXOpg=;
	b=QQiHu2EJSbf6peT/K6XatVU5FgmqGX54j3uE04Px3SKdoqoeIgXglYwR1Gb8kZ/3JbEBE2
	fEq770gZnI9cMC9JbYm0ktr2X0Oyzdm7lxTxn0h6/oc0Gb0aj4mixXETozrm28LU1DI3QD
	dKYRsRG+2mP4yxI5I6zDDFziVXbfjBo=
X-MC-Unique: IDoZ6GCFPFaXd--Mh6cKDQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dk0bkO0Cydb9fz8uym0hW7FkWyohMRGgUWmxL9DAFsEWGWfSxcmNSZIdRSL3KX40n9FA/Dt8/NYZmkgTnCd6UkVq++RohcSJirwyjR4zCOkZ05k2KWF8xB2Q/EOo8qnfC1f/560v47zV86bUCiHz88/VI0pcwIn+TGW5hviPGSRBuoUkgWOmLhKt576iT441p+DDJu7BX/ZSoXOnkr99t1gp/o8STPZ+ZyluApYAMzrFLrw9QaKV5l/xZhFVIyyzA6d6IJG3qWASfg+HXVhttrGduKW/yh/LDE4PEgtlMWK2Febc1Yg807qxlHDySFirS13G/wO4X31nx7yd2x5jLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I92ZBA85YhkaIz1utKS+c48AvSwviGrRAUr86FhXOpg=;
 b=GK5xe2LKseTW18K7y9kUr90vQZ4hqiKrnxGb2RVqfswKx6wyfHCioqR8G6jZXqQPmdazuFL5LmRhuWE89OxdKNDFoJ0BX3au74otBBWpME9aVsRmSa+Mi5ltEwV5u+a3CMO2yzxGCeB4pEdpD1K4Mm83cmrbky4LTKIntxarg2w49jzfNfXy2XkxGKTD3tLABactwxhAPp203quT7erA2Pblut3UDmeNkneGf5cxoTYC4B3rbHrNKZ/bTYW5whS4oRERYJXtxziKXddMqUo9ibeQ3fp1INQ7EPTySgtIgxsYxy6Xz+Ul1RX71FIsvR4e5/GnXvGjAgswKG7BI4VwGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <75446682-7f6a-d8c2-d30f-977096209a26@suse.com>
Date: Thu, 16 Dec 2021 17:11:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] xen: arch_mfn_in_directmap: Reconciliate the name and the
 implementation
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20211216152220.3317-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216152220.3317-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0033.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a399538-9366-4f80-502d-08d9c0aeaeb5
X-MS-TrafficTypeDiagnostic: VI1PR04MB7024:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7024796FF38D1AF09326E2F8B3779@VI1PR04MB7024.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mZBZEhtZnnvThzi6plB9IcQkdwy13RLAs8FXIFnchsYpxFxAodk1FbSc1fq0pluNnvxSzL6aKsthwDR/kht2wCiA0HxcufoT4at0hZI0Q2cx7Omr+ndjK2GFkcBV3HvOCGPf3Q7KDALcAvnfG1c8vXkc87m072XJV5Tx7s3UBiPUsg92pYD8da9zC66iV8UjnmGP6I6Ji1W2bCw4SMiuqZPzi98+9PLu5ce8o2ZRuYxweInlSZM5v3COTYjvrg8n9wtok1vteJ7rHk4gEZhZ5EK40oxp+hmdJ3EUq4p1LdNB1xjJGprhSoKXlGzMCXFbGAROxHyT4KbXMMzESNtg3p334NntNkgfEbEybwqRkoDhsYZSkkn/yeWN28ml9sE0sOEEojHbjgoWUsB7/IwHh2PZWi+SOG/HvU/rJ0gFfJb/HVBk+cOh5LC3olcUYh5ybKGC9mfNAWi4LxSeVDjg42u6YLCLGLr32GFRwdSVSP+EH+ZTwVubH3bKbjlVvhZYGaawfHCTpU5UNrEUZc8ZOF1MvMXpdgRXmvyzBFxK/yD2vJLePOAr3NVivMAo4MhzPnRPnB5TYfpZHemLCHBrCjbFz73Lbz1QM1aXBxZY+Z90t6o9X0ns4lFO5mZ7KYPILNwylaSBjO7moseRpn1Y6Ol3YVNBA0lm4GjqdjMZ4LrGSvJ6oxfJh1nL0hea0KJB9P8eTJoRc5vKHRP0RmMvoGyuvUqWWpCcHB1yMtY7Yn7dupiTF17fXnsmQKhY3kUT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(26005)(31686004)(6486002)(86362001)(83380400001)(6512007)(186003)(508600001)(4326008)(36756003)(66556008)(66946007)(66476007)(6916009)(2616005)(54906003)(38100700002)(53546011)(316002)(31696002)(2906002)(5660300002)(6506007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cyt1Z3V1dVFZREwwZkNCNWdteS9Va05yM2U4TzNCUXhQNnUreUhYSXJUNno0?=
 =?utf-8?B?ZTQ2RHpvTHEzV1VTUVdGMWF1aXJPMHdnNDhHeEZXckFqK0RxS01iSGR3YzZY?=
 =?utf-8?B?TkkxVEgxZkxCZzJZVmVubDJMMGp6cy8rdEdpQlFRK3NLSXVNbGJlcnVpR2RR?=
 =?utf-8?B?bUk1OGZIdGc4cUUzT04xOW9tRWIwc2I1RDg3S3lTNjlKVkJabHVJcE9hc045?=
 =?utf-8?B?R0t1MHZMc2pONDVlejFzVm5maDBjTU1YMnZBL2FEUGZIbHQ1c3NvYjY2L01Y?=
 =?utf-8?B?VkVFQWRyUnlndFBGdnh1aEtkazREK1k3Q1JQaFRpcURNZDNHb05MdkV3K0h4?=
 =?utf-8?B?d2pZWmswWUlYWVZndjVpOW9TL2hiK3ZpeWphcW5SQmhQWHBZU2tURVc3Z1pV?=
 =?utf-8?B?U1hHK3NyWmdQYy9XaEhpR3phaGRNdUc0NWRXUW1xd1A0S3NyQktQVm93Mms0?=
 =?utf-8?B?Y2JBUlhEMmJ2cXIrZmR1YWNwbU96eHBoamlRS1RER2dUY0JCNVc1R2ZpcVM2?=
 =?utf-8?B?K2xEWUpoT1ZJckFhMWhBdkIreWhiMmFRbklxMEdndVQ5MUZsVGxJZFN0VTVD?=
 =?utf-8?B?QWI5RERvTGxJOFM3MzFHQzVDWG11bFFwQVpuS3EzSURqM1pOZktmelE5ZG9C?=
 =?utf-8?B?M3J0Um84OFZQS1VkRWFPckFJem1UU0FzWWk3aUdjNUF1Ni9DRlRKVkZyWnpV?=
 =?utf-8?B?U0FUREZlNnNaVWZCVitRd1lkSHFWRlhlVWE0VGxhOHYyejlsejhBa3FzaHRM?=
 =?utf-8?B?Z3V2RFpXenVrVVJsdHB6L0RVaS9JYWZaWktTcHhCU3dtZnNRbFV6bEt1TFVI?=
 =?utf-8?B?ZUdvRUg3eXFZdFUxVzY1UUQ5bGNtQncwN3FrNTd5RWwxekZjeXM0b3R0M1BS?=
 =?utf-8?B?UDFkRHNRZWNSOGJlU1pGd3FWby8vYjZ1Y2tTRjgyQUxDZ2F0NFNncVBJOVcz?=
 =?utf-8?B?VCtXallKWFE3aU5KU09ZMXBTUXRvZDQzeUxxb2thdktjemZmdlRDalM2alFn?=
 =?utf-8?B?OUQ1a2VWQ3dZakM3ZmhvdTNUdVNIRFprUHpVeU5JbU55QnYzeGZzbVYyRDZn?=
 =?utf-8?B?OEVob0MrNnlVeVE2TnYrZU9IMHgzcncrSE5QOE9kT25NZ1NvZDJHTlZNaUJn?=
 =?utf-8?B?YzBVUjVrekJRZGw4djlnb04yVGhPZ3U5YkpDVWNJeFVDZmUyczdGVmhucmZy?=
 =?utf-8?B?THZxUyt0VDRsYWlMUHR0dGc5QmVUVXZvMXhLTDZ4d0NZSW1RSTl1eFJqd2Rw?=
 =?utf-8?B?UUdzVlBETWxCZDJFbDJGK3l5MlNidHh5N1ZpSk5CdjhjWkIrdGhkK0ZBUjdO?=
 =?utf-8?B?Q3BpUWhPWXBZRnQ0MTBUUnFzVVd6bVBQUE9xN1I1NXZCVk4vUSswYnJVS0dY?=
 =?utf-8?B?a3J3YlE3cHRKNGZuRU9yMlVsVHZkenVIc09DdXhMZkJXTllmQkNIOW1OakIx?=
 =?utf-8?B?UmNDaVh0ZjU3d3JMYnJPbWVkYk5POXorTWFIY0dtS2ovd25xQytiMG13aFJ0?=
 =?utf-8?B?RE5uMnI0eGxHOHhMQng2OVl1WnB3Q0VUV0hYNCtzVEZNQlV6M1RTUk5BSWtJ?=
 =?utf-8?B?ZmxLK3RlMGc3Z2k2S3B5T29vVGpreTBjNURaUW5JUGNCdHcxQlNjV0x0LzdM?=
 =?utf-8?B?UjhYeFJScDNFUFp5d2VlWlQ0SEtNaXJJOUtDSE5iUVBzSmIzclFpYllLME4v?=
 =?utf-8?B?Nm9WZlJIRDlscUxsQ0xqM0dnd2dZQUswWEQrNVR5eGZnYStsZkFiaGlkeUpU?=
 =?utf-8?B?NnBNQmhId3NQWXNaVDRPZzc5bGU4WHViV3AzWDlRT3liTk5vQllWSitMNGd3?=
 =?utf-8?B?RUR3SkM5aWpUWWRUOFVoTDZmdDR4OG9sb25QdE0wT1c1U0NzTUQxWE83cGM5?=
 =?utf-8?B?S3BBSlNFaXNYZHFFT1o4dGxBWCtsN0U5S2hNM2xnbkVuTFF6V2tXT2M0UXdw?=
 =?utf-8?B?QU9SYWhKWFZPQ2xoREdmbVVxd0tTekp1YUJRUFpMczJLMnNoS2xMVi9uMk0z?=
 =?utf-8?B?VldWZmRBT0hRMTRqdjRSRFFFRC9vRENNM0NzN3E2eUhuaDVYeVhVaGQxdWN4?=
 =?utf-8?B?eVIvR2lNOUxucmI0eTlzMm52MWRBaU93OTgwZ0J1M2lrb09yTkszbW5xblVW?=
 =?utf-8?B?ZUVBWkFWTE9tUDZZcVNKak9sNWJacE8xSmFndHJiL3JJRkNadmcxZElmK3JN?=
 =?utf-8?Q?dew07yzMNPSKnEKg1MBg4ss=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a399538-9366-4f80-502d-08d9c0aeaeb5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 16:11:13.9105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVqEJRoHfnVOMQ7s5nKXVEXJ/2Q/mUG+GYmTy26bB5cSTSq4Y46N+tYrXL76lhNG2qgOCMY+0N//H2PZgabMHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7024

On 16.12.2021 16:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The name of arch_mfn_in_directmap() suggests that it will check against
> that the passed MFN should be in the directmap.
> 
> However, the current callers are passing the next MFN and the
> implementation will return true for up to one MFN past the directmap.
> 
> It would be more meaningful to test the exact MFN rather than the
> next one. So rework the implementation and the caller to match the
> name.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
> 
> Looking at the history, it looks like the check in init_node_heap()
> was <= and it was simply moved to a new helper without any adjustment
> as part of c6fdc9696a "boot allocator: use arch helper for virt_to_mfn
> on DIRECTMAP_VIRT region".

Really the original intention was to check the entire range; maybe it
would be better to express this again by ...

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -641,7 +641,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>  {
>      unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>  
> -    return mfn <= (virt_to_mfn(eva - 1) + 1);
> +    return mfn < (virt_to_mfn(eva - 1) + 1);
>  }

... this instead:

static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
{
    unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);

    return mfn + nr <= (virt_to_mfn(eva - 1) + 1);
}

This would allow an arch hook to also go beyond verifying just the last
MFN.

Jan


