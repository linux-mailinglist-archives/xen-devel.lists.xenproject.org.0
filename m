Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9847857A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 08:16:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248427.428536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7TS-00017O-6c; Fri, 17 Dec 2021 07:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248427.428536; Fri, 17 Dec 2021 07:16:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my7TS-00015E-2T; Fri, 17 Dec 2021 07:16:14 +0000
Received: by outflank-mailman (input) for mailman id 248427;
 Fri, 17 Dec 2021 07:16:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zqed=RC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1my7TQ-000158-J5
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 07:16:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367dec9d-5f09-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 08:16:11 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-UR5Q7ZVrOM6Ql92KhlkJCQ-2; Fri, 17 Dec 2021 08:16:10 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 07:16:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.016; Fri, 17 Dec 2021
 07:16:08 +0000
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
X-Inumbo-ID: 367dec9d-5f09-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639725371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+cgXeaQYlj9zBzYETpbHa1RaUsPD+c7C14MJa0nUwH4=;
	b=Mw0zKg7Tg5NK0GJLiSPcDl8FMFizQ4W0FXGKKI9BkQoX7eNakyBvCVjAQVgLTTKVpaNlXr
	TVNbIHAJEb1yh/EIdq5dJJ7vEsF+R0rN64iPRlW6uQ/ZC7pFiSRh/tLaIACawTESgxt8v0
	Z1+lO9OX/PhKduIHk6VyTqMosLJdJGw=
X-MC-Unique: UR5Q7ZVrOM6Ql92KhlkJCQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwfu59WMYBhZ8xUB5pqkrCocKsHFwE71lFmPf8OHXpR8wfJmrRUDQzVgKvcdU+yjyWQ4sM3twOgw9pEFssSST4QXQXJCk+/4brgg2BSX/VxXtvTSLYu1NWmpTzMSJi58uJq61La8UaZgBw6SxtU0YB4evYIl5eum5bEQpkqsr5k4YIf9oGr80XhVyLtAgxtMUIDn60lZlRB+qzEz2SjcMGWjMGPGfX9CWSzhJ1O1p3upDrWtYd5aYFa9/digxW9abD38essikVkOeJ0mNvIr8Tt6jx1DBdjhgXNPjBL1apgNhzaawiuvjRQE2MTYq29i/9Oku0QlO2T7DN6mb0FU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cgXeaQYlj9zBzYETpbHa1RaUsPD+c7C14MJa0nUwH4=;
 b=Bzxtn3VAuGRUdy4IxysnbAmN5g0oFY1Xh3TciV7Ycy0D++cTeLVmZex8An7fWor9vT1mL9HTspKpZmOyHVQPIn/iKK5gDW05NK/E79ErDbJkydssRurRKksx4FnukfvjVxJwGwfQrHRedZz7cv/YVakrojFAZ2eCFlT0UXvZcloxXT+XRimY067C4/GmEZLja/BJqHoGFjhY46RlNxb1BnzzlpT2D1yNqGYHrT9RR3I8vZVZqNoaISmZ75z+aJnmRJjcEGSmw111Nr5vFY+EWXepyiQ8eJP7j4TtbbT+bvWtqELwTCTZLX45fMkgj+8bMnG2tr2KzN8BGZGiLAqlvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e86974f6-dde3-20dc-1748-962d9122a05e@suse.com>
Date: Fri, 17 Dec 2021 08:16:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC v1 5/5] xen/arm: add SCI mediator support for DomUs
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
 <5876e66a-9a12-6a69-989f-a5ba6709886c@suse.com>
 <20211216173625.GA3623693@EPUAKYIW015D>
 <08488d6e-3bb5-71e3-2e07-aafb912d69f5@suse.com>
In-Reply-To: <08488d6e-3bb5-71e3-2e07-aafb912d69f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0026.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fcd049e-d788-4488-f9e7-08d9c12d18a2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445CCF674D84F863385318CB3789@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Zq5kQDBJMXE5pqtX6OMD6eT5nJ2KJ6KtRBcC9tfIppRbX91SCKW0l08EDQhHd3Qs92AbA8xWM3wB59VXBLO7snrfX5PzeCjNp4w3BVRSHAL4TIJ5efI4ZpBsqfoy5+l7v5Ihe6XBcrREVliiZCufDqblt8e0+mQUcEkMwVapsQofN1S30h1l0kIB1SozUoPPD1e0sLG+m8hTLZSahNDYr/5AaD0R2xsK2cgBSlvxLwzYOEzcARgwFVwuLZibU/4S0gtIMVCHGWkEgdYzaey99XujMXqUwwBPDc02k6SvBN0J1rkEixc4nWVLVBDTc4186B61j7z9ANh8Cuh9XPuihWeh4eJ8ljAB077xovBTDWXAePcX1YcA2WPctydGGVijJabFVeEgi55jp1TrNkZ54HERv1Ycr1PMkhW4iQxBu+pdGkyOqa69BHAeFfQmL664nMMsgYSIY9HrhpfyRjZBL1utwmuokxJGgyYL17/WV8IQxlYqNP9nIPa4YC6e6DTlnypNFa6V2TjTYcSt0fpXq7VrPFRONh1pfzivDfe/1mc9SLys/Z4T8jek6qWV5tvViTyJQN/ErrgRZUs8ag02GckAJSrQ6lwOx0ngb7igshASLOnXbbE25R8svXzRGYHKueLIIvgAkVfBj3RwPOglkEXkjcuTqADzJtkU3QwZ/xPCD5H7c+TPVVO1Yf9awITKG3ySkT4rh8umDdwmiMsWX5I45m6TCY7dRbkuEEdsNh1YmTJhIVvZMVap85Lco3WM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(8936002)(8676002)(2616005)(7416002)(6916009)(4326008)(2906002)(316002)(86362001)(53546011)(6486002)(6506007)(6512007)(66946007)(66556008)(66476007)(6666004)(5660300002)(31686004)(36756003)(38100700002)(83380400001)(26005)(54906003)(186003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ykt1bzBEZmY4Z0FwVURKeFo2NUtZR2hPK0ptdjZlVmpVa1NuMUJzbExPTUtq?=
 =?utf-8?B?WlJGMVdMSjg1Q3pNVHRZZG14cmhhUE41VjUxKzFsOTdOaGdqblEwejRIT1Bq?=
 =?utf-8?B?MWpvUjZWVzAzYTVjWGVvNHVmYytzN0p5Z1paLzNGTXg2K1lwS0hFUlpjTmVt?=
 =?utf-8?B?SUltUzdvNDY0eEE1WHo2VHY3dXVJVkgvU3psemFzVUFEeG9ieURnd01pWmw0?=
 =?utf-8?B?dzBSU1JPdHlGc216Z2MyYStKMDJMT2FiUTBBY2RKTVd4bmtXVkJvSnowdEs1?=
 =?utf-8?B?eVF6VkI1RWRnSitEbk5ERmxzN3VqWEM0bVplZUlXMEdmK050U0FiNWJwaCs3?=
 =?utf-8?B?c1crc200d0dlemZpWitocUJpU0VMK0kvVHdoM2lBWHdOZjhUa3E4MDhKYXRO?=
 =?utf-8?B?V2FJZjM3THFNeGNvODhMcmVNdU9yTTZUVHE3cUhpQytVMUI5WGlHNjlScy83?=
 =?utf-8?B?a3psRS81cnY4MjB6cjFXQWxKOUZBMWhnN1NoWUpkSWVmV2kwR1VOWmcwczVY?=
 =?utf-8?B?b0JzNWovZlg3bElQUUIvZTVFVFloQTZZaU9qZUJSb1NjbzdkRFlzeXNmb0N6?=
 =?utf-8?B?VVI4T1FHa3ArMUV5M0FTclBETy9YN2ZESU5ldjYvRGc5a1dxVlE2c3hyeVJ5?=
 =?utf-8?B?VG1CMUxiMkJzNE1pR0w5N2pscFl4Qit2ZW5kVjg3VXBXVDFhenpqSTZVS3N2?=
 =?utf-8?B?OWVTLzZQa2UvbDRmRXBzRXNEaFc3V0lwSVFKR1c0cWtjelRSUUxCNm9LOFBk?=
 =?utf-8?B?SmJWWVZWbE9MWStlNG5uajlRL2lBa3htNkwxd2xJdVJtcmVYMDVzRm9VSU1C?=
 =?utf-8?B?QldOQ1RrV204dGRZOEhncmRDNUZ0R3RWYVUwRWRJc2ZGb3R3YlJTYmxTU2ov?=
 =?utf-8?B?c1ErZjdjOFlYQ1ZSZUdLZkc1cEdybGVOckgzZjQ2Nm9TWkVTQ0R5SnAzd2ZR?=
 =?utf-8?B?NWhPWnZTRXcxcmU1SzlDMStObmZ4bkJuWHFQMTdTR3JoTk5ob1hHSjNleFFp?=
 =?utf-8?B?cUdVOUxaRXc2L3FNZHFpRkZOYzYzSGxjb1V2NmNvYVVnM1VDQ0d0azY4VmJN?=
 =?utf-8?B?VWw3bHNQZTlMUGZTNkhYZlRyTS93dW9DWGpRT05CcjJDNWllQ2VwNXVoRm5M?=
 =?utf-8?B?YkxoMEQ2VWwvcklUU0NTN1dmVm5lcXcvNWJyWERWYzMxbWZVSlhXOTY3UTVs?=
 =?utf-8?B?UGxpb2hhZGFzbUFsUG56aC93VUhaZ3JneXJ1YjZ6cys0RXJIUGlYNnZDSkFL?=
 =?utf-8?B?a0pNb1lTVnMxYUVzS2ZEU0FtdlRJV0ZDUWQrbXhDRTBqTTlTcm1LVHcwbDU0?=
 =?utf-8?B?RThGbTg5TVlHN2U1dDJiRndYNnJxbFZaMmp0L0dqdGgwVVNVczVNSEJGS20v?=
 =?utf-8?B?ZkJLYUdIOTRIenBReHI3UFJuNjFmY2RFT0N3OEY0WVVVTmxLTE0reE5BQlpx?=
 =?utf-8?B?SUhwVW1sMVNOYXVoL1MxRGlDOXhkbjJzbVU2VHEyNmZiamxCVndBTnlsWXF2?=
 =?utf-8?B?NnVZcUZqc0ljZStHSWIxWjdoaEhRL0FlRk45ZG02cVE1NFBCYjY3Y1I4NmVz?=
 =?utf-8?B?UXV6WGE1TUdBSkc5MEpwZlR0dURCZmRrTUNBTnZOc2E4ZGw3UEpiQUtJMTF5?=
 =?utf-8?B?R2pMeFFqeEpiRzM1SE11NDM5NFcvK0hiWFdndDk3aE9TK0lQR1Ryci92aGFw?=
 =?utf-8?B?U1htNTc4aWQxVWhyVEpzU0R3RUJLSFM1U0I0UWxWU0xXWEpnSjU3eWNDRnRN?=
 =?utf-8?B?dWhTVlo0dkw4eTlQOW1nTXcxZmJZL3lqWXJQcHhNU0diM3N2eGtWTEd1cWM5?=
 =?utf-8?B?aXZEOTlldHozbjhzRSsvd0RuTk55WlRWWWtnY05sdnZZWFU2L0lkbTRwbjds?=
 =?utf-8?B?MVovc1ArOEU0aXhqc2NxNzdVMUU4T0dMV1B0RXgrYkw1clpqQkIzSWw5djRi?=
 =?utf-8?B?S1lkQ09ndjh5MVNBOGY3SFo2QnpPeTBlb010Y0RONFRwTXNza3JtbDVFcFNa?=
 =?utf-8?B?MGM1WGxDaXlIRFd4QnJvR28vRzlOTG1MUjNDTTZnRmFjUytmeHNoK1ZJOHZn?=
 =?utf-8?B?ck9FNFFQbVZGQldEUitKck5wa0kwaUdUMGk3Y1RqaHBHNjRlZDlXVUZYWFZT?=
 =?utf-8?B?MXlwNWNCQ0ViZ1RXdE9OTFpxSGJicW9jS2FCd1pFdzdNRHFNc21meDBRWlU4?=
 =?utf-8?Q?1Xy21ZkbDAO5+NUNn3Bpc5Q=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fcd049e-d788-4488-f9e7-08d9c12d18a2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 07:16:08.1338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QYaVCqTZPOj3be3WzLQOybhhqj/uHTQEDQnguwh8LXqrKQ7RmWbSA9mssMy9YK87cAEWFOyHCUWgu+MJZUsEpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 17.12.2021 08:12, Jan Beulich wrote:
> On 16.12.2021 18:36, Oleksii Moisieiev wrote:
>> On Tue, Dec 14, 2021 at 10:41:30AM +0100, Jan Beulich wrote:
>>> On 14.12.2021 10:34, Oleksii Moisieiev wrote:
>>>> --- a/xen/include/public/domctl.h
>>>> +++ b/xen/include/public/domctl.h
>>>> @@ -1177,6 +1177,13 @@ struct xen_domctl_vmtrace_op {
>>>>  #define XEN_DOMCTL_vmtrace_get_option         5
>>>>  #define XEN_DOMCTL_vmtrace_set_option         6
>>>>  };
>>>> +
>>>> +/* XEN_DOMCTL_add_sci_device: set sci device permissions */
>>>> +struct xen_domctl_sci_device_op {
>>>> +    uint32_t size; /* Length of the path */
>>>> +    XEN_GUEST_HANDLE_64(char) path; /* path to the device tree node */
>>>> +};
>>>
>>> This being - aiui - Arm-only, please enclose it by respective #if,
>>> just like we do for certain x86-only ops.
>>>
>>
>> I agree. I will add #ifdefs in v2.
>>
>>> I'm further afraid the term "SCI" is ambiguous with ACPI's System
>>> Control Interrupt, so there's some further tag needed in the names
>>> used here.
>>>
>>
>> Thank you for remark. I'm thinking about SC as System Control.
>> What do you think?
> 
> I guess "SC" could even more so stand for various things. Even the
> spelled out "System Control" looks overly generic. If this isn't
> Arm-specific (in which case adding "arm" into the name might at least
> help the situation a little), then I guess some further disambiguation
> is going to be wanted. Since I don't know any of the context of this,
> I'm afraid you're in a far better position than me to come up with a
> non-ambiguous name.

Actually, looking at the title again - any reason not to add "mediator"
into the name? While I have no idea whether there could be other
mediators with an ambiguous acronym, this would at least address the
ACPI related concern (I don't expect anything mediator-like to appear
there, but then again I might be wrong).

Jan


