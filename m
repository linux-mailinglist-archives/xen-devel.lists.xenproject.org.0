Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 916E85FEC31
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 11:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422642.668807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHRK-0004ea-SQ; Fri, 14 Oct 2022 09:57:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422642.668807; Fri, 14 Oct 2022 09:57:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojHRK-0004cA-PO; Fri, 14 Oct 2022 09:57:14 +0000
Received: by outflank-mailman (input) for mailman id 422642;
 Fri, 14 Oct 2022 09:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+Di=2P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ojHRI-0004c4-Oe
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 09:57:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 924f9dff-4ba6-11ed-8fd0-01056ac49cbb;
 Fri, 14 Oct 2022 11:57:11 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 09:57:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 09:57:05 +0000
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
X-Inumbo-ID: 924f9dff-4ba6-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jGlYY9MpyJ+gor9nnYYsDU4JisuEY5r0b51D18fUSa525OCkCN4brY0S8n/EfKE4mEhwtjLBkqnVGbuV2YtG1mj/Qgqntrfkdbf31unaURYLNYQOHkLO2juwVdBIneXSAnv/kv67o+09ucKmtylREMwFmRRaIYhGi01VQHdSUpC7Ux+bBhfV1FWns44jV7cIQDU0BYpqwPzm6FXYYUuArEAHf3zM2bhQlh0PgesffstN8EAsepkRYX9iLe8VJ0EmeAweUdh77s84+Rh7V3sWMm1yJvacaImR9NwuVMscE1pDr0R/XWP+QU2vbPxstAyoCxFhpHj7PJwW9d8ONQywJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flqInWQZxGRF0ioNLqiyj9BRYh9uxf1z2FRcSHpWxow=;
 b=jBDHHuFe7E86GYUAGBfPs8yyN21qE4vsMNo4VhBGcChqQg/tp0H0iu4sIE1gGWtqjvDz2cz96ANYk3KJ2Zo+McQQWuiokleyCNsyScOxI1ax9ABPMhQgDa1lfiZOMtrftunhS0Yi6ghL33+cmmLCRUUrIG5vM6ODquMNZRBGsNaXvqbU/nLkpooA/+kvB9zGQFitt1ssI1K5mQ9Kx6VKFsN9apgrz3G4etVDCcgLPXJffS0qV+g0mgQyYPo1TAJSoSDiYOB/NCloUp+gcS26UDmpX6dpuOmig0R74suljlp49BdjTLPDilFcpdmsR97YFD9nfyFwCD4ftNv+gmPt8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flqInWQZxGRF0ioNLqiyj9BRYh9uxf1z2FRcSHpWxow=;
 b=vrXGkPpgqKYVVQL4f1QNn9p0nBq1hlS7fM3ea1uAFJrLcloed2+AOcZGQ8ViDZZEkQKLSMssokh0IZsHNLXyZYxX+ZgF+YqDMpl2WsHxYVud0R4tK3tUcQ+H50eKzN90uc2SQWQep/FfSaKxhZpPboFoIo/gHSZwm15aZRehpxji56OO2Pdj99UDLRDMcjlQf3pDQ9anEtuNDjQBnsdH+/c8h2brexbmF7JsvjVqIGR85nZYy6go0xUZNqFyL8jvs6Dfl0cxrz3MDhgP1FMZQhrdZgX4VMUWFLibzbQcWuJGQ0qKvj6TozoN8B0z+BYyQEI/S1OrP9tDb6XEGqmE5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <48741b73-8755-5a10-e1c4-d684aec2135b@suse.com>
Date: Fri, 14 Oct 2022 11:57:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20221014080917.14980-1-Henry.Wang@arm.com>
 <70670b7c-e87d-9eb7-691f-48c44e9d57db@suse.com>
 <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB79913CFDD2388EA05ADD187D92249@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: bf5b004d-f878-411d-80ad-08daadca731f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBv6dItVC89lTKvihAP3D680QwOKScnAngII56wb7FA3P8grVXMIKxwwPIuJ9qVta/Y1kUvUr3sg79aEtwMr4syZ3q0q5moCVqrfJ+hc+wquf5aJ+Q/06szhbderzZLM0vJGHOgBFNteqMHg99MfL51xW0SRQCpzyzfmy7xnv/QoRzH5M6ghjdKnPMfepZAsrfgCTQo4/Iev6zoUcw/SxQOZwjDLtm1kxar1AAhe0rQVM//m+Ui+KbiQsrbT9MgTFbSVSz5bwsA+lt6Qx3wiUOWHHgBKoBX6PuajbPpY6PqKT8ouIPf9924jr5XffFoFOZLnQoHtzh4MXM59eYdaGxyLfwTbgmI72DXrQK6fX8TVucCcZN834XK4FH4X/C+OipJxI0fqh7rxOlSRBNKWv0G2xoHWccIU8oN8k5i0u9mMGmOQGBTMnx+3DBUdSlv554B5jvQVyi4bUJrVWJl9Avdvjb36h/6iRAsm22AdfT3WVdemMB+Q0CnJzx0n0lEViu13VDEzFhJ6TxqoqSQw1q6BGTDr+0M/+in90rhXs5WEWBUtcsOsfY6O98QZSOxZPT9LV3w95zwj1E53KmzebnsArTZ+tmAicbrzfYbjA3Gq+U3fymky/LKdzPETEl53w8KDdkEKP9hmDvu3niwi6YxLFqW3a2hTtn0+EwsxFz4B20nW+jdwRKRqcfc3+XdsIFPjh6KbE9HR9ofiExoOCxVVPuF3FM6NOHQFwhxP/yvs/G0FNPOx/gl2JFmOUqGdg1/ndPmeHp4KWczIhf0NyLJRsaGgFfOQ/PUpGo4ZiI4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(136003)(39860400002)(366004)(396003)(376002)(451199015)(2616005)(36756003)(6512007)(26005)(41300700001)(86362001)(316002)(66556008)(66476007)(6916009)(54906003)(8676002)(8936002)(31696002)(186003)(4326008)(66946007)(38100700002)(53546011)(6506007)(478600001)(2906002)(6486002)(5660300002)(66899015)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azUvTVRaa3FDbGNaWlZSTnU3NnVwVm5Kd0lEWGVITm9ycVBFVjA3b3NWN1Ex?=
 =?utf-8?B?VlZYemlGWmJrTTQrOUNYeEY5N0pYSWJLTldMaCtEZEVmS2tuekt2eC84MnA5?=
 =?utf-8?B?cnI2Q09FdU5qQkdxYk1uNmxJSkphNUFwQzMwejhSVVlqaDJtSXlqS3NXSkZZ?=
 =?utf-8?B?TXBqUGRvOWhRSWtJMXcrajU2L3hKWlFjbHlRTitlaGZMQ0V4dSt5cng2Ui9x?=
 =?utf-8?B?SGw5R3BaNUluWFdEZi91MlB5cml5ZUhVUE5TemlPb2ExMzBESXJKVTV2Wkcz?=
 =?utf-8?B?SkRhbVBNRldCRXNFRXZJNVd5Rk9jMk9UREpwODUvZUVFVDBQTVN5RXUzWUE4?=
 =?utf-8?B?UTc4d1ZUVWp3ekpOekVJaStlZkJyZElCTzRzN1lNVUZMSEZxWUNCZXROa0pn?=
 =?utf-8?B?TlNZcFNLQVRyUDdLMmdHRThMemNFNXI2TjJzZGY2QnZnU1BvcEk5RGRHSGhV?=
 =?utf-8?B?Z0pXNS9ONUZtb1UrU0FGc1dsa3hEdGxVMHJJbFlXb0EyZUwwdlh4c1JHenpq?=
 =?utf-8?B?NWo0UkdBK2NmNUd6bWxxZXdYcU8xOENKS05XbGJWZisrSEdDRGk5NkQrZUg0?=
 =?utf-8?B?Vm9NQUhlR2FNaTVZYlp5ZnFpQ2hWWXpuR0FVSkI0NTMyQVJ3V2xjaEJ4Sk1l?=
 =?utf-8?B?b1NiYWxONWxGNVFsejdBeWFaTWQ2TVFiVk1ndldpMUVlRnQvMjZwUGx6bmpQ?=
 =?utf-8?B?dG1SV3ozcE9uVlNYRXAxcFVjZ0VEYUIrMStTMnhiZUk4ZndON2lYUnpoQ1Aw?=
 =?utf-8?B?NVFOQjRjR2U2ZWZpSXlnNEZzNmZDTHVQa1ROTHA2TGRPK2pyUkxwQUVvdW1r?=
 =?utf-8?B?a1RMVFFVYkhLTkowa0t6UU1VLy9jWHF2YmJDMHhQVUNHR0o4bGdQU3FHOTRX?=
 =?utf-8?B?dDh0RHdTTmFYV3BVdi92YzZoM0N3THpEYmFicUJRQXB3SWpncmlNUUpjMjNS?=
 =?utf-8?B?RFV6ZEtDUzlYa1pyNHZidmF6NWNoTklCMkRMclF5NXluKzg2U1hVMGt2YWox?=
 =?utf-8?B?Qm5uQ2c0Y1lsbkVMSWFuWFFjNGFDaDNzYXNmU01mVFV5TkxpbURwaHZEeGNW?=
 =?utf-8?B?b1dNR2hXbGxyMzIwNnZmYkR5cWF1ZjYzOWIwZ1ZhM1FFQlBST1E3SUlmVnYx?=
 =?utf-8?B?clFqaStUbjRkS2UzUEJCT0JkeEczenNSKzRYOVorTkRJR3pwNjNtQmFjZTdD?=
 =?utf-8?B?aWRMRzV3SWtQeHdlZlRKamk4SlZxNktXZXRQL3d1dFA4alVrS1FmNHJsazdm?=
 =?utf-8?B?STBFWVgxNm9GaWVZVVRFTjIyM0NIY3U5Tkkwa1YzcVJwRjJGK3NOKzlGcXdy?=
 =?utf-8?B?d081UUcrNHlKVnplQ1hzakkvd3A3dXIrSVdhZHh1SnptSExhbWMxcC8zUzNl?=
 =?utf-8?B?UHB1a1gvKzZQY1A5MWl0L1VSMDkxZnJtUWxrN0FWZ3BIcWRSdG8zWTdqOVF5?=
 =?utf-8?B?MSt3bUxaY1NXU0gzN1hEWnRqU0VuR1lKa3hlZjZnSDJ4MHIzeDdPai9YRitQ?=
 =?utf-8?B?MWZ2SEpVQ1JibEVpczEvT1hNV2tKQ2UvaFNOZ042RUljSm4zcmlxRUdIdkhk?=
 =?utf-8?B?aklRRlFoZG5uaUJPY1l0UHM4N0JnUlY1b3BmSldlczlwV0dWZm5LTURJSlNx?=
 =?utf-8?B?M3Y4R3ZFNUhmRFJGOHlldy9JTnVDU3lFV1U2cUtlZlRGU3dUd250cExWUFFQ?=
 =?utf-8?B?QXB4NVBiMDBNMW5hOW5WMnVZczRrWTdNT0RRWGxOVnBkQzZITktSeGhhMDVl?=
 =?utf-8?B?RDhhaTNJaGNQNGN5cHViWGoySGNZK0VLL0M1dUF1ZjQ5aWlzWXBPSEN6VEh4?=
 =?utf-8?B?ejkrZkU0VjY4cVdOeVMyaWh5YUFVTVBISHdvWlJTZ1RNR24ybDRQUG9nK0FP?=
 =?utf-8?B?ZGxTNHQ2c1ZMVVA2bFhpRExXRjZ4aXdBS1h4QlpLcyt0MkQ1VzI5QkdGdXdY?=
 =?utf-8?B?KzZ3Rmw0b3VjaGx5aCtoek9nLzVXKzRvU21rYjkvRncwazV0enVqTWl0VGcw?=
 =?utf-8?B?TUtQbGhraCtRb2g0WjlhK1p1MVA1NXZsbG02dTVBa0JpRjlZK25WT1NBZGw0?=
 =?utf-8?B?MDgreW5HbmNwRkZLbGxnNnNoWnVuVER0Um1PU3g5Qm41ZkViRUZLK2tPeVhs?=
 =?utf-8?Q?wnQvN3Yr1itkh4HBeIOIyXfzi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5b004d-f878-411d-80ad-08daadca731f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 09:57:05.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3vA0DAUFN/kzPtoM0bL/PRkUaE8IxGb34QqfRQrebYFgAyFYsL9qhC8w8CzsC7pLLPTA9exMjr02RALEmsDqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

On 14.10.2022 11:28, Henry Wang wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>>
>> On 14.10.2022 10:09, Henry Wang wrote:
>>> @@ -1736,6 +1736,17 @@ void p2m_final_teardown(struct domain *d)
>>>      if ( !p2m->domain )
>>>          return;
>>>
>>> +    if ( !page_list_empty(&p2m->pages) )
>>> +        p2m_teardown(d, false);
>>> +
>>> +    if ( d->arch.paging.p2m_total_pages != 0 )
>>> +    {
>>> +        spin_lock(&d->arch.paging.lock);
>>> +        p2m_set_allocation(d, 0, NULL);
>>> +        spin_unlock(&d->arch.paging.lock);
>>> +        ASSERT(d->arch.paging.p2m_total_pages == 0);
>>> +    }
>>
>> Is it intentional to largely open-code p2m_teardown_allocation() here?
> 
> Yes, AFAICT p2m_teardown_allocation() is preemptible and we don't want
> any preemption here.

Well, this can be dealt with by adding a parameter to the function, or
by looping over it until it returns other than -ERESTART. Both would
seem better to me than this duplication of functionality (but I'm not
a maintainer of this code, as you know).

Jan

