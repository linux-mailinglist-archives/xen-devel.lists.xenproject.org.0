Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5A6280FDD
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:30:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1758.5380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHNx-0005dX-Rd; Fri, 02 Oct 2020 09:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1758.5380; Fri, 02 Oct 2020 09:29:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHNx-0005d8-OD; Fri, 02 Oct 2020 09:29:53 +0000
Received: by outflank-mailman (input) for mailman id 1758;
 Fri, 02 Oct 2020 09:29:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
 id 1kOHNw-0005d3-RU
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:29:53 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85e17d85-0b90-4cc2-9134-82d0f845b8ea;
 Fri, 02 Oct 2020 09:29:50 +0000 (UTC)
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 09:29:48 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:29:48 +0000
Received: from [192.168.1.106] (86.123.62.1) by
 AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.38 via Frontend Transport; Fri, 2 Oct 2020 09:29:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jYI3=DJ=nxp.com=laurentiu.tudor@srs-us1.protection.inumbo.net>)
	id 1kOHNw-0005d3-RU
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:29:53 +0000
X-Inumbo-ID: 85e17d85-0b90-4cc2-9134-82d0f845b8ea
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown [40.107.2.45])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 85e17d85-0b90-4cc2-9134-82d0f845b8ea;
	Fri, 02 Oct 2020 09:29:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBquCoP/E0UeVVc/d07eVsdJjZ+vfGwYCdrySGIgbYyhXRMiV/aT9vFWf6I2qexaFIMxkvHDlyCFX6xUxEOEN3xMaVBV4fT/SFbJaBCyMyUi4oJYTdsQas5xmk4n+hJomIkC0xopA0RKLfORgUPXQ5NVooAtypO1qFX63lOb+zj8hsruvdURjBrwhTXxnKldpg9alOV56FTrtVlkLN0d70jhdvll7GOys3UtlWEfGVBlEfoiC7EkLq5s4oxkHa6vATodGzNdZ32PaNopFdqaLj1qkdg6R/HCgcxu9zwS2xDu3WRvcrRP6Nv3ckIA45XbKJFkLCx1n8/LK3k6AZKyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42yWuh+1D2zPjR2QTr3Esq8M8tYvM4goIZALn7eda6I=;
 b=gNjMFPduUyapxEMYuR1HP2FrvpM0FmOPCxqMIohk5T/rBhezG2t3URF7oRgb0M76tiQzcKxt1G36oj25Lx9N0usUb5nxA4VRkZFMdJR7Ex8yRiW9hqZVSVTKO8YeDv1uEemDPsBgWLGntleG7OPfcj6nMosFoF8/sTM99Bezunta8aMlS8hnitpSgxhFAkJ4q8g1r++uiP+Z7ecIEr9qKjEwA8Be3rg1Ttjs3qZk/8X+p+pKQWsAFDXei3g8S+5VwPMItMUNEf1I+tOEZfDesCpGavJAxnlGi1TwRLjkdyqwqrPzcOnwKSZ7lDsRzvPMV/0ixR8d/An5bN+zVfwSgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42yWuh+1D2zPjR2QTr3Esq8M8tYvM4goIZALn7eda6I=;
 b=h5ScrgWoXLOiddUG9sP0ulXcQ/KmFxz60DxJ89YvikudB5vSQ97NyBU/EnCXkzgJYeAwOZAzQXd42rTwJGZ7nP39qgfpVE1wOZ1xlojrUKQV9bfET7bLLEzbemE6vhInBUm/khqWYK+XXPPjUyeqp2Nv2/cKlFJwueCwFt4cuwc=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26)
 by VI1PR04MB6144.eurprd04.prod.outlook.com (2603:10a6:803:fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Fri, 2 Oct
 2020 09:29:48 +0000
Received: from VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b]) by VI1PR0402MB3405.eurprd04.prod.outlook.com
 ([fe80::f960:c16d:16a5:6e7b%7]) with mapi id 15.20.3412.029; Fri, 2 Oct 2020
 09:29:48 +0000
Subject: Re: [PATCH] arm,smmu: match start level of page table walk with P2M
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 will@kernel.org, diana.craciun@nxp.com, anda-alexandra.dorneanu@nxp.com
References: <20200928135157.3170-1-laurentiu.tudor@nxp.com>
 <alpine.DEB.2.21.2010011647020.10908@sstabellini-ThinkPad-T480s>
 <41f7c87b-0db9-5366-b25f-775bf3d6e3ce@xen.org>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <625c1142-ae1c-7374-5e77-ab52eb2c326e@nxp.com>
Date: Fri, 2 Oct 2020 12:29:44 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <41f7c87b-0db9-5366-b25f-775bf3d6e3ce@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0P190CA0007.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::17) To VI1PR0402MB3405.eurprd04.prod.outlook.com
 (2603:10a6:803:3::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.106] (86.123.62.1) by AM0P190CA0007.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38 via Frontend Transport; Fri, 2 Oct 2020 09:29:47 +0000
X-Originating-IP: [86.123.62.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fbd0728b-1709-48f4-148f-08d866b5b4b3
X-MS-TrafficTypeDiagnostic: VI1PR04MB6144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6144AFB6DA5B78821E903078EC310@VI1PR04MB6144.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	luqWZyU7lLj0unIOp/Up5BJ4jK8KSWSLMLqnnaeVC/ImVZVu7qU+e0Yo/wpZIYfqCTxt2K/4DghnloEfX8Q7kdG47ZiEtC/lwyTf8UShG1+75r27oDljmiEWY7m5G3k0M2eTK4iELGbvljoyhILpdF4WtIl1jj/rwlBO1vJZw4Ol7RcIvQ6HKq8SmhsqH9gOj5rXKj6ZLuE7D5riRpDJeQx841GnE2uoUDgVZQZY0/LBHDoy1IQr/cO8U5z1Zp/uQXXXIAqAtL7tALweIW4/KkRPLBoGmQHxHEfKtlbLzc1IIbFojKeg8Jhe2Xu1/WctOflKIRXA+iCwZR85H6+GLjI2jXL6llwcabQ34oZHA3SbGj6CajVOafTY8I0iy7C/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3405.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(8676002)(53546011)(31696002)(66476007)(8936002)(44832011)(186003)(86362001)(16576012)(316002)(478600001)(36756003)(110136005)(66946007)(31686004)(6486002)(52116002)(66556008)(956004)(2616005)(4326008)(5660300002)(6666004)(83380400001)(2906002)(26005)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	3nBY67g+2nqr2GhHHY008zr1cn4nTNAl51sOTqb1YtbyxHo0yKOlmw2TGqy31iHuEPkry5QnswSMKagnN5x7s2CQP1JiRJtDoM3cwUkPXGvS1a7+ew2rBme4rX0Ytluas7vHk/QbDpZMgvwEQpAxzbPm1juzjPUkAGGIjYYUbkdXI1aFVOTntkWtIu0R4IfILcYMzOQ421jNdiLQVv96TT3mHLrUIFcvIWmNPL4Srk8sTktg4GZPs07/0xW5KD98+MSA/QkBWj1zm0ora/zmmcNqcnuHCoTRWRkvEDrDUCYWWXw0cDxIiFQV57FZ7zwQdG30BACwrLXE1aZYIYzziT0qpn2KgFmYlC3jbPocLbNBh7mcVvgqPiA4aQ1leyMuLeDftiJ6jDMrr6iinv7zZmaRfMHdQAoTMp3Gw/uiGE5CJ+g3VjiUNhJ9n+CfsdMLtbe/BWXhQE4Id50Rm3VYttqqPuydhv5wqmcYFywReRHRoZu6CSXh/GDvH8sc5yArnHBfI5Qf4UFxEJlya6ZodpjiNJUVkLCJgXZNK4BtjZAPX3soHsX/MWxS2CZt+3OWmKE3hxyxuPxDNTtpdiRCE8ns7KmqaTJWP1XbuebLj5UrbBY3WMpDYbPVN9saSpYTkaT9erSOBssHSjC33zBhNA==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd0728b-1709-48f4-148f-08d866b5b4b3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3405.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 09:29:48.2822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJLElOfjmv+7fs4Vdpu7DiDYKxcVKvOBBb8rVgY6wkttquwhG+AeSKPaZzjoqz/VQ8wEobPAurRTe0lr9W3CFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6144



On 10/2/2020 11:18 AM, Julien Grall wrote:
> Hi,
> 
> On 02/10/2020 00:52, Stefano Stabellini wrote:
>> On Mon, 28 Sep 2020, laurentiu.tudor@nxp.com wrote:
>>> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>>
>>> Don't hardcode the lookup start level of the page table walk to 1
>>> and instead match the one used in P2M. This should fix scenarios
>>> involving SMMU where the start level is different than 1.
>>>
>>> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
>>
>> Thank you for the patch, I think it is correct, except that smmu.c today
>> can be enabled even on arm32 builds, where p2m_root_level would be
>> uninitialized.
>>
>> We need to initialize p2m_root_level at the beginning of
>> setup_virt_paging under the #ifdef CONFIG_ARM_32. We can statically
>> initialize it to 1 in that case. Or...
>>
>>
>>> ---
>>>   xen/arch/arm/p2m.c                 | 2 +-
>>>   xen/drivers/passthrough/arm/smmu.c | 2 +-
>>>   xen/include/asm-arm/p2m.h          | 1 +
>>>   3 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index ce59f2b503..0181b09dc0 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -18,7 +18,6 @@
>>>     #ifdef CONFIG_ARM_64
>>>   static unsigned int __read_mostly p2m_root_order;
>>> -static unsigned int __read_mostly p2m_root_level;
>>>   #define P2M_ROOT_ORDER    p2m_root_order
>>>   #define P2M_ROOT_LEVEL p2m_root_level
>>>   static unsigned int __read_mostly max_vmid = MAX_VMID_8_BIT;
>>> @@ -39,6 +38,7 @@ static unsigned int __read_mostly max_vmid =
>>> MAX_VMID_8_BIT;
>>>    * restricted by external entity (e.g. IOMMU).
>>>    */
>>>   unsigned int __read_mostly p2m_ipa_bits = 64;
>>> +unsigned int __read_mostly p2m_root_level;
>>
>> ... we could p2m_root_level = 1; here
> 
> IMHO, this is going to make the code quite confusing given that only the
> SMMU would use this variable for arm32.
> 
> The P2M root level also cannot be changed by the SMMU (at least for
> now). So I would suggest to introduce a helper (maybe
> p2m_get_root_level()) and use it in the SMMU code.
> 
> An alternative would be to move the definition of P2M_ROOT_{ORDER,
> LEVEL} in p2m.h

Alright, I'll go with this second option if that's ok with you.

---
Thanks & Best Regards, Laurentiu

