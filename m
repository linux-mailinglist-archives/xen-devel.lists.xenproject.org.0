Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED7C7CF5AB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619166.963793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQaa-0002a9-Ov; Thu, 19 Oct 2023 10:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619166.963793; Thu, 19 Oct 2023 10:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQaa-0002XH-M5; Thu, 19 Oct 2023 10:49:16 +0000
Received: by outflank-mailman (input) for mailman id 619166;
 Thu, 19 Oct 2023 10:49:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQaZ-0002X0-6h
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:49:15 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23f63334-6e6d-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 12:49:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 10:49:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:49:10 +0000
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
X-Inumbo-ID: 23f63334-6e6d-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYRWh9AlyOEZCPh88+1XwXuAMmvR7TEy+5J9j+Ij4TZ+pa9ejIwUO5knc5gRHqx4KtqFLZoIr0hJtw0qZnt4x+59v6o4HBAD/ZHeqXS5nb0fQfG0Z9qjIT2YO+nJdrQ86baYIO3/kmD34E2PKN4c0zPx6D67TI+8wq/l5eq3gUine8qB1TKKOZsxVw2qjLMTxulNruZeA48JiyevlvALzihj2HrBoxccX5zjSiislfbPpoLbvt1chq9Y8CKXgZlnDcVftoE1EGpx4/MXEon0xpqhE4444h6p94aZy5zwV7bllctXvxdBx8duVm/PtfkijISio/ABvxUTIJJSDIGRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVjbXoRLzrAgp/ihPPVwM/kGZFysrF9AM61GmSMhvxg=;
 b=muhpA/TQnuUjyB626AiUwOZ+BiyVa6+7KVm+D73MVJhzZFDf+XEb/yMwDow3Y9tvlegJKq226w8akj3gAHb/fXeI93YJaIlHZoitknkBMYS8WCZejpEtYgb6cQlZz3F/hTkm+uUM4rfT/judwWkfHWSr8AYg4B8fCfIYN4zPR9JgPug9+7dmMAwc1u9wPpRuBVwZvd+LcwYbDGve3Q6HvqKzJEkWhWlAhugqJYir499sAF1NgDJ0ZcTGl/pQLtAnUkFGqlfQo1r1oVSTEhgXua6+bFefyigVJMKcPUYAmnjLB31A/+xNdfZtL7zsQi+Wng0tx803gxRrA/jMn6X02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVjbXoRLzrAgp/ihPPVwM/kGZFysrF9AM61GmSMhvxg=;
 b=pnc4GWFIjSUxM8Ia+Y+zX6ipHNKUk1023jBDjzO/TskxzwMpbrJz3Mv61F9zLPM1lZ1D2b7xcshsjnsAKuAyZzCJFzbuJfOzUj53sz6cBAnn2A0k0z0umU18BYll67FlrndZA2Xde4B4wY1TkhNJORrIllxMOBQsfFNflAOx2Duf52dISe45sXX2IDbYXMFX3udJ972jv2aQ6L6hdx+/8QNxChoSX0h3YitN02i9A+H9p5RYgLuNSGs9fgsrkM8tdSldSuevFZ0W5twI6cc1hUFxH8HYw96ZdREG68LfHmioxU0HGPxPHhFap4IKwVXfE0E6i4Wl/PIeh5Zn5no45A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bacfc35a-43a9-7b52-12eb-f0d828dd44dc@suse.com>
Date: Thu, 19 Oct 2023 12:49:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 02/29] xen/asm-generic: introduce stub header paging.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <5def596788d602b9b34302630c91644952c7115d.1694702259.git.oleksii.kurochko@gmail.com>
 <0911e74f-73e1-6053-ce1f-ecea98ea5f17@suse.com>
 <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c474dde4-3175-426b-a10d-43e816f9fe27@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 1923d809-992c-47c5-c4fe-08dbd09106b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qWfVBP6zUZ4r/xMSTO1Q54EqkeppotkOn39PuA8oDvQiy6ZgGje6BcO3sccv2d3fwGsw3wZ5uooY0+92EHN5xIik4nCFIDo2JUaGDZohIR6F1XjKAyvOLWt2JgFRRzIOTxZz8kxh1DT05SF8lipp6BFee+DrU9bJHb4GFSt3d7JQYDC3ru4coPzEkBDIrbvxP0ykKItbodgSJZ0CXL0QBsOLLg3ZYAehv4NCKq6SZmVe2Nc3CQYVCzb1bNXIV1Lbr+xnY+q98WFUM7dXqN5EJWgHTMQLDEK9LXBIXwfPdclM5ndahgaV+gmB4v+V6JHrM4KiNnUsU1OE/VM5bQ6MeBSeOS5QTjlKyd9oqFBDfssJPekumvt9HxtSR3Mj+G4QDLQm9Q0qoSjsZMX7kgR59QH47P22dT3ppGPj3SO8XsoMxhkIlTPWZuMtPdOkp4MGz7lgbaWj/FXS1NyLcPHsI4VtLVZjdjwiDl++0FG09c3adhUvMUqvn+tQiDN+a7iOxm4Pn5j89vgXoLE33b3J9Dlr+b9qhGOsImkee3lUlbYs3Pzqs/Gp2nVW+AbOAumLDdoKj9EbSqe6Ev+dCc/TxE0YUNTqMScb79ylzgj12Sh4urnbj4iRPPslfY6jBJOwikDbhS5DBsWwm52ulWyooN1uGCpL/sUPHvW5O56RmqA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(26005)(2616005)(83380400001)(6506007)(8936002)(53546011)(6486002)(316002)(2906002)(8676002)(4326008)(5660300002)(41300700001)(478600001)(54906003)(66556008)(66476007)(66946007)(110136005)(86362001)(38100700002)(31696002)(36756003)(31686004)(6512007)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjdOSG1EQldDUWtDMm1wUUpMeGNHK21uN3dlNWxFMDYrTmp4cVZRMHNBWnow?=
 =?utf-8?B?T0hMUlpXS2hNZjI2K1k0UTRsczNFWnhneE9UcmtqVlRZY3hRNVBDQnZaVzAy?=
 =?utf-8?B?YzRBV2haV0lPVkcxUWpjSlQ2cUpWVnVBMkJnM0RqWGFVbDF4bFBDQWJHTEw1?=
 =?utf-8?B?K3lLOHdFK3ppd3QyUndmVTMvOUR2b3VyMGFpRmlnaURPb1FadUlKdGJDenBx?=
 =?utf-8?B?M2c4U1RaMU5NK0Jwb3J2eUxLZzdSMlFNWWh0NVJMN1BoeVl1WlcyL1ZaQW9I?=
 =?utf-8?B?aDVKV2VYN3FmTEdvUm9GK3Q3WTFWR3FhL25sQVhCT0lGRzNvTk1Qc3U2MjZU?=
 =?utf-8?B?cVczNmFXeGsyRWNzNzdRK2FFNGJTeXFiNzRTR3B6T1BsY1RnNldXcUFKQVJx?=
 =?utf-8?B?Z0FURTQvSHBBS2d5bEJDc0pIdnFyT3VMZnhEY1FsbHg2STY1UHk3ZXRKOGhq?=
 =?utf-8?B?ZitBVDg3OVJTYS9XMXUxUUFTckpaalFDQkQ4MVFWQStqYi9YQ1NqbmxmUHor?=
 =?utf-8?B?QVJUVkg3QUFnVDBCeHZBRXUzR1E2ZllYRHpiZ09lRmxvcGhhbjV2TXlwVUNp?=
 =?utf-8?B?NXFCUDNKT1UyZEVyaGF5VVE0ZTZuSGphdEhaS2s0b0RjYTQ2aHNrTVRTYy9v?=
 =?utf-8?B?TFBXRlhmWmdndE9lR2pMSUR2QWZRT2xxQ2dwcE1ZMGpLNTg3UXUzOUMwc0VH?=
 =?utf-8?B?Ky80QW9PSkd2aDZiUG51QmVPNTlCbmFSa1h6TnBzdmt0TkUydERmMkVzOFJv?=
 =?utf-8?B?c1lpMEdiajh3US9WTTRrelYrem5LVWprOS9JdXVCU3F2Zko5Mnl4bXZBaFND?=
 =?utf-8?B?MUt5VHl0K3VGcVJmSHNBTFpleGVvL0x2cFd1bVo0NHM4aUxTeTBad0tvY3la?=
 =?utf-8?B?di9scWNtcFBtZ01vRzdaSkRja29zdEdYaUkwa0F1RWhYUFp4T1JyT050RkY3?=
 =?utf-8?B?aEExMlZZcThuWS9HUFVHK3NlOW0zdElDYXNHNEFLVHFSRVBSQmd4RVE1SjZX?=
 =?utf-8?B?R1pQU2pjeEJ2SytQcE5FcHhzYThWR3c4ZHdjZGxhc09PSlJwK3diMElka3ZE?=
 =?utf-8?B?MENKTFNHK2FBVm1HM0JCUFdOQVhDNHY0LzBwMDZCaXlLUDZjUFhUOS9IN05G?=
 =?utf-8?B?YmZtZHJCc0tzc2ZSMXN0cTkrTlZkS255WlI5dHhaeG05YzBJNGw1S2hSWVBh?=
 =?utf-8?B?Zis1dDJmSXpxSlN4b2xTeHhaTU1YU1E1Rndsb29FYUdaMXQwRmVjL1JqWDJv?=
 =?utf-8?B?Sy9hcU9PYzFTMWhhYnpqSmliVmZ1K0lsTUZ0cUEyUnBleERIY1FhMjJUbTdt?=
 =?utf-8?B?aERyY0N1QjlxWWF0R2Znb2hVT2kxVEFteFcrYU9YMTlob3hqTnJ3TXpjV04r?=
 =?utf-8?B?RUx1ZmlnTHlVQzdIK0d0UVd4YzdxTUZOc0hZeUVTSXlHVmhFQ25tWC96aWIz?=
 =?utf-8?B?WE5YaDhSSGZrYWkrdHhDNi93dS8yYnVwTmRzR3VoWWNHRkdGRkxYVndOUys5?=
 =?utf-8?B?NkRaNnF3MlBUem9LSkhDbzBrL2hBZEZvOUpCSFl4WE9Ed3d4cDk3T3c1WXRW?=
 =?utf-8?B?ZDdzVVdBNlI0aGFRSjBtei8vaS9QMHBnaHBCUm9BU3lRdERSeGhUUVZXaTVE?=
 =?utf-8?B?a0lZWmF5bXZsUnVZQXQrV3RHeFNZZWw3T0dHNWNqa2FCM3VRK2lRNGxIY3l0?=
 =?utf-8?B?dzJqTEZ0Yk9aVFl6T3Z2MjByUkNzcGh3c2tPOVYzTHpLMHlDVzM0RGxWNGph?=
 =?utf-8?B?cVJWVFVtVDc1M2NmeXBnbjNwaDY0MTF3b25RNTJic1lCQXdQK3JXMEpIQStW?=
 =?utf-8?B?YWEySVRUL3NxRi84ZzZjSHNCbHRhMk9CaXdjWFFkZnl4S2Y0VzhpRE12UG5L?=
 =?utf-8?B?aXhBaytneU9yQ3dnbFhCR1JZamdXdEJDZ0NHVk0rU3dLTXlLMTcvdDNFZkNN?=
 =?utf-8?B?SVFEVG9xUmpDV016cHcrL2tOL0ZxZ2s1QnkyYjRkRTYzeGlxWXI3clRKbmVt?=
 =?utf-8?B?b1lMZWNpQ0ZDeE4ydmZhdTFJRWJjNmdUSkZ3dmxjcDJ0aUNCanpuNmtJUzVR?=
 =?utf-8?B?SldGM2FpZmZ3cmVJY2l0N0hWVFdTaUZvbE5BNno1Z3E5dWt3OVZjdFdQMlZn?=
 =?utf-8?Q?sGtqa0jfBnAJYL2LazINCp2fP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1923d809-992c-47c5-c4fe-08dbd09106b5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:49:10.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4DibtHCnDrKfBnAWAZ95JfuCW/KT1KVTEAGgJgfXU4Jg3iiuhKRo81m2IRGq3DiaQ3D5y6Ia6r7aUjYpOUPQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141

On 19.10.2023 12:35, Julien Grall wrote:
> Hi,
> 
> On 19/10/2023 10:05, Jan Beulich wrote:
>> On 14.09.2023 16:56, Oleksii Kurochko wrote:
>>> The patch introduces stub header needed for full Xen build.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>   xen/include/asm-generic/paging.h | 17 +++++++++++++++++
>>>   1 file changed, 17 insertions(+)
>>>   create mode 100644 xen/include/asm-generic/paging.h
>>>
>>> diff --git a/xen/include/asm-generic/paging.h b/xen/include/asm-generic/paging.h
>>> new file mode 100644
>>> index 0000000000..2aab63b536
>>> --- /dev/null
>>> +++ b/xen/include/asm-generic/paging.h
>>> @@ -0,0 +1,17 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +#ifndef __ASM_GENERIC_PAGING_H__
>>> +#define __ASM_GENERIC_PAGING_H__
>>> +
>>> +#define paging_mode_translate(d)	(1)
>>> +#define paging_mode_external(d)		(1)
> This is more a question for Jan, in the past I recall you asked the 
> macor to evaluate the argument. Shouldn't we do the same here?

Would certainly be desirable, and iirc actually needed for one of the
Misra rules.

> Also, I think we want to take the opportunity to convert to true. 
> Lastly, this seems to be using hard tab rather than soft tab. In Xen we 
> use the latter (unless this is a file imported from Linux).

Oh, didn't even notice those; thanks for spotting. If we're at cosmetics,
the parentheses also aren't needed here in the expansions of the macros.

Jan

