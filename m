Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF94D53F6EC
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jun 2022 09:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342866.567963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTN8-0008UZ-8n; Tue, 07 Jun 2022 07:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342866.567963; Tue, 07 Jun 2022 07:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyTN8-0008Rg-5K; Tue, 07 Jun 2022 07:11:26 +0000
Received: by outflank-mailman (input) for mailman id 342866;
 Tue, 07 Jun 2022 07:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8rqf=WO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nyTN6-0008Ra-4U
 for xen-devel@lists.xenproject.org; Tue, 07 Jun 2022 07:11:24 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e2af38-e631-11ec-bd2c-47488cf2e6aa;
 Tue, 07 Jun 2022 09:11:23 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2058.outbound.protection.outlook.com [104.47.2.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-AVHZz_0UMPSLB5O7jLAKYA-1; Tue, 07 Jun 2022 09:11:20 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PR3PR04MB7337.eurprd04.prod.outlook.com (2603:10a6:102:81::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Tue, 7 Jun
 2022 07:11:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 07:11:19 +0000
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
X-Inumbo-ID: 08e2af38-e631-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654585881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1m9caj292I9jJ9mors5WTYZu/hAOyMyrDXa4+M9U+Jo=;
	b=OTWnnkl38Y3+m4yNWjawICqX8K3599v3882hmeD4QJ02VSUa9sqbI/LpSWlYV071VYxlsa
	sdkOTsqTxwxyIKXF1yho7Eudn0mmaRFOnOz2c3qlTCKqjGTGT3z5pdFvKIXbG2dGTv9Yg5
	mGsNrpN3XQiYRMW0giy+x7JSaA/4qok=
X-MC-Unique: AVHZz_0UMPSLB5O7jLAKYA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSDWEpTIN6r/uFW8ePl9iAILK6zpXBK2t8UQAWsfvD2ZxG10uLGghs7Ebg1UcxOxYtsay0k13RldGTK7jIcZwnk7dH25RUdpIfW08kQRQHgdLpST+jFK09tN7ubqp6Q4NdgJo2sFNqVzEiex+kJmggI0/vOVWEKVe/xTW6L+k3v6xqy/bIW5yoJTkOWo9Ffy4mq8NL2GnS181JfZdAgGO0lQihTOcZqZ3l+nAbKjJnmKdgW5t3U5kkrmnnrQd5WCkM7o3EorNSDnmooQhXVu9uIGOfvQC+M6Uc4JtvDVr3tMHOmQhzBrua9kmebK/uv5i/U9oTVpEzqHX7sdETiovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1m9caj292I9jJ9mors5WTYZu/hAOyMyrDXa4+M9U+Jo=;
 b=k7nAoP7C2iLnMxpJvOPMMUj8H95ykXQHstyhd/flTRnw+C4T2e5QwGSkCS3f78jcs6bWFAA5ujQ7VLUO6QiPNoy+ewggDSi9dpRqJRVRzNAYwijD46a/kLNRWQmBy98k/hv1+kfcYepG2jlhdTCIcFdFdRT9Ic0ZKYcrDccHwJkeFNJGsZeGZnE7mFdhBDhTr0fdOL/mrv+l/3U03Ca4hCW2p5jqyzWI55a3Ri4wC+p2eQyRuABthUhQb9KryGJEOfhchGSJ29YQs3qW6c74O/VXoZGTeRXULU+dzdyTUR3LSRyAkfTPvKId1VyTLjH5MxMoVHnEEcTVqN0MwgXW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysuse.onmicrosoft.com; s=selector1-mysuse-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1m9caj292I9jJ9mors5WTYZu/hAOyMyrDXa4+M9U+Jo=;
 b=RpgOtTymddfZLvRtykCdz2KW8+i56AIoe0l1x1i0HpS1yvGTrn7Idy3OD2w90hpyJaiQQvcygJPez3n1x8/RTAZx1GChsMBMKAIH3dDhXke/Z3QJqQO7A0Lp/+6pHgB6EKjSzKHTSYN4xTR4gpR8SoXuAabLhfVPJ+HQggrdONKpMntw0Jw8w433p0alj/W3Oy28WtFvZlgugL+8Q3iaVMdYFwNwz/pGk2rFpRXGRs/o2AQtAzgm4A2qorhkWM3vwm7nsXSQiXsrkqVahRMhscKraUDFMqvc1rV1xHcabdmG4t7cJcaDXW/HHFUnhm2T2IOSG6WevcbznV84N5FwbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a48ad48-ad52-1939-fdbf-bf5d0fc1d621@suse.com>
Date: Tue, 7 Jun 2022 09:11:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: memory overcomittment with sr-iov device assighment
Content-Language: en-US
To: alex.nlnnfn@proton.me
References: <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f_bjKs323m5sDcqqvk3uosOLiugoCHlAvJ_tEMTl9d_05VqR-nOKtBBS4QWK29iKmorefG54vrbEgUM40Fl71BPZ0hwVyY3P0LjjJVjO-c=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P191CA0051.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::28) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b79ba2bc-a633-4f59-5a12-08da4854eb8d
X-MS-TrafficTypeDiagnostic: PR3PR04MB7337:EE_
X-Microsoft-Antispam-PRVS:
	<PR3PR04MB733746A4BAD7D6AA5F47B2C5B3A59@PR3PR04MB7337.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0Q4MTzSIABrNbWQKNXjo7kWaTNwyUVn9rrMjiZcGYuH52sg1fF0yBrgWqFrwWTQfQ1AQJKNf75IeiZV1d+ZvVj15/RXyb72zqzHbqFaCkZqPwokCaI88r+ewO6e9h1Oyft35Lt28q7fBoTImlxFpcDxKbZLw8qZaFKnR57khhWI69xe4gCC3F+Y9CLCtr6bdZ0GDEdwJNV7RjPbbnZYWEHdkYpRhoHA/JjiP0w9iTskD54hpXhquqpZx0anJW6vk8xFBvb4jtKr62dHJ1B2WKaH6GhcqimadMzrvIrbUtH7x8Vx2Vo/pKBvoxCmP8kw7KJgx/lkqnl46eU6gfcg0iLKdDWT5x6EpqH7cAyj0w4+2X5kbuoMxAyrGgw5nGqdHLzL3jbWi+0gfz/YnF1VklygcMx0MDr/5Mv50nnSZzk0eiAt/rCU48KKoT+O/65RSu0uM4ZM5rLAwtvFig4pztZmYQTInLXqzeSuv0dV1EdsmBqTmp87rJaIJWptzCt5RwSR6ncvLty0uLaUVglaE/gcj28xEM0MZFac1Hy7es8Hg8xmORD3w4tsjsRgFabj6dg1kZQMw3i1Lti2O26AJx4Qyz32jWnNMpOlnWSP8RtL8XgoFxGHaCfSxZ9ntwdr+Y/dHNtXbPylq4HOiZcgtcOg0/NSg2FoGqUZI0ONf/sqsuOkL8mps6IOBn44ndT9vheh57ua2WySgLUDzUJa2o+DpgFbQMS1VzZxWQtyhtq8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(316002)(6916009)(66556008)(66476007)(8676002)(6666004)(66946007)(186003)(2616005)(4326008)(6506007)(53546011)(6512007)(86362001)(26005)(4744005)(2906002)(6486002)(508600001)(38100700002)(5660300002)(8936002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S05vN0lWZWtoVldVbWthZjk0RUJabnhTa3pXY0k0a3BMSVNYTTBDMzlQc0ZL?=
 =?utf-8?B?VUNveWpvK05LcVpXd3IzMGl4UGE2QXlyVWdHaHlBc25iamMyaXZzUlNKVXdR?=
 =?utf-8?B?V2pGekkvSUxSdjZrSXVaVDZJdFlpTzZmcnkrbU53TVJFbW1wOTBycm8xVFhj?=
 =?utf-8?B?YkxCc0RaQ3RUQXRFUmM2d2NSd1ppblpsL2VZWlJWUjc5MTErVFVoNWJtQlN2?=
 =?utf-8?B?cm9oWUt2YmRDQVQxWHkyQW5raStvR3FMajV4dm0wRDNsYW90c1BYZFRmZWpr?=
 =?utf-8?B?aHppb0hjcHNGU2ZHc0cxTWg4MytMVVdTY3FxcElGZytjRGlmRjgrVTA4M0FN?=
 =?utf-8?B?Q0R2V1ZrYk9tcUk3S1MrcGNZODloL1VSbFdlMW51UUkwTmlQQlo0akMyNUtv?=
 =?utf-8?B?WDBsU2s3aFV1N3BkdTVLaWdCZ0xiMkpzWlBTb0RlbWNrZU5GT2pJUGNUSHF4?=
 =?utf-8?B?bGdQRE5vYjVTOGhZNitFTXBTUTFPUDE2eUNCbHdNWUh6L0EvelR0TmJhM0tq?=
 =?utf-8?B?N0dSbTdwTjRJRzdVYzVvM3dhQ1F6K1dnYmdNVkZ2bHh0aHRyVHB5NFVienI5?=
 =?utf-8?B?dEVsZ2xGYjJhVTZlaEdKM1hoY3FXOW1TOFc3WDVabm1iWTg0dyt1cDkxalpH?=
 =?utf-8?B?U0NBcXFhQWp5Ylg3NnRuUW9OdU5vSlVYUWM5cXMzZFZXNHU1d1pUQnR3Mytx?=
 =?utf-8?B?dXIxeGRwdUNaaE8yVWRaZEFBV05sQy9oelFwREczb213OURJSDhFZmFucjhO?=
 =?utf-8?B?WlkwSmZ0T2ZpZ2dtL3BOK1kzUkQrZzlqM2VrcWdoQzY2YUs1cXhaeXBjbHZS?=
 =?utf-8?B?OFhzeVBZbzkra2dyMnVBZCtpS1pUVHdwdzJTOGJiUGFPYWNTNDduK2o5OHZ6?=
 =?utf-8?B?SnY3dHgyM0I4cUU1dTExdzBETWl2U1JmYXNmYzR6QTlEN1ZESVZyUFdDT1Y1?=
 =?utf-8?B?WW1tbmJhTVQ4d2FZNi9BVG1CMERvRkZ2czB6dW43T0Y2ZXIxbVordXE0Nnpn?=
 =?utf-8?B?bXJEOFFNR2hmY0xWSWNxN04xVzUxVTFIODVhbXFYUE8xaGRaU1RKVVVUU0do?=
 =?utf-8?B?TUN3V3FraTBvcUJwdEsxdm0vdk9HWUI3WTQ2dlNXZHNKUFVFRFNWL3pndzBa?=
 =?utf-8?B?QkZUdmZBTTZOSmk1d3o1S05KNE90K2JJb2RWMlVkdlVCZExoQkI2SWkwNC9k?=
 =?utf-8?B?NjBJMEQ3L1lnWU1ZQVRNUEJpMCs4aEJ3M0JVQW1tMG5SZktFWlRjM1JNSjJr?=
 =?utf-8?B?ekQzWEp2TTBsdHNXaGFSbzJFNWwxWTMwc3ZVV0hGQ0FoYU1NaTRNVmZySTAr?=
 =?utf-8?B?bmt6VGtvd2tra0wvcTRUYWlYNGY0R29sQmdhOVQ0eXlXSTJOaDlhaXZDR3NS?=
 =?utf-8?B?ZXhJYmtwNGpsYlg1SDZxdnRkdkl0MnU4OG9OL0ZncndSWVhDUHVseWhHWCtL?=
 =?utf-8?B?Z1ZmSENPOEJQSTU3YnJCMzNUbGYwQ1VScGRkMUVmTnRCV1JscFFvdnRleU1r?=
 =?utf-8?B?ckhXUGgyQXBLbzQ4WGJ3SjdUTWxvK1F4OHRoOTB1L3BVL2RqSGRKRWEvYWpW?=
 =?utf-8?B?cXYyRDJBNnhrVTh6eXRLamtUd01VMzJzdGFqNjVrODUvZlVEMzQwa1pXMzli?=
 =?utf-8?B?T2NqWDlEK2JGSkg5Z3FtNmtNeTlEcmxKMjV2Q3AxT1dsRU1sdE02UXFHRDVC?=
 =?utf-8?B?VERiUVNsMlR6S2pEcW9IOTQ0ajhtalB4cktmT1hNbzdTbENSWmlzQ0FKUVlM?=
 =?utf-8?B?R21HdWxjUVBlVzM0a2ZFRFFsbVhaYTFGaysvNlFYM2dIc1FLTU1vVkRHMkVT?=
 =?utf-8?B?dVdOVUZiRWlKR1hrUzJQMVdyNHRYMVVoZmNWYTVLc25JVWhCUDlZQk9JNkwv?=
 =?utf-8?B?NmxvOEFPdG9FRExnK29BNHQ0N3ZVcDFoVHoySG0xSEFXMnlhTFR6OGJHUXkx?=
 =?utf-8?B?SkUySTZhRjY5Tmttb09zOVdodmcxQlNheTNtMlc5ZGh6ejhybmxYL3dZMFJx?=
 =?utf-8?B?bzFLQmZwdU5rZGcxejRGSkZWdmZ1YzNjNHhKS2w0ZFNYTzVGbDB5VjdZRTdn?=
 =?utf-8?B?Y1ZheXh4bmYxZlJEcTVMOFI0SmN0VTViSFdYd3ZiZkdKcE9QRm9WQ0Jjcjlh?=
 =?utf-8?B?RElmNGMwNlN4MzdHS251TjRiMUVHU3NTcWp0TW5saWNaVDNYc0ZGaFFHSDA3?=
 =?utf-8?B?TG9mSHNPNEpnSTA1VjlES3QxZ0FFZUgvRkhnelQ1bndYbzN1eXc1ZnIzalAw?=
 =?utf-8?B?c3RYS3RmZzlJTGF5WWxta0RuV3ZRbWw5YlUyTEZrcllvZFl0TWw5OERlelBV?=
 =?utf-8?B?a3dvTEpoSVVYVUMyUHRST0hleEMzeWFVdTc2TXlmUDZ0emFXaGJ2UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79ba2bc-a633-4f59-5a12-08da4854eb8d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 07:11:19.3802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjy/bBODfnvpsklsXVk3n8SUcTofJrlqlCogrIK9uU+eyiosZLif+ZdPP6Xl0KDRdgFh5Lyol0mnjVWUSiEGIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7337

On 07.06.2022 05:59, alex.nlnnfn@proton.me wrote:
> I looked into Xen documentation and also Xen wiki and I could't find a definitive answer if Xen supports memory over-commitment when VMs use SR-IOV device assignment (passthrough). Memory over-commitment I mean giving VMs more RAM than is available in the host.
> 
> I know that ESX doesn't support it, and also QEMU/KVM pins all RAM when a device is directly assigned to a VM (VFIO_IOMMU_MAP_DMA ioctl). I have two questions:
> 
> 1. Does Xen supports memory over commitment when all VMs are using direct device assignment e.g., SR-IOV?

What you describe looks to match mem-paging / mem-sharing in Xen. Neither is
compatible with device pass-through (SR-IOV or not is irrelevant), and both
are only in "experimental" state anyway.

> 2. Would you please point me to the code that does the pinning?

That's a KVM concept with no direct equivalent in Xen (largely due to Xen
being a type-1 hypervisor, while KVM is a type-2 one).

Jan


