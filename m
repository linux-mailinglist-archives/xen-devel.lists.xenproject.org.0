Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DB3509C37
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 11:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309962.526501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhT59-0002wG-Uk; Thu, 21 Apr 2022 09:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309962.526501; Thu, 21 Apr 2022 09:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhT59-0002tm-QL; Thu, 21 Apr 2022 09:26:35 +0000
Received: by outflank-mailman (input) for mailman id 309962;
 Thu, 21 Apr 2022 09:26:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhT58-0002tg-Lw
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 09:26:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 223ff33d-c155-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 11:26:33 +0200 (CEST)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2057.outbound.protection.outlook.com [104.47.1.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-mbLu9oq2NyC5c7E9J-iCew-1; Thu, 21 Apr 2022 11:26:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8758.eurprd04.prod.outlook.com (2603:10a6:10:2e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 09:26:29 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 09:26:29 +0000
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
X-Inumbo-ID: 223ff33d-c155-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650533193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RdrblUgnysg651SA8maVoA/DgVaB96EI87pKo8AllnE=;
	b=bOcp4pFSMo/x6UlAv1zjyjQAkhkSL5T6El705DAi9SfCAu1Y5A+7KcGqRvpORtQDSUrOB8
	P3F/JAuVEWWjClFsH7H2XXNoE5Ydnnaz7r/kzFhIOGKf4VgcxJV/myLdb9rRrBcQjWEiCm
	3bH5BtLLw9dmzVdwWta5FiSqWZqx4mI=
X-MC-Unique: mbLu9oq2NyC5c7E9J-iCew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0z45PE26hOgPY+bXEohMjuRL52+wMXs8CtiAC5CMcPFg3lyEldnx9rLPwTuHxK/Kc7PGyKrsxlVj4Q6z4rG7Cpu0OUNRUqJji8sJqghjFj45yLcItW8PsP6jqFkh5WU4xCc6jabEczaLxUxMIz4YM5HV8lx1AEeK2Y6JULwKllmExmuSk8WHDSoLO790iBnQXOll2+mnl298wJkS7IbU7H86i0M/64u2U8gC7M26Ml5gy7icaIJI1W09Ox8o6pBHKdWYQy5evoUslPCcHrR8juYdVZDGvYwKHngd0XXJhk9K7AsHHmJfPbL9GHxEmKbAB3I5JpgD5uyrOmzxCwQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h7dSRiI6+gKM2CCwrigo35ZuUTH90ivrPDwKdYJ4Mo=;
 b=c2UH2LRkSdyb+DkMKY36eRExBlsy9JDXWNERKeAbQkwBAXi88DY4FRsvW70wpi/d2tnEiI9PkkM4wcnYKELWxg5TtrlV+LyYqRyCtSsqqqTz3nGdfB6WpmIjXEvnTej6aDgtb9wwzSOdf3/GRuL8axn8YUwwHBnE/xjTNBej/hBOvVhiuLFHXYRuLE0O3Qaxs7K5mecnuds5H7nEBSc9pGc2VYZVL7kjLZBR4yic1led5A6AZnEGvwglQnGMWw2qEzPMYRgSP5M06p27BPYml6751Viqq5txwgNn+aUDl4PHFO9xHPADUB1R2H+/Qk9J853hBMdTZF/392kgJfVllg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <33a37e77-0e38-2c5f-6bf9-2313b5dc5dd9@suse.com>
Date: Thu, 21 Apr 2022 11:26:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH RFC] x86: Fix XEN_DOMCTL_gdbsx_guestmemio crash
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420155657.32506-1-andrew.cooper3@citrix.com>
 <70490620-16d2-6045-f83c-df65540025a8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <70490620-16d2-6045-f83c-df65540025a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0295.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::12) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71f5b7f9-da67-47c1-c340-08da237903e8
X-MS-TrafficTypeDiagnostic: DU2PR04MB8758:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB875804F7A5D84D5DB542BA35B3F49@DU2PR04MB8758.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jugNASDTngTVGIf/b2BWHWWDFtyYIC+mKwS6xbDPfjyjLwFCIM4vQLt9PUpjvgBQYXmXPI34aJDGCI5a2XFL4bScE8RApDTvvPw0seSQK6zsjfOZ6cO/EMUOMAVCP7qlBhJYkTY8gZ8eOgVRe90UCy+Ti267CJdUmrN1HEjSs6ks48lImjxEzJt8Zh5CaTvMBGJNTheSAtoahVKiXbNh1jqjgZYYJ8leTTc9muK82u8V++3aEdUSCEkZ/7zkY8IA+2+vAZyyVuXQ1lTaUz1q4A7Lwzwkgja4/03VuU5Hsauz9z3lKuHdgJI7MlVu04K27s5zSb81wSl0GSlKEuxDx4K7JpFStd84vlorKlnurHyKw2+UOceoVGtT8khs4otEoz+sl2cDdkCFoUW2Zj1oOCGAv7Yl8nakyLtvgpze+OtWCEqIQni4QtWOb2Lg8AMEj3v57C4RN8itu4lLyLQ6ZjVjm6395JYwPZStayRZLG0HZcop0n3ulzu5GJJCdio9XSKPgeAcacdNH5vR/U7/mPCUeSdKq6710naSjSHg9lRVlvC4ZjcX74A9xfwM8bbFfw15d9L6m1/+7uKWDrxl389wePIDp9810sei9GAXPWWFV7+HP+LksliZu43PGN9VkPuJmTLl6y5pVi3TeczfbutxkGeirCqTVxC4dmxyvjEFdDkZussEwyvuUx5IZ9en0VoYNTBFwHEiG1r8iFqqf8mVDmLCDTBg+zHdvY6aCMeAEJHsMJ3BW32BalncFD6q
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(4326008)(8676002)(53546011)(8936002)(26005)(86362001)(31696002)(6486002)(36756003)(31686004)(5660300002)(66556008)(66476007)(66946007)(508600001)(6506007)(6512007)(2906002)(6916009)(2616005)(54906003)(38100700002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IJz/AVStCd3OIfL3UDJ8ScCHy1hqgTHh+xj43oAldAM6NRv9NstM8VF07O+r?=
 =?us-ascii?Q?PXjVlgWUlxzOVKgFhBDnHixrvt4IVw+dlAnGxjLB6fDpBu5fEYo01P3d5fHA?=
 =?us-ascii?Q?Rwz9D1m3/G577QszwxVtto7au6bY4YsvMVblyyhQ9ajNCNFdCrY5H17F8TGw?=
 =?us-ascii?Q?G9ZNy16BRNwUhjCZ3pnrE7JFJZErGXYxKeAvvuLiQtyAsweC9kGYNuBXhdIm?=
 =?us-ascii?Q?vIpNK8BgvN1r305cZLDjmEAL2st7YmR/A1LDlpsnJEFdF4ysBhF+NKDzZwc6?=
 =?us-ascii?Q?jIqNH3fIq8ulHD3Ocu49zWx860LIQf1n0vPFAmEc8YwFYCI6UVyxx90W5ZVM?=
 =?us-ascii?Q?6yFOPIZmG9s7Ujl9dq24T3jtRHtdKusa1mOKsoCxLVIqf/DFoaQglAk+UnBo?=
 =?us-ascii?Q?TJm1mnaICfwyI7feebAcJ3n1yNefPrgqr7IKy5OFdFNcWiFFqXnVV5t8D3ct?=
 =?us-ascii?Q?s9hiDj0YMnddHY0/puOghv4pg1b1WjkPFXm/nNuvrebMn75QBh8eat6GSRTr?=
 =?us-ascii?Q?+fvnCh/WJ9+7aEMZu35Q7p3veoC7ATQT2Xjx//1SPjg6PG7g0UMoiXPcCws1?=
 =?us-ascii?Q?Xto7Tmm++N2JDd+TUyZv2Z/RHbk1gIvP5Ezqnn1Hry2k49ryXcu35Ns6Kjcp?=
 =?us-ascii?Q?ISuJyQrBGck3x2MnDxvbMsaITc4JYSg6+w5VXtFFphRK/F62uKhv0BIstd0N?=
 =?us-ascii?Q?9co7Ebu41aQRFoK6O9OzmoBYrkEFOljOukVi9I8vgxKDrg968zRHMqapl0yl?=
 =?us-ascii?Q?hdh0hAgM6CUxKRF0jD8778b2QsQB8UvZwu6X/upNMH72Q8akI6GhCnjFXKK2?=
 =?us-ascii?Q?Tl6K5Klp8mwEJjx5bsuUGr3/3Pu19VR08KrvNa5SD/ZBJncbG+kaDbheFcyT?=
 =?us-ascii?Q?txy9Y2z4yu/dJOewNE6jaL+96TIxISNybUu/iqnTy+cNe0kSZFdUKIJigRDu?=
 =?us-ascii?Q?1GNu/bXt8RIvG8qThwIILLkX29ZpIk8ktDn8d7+tRMln8ChxYe112c6QlW1A?=
 =?us-ascii?Q?GzkvySJnzOYqzQmn0mYDB0hYGwbXKSd3YV9zTiB+WTafmwvj8rk1WiOoEL7v?=
 =?us-ascii?Q?ZjLXwUKDnYVG+TLdmpraTkhic0Dg1R6D70KOl39gzrSWJHEKXydyaupi2dps?=
 =?us-ascii?Q?RBgFG0NFnjRLRBp9qTEkeApYU2gKnzD5Lfq7TqOacSqTqlOVrj+Xn4igR3YC?=
 =?us-ascii?Q?XqbPQMdu7dK7u9O6OCocJWknYvFMglvPOk/Y4lwdMqQY0gmgGUSGulWuSDzY?=
 =?us-ascii?Q?VgfwaWDo43b5sOaMNeDuaw3t6+NoNpgGuM/IQSuwGWkGfH2ggmVogMVPPC5I?=
 =?us-ascii?Q?8C8eFhOMB9Dolt91Z87iwBWHCmH+xE/CvqGt8VGFUfG3KCXN/O95Fbc9FLNY?=
 =?us-ascii?Q?WRXwgBmmYHdq9L1m4I8lK64BYjF8j1Bk/pB1kMvCpEwFeKwi6/OdJmQPTOTS?=
 =?us-ascii?Q?G6Uddt5PJaN8XlRzZJskQIUdAZjD/qsr6sfxpDRLHCy48afPR4YRdDFa7o8e?=
 =?us-ascii?Q?8lyp4cCsBFvQlU7ZAyzZZXp3d1HsHoUni+dzoo3FMHVD0tdfLaSNd9v5LHCF?=
 =?us-ascii?Q?W5qXSEIxjk0vXKgF7+/79ZutkgqpDAwk5/5vMv9fKtDbswiLg84B+PvevHrx?=
 =?us-ascii?Q?jeqzcTreTznvNIpCXNn6oQhukrOEXbPDqABgnMdmMoaZeCOYHGtvAjH8pJ4Y?=
 =?us-ascii?Q?In1oBkVRBwbvVIb5vHk0naKRUp/WE0LfEmP3JE405Zow5ra0lfXIZkWy7C6e?=
 =?us-ascii?Q?xWBfVLAqDw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f5b7f9-da67-47c1-c340-08da237903e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 09:26:29.1509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5OAykQBMBjXorldbdxQA0ZkuVeuW+Omsebiy2EArlPua9dLYMu9+Sr2u/9b6kx0dXYwkhfNoVY4OkedLzCOFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8758

On 20.04.2022 18:03, Juergen Gross wrote:
> On 20.04.22 17:56, Andrew Cooper wrote:
>> When CONFIG_GDBSX is compiled out, iommu_do_domctl() falls over a NULL
>> pointer.  It isn't really correct for processing of XEN_DOMCTL_gdbsx_* t=
o fall
>> into the default case when compiled out.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Juergen Gross <jgross@suse.com>
>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>>
>> RFC, because this has implications across the codebase.  The tl;dr is th=
at
>> case FOO:'s shouldn't be compiled out; we still know what the subops are=
, even
>> when the functionality is compiled out.
>>
>> There are several ways to express this.  Alternatives would be:
>>
>>      case XEN_DOMCTL_gdbsx_guestmemio:
>>          if ( !IS_ENABLED(CONFIG_GDBSX) )
>>          {
>>              rc =3D -EOPNOTSUPP;
>>              break;
>>          }
>>          ...;
>>
>> but given my debugger series creating gdbsx.c, I was also considering:
>>
>>      case XEN_DOMCTL_gdbsx_guestmemio:
>>      case XEN_DOMCTL_gdbsx_pausevcpu:
>>      case XEN_DOMCTL_gdbsx_unpausevcpu:
>>      case XEN_DOMCTL_gdbsx_domstatus:
>>          rc =3D gdbsx_do_domctl(d, iop);
>>          break;
>=20
> I'd go this route.

+1 if we already start enumerating sub-system domctl-s (as proposed
for the IOMMU ones as well).

Jan


