Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233DC77279B
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 16:24:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578546.906099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT19r-0006Ia-0W; Mon, 07 Aug 2023 14:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578546.906099; Mon, 07 Aug 2023 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT19q-0006G8-TN; Mon, 07 Aug 2023 14:24:30 +0000
Received: by outflank-mailman (input) for mailman id 578546;
 Mon, 07 Aug 2023 14:24:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT19p-0006Fh-F4
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 14:24:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e03de12-352e-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 16:24:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8539.eurprd04.prod.outlook.com (2603:10a6:20b:436::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 14:24:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 14:24:26 +0000
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
X-Inumbo-ID: 1e03de12-352e-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbyqkvswKnoDUqzWnT/sumGeFr4CVpKZL2RkGKts7lDZvY5Bp9BLkwpV8wb1O1BCNvUwDhNpYFxGlKrsGvPh8nL6FkZfLlpzfjajQHhuGSqBvZ9fYs/6QNQHs4W1cDLBsVolKO5yTStJWYavmHFrjAOw8nAuCQ8NIb51Kg3DPLpYi7sGGQrfMm3qC/VPID2e/397k1CDDA1IapvmyDB1JoJ/NPHruzZCauIOLjM61/4ce8+UeY0DXNjbmEZaLAwk9lYQJHK1DaF6X5KOKA/sy2MhsL4Xr5bRSaCKqDeXAv4crZa6bjPYKwdjDXnhTya9B+uLUrHSzQdU60LGtQrdbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8s7gRyVrlY4vsjeMo+M0/WXO6g2vfdu2H0vWGZButmw=;
 b=VPXkF5BtUaYZeBpqWzp7J+Lob+FOjl06bzOehhChbSKJZCna02ixHiSXz26a7MWuUgeUwVNrivxk0P/jQptiQaaYjFtk7rvaf0kHwQvXTeR8jcbMHV3kGbtLKn1wJCMTeHBaTFnLEZcm09KjvxH+bHuUSktMLKfvNsQQyzZuo9SHGeJjkVOCxveBA/fHwiCv7FTES+D5PcBoxljsWtdD0dYWQq8NXUH4qMpVGumEmf4vKGS2PS0Dv8fufLPm+657UYQdYeGffYEjgoMiPi2AgI+t7hdodETbmmtBzl8YJtiZSyCkIRXh2rRQCCe+Rdw51xLMEBv6c5z+DAAM1TbwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8s7gRyVrlY4vsjeMo+M0/WXO6g2vfdu2H0vWGZButmw=;
 b=brEwTwcVDGuX+CP1bHxD8A3y1u5oIUjJDne+qrmjohENOGa0VUrS1Qz1i/84l5VgSbuIfbtGXH/sjvMCMqZFknHvHs+uU8jzeK0+a0W+gUPex2+aOYQiju6w2UK+0BjODCLny3ZpxtatFImimsrX8wW1/gGobypXbHk4U2M3QpUKN5BLjZ9qLacGEqBicmMyC/99uJYhnFWUxTHKAjf6FCIVXGbXPI8PPWixsdHzqRG2moNQLXHtW3FDTQZb6Ib03Uba2DTr5OnulL6F+zwh+zUkBnjMSnIIYTmkXnYRtHaMCkTw06jp7cimkRMeHGRTki43PRtYj+whAXhlxa+ZLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f1d6b1c5-bd01-cfc0-e507-30ea6e07f307@suse.com>
Date: Mon, 7 Aug 2023 16:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 08/13] xen/hvm: address violations of MISRA C:2012
 Rule 7.3
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
 <d1be6a0bad7e5cd6277a7b258a1fa70e58a68140.1691053438.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308031749170.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308031749170.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: c98aa827-0a1e-4bff-a85e-08db975200dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JputIuBYLa+oNtPu5fHn6K+G7AkHqjPHzdKeaLs+Q9MsQunCqtrM4VCNyrxmbZznNb9wAmWH/TZrYKy1rYa5RCo91BVfWYJ5SqZHY78LpeUieO8pjRfqsvb1jejRE9rSKVb7cd3eys5YaMqrO+V0o41KQS5c2rZEZE1nJ9qrpdx8hT+a2qwpLWiJZvCBLkaP73IbzSzoas9yaJZknqLbykbs31WFNxXZvLsARPNoC57HGSzKzrkBh7GPFO2nWStzCSwVKdAx9BSfgzc36WPPKSI1xE5drZes4i1A32U2P5IcoNZnKB1oWZ8jXD6q8PMwrE2tozkkqNGo0A22IJivYY6QPs2IEJ8ZVwpvmn66DiTF6yatQKLmIFmvyXinoLSIrLWQovebTss+I3/XxWQKC5AB2xxbfvptcD6gVOGyQi5jCqWTHu65WPynjLlsg+p2UOvaK1fapWqHgr7+LtvVfwTCBergMvQ9nVqL2FPQ+IsqipePrfpDsgu24eSgDODh667CzRqpzUpOOZupiRwV7jRTNUUzi94u9ap0pualFqXGypo9JpXQYfykY2V+aeUAp2Q1oOWRN00TlpwqY3jUUw7NzYkoAJF82vPQcNoE42/7mEUqa0NxTp6Bhfdwyls93/cfdsEsjqzKEZ2AAyq/VQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199021)(1800799003)(186006)(6512007)(26005)(6506007)(53546011)(36756003)(54906003)(38100700002)(5660300002)(86362001)(31696002)(4744005)(4326008)(2906002)(6916009)(66556008)(66476007)(41300700001)(66946007)(8676002)(316002)(8936002)(478600001)(2616005)(6486002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmlLMzNtYVJaUzRCS0JDTVNTZCtMN1BUZG05N3RyVVZYZVZqK1hlNUJzZmds?=
 =?utf-8?B?M3dHVWd2TnZ4M2Q3U1dYenFzbkJoZ05iSWM4Vk8zWCtQY0VYeld0NVdjL1JK?=
 =?utf-8?B?SXdWT2NvNExONDNaOWhOYUlwSGRXMEE0d0QxQ3QvTnlWdGVHbkpwUDYwV1Iz?=
 =?utf-8?B?UkRLTy9vT25OTWwvZS92TVVkUlloVFhCSEkzOUVuVlRJanFQa0hOQ0RidVFG?=
 =?utf-8?B?WmJNQXZWN0FsSVArWlU0Yy9nV0FCeDNYNDkvN3ZFQ0t0TmVzZzMwYklZZTVU?=
 =?utf-8?B?RmM2clp6ZGxvTDBmTEp4aWYrMXhEMFowcnpudnlFNTRtd1RVYTZGMkg0V3VK?=
 =?utf-8?B?R2VlaDlpc3plbWRyNTkwMktCOHFLMFE1a1M2SXhOS0IvNzJDQjhYL2E1YktN?=
 =?utf-8?B?cFF6c3puV2tFeUVuNnVqdlhjenU4TENKelVjZkF5Tm1tUVp4cWxCQUNhelZR?=
 =?utf-8?B?MDZkTGlqRmV3bUVzVlFKT0FBYUcrSW1aTkVZT2NleUFFMUlSZk9DaWhsRnI1?=
 =?utf-8?B?dUxDZkcvekg2ZUxyakh2RnQ5bWh1OEh6VjRlaENtUjRRVW5KWWJkYWdNNWdn?=
 =?utf-8?B?WEtEc3dzTTN6RnZKcnR2REJpZ2tldU5vZmYvZXF6dkltUzFmUXJrOUExaWJD?=
 =?utf-8?B?YkhzSjBaK2t3MTVkYVRMT2ZRRXp6TGhadFBGanhRTkdrZEVGYU5ITm00N01r?=
 =?utf-8?B?NTBDTlI1dUE0UWNvVlRjZFJXWmVMS0YrajgvZzdIek14SFNGUE8ydU90K3VW?=
 =?utf-8?B?TmZBVzdraEZodU1VRk1WdERMNVpIbWpJQ1R5eWVxcnR1VlJ1VmxJUnUrblJa?=
 =?utf-8?B?eUY4VTczTjF6cmVPcHRBZ3V3ZzYrRlBtR084b2tleDg2UktQVXRkU1dFOUpS?=
 =?utf-8?B?aTUvQTFPZGh2QThuUmpoN1RRK0FLejVoNVJOV0FoY2ZXbVJkZ0V3dDJMc08r?=
 =?utf-8?B?KzFmbm51OUdRTFRMQmRDRFl0NzlIUW13RnpNdXJGV1E1ZlJtVlViWWVrNzhr?=
 =?utf-8?B?dFpDYi9mSkFLazcxeURSVmIyYnlKUGlLNW9ZdEtEeHhDcDNtYS8wR0llRjlL?=
 =?utf-8?B?VlZPWmNVeDlObzgrQXZ3ekoxdHI4TEkvWE9BQmppWlQ5TzNLSkxVN3VNSFRz?=
 =?utf-8?B?TU9HMWQwLytnVTV5VjBWb2ppWDBnVjNBallaNCt2eU1IaGUyaGdBQWhRcUNF?=
 =?utf-8?B?SHhDWnp4Q0FGMHlobVBrRmIvZm0wOXc1OUVLd2Y3V1pYTzBzSGlMV2JROXFP?=
 =?utf-8?B?K05nZDBkSzBEdng5MUxqZHNLUkc4OHgzeVJ2d1NsclR3TUhJOTYrenRYbGlx?=
 =?utf-8?B?SFdrZE1POElJcXJLRUxUZzF1eG8xZnEvSUdMUUpSc2x2bXE3UkpzSHg3Y2s4?=
 =?utf-8?B?ZlN0dFpaRGNsbGFkRWJnWld6MUd4UDd4Q2Fra01pb1ZkQnNRV3FkQWVmekkv?=
 =?utf-8?B?R2V2Mm1Fc1RxOTlJWXJDMkpTd1NjU3ZtSjN0SXg2dmMzVHdybDR0QTRCMnVL?=
 =?utf-8?B?MFBPSGNqZ2xaQWdFVklNZ3VPQ0JQVlN1RUZRVlczL1p5NG96N0hLODBVNXEr?=
 =?utf-8?B?eDA1TWRveTNtZGRtTTdMcEdHWTJGdHdrR0g2Y2VzWFpnT2p3ZXJtdHNaNEMy?=
 =?utf-8?B?MHpnVjQ1WEVxbSszd3Q4TFRPV2ZZS2tTOTBhdlBicW90Y3M3cmVNKy9uTTk3?=
 =?utf-8?B?a0lnL3lKYm1MTXowRkxxSjBjUlk1cTRYSlhTdWxJNTJiNlg4NGRBU1JhWHlx?=
 =?utf-8?B?Tmx6WUVQejJjZ0tPVWs5NUUzam1RcC9RNWVRR01pQmd2WHIrQjBDZkgzWXJE?=
 =?utf-8?B?ZG1iSFVITXhpZVZhU0Z5Q3lFZ1QvNDh6dGlCT1VGeU00QkJJOUNPYy8zQWRS?=
 =?utf-8?B?Qzhtd0lhZVFVaDlEZmNNN3F3ajZsdHNya1k3cmRVSXFMbmVBWVFaNW9OT3Zj?=
 =?utf-8?B?alhYVVJCdExQZGk4azliUlg0T1hjU1hXQ0dZWnYwN1lwcVRvZnJTWUhIeC9C?=
 =?utf-8?B?WkYrcS90MVlJUTh5eHNnNFV1MnhjZ2poNmJkcEczWW51M0RhalpybFdHYlNq?=
 =?utf-8?B?enRmNVpFTnVSd3dNaXdXZVNOQ0xmZGtiZkZTTW5yaTNvaDB2aWxHZ1NSdzFF?=
 =?utf-8?Q?idOtWRTwsEnjeGz2cS05uP1zP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c98aa827-0a1e-4bff-a85e-08db975200dd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 14:24:26.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3abpDvEer+NFK5Bk6DqlxgR4c4AZvvhLZZY+a+ozBQTfSe5d8E7VOPqT4ciAaObZPf60AFc6BXUkytweqHNkrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8539

On 04.08.2023 02:50, Stefano Stabellini wrote:
> On Thu, 3 Aug 2023, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
>> states:
>> "The lowercase character 'l' shall not be used in a literal suffix".
>>
>> Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
>> If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.
>>
>> The changes in this patch are mechanical.
>>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


