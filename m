Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F98473FB2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 10:41:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246530.425176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4JW-0004mI-Ju; Tue, 14 Dec 2021 09:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246530.425176; Tue, 14 Dec 2021 09:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx4JW-0004kO-G1; Tue, 14 Dec 2021 09:41:38 +0000
Received: by outflank-mailman (input) for mailman id 246530;
 Tue, 14 Dec 2021 09:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pVj/=Q7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mx4JV-0004Gz-Mb
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 09:41:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d4b1d84-5cc1-11ec-85d3-df6b77346a89;
 Tue, 14 Dec 2021 10:35:30 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-Xp6fDrIBMA6E7g81rcuBMg-2; Tue, 14 Dec 2021 10:41:35 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3936.eurprd04.prod.outlook.com (2603:10a6:803:23::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Tue, 14 Dec
 2021 09:41:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 09:41:32 +0000
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
X-Inumbo-ID: 2d4b1d84-5cc1-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639474896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6Fc1grdlexpszAPWZbZ1T/t6DpZ80ZnT6ApIGLSZVw=;
	b=jYecUeRO2PyPw1f0gChoUSCm5tMx3iP0O5vNbE2Ir30s7s45TerlUAL1OLtCYQ9wQHxb8D
	aZ+X7DH3fEWDHyR5GSsYqO/0bjhO6xZzs4MHkzYbenbUCPVJI4WXYtYyMpbVPQp/KCyF/Q
	Vj/JctMWCCNwdSxTQq3aYpbIbcZsAUI=
X-MC-Unique: Xp6fDrIBMA6E7g81rcuBMg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRvSVeIfPkJyfwFMS+SxRQ59GA418Ztax2UkZvHLg3RrYkjmOgixj0ordOA4REr9npGWK9q8Rkd49pZ+MGl0XnOQoZtM+Jf0OM8sK/IPTCI1V5hToa2xa6Q1WJnaodQ+OsxFMwZ2HR66TDy8NHM2hVHKO7nXKwJWhITEOS68EgAwyNUkJmDnoy8XQ4JYF7IQi5e7FrK4N23j7v4rb0DVxZti1MgkmS6axym/cXbNWZgwAjI1uQ9KICT0edBREBfVv08hZAMCZ/aEdf13BBBEWh3UqMqZgLHEtsxQ8CpxWk2ckPnEEsdnmbF7DIaef/262iIbMvGPzb4mNyBBM4x0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Fc1grdlexpszAPWZbZ1T/t6DpZ80ZnT6ApIGLSZVw=;
 b=m5ZgAjOlHsi//DlpMxnCb2kl/nGfqh3ZLYutXo2MvPVDy9Y9TVzTyshKYZOLckA8QRksg+NpSUZvoe9WvrZ+wu1EQLgJrUCZPrHoGOeG0u+oRiaL0F3BVCW1eidD4aTS+G1MNh1bK/6cZhQDQiramfcLPHMM3t7iVSxtkN1NqzNsftsscNBaP+evOg4ovK9GTIdjEgIDxA+xMUjBz292zMoMvD+em5ZyYcg6QNHONZpGc/19wG8VPcMonZHxSNwKBl+VtgLsyPDqFYakBATQxV030TIKfMX6fCXEMZ7ClhZsYcuYZPkfO5gaLw8fHHJGatgFr+i829pruLicjHt4tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
Date: Tue, 14 Dec 2021 10:41:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Content-Language: en-US
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4469cdf05051bd691a8adff2657d27f6a5f0cefb.1639472078.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0021.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ce78517-3788-4734-7f5e-08d9bee5e99c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3936:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB39367176838827FF278EE787B3759@VI1PR0402MB3936.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ji8GnNZzuIigUJOBoAvVkp3d+RfW6sJ5bpE91m6osU3Nv1rMmZQxv0WOSAjXobVidJCyybI1kJ+U9NhYtEi1roaB+YP+OZkMMcpt+Rih1U3p/+SqpYpqUa7hLSf6cQL0yM8REYLpFmmFetAFm9qVJ4pV9FA8zFHWbFt2EMyGPn7fuZJcfd8w6B2iUF7a4Ws5XbQVtctJxju3oO97Xhb/Dna7W5MEL95/fISmrjFS5IuXEa6aOQaU1B6Of74bPLxWjrYdSjfBFys0oMZodf9IiYZZRdENHBnZJIzT8Te3AfWKBP/8kfwzp2C6Dq3koAFXnuZS+trazi9r/VJfWMPf6n+raeqKudxNqZvYpPlAZYk/KGdzeALSiNkykf08zxkxNmGbliGoaFRQb5t/+1f2LaBp5PgMCB5CA3H3R5OP+QgL499c4ywVPtS44X74mi5NF8lHJGllNbkXjBQoJDzax3TQLCAZL5+lMEBxOrOqrLxsuTnrngYLdJJoBbKwthNiZE8NJsCoi8rk1LmBneqAGVVNKX1GQ9zZy+6B9cBMXMVZo+GK2Bm5EjRQLR7A/T6NCEh7MdZuCO06fs5gOQzZz7H9damGEP9bygCdhPwLSi5+iYUYfloczlO/NS/qSSZvAM3XHpaqOsfZvBEYlvG1b4x0MGKgf7akOoVApA+jQxtSTauoQlYRwoa2i/gXRtgzG/aM7JDAcHBv5yQflpMEVbkpWzR9YWfjSzLA+TGPn8Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(7416002)(31696002)(4326008)(8936002)(83380400001)(6916009)(2906002)(5660300002)(6486002)(316002)(38100700002)(8676002)(54906003)(66946007)(4744005)(186003)(26005)(36756003)(6506007)(53546011)(66556008)(31686004)(86362001)(6512007)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXlkTlFwRGFOdzlEaU9aQmwrcU5TL3VDS1grNUZtVlcxTHB6aW5WMUJCNzlO?=
 =?utf-8?B?Yk9TcUxqWUNtck1iUDVPVEdnajNvejN1WmE3QXlkZ0RHWmtaSUpHcXhwS0Ru?=
 =?utf-8?B?Z3I4WDFFOSs1Y2VIUUlFVDhyVHNKSm5iUll1RHoyN0gxVENGRFpSeHBSeXpa?=
 =?utf-8?B?U21YbDhxR3FhZlE0MWVFbWRGNzRwU3RVRG9WQkpsNGt3aXF2MDZOdXdoUVpu?=
 =?utf-8?B?cGIvM2c2MXMreGczZkxEVk56dUNpTGUvTFNPcW1DblgvZ2RKeHJBTzJEbG5Y?=
 =?utf-8?B?c1huTlJBQjkxQmpnb3ZPdi9aQTNMTDBRbFNwRElKTVR6aWhzSEEzTFZkMVJr?=
 =?utf-8?B?eVZqSWRGM2x4UzdXVnpwaDV6TTNSTTFtelJRdDFtaTVJdDl1Nnh4bXd0blpE?=
 =?utf-8?B?OHcxVDJxZEVUajFHRThjRG5wTkZWSEt0WnMzSTBRc3kzWERPQU1OMzhtVE0x?=
 =?utf-8?B?UkZ0Tk1MVnlFbDBXaWFJL20yOW1iZHNhMTZXZkV4RUlJVlRIOUN2UW9nSHBL?=
 =?utf-8?B?eEpkbS9mMUt2NHFRSjROV3ViaHBxakR2NU1FNCs1b0ErVjJNUlNYTUhCd0tJ?=
 =?utf-8?B?dGxhUzV1TGZ2d09ZTUl2dmFhN1Bwb2g3cUMzRWdJTmllbTFPU2lXMEJKMlB3?=
 =?utf-8?B?MEQ3UHp2MXRWTm1FSDZWenFzc1BRbHR0dFZvdkpWNFg3clArYUVMOHRkKzhu?=
 =?utf-8?B?U0xqNy91b0JIeVRMWER2TnhvcEpaOVpIakplSlNtWkN2a2tTcGU0K2x3MTVJ?=
 =?utf-8?B?VkQ1bnRUZVVRZmdYbHNVbGIrcERkZVJGSkQ2S3oxaUFGWjFkUml1V0tHQ1ZM?=
 =?utf-8?B?K3VJOHpucHNzZEpvNlNjRm9SenAva2cyMm1pTlVCaTBOcklXZW9kNytsRjlp?=
 =?utf-8?B?Q1ZEL2VkWUxFblg3aXh1NGxuYjN4YXhkL0UyMVdZSFRQNGhMMXAvSFBCYWxE?=
 =?utf-8?B?QXUxaWpwK1BoV3NzZWhBU2grRGlRQUJ5ZzFMbTYyTWd4dVdNYjhDb0N6VFFD?=
 =?utf-8?B?VnVxRlVvMUVwY05MdFFBS3IxOHRaU2ZZTytzWlZjSlM5bStwdVJwRGNaNUtR?=
 =?utf-8?B?N05WWXFoWFFFd2FjTEhsdi9vSXU0OXRkNlZvRzRWbWVXNEdzZnd6Tk5Jc0xw?=
 =?utf-8?B?Q3ROY2dOYnRWWi9CeVE4YXJOZEY3b1VudW1JSGQ5aUoydk51QWhVMC9Xa3dQ?=
 =?utf-8?B?RFRIdE8xSWtNYjJ6TnRqZUh4aElNaXcrdG5JV3VFRk9YZmZOcG1FOTdsTFFz?=
 =?utf-8?B?T1hPM1d4NXA4WnJqRW9Yd2x3STBOQno0QTZ2ZkxoV2NZaVNBQ2tGWGJnekZP?=
 =?utf-8?B?RzRXakVuZENTS05nMG51amZ6ZzhvM2hUTDM3VkY5ZFhLcjJXMXN6akh5clU5?=
 =?utf-8?B?M1pJTklKam1GNE5KOVlIUWZreW9jdW5MNFBYeDZpcU5ZOEVqVU1OSVhDYU1M?=
 =?utf-8?B?alJwenpvOEd5aGVFd0Z6Nk4wSFlGRC9iNHFsTVFFalJBQWVLMEtYNE4yOWpt?=
 =?utf-8?B?YnZuY3pYeTJ0VXh3d2d3L3EzMThOQWpONDNISGswMmxhaGpBcmJrTDJPTHJj?=
 =?utf-8?B?V243dGgwNmhIaEtiSnpucERjQXQzWnBPYmh0d1VhdmV1ci9ONzZna0ZEb0xS?=
 =?utf-8?B?bTNaTDZIaEhVVGM1UE5RdEdKRWY1QzZoaVovSnFLZ1hxbWZxeGJ1T2xDWm1n?=
 =?utf-8?B?VTFldkRtRUVXb0Y0QWlHWWxJZ1JVV1UrblpRMGp2OEUwajRNWFZOSjUwVmp2?=
 =?utf-8?B?SHUybXZabWJmRG5IdGZ2Mjl5WmRubVVHT0NXaWw1V1VvSG1qc2xleHBlbmFq?=
 =?utf-8?B?VWhSdHd4SXhOT0FuOWRGYlNSK203dTdrODViZnErR0xSdFRaeHRvYjYyRGd1?=
 =?utf-8?B?OXQ4ak5GbE5wZDJ0eitTUU8yeFhCOUFBbXZHa3ZZS3VaWjAwbjlxc2NBelNn?=
 =?utf-8?B?NmFwc3hXVmY5bXh3YmFzOWN1b1pGM3kyZ3JhQ2RsSlRFblBFeUNWNUozZm1F?=
 =?utf-8?B?cTVwSGhMZHl3K1dpU2V3R29iMFREV0VZTHVRZVdxeEVCQzRwWUQ0RUVxaHV1?=
 =?utf-8?B?SHpxd1oxNFNrU2ZYbnFHeWVRNStBUUE0aXQydUxCQ2dHdFhuNjdlbmllM3ZV?=
 =?utf-8?B?VVk3OGdzem5IQ1hhZDNTZ3pjN3NnRnlkL1VPZUNxQXZjTHNOSXJTamtReUtr?=
 =?utf-8?Q?u4Fv02oFzfurxFFJ3E4K+xU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce78517-3788-4734-7f5e-08d9bee5e99c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 09:41:32.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZPsZhPRrtFv0Gk8Joe/Dxcj1ArGCRUENW0fk+ENEFpgEBDwGp7LlQJddIpfsAyHY8Q9HJZirAyAxA8KFkwTt4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3936

On 14.12.2021 10:34, Oleksii Moisieiev wrote:
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
>  #define XEN_DOMCTL_vmtrace_get_option         5
>  #define XEN_DOMCTL_vmtrace_set_option         6
>  };
> +
> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
> +struct xen_domctl_sci_device_op {
> +    uint32_t size; /* Length of the path */
> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
> +};

This being - aiui - Arm-only, please enclose it by respective #if,
just like we do for certain x86-only ops.

I'm further afraid the term "SCI" is ambiguous with ACPI's System
Control Interrupt, so there's some further tag needed in the names
used here.

Finally please make padding explicit and check that it's zero on
input.

Jan


