Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE149494D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 09:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258988.446586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nASgF-0005wU-Ct; Thu, 20 Jan 2022 08:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258988.446586; Thu, 20 Jan 2022 08:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nASgF-0005sy-9X; Thu, 20 Jan 2022 08:20:27 +0000
Received: by outflank-mailman (input) for mailman id 258988;
 Thu, 20 Jan 2022 08:20:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YGoM=SE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nASgD-0005ss-II
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 08:20:25 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0effeb5-79c9-11ec-8fa7-f31e035a9116;
 Thu, 20 Jan 2022 09:20:24 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-6-1HQw7YFVOaO7c-LBcwPFtA-1; Thu, 20 Jan 2022 09:20:22 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6480.eurprd04.prod.outlook.com (2603:10a6:803:11d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Thu, 20 Jan
 2022 08:20:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4909.010; Thu, 20 Jan 2022
 08:20:21 +0000
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
X-Inumbo-ID: d0effeb5-79c9-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642666824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CW5edXKsYj6Jy3FFLIJTcNmSAo0W82FFljm293DnGD0=;
	b=kgqUtA2NNbRnuTO7S9D7HHHTjrYVKu3kOQSSteEzwqEx33WiTWubYpGe+n7Ncn7GRSkioP
	FG5kc9EPghxB/smmW+enWKpjm/5NvQcve0ERM7tIQrBFFl8X+BXJ5Sj8wnqn7GPNvoLBts
	6Mb7MiWVwm7SQO61HshyMy1HE4pVcCE=
X-MC-Unique: 1HQw7YFVOaO7c-LBcwPFtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eo2b1AH7EuDTX5CKlFl/+uo4zFU9X5X1/SB8qGwXKLGPZjeSD6YWF6sQpDyfCoooitbD63UTn7y+MH2dETV5gBobbJVJTnKB+YdC601f6R0LGB25kJhRjVoAraw4xrrAxF6ejR9UylDFDYT4Roll94rkVPailpsW86S7Pl+fZC+q567yPgsA2Sxq1PBV7HvIGVr24rN15pwzpgdC3G9M1yw/Oy/xYNrhaKkavg8vGlZbvuytm8GnL5FMaTPe4u6uWFZTfkJ33AHRLgheT5sFVUBxTtSmDp6slczmq+cA7GMmF/7bKV3n8pW/Ee2sc731/rANplnMCszfIHUQ1hpEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVIK3q3Oud0kz3uUhJVhqPyT6WLzLJHxvBedrAC3yy4=;
 b=bdzy2Acj+efynAkpJTZPwsBHu6PLh5Z1zZJbMOwmuKdhipUDWFVyi2YlPzoEdMwLZkPgm91wxIyEbxrKcLPpcY2TfF8KfwVMZmaJZ7db30M+4YuqXgOCukxOKL9tbf2/qByR02+1HXVk9YfZZDGGQw0Rcj4W36mQxZnuqLXwu0GABRv8rcH5uNRPsq5zo955/WDsHdb+lsYF6UxkxSA+T40Pjn50YuSU0jgOuvBZN58uS/CN4JIB7DB0/W1PdsIvLCiMiokD+5IAtL30tVWiAc6tKAyjK9zNa3CTFPhddx569V1PT8LEIkJABUShEaEjlU1lA78Ih743KTztEhJyuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0323edc1-338c-a1a4-d5e0-a59950bb8dba@suse.com>
Date: Thu, 20 Jan 2022 09:20:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 5/4] x86/hvm: Drop hvm_{get,set}_guest_bndcfgs() and
 use {get,set}_regs() instead
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220117183415.11150-1-andrew.cooper3@citrix.com>
 <20220117192533.6048-1-andrew.cooper3@citrix.com>
 <93ec9bab-0a21-365b-3bcd-0fbf70bdbbbb@suse.com>
 <00b2e4ee-eb60-d336-b9af-04e410fdc5e2@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <00b2e4ee-eb60-d336-b9af-04e410fdc5e2@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0025.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee4478c5-97ae-4e5a-0295-08d9dbedb323
X-MS-TrafficTypeDiagnostic: VE1PR04MB6480:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB6480098699B4661212BD768BB35A9@VE1PR04MB6480.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5IdysYlGUMBusrZYOrKV0YFnQkEuCC1MTExel/0hE2wBtMylLClzj37P1q6VR7YaD9QAnHCdTXVFVqW5JSzHZ1ldANgqHEpapCUGiH3bsoFvH9LRniNCnw1N/fbaenTu6rWQ80FyaeknprfUepj+R8s1wGQiHPaIQiE5Np4fYZgsenmQXG6luPMtYtp9Daxa6U3AlcDTp1si7diq+7nhF4CUl5xnvnd9Lwym0dhd3xgnVbeS5gVGbpUc3xX47M392J/LRqxal/YYocnxKl4b1vARS3Y3K55NvfMr2M0CcDF58TaUGpKKQsqfLKWPbkSrnum+czS9BXVGx5JIF8JArMhVp7JqKgJ9q9QOCpCc5ThlxRQA379EFe9e9xBOp2LV7zIOKG6QdIzj+gZg5/7iqHjBIF9Z5H0QPX617K3GyNRPfdDhUcUrmt73LmDoWHIcwYxHFG+2DC0OM5BXYb30f9Te5vrKPb6QcEoKoO9pqz8U8h/O3e2xkp+eWHJtaPurkbXANXFzX/Dh2biKuufPlGorBpVmjFt4hCwMNVmr9dN4TpKfE/inZ853nKu3QpRVvtjBz6NIfi9AAzM36qZq4TDy+rc0IwXLT1119+0FT19LMIXgomc9lQ+kMGsLN5sWFGxlerR7y28d1Zi8u8WFvRAixUZN7u4gjOu7RUb3A8v6vHSfKu67yJL+XFT2MweHc7CYcmMiBZBrU2UfzYEh3a0f3ISUCadiEtkPeOb3Zmw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(5660300002)(8676002)(8936002)(4326008)(54906003)(66946007)(66476007)(66556008)(6666004)(6512007)(110136005)(2616005)(6486002)(31696002)(26005)(316002)(508600001)(53546011)(6506007)(31686004)(186003)(38100700002)(86362001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?peGM71ZajEYHfWmR97rdGO7lnNTbg5gIuHh0bFPOiGr1XrlGmi8io0Bk7vzj?=
 =?us-ascii?Q?mUCZgU9vwISpTxqaym/tdakGS+4THDGCuoXmOYePI6+8qmdDXpyYHI3ROrAa?=
 =?us-ascii?Q?qZjIkcIUOe92dMCuaq0ITRUux07WQTyaySZ1owUiaF3xqNpgEDihIcteqQhC?=
 =?us-ascii?Q?soUCXG6hGbQfXCYhPk7e7wv4/F0fXNrpvXB8kLz+G09jd6kChyW4lRBxK7fI?=
 =?us-ascii?Q?oh0EFPP+2at4yjsM7TLF7wNVwyEzB1qDhDsZbKIrE6UZz5rSiQWmL2Dl89VA?=
 =?us-ascii?Q?1X0S7tXPQENFsOYUReYHp2pYwt2TDJb+qtwD54ryddu0hEEwKoNms1lC6pGq?=
 =?us-ascii?Q?sbEiiICGrO1b8llqNkyJvDCoDfb0xbsy3KAgDUwq6DLiXSkUvqHMCE/N2wx0?=
 =?us-ascii?Q?9zVV1diOzNUJUTCh7Z6A3o/piHjtAw+ChNSs4+qeU8DVSsoYE9/4gb8Qk3Xw?=
 =?us-ascii?Q?tRYrKYevRSRzylXs5tYAod1uV+WwIkBxRMOm3h6mxSiWQNkBe9KC+DGl1hd/?=
 =?us-ascii?Q?vGPXysiaYqJx5eWxEmGSemf1gMg2yObFDI807VN0iqxNHrThwMzC5sUOkeC1?=
 =?us-ascii?Q?ogok1y8IwWLawbGwuHRRa+N35vw5rG4mWknsmbGd1dCLQhnhbH5x75e8LWhF?=
 =?us-ascii?Q?kzZelpu0/29U5xqwMJblouo5FAY++z80rwlqbVmxjc04Ps6rJyfu73qcv0jj?=
 =?us-ascii?Q?C/yONekTAdSuY9CtVjYmCc6kqOyBkm4dcdTg5d8rrDt7aEk6eQ1L3vfLzbNH?=
 =?us-ascii?Q?+2AcU4CSsaN5cmgICzmUxSHpXHupRHBOnCArSyF6D0GkOHm0glqdMcIuAXOL?=
 =?us-ascii?Q?PmikfIdyuKisLab6vjt+Ua7Fjw74qIwclTrYhvOgtCaNj/Vt+voS1K4Et5Pv?=
 =?us-ascii?Q?7L1n0rW7ombV3PwjTQr2JA/qHJ42dRT7k0MxxzuMxTeueHAMxPfdOHzTeRsp?=
 =?us-ascii?Q?GCeJb5mXgwFn3XzlsBOC1F6JptnYrENxbWUTRCJc/AwMv17/MS+/6zrlGzL6?=
 =?us-ascii?Q?IUsYFbSxgGsOyN1rRVcdYncmT828bHsRmjMcO48PrimH4snqCNvHtLVv/9it?=
 =?us-ascii?Q?cQz7ji9cu6PMbR/CiCDrzVKjPzxAQGYQdHAGf1joLtIz55l/wd6k5aP9yNUS?=
 =?us-ascii?Q?FPyTRoMdknLEYwnzpiHKzr63wTGSV59ox87h0TKFyuyjsYBizxXgIbHVrANT?=
 =?us-ascii?Q?Kf/u91RtPNCb++pKQ3yBNROuePydFrgWkospqrEEGd3HQkllTKxgM8MqAKXR?=
 =?us-ascii?Q?y/8X7FtqlV1nQv8J7hk3Gls6ef3hLBtLx03/sjer2ig3SVAsNZMBfzP2Y6nx?=
 =?us-ascii?Q?wII3mVezQMF5f7kQ0OADlknkjmZLXgVLifnuqOpUZemXbcdKFize6k5xd4sH?=
 =?us-ascii?Q?0a389X4OsB5UJPOiGJ2W+X9vKasqFaps6vDR0pMoO3h2CsQ16jMFzOeaEU/T?=
 =?us-ascii?Q?xWzKDjGNSRi3vX/tgO/biA+L8zTgIWKx2FPQGh7FV/8lIJtvBUef5tcZ9Ehm?=
 =?us-ascii?Q?ESP+EQpIaD7OJrfDRLHiTHu2XdCHtZl9+Z/jB8DptIi3xxKvDxi/z3diJpm6?=
 =?us-ascii?Q?5Z0SKG6A7ZZIWwPa/2VBKhQXe4HCmyRFf28J5JRqG7CQ27LPcWLS/l4k/xi2?=
 =?us-ascii?Q?byjwbRJKu4vGawTmN+BZ/eI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4478c5-97ae-4e5a-0295-08d9dbedb323
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 08:20:21.0213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YwNMvFc+ltqMxkuEX/QAuVB78ZAjHEG3o5n0JlRelfwIVldhwhPFdareF/aCpCw4WnIzk246wIiZQGSCp9O5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6480

On 19.01.2022 17:53, Andrew Cooper wrote:
> On 19/01/2022 13:50, Jan Beulich wrote:
>> On 17.01.2022 20:25, Andrew Cooper wrote:
>>> @@ -323,10 +324,9 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint=
64_t *val)
>>>          break;
>>> =20
>>>      case MSR_IA32_BNDCFGS:
>>> -        if ( !cp->feat.mpx || !is_hvm_domain(d) ||
>>> -             !hvm_get_guest_bndcfgs(v, val) )
>>> +        if ( !cp->feat.mpx ) /* Implies Intel HVM only */
>> Wouldn't it make sense to accompany this comment by ...
>>
>>>              goto gp_fault;
>>> -        break;
>>     ASSERT(is_hvm_domain(d));
>>
>> (and then the same on the "set" path)?
>=20
> So this is the reason for the default logic in the {get,set}_reg()
> path.=C2=A0 The absence of MSR_BNDCFGS in the PV and SVM paths will cause=
 the
> VM to be crashed cleanly.=C2=A0 If you're on a VMX on a non-MPX capable
> system, the VMREAD/VMWRITE will hit a BUG (which in due course I want to
> downgrade to a domain crash).
>=20
> It's a bit more friendly than an ASSERT() (doesn't take the system
> down), is present in release builds too, and more precise as it excludes
> SVM too.

I see, makes sense.

Jan


