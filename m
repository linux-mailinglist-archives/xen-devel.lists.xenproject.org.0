Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31B5557487
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:52:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354519.581663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HdG-000600-4r; Thu, 23 Jun 2022 07:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354519.581663; Thu, 23 Jun 2022 07:52:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4HdG-0005wY-0T; Thu, 23 Jun 2022 07:52:06 +0000
Received: by outflank-mailman (input) for mailman id 354519;
 Thu, 23 Jun 2022 07:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4HdE-0005wS-TN
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:52:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70087.outbound.protection.outlook.com [40.107.7.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5eed1459-f2c9-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 09:52:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB4719.eurprd04.prod.outlook.com (2603:10a6:803:61::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 07:52:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:52:00 +0000
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
X-Inumbo-ID: 5eed1459-f2c9-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RKpgxoybsXsYqp+YisPaVjpg8KHxJ/RBe/iywsOcEy1Ney0rohQyIoTBhgdVt/qC4yU6+b8i9GbNtVKJd2fEYe1EzYPjcvhRTPo/FcJ5oIK3WWzEMLGSyGINLAAvhuuZX3jZaMb7boB88hE268lmRLARDN5D/q38jRehT+uRPcsIZc6GhRKxojwJlF97wbNXEkcTyjr3PL0wiesm1jX2ZOFaYFymwDARe68SGLtU+2rm4BKe3dKJnwxuVWNvEznPFeAk3xQP9KGkT4P9CTR6jNr1EvuiqzQP+AC4y1jPRdPYun9nMHbUX8Qq1Mz3KCGjfqlAZirRqkLq4F3byNdmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8u46eZwMH4FPHFe6gHdQDzIJWbmFBrZxoBP7fCjuaII=;
 b=JKF4/pGCihD31viDJ1H8HyqSs0r5f/GHAyAzRt2L6H2/82psRXgULRCIfhrpxp91paoriAwcG9xvtIW1juWFG+J5gwCt9uQtKD3cB6qJ21/3gfsnBUV017AlOoVVRvlfh1I3QWg9I8z4cvNg71y+B5eWwo2a5l++Lyb+wxybD7PSwF8pq1C02Gtk04k9lLUWZfFng5vjdST/AFb/30noggjL8c6BMbWR0WS0uDmuC33mbHsK2XyLhA9YuZIuBq4KuNS02RFaNx5JtxuzZLGIBEJwbsMLodpW+Ck4KMs28mKsFbGfq4Ao6+YjRfqhrS25j2Yp2+a6x9pZZgKTwXN6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u46eZwMH4FPHFe6gHdQDzIJWbmFBrZxoBP7fCjuaII=;
 b=CXlp+NiMTzz3VUmYyfc+3UhwcGtU2TMBFb4uOq8F2zMkRDwHfV+LOioX131f4LbHdafQWFFAJbyBf9Z3cfwIVX+NLsMEiPOksms/KLc50sCepHEL9n/ImzuhM+qvTrHa6fav10Eks0KEhGiQGPKNEMn0RaD/ldtlW/7Vg/Ub7KtjgrVMEzDOvzJ9cPAyOfzaYrEZluUBkvWaHWgA+jKISL9v6pFglI03W2nGzy+XgBbueWuvghXMo2fYGHh0IQCiH4Tst5rrS8SyGhkzZ5VpWXkTjTXWKSv1Ifgg0GJoAjVvc8TMD4kbsupY9i92Z++PXn+B7qKexryJ7QEgeue+vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3e86d233-7c9a-cd80-a744-c4bdd42ac85c@suse.com>
Date: Thu, 23 Jun 2022 09:51:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/9] MISRA C 2012 8.1 rule fixes
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220620070245.77979-1-michal.orzel@arm.com>
 <dd016e82-2480-0e1e-6286-18b2f677dd65@suse.com>
 <74ec2158-3d19-3b2c-1e8c-fb5b30267658@arm.com>
 <d91bb4ea-41be-225e-e2fe-1b03aa06c677@suse.com>
 <C45BA6EE-6294-4C6F-ADC4-3DE7C8DA866F@arm.com>
 <68d7fb35-e4c5-e5d2-13a8-9ee1369e8dbe@suse.com>
 <BE80A241-7983-425F-9212-0957E29AA5C7@arm.com>
 <7a8d70e3-c331-426d-fe96-77bd65caade7@suse.com>
 <alpine.DEB.2.22.394.2206221212510.2157383@ubuntu-linux-20-04-desktop>
 <8610703e-fd15-bba1-3bb1-cfe038f9b11c@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8610703e-fd15-bba1-3bb1-cfe038f9b11c@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0083.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::24) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2032390-0297-4608-4cf0-08da54ed414c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4719:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB471971FC27B8E16F2D760310B3B59@VI1PR04MB4719.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	riHvIoATUlI86KhmQ7Ge172CbOG/hwGY+LgRJaQl5c0rhoMukhZnmqO/4nBvx9ofhpQ27Kwu3uNX+VxBdSe7tIvyTvi91kKR5i8v4bdbQXCkemrqPd1/+NqkEumGhoaotuBDuHNBkxqQ637ldv1j92Q9zIrC++HNJkuAf7gGVJ0IF/y9kXv4SzH7fum+KTxOV6Qr1Wa/g/fcjcCvN8g+Od/xv9QBOBtxJ1zTfChyKxyJwrNXVmS1WrmwUyKPvjbKkvnFvgr5HU6KPxRpZzh4EN4kDudX6VI8cAIf4P5dLqxe7O2l9PgNYzSv/x3XKR7l9e1wGhzrR9bzpRyXxNdF9+EPSNx2qmXtlMiJXGePS6CQgoQ8FJHsttApqb3ovD76SL6s6LyxEs4RwhdeH1o4mTMCE3+zBqfSXfce4f5WX4CgWOSmVZ5OFtKkbIqErYrVoBZJR9UKYN5abdhaVX3tvFpz8am+FsRp4hJaUTbzp8t/gvspxPMGnW1B/n/CuDUDzLJ7D8piMWcqv7nzJvHjk7ffuTFm72Y8jvrjx5JJY48ow3DgTgSDxs7lbo98UBFnT0eq5huOCO+smTA6LkgODubaSGHY8idikYBdwvLsY4Sno0cHCNwm8piUw57CL6zwjfWYcBIpKSfEyvIT9GmyfCOPOduNjbcp3+FJ/ac9+JBXIkeFZhiR6JREpCRamlIzzQAgHOAtgGDEfUy2G8HYepHvmYtcJo01yQIDRXLVtLEZcJxlnFO++9bVf4pA6Wtc6oyca8u1j1QwNoDuTsH+FfQ8psoq9KiV0A77h/++T7Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(396003)(39860400002)(346002)(2616005)(6916009)(54906003)(8936002)(31696002)(316002)(8676002)(66476007)(4326008)(66946007)(6512007)(38100700002)(41300700001)(86362001)(66556008)(53546011)(6506007)(26005)(6486002)(478600001)(36756003)(31686004)(2906002)(186003)(7416002)(5660300002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU14THNUcTFHblNIT1U3anNza210RTZCYkxTOGVqOE95OUVjbjJXcjlERTJO?=
 =?utf-8?B?R3A2a295N1drek5iRVoxM0tvVTI5VkFneFNLdzVYV2VtdjdTeFZqVHREWUJw?=
 =?utf-8?B?OGZWRjhJZmVVOEtwaG5ORFNoZ0wyNWQwckZ6UzRVY1p0UThkQzROM1l4Q1pz?=
 =?utf-8?B?MkpnMEhzdDdJT3J0bzc4dlNDODE0OHdoSjJIVjV0UTZmTk5MYXVSa3NhemtD?=
 =?utf-8?B?WW1EMThZbDBYdnVIYW1BQ2pncnZGdzY5MjFYdUhPQkVFcHJ1Rm51NkxBRG1B?=
 =?utf-8?B?a1RqVXdWZFEyMU5OMFVidmZjbWJiZVNsNDVoTThCM3czOXllaGY2azNKSkhl?=
 =?utf-8?B?K1hWQ3NZUHRRUUNCaEQzRWx1ZkRCWjA3eVJFeVBBNU83SCswb29Ec1BuN0R2?=
 =?utf-8?B?bkhWUHlpbFp1Vk8vb0ZzbUJrT3BMWHV1MGNwNWxid3dFN2ZHNlVTQnFqRnl1?=
 =?utf-8?B?V2x4T0UxUm4wMlVuMWRFYW5DSElINEtpY3lmM0VMMHdJYlRFZ0d2YUNGYkxV?=
 =?utf-8?B?S1N6aVBSMnJnR3YvTXF3eEdiMVlDejIvb24zRVcrd2k5blFsblEwWlIwRGt0?=
 =?utf-8?B?aHRkSDBFb1FuTTl3bHlwcEVLSkRlTVp4cnQ1TTR1UXR2Vi9XRjUyWU5yRGx5?=
 =?utf-8?B?TjdDaWwxdkszRmJRYWkvZVcyYjV5YkZ5Z25RT3ZJcEJFb2t6TnF3d2I0NHUv?=
 =?utf-8?B?bnRTMTNHSmNsY2F4ZlNnSFAvOHhXZVVmNTJXVmVEMnNWZjZmZVI5WVpXcFZp?=
 =?utf-8?B?RERCN3ZnQklnLzlEbnBrdUhwbTVIV1lpQ2wrOUQ5Z25XZkgvUkEvZGhPNysr?=
 =?utf-8?B?dnFyWm8yWUZFTXlXTUpDNzJqUlZYUGJJT1JxTi92Y0pEelpRODBVUExiSEp6?=
 =?utf-8?B?NmdHbjZFNmhraUFQSFpCUGtKRWthSFZROWlUekNMclpxZlFJMUt4QUF2YWU2?=
 =?utf-8?B?ekJ4NWxSQy9OdWhiRGE1MnZ0K3lRRkJiZEthcGJvb0xQUUtpYWFOb2E1emY4?=
 =?utf-8?B?bFFHc0xJNGZJN2tnalR2ejJEaXN2OWxJbS9vTDJSZkt3WVJRc1MyQXNsQ3ds?=
 =?utf-8?B?RVd0eUxtSUpoWlJnUndXc1FoUnJ4c0NkQXJyV3NJbUN3QjU4MFhORjkrSW12?=
 =?utf-8?B?elR5YXdPK2pxRmFzOEJZbUlOaW5QSVJvSHRTWkhTekdGZkhHdzlFV1FhNC9x?=
 =?utf-8?B?VHdIcXN5cS9vZGl1a1ovd2FubFF6ZkpPb1dEZmgzdmpCa1ZqVll2N2hMelZH?=
 =?utf-8?B?WDZodExIVGQzbVBWbVl0bWE3b0VJZllpOTVNRUt2ekcyQlJsREpXbjYxODBP?=
 =?utf-8?B?VHpjd1IyMURuTzIwMi9rYi9udDZMMXNsYWZJTklwVnZmWkRBVU1aZURqY2xC?=
 =?utf-8?B?ZThGb0FKdFJhdWJDTGtCVFJWanBBR0ZtY21YekNkU2M2czdudUNlWkpoVGhs?=
 =?utf-8?B?QWNHWDRJMTRzcmpBekY4bE1SZmkyVEU3ZGpuczRsU0FuS3p2RDJrbmtXUW5O?=
 =?utf-8?B?d2xvQ1JxZlpaWlBkOEFMOG9qQzhJVkVmSDNESlF3UUQ4dXVzd2hYODNQNlAv?=
 =?utf-8?B?YkozRkl6aStHNys2Rlc5RGNld2NLc1IvYTdHSm95a0kwNy9ISkQ4VSsyNzI4?=
 =?utf-8?B?bWlKTWZINEZFU0cyczhTTnp0Mi9NclJ3QkNuMnVqMEFtWFpXcXRGTGJLeUtD?=
 =?utf-8?B?aWFVYVo4OWp2Z0Y1L3lvYWJhZnEreGtrUkJzbVFDRk5YcFBLcVFvL0JrNjl3?=
 =?utf-8?B?VzE2dVlla1ZkanRDL0R0cEhGekdHazdBRnRCbUpNNkJ3WXNmdENvSjVBUVJo?=
 =?utf-8?B?aUNpSGE4bkhMTWVISzFPSVB2T3pmY1l4TGRLSldER1FnWWltOVhJQmlUTlRl?=
 =?utf-8?B?NVozeWlEZDl5cmo1SS8xTDVSb1lRc2NPdGE3cUlyMUdBWmNBNE5mQjhGQzJO?=
 =?utf-8?B?bVVaNVB4d01qRGY1dCtEdHdDc2pmMmJTQ2luS3Nod3pEK2IyQ255aHoyVjRq?=
 =?utf-8?B?d2pOeDlMOGFkTVROUVBSQ1BPaVFxOExSeHNkM2NaRHJmYzcrbDU4WmZxK2Zn?=
 =?utf-8?B?Z1p4R1hPUXhaYWkxM2pDTkhQdDAvVCtnRHljQ0cxV1E2bWlXN2ordEhLV1Uz?=
 =?utf-8?Q?luBYBiTxBlnDlz8sdNbrEWnI0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2032390-0297-4608-4cf0-08da54ed414c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:52:00.7410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYD9iPbdBhZBsJs7c7+oTbNK0KAm8BQxKt828/e7ipDjK4iuhCO+EBxIjW8gogecWWmNY1HlO2DqfGXKFaffwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4719

On 23.06.2022 09:37, Roberto Bagnara wrote:
> Rule 8.1 only applies to C90 code, as all the violating instances are
> syntax errors in C99 and later versions of the language.  So,
> the following line does not contain a violation of Rule 8.1:
> 
>      unsigned x;
> 
> It does contain a violation of Directive 4.6, though, whose correct
> handling depends on the intention (uint32_t, uin64_t, size_t, ...).

Interesting - this goes straight against a rule we have set in
./CODING_STYLE. I'm also puzzled by you including size_t in your list
of examples, when the spec doesn't. The sole "goal" of the directive
(which is advisory only anyway) is to be able to determine allocation
size. size_t size, however, varies as much as short, int, long, etc
do.

Jan

