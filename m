Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E794726191
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 15:42:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544792.850806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tQO-0008Ey-TF; Wed, 07 Jun 2023 13:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544792.850806; Wed, 07 Jun 2023 13:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6tQO-0008Cq-PQ; Wed, 07 Jun 2023 13:42:08 +0000
Received: by outflank-mailman (input) for mailman id 544792;
 Wed, 07 Jun 2023 13:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6tQN-0007uj-41
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 13:42:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16b3361b-0539-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 15:42:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8698.eurprd04.prod.outlook.com (2603:10a6:20b:43d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 13:42:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 13:42:02 +0000
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
X-Inumbo-ID: 16b3361b-0539-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by5nRT545AJSWkSL9EraCx5i5aSDsfLfd7zQJSwNFGbc3NEqPF88iEK1klBtzoJoF0bh+qWT5G0oHujntEA2b8rK8A2idPM07QA1i/32mp1dpyE7JnJoSNcEi+LX4mCearxeDUH216TdVCfSzm5VdqHZDrSB5Y7pVPy+30Or8W2Zx+Vy2bDpIlklRMGYsWIn08/5TdbX31uEJGAZGu70BfSFLRnzU9SWdMktxoQ96pI5BX9AqwHAR1ho9I13eAsel/I8XnFxQ7O60o+fAb6waH3MHa9ZxlvOQBViMaMZ1j9VdRJnnef6165EMk8T2gEMkFAQf6yDZlsCbW1sLfrbKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZtgqitJeU1NED135HtzzAhU8zoe9Ra9zb/jcn6PWSY=;
 b=b+nqBErRNRGafOsdauUVI+oMBIF7lAA7KamzkIA+p8+XIja3iX9JhZAPE0efpG5OhEbjLKIBfKM2txfTOr5pviiJdtJ1N2goHCaonvkSbdkirVZHjtv/PDFz7LVLrMDFfXvidC5YK23vSpTHyRpFHXMtTIMVLty2J/QnIqYbi9YzSbhLhl0HuPm2rbhjhaII4QjmOk//NBeRAWeEeg1wReiO3PBFkCo8JSijf3e5URK91+zOJ2xj/UMIrMJR0j8LBpWAoVP5KA6c/POW1//00/IQaO0cr3Uf/zt53qZ5wN2YKkw+lUyHzEiY1fIR0Zmbh3TYDPjO8faU04pep5FOPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZtgqitJeU1NED135HtzzAhU8zoe9Ra9zb/jcn6PWSY=;
 b=mtXI9Ukv075U0anIbcXL7BEkT7us9np1nc5tY1yw6mbpppcG+ioq6tDdhw5Q727auFgrwOOA+BAO9t2Ar9ON8v7LWjHgENXOc7F7pq/rOrm+qgrupOurLJJDaDMPw7lrb8Mjvvj4GxjZYTdqqPGgQ2hq4t7S97l/Gj4GaLRbeSXTtOSwrxhhye4Z+ucmDLNHjM0fY2KAsV+LcAnFWfITcTa1b/y5tSd7J2LoyLW/OoAtb/lUIXqujQlRl/p6GMY7EbvkFXz8ayG3XS7PQjyTzZBHjOZPiMDHL0K0PQV4L39KrmSMyUiXE1efVnhVPqXuktpqFuzpYYTr6/O0KzT0nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <97f1cd06-07b2-992f-15b5-e8367a50b8cf@suse.com>
Date: Wed, 7 Jun 2023 15:41:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
 <74765c0b-f463-896d-8f69-ecb1cf55cee0@suse.com>
 <f34437de-6c79-c960-21f4-b18c19387539@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f34437de-6c79-c960-21f4-b18c19387539@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d11f58-dd80-4c30-75f4-08db675cf913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yKSCwTcLlPaXf6dah5ShRJHW8twYORHyDQlaZExdMHS/V92ghAz6N/Xx7UECUfThC4SVUc1X3memrosJ9GyMh/IPK59r3/9R+F+GLiAarnYVb0x1r1WxhypC/szyHMNzj8W7X0UgsdcHbAA8tXYSlJvqfLYRoxF9AWhTEiKMQ+LWCrfzamU64i53ARC8BVCeQlT7+poUSMJA5IrOvESrgy7krLxxkZl5Hm2rYabjez/gtyJEERksylcxVsDuIzpqNvLra3dIS0+twPsNlkvcofQbpwSdYz0+Dhz9N14Z6667YRRKDCiPKAlOdUpiEFm4irYcnCIKmpAFqSgxpqqFOmJy5rAIUDjS08KYDhpxqVlO+Z2joYe8qcCPyS8mfmP4JewZ/HPweFNLsMJxDf//zYYRfxWoFxMcDnzLQVg5I0ZpGLKHzddzdR0VT38Fonb+0r2c80KUKKRH1GmRR9zXqBSZJpIyEpUPkFyrCWlpdBGYzQ7uChg7OjYd+8tKEwwRxOt06X26PePm6AsNl2u2JAN2p6dbgH4zBjmeTv4YVgXxtE5ozI5eYe2WtY2+vXPohl+JEMhZka14Z+Yz+BGOiE/jCjONuiaQ9j3tHvZHn0qJkHF7HbGu0NhkQmT+BdhaCYm5uIKuT8NwRXKIDHpBgw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(6512007)(53546011)(2616005)(26005)(6506007)(31686004)(316002)(83380400001)(4326008)(66476007)(66946007)(6916009)(66556008)(966005)(6486002)(6666004)(186003)(31696002)(478600001)(54906003)(36756003)(4744005)(2906002)(66899021)(5660300002)(8676002)(8936002)(86362001)(41300700001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTEvTEowenMxWWVKM1hSY0FaVVYxRTRaSnZHVHMrYkpEYlNuc0c2SmpwNGxY?=
 =?utf-8?B?WjhUbnBMWlZBVE4zVXZwVG9qelQ2b09OQ2trRWdhR3k3TVJaMWJQeHhxRmIx?=
 =?utf-8?B?QnJmbHNuVVZrTmF2VUpacVcxMzZOcVc1cVV5ZlJGdFg0N0xTUEx2SjFHYS9I?=
 =?utf-8?B?K2E1Z2lsTlkxbVowZEQ3RDlmTG1WT0hvRlhJaGJ3bVBjUDRNcEY1WitJcmto?=
 =?utf-8?B?T2FaRUJybm1uM2xqL2dtenlTYUZ2N1FCUVRPc3YyS29pR28ycXlkMllsSHlw?=
 =?utf-8?B?dURxWWZPbjBPb2tZZmp0QnZ3N2JDcHd2U0t5Vlg2MWxET0psSmFJS3czTVlZ?=
 =?utf-8?B?c0hDYmdGODQzWkk0Z1drelNaUGRsRmU3VVMrY0RoNVFzSzZyb3J2VE5FclpU?=
 =?utf-8?B?ZmF1OFNMYVVKT0NmdU5qODFuelByczcydHUwbTV5VlRkTGNISFVrQTBaWGVJ?=
 =?utf-8?B?aU1nQzZwWFArc1FvdVJBcnAvS2dRZ2xKM3hnRDlkUjFsQVlyQUpQZ3E3MlRC?=
 =?utf-8?B?QkpNbGV5S0JtYmN1UGRYWHFuOUtYN08yeXplRW5WbFRJejBCTnd4VmsrRGVx?=
 =?utf-8?B?VjhRWDdpaUtUYnZQb2JQVi8rNjRIdlVOK3pmSjJ4U0NScGFPZjhOZXlJZ3lt?=
 =?utf-8?B?R0dtdlhIUVNCb0JvUFQrZzBacC9OTDFGWk1mSmtxN0VvVi80QnhFM0JBY1JO?=
 =?utf-8?B?ZDVOVXcyV0ZGc1ltZjAyOEZIVXEzRVNYZWNlT2Y1QVFFVFlLdnhaTXlMUUxW?=
 =?utf-8?B?Wmo5ZnhRdzNxUTM4cTF0b1Q2UDAreENRM1ZhSnowQnptSUs2cHJreHpRS1R3?=
 =?utf-8?B?TnNEWGlpTStzVXdmOE5ZMXZuUjd6bjFvdGxvTUQwNW9kT0FxWmdGNm1HRnor?=
 =?utf-8?B?OXdLV1VzREcydVk2WnZZY3JOaU53SEhOOERCM2s4aVlzMkVZSm8zaUJ5VzFK?=
 =?utf-8?B?QS80S3lMNGp1ZVpCcFd4S3BqelJZc3NyYmlpS0c5b1BuVktRZEF1NUhTV3kz?=
 =?utf-8?B?cWZBRVE2dXdjV2Z6dk92UElOLzVzb2JkS0FoZzd4MU9oZEVvTU9kdU9jTVNE?=
 =?utf-8?B?ZDZqRzhNL1hrR24zdDRqYkFSNVdzVkRJZGFDWjhpeXJHNXk3YTZKOGpHaUNN?=
 =?utf-8?B?Tkh1VkZqclNEbzRMYjdDTDZlQitFWHRJMXZsc1ZmM0lxeHBkSllLMWI4ZHRZ?=
 =?utf-8?B?ZFF3SmxlbHpOVjRJR2VEdmdYakwvSys3YktPaGM2Y1pLWU1Qdkl1Z1plSUtx?=
 =?utf-8?B?bGdXbDRDU0dpZ1FlWllhL3Vqbks3R3RnSXUxelRwVDQ2Y1EwblVBanhDSlRB?=
 =?utf-8?B?SnNacGFscXpVR21iL1FqNlZONlcyWmJyRXJ5YURkTWxKemRLaFA5Ulh2MVVO?=
 =?utf-8?B?S2ZxTGtDaXVhYm1vVXVYVEx2RjNWWW1iSVdSdDkyTy80cjc0M0Y5UnhseWdQ?=
 =?utf-8?B?WS9mTy94ZWpMWk8xMUhSajJmbSsvQzM1NXo5L0tYSjhNdUNmeUVyd1h4TkFa?=
 =?utf-8?B?TnRiWmV1TzNueE9MWkJoZmR4MVlacHJ0RVp0ZlFJM2pCY0dSNkVTbzBjWDFi?=
 =?utf-8?B?aS9lLzkwSWFTWXJZd251NU92YUdrS3VvdXMvMmlNeHVDa2RZTEtDRmZ4b2Rh?=
 =?utf-8?B?SU1iS2E0OWtlMmo2UWEzM25ROGJQYkhqdXpoNktDRFl6WDFXeVpBZnlSMzg1?=
 =?utf-8?B?dThmVXNaaDhlRC9ySytvQmwrWjdBdU01WU1HVzBOd0g1WEZUSEZQdFNYVDBC?=
 =?utf-8?B?QkUxTnFCUjI2eDRWVlFBL0NWcm93amJIY2RDSG5JVnpyM1hxU01XY2tMMDc2?=
 =?utf-8?B?MVNMOCs1N1dYT2h3V3pJMGE3SWY0M1V0bTNBUFRsSTVtaHlIdVVQYzUwMEFx?=
 =?utf-8?B?dHZ1V2IrRmhmdWpVS0tUd3Q3M29saTFCeTNsbVl4RFV2ZHE2M0kxeG9ENmRx?=
 =?utf-8?B?T0RJUjZ3aWFrZFYycUw3V1N6WjArbFdDeHVucWZxc1BwQnpBR25sSHFSNlRz?=
 =?utf-8?B?T1RjRTBsTUVaRnpUMlpGUUlEWFZjd0M3WURGUFhBTmJ2K3R4bXNoQVAvU0Zu?=
 =?utf-8?B?YktiUHNobzcrVVZ6K3M0WDYwc00xdmVwbzdRcGdPL0t1aU1WbXhTaXh4Slgr?=
 =?utf-8?Q?GJS9CLacd5X+GiOL9XJprS4Rv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d11f58-dd80-4c30-75f4-08db675cf913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 13:42:01.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1zReTT5KQzWPxApVjl18zbOZE5oZD+XReGR4S4aTnJMdun4IS7YYI0MWvv0oPnnJkoRxCgQY/IQ4FOYzOKr1Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8698

On 07.06.2023 14:45, Stewart Hildebrand wrote:
> On 6/7/23 03:59, Jan Beulich wrote:
>> On 07.06.2023 05:02, Stewart Hildebrand wrote:
>>> --- a/xen/include/xen/iommu.h
>>> +++ b/xen/include/xen/iommu.h
>>> @@ -26,6 +26,9 @@
>>>  #include <xen/spinlock.h>
>>>  #include <public/domctl.h>
>>>  #include <public/hvm/ioreq.h>
>>> +#ifdef CONFIG_ACPI
>>> +#include <asm/acpi.h>
>>> +#endif
>>
>> This header is supposed to be usable without #ifdef, and then ...
> 
> You suggested adding the #ifdef
> 
> https://lists.xenproject.org/archives/html/xen-devel/2023-05/msg01409.html
> 
> Please clarify

Hmm, indeed. Which is a sign that neither solution is really nice. I
guess the one with #ifdef is slightly preferable because it'll avoid
(as said in the earlier reply you refer to above) the need for every
arch, even if ignorant of ACPI altogether, needing to have an
asm/acpi.h. I guess we really need to deal with all of this better
in / by having suitable common code.

Jan

