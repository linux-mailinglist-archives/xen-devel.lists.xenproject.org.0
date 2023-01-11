Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AC9665E45
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 15:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475561.737289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcOW-0008Mx-GU; Wed, 11 Jan 2023 14:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475561.737289; Wed, 11 Jan 2023 14:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFcOW-0008KS-DW; Wed, 11 Jan 2023 14:48:00 +0000
Received: by outflank-mailman (input) for mailman id 475561;
 Wed, 11 Jan 2023 14:47:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFcOU-0008KI-Gc
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 14:47:58 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efd3e813-91be-11ed-91b6-6bf2151ebd3b;
 Wed, 11 Jan 2023 15:47:57 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9399.eurprd04.prod.outlook.com (2603:10a6:102:2b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:47:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 14:47:55 +0000
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
X-Inumbo-ID: efd3e813-91be-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IIhyscHN3roRN3iTTia8efG8JLElZA92SbjJuRZgFV4tuRwH5OkNHQaBf4bFpanZB371WIWR7Dggw9inyW3j7WZyNes+d4Y3ep/glcygXsj+qBBGh0mgmtrV4IKHnyumZ+SPAMKA6ea7ep3sWGH4O+kbYfDlFlZH/tsBk5clFNCXxNx9FAIfTvrTgXcgbI9W180ckNPF1iji/MwHztcR5jz5csvL8W0TfMMR4wFG6JOftn59+jWuDCS0ikMmfBtHO1loMs5p24XB8Wua/qE7HtrmV6FkE4lY/cCRzxc7qwc/XfUZKRlVOT5T/MPtjS6lRQxX+t5EY+haCLyD41+2Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdoXEti/lpxrYlLx7N4cmaE1xWLxL+GISh9xXSn2meI=;
 b=I73yptCvK91JzqS8aiatNhqoyxnSteJ5E5CENoZC8rKHK7O2LrRBNzyZU8YDLTVGZxQ0q6vvwE0CaglScjib1zEHrdRmB4G/xR7O9n3YFH2gy5qFac9buQVNDPI+BHnWDgj2lpdos6/xw4OjANBC+4n0V1/FSC2l3jQ7dFOEClhDe3rWCRDvXXeTOG2NM/JR/60xNYAuLl9JyxgPJB3htpa7rCN3UiEsjg7WwArlNTXfhmvOu8NP+uNSNc+huiI029tVOHUDvO+lyDV7WBLBZuNZmbrpTbIJNtmxytFj8lo8/K4fB+qnIxOG5wcgfl+/1f4InvJNsOSnjXxC15KQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdoXEti/lpxrYlLx7N4cmaE1xWLxL+GISh9xXSn2meI=;
 b=utDeqBw+nqCTNv7yrO4jUPIZ0aw34fBntngBFDEff7AkK3ou4ZwCpH2Wl4VpHLyXjc3zUJM8z7RXeMnsYeuSWtAjWQ9AQ/NIHZYTdTuhDtzwkoVFpRn5+JV+dW3qGsKbFTQUTXh5McP55ITldIv0oIcBYlIEabKhUkK2SRmyki4yEJN0nFJoMjU6zW31VFbzW5q8fa4tDOGBCMidng5SD3HD4Jai5kvfpJLqK7CGeT8OqvlS514z4V7D8OBsMTXoRLb1E0OBZKPKNJbmi/y1+0tyEBPjlq+oIbmv3efHMfVEF5j2iii8NYbuMV/gbrclmtoD0T7kJB0Qk4uuGugEzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <41ae2fa8-27a3-72d4-ab20-100085c55ba2@suse.com>
Date: Wed, 11 Jan 2023 15:47:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 18/22] x86/setup: do not create valid mappings when
 directmap=no
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-19-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-19-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: cacf34b4-e117-4e45-05c6-08daf3e2d2e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H0jN9fFSrJK66BlrtmJ8U939nj/69O0X9G3tJYbRplwhKQGRE27eD5eR3eL7oa1NFNFM7j0vLT/2ymUFQNU4IOY7mCXjdOn4sKzKka5bpXwSwWfh0tXAGAaNEnkY7WbeHkXsF0z0N2oLsXZwQSLIDiYm28Uw1nW6h/JQpKw8nj71Dp7fM8y9mNoaUoKQluSeb+KLzCCvoF0enhAnkMyoYYTLkUkEGIdI7E9PyJjDWexOp2Md65F/1Lo3NazwV8ajlKB9SiiR0pDyRSKm/5G7I/06/kRNeDgnvFtFMfNlEteeALAA5Msc939BzifsFpqur1FaOR5aJNdiDqLJ/M2ly6kNa09ZVEo4GMLm0dyLt7kuNg1yZTYB+FBAqbmfBmM54uu+v5uuoU+Aw/PmLQFAafAN+KvOl1k4MsWJ5GsNAPwD1fisb0zSErIPnoEPGZBpgt2mmmj9AQEqzrHhku109DEXK5Aj6bFQPyyhBvIUojs9Fcdc/CdYn/C7GCbT63OFZW4dZziPSNSudkqBWM+IU1rySJD1iYbkN7VwRmkwjrifanThSg/NkCJ+0UM+dcF3jK0NwH5sD1PS9dQSd9rPVYaTxzDLwkLvN69BzW/565cQ9dZGprck4VJQyXqZG840PQkYB7f0RhFUGNXZAF7ufqXjNfeTlzTYsrGYQ/HMeVbCF38Kt+IYp2O0XngC3XF+9MRd4Mfpv6VXfmvZRdPmOjwStxtcqMZfztVvd5Zh26g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199015)(5660300002)(4744005)(8936002)(41300700001)(31686004)(2906002)(36756003)(66946007)(54906003)(8676002)(6916009)(66476007)(4326008)(316002)(66556008)(6512007)(186003)(6506007)(86362001)(478600001)(6486002)(53546011)(26005)(31696002)(2616005)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG51Q1BmbFpGZm9qcWNIbUloQXY2U2tEa0V4ZWRQRExvY05IWjRMeGZQc1ZM?=
 =?utf-8?B?MFVzTHBVL3VCSmxXNUZ3ZFVUc0ZqN25Xb01rTG9rdXIwL0xSZWdpaW1tYmpR?=
 =?utf-8?B?elpkVFN3SlpLc1ZyMkRtOE5tWWFQejc1WHd6YlB1VStKbTR6Z1o5cC83R3B5?=
 =?utf-8?B?REc1cktVV3hXbllLRFI5VHNVSWc3NitGUzU1eUo0YXRCcGV0cXVxSWNwTmxo?=
 =?utf-8?B?WVJqZE9ETHNTMHhHMnFZOUhodlZPK3h0RVlLOWZZZGVWWERtQVMzSEFjK0xr?=
 =?utf-8?B?ZE9uVThQK1EyWXhId3pnbFJoRHAvSFVzcyttSTU3V2EyR2c5SDRNZWxwRy9p?=
 =?utf-8?B?T216UXFGQlpzaG16MEJhQ2luY3NZeUxYWTN2N3lDY2hEODk2cDdxMlpTZVR6?=
 =?utf-8?B?R0F3aitFZXp2TWVtVVdhUkJ2d3BzWXk4bnB4K3U3V1B2NmJOQlhJekVncXh2?=
 =?utf-8?B?SWhpREdZS1JGVlZ6M3k0c0hIdHhjakFGWGE4a1MvWjRscmlpODZvR3p2bzJp?=
 =?utf-8?B?REpFaGxTUzNyc3pESlN0TnZVQ3BIQTUrR2RwdHp5djZSZTdKdE1wd1UxZHVH?=
 =?utf-8?B?ZHNEZmhXdVNQOHdsd3VTVHBjNFUrVng4c0FSWXhNc1NCSVVvRysrVTV0WXV5?=
 =?utf-8?B?Ungwb3FUYU5kOEc5Ylc1ajhEM0tFUFNIdVRNazB3RXVmajdPdmZmZ3JUSUd6?=
 =?utf-8?B?RFZVbEs5ZW50SFZsVFVyZG9EL2w3UEQxalNoSXIwYVRZeGlEeUZBUW5HN1lv?=
 =?utf-8?B?U05SU29WNGRVSklyalR6UVdESzUzNVFZUzMzK3NxMUo4VENoTnJLUHJHUG16?=
 =?utf-8?B?MHpaRDlEdUpoZDhieE5tYnpubkJQQ1VQblF4WE14dW1FUVROSlBxK1ZTUVkx?=
 =?utf-8?B?d0FNQ3VPcTdqczVJVlZBQlk3NjNMYjBETmdqK2JJZGdVRnpBbFZjQldtcER6?=
 =?utf-8?B?YnNOMWRNWENDTTF0WWk3aVJ1SEFLdmhGTVRuZUE4blpXcnFvTnc4eEdwa2Qw?=
 =?utf-8?B?MGU2QVpLNE4vVXdENnpLVnBqaVdhenBhMkp6R3pNTFlQaUxWdVF4VVdDdXBV?=
 =?utf-8?B?S25oWk56aEZLSHg2QnNsVzBxMkVmK0VDUGhna2kvczh4TXZCTFBkU01lekhw?=
 =?utf-8?B?L2hqdzlmc095eE9qL0luZFRxZTBGQmJnMjdnRXl6TG5kRWc3TGpocGFEN0dv?=
 =?utf-8?B?Mms5TGZhRFJralI4NHlOZE4vRDNPLzFvb3dRMmtCWVVxK2hUR1JISVVzd3ND?=
 =?utf-8?B?bnJBaTRrNmVaVUplUmEwVDBtOG43ZjNCb0Z4eEhmVUZ2MWtlcm5vdEVWVnlF?=
 =?utf-8?B?ZzhXYW1CbDV6d2lSME52aElQSThJcVlVQkcxZ2Y3MUVYcS9GdzB4ekJaNVJh?=
 =?utf-8?B?c1hXTStjSlJqUWQzeVNuYTQ1MExGekVUSDNZSXlKZnQzclJ1QTQvWkVQUFAz?=
 =?utf-8?B?SHVUYWxCOStVTGp0VFN2N1Jsa3BBaVQ1aTYyL2o2R2dLMzM5MDFJU2kzazhV?=
 =?utf-8?B?UVFTa1JHQUkxV3g4K1dibUcrb2xzbDUzcWtDbmJ4N05DZEcwUElCSWxXZ05K?=
 =?utf-8?B?QS8wOWtvcnF0WmxyWkI2eG5SVjZCUE0vWVk4UmZDUU9WVHRwVGlNSG5KbEc4?=
 =?utf-8?B?TVh1SjJBRDJzenlvY1gwckJwQSttYWVGMDRiSlFKZi9kL1BzU2FKcnBWTTlD?=
 =?utf-8?B?S2dGWW1OVk9vWXFoanRZL2NsK0R2QUd5SWlHZlhyME9MKzRBdStEaVJ4NGxI?=
 =?utf-8?B?ckpuczZ0T0RHU2pRYWlUay9uV0Q2RjdVTklTR0NsS0tTRjh5OHhmV1RLekpL?=
 =?utf-8?B?cUI5MWpoL1R0bGZpZEZjRTZyM2paY1ArWVN4bFJtcUFIWkdqZld0SllHUWhY?=
 =?utf-8?B?MytYUjBTdm9FeDhlQjVhVzZBMjB6eEhNYkFjMUtpbExVTmNVSTFrTUNheURv?=
 =?utf-8?B?cGRYajZGZnJPTGQ2U1ZFLzNuaUFCT21kRzllMlk2VUpIY1NDL0lEWlBGZzdj?=
 =?utf-8?B?Q2QxemxxZ0Rha2h3aVpQSUZ1YzJ0NVgxVGplOVBTNlZKSE1VM1VsN0h0REsz?=
 =?utf-8?B?UmFSY1ZsV2dyYk9Qd0UyelEvejNuZDhvdTBmU2NNMzJjQWY5RWtVdlc4RDZD?=
 =?utf-8?Q?/0X7UTkIDzdV+NP9N5DFKg+j5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cacf34b4-e117-4e45-05c6-08daf3e2d2e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 14:47:55.4957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t+fKBe4ntvDO5V5ktY10qiZMy+PwQZmS6lpgIUmv7uudTm9J0fO2S/bSOJJ607m9v34U8ijRTD7Mj8Pz8SanYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9399

On 16.12.2022 12:48, Julien Grall wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> Create empty mappings in the second e820 pass. Also, destroy existing
> direct map mappings created in the first pass.

Could you remind me (perhaps say a word here) why these need creating then
in the first place?

Jan

