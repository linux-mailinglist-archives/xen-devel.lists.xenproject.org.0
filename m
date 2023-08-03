Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AA176EEE7
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:59:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576483.902675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRajQ-00061l-Ir; Thu, 03 Aug 2023 15:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576483.902675; Thu, 03 Aug 2023 15:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRajQ-0005yM-FM; Thu, 03 Aug 2023 15:59:20 +0000
Received: by outflank-mailman (input) for mailman id 576483;
 Thu, 03 Aug 2023 15:59:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRajO-0005yA-Tm
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:59:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0617.outbound.protection.outlook.com
 [2a01:111:f400:fe02::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b37741ad-3216-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 17:59:18 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 15:59:17 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 15:59:16 +0000
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
X-Inumbo-ID: b37741ad-3216-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmgmtKrxcuRr/PnScp+m7TsSiaCCjl7U/jIbx2ZwtN7svkQQK0Whs0KPJ88VZMbfKo/YKTzVQ349epPBbKXX45FdaQaqvqgCZdTek7vuBOPSx1ms/2EkxbZhr3Ju/mvksn9nKQrSMmK02sCpNffETfZYgdy7WIGoPondbLOcgCu6JXD14Kg4CDXdkI2oSpk62Br3s3yoXCwQZw0quWwHQAwKorVPfmrk6X4aH/knYhgdb8tkBCBDM9xkcKHZObVGVb+ISOiyKqdwAGWb599Waezs0oz5Bv+UFaQ7A+6J8PfALo2BOzuLyYAbd074PnGPH9foJKsfS6KAhBV5w9WqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SrfcUFGcRPjielCLtr1T77oANmGnKGvI417IekLEVQ=;
 b=LuGGLSxbz9XdIO4zE6JRKCiCWekL2BYNpjhzJ8Fw3+RLBI6hjlewFuHE8ChN5Ty51FC81nDDZszz8XtB67CjieqT5/hEXOcyToUOCSeOTBE6cYDx4TKz944zaLbY3E/uzhlRGKb+hvm7knljluDkao+kcFLrHMHIiZdYWgTAD/bGMjuQ8mCS0AT7ofYDmOGYExvGUP6s7xl/4ZrS6IkzqE/cNX5prxcmnCQVTZA71GEg27BeBWyM7Jum9KTj4IFrElwrAEcdVLFSR+i1eIyTWMY15qMGtaiaF7StCpuP4lDLAjlmB00stF59JowLTCnbPGt0w6yYz6HB+QFGRxyO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SrfcUFGcRPjielCLtr1T77oANmGnKGvI417IekLEVQ=;
 b=EQDJ4J4SadG6QYJsOPHfY3tTTyfMmlTvWZ1VXXAM6rgfSXTbv9iIRYfG9A01sb6FHXNMLNNndrWcrW4avoEt6i7TrEYE6FwO6rd2VvZVdwtLVeGE8kDl8Vl+y1+/V7HzEsmLU9elT6iru1IN9ngFwQBTHRftXJe/WI8+XtjV1fy+Bj3Mh/T/zsnzSZuf/o3nnPIRo4mz8g++eU6yIJyrut9/Wahb3EyEqlnftcjGm59uA+n2cHk8UwHGCqGQSQ4DFCaPJ4e/hgzObNCNKH/8lKc8A9GEMgCL860Hak2prbA1oeoscExrcGhvt6ww4A8zL89w/d2aeEMO6JECyeJpkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb622e00-09c2-df09-1127-63feb63eb961@suse.com>
Date: Thu, 3 Aug 2023 17:59:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [RFC 6/6] capabilities: convert attach debugger into a capability
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230801202006.20322-1-dpsmith@apertussolutions.com>
 <20230801202006.20322-7-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2308011802401.2127516@ubuntu-linux-20-04-desktop>
 <2a651c80-7e44-1ff9-bb63-989605960c72@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2a651c80-7e44-1ff9-bb63-989605960c72@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 51596be4-8036-462c-646a-08db943a9725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KsEHdBs6PAAsymZDnyLU7J3Y/oXt1Hdg/fYX8n2CkugvJUagGJxALfi8/dHJxE8rCfkbOaIxA3dhyPRqrQ1+z0xDnuQedsJO7Gh6b5F/SG9nJ0MYuyoVNaNNAcF6RwE00HdahfVGrqUy4HKvQcy0NaDZcUICYuOqDwm0C4y6BVAlCeY6QWYhO9p0ZF+Zl7xYLe+t76ATRGXbtJBDqK8K3chOVulemNXC+BE1p8NpdN6x3QztA27zvmZ6hl1p61PDazO+qWro9Q1/DPZOBjJzXvlQ5K6cs3zpvQVmM4BHxzK3OQC04IH0l2X96y26UDymV7kydpAyccYp+iQIQ2px6c16HaKTVFIYAevJ4IIv2R2wLk+zA0jPNAYWecU773yyCIGUlTkwwMF0G+gu2ju96ESBrYHMBtj092UfI5N+e4wQN9cpdM0xlOj7zRPNHcZyarjE3kTBHTu28858oToifZhlhiJou0At+7AGVbygyPX+xlVaA7YA4j7xG0Eg9u+EscZBx4+hSbGSvfDc/0GKaOAOLqi75/UQxODeSZ6JQmxJIYLk+k85J5vjTs+53rbS35c9xQbFDaEmQrhQcWsjOmDs9OZ73eMgeoB40ADUSbONfuU3d485sMGhbF1q8TXRhgNJs0NFEk4TGYhn10Tbuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(136003)(376002)(366004)(39860400002)(451199021)(66556008)(41300700001)(6916009)(316002)(2906002)(66946007)(4326008)(66476007)(8936002)(8676002)(5660300002)(26005)(36756003)(53546011)(186003)(6506007)(86362001)(2616005)(31696002)(38100700002)(478600001)(6512007)(54906003)(6486002)(7416002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WitkaGJXcUxCbjhlODMxdGg3Sm5XQ2djNXNJRUFTLzFWYWxmVk1zdDRMd1ZO?=
 =?utf-8?B?L3RmVXZZZkszMHhFSUgxN2JXTFdGTHlCdkc4eVdRRjZIOHhhU3p5NHJGWVpw?=
 =?utf-8?B?Z0lxQzI4V0NqUHVKendHWTNNVi9kM01DZmV3ZDg5VituZEVuK0ZUbnZucS9v?=
 =?utf-8?B?OFdXQ2RzTlZiM08ybmtScXNMRCt0QStlNzlkVEU2aXNNZ3ppK2hEMzNrb2JP?=
 =?utf-8?B?R0Y0K0VlODJrQUl3MlZmZnVQc0pRUWJad1dWOVJkR203M2RURStnczJMRmVN?=
 =?utf-8?B?WS9VamdLL0RHcTZmQm8xUXIwM29tV3cyWUVFTEN1ckMwQ1ZKdnRYL055VTh5?=
 =?utf-8?B?RmhRNXhsQVkwY05TZnBqS3hsNHl0RUFiNHJEVk5NZ2NaVnRoRm8xL215SlpO?=
 =?utf-8?B?Q1NXVEJ6RmhHVWQrREt3eVdqTXR0aVFSQUVad25kaVpwSG92WWZqcmhIRDdV?=
 =?utf-8?B?anF5Q2oybFBJcURwTnFpSE9aYmJUbmkwRFlPSjVxWmtHblEzMDlLQkZ6cm1l?=
 =?utf-8?B?aU9meFI3MmtReko0VE9xWC8xWHg0WHhjcDNCei9iQTNPdldzd01zTlJJTVhU?=
 =?utf-8?B?NDZZSUNzcEdGQ3FhVmlZdUxVVXhYcHhCbDVWTzVUVHpFMEJpM1BGS0pMSHNi?=
 =?utf-8?B?Y3pUQkdSMUhhZS96N05mbUJxWXcyNXdJRWJvSlpTZFJnSXRwaVBCaUExeU13?=
 =?utf-8?B?elNydWl3YjVjazZjNVhuOFZRQWNyU0xXUGJlVXUrRThrYnlyVlVIcDd4VmJl?=
 =?utf-8?B?cHFuaU5qSnN4Q01PR0FzVW5aTjhRZFgwUVVVYi9VZWhDa3Zwa3JPK1JBQ21x?=
 =?utf-8?B?MFRRTElLb2s3ME13OWFhZkQ5aXZnaVVwWEN2WVM5ZXpoNHNpZ0o4eHQyRnRF?=
 =?utf-8?B?TWM5Q2lxUVdEdTdHaXNUbmxFdnltaWVWODZvQXRYRXFwVk1EZ2pFMjZTZEtx?=
 =?utf-8?B?ZnNVWS9MTndRYkRhOVRhVDJHUWxLNFBQWDJLQzl3cFJNYmFLeU5wS0d6eWk5?=
 =?utf-8?B?Rlp3R3FMSngyZFNGSWlpdmc2Y0E3WlM5WVM5ZW9QcnlIQ3FrcFJiYTFaZkVo?=
 =?utf-8?B?bk1zK0RsUEp0V0I5c0N5emsvdVQxWDQ3dmUrUkVtUU05NFMweEZOa0tzRFA4?=
 =?utf-8?B?RUh6ckxFUDlubCtSWVZDRy9FWG96NUV0K3A0VGdwTmhBVUZvamQ0MjVxOTRJ?=
 =?utf-8?B?bkpyQytFcVg1WTN6U2QvdWI4cStBeWxrSENZeGRIbW43R2VNMFB2UDVabklF?=
 =?utf-8?B?VDVUZnhmelZWaWtUL3lUSXo0MWtUdzd6RE1CV3BNMUFWZElnYkJvU2RGV0Fl?=
 =?utf-8?B?cnpNeGJSYVV6d1F3UGtQMm5qMkFVcTlJL2o4UHRPNWVVWURLQWIrQ2hNNFda?=
 =?utf-8?B?emNSNC8wQ2QrZHR0cXZCUGd6c2FJeXNuVUprZkVKM1ZSNWVRUjM1OGx3UjNQ?=
 =?utf-8?B?cnA1UmdHVkg2MW5DbnUyTlU5QjFVL2t3dUlCWFZ6clp4Y0lBZFJGUlZ0bkl0?=
 =?utf-8?B?NFRlU3lzTDFHL1ROVGJqQlNxRnZHeitzYkJHQ1pDaVViLzNia3Mxc1hvQ0pF?=
 =?utf-8?B?aHJETnR0bzQxSGVPeGJqbFBxdzhnTlVhUjlaUW5TSG5lYWIzbzQwQjVvNWJN?=
 =?utf-8?B?RlRTbEVHS0FENU9CdE5wd2dubkhOQzVwek04UFRpZXcvS1ZuM215WWJQdUZn?=
 =?utf-8?B?eWZlS2puWE9NR3Z5RDBTaW1yWGp4VDRZUWtIM0Q5RDZsSDhvZFVZQmowa0NW?=
 =?utf-8?B?V2g2ek5CRUswVnBJcDNwL3JlTXBnVkhtT0dveWZTeGZzL2gwTm1HZUdaeEkx?=
 =?utf-8?B?YTdjZVBJZ2dPeVNjUzRoV01PTVdvMm55MGZ3Z2dSUFJZMklDUUlBOUhobzkv?=
 =?utf-8?B?S1gzNnhZNmNJVGoxMVZreTRCWXh4SHdFQW1IQWV1SHh5Mnp2ajhrNDNLcHB1?=
 =?utf-8?B?TFNyRzJNY0x3MVU3T1ZWWkVrTksxWk1ManBZTU85ZlpCM2phZkdKMDhRK0hV?=
 =?utf-8?B?dWJZYWl6em9HZXM4RFRBclRVN3drV24yWFVmdUVrQ2xoZVlIdzJqNGxLUE5s?=
 =?utf-8?B?VS91cFRxcFRnaUV4MlF0SFkxOUFpQkQzWkNpdVQya0VBenloNzAySlBFeVYw?=
 =?utf-8?Q?ZwB8LSbPohJyxmmdsDOVq+B3a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51596be4-8036-462c-646a-08db943a9725
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 15:59:16.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNM8bU1PJuyXST94Ln/u4wtJUu5hmkg873Z2lwaxRfEBIHPjyXgR4X0SXtiAujEFVVXBlss86gOVl2Y39+GhOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140

On 03.08.2023 17:52, Daniel P. Smith wrote:
> On 8/1/23 21:06, Stefano Stabellini wrote:
>> On Tue, 1 Aug 2023, Daniel P. Smith wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -474,9 +474,8 @@ struct domain
>>>       uint8_t          role;
>>>   #define CAP_CONSOLE_IO         (1U<<0)
>>>   #define CAP_DISABLE_CPU_FAULT  (1U<<1)
>>> -    uint8_t          capabilities;
>>> -    /* Is this guest being debugged by dom0? */
>>> -    bool             debugger_attached;
>>> +#define CAP_DEBUGGER_ATTACH    (1U<<2)
>>> +    uint16_t         capabilities;
>>
>> No need to switch to uint16_t just yet?
> 
> I know space is tight in struct domain, wanted to reclaim the freed 
> space into capabilities (or roles). One thing I was considering if 
> enough space could be found is instead replace it all with a pointer to 
> a new struct that held these values. It would allow using heap space and 
> future growth of the structure. As of this patch, it is consuming 5 
> bytes and would need to find an additional 3 bytes. Is there a 
> willingness to entertain such an approach?

Usually we do such conversion when data belonging to a subsystem (for lack
of a better term) grows big enough, not right away when eventual data size
isn't even known yet.

Jan

