Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC64C2F43
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 16:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278376.475597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFtA-0007H3-5H; Thu, 24 Feb 2022 15:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278376.475597; Thu, 24 Feb 2022 15:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFtA-0007Eb-29; Thu, 24 Feb 2022 15:18:40 +0000
Received: by outflank-mailman (input) for mailman id 278376;
 Thu, 24 Feb 2022 15:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNFt9-0007EV-5G
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 15:18:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b07c72-9585-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 16:18:37 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-mmivI7VcOvG3eiIZ9-pZjA-1; Thu, 24 Feb 2022 16:18:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5905.eurprd04.prod.outlook.com (2603:10a6:208:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Thu, 24 Feb
 2022 15:18:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.024; Thu, 24 Feb 2022
 15:18:33 +0000
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
X-Inumbo-ID: 09b07c72-9585-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645715916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7beCHNBUSqMcb2FL3XYvk/0DsVD+l0nbGSQWf8CZ6uQ=;
	b=Dohw2OL4aRJCT4fwQ1pC4phBemw6WXFSh5HoOt0Z6Gt9SbKjfeuPMOsmioSbibLrLxcQD3
	rzZOWaUM9mFNlDI79CcdNM5a3QEdvMuaO/UYzpFfkGbVM7D5l5vBLbLsolNFx6jkXH6VUN
	0ImbWT35XCAOzB9wRuRq8KuEAS8GCHQ=
X-MC-Unique: mmivI7VcOvG3eiIZ9-pZjA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ducSf9fkaRqFtwuCqa1v/sSXXkRBvrRWI7vjWtWcuSvxut+czL97QEGeS82vDyosamAcgmaX62g3dc0mrjTP5Fo0dNwlnyn8JEMFxWvQDmMPMriDRtC7DMjetjZnRQXmzui+sZz5wafjGbHGJaSMHCf2dglO5u7lPR2CuLQ/Q62C8PjHYvIcQT1tXLvk4xuRy1TiORLkMhdpFr7Xr6pIzWw9aE3VEJO8YJkJ4j1C9LW4bqWqdz1pCn25flDK0tRkF7b4cLCQNVf5TpmGKy4Z+mECx6DiLXyNVkYDqbZMZeurOW34FS981J+v8h6Tu+O5/GkbCbqsGDq9Jd/uXvQZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7beCHNBUSqMcb2FL3XYvk/0DsVD+l0nbGSQWf8CZ6uQ=;
 b=BWCJEjmYpD2rY0fASX9It+OU7Jbdki6rYOyqB8nijMZrayys7tHIWlhvPX8ObqpN01/MdErb6uR4bfpNQeUtesK6oQ6endgp7b8h0mGKbIDkg7BcF5T4UQlvZY/WW+NHP3TpoSvZ6uS4grhnpoqVDcebUSwxFZpL7azVcEsblXYafomzpZQKHxME0/eSVuXcm6OyOAar9XZRIAvfF94hwO89NRWHUNeyB84hFsWMqpyjA5iliCo2RUGF4hjRiZif+QpMvBbxVfJITd9SLYPPYa7PsJsYAbAG7OjXsz9S+QD3JBcSwZDR/KB5RfYW4tZpNo20aAlBHHrTCnkGyA3Pjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8f54e83-95c9-04aa-d788-da755e284c42@suse.com>
Date: Thu, 24 Feb 2022 16:18:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/3] xen/vpci: msix: move read/write call to MSI-X PBA
 entry to arch file
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1644937405.git.rahul.singh@arm.com>
 <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3e47316052dce3c85bde04ab6b72ba4f48fa0bb8.1644937405.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0152.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3a0e2ed-ce1b-44c1-bba3-08d9f7a8eb90
X-MS-TrafficTypeDiagnostic: AM0PR04MB5905:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB590594F766EE7DCA929ECE04B33D9@AM0PR04MB5905.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IFyXnlNs0Pd0mF4QI1i2Acs2rN5mfTyZ1qjXwGaKAvX7+ehooSwaMT7mRjC2T1rNE7GtmHwJ+ugjjGfQSofF+0uCvg3TjJQk+LGOeQ6fIMPcs6rbXrQ5f3tLWxcRIdC/EzQ/mchykGOKYMwCS8HU/zo5tEVS+YHUAlex8HRLhgvUdP42IRdwc8uOEY/uJwwCYszcy07R5U4KbFxEhmCTA0k+t14QIrpdY9EFhH1p7M/VTTqVsxTYV0RyrnEIV8SuqMOQlHQoXfMv5HmBucL3U4sm9ugptaDsVYb12K2rCGv4kfgfi62JQCNJizFoqox2MqQImU4QaxoqybWxjALJcNOLCNSC5ZPPmA4mjdEZchXNwAAytRZQbNymW2Aw8ODoszCj52xs6QQxB/+N+b3VWe2BhbjT2kWPLgGWMsKam202qaUMbEBIgSNk2Dnc/hPTN63edB6NVwpue2A+CM72iWsSDECAP6apBoj5qY68s9kzzyWIfA4UshcFoDPrcP/c4w+Lqc6Ott8pG8u4Vk00UuCfS9R05yrjVt4GFXm02VUdiu7e6ZRzsojFNUICzMamvCmwLXR0EveoPIDRxjvPjuyyVjOyQFjlopZe2rpFcVPwWX7IyUFFK4LrFiayXEHHpJ7Wn5cVChMrHSbXPUaXkIvj5OqeHB55TjyBcE9ugv3aG1oC1z2fNojcyjru/CLX5Plg8L+cxOFJfy1nnULZJYO0iA9gMpiBZh6C20t4CcmzOtLjoJxZNlKD3LsuIdtG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(8936002)(26005)(6512007)(6506007)(186003)(508600001)(31696002)(36756003)(110136005)(2616005)(38100700002)(83380400001)(5660300002)(66946007)(2906002)(86362001)(316002)(66476007)(66556008)(53546011)(54906003)(8676002)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGZxNkwrVmhaTWgyd1FYSmxPOXQ2QzFSREFhTVZ0MjMycDdHNVBRNTV4cEta?=
 =?utf-8?B?bm0vUUFnWGFTMXB6SUlJSU9jUEwxbTNuTkRkQTFMMTkyTnpXL0NRRW0wUUVY?=
 =?utf-8?B?aEk2RktYRUF0dUFnK2Z4cDVxK0REbjRGakh4Ky8rdG5RRnZHUVpVZkhUd2JT?=
 =?utf-8?B?dGJxeENGQjlOTUEwWFovdHVEcXY5NEFKclZibWdCalhxYzFZWUNMSWp6bW9l?=
 =?utf-8?B?aWpmam9ibnZHa2xLSjlRNnJQeXVlZjdPaFFoeEQ5bS9hL09OVFgvWlpmZ2Yy?=
 =?utf-8?B?bE1ya3BJTXQzTy9JYVBUWFo2S2RjN0dzQkJwRXl6dlduNnlrMHZqZWdYbXdl?=
 =?utf-8?B?dmpvbXdJVnF2Yko0dXVINVpSYTQ3QmMrZTlaRThUakZWUFk3VDJ2QTRIcDA2?=
 =?utf-8?B?VHZTSE1UUDJSaW5Ta0dvUTVFSXM2UkF5alh2cFpPaVp5aXdvWjkyMnkrcmRS?=
 =?utf-8?B?VGxPcjdZczZJaVhyMWhXWTVvb21DakpINGpPOW9XSnBUS3M2OStNbk9BYmVI?=
 =?utf-8?B?VjBid1lhVmNUclhVRkVzeS9VQXZ4eThkY3k4VlVWdy9FMFp0ZU85WUhELzd5?=
 =?utf-8?B?NGtUVVhab0ZFcE9VaVFLelVUU2RBV04rUG5oQlF0dzRUSCtGTmJrZE9YQU1a?=
 =?utf-8?B?QkoyYXBQUXNRL0hQSkQ3NHlBWVJrRktQUmkxZ0JvME42T2dDVXJzSVVJcjdC?=
 =?utf-8?B?MG93VE9RS2Q1SDdJSHhGeEF0Vm9DMG5QMUFlR0hTNkFXQ3V6Y3ZzRnVLTy8z?=
 =?utf-8?B?bHZwY0I1YWo3eDcrblVVYUpsbFkxTEVWOUdQOUJGVDN3OHRhM3Z4aFA3WjNI?=
 =?utf-8?B?dU9aTkVxSElsQ2pCK0pMdGhjUGovZTZPZzhlQW1KUlFLZHlIbjBoR1pLSUk3?=
 =?utf-8?B?czVrdWdxZDNuaFpOS0hKUm55VHVMRE1wbXROVmlaY2ZLbkdSUzlqL1JTMWVX?=
 =?utf-8?B?UkxQU1hyM2FBQjBEMDBzeG80cTllOVg1ZnY3L054RkhGclRBMk1iQlVxTWVC?=
 =?utf-8?B?T2VZRmhPbERwblVDSTJlVTBKb3Z2aGdjb0pybUY4aGRySkNtREoxNFpvTjhl?=
 =?utf-8?B?T1JJQ0ROaVFHVld2ejR5Y0JHY0VxbDQwSUtQQ0VhSGNMeVcvNFlocmIyVmt5?=
 =?utf-8?B?a0d6enE2VkQ0ZDQyWHVwbzdjNnkzTjFoSTJKV0FjazhjK2R1ek00K2hTSGdw?=
 =?utf-8?B?cFFKVU5sM2czODcyVFBIOUZqNTM4bXdOcm14bGswZHd3UnU1U1N2STcwSlBl?=
 =?utf-8?B?dVRZNVlSZk01RkNzd2JOS0tPeUhpRDlRZ1RBM1FoN3RsbGRscTkyTFQ2N3NB?=
 =?utf-8?B?N2JvbURLVU84R3l4YzhjQ3BvTUpKa2h4eEYrNkpHM1FrRmxqNjlHNVdtNDJU?=
 =?utf-8?B?dWZNakdoTE1jR0YyNHJZWmZXM3ZjbEhSVzhDcU5Eb29xYkhwUGZzdU1SMnoz?=
 =?utf-8?B?cVVENVRrS1doMnJTTDdramtMS3FocG1tSFVBSGhneG9pWnZvd1lQU3o4dmpq?=
 =?utf-8?B?ckNLRmVhaGpCeTRxNnZZUys0VWR0Um55cGk3ZlMrRTMrRS85SUJqTkpRbGFq?=
 =?utf-8?B?ZTNHaFVKZlNvNjFSbWd5ZEIzVFc4VWs5cTFXSkszV3VtVnZFMHZ2eG1MUXdO?=
 =?utf-8?B?NjZNdnBqRDQ3SHRTUDBjVGx6OWtxV1cyYko1aFZSQTB4c0QwTjMyTmRVTzZU?=
 =?utf-8?B?WnRtQktjNU1CeFFsZkgzbGtVanZzY2ZwRXhhOExtMUtSdGsyUUNIcnZ6cXVD?=
 =?utf-8?B?NXBQa21nSFRzVXNRWXdPUWdsMHRVRE5IS1kxOHZhaTNQL3ZsQ2lMT2NyLytm?=
 =?utf-8?B?NTZ0czlNV2lsRnVyWFN5bmxjNUExdDl6b3p5dWEzcHJQV3VDeTNKenpMU2dz?=
 =?utf-8?B?RmlhR2cyRVRDVDY0MTg2aVRqM3pnUDlxWS9pUE1TVUNWSkpsREdpcGRNbERB?=
 =?utf-8?B?UkpXVmFjbVFPUlhTbm1RdCtDSU00K0x4SWNhaWV3M0xlOHFrOEt1SUlTZW41?=
 =?utf-8?B?S01jMzZ0S3AyeVFJUTJXdVFrTm9qV0QyVmdEVDJTTFJOL2ZYRzE3VGdtdkdC?=
 =?utf-8?B?RnpYcmFCM1h3dmVhVS9WaFduWUNyNEtHZW1WOXlmTnE0bkxKUllSYmUvUThD?=
 =?utf-8?B?dWkvL0toZXdpazhkT0FoZmRXR29laC9YWnljQWgrTVQzZnU4bWppMDNuTXZB?=
 =?utf-8?Q?JE21sdW0ROhZdiin0m1gVxY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a0e2ed-ce1b-44c1-bba3-08d9f7a8eb90
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2022 15:18:33.0364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f+hFp8MqJ0qwwKG2vfFoSnUU2jMBPFzjTxgg5HfkDndQHrc/sC+4FGpuy6V3IVGnxtBZHYaNUHyN3hV/xqNPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5905

On 15.02.2022 16:25, Rahul Singh wrote:
> {read,write}{l,q} function argument is different for ARM and x86.
> ARM {read,wrie}(l,q} function argument is pointer whereas X86
> {read,wrie}(l,q} function argument is address itself.

I'm afraid I don't follow: x86 has

#define readl(x) (*(volatile uint32_t *)(x))
#define readq(x) (*(volatile uint64_t *)(x))

That's no different from Arm64:

#define readl(c)                ({ u32 __v = readl_relaxed(c); __iormb(); __v; })

#define readl_relaxed(c)        ({ u32 __v = le32_to_cpu((__force __le32)__raw_readl(c)); __v; })

static inline u32 __raw_readl(const volatile void __iomem *addr)

The difference is whether the address is expressed as a pointer, or
_may_ also be expressed as unsigned long. IOW the x86 variant is
perfectly fine to be passed e.g. a void * (preferably qualified
appropriately). The conversion from unsigned long to a pointer type
is actually expressed ...

> @@ -170,31 +170,7 @@ bool vpci_msix_read(struct vpci_msix *msix, unsigned long addr,
>          return true;
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
> -    {
> -        /*
> -         * Access to PBA.
> -         *
> -         * TODO: note that this relies on having the PBA identity mapped to the
> -         * guest address space. If this changes the address will need to be
> -         * translated.
> -         */
> -        switch ( len )
> -        {
> -        case 4:
> -            *data = readl(addr);
> -            break;
> -
> -        case 8:
> -            *data = readq(addr);
> -            break;
> -
> -        default:
> -            ASSERT_UNREACHABLE();
> -            break;
> -        }

... in the comment ahead of this switch() (and the assumption is likely
wrong for DomU).

But then, Roger: What "identity mapped" is meant here? Surely not GVA ->
GPA, but rather GPA -> HPA? The address here is a guest physical one,
but read{l,q}() act on (host) virtual addresses. This would have been
easier to notice as wrong if read{l,q}() weren't allowing unsigned long
arguments to be passed to them.

Jan


