Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA5E7AAC9E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 10:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606776.944806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbXK-0007fE-Hv; Fri, 22 Sep 2023 08:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606776.944806; Fri, 22 Sep 2023 08:29:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjbXK-0007cq-F8; Fri, 22 Sep 2023 08:29:18 +0000
Received: by outflank-mailman (input) for mailman id 606776;
 Fri, 22 Sep 2023 08:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qjbXI-0007ck-UD
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 08:29:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7d00::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d585733-5922-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 10:29:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7678.eurprd04.prod.outlook.com (2603:10a6:102:ec::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 08:29:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 08:29:13 +0000
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
X-Inumbo-ID: 1d585733-5922-11ee-878a-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6/wFs7EovzFkriHC48sLYniip3PBA0w3QwA/t/Q0qyS0z1ILw23n/CmZRCXHgRIavran/kl+/De168v3ak/05uPilZ7hd8atCvlyac8Vmdp2IFgkb7k4WO2RJNVqsSd88zzwUbEQ/G11O7dUUacIBWR7OS56jUrnp+dK+/bU2YC2zFEirq+KvJgOrA2KhED5rErINPlaiRP2kDsf9EuizaO6FpmJ5yK6hjJeUT0WD0MIZcvOrb4UAW43VPgXWMSknvYHMHsFjoFSCPltq0POe7M2JN9S0+OPJmz/7+zDDVAfSSiaj9vwF424hgCcUM4l4YY5wQ4r7X4CTN38Iy+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbz9ElN/mDGzWPVcjYZpu8p/NaR/gc34RAT5U5elxLw=;
 b=aWC0+lehC1lxtyM4gbDC8la7Pqqp+RNi1QyBb8nl5YxHVq+a4s5ypAiTNkrsjcl5KbxEuDrhnyX3sKQt2bhEx/DJbYtV3q+AOW/7Amtqjy9R3lMTb5EFr9PlHUH1V0BUY+QpqgduRV94jPjHCvfWnoRkR2sZ1T4ubN4X8DxqBLfe92FlxrnxctRNVMMIOnZPMfHzUx7YVD3HXhICc12otU5xTqjiADtWqMrilsuyDb5umZrZ6T4qM59wV9LFOoWbG1mGAVe6aN+DmonlIcctkJq2gkI2tdWkvu1Waquyhr9sE3o7zxnNxf/ZcAaAKBJW9TYNkvzO7M35gy9HLLPFiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbz9ElN/mDGzWPVcjYZpu8p/NaR/gc34RAT5U5elxLw=;
 b=XxtvCep6Myfc/d3nq/rpc+CSAwdCBvADi5htY1xPAlt7hDRvWb3oiyvN7xW85LjWlTnzLgHDLfMImJwhrWq0tk4r3wNLRtyPil3SwGi7TAyJLjTm7l4m8WJq8xUOFjHtWDpZeen1hV2Ym3dEyubKbZgmajPbvrQFBPutc8P+SR7C2+pzbgtdlp48kvHaznAXXL7G1ENx4sZb0oWCBZmUDNlT60SuPGFHS3Ohe3TVG8sG8GeWK/lniU0Lt7bN0Dd/Vj7dXB2mzHJNWpzdJ4fN7oZNCRdJrISfAvgFhYDXZ2A9wbMg9n/X/iDKOPXosFlYeV6bWBA4te/TRD5mcHybuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0801b6f4-85d8-d10b-1f03-18201641e8f2@suse.com>
Date: Fri, 22 Sep 2023 10:29:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/emul-i8254: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <be245ab9b3805cdb1ba93695b95eeab24d432d6a.1695308350.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <be245ab9b3805cdb1ba93695b95eeab24d432d6a.1695308350.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7678:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d72e7b-da62-4e1f-55b4-08dbbb460044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lBDcnqCBvRph++96NsdrYKvlpjyFOtxFiT9itGEj/tqeHdRhbWFtkzv7JAxgvNcMEEeHRRnG4SrW6p4Cv/ZIBNnu8G0tZZfz9Fyd9PQVI9/Zo0DJy5eYsFYlhXM+wg4ytJQukDX73osBs2/LH8cGZZQX4cLP5Hm55Jrln6lfGSzKFbqj3/Bxp77HfhRJFFUXuJiIoUUQbiSeJNk5jgcr7GqEThAguOS41P/0MmZCs8ltBYCpnoXMpoHxjy0zmwe20OrLOiLONJi+0YKtSJsVpksyYweLo4ax/kXlRGOI9UsZpWO6ov58vR+HWVwwsCovl6I15q8RhXdHh7wGDwNCtlobfjul1YoOn2/Gyv3fgRm/dyOzMU1X3aGHI2EdQFpEMyAoI22HTAhJFc6LL2SoBLKPkNuIq4YSh+bhi89oqvCFq85cDI1Ldjx+o2IB2fmxF43omBsvzxAWbX79jIyhgNleEU1uCI8v6/w65LiQJGzwlAxeuZr7GOzYPn0fC9BkiwJ//lsPDlDuTsvJjCo/s2qreWLpR9lAVcbWQi8fsY4YILVlYWqfc/WKy3Xhy0DRo/SQPMQFxgH29oHYXPFHEBx5BfAHbJQwyKmPIvnOoLh4vwtGy2KeB7n+3f3kOWkNd+CMAWB8fbS+ZLjEwMViRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199024)(186009)(1800799009)(53546011)(31686004)(2906002)(54906003)(66946007)(316002)(6916009)(66556008)(66476007)(6506007)(478600001)(38100700002)(6666004)(6486002)(2616005)(4326008)(6512007)(8936002)(8676002)(41300700001)(26005)(5660300002)(83380400001)(36756003)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUZReUJxOEtsZjB6NldEUEZ0SEJiKzhRMW9zSjJ5WVc5STEyZjVxUVY4SDFI?=
 =?utf-8?B?YTNvUldBdmRFdzdLNXJzNjdtakxsQ0ZDR0locEdFZ1JDR012UVFqNzgxK29o?=
 =?utf-8?B?dWE0T1QweDRMNkdOdWlkMkcvOE91d0tpblFUa3VxSy9QMzFYNG9zWW1IYktw?=
 =?utf-8?B?YTRCdUp0Ykd6b1NRR01lVEFLWUVHdjFYWHg3bzF6YjBCZFgwRVNJb1o4QjNt?=
 =?utf-8?B?eXM0Z0RDc3JjODhWWTduQU9Wek90Rlp3b2t0RjdJU3VyOU44c3M0U1c1cXBm?=
 =?utf-8?B?MDVDcFFtUUMyOTh5MDFRR0p1VVVKU0Z5d1VVN1VrMFNuU05lV3p6bnQ5ZXVx?=
 =?utf-8?B?cEo5L0J6Nm9pN1Y3VXY1VXhEaDRsRXBVQWdacno2Sk9ZUWlHRC9abGpicjBC?=
 =?utf-8?B?Sk42OWdyeWdoOWJ6Ujd0NVBKbFozQm9TTjRJVUNNck5McG54TnIydTRSOUU1?=
 =?utf-8?B?QmNxai9rRG5hSEdrNmdOTE9XN1o1NGZkaHFGWDRCcWMrN08vQzQxR1c3QWtS?=
 =?utf-8?B?bEhkZ1BIYkN6L3lEaGJwbElnRERVK2FxekJrdXVyeFptOXJocXF3czdTdXRl?=
 =?utf-8?B?UXA2WmkyQm9JK2JpRExkb2RlWGVadWJHQmgvcmk1dFNydUFqclhxM0FFcDZx?=
 =?utf-8?B?Y3YzL0hvejVFcXQyS1I1d0hXSUkzYnVSdmwxQ3Q3LzgvSjBZVmthOTdFbXZh?=
 =?utf-8?B?TG5LQXJJblpvMU5ReFlEL24wc256QnNzUGpGd1VWUGtieU5rOSswSG9ldW16?=
 =?utf-8?B?aTFqNDF1dTlQZlpzQjAyU3JWRFNlM2loWTVJYkkvNmdvYmRuQ0FQN1NCUzVJ?=
 =?utf-8?B?R2tqODF0ZE10UXphTVd3My84MlpJYURXWExhQXNBWU13cnQ4bk5jblNaNzJO?=
 =?utf-8?B?RHR6bHBkRVAwaTJWY1Vkd2t3d3VmYmJENG5WZzlNNjIzMDBhdERUSFlvUXd0?=
 =?utf-8?B?ZDFWRzJlVFRKUFIrUTRRVkgwck5iTWJxaDRva015dVpsNE9WY0RrZjMxa21z?=
 =?utf-8?B?UFRBYnUrNlpIRnJhOGh4b1hRT0YxSHpKNG9JMXpaWElrVHBkeHFoUkJHWUtt?=
 =?utf-8?B?em9tZ3g3d3JRMytNY05hMlBhUzV6M1pWa1B5OU9ydGJ0K3MvM3RnWDg1QXFu?=
 =?utf-8?B?TkhsakdtQTVCV25YaWVlRWhEVWpZUFVJTjR6QTN4VktQZUI2bkN3YWZMSSt5?=
 =?utf-8?B?Mm90bE44cVhQWUNvN1ZRcHgwNkdpbERwdk51UHFlbEFiVjJObGZxR3NINjBR?=
 =?utf-8?B?YUljNFA5ZG1NUURsNE5SaURkd2duSVdHbWxvWUFlT1pTK1JRdDJlUHNON2JO?=
 =?utf-8?B?Wlg4cHlWZUErZm9zaXI4RFB4L0d0QXNrOWxHdWVkYXlLVWJDK2cwYWRrN1Vw?=
 =?utf-8?B?QmpNQVBITk9jRzBUNkMraXlBUVFNYjNIdW4xNXUyY2FtR0MwaGdnYUgycWFr?=
 =?utf-8?B?cWkwejBvZWpVUWhDcjV1cS9wbkxrQWo2WkdGRFpHc1JCNklFM1lKOGgwaHAv?=
 =?utf-8?B?cHlBaDRUckZ0M3J4UmhmU3VMV0lDVU1IREZUQnIxS0ZPVFZwRndYWGs5NTVv?=
 =?utf-8?B?dEJ0eDJFRmNBU25ONGREL1FwUVdmZ016WW5MeGFCcHJaaWp6V25aSVlqWGgx?=
 =?utf-8?B?SUVSS1lxRE53Y3RXSWdDenV6cEoybWNTa3J3dWdtWUJSV1lreGh2V3IyTkFB?=
 =?utf-8?B?YThwQStJN3hzbEwveno1b2JYK1ZRT2d4S1ZhZjVpbkhBbHhWQ1k3OU1GWjU1?=
 =?utf-8?B?ZURJT1VUYWxNUytmWlhINzI4S0wvZ0kvRHh6UlJxSUd0T2dkV0o1RVM4MTRu?=
 =?utf-8?B?eWJhdVAvLzkydnc4NmR5WlkzS25VRjVzZlBKT0JWTWVXTy9XMXhodStPRHhX?=
 =?utf-8?B?OEZnTk9IaXpxeHk3MVFRdVFlRDE5ejZnNWtqSjRHdHdvVGdTdFhmVFI2NGhU?=
 =?utf-8?B?UDZHd0w3VjlVeGQxenNYY0puRnVZZTFEV3VpS00yaUVITUxDelpTSjNObXhy?=
 =?utf-8?B?bzArMHp1c0dIVzVUUzBRNHhzRk45U2xGRzRMY0xZdEtDQWowK1hnMUNSWmxI?=
 =?utf-8?B?N0RuUklUR3VkRGFCeURMdXM1bHJob0NlQlBQb2d4MWxwajJpbmZuL3IwUnJO?=
 =?utf-8?Q?M5aqnBjCOr3m9EVMMlZ2Q80bs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d72e7b-da62-4e1f-55b4-08dbbb460044
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 08:29:13.0861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wekbg0CNkzec9Me8C/FWRgVscnpylPjka5AZJmMdXm0Vf3QuEIA13z7T90TLilsJsUGS4rzTg50rAX43tYL0fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7678

On 21.09.2023 17:05, Federico Serafini wrote:
> Make function declaration and definition consistent.
> No fuctional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/emul-i8254.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
> index 41ec4a1ef1..c48a3606a2 100644
> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -572,7 +572,7 @@ static uint32_t speaker_ioport_read(
>  }
>  
>  static int cf_check handle_speaker_io(
> -    int dir, unsigned int port, uint32_t bytes, uint32_t *val)
> +    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
>  {
>      struct PITState *vpit = vcpu_vpit(current);
>  

While okay-ish, could I talk you into addressing the problem at its root,
by eliminating the two forward declarations? Afaict all it takes is to
move pit_init() down past the two functions it takes the address of. (Of
course at that point it may want considering whether to keep
pit_{,de}init() and pit_reset() close together.)

Jan

