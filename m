Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E3589DDF
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:50:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380495.614671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcAT-0006iN-JP; Thu, 04 Aug 2022 14:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380495.614671; Thu, 04 Aug 2022 14:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJcAT-0006g7-Fz; Thu, 04 Aug 2022 14:49:45 +0000
Received: by outflank-mailman (input) for mailman id 380495;
 Thu, 04 Aug 2022 14:49:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ntlx=YI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oJcAR-0006fl-SH
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:49:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4040b9-1404-11ed-bd2d-47488cf2e6aa;
 Thu, 04 Aug 2022 16:49:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6361.eurprd04.prod.outlook.com (2603:10a6:10:107::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:49:39 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d475:4e1c:e4df:495b%3]) with mapi id 15.20.5504.015; Thu, 4 Aug 2022
 14:49:39 +0000
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
X-Inumbo-ID: ac4040b9-1404-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dLqeATpW/n3vrekBZzGrBqW4L+Q46xCpmMywPMQt1Jv/qOFWnnbE0bNn0hYQdjI1u3lW4DHjWO2uLj06imoI7OgjishdVlKMYf12hUsWRoVH35UG042d3O7j+FyO4jFyZBUYC2X/XzQhJmmjcqBHtb2iq2LDxHzygVRcbgW5QSsLZCvF3lMuJwLRMJYzrsuEteQ8iQVE9BItTvY+/qSJMjxZonps9M/y1u43YV4EAypjAlCO33xX1EvXnl5vjrc1EOBoZim3XyNtZNtNMfn2Y2Lr7d99nIYAPO8e+sOXbvHietjicjbalRam4SGkzNVFuoeY7xzhfMWYgKk3w2+bqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgMhQNCa5SFMV5/QuR3dwff7FzNaLDXI/HWimJCRrJk=;
 b=aCSD9ZTmMNWiD2hmV7KgBrawy88ODUGdb9ISoAlFDrkeRVExVTy+0Z5by4A/oJ63jXSF6uFHIIqYlTnnC556+iYgi2IetFI058B4oDrHK2S0uo8a2cfUJrYNbMAnUYSQHXREewHSKO/n8k9VbIJMXGj7U+FRxymwXN4BNHYBIdDxifNnk78TXGVzWB3sDEy5qg7r7lY3qhYQlMrBB8yijKwpCUgvJX8UpSaAHWK838BVibwINAwTjcmfOfAlwe2NGvCnflyvX4/74VfxdoHBY1oVPYXBGYTsZfyw0Y6OvRhN6XiBQO3vzDVcREyC7d2Y14T+rnulYo3wGQtxLNlvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgMhQNCa5SFMV5/QuR3dwff7FzNaLDXI/HWimJCRrJk=;
 b=4SDhK1zZADkFEjZOHP0szTVgFr7ObJ02CuiLYtdP4tqcnEWLpp7DT8qnX0h7Anle3Kanoppp9nrw2I3XCmS+0ew2WrNbIbWipFK/KJC4HzB7wOxXIBwwPpgVFDJq52CUy0nY46gVcKSAaMog6Tu/OYlxeMPKHZVEhcigW+4MShyEsaHMmhOaZQpHix9y4hQxD3aD9sQBy8Fexi3onnfn4dODzKQaC4ME2a+g8rs+TXmLQFjqybez2KHkXVttzW8oRsmvpUMlHT9iCunW6US8fqvS7jY12t9CEjzYUe/8nmvUPOyQo81UFtYVJ0uToCpZqtw0BkMtjI5MlUqJ2OrzOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9d9cb70-0f39-1d46-3a2b-650e3cb14a5d@suse.com>
Date: Thu, 4 Aug 2022 16:49:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com> <YuvM7vElH/IdBJjq@mail-itl>
 <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com> <YuvXjEZMlwjsuIGA@mail-itl>
 <fab2ccf5-43e9-e341-f448-092de2c01f17@suse.com> <Yuvai11tHcXCBvSv@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yuvai11tHcXCBvSv@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR10CA0070.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::47) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb259c67-adbe-4f74-c0ce-08da76288ecf
X-MS-TrafficTypeDiagnostic: DB8PR04MB6361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1tH6h5ZiMl72L1A40CB9OGYGeGTlQH52iG5q7V5jNK0Pn0dovw9FaDb95ZAaKmVMm8Gi6dmsE77wcSxG8JBixsabVn/Rpr+zpNLFzsIqs8JdPqyGbCxkJG4/dmOishVPg/ihuVhnYhWdxbClOdsy+nnGsoFVXyLpNcE3O+6QoCaSkItxxj5w1ObTYZOxAy3/Ej8cBy0QSfTl44bLrMQ26oQ9S8momq94WYVTbVnaMBCAtDbR46cTmQbReI+lthfSPd1og5UtpMiVyoMvUGGfT+f8J5n7aS7cj0B1QLvowEoAbEWIZA7/7o8cgXr0f90doSOiPxV1iq8FZhdrIpv/b8aYXgejByLXDJyOyK+rEssLH9o5pXzwvLuvmhYAwYmXUKsJ+dbHbYU1XRv1r8lQ026j+rsOutBJG3yVkS7GqpVRByZorziUTdM2TSHgWQNKRyWQ1HH0/OapP0lLemDu1kgPja0bvZVSTyZG3racowcKkBgcXY//L0v2RQEj4nyyHUKjRlIXNaUABOS5VEWZbPb8+msW1f56DSDSTwm3NWFeWghoPzt4qLvC5UyLCsrNzCl4ZXkLUIffjJ7yEaruIC8aGhPysQoVBBIy8fQOaaYKbwM8EDnAV+w/o2mshPj9lMIstf9l5YTsZ3RSQO6K0M/FEk9kx79bt+VOQUiF/2gnY/0LzdAudhqY9GkMSG1JTHl/viLMZFxDASMwJC70YIIkIvKvZTaeS8Fq3c39FAobhxUXg3v6rH8hVEa5p23KTVa91QFo6/gXfAoAjorejwgcV8PXgkyiqIPuLSzFi9JD3ckBTYVlBtBLCSquM3hINJIp5MP9lhJI5vJWhw8FUw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(39860400002)(136003)(396003)(38100700002)(5660300002)(8936002)(2906002)(53546011)(6512007)(6666004)(54906003)(6916009)(41300700001)(316002)(26005)(8676002)(478600001)(6486002)(66946007)(6506007)(83380400001)(66476007)(66556008)(186003)(2616005)(31686004)(31696002)(86362001)(36756003)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1htUDQ1eE9pWjM3Rkd3Q1VIWVpOdGtKeTkyZXdTbU4zYmsrdzBIc2ZTckR0?=
 =?utf-8?B?L2xnRXN0bVExUmZHTHVLbHhxckttdHJEMGN2cDdONW5FTmRzRTFpVWM0Y3BX?=
 =?utf-8?B?RmtuQmZlaUx4S3IyVGx5cHZTb1VtME1yZGxkV3JzTzBiMVNLMFN6UllRNzdx?=
 =?utf-8?B?S1RQdmc5QnRnK0RUZ2Z6ODBjbW1TbWtaTzhyWit0N1c3eUx0cjUvZ2s3STY0?=
 =?utf-8?B?RmV2czE2WmNDV3pENjVFd3VZR0JzbkMxMmxWamhDeWVMZ3dRd3hjOXYxTjEy?=
 =?utf-8?B?WVU3MjVhSEhDdjN5N1lHMGdhSHBYbGFJTTMrMG5nRS9BOWJFRldaVm1BQTZU?=
 =?utf-8?B?WWlmRncyMENPMkZvS1RjdzFDOGE4RHVrZjU0Q2dZT04xT2ZzZlIzTjJwcjg5?=
 =?utf-8?B?WE9MUkhQb1pKdWxoKzdzSWxlbEtrcXljdmkvbjNsOHNjRzdCbFZHdU1OcHlR?=
 =?utf-8?B?UnV0U2ptRiszQVZNajFVaExMblh3K0F6bUNKYTJuQnhxZUlWYXdNMUQ3U1lR?=
 =?utf-8?B?TzBiY0l0Zno5dTNCanN5UDJnU3E0dU9DRVA0Z0lOU2o0L0lnUWswaXBWOWNW?=
 =?utf-8?B?UUQ3MS9UVDdQRXZHQnBLUSsrRk9HZWVTWldyQjhmeVZaMGdWS1lycVgrRURZ?=
 =?utf-8?B?ZjdBbHBqNzdWMHBFdUZYSnVPWGFpaDBxcWpLOXpEOW9WWUVkRFQxaTF1czVW?=
 =?utf-8?B?cnpaaEhuZllPNXVqOXhiaWFZVDRONXoyay9wZGFjN04vL3E2OTM1MGVBTW9F?=
 =?utf-8?B?eFNpUGx5UjVFZmJnVXR4WEZqT1Q5VERUUXBBeHZOY0ZuS2FNT3FQdmhLLzlj?=
 =?utf-8?B?VUpzcUViOUNVcURBaFlPckZvL1NJaW0vUUdya2EwQXFac3hJYlFBakRqV3hF?=
 =?utf-8?B?aDJVczhMWFR0bzhKQVBXeGNMZkVMS3NIU1dkcmUyYWJEUVFBUUx1VlZEeFdO?=
 =?utf-8?B?TXZ5TG1iWEFEcTZKUlRjdlhPejVhRlZQQWpGejIwbnFkSGtXOTd0V1lrM2lC?=
 =?utf-8?B?WGQ5WCtzNW1xZzBrRDlsTmFFMkxvU2x5aG5lRWNINXh3VFF6K0loNythSEJI?=
 =?utf-8?B?Qk9pTm1jY3E0K2U2bUJRbXdkYzlQL3BxWEl3TElIVXJJL0dZWmFLTmZmNjdE?=
 =?utf-8?B?a1R1ODU4ZkI4KzR6WjlGZVE5RlRLNUpwanBwWmZ1S1VjdnFPSnp4Mll2dzJJ?=
 =?utf-8?B?cmZRKzJHS2R2RGprOWZUTUFuMzhaRXgxaGRXV2U1MEVGWnp0c3VXM2JreXRI?=
 =?utf-8?B?TEtqaDhKZnJEaGpUdzBZRnkyZ1ZEaGwvL0t1cmJETHI1blJUaERSOGVMeTgy?=
 =?utf-8?B?MjVlVWNQQnAwaExJMjM3L2FmTVdCeUNjNWhpS1JYSzJycVhkYkZhOG5NZi85?=
 =?utf-8?B?aUZOeXZ4K3UzWURocWpCRnAwODBiQVd3MzE2OFl6THhMNWhqbHNkYnV1Z0Va?=
 =?utf-8?B?YmVBaWw4ZStrajY1V3VqS09hc1Z6SDltSW1JUFRrd2c0ODdpVFEvOHg4YlVU?=
 =?utf-8?B?em1pQ3ZkWWMxTVYyeFRuSnBHaytGWTVhdUlKWG11Um9OV1Uwc2xXblRyTGRq?=
 =?utf-8?B?WG93OTZQYnVlQzV4Q1ZheWE4Y09ISUdoSmVpcU5xdEFJaTZkN1I5YVBRemNP?=
 =?utf-8?B?NEY5U2pZVmNORDc5dEVwenBobXBWRStqTWo3am4vWFB6SkUydFdvT05lN0JM?=
 =?utf-8?B?VHR3OFc4MHZxc0pwS3ZJemJqanNTaGl2S3A0eFhoc1pXL3hkaDlSZ0ZyMDFr?=
 =?utf-8?B?ZVJNMnQxbFVOTmh1RVpDNytVM2VOQVpRTFBpcWdYbkFYQ3FXUk10Sm5Pa2Jl?=
 =?utf-8?B?eWQvdnNwSlc4U0ltOUlOQW40Ykg5YVZuRWFoT1h0aXlIS3Z6R2hnTGdldC8z?=
 =?utf-8?B?OVdQYlptSGFadHVvcC80K2hSK2dWSlowR0JFOHMza2NxY25qTHhLTktOKzdI?=
 =?utf-8?B?eG52YzJzQ1ZrSzNlT3R2N2UwZFdsc0V4Rkt3SElidUFlWGIzQVdxZTJhUzVH?=
 =?utf-8?B?SFRwUDRNek9sTDZ0WVg1QndUL1ljcUthMnEyRVdqZWorbTRsajcxNXJXZkVR?=
 =?utf-8?B?U1BabU9sYi9tdXZlQTU2Y1g3QjdCbldtUWRwT2pxbklNV1ZWWTNXYjlhemls?=
 =?utf-8?Q?n0SQ4XVhouCTVNzrAMb7tP5h+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb259c67-adbe-4f74-c0ce-08da76288ecf
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:49:39.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRphM1pMX0iIWeZwe/a4NZf1YQI5H22GAwgFn7Tjedc/KqpSLR/EJmiCxjWIWDsrT+xb071nLRhKUWOIVn0lFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6361

On 04.08.2022 16:41, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 04, 2022 at 04:36:35PM +0200, Jan Beulich wrote:
>> On 04.08.2022 16:28, Marek Marczykowski-Górecki wrote:
>>> On Thu, Aug 04, 2022 at 04:21:01PM +0200, Jan Beulich wrote:
>>>> L"Xen" looks sufficiently readable to me. We use this all over the
>>>> place in the EFI interfacing code.
>>>
>>> Ok, I can try that. But given later adjustments, IIUC it will make the
>>> whole 50+ pages structure land in .data. Is that okay?
>>
>> No. I was actually expecting the piece of data we're talking about here
>> to land in .rodata, and hence be re-usable at the same address for all
>> devices. Hence my reference to string literals.
> 
> "all devices" - this driver supports only a single xhci debug console at
> a time.

Oh, sorry - I've got confused by your multiple consoles patch here.

> Anyway, as explained earlier, it would require reserving the
> whole page for it (there are no other xhci-related structures that can
> live in .rodata), which given your earlier comments about memory usage
> is probably worse.

In your earlier reply you did say you'd see no issue with this sitting
side by side with other string literals. Which is precisely how I
would envision to avoid the need to reserve the entire page. But yes,
if that's not feasible, then the current model of keeping the stuff
in .bss is likely best. A remark in the description towards the purpose
here and the further intentions might help, not the least to avoid me
coming up with the same comment again for a future version of the
series.

Jan

