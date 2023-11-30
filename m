Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FE47FF7AE
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 18:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645089.1006926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kRK-0000tl-Lk; Thu, 30 Nov 2023 17:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645089.1006926; Thu, 30 Nov 2023 17:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8kRK-0000rN-IM; Thu, 30 Nov 2023 17:03:02 +0000
Received: by outflank-mailman (input) for mailman id 645089;
 Thu, 30 Nov 2023 17:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r8kRJ-0000rH-OB
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 17:03:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5100337c-8fa2-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 18:03:00 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 17:02:58 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7068.012; Thu, 30 Nov 2023
 17:02:57 +0000
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
X-Inumbo-ID: 5100337c-8fa2-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnULUrMxbVRMOqfOpgvdZsBRkPLBWhhDyrkDechwv8h1HkI23fL6UpmEvUiw3fAmxtRKmiHI/cLoDyJ8cifixZ/Fw6gKurC8WWayVfl3Gqz/yVuord7twekauD8YsS4rL06XIO5qTsa5AUzmbepBpaML11f/H4U/iVcuWcen6KGgyur4+lv8KAaSjnhmtom/iF8xslQPYkrFnOKjPTi8rfIn3mwrTtLjYojkIbEHzZcvERm3qAM6Iz/aBXsfByXmZI/5/cO/mLhZYGb8vQ7rSCrr0Wc7So38TCtN3PiqmsmDPlfuaSW2gMQObkwYibsLBkeL6frnVtAgOg8/6NTCCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFMtYpj/wmPRbhRyIRlfOwNwyt/FyiipM675f4p4UIs=;
 b=BdC0p/dTjS+noH3jn9D+FqYq0V2KH22sYNIuTfclfU3cmoFbOZSWeuFGB+RzkuA+40eQW9T6KwHBZGXR1NhuLsQ7QDpwsCJQmwKGqbCzR/v7wtQU8dhcsleC8gDRhFfXrBK4n9Pto58NCEcAJmPmQ35TezPDZPU+REAyuKTgeBeWbzK1UT5P2p79qRR3DaajV6+J9fnilN5QYLJVdxEE9U8UwjUTApJVWiT5ThMRuh5c9l+lA09s1QHkf4/XzMBVHpylqduPEoVKhJjnRtVOHnHe2BHgYjo1tEvKPnATjXr1F/UW/qhN+1b/nNaZ/hzO1B/uNgNaI5h1p3cIgVZR9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFMtYpj/wmPRbhRyIRlfOwNwyt/FyiipM675f4p4UIs=;
 b=ag7entcH1XUncb/tEkaFIjgh94yEKNxa7BrDxnnxNJWPDIKRWw6MQ907W/s5qPK5G2Y5zXjOmbPeoWhOH/vRQ/kL73rD8reft2aWOe61Djvp0O0mFq9dFwtwEpZbwP9G9fMq5lEIoFcj7OaGsYS/47/xbaFoFnYB+s/J5RazbAo4z6gJfx45n2r9fC5hGDnFgyd7tFryv0vJcX031ze9b6Y0crmUd2dE4cpUXBZSazRL3uy76Pb26Nx3n2LxZXtcrXu6P6/fR6U39miDr2jjmU1GF53DphYQten1aho8XwsuSXfIruEyjKURYaoVCh5i1A1ecOQUgCZZnoKwpKbEWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ac223d0-75a1-40b0-8bf9-1c556703c07d@suse.com>
Date: Thu, 30 Nov 2023 18:02:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] xen/x86: introduce self modifying code test
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20231128100352.35430-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9576:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb8427b-f326-4bdd-fa77-08dbf1c633a7
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XKlSzDWlXcCNiFFyj7/sS9ishe1MlrthFNnOO56fSOy9mRMwzcDFaGeS0JdqyHIP1d/5K+2E5A85X+e3744iYxve0/7Q6POI+HRxyQbSzngSTTaKkNpUjvxKajGuPFVOsr6UMreEsn1D/GmmxkHUK5tOYc3Ea5ob+73tJnpuA/8T8IEoSVXbuNx2gCzNDC8PHBQyY2fA20lQPPk1TFn+fBBGcG2ID99KCusGxWLEy97ItW94fbweI9QgwEZUvxl1BuCs5x5ZnC+kZNMm6btGXGRck4/f9iVDii+871uz33HmyXYPa7BmOw1t2fK1uWSwYKZE2Vr8foRLqmwrCXtQDmZsBiOq5bZfP4Zc3jXr/klO4tj+qUGnOqBdgDC74Kg0zvwRbGcDtNuh35FA59ptV3Yv26jjE6MAjNlxP0wH65PCbeI0joagpZW/k7xIHhbXmAcmsUNZDz36G1csWwFB/BG8zWCWNsi4AcUwHx9hhh9m9HV7YKu8LXFZJBRT/wmAXKXcCZXiB4Q7zCVI4/zwfmZfMQx8tPAEB1dDlLYPonIl/orh5Vzrb06J2fmTciqJHEZq6IGwnNOZruCC8wNUHWvzW5TcEPIsZb3AoD0VzuWDI95jOg7HQ20GSAdBDZogUeeubRKed6uzuZV7+c4RAw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(376002)(396003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(8936002)(31696002)(86362001)(4326008)(66556008)(5660300002)(6916009)(66946007)(66476007)(36756003)(8676002)(54906003)(31686004)(316002)(6506007)(38100700002)(2906002)(6486002)(478600001)(53546011)(6512007)(41300700001)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0Fidm5vK09PSmxKcWI1cXUrM2ZPOVNoM0h6QkhWNUdEYlhKaGxjTlR1Z2Zv?=
 =?utf-8?B?MkZOQXQ2VnNvblZvdFpDVThWSU5GTStHbDFkQXkvK2pUbFV0eUQ1ajlrdGRP?=
 =?utf-8?B?a0pXLzhhbVRwUTJXMWRLUUUwODVNZWU1eG15S29oTE84TjE1cThjajFucGZC?=
 =?utf-8?B?NHdUVW9kZCtvZG9GMTBzdGFNNXorVU5jaDNKU08rdndQYzNWeXlwVUk3Mm9N?=
 =?utf-8?B?aHdGVEl5T0V6N1hCbEM4QUNkMGxXTlJ6NlR3Z2dxK01MeE9SdmtyRnJ0OW9X?=
 =?utf-8?B?dVFjbm5BN0NmRm1pN05YeG1SaU1YZVl6ZWFKanNxaE5kbWQ0TGp0T1J1OS8v?=
 =?utf-8?B?TUVIcHdOZHRORHp5Tm9EOG9raDQ4QzQreGNLV1RINitPdUN2b2FwMlRNSjVG?=
 =?utf-8?B?TjJHY2g0L2J4a2kyOFdHeWVWSWppamZyZ0Z6bWVMbFZtaHNXeTJsWGVVdEdV?=
 =?utf-8?B?QnRlNi8rTGxaWkRJNjFRKzlyeHBKeFR4WXR5OEl4U0MvQVAzVDlWUW5MMHhv?=
 =?utf-8?B?VjRLY0pVYUliTFdWcU96Yk1xVE5hQ1hsQ25Dc3IxbXU5Z2ZuckpNdTRqaDZH?=
 =?utf-8?B?YklNSWNMQXFmUmhFNmNWL0FDOEJwMWdaU2pnZzZaVGVQUlhFQ3ppSTJ1c1pm?=
 =?utf-8?B?bU1iMlZCY0ROekxxbzlmdk9ETXExekhDRTc2QkhJbHBjSGE3SXdRWDhSZWJD?=
 =?utf-8?B?UU1qSkpyMDlTZ2IrcEl3dGVsZzFCNVFaNWN5R3FuREpjMXYzNWo2YzBXSUZE?=
 =?utf-8?B?SHh6MHN0aERxZjBvMm9KU0FLY3lRVU1KUCtQbkxvalNHZm9lNGp0dGxldDlG?=
 =?utf-8?B?MzF1WldhMkNDbEVkanpmQ09URDdsTmRWeVkvRjZia0M0cTZMVmFFMExnaDgv?=
 =?utf-8?B?T2NKdlF4ZmFSN2pIZ1lkc2VTdlhBOE9BVnpjU043c3JMSkdjWFBNRnNweWRG?=
 =?utf-8?B?aXppTTIvVGM0dmxyaXpYelk1a0lBREwrenJEUzIvQXNsenFseHBPbFZGbElE?=
 =?utf-8?B?WjZ2M2FnLy9qME4raTM5aFhGWUt3bkMycG9uZXI2S3FjZXgyZy9GZmV6MWc2?=
 =?utf-8?B?MStUSklrYy9nRElVWVB2SUU0NU9aUVFNcy91T3h4Z01RNWxRZkJtS05yQnM2?=
 =?utf-8?B?NTJQclZXQTNFSkdvUVJNbXpIMm8vbDJxbFp2OXZVb1JjVHFIMzhoekNkaTV6?=
 =?utf-8?B?bmFGZ2g5T0pkNjg4YzVvMVlwSGFvNnZBb0VlRDlRWUU1TnhNTjc5NStXL1oz?=
 =?utf-8?B?QndnWVdaeXplZUJjZFhwVXlEekFNcEU1bG9zQnVSSkdQbWV0Y3BCUWRqMWpC?=
 =?utf-8?B?Y2xuYzZUN1BUYkZXMzgwUzlzaW5zNHRCKy9nQjluby8rUC9CM2dBM2w5Q0hl?=
 =?utf-8?B?dklYQWh6RGhvUjI5MTk1d2VqTmZubmlObnlxNFM3SjJCM2pJZ0MwbXpsbWdq?=
 =?utf-8?B?U2MyWGhzRDZmV2RhdHVuM2RoZGRwRTBJVmtBaFNPOWNCYkZtZ3c1QkdLTVlz?=
 =?utf-8?B?bFRmWkZYdEVTUWxwbDlSOSt3dUJVZFdZdUNXMktGWHZZZXJuVFAvM1dCc1ZJ?=
 =?utf-8?B?RFcyMUZFS2lkRXpEZHRxaHprakRFUFVKK0lOb3pURDNiSGtqTDQwOEdDcU5h?=
 =?utf-8?B?OFZjemxFTEdEZUtLMldKdlNWSEM0YStyZlFWLzNjcW9wbGd2ZFpEcGZHLy9y?=
 =?utf-8?B?dTl2bDd1bFRscDBkUGJSTjJjZEFlNnRKdit4L25hd0hMQVo0M0NEVm1iQVNn?=
 =?utf-8?B?Y2ZaKzNxdmE5RkQ4ak1VZWluT1N2TXozOFozN3h0bE5qZHF3aXJpQmw1cDVh?=
 =?utf-8?B?Mlo5SlVxM1NLQ1FwOHJzVjRaVTdvaVRFbWpxTFZXZG5LNDFqRUN0Vk9GYXky?=
 =?utf-8?B?NVNwdzBGQm1lNXJEY0t3REFqQmxjd1ZjbzcrbTd4Q3pYaW05SU9JbXhOa0dO?=
 =?utf-8?B?dEZ0QzlPcTNQTU91d2wwQkloZ2ZQdlFxdWVYWUFpMTdCQlJUbmk5MWpuRnoz?=
 =?utf-8?B?ZG41VmpCSUZ5QmRsNEFKMHk1VHNVOHBqR3BLcjRlOWJwSVliNWxsR0g4d0FJ?=
 =?utf-8?B?VzlpUmxYNlZWM2RJNlY3UEpweXdVbE9kT0EvMHN5S0I1Y1NPNWxlVFFwTkRJ?=
 =?utf-8?Q?VDBBm/IQlkAlQA5l554xZcZ/6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb8427b-f326-4bdd-fa77-08dbf1c633a7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 17:02:57.7533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2iVQjkHWGeLbQ8Y4rH5bGDmc1sHygORe6YznOJNBbEdJg7cy5ATFPRglALO7sGOJRkBXMAXiJgEFJgyo3vKjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9576

On 28.11.2023 11:03, Roger Pau Monne wrote:
> --- /dev/null
> +++ b/xen/arch/x86/test-smc.c
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <xen/errno.h>
> +
> +#include <asm/alternative.h>
> +#include <asm/cpufeature.h>
> +#include <asm/test-smc.h>
> +
> +static bool cf_check test_insn_replacement(void)
> +{
> +#define EXPECTED_VALUE 2
> +    unsigned int r = ~EXPECTED_VALUE;

The compiler is permitted to elide the initializer unless ...

> +    alternative_io("", "mov $" STR(EXPECTED_VALUE) ", %0",
> +                   X86_FEATURE_ALWAYS, "=r"(r));

... you use "+r" here. Also (nit) there's a blank missing between that
string and the opening parethesis. Also what's wrong with passing
EXPECTED_VALUE in as an "i" constraint input operand?

> +    return r == EXPECTED_VALUE;
> +#undef EXPECTED_VALUE
> +}
> +
> +int test_smc(uint32_t selection, uint32_t *results)
> +{
> +    struct {
> +        unsigned int mask;
> +        bool (*test)(void);
> +        const char *name;
> +    } static const tests[] = {
> +        { XEN_SYSCTL_TEST_SMC_INSN_REPL, &test_insn_replacement,
> +          "alternative instruction replacement" },
> +    };
> +    unsigned int i;
> +
> +    if ( selection & ~XEN_SYSCTL_TEST_SMC_ALL )
> +        return -EINVAL;
> +
> +    if ( results )
> +        *results = 0;
> +
> +    printk(XENLOG_INFO "Checking Self Modify Code\n");
> +
> +    for ( i = 0; i < ARRAY_SIZE(tests); i++ )
> +    {
> +        if ( !(selection & tests[i].mask) )
> +            continue;
> +
> +        if ( tests[i].test() )
> +        {
> +            if ( results )
> +                *results |= tests[i].mask;
> +            continue;
> +        }
> +
> +        add_taint(TAINT_ERROR_SMC);
> +        printk(XENLOG_ERR "%s test failed\n", tests[i].name);
> +    }
> +
> +    return 0;
> +}

I think I need to look at the next patch to make sense of this.

> @@ -1261,6 +1269,7 @@ struct xen_sysctl {
>          struct xen_sysctl_livepatch_op      livepatch;
>  #if defined(__i386__) || defined(__x86_64__)
>          struct xen_sysctl_cpu_policy        cpu_policy;
> +        struct xen_sysctl_test_smc          smc;

Imo the field name would better be test_smc (leaving aside Stefano's comment).

Jan

