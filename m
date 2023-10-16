Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C767CACF6
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 17:06:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617724.960627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPB8-0002ji-DH; Mon, 16 Oct 2023 15:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617724.960627; Mon, 16 Oct 2023 15:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsPB8-0002gO-9q; Mon, 16 Oct 2023 15:06:46 +0000
Received: by outflank-mailman (input) for mailman id 617724;
 Mon, 16 Oct 2023 15:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsPB6-00026G-NO
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 15:06:44 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3cd696-6c35-11ee-98d4-6d05b1d4d9a1;
 Mon, 16 Oct 2023 17:06:44 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6945.eurprd04.prod.outlook.com (2603:10a6:208:17f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 15:06:42 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:06:42 +0000
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
X-Inumbo-ID: 9e3cd696-6c35-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tab+h787DQWqwS0xFZ5kiwn9EI7aUx99mlI9h85LJA8hrGt+9VO0YaSLdWNDKayDMpG5coufCad8qDBYe9suYVGFDjEwR1LR8tXC+3lWlZwG9hIKzaxpF740DGTy0sqkik9xXgp7G2rcs9KZ3ouxbE6Sj5hullAlA9ZM2xJ2Htr4t6FZ/TS26V3A7A5nDXtmg0Y3doAWc9DL6Jng9NHnh2kY/oB673AIvuW8AQ9G6mBP7lIju0lXjKS3F201IBH1oWNXKjwMLYX5a7DmUnb80BHM/0w/MRlokkCrxyxJhj/MQuxRKF+t52zxKJdL7htJoprAStK3furi+mDxikcvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCGS48c/A6e61K9hFNE7toNBv2JoR4LS+tRzueqbKog=;
 b=cztoHMeCnHI/Z6XlEaGNP2JXXxWl0gfyUnMBOP5MK71dS5s0xPiSfgbAmZu/ObV1vavWnK8G0Ns4rUM+VaO73/cIvAAd0sFH9UbyftAGMIjF5wGtRxZk9kW/NKGCORwLMehgFIj/qaiR+tc5EJhx0QW6vtW+UEaSY2aiGvRO3/RMK8CQuVkc6ZKEymJ2uT0zrzYuEy1Ll6TPO4CI0fpgQOfsChD2yJ62V86BCWSt7IxsJJMsADiVjIzcbyuI0/Epmsc2FyEo9w9647vx9FMd7jMOJuKhV3sZpCGOkAeF8AwQzmGHYKgdNfOWjVtwAic9ggdqVj6aHdWF0JjB8xc5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCGS48c/A6e61K9hFNE7toNBv2JoR4LS+tRzueqbKog=;
 b=bqagQpMzmUW596yBOl6WOEq5wFR7mTiI4f4FcEmh5Sb5ponMjC+lrsJfgSYWaMLjEtidatdraPBKWwnmDWmJaYk4YnXvv37H56EoLnvSPuC6dQK0ArNTQteeDMn6BEmzT7AdM60A4dy9nKVAncucMqUiTMxXPJZfZyUru5+UAolNPt/kRaHbPfAQEAvW/hsqOV402Au8Z5/hUjv6+6AnJvv+hIjC5Tte+f5IXO9ntI6AhSzp2iQJlgHpyy6T9oT5sHKXgIO2h1+4lPRILQYW0CPS+TVONcGKFOcRMvTCw4tOh65ZTDS59XtmMUm1fnNPsyA8wttrnPgAVyUgDkN1/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f64acdc4-ceec-a52b-2553-3b57d7fca2d6@suse.com>
Date: Mon, 16 Oct 2023 17:06:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 4/4] x86/psr: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1695972930.git.federico.serafini@bugseng.com>
 <c7673a1cd70e1f4901b8f6a6a0ffe3019c9307ac.1695972930.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2309291354300.2348112@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309291354300.2348112@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0025.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ccdf883-b67b-464a-bf6a-08dbce598179
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vtSkwMlSrnF3/9aWntNPdYJXJ2SVKY8l6QW5nigE+UBpZxwg0+6D/k0OZY9MEYjyPd/BJ2ePJXZX7GgvAJgldiLD66maxp2mifw4Zq58MwdASCrdBkC+amJhQee+8h2s5ZuIWuci8J/zVGm2sccDp8B+IGQRfo9zAOBdcLi+O4GYTYwcZQGPVFYptC5ii6O5SllfZSfVhWlLferPXRI52Clhp4Nbcs3zqFMxVzB5tzaVu/j5aRBE/vBKEnOifcL7g41hURnuT7b0Dlavc/sLhHJeYrRKaj2qQCTv/eno9C3KzU8Rkrg7zrRUiFDQWYxFbdx/hEAWciUsejTGhr1jTB7u8dU0M8o36xbQ9OQDL/zU6bMjUlSxi6ynKSKd8CLyzmR9ZhI3PPmENym4uKPLs1iOmkfqC9HuIWdWFxFkNPmxr1de2m9Vp3bzzzfmxZboLB+ROYwrFfCS5Ra/uac8yiUgxIrUwxCO+mo+/bdiCcBHCrlhYEnIPSdmLWc2HQENxSXNHvQhLyHRI2oveqIU+hRKKYPkPzVRN0C5usW6ubXAp0oBijwtmyRIsrbeXm4O+f6JI6e54qV6N8orRaegdRVtQwB70o7+lte3Vrzup3jXI0ItURormeotS7j1+hMlRDbtJJayXaOJaLzTmtxy0Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(41300700001)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(6916009)(6506007)(26005)(53546011)(316002)(6512007)(2616005)(8936002)(4326008)(8676002)(4744005)(2906002)(5660300002)(36756003)(86362001)(31696002)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajEwbUFYL3ZMOWJTK2xpREJuZFpwUzhkeXdGd28zODlaSmN2YmdRWEZaQkJE?=
 =?utf-8?B?cDQ3cm1tYmJuYklWbWtxbXRvWUtTczVCN1hPMjFjTzNzN0l5TUgxK3FsUXgr?=
 =?utf-8?B?dUhmd0tnQVY5ek1IQUtnc2pHbFh0ejRWZW8rTkE0WlZIWHcyeVh5MVFBa2cy?=
 =?utf-8?B?V2FZdEJnWi9jY05RQUo4eGJHQmRaVVJmdnp6RzJROTV4S1hSSG15ajZkd0xw?=
 =?utf-8?B?b0FkWDk0M0ZrY2JNU0l2eHI3Rkk0QThXUXVxWHZKMlUybGVwZlNTdi9TVWlF?=
 =?utf-8?B?bFg3QTlUYUU1V0svWUdQUlNQb0pZeTB2NWs1YnBZK3V6ajlzdVl0UDVNM1U4?=
 =?utf-8?B?UjRPYXNrbE16SWVOVkl1MjdQUW9ZR0p1c2NPd0YwTWdORXM0dFBiQjFLbTVw?=
 =?utf-8?B?UHYrZmwvbDltNkJjZ2xwQVJiNU91L3I2VEJRZmpjdDNURG5PajNEV3BwNkdG?=
 =?utf-8?B?TU05K2pFV0xuK3RtWVZmTk1xQnk4dGY3SUVsRytpTzNwVTBlbDZ1TEd6MWp2?=
 =?utf-8?B?cThiYTJ0TEdyc1orZTZKYTV2U2pac1R1a25hNUVhQ3o3YTFrQTk5c2laZlV4?=
 =?utf-8?B?MDJPZEtWZW5YVjBpYzNmSGdMT3N3MVVxS0tBa0VuRzkvR2dxTXRFL3lRSWl5?=
 =?utf-8?B?cVVRZDM3WlNJMjdLQmxGc2M2bG9HZ25USHFTVklyU1RWeDMwbzNET2FHbWpP?=
 =?utf-8?B?RTRsTEtYUWROd3UvdFZ1QWtMY2xXS0QvWTZTQXlrUEVEQS9GTzM0ek9DTGFV?=
 =?utf-8?B?TGsxZXN2NzZuOEd6d3JGbFFsUDJTaFZzNWpobUdaSG53ZmFoRlJiZzdCMHVX?=
 =?utf-8?B?Q2dteTZ1YWw3MVpOYmpreHVHd3oxRE0vRC9ERUhhNjZwYnlZeFo2STdCMXgy?=
 =?utf-8?B?c0lhRUFkZGJDVWJrcFhEWWpVSTcycGFKdHMwejZtT0ZZSTA2RzN6QzZ1V3VK?=
 =?utf-8?B?MnNhaGdrNDR2WktXMXR3YkJxbjZ5aXFCNTJ0M0pPT05Mb2ZkaFBhbm9wRVVM?=
 =?utf-8?B?TE1pekJlb0phVVNhb09qTCtGZnFWWWE1cVNGTGptZVhJNEN0ZDJuMXFWbVl6?=
 =?utf-8?B?bStZMWZVODNPQnpDaDVFTHZVSXJyUnlFYUlycUdJbVAyaFpQayt0akxLZ3Ix?=
 =?utf-8?B?cWRoazE2QWk5VTNHc1VsY0hBL1VaQ2R0Y1BXRTdicGN4Z2xWT0pBL3NVSUtZ?=
 =?utf-8?B?SFlmaEFlMk00dDZzY1ZHekwrelo0RXpudjY2MEtkL3ZCNGgraXpWU0s0ck1B?=
 =?utf-8?B?byt0MXk3ZnFrblhRdDZ1dTI1L3czbWZHNFJkTG5URWoxZkF5cC9IL2I5d1pY?=
 =?utf-8?B?Ym14Y0dqYld2TEQ2KzkxOWtxMi9RcS9aRTRENFplSURKRi9Bb2RieHhoTU96?=
 =?utf-8?B?eGFDejNmRXdYcUlqL3gzUnh1WjB0emgzSmVuWSsvYmd1UGVPNjR4YkIxeXFJ?=
 =?utf-8?B?NTFRbkZoK1pqd29BM2RXRThBZnFEclIwRUJuUVFNNmNqUFE4OTZFZnBsV1Fy?=
 =?utf-8?B?V0Mzb2QxeUJuNUwxWHhaeWl1bFIxMEYrSXZVcUJ4K3Fuc1hDUVpYR09GOU90?=
 =?utf-8?B?aDNSM09Zb0JSS01YL1N3QUM3V0NrTWhZMVQ5VlVaUkhuVm1ZblhTVlNaVU1p?=
 =?utf-8?B?Z2FKcUFOUUpSU1lnK3NwU01wanV6UTFFMGdmUkViZStWQ092VXpvOGRtMlor?=
 =?utf-8?B?SkZwVEkwN0czYnl5ZENPaVBCdkQxeURMa0pUSDhrK2RLdHo2MDA5SWpJaSti?=
 =?utf-8?B?dUZIeEs4RTgyanZPL0llZnNDU2hmZ3JuQ2lIMzFWUUVHYmpmcnlPbFBwYmRM?=
 =?utf-8?B?WktBL3Ava1dkRGtFUEFYUjlKa3dkNnVoRS9JYTd0MXdpaSs0cS9FQ3lNV2pQ?=
 =?utf-8?B?cGg3WkU2c0pLOW5VMU9VVUNuSXoxUERza1ZHN3Q3VTJzY3RMR3RvNXI5M1Zt?=
 =?utf-8?B?dEZSbk9nc25yakk0ZXNyQWNHTVpSUTZ2L0p0ZnJyK1B6TFdvcmtSdG1naUZ4?=
 =?utf-8?B?V1g5dG5VVnR2R2x1WkJnR3Q1Y3NxNmlyOURNUnpwZ3M5cEtvSlhiakN0d05J?=
 =?utf-8?B?RHdkNVdIMFEwaC96Y1dxOGpQMUJMbWt5MWE4ZFFleHArelBxME9GazJtNEVS?=
 =?utf-8?Q?Av/WyeXSdSFCFFKV4ZObQHTFq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccdf883-b67b-464a-bf6a-08dbce598179
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:06:42.3572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dAPZso0mKSXhPZ3o52E2klwjLdjuF6i7GiMSLAa9NIwrIzqxWpSRBHKQ+61v3kBYvH/iZtkdQk8/w9ham0Z3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6945

On 29.09.2023 22:54, Stefano Stabellini wrote:
> On Fri, 29 Sep 2023, Federico Serafini wrote:
>> Make function declaration and definition consistent.
>> No functional change.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>


