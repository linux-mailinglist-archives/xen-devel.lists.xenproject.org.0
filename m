Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2294FD680
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 12:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303584.517927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDeR-0002Zk-9G; Tue, 12 Apr 2022 10:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303584.517927; Tue, 12 Apr 2022 10:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neDeR-0002X0-4x; Tue, 12 Apr 2022 10:21:35 +0000
Received: by outflank-mailman (input) for mailman id 303584;
 Tue, 12 Apr 2022 10:21:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neDeP-0002Wu-Pk
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 10:21:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530fca5b-ba4a-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 12:21:32 +0200 (CEST)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-qQ3JCvmnN5eakqTWB1hMnw-1; Tue, 12 Apr 2022 12:21:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 10:21:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 10:21:26 +0000
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
X-Inumbo-ID: 530fca5b-ba4a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649758892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AKLiZbDifpDyhlrfPH2x1M3O4noG8w8xleOqT2J5miM=;
	b=cGr90iLV3ZwSwXbvf0JUlGLQl9iHN/XPLLMXmqSsJ9hCuJyT43H8lNUR0MIMM740uZc7OL
	iX/PGtlq425SSmrhfvS4pOOPRAi/kWl2XN5kZn+DjDPiYm88ZSUoikxz2gSaoRMB7umxte
	04BdvmvEx1OpZEPtROc8HXq66pEs/sg=
X-MC-Unique: qQ3JCvmnN5eakqTWB1hMnw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q0ZFvFs+3bN6FWa3iPen9A9uW+f2ro3S/srAbW6/ovvqxQYld21EbLpqC8dLvx1GU884dUr6guJT/ef3GR5SllKCCNc91SChD2HxiuQSDVu7PFS2P44X9D2a3yfTidiF82fOoOM1Cz9UX+vlnD+vzv4Ajg7XQKjNcgoQVdqd6b8fvcko/teoN0/ymlSBhtTlN3WvOlP7mp3o9NkEsIfhLLO6acF//uV9Un1/FAWY8kjtevba0VSsM1sOYZE895mXnEb/Y6pHKoSX11Dvo+NFzYYAnFTPEJ6WAfMAUQtq9Ek3ONbaZWe4f5B0BNAH89LmNLXkSy8Ljb2ig2IrWAy+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGy37weZUhBtgIr26CxolnrLWmEJ12AYaVwAdKGp6Fo=;
 b=ZDvk03R0B+ZlUfpfoVB57oJ3sUCyxMf9tpx3VqmVZ+slbAEqaNx/BUyQFrv4dTi+4ul48WZ4TimJS8NcJhfG1mkahcpP6PEtnbPOJlbfGnO0QfeASDuhaa0k8vIFGKkuA53JTe0PqJ8dIbxGUZjeoDuXheQJLZE1pZljoHrubo2YstEooKOYyMFeInXXFcsQ0UAV/FR6xsgh38vZUYh7sclfxeWUX8w3AXua+ele9hJOtO1/HLthmYECOtzLykmEG6hD6g791OfZbEjvDcqsBjCZvvLbSqjEcmj6pFfTkpMNQKX1kd4L9M8jcDslD82tif1RA4mo1xXgKS0jhSgagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50dc64e6-1a89-59aa-e087-d80aad1c653d@suse.com>
Date: Tue, 12 Apr 2022 12:21:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v7 4/7] xen/cpupool: Create different cpupools at boot
 time
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220411152101.17539-1-luca.fancellu@arm.com>
 <20220411152101.17539-5-luca.fancellu@arm.com>
 <8ddae5ff-120c-0097-bac0-2fca7a57d022@suse.com>
 <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <86F93995-5CFD-4A43-A928-E9053B027722@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 484c2e46-e730-439f-7658-08da1c6e32e6
X-MS-TrafficTypeDiagnostic: AM9PR04MB7522:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB752248912E47CB3450553EC5B3ED9@AM9PR04MB7522.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aZkvmWcTXLnNs1gb8qS6pCZ1wxgAvLIhACrslhWebthMGIUlzzTYCECe49Ttpuvh3JGaymwWbmaoIqrVfTttP6BvTQEMvM+upaphGDhQrqP/zTlBHGwBdTM2QFm9pX6fNYhdr0JUdEGu629ZI2D2MG7t63vxTVo/++1AwRZQ992MF319r/gUpcmCmnI2kkzXa4J99tdH8xevj5CDHW3FwrysgPE67h12RIUWVwggBpX3w9s7avI84ovG/1xY/noeZXXZz50yhjjtcEWQvAX8lSfetPjBmj6h4iUmOBpnXgWmc+hOJJLmcKzDLHKlLrVRafNFjFw4g3PsZ/jE3QYmVJLo2hZFtBQYn8RtwYrMhDmP3FlDZ7fuhxWW2sje5Rzf+nH/EbAowwxBY0yKK/u6mtBpK3OVTHOxn3O2Uu5HClSrJFieAaGQWN3GuQmxaZl3lC9XvjPqMXgECJOZjnyTxmNochrHbmmBb9NzH4RHMlDuXf+4Y9YSNx8MP4GoVPTkMl67Yag/QvrYgmnPE8I6641idwdNh5bVEGSRQ4Hze4brFqh6+/eytdSqExGyxzmePy3TUfXFfmOJaWQ0jpMfnm8O9OW+5SL7yhyk1pLNwxrojNiHccSppzk+bPEhw9EYJshrhpIhc/ykIaRuyCFmMQNLWPHRKOAiVocHuF0y/uxHrRvqnB6lmxfUbQDMHYw49P3kdJzrTFXb9GHe6Jd8SSRkwUo24wan5DZNnjAmP1M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(26005)(31686004)(2616005)(36756003)(7416002)(316002)(6512007)(2906002)(6666004)(6506007)(53546011)(6916009)(38100700002)(54906003)(8936002)(66946007)(31696002)(86362001)(6486002)(66556008)(66476007)(508600001)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dqknk49MZMBiUUHai+VaHNsVsuopiXdHRBlLfHsWwrzq3JZhUfm3P8X7JvtH?=
 =?us-ascii?Q?juAVPIBjLo4QZtZw9F8EKOxXC/ER+EYL8KMpwpT9vcjgns6bZuaPmdjg85LM?=
 =?us-ascii?Q?SzGXgGJyUdo9cFf6/eLXV2ITBo3QIyaZhmgXKgvLMlmIAHLi8VxTlcGHGW85?=
 =?us-ascii?Q?GGXvrNL5LhY+gJZURXDbt30LZVyo0XMpyyUikSREn1D+2rFkOX2U1ypuDNn0?=
 =?us-ascii?Q?Krw9lxKHkWZeKCVWvocLGcUA2iOl2CTYWtwwxdNmfREGcMCZHket75d6aZre?=
 =?us-ascii?Q?8H2n3UGK2eb5jBseERLpssBPRqmYOGZoOBjBpnq+mqnUkDoRIsrTkTAoL5bH?=
 =?us-ascii?Q?5U0ddtqSBEaCODBs/G7heMI9dTpqQWZ2V7lv/xSeogUIrK4BiQnjeeOa194m?=
 =?us-ascii?Q?l7uhnYElNasnbO4eW5OJtPpJiVly025rtNqU8su/3mSnFO1JI9GGtFgWF85c?=
 =?us-ascii?Q?Yr4S3E0hFlUQiKeopi75F5YCDt7sv5R4FwV6+14YuloeikOYi2RJZL607KSZ?=
 =?us-ascii?Q?UvNT9KsoQdvZfw4iWg2wI71PbHvYPS4WIAs0eJVgTrW1YloY5UWk7Gs5XJ0r?=
 =?us-ascii?Q?NReneCbjSwpvOFtAXpuTEcNrwYX1tRfe9/m+weGEKCOCroeU/DFFY0kVYPS2?=
 =?us-ascii?Q?ziO8uJIOTpfSKZcfLEb0oZQnX+L6iVADGSbTmNf7RrUw6b+CSnn4D1Ug1dyy?=
 =?us-ascii?Q?5xBGCi1FaN8AOiheTpVp5ZiP0F241/SvCqojQHO2pZ1r3mDNC+EJz7vREN5l?=
 =?us-ascii?Q?HOOF8hwKcuZN3RhHb6aWKb7OckLV3VLB2Lgla/KQ0SJTg0pUZFkr51thC1h8?=
 =?us-ascii?Q?lxvYo0irIj77rYBvBcKqTOJdPlRGNBQVssYu8Hc1SLuYM2twv5EfR/6k9Y0t?=
 =?us-ascii?Q?Z+AboH6/CbW3wRQNJRwtsr6cAek0S20vctwV3v5iQFxhVAZEY6ojdXNvO2s+?=
 =?us-ascii?Q?0Ne+lgn6Bo8kzIVExUNhZOQBpTkl8ODSlS7X6sn/FaE7CsoFwHCEpU6PMd4c?=
 =?us-ascii?Q?5WNGjNmYY2u4ccAucYrMUmrjBIOP5pv7rXX++fBfpMrGe1Owd0M7eVUdJ8U3?=
 =?us-ascii?Q?3gJODse+Aa/b8pRrUNuIICAOo8RF7c9v8O0gW70gmeIwzV7B/W8ei8+uUeac?=
 =?us-ascii?Q?tVzKe0eZbBSLgD7DtaxpVW1srJdZhA09Ad7z1A8JAsKh4h/UqZb5xOdJeWRU?=
 =?us-ascii?Q?hD93/YvYXP83LArEL4fYY/OMhdNSBfJyybTQHKf82IjU25iJzlHPr74OaqyR?=
 =?us-ascii?Q?RWXaRxVEdNmGHBvH1ierht/1unXCGY2VQfKLQiSaU499gav1aN+TwLWWEKEG?=
 =?us-ascii?Q?UToLoqq2tlRYzRhIG4CBajZIKqk5bipaKGjyC5d4F4N/eGVh+1rHXtxTIsbO?=
 =?us-ascii?Q?rti5dBBoAusg1GBnDQJsalZ1Z21lgP2K7k/vYbzTtUnx7LcmJCTwhThvFnmg?=
 =?us-ascii?Q?XNkdGMDgb1vGrZXaX+8QDuHJApL5g3IT63/bN3K8dD27qtmUADO7y9AV/+YX?=
 =?us-ascii?Q?AfyJ5iv0puFIvZlizswuOq6MHO57CzOuCAMvcXdeVgr5v46lTSiyNg0mr2ql?=
 =?us-ascii?Q?JPlKNSFbzj5AZOEw7zTj3bUT965XcMmhUa8osyTSMiNxt//gid7v6cFIwcrq?=
 =?us-ascii?Q?Q4Ut0EyeY6SM3IyRtrVtiIUs51ZdqbpZrlr0RZGE/lNZT/uMRRbkcKAEBJOq?=
 =?us-ascii?Q?+fZaBkBuR3vFYD6SAmwqRzqNgEsNQFOLe2C+KAxlzBrDlWRTRAgZjGw0RjRR?=
 =?us-ascii?Q?akbx/mS3gA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 484c2e46-e730-439f-7658-08da1c6e32e6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 10:21:26.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq8Vowitq0i2U9CIisymb/lJAEA4cf1BJJ1gTMJ8YR1K1iuX2BjgX98Enf/pzh/tNgc6llewytgf+P92pUezvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522

On 12.04.2022 11:50, Luca Fancellu wrote:
>=20
>>> ---
>>> MAINTAINERS | 2 +-
>>> docs/misc/arm/device-tree/cpupools.txt | 140 +++++++++++++++++
>>> xen/arch/arm/domain_build.c | 5 +-
>>> xen/arch/arm/include/asm/smp.h | 3 +
>>> xen/common/Kconfig | 7 +
>>
>> For consistency, should the addition here - with ...
>>
>>> xen/common/sched/Makefile | 1 +
>>> xen/common/sched/boot-cpupool.c | 207 +++++++++++++++++++++++++
>>> xen/common/sched/cpupool.c | 12 +-
>>
>> ... the new file now under sched/, also be put in sched/Kconfig?
>=20
> Hi Jan,
>=20
> I was looking for this change, I see xen/common/Kconfig offers the menu =
=E2=80=9CCommon Features=E2=80=9D
> and the xen/common/sched/Kconfig offers the =E2=80=9CScheduler=E2=80=9D m=
enu (visible with EXPERT), so
> I thought it was better to leave it in =E2=80=9CCommon Features=E2=80=9D.
>=20
> Are you suggesting another menu under =E2=80=9CCommon Features=E2=80=9D?=
=20

No, I'm not suggesting a new menu. I was merely wondering whether the
Kconfig contents wouldn't location-wise better match where the
respective source file lives.

Jan


