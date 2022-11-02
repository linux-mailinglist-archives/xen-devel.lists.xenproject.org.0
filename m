Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11917616331
	for <lists+xen-devel@lfdr.de>; Wed,  2 Nov 2022 13:59:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435924.689868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDJx-0004vM-Hv; Wed, 02 Nov 2022 12:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435924.689868; Wed, 02 Nov 2022 12:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqDJx-0004sx-F0; Wed, 02 Nov 2022 12:58:17 +0000
Received: by outflank-mailman (input) for mailman id 435924;
 Wed, 02 Nov 2022 12:58:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oqDJv-0004so-V3
 for xen-devel@lists.xenproject.org; Wed, 02 Nov 2022 12:58:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2068.outbound.protection.outlook.com [40.107.20.68])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02c89598-5aae-11ed-8fd0-01056ac49cbb;
 Wed, 02 Nov 2022 13:58:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB7283.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Wed, 2 Nov
 2022 12:58:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5769.021; Wed, 2 Nov 2022
 12:58:11 +0000
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
X-Inumbo-ID: 02c89598-5aae-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2uYIAxekl8ukviJc1BoAjMUHvfOp6FaJrqwE4sOOHsAiMtFnILMiTQbYhEN1EWWaPEYRn/zESMTYm9DVmiTw+6x/WzvmlOlJ9dWeQ5uj+t12RGETdK5spCDF6v5sDMBt7uj50iFkSGa+r7nV+EIAfIWeelBpWRPm4oJg8gCE2scGDD5s7ooCgf6TavHS8E/t/k8anciCdoJ5/HCWWgd+bJebvonN62cV3Hn8rsd4Hw7BLOnc59ZYZeLCMP7GzoRF95zuBKW0uK1zOOSxP4oZnSrwTVPhA77CYjEnVjpb/GD4RbfEkVZH+xCm+ZjucspmC6QaKoY4bJIn4w/QUuU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn+7xbZ3czE43TfL10MYZaR5153UaGRfLuJSYE/oprw=;
 b=XxH3nl5Gf1+CgII5+qmF6vV2oOCe9uL+8tePbzUdYoHIi/9L1YoqTQAJTTqk2s5zRabQ+TbLZJGO0qxoTB0wA8mZySdXantOoBqAxz2dTFjAo9WUrSj0NbGJ7wXA/HJ0jmwFqlB0kXHO1ibbI2fz8I4XHJt+MKTYqPT/q1ugBZms5TptSRfuDRMATT0zdqWBqFSCXHRbVl3BqgED4KXl+y+6XgCBZ2Fm0fO25kRmdONS6MqqheQowz1M2ds7hHeC5ASRKmEZihy/4NpxLg6N/eYbnJO0ojNf1YL4w4zSsAKYzlJOTqnsvKKMqiymuv61kNXFr/G4chRhbuTd0ODcxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn+7xbZ3czE43TfL10MYZaR5153UaGRfLuJSYE/oprw=;
 b=CUt2QKmreYLDBgQBJQvnNOyHqgpfVR6HNC5BJZlnuLrMcpB3OVglYtlDDaWWNnh5v6EfhGZtxlOgQyKxlWOclrQB0oKhQjFN4Xvb1TxOShBHfmmLgqfISZ2H0fRgmur/5kWDHmkiggwiDSICffO7tkuPUsnoyQ+iT61qmy6KH/raWtCSWDKrmoPYdhEILwVy3yyFm0KWhlwZY61WZMk0Ng9Mdu9QXCXcGrsnAgrsHuLnyJj1lnvSKQ2O5dEFRLsYZJMJxdDS2YdVWGtPsT1NpPBQGJu55kMn8c3kteLLOC3bPF02vQC9c680Hxd2iqT9E4AMuIk0Au81ZbmfUkSZMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bd732008-d3f3-0f84-651d-f6bf64d9f33a@suse.com>
Date: Wed, 2 Nov 2022 13:58:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [XEN PATCH for-4.17 1/4] xen: Add licence information to
 public/errno.h
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221102112854.49020-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB7283:EE_
X-MS-Office365-Filtering-Correlation-Id: 66621a27-ab00-4799-a162-08dabcd1e576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wis6rgl3WnHX6Z1q3CYaGOVqGGpVN+/C1SKUEUyf/xlycWGcnEY6PmL9BgqkLZwttc/088KECR7dCgQIfzn055v4F03Fnvh6t+sSkVWEegawXqS+v5M7e4hY+cH2n0L7pNesoqSK+GQerQCE2n+UQVGm6owY9R1Kqd2LDA1KbSYUQWH5alFu3VNwION7U7z/GajMnsGbx645MDknztc1oJr8lkOaSoomrJj07RHMQkK5/zV/fQEYlShfkvgmP0JrPtoAycrHrSSmNPrdjjuWbnmMkSwXKNYWZwlrBHjwmJDRCFV7lZs5rH74PEGVg4dmM9yWPfpWHORGLmygDvrhb/2OJ44G5XyGiYs4P8C/4qOBBa/iouRKN7KESpehPWDWTGQJjcnYEVAmgRew4H85A5BnhA90FHYwdPTULyJo9QHvje0usoLiQOGx6ASf4JDu+as4nBIyd148KpoqzKZJEg/U7V2LuWMY/Ib+Icin9QgAu/qOZhMYkMvwQxES77NkrJm2aAvRtxWHIlUnx2/zGkox4OKb3XrFHUW2GcXWoX/MYd/IIg/H/s8ZTcuuzoTHERaE6wg/txZKxy2Z5tD7HFk1W/KF0fKmJWQB97+jbdC98oheuL+lIEOTtbuMMCA+/GwMnC7n3RvbCMyB2Ctl7bmFp2zuBT1VaIC1oNKxIZdaderXTfRT7as6C8ncddTayP3pXJ8zTyqxzA+ZQcaM3v4CTya3cswCNsDQ4HKkWDU0bNnnxPhRr7djxKesE2OrGexq87iha88UwIDetqVac1NiyX3STxGbYzRoE3J4Eag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(4744005)(2616005)(66946007)(31686004)(54906003)(316002)(6916009)(4326008)(66476007)(26005)(8676002)(66556008)(53546011)(6506007)(41300700001)(478600001)(6512007)(6486002)(2906002)(8936002)(5660300002)(186003)(31696002)(36756003)(86362001)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c25kVmtVNHJVbVpjZ3gxaDBxMWxMbjRYZDI3Rk1KVGh1a1AxVXJGMnl5Q0lB?=
 =?utf-8?B?VjdJZzR1SkVkWkpxUk5kRUNONHNOYUxwMVYxR01OVFRsV0hydFZPamd3QTVm?=
 =?utf-8?B?a0c1Q1QxNXBPZEoyWmtPOFpmaFl0NSsxNm54ZC83YTE3OHg1U0RBYzlKVnNH?=
 =?utf-8?B?OWZjeEh2TXlQYUh0ekE3eVUvVFJNVEE3eTl6a0loWURFK1ljcnRFVWM4S2E3?=
 =?utf-8?B?YXhabGhhbDNjMk1uSDhFa3ZLQnlMU3o1WnlGS2FRK1Uwa0wzVWEya2wzVGpH?=
 =?utf-8?B?bEhuWDdhZDFNeThSYTlLQlptVnE4cm81WFRLYTFOUFhzblpaclNVYmlMREdu?=
 =?utf-8?B?czFqeG51L1dJd0ZwaTQrWkd5Y3hqNlBnZTJlV2ZVbXV0N1h4VE1ZQlc5cjB4?=
 =?utf-8?B?dUFkY3NsM0ZQcVF6KzZCcWNvSnB1blVOUHV5TWVicHlrZGt2MVA4YXZvbkhR?=
 =?utf-8?B?NE1HS29PZ1ZDUEs2ZHFSWE9HS2kveTEveHFsRHBEWW9Zd1Z2bjNtaFpORnpR?=
 =?utf-8?B?bk4xcTMvVDNkb0s2V2pUcTRCQmR3WDZyVGViQ20wVTFmUlp2TjlCNVRNTDA0?=
 =?utf-8?B?S3Y1cjhub2UzZksyZ2Nvb2tQZm1ud0o3N1VyTW80Myt1b3R6N2hwaFM0bEhI?=
 =?utf-8?B?Z1pUS2gvcW5XSld3WjZTeTlEOEtYNHYvZHBBblJ5VWFCYjBJNWc3UXJYRE9B?=
 =?utf-8?B?eGlGZ0w4Sm9OdEdIeGJYN2t5SFUrZUp5bkhZSmhjZXJPeUZXcmhPOXZ1ZDdT?=
 =?utf-8?B?ZkZSMUZwV3BQajAreUd5OTAwSGI1OGN0RmRPY2pPQkl6eitkZHkyR2U0R1VO?=
 =?utf-8?B?MFhMajRYOFA2cytGMUlkWTdGQlBYOXQzTzRKZE5vcmlLMnRDRXdYaVdXaEFj?=
 =?utf-8?B?OFZSa0piMllXQU1ORDhKTVZaUWJPZ0FhV2F0Q21rb1dsbE8zRlBpNjZ1YmY0?=
 =?utf-8?B?RndhUHo4aXcySHBDdnBVSHNycS9DNTBlQmdIaEpIYzZSVWZ2dUs4NFg2emhX?=
 =?utf-8?B?NmZqZS9uYzgzbnR6am9Jc2wxZ2VoancyaDRhek0wa3NBeFFmMlM0alNWMDRx?=
 =?utf-8?B?TUNyYklrZzc3eTIxOExWaEZrd3JQNmw3TUhPNTZlQUE4RG8wYk52aVJZb3RZ?=
 =?utf-8?B?blRJeGRYSzV2QlRkU1pyTjZQL2ZINEpJS2lzM2tlczFXTDl4WmN5dHFNSGlL?=
 =?utf-8?B?OHRvZSs5VnJuLzZESjlSMWkyQ0xXQUU3cG53ZW5RTlR5RHNTNC9JdWxqZ2Fw?=
 =?utf-8?B?SFZ4NXhvdmVyclk4UDBjcHFVR1ovQk5VQzIydHFLUlFLci81OW0zTmdZMFFI?=
 =?utf-8?B?bmg1RklONmg5elF4UTdSNTFseWRDcWkyaDdGdjdSM0pSM1FNSWFzeklMUGtU?=
 =?utf-8?B?K0VKVGtpRmsybTZrOHZYZTZCWXp4YWJ5azM5K2tUbGZOdml3U3NFZ1RJWWxI?=
 =?utf-8?B?dzRZSlEwRkNxYmtGdlFabVRUcXFjSjlZemIydEpDbU5QV0ZLUEZaZXhyTnRj?=
 =?utf-8?B?dWdLRkVoUnQ4YTltejhYQVprRG1mVzBkejl6U1BhcWV3VktLaGhtY1BFalNt?=
 =?utf-8?B?TThXNzV5dDNQVVRNOHpCRE1DZTVyb3JTcWNZSkxKdG85c0pUY3NSOHI3MjFm?=
 =?utf-8?B?TG1MckE5cVU0S2VaKzFtOTIrRE5WL2R2MEVWc08weEh3ZzJWMWRnV1V2VmN3?=
 =?utf-8?B?ZVJ5elpidmRZcWRUNGRVM0pOaWdoQTdubU80eFBqTzJkZUhkYnpyRlZnNEY4?=
 =?utf-8?B?d1JQVFV6c2VFZkFqUDV4d0hINXF1dXVEbXFFREJWeTM0Uk82bkZiQ29SUDlp?=
 =?utf-8?B?K2NkRXVpVWh2N1dEWmI3VGZhNForWVJDc1ZBUWVxWEhRRDEyQ0RSQVJCMWZu?=
 =?utf-8?B?djU0S2hZTkR5Y1FSR1F3TmJTOWdxUG9Ra1gwRjdzSXVLUHNJdEZnNnRHY0or?=
 =?utf-8?B?VHMzb1lTV0l1a1EvQ0lhSnVJbFo0ZmcxQnp3R3pEeCtnU1hiVjZBb1pKWFVP?=
 =?utf-8?B?WC9PblZmZTA4UjBML09kRGFZSVBkWjlmRE1RTEl6Nld5RFhXODV6Sm9tT0FT?=
 =?utf-8?B?RVVhWCtQWVB1SGpCY0twREd4Rm1mbC9vam5yaWpNaTFyUHo5TE16a2JDSzd2?=
 =?utf-8?Q?12OaDXwFHPv1T5WrWDd7HTn7F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66621a27-ab00-4799-a162-08dabcd1e576
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2022 12:58:11.1383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PI1AItca1gtYagYcJ5bCywhBL+ktau2SV7zKPUZ5OfDi8HULNP8qA7H8hT2yXm0GQFqZR8M4B6JewAvHvSUdQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7283

On 02.11.2022 12:28, Anthony PERARD wrote:
> Fixes: 81f559e97974 ("make error codes a formal part of the ABI")
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  xen/include/public/errno.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/include/public/errno.h b/xen/include/public/errno.h
> index 5c53af6af9..6bdc8c5079 100644
> --- a/xen/include/public/errno.h
> +++ b/xen/include/public/errno.h
> @@ -1,3 +1,5 @@
> +/* SPDX-License-Identifier: MIT */
> +
>  /*
>   * There are two expected ways of including this header.
>   *

Doesn't this require at least part of Stefano's "[PATCH v4 0/4] introduce
SPDX" as a prereq? I notice quite a few files already use leading SPDX
comments, but perhaps wrongly so without it being explained anywhere in
tree what this is about?

Jan

