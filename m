Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8D77B227
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583231.913320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRml-0000GQ-Qs; Mon, 14 Aug 2023 07:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583231.913320; Mon, 14 Aug 2023 07:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVRml-0000Do-Nk; Mon, 14 Aug 2023 07:14:43 +0000
Received: by outflank-mailman (input) for mailman id 583231;
 Mon, 14 Aug 2023 07:14:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q53I=D7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qVRmj-0000Di-Qb
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:14:41 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b7ea424-3a72-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 09:14:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6977.eurprd04.prod.outlook.com (2603:10a6:208:189::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:14:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 07:14:37 +0000
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
X-Inumbo-ID: 3b7ea424-3a72-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYsyWGyIUgHDX8C3WVkMvNlYawIg3+VKa6YO82MC99vC5AgVGjrOoj0c4ehKLlkA/fkveLApb48XjDJ6clnX0Gnmta3k2x3P/Q+G+Q0bIUrKXbPxzVFTcTul2qsT/j2wBw8UZmCRuLBZcK7misyWrrxcuAA0sNDL23qcGhqldMWAD2HH1yZNEz+c0Z76z4oyoT6vU5QXRLbbYpyrkreoiTYNV/y9eQkpMK2tI0v66fLlGyC3rZyJLnAlIq1y8jSveKygHkGhgtzkWOQTGx9KW7e2Mi/RYQ5o9xt7NqPolxRglrJsf0wkVSCgMyMy8HH9n97tstORfdXgcn/gY2swJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjyqSozBctvTcsRbGw1xoNDhu+P+lKR13bT9lLYOJ2I=;
 b=YkhtpaTwTRzc7OgWJ/DPwbfqSHAFpROetCglTmn2xnL5+btz0pNyB/go0kNf26K8HJ8riLIvharHO1dJms5qht89/rCXgCBSDDGOJhToPJgrHXClW+DtQqsURIY3QZ7drI9u5EEfCcEb7U4c3lJujv/2nsl7hUE5Vn7nznczeT44bxx64EwgHA0CaNNmhqPTDDJM7GEaLgfuTREaevfvVfPqEdAKUDcIaUoQxZ3Ng+qvdazOKM7+ChiFMzsfeUtGRirKZWlpOuRtsc75gLZ9Quzr3kjQQlVRFOWjqTVFTHWmzRR1hg6FLaRdYwC9vzm+aMWiVIwrxTiFmAMOjLLa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjyqSozBctvTcsRbGw1xoNDhu+P+lKR13bT9lLYOJ2I=;
 b=ZjYgkPENxOk8FYcTEyXMTyeARfxQFOwr9TW8iwCpF10kaAqVtvorkEr2L5bc4ZLBriw+C+UoSAgHvAjMSRJ16kb4z1icfkxIM4jeSibmWl/kD62i+OBtC87fkIqzXFcwfmacnxMHFFLO4IcQP0sMu4QhjT5RyyrIBadSasabbKSxBtSPpH71+8+SWwVcOGXX4gkIYHJledjW5ArGZi+vAEKzIHkkCpSwFM/sRGJXy7aPBjbeUS0WJblLa/YeFJO4v5PQSaq8I9c3ZG9zGaQte/Lg1dXTnPXL/KhdbnwwGKRZuiLZtwshnACLFy5XHRY2nfgh6Q3ho+NxbiQxxx4FGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6fd6cc67-3ec2-d811-17c4-02845f62042b@suse.com>
Date: Mon, 14 Aug 2023 09:14:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] xen/hypercalls: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <5500643d99b315aa4344e5e3a833e6efa9a0413f.1691737296.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2308111528510.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308111528510.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 7107173b-8dc5-4b5f-7818-08db9c961e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CN/Q38uHseJdwkIk/HyzdjeNit8Vc9R0vrNJNik5HSwlNvsZsmAOwnykrLMdDwa//sqsQoSdQ64CLsPZrFOxyqin2J7TZG4BGx0CB09+iWpR+YfxUFXf7qRDGgRdXmtuD+RoVV54j1EAnfpp15KriqqXgi4j8rGwCImqLsBzCsmPBq9VbKrNxWv04oLzAnrimNdpERBx8BtleEHkuagnvPDbbJunqscxcTVlMm6tHiSXq0kSlB4TYEIPMTmhmv40ZHBZM/rs10IdQibgdnX68PtfciC2EwImpsmMNdNduGPqJj2ULU83HbRKP1D6A71l80t81BS7aYMXETsGRYPqmXSZxHU+GkiRU0kuThuuKCU4EJNkG7JVi2SvHjXgulsPEVINuVgx3MtGROPzsk49kPbN9k17zH2yhQv86gqtFiKkh2IwhZij9WmvjTJ4QwAATMFNM6IOWLuImozzIAM2DCq5ndOP6ArwCwfGvuBO/9AVjVtNAVpL8gKocL8OrR3+eblXSOUw8JaKg48Zu3pSl4wnGrwc08zFh116rWh6jNlmw8+vomH2GOtFkTYWjct5HcN+80Kq7HrQTgB4jMXiYoUNLYxoMHhoQsjlXhsslKuemCJaQRXCcjnWvC6Qg28KNzW6KKKDTOG7kLnoGVTIOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(1800799006)(186006)(451199021)(41300700001)(8936002)(66476007)(66556008)(66946007)(8676002)(316002)(6512007)(31686004)(2616005)(26005)(53546011)(6506007)(6486002)(54906003)(478600001)(38100700002)(110136005)(31696002)(36756003)(86362001)(4326008)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVOLzRtU0JRWGNIc0VMV01lRnp2WXgvZmRCczJYdWJHbndxdlEyd0NSaU5t?=
 =?utf-8?B?T3R3SVZ2YjU4bkVGZUUrVGJ6TU1uSUh4N3hnZThRdUJoaG9QTHk2VGMweW9H?=
 =?utf-8?B?K1hzbkx0TjJkeE0vT1hDbjR6THR2S2dCNjZaNWc5NDFUMTRKNCtEdnZoY3p6?=
 =?utf-8?B?NUx0UXRuRit2S2FzM2pIVGR3aENWblN1QUVrRXBmWVc0eHJxd2hYdDZuTTVa?=
 =?utf-8?B?MHA3cFY3ZGN1aXlRaW1STUZ0a1hiNWV6WVFBVmlZK2UzVEx0L0ptWGxzUXlU?=
 =?utf-8?B?VlB3eVhrL0trR3J4NGVMZmVubFlQYnpHSEM4bXdGR1NEU1MvdWpoRmlpS3Yz?=
 =?utf-8?B?SXpUdUx0R0hHMzdYZHREREFjN1NtWTVIL3ltTTNjRVdDcG00QWVUZmNhdHUx?=
 =?utf-8?B?SUZuRWM1c1ZNakF0eU9IdTZHZGdEWnByamV4Qlh0ODEzajNldVhtVmR2OTJZ?=
 =?utf-8?B?cTZaMlBJK01IR1NpaWhmRFdsS3ltb0FYa2ZqQnVQQW5uM0RzaENtcTlRa0tt?=
 =?utf-8?B?QlJvbVVUdzYyQis4anFpZVlhRkZxeWNJZVFxVlZyUGRsUU42ZDN3UWdHK0tL?=
 =?utf-8?B?RmNiSEFBTjFUY0YyUHJMc2dZcWpHci9rR0RaSFhDWDIwVUphaDZFMGF0ZzMz?=
 =?utf-8?B?d1AzNmw5bWdXdXhReHNrejZPUHdNOVowY2pYaWl0anVWc0Y2OS9tSFpybi9R?=
 =?utf-8?B?YlkzOW5iTEVwSFdPNmVta3pnaVNRSmxON0s5NjBYR2x1R3R1Y2NLSGlFMnhv?=
 =?utf-8?B?M01NUTVZYU9LNk1PYThSenkzNXp3OHprVnlPbnpoV2JHWDI5dDJtSUE4L0Mw?=
 =?utf-8?B?L09lUTl6U1FEVzBPYjZ5MHNPYUMrSWRmNFVrQzlzamhlUStFVWJpd25leFZu?=
 =?utf-8?B?VnREUDlIdVc4aHZnZmc5QmxCNFhjOE5xTmJXVUZhaHJ0NEhCQUl3dzFHMHZD?=
 =?utf-8?B?UnVmdFVXUTBhM0srVldkYUNkVEtKaDJOdy9yLzRPcnJoSThxd3kzUVRMUUs1?=
 =?utf-8?B?NkhVOHZmazUvMkZ2R1pRcVBPVWZ0cXMzRjdyckVzQmM0THZ2bUowYTFkY0xS?=
 =?utf-8?B?VlBDejdiVklGVFZZcGpvU0VlM2FBNkVkNHlzdGZpUnNxdlAvcHNZZnZuNk43?=
 =?utf-8?B?OHhITk91SldDVUFOV3FjOGcrWGNONVQ0NHBVNmJ3TWt6YTUzUFR2NVRIdWRM?=
 =?utf-8?B?WUlPN0JWaDZvempnS2o1cjgwcmlDVlhoS2R6b2FGeTFUNUJSa1VZZjBCS0Vk?=
 =?utf-8?B?c0dYR2lCSmtrM1RYTDQvOHVXU1ZqUGtmZnMxcXZ6eXJ1dzRoOXl0WjNFbnRH?=
 =?utf-8?B?ZGFHS2c4UEFnWG1mUWdIMXcxSlJPWUI3emgzaWpGNHBkdFg1aUhGa3B5bzRX?=
 =?utf-8?B?OXVYQmFjbjVIazFOVVRxYnJOVW1wdU1iS0RuYUI3YkUxeFh5eU5YcEZmSVhv?=
 =?utf-8?B?emg5SCtnUmJJZC90SDVYOGlKYkEvNTYrK0Y0cHJaWEJ5Nk9GaDFCZnNGOFRZ?=
 =?utf-8?B?U01CS2JRVUNIc1lRZGRidnA1WXVUL3l3aElER0pTTWlYcUZFVG9FWHo3SDd2?=
 =?utf-8?B?R0ZVUGFTUXBNdkk0djM4aGI3dFUrRWczSm1yUXpWWHA0dk9jN2E4aXFRSm45?=
 =?utf-8?B?Sk1hRzIvajVvcDQxL2JHSVJYekZSVEVTM0JtWmtOdk5tOG95QTlobExWdS9V?=
 =?utf-8?B?ZlEveFpwenc0TW5LWS9RdktOdXdZOW52NWZkcVJOQ1hISzE5cXNJN2J2RVJE?=
 =?utf-8?B?V0QzZ2c4b0RXUkFFbVFjb2llWnc2S0NBdEtDYm1jaUgxMXpKOE5DWGZNN0Zk?=
 =?utf-8?B?L1NPR2FJdFlCRUI1SG9YTUhhNnpCMGkyY2I0YnZKdlduWHB5RzlBQnFhZ1FD?=
 =?utf-8?B?d0FPdHM3UnVIR3Y2aTJHRms5N09LTEZRL0xyb1RJNFdGV2NrNVk1cGdDRWsv?=
 =?utf-8?B?bm9NckpRUDFVMFhyUEtKZXFXRFNoczAzVEJRQ0MzdEhQM3Z2MVBuZWF6Uk1Q?=
 =?utf-8?B?U3cyT1NoOHhjeWNCMGFKUmh0S3R3b1NrOC9KVmJkNEZyR0FEb2w0NTVFZEgw?=
 =?utf-8?B?NkpVd3YzSGR1a09OaWM5Q3dpZTJ0UzdjQ3QvdFdYNzBrRHV0OHBmQ1FZYzNv?=
 =?utf-8?Q?x+2I6tlLU1sHrMEBtZoPzrt8P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7107173b-8dc5-4b5f-7818-08db9c961e56
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:14:37.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8ReNOSWhCdGP1jN8KXlRlyebxsTwtOlMKtIOz64QwFQq4Qyj4P/dOfb2yv/hrIvG7XfzRU3TOz2zK/gnjRd5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6977

On 12.08.2023 00:30, Stefano Stabellini wrote:
> On Fri, 11 Aug 2023, Federico Serafini wrote:
>> --- a/xen/include/hypercall-defs.c
>> +++ b/xen/include/hypercall-defs.c
>> @@ -107,11 +107,16 @@ defhandle: physdev_op_compat_t
>>  prefix: do PREFIX_hvm PREFIX_compat PREFIX_do_arm
>>  physdev_op(int cmd, void *arg)
>>  
>> -prefix: do PREFIX_hvm PREFIX_compat
>> +prefix: do PREFIX_hvm
>>  #if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>>  grant_table_op(unsigned int cmd, void *uop, unsigned int count)
>>  #endif
>>  
>> +prefix: PREFIX_compat
>> +#if defined(CONFIG_GRANT_TABLE) || defined(CONFIG_PV_SHIM)
>> +grant_table_op(unsigned int cmd, void *cmp_uop, unsigned int count)
>> +#endif
> 
> Everything checks out, so:
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> The other changes are uncontroversial. This one about splitting out the
> compat version of grant_table_op is not great. I wonder if it would be
> better to rename cmp_uop to uop in xen/common/compat/grant_table.c. I'll
> let Jan and the others decide I am OK either way.

Would there be anything wrong with instead renaming compat_grant_table_op()'s
respective parameter?

Jan


