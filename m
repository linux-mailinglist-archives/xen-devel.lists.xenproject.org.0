Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3A255974E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 12:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355421.583072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gCB-0008Rc-V1; Fri, 24 Jun 2022 10:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355421.583072; Fri, 24 Jun 2022 10:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4gCB-0008PA-R9; Fri, 24 Jun 2022 10:05:47 +0000
Received: by outflank-mailman (input) for mailman id 355421;
 Fri, 24 Jun 2022 10:05:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tt/v=W7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4gCA-0008P4-NR
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 10:05:46 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2415b89a-f3a5-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 12:05:14 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4083.eurprd04.prod.outlook.com (2603:10a6:208:64::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.23; Fri, 24 Jun
 2022 10:05:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 10:05:43 +0000
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
X-Inumbo-ID: 2415b89a-f3a5-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhqNmBmtmRPGGScPMs3gXZQJCOa/HFjTWZVdQQ3jACfPj/6ClX41gsynT8NadmYWFJUNPqzjvxaT/g4v3z8IB3OyHCVujuUfnAdMni05dqjv1fdrNJcZx62KbO4f3g/wQilpxACKd5pXYdrjKbwmESE/OXG2NvnQoTq04f+0GChIIJFcgQbE0hGboSrzvBd4mjzuoIgA2R++SCjMcrQ0+ggLjBo071l2aKuBcZ5TYu7CvzVbV+ySaFOWUjupcur1Gv2SdJavbG376RX2rKk2VE443xjgTC9YFO5Pjb2kAL4tW6aY5GqpRt+YkL8IyW+yNzL2TBJ2+sVO4MyYfQC90w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/927hs9b5qDlM5hU5MKy+mzImZzDOmV3ZzLGX64IAok=;
 b=DYzGtBMIZ0afPxGHxz7gmCLejhcUe4uME9EuDek5L7/8vEpL5/+/xxx+mol9sRKgelbYCEMJI33hTExaL1up4yFs/qH4oBYoV7Ud7kyTu6LNP+H6aSOPgjCJqFWQwAkyi0QSkQfp46QV0A7GCyij9nylUWJOb4COwFZTKUEFFkGrBG5PMglC//TtbuB5iGRe0DIEo5S42xItkeh0AqZaWDk/j0zT8Tis/4LuZyTB94WpYKqF4Mozq6qer8UIOD8VnFcoHfgT+5FjFrx4ujXXsoSVUtFycAkUiZqH3txKNhpFcy12iysdMH4kyu8jMqeBnTMbjBifbQc4DLZWDmMvQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/927hs9b5qDlM5hU5MKy+mzImZzDOmV3ZzLGX64IAok=;
 b=TvvGrVkm7VJ840TaslHxGgI6HhIcLBLrZ2Za+JUKSYvj5j2ejrXj9QijM/EHTJn8MyeEnGhIZm1ZymAyJwcJ3W8kcWeYHhiUApsYn4ingNeN2eXcl6n/4Hekffi2ZUjlw2X/LnGMac5VUHD5zRmn5TyHEZH2vEf60Sg9fc2QpNONTngXmBzUIyPiKYLahAyenTFf11a4iyIRl5fZE1AC/j8YU4c+rBvQwkb43lS5jhkoRpnNcM2u4Fr806VM4vY1MTWRlc5bOiUuNYydcGMQDb6AbRldNzmqevBLyrTGZB+31GXoffoY1ZU/vYsdOEo1XWVd34xln1JQe+Fo2P0KqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e91d7d0-78d2-2eec-3b14-9aea00b2a028@suse.com>
Date: Fri, 24 Jun 2022 12:05:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
 <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
 <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a6844d62-c1aa-a29f-56ba-3556bc1d4dac@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0528.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae456280-ae8f-4175-0409-08da55c919e3
X-MS-TrafficTypeDiagnostic: AM0PR04MB4083:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tlJO5RVtjjvsN8tmbjUk7enZy7884TUii95VYQEJi7EAAVuwboF7bI1BkzBvTjLFjGAg0QZo4HrdeDK7SrkoGZF2HS7YrmygdxalddkLC2Dg/cKwT/9yVkVUOdj5CBb/iqhgOYrtUfZw583gQfXDt9X3aLphGI7agQp1rvr+3MRG1O4o0F/74m5yBdJMI081pjD9GPe6mPL/XT5T3GPHngYlqat5XZ5V7d+iljjvn83aTI27/Niv6P37/LVmfK/NVKHjg1PufjaRuJmhTdvZsXc38GBAyAvOYjEHpcMao++JkAg+IbN6DlbLCNbaqyXRIHFcL3ME+EZsIk3IIDSFMrhh6mfuA4W8S2MnO0Nyc5OlSEQVjthZzy/vlncjHMnsDHqM50/sDfzFnIRf7whTZESD3c/U3xpzlw3VduVdJ6YvnHSOVNNoM0fGbTpHGHwWuL/Gq+1p2bklU3kP5YeBmik3oXtlLoJkargUvLZXOG45/Un2+qfJpufn9Dy/VN4u/6jhwkLDsPkm169lEirPMyAz0G2gB0Fm/9XO+xlDKD2oafx6YmIJbgNHI8jbgqNJxIkBgU1KJFZ6JE/VzQ3PYjZE4i1YIo781x0QfReoewb32qLautV9L3oplKj9xIxQRw/szab4oPqWrTvosIpeYBNl58jRXrWQ87GvY2YSGeErA5s2kjVVWIwzn/Wi+0T+/C7rCoeAVMOuPG1bhGJmwNvZjs725e6jy0cN49aWjfNoT9U+Q7M/OfPhBHkooA92PbA/99Pahfw3uNluzi0zALyR5g7eHoM2lWccsYKgauV9h2LSOSSK6rbA7YQSADWSM669uWTxZP8Lgp/HwbVfTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(396003)(39860400002)(376002)(6486002)(2906002)(6506007)(478600001)(86362001)(5660300002)(6916009)(2616005)(36756003)(53546011)(31696002)(7416002)(38100700002)(186003)(316002)(41300700001)(54906003)(8936002)(31686004)(26005)(6512007)(83380400001)(8676002)(66946007)(66476007)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUorYWk3dGRRc0ljZUpndS9pWkVvbk4zNGQ1VFJNVXByMldRTXBGRmlSU0R0?=
 =?utf-8?B?KzhxY3VDcjhpakpEeXkvSWZFM2xmK3NsMnIwNmV4cTdqS1RUY0FYM0Y3Z1dl?=
 =?utf-8?B?SVZJYzRZNWFVdFQ3cUpDdEV6U3FIYkhRN0pmTERabTVvRXN6cy84Y1lCdVRU?=
 =?utf-8?B?UmZkbmF5NW1QZVgxM2Q5WXg5Y2JVVGVMRlZ1c05NNWNmaEJqRUplU09DVXlV?=
 =?utf-8?B?aU1ueXJ2V2xZSHQvYWNSK0lWamdESjluVTRNV3ZiUUk5TysyMXRBQVNLdTdu?=
 =?utf-8?B?bXBNQmg5UlRvQ0NFRmVveGZkVHdDU2UzQjQvaHBwdlNUMDFRRnNyRWU5Njd1?=
 =?utf-8?B?bDdiSG5pQlVlOWNpL2I1SGFIekkvNHl1eDJGOW5GNXdQSnMrR2s3V0NSNUs3?=
 =?utf-8?B?bEdKZnpnRHlVa1l0ZFM2ZGxlYUZJTFh1bUk4ZEpEa0V5WGN6VlpLaGk0czR4?=
 =?utf-8?B?REtkVWZxSDhBSGVPcEJ4dkJiYXk4UHg1SEl6ZEJyNmVnbXc2YUFXN0Y4RjJU?=
 =?utf-8?B?TElRNHExd1VFZnJmRGRzYzJhenR0VGdFS3VIMmVDT0h4VWJsNGJOazBUZzV2?=
 =?utf-8?B?REpXRFROaTY5NVMxVlVEVzBrb2ZvcVVLa2xLcys0eGozRWtiWHNvU1ZYNkVK?=
 =?utf-8?B?a1FxZTU3Ny84cDRuWXpEbEswa3BPbWJpbE5ieWlKc1B0bGl3MDJkMmFJamI3?=
 =?utf-8?B?Rm1TSS82RDl2aHpaYWh1cGpyYUJ5U0lWRWY1REkybU5mNHVmeVJnRFJaK3VV?=
 =?utf-8?B?aHpnSzkralZlVmJDeEdwSU5xOGZad3I2TzdTZzhaSVJGM1VLblo3M0FHZ0dJ?=
 =?utf-8?B?SmlHOHVEMjBWaUhSeDgrSjdDcDZJTm1wTGFRbjRWaE9MdFZLUkdYZWFwUUhm?=
 =?utf-8?B?ZHlkMTFSU2RFcS9NcDEyYnBtdlVuT3pWdlNBRGY4bFpUR29pVC9acmlpMXM0?=
 =?utf-8?B?c0dQK1ZnV1pqMnZwNkx2TUIrb3duK24zajNsOUFscFJmTzhvNE1weG9hR3JM?=
 =?utf-8?B?WTVNTWhGOUNSNTVvSjFCb3NBYjhIeXc5YmlnaG1HZjhwWHJ3T0dTUlVya3VC?=
 =?utf-8?B?ZFl0N3VBd3F1SjZ1aXZWUW41VWw5clVTNjgyejFxc1ZtNFFBQ1hsSS9pV01L?=
 =?utf-8?B?MTlpc3lCdkgyMzlobExYbEVkUXBiWjVmc3NwSy9MM3JUN0VPelZpcmlPZ2Vt?=
 =?utf-8?B?clNMaEY4ekxiUVhCY0dGTEJqRlAwQURwSUlrN0k2TlhXYTdJNS9hRm9sZTJj?=
 =?utf-8?B?OVJSR3FGWmpvUC9KRml1WDdOMEVRQU9KVTN5YjJEaUNKV1ppN2krbnRqWXNj?=
 =?utf-8?B?SmtIUXJ4YnFicVZjWHltYXh5a3RnNUhrOXJMeFNUdHJRV2lpWHQ4OUsrYUxH?=
 =?utf-8?B?c2JmMk9JOWRQSkZ1dkVVTitrbkVoaHdMNzNqa1ZDa0luRXp6cHREMURhNmJ3?=
 =?utf-8?B?bEFSTGx0TWNRWU1UYjBUcW1QU3Q2dk9TOWFVblI0eTdaQ05Udm0yTmRlbHQr?=
 =?utf-8?B?S3VsT2RaMjRKQ2sxNE91bW9ZM0FLNENMb2xKVzlTUEhQWXFpaDVSdWQ0V0Iy?=
 =?utf-8?B?S296NjlRZnFNNFBYY25lOHk3aHFpVlpCazYxM2NsbHhUTVlwSEk4elpIZzhh?=
 =?utf-8?B?ZGlpQXo4QzQrMjYzaFhhUjY2SXEwaUJpOTJjby9PYW5NbVYvb2hBMm84QmNQ?=
 =?utf-8?B?dE90WHJIcUo1OEpLQmtWRzNtdW9Ua0dWRXZRMFJwckJOMlBHeHBjcC93TlZY?=
 =?utf-8?B?ekFvU2NYb0Y5WDM4c3ZmYVhhekwyVkxxMW5CM1dQeEpHWUJhcGlaMTZ2QmVr?=
 =?utf-8?B?TjRiOVpIbEplQS9iSm5YWUQvL3RPbmRDbkpVZnJkK2lzVDhYWFhLUkZEcEoy?=
 =?utf-8?B?R1VXWDJjMmphNXk5UEpoYXRCeDNpUFB6cExGZkJ5Ymh4YmhrWUVOQ0srSnVT?=
 =?utf-8?B?SXRRdlV6azhXK29iMldUTmR2dGdCWitxOFJhNUsvZ3l2STdjMEQzMXBrc3hX?=
 =?utf-8?B?aHcrSHh0SmpKYmNtUjVaS0pEbzFudkRJWThBeDhMMmdRSkdKRTV4NnpQUm56?=
 =?utf-8?B?ZmwyR1ZYa0RXT3d6aFhOTGQ2a0NnV1lGRkFqVXZKdmRmMFhjdXlIOWRuRGZw?=
 =?utf-8?Q?/MIJV+LqttyNyCynu49bY9yOh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae456280-ae8f-4175-0409-08da55c919e3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 10:05:43.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVBzEiE1NCZkY+Kg0/5jGjWpErTZyw6RYx9EjQoWDEqzmXkoaZZc8w0B9KY7TknQn0lukICKO7ZMOlCXxQlP2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4083

On 24.06.2022 11:49, Julien Grall wrote:
> Hi Jan,
> 
> On 24/06/2022 10:33, Jan Beulich wrote:
>> On 24.06.2022 10:35, Julien Grall wrote:
>>> On 24/06/2022 08:18, Wei Chen wrote:
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 2022年6月23日 20:54
>>>>> To: Wei Chen <Wei.Chen@arm.com>
>>>>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>>>>> Grall <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>>>>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei
>>>>> Liu <wl@xen.org>; Jiamei Xie <Jiamei.Xie@arm.com>; xen-
>>>>> devel@lists.xenproject.org
>>>>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>>>>
>>>>> On 10.06.2022 07:53, Wei Chen wrote:
>>>>>> --- a/xen/arch/arm/Makefile
>>>>>> +++ b/xen/arch/arm/Makefile
>>>>>> @@ -1,6 +1,5 @@
>>>>>>    obj-$(CONFIG_ARM_32) += arm32/
>>>>>>    obj-$(CONFIG_ARM_64) += arm64/
>>>>>> -obj-$(CONFIG_ARM_64) += efi/
>>>>>>    obj-$(CONFIG_ACPI) += acpi/
>>>>>>    obj-$(CONFIG_HAS_PCI) += pci/
>>>>>>    ifneq ($(CONFIG_NO_PLAT),y)
>>>>>> @@ -20,6 +19,7 @@ obj-y += domain.o
>>>>>>    obj-y += domain_build.init.o
>>>>>>    obj-y += domctl.o
>>>>>>    obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>>>> +obj-y += efi/
>>>>>>    obj-y += gic.o
>>>>>>    obj-y += gic-v2.o
>>>>>>    obj-$(CONFIG_GICV3) += gic-v3.o
>>>>>> --- a/xen/arch/arm/efi/Makefile
>>>>>> +++ b/xen/arch/arm/efi/Makefile
>>>>>> @@ -1,4 +1,12 @@
>>>>>>    include $(srctree)/common/efi/efi-common.mk
>>>>>>
>>>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>>>    obj-y += $(EFIOBJ-y)
>>>>>>    obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>>>> +else
>>>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>>>> +# will not be cleaned in "make clean".
>>>>>> +EFIOBJ-y += stub.o
>>>>>> +obj-y += stub.o
>>>>>> +endif
>>>>>
>>>>> This has caused
>>>>>
>>>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the output is
>>>>> to use 4-byte wchar_t; use of wchar_t values across objects may fail
>>>>>
>>>>> for the 32-bit Arm build that I keep doing every once in a while, with
>>>>> (if it matters) GNU ld 2.38. I guess you will want to consider building
>>>>> all of Xen with -fshort-wchar, or to avoid building stub.c with that
>>>>> option.
>>>>>
>>>>
>>>> Thanks for pointing this out. I will try to use -fshort-wchar for Arm32,
>>>> if Arm maintainers agree.
>>>
>>> Looking at the code we don't seem to build Xen arm64 with -fshort-wchar
>>> (aside the EFI files). So it is not entirely clear why we would want to
>>> use -fshort-wchar for arm32.
>>
>> We don't use wchar_t outside of EFI code afaict. Hence to all other code
>> it should be benign whether -fshort-wchar is in use. So the suggestion
>> to use the flag unilaterally on Arm32 is really just to silence the ld
>> warning;
> 
> Ok. This is odd. Why would ld warn on arm32 but not other arch?

Arm32 embeds ABI information in a note section in each object file.
The mismatch of the wchar_t part of this information is what causes
ld to emit the warning.

>> off the top of my head I can't see anything wrong with using
>> the option also for Arm64 or even globally. Yet otoh we typically try to
>> not make changes for environments where they aren't really needed.
> 
> I agree. If we need a workaround, then my preference would be to not 
> build stub.c with -fshort-wchar.

This would need to be an Arm-special then, as on x86 it needs to be built
this way.

Jan

