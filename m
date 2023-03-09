Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E676B20A0
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 10:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508214.782641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCuW-0001t3-CG; Thu, 09 Mar 2023 09:50:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508214.782641; Thu, 09 Mar 2023 09:50:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paCuW-0001qp-98; Thu, 09 Mar 2023 09:50:08 +0000
Received: by outflank-mailman (input) for mailman id 508214;
 Thu, 09 Mar 2023 09:50:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wtzB=7B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paCuU-0001ln-Am
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 09:50:06 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe12::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c49123e9-be5f-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 10:50:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Thu, 9 Mar
 2023 09:50:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 09:50:02 +0000
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
X-Inumbo-ID: c49123e9-be5f-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGVZMIKNnOay42fIoIS/wmqv59bxwiO4SgH6nbYxsrm349Mbu5Upg/jY7XrVBMREjxWbOckC1n6uFyGxaefpM+JDFBfcKcTIOURlhUNoVvYKutwvbUZw/CYwLI5b13WpJVqLuaZxIWJApNNIt0DPVTqvXG4OlPMPa2sOD2g9CbNppBt27/c1qOZU8gaGU3LvPnU07G/b4vOc3hLWQvjeQKn9w/2uPCVIIAERde6zRY2OEof4JRHHMQr0Kd3CcMx2ONbWNRzErCmuPM1DWVUSXCm6jgAO2+RY7mTT1ke4AESZsANqaUMiSlAwwULWlL4oKBmacTC4kRw3uHKAaYLwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpfYcVI//I2EfD76DvdgLBHXoHZGlKodctP3jzX1nU8=;
 b=c75rmCerBI3UARxLXgAV3+omoeDNOVDLZnCTOjPmSIXiz5DvoOECm+mvHJNkuns6agi1IQ+3MdaC+yd6JPMITvPLg0Vk2L8wxxPsGBmuXbuLM0RT4GAR4VIAPWC2rsZUUHhE5nwaMibLxj2+7oyN0t1tjffQkQc/aQlmWJO2TIUF1O7Gkdgg+X2+nAyxnsHllH5LJI/oAHj7CrRqqtFqA/iWhTWZPNhZ2c0I6X3d9loh11fK+42+jaelt4lf/aZLhY3ow0V4OBFiDO8mq2JKwo3vuipCE3BljmIgJ6+lqkPzjnmikAMoNRyHqG2uM89Lh1mSMiRkc2inAbl6YpSMPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpfYcVI//I2EfD76DvdgLBHXoHZGlKodctP3jzX1nU8=;
 b=KQ/v+0IbbaBMQqZa8JgaD6V296a8d7iNWWX8Rmx6f4dvFnZ9t9yaDWkIFy9ybfCP7vPh2el8HZ3UFCZBCn1WE6BgLC5nUKqJyYJ9IXAwSTtEMbFaixIyguN28xy8bQLugQAjSMezv5f5lnuvjJ+jGX/iyLaUVhlHN/QTfk9C0HJIL5Qc9mBqk9bqwAW3MgPh9UjGOXrvkUpBrF3gqjmPHm2G4o+DUpxsRJypGe3Kex9BDtXAIPQ1UINqnzNaz8zSy59k0hsxk1VlqqX7yHPaO2AXk+lWaFcHp88NjGQmsyqW5dBJ0bQWm7fijM8wica1zNl3+2RCGW4v/GsN97bMkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <df9da60f-f443-7c88-1ae8-c2ecb0d2a879@suse.com>
Date: Thu, 9 Mar 2023 10:49:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 2/4] xen: change <asm/bug.h> to <xen/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1678202233.git.oleksii.kurochko@gmail.com>
 <d8722046783462504d5396f7f880ff62b1ef9a90.1678202233.git.oleksii.kurochko@gmail.com>
 <7c7ca139-a77d-c5f1-e8ae-d819656725f1@suse.com>
 <cfe7b79c02bd5a9686a3018654627cade1c9e2f9.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cfe7b79c02bd5a9686a3018654627cade1c9e2f9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: b6eee350-44f6-40d3-ef29-08db2083a724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p47BMuJ8+G0uEZ6CAshtes77PcSMKAQwAx6IxAvVlQtKGZhRsETJz4H2OjH0UqEPjCwgO3Faql5Q1mTEoev1od9i3ZNr4peveBz2p9yirbmWT+mpk8ZA5g36k3O9QWHnrtxRotKm94dHSwyTpYqIbOtB0kHQ27uPpZAwfFBp/Io2DTOjDpz3WEf6gS4Q4lbSCGV9S9qQLz0rz96sUiBHywp4NOBg8SQ7vIJWzGB7vhpbszV3gWgsy0/HJruq7Avfz2l5JZzY/VEMp9Ua8h0UvAXorcK0IO7NRse3+xl9wHr6HzunKIRwNO9dev6KyePtl8lT2wpak3vO6RkrH/BM562HHDzQZHkEV1eJPw9XrhzPiUaCwEuDbUfqtrXYzDsAESN2g6AZLI4Iaer4OVtSd1QgqAhU9erYRb8Je5hQ8LDZFiML7xMa9DAyXDChwZLu5/5EMT6fvawVX5A1BVLhR9bfuTLVTK3ZC2isK7wu/8mRZd5eTRA29rMDeQCE4RzrNFMNGVC+sS4fhLjwHvH/dG+oYGRhYq8ncOCRsbV/VUh85CN1k2CKCSTTwY2pLkGTVajHzD7ioVq7RKaPhD/K9go6ck/MwqY2a65uxLXDx/O4Afl12J/XiOhbxE94TNlm+kLBQAWWLJH1mBSrJpYDbFQc2VZdNW+zAAY4+kYq+VDD+XkD1AIfGYEcPisi01ANzq5jDLiK7IIk7JK1xvN9teDC8iN0hGmsynkxMxh2IC8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199018)(31686004)(316002)(54906003)(36756003)(38100700002)(86362001)(31696002)(478600001)(6506007)(6512007)(26005)(53546011)(6666004)(186003)(2616005)(8936002)(5660300002)(7416002)(6486002)(41300700001)(2906002)(6916009)(66556008)(8676002)(66946007)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZtaHduRkIwa09MeHhmdjZtT0R5aDhac1RqZnZYb2YxdlkwbTllaDY1R2Q3?=
 =?utf-8?B?NHRVZ0czTzFmRlArdmkxQklTSVdVWTY0WTF3dEVndUx2ZGVIc2RiMnplMVZm?=
 =?utf-8?B?M0pOTUZBYnRGeUIzQkZ1Qi83ek9TdUlBdGViQlg4T3ZxbWgva0RTakxMOW0w?=
 =?utf-8?B?SVFUZGhvWDZFYVFkOFRySVdTcVZ2dlN1MjBudVBZR3ZDZ05nUTZDMGJmNEc1?=
 =?utf-8?B?RW9jLzlhVkw5T3RxNllXNnl1aUVoeXl0REpTSmxtcmtJK1laRTJWZHN4SlQ0?=
 =?utf-8?B?ckhKZEZHZzNyQ05nbEZrd2hJdWdaTTNCTGFJQmdZdHZmczVvcm5QY3p2bFgv?=
 =?utf-8?B?RGd6TVkwd29KeW54YjlqZ0FGWjIvZHdCaDluUnh1SW9pVjk3bW54b0RPMksz?=
 =?utf-8?B?VnY3QjVtRGZoeUhqN0N2Y2ppWTlMOEJGS2VuTzNiZE9jWW1oWGo0RkdDMjA3?=
 =?utf-8?B?MkZRbXNDZTgvWTNTQkpodEVlZFFDQmhnYm5FeWszYm9LTHZQYmF5TnNOWnVw?=
 =?utf-8?B?WllOUVRiSks0NzNhU0xVQ2FqelFKUDlWNEZGNVRMTVdvTzlsNmQybGJTK2x4?=
 =?utf-8?B?YWRPN0Njd0J2SEZUZlVxaW10K3JsVElJOVU3L1RDWWl2UVN2YmN0NFpYejBE?=
 =?utf-8?B?UEdadEQzSnArdS9lSFp0WnA2dGVTNWdJYmlvNytCRGk1TlY0NE1KendiYlZH?=
 =?utf-8?B?WVlWemE1ZWdlQTVFaElpMTJ0bE9PRkVtcWh3RTlaS3BRc1ZXbGlsNGJ0OUU0?=
 =?utf-8?B?UHFkVlFoZ2cwVlZPc2UzTHZyQ2k3b2NMcWdnTlpBM2tuWGh1RlNaRGRqcXBQ?=
 =?utf-8?B?QkJDOUNwUEpCNzk4Wm5qcVl2OTYxNlMxZnNUVm1JRElNNHlJU2NRV0tseG5T?=
 =?utf-8?B?VTZBOTB2aG00aHB1VzQ3a3ZzL2JRMElucnlvWkJ3Uk1uY3ZKR2gvbUlYWDBN?=
 =?utf-8?B?RkJsSzM2c1M3b01vYnhjSktsaE9yOUpBVGlubWYvNEFJZCsxajdjWUQrMHo1?=
 =?utf-8?B?dGdPbDZETjNCMkR4UmpaVkVjV1FuL2tGYnhZajVONUQ2UG5HTy8wQ1hGeWxu?=
 =?utf-8?B?MWlSUS9ONDVLVjQ1ZE9SSUdVdS9JdEk5S053ODcyL0V0QU9xaHJlNlgrK2VP?=
 =?utf-8?B?OEZDSjUrenZHNk91WU95THlNZ3RKRmczbTNwbHRzZ2xlZFYxMG9qdzl6bmh5?=
 =?utf-8?B?L3ZYQ1RVeGxsWGVmZTk1SkI0RU1oWnJXUWFFU0pWRExrUTkrVkZKaW05YlhL?=
 =?utf-8?B?d0lleUZCU2ZqRzRqSnhuWFJ5Tmw4d0t3M0JtTExUclVvMnV6MVNBU1owdUNK?=
 =?utf-8?B?MVVJVkRHb3dldkMxM1JkQklUSU1ZeE40eUt0Nkl1ZlVnZjBaS2VFU0dqVU52?=
 =?utf-8?B?blJxdXBUVTVaRG1Xc0pqa3JFU2Z3NURWNHRHUk03Q3ZyeEhzS0I4WGI0RWV0?=
 =?utf-8?B?TWFuQVQxU3lVWVdyZEo1T3JSUWkweVhsdytkd2I4U2NKSWo0N3NFZ25PVzdK?=
 =?utf-8?B?am0wRW1DTlpaeE1maDdXWkpQUU81a3k3MG40U3h6TUN4UGUvWUJPZmxCeCtl?=
 =?utf-8?B?b28rSFhVM1c4MFc3cnFPS20vaHljc2FyNmRJdjRWT0FWQXZyRmxBcnlVTW81?=
 =?utf-8?B?STI3ZkxjanU5bkpVTmFIRHUvNitLNkJxeE9DbnVDSzJ4MmFXaWhkT2ZPMElJ?=
 =?utf-8?B?KzFYcXdnbElXR3QwZVAvRzl2bUN1bEY2M1YyZnpHMUNWRTdPR1UzNVpxcXE1?=
 =?utf-8?B?NGtabjEwZnlNSHdFUEZXSlYrc09GMWpobC9CbnA4TlU2VTdueHlSc3FsQ3FT?=
 =?utf-8?B?WTlOMjF3cXVTc0I1Vm96eGZOSHQ0MXV2Y0NiUEJ2MXR2Wi9XZjZRdFp5bzBN?=
 =?utf-8?B?SUREWjc2cUtHNUszQWo2S1VHUzd5UmM3c1NDMkNHb3B0UUdqZzhEMkhVa2pi?=
 =?utf-8?B?b1RVMzFBaHFqOTk1cks4b1lzczRIMFBSRmlYemtubmdGZjI0NEdObmJyVmQv?=
 =?utf-8?B?L0J5RXFSWm1CckpXSVU3dHlXdjJNTG1OektIOWFodVhVRXF4VzE2UlFUcHhZ?=
 =?utf-8?B?cmRMUWlFWitGZnFvMEp0SXNtZk1GbjNDci95MGJXekJaQTlBNFZ3VTBHQmhF?=
 =?utf-8?Q?woo8WawyoCp9UPVq5kdCsguqg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eee350-44f6-40d3-ef29-08db2083a724
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 09:50:02.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yps5rvMUoa2r7MUx3E2whzt3J1cKct9urfMkEDjwTRq6dnlHuDhVxzRCLVQETFe8Bh35GVOlekA0/ltYOnBKyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116

On 08.03.2023 18:25, Oleksii wrote:
> On Wed, 2023-03-08 at 16:27 +0100, Jan Beulich wrote:
>> On 07.03.2023 16:50, Oleksii Kurochko wrote:
>>> --- a/xen/arch/arm/include/asm/bug.h
>>> +++ b/xen/arch/arm/include/asm/bug.h
>>> @@ -1,6 +1,8 @@
>>>  #ifndef __ARM_BUG_H__
>>>  #define __ARM_BUG_H__
>>>  
>>> +#include <xen/types.h>
>>> +
>>>  #if defined(CONFIG_ARM_32)
>>>  # include <asm/arm32/bug.h>
>>>  #elif defined(CONFIG_ARM_64)
>>> @@ -9,10 +11,16 @@
>>>  # error "unknown ARM variant"
>>>  #endif
>>>  
>>> +#undef BUG_DISP_WIDTH
>>> +#undef BUG_LINE_LO_WIDTH
>>> +#undef BUG_LINE_HI_WIDTH
>>
>> Why? For Arm ...
>>
>>>  #define BUG_DISP_WIDTH    24
>>>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>
>> ... you could purge these as unused, even in a standalone prereq
>> patch.
>> And on x86 ...
>>
>>> --- a/xen/arch/x86/include/asm/bug.h
>>> +++ b/xen/arch/x86/include/asm/bug.h
>>> @@ -1,19 +1,18 @@
>>>  #ifndef __X86_BUG_H__
>>>  #define __X86_BUG_H__
>>>  
>>> +#undef BUG_DISP_WIDTH
>>> +#undef BUG_LINE_LO_WIDTH
>>> +#undef BUG_LINE_HI_WIDTH
>>> +
>>>  #define BUG_DISP_WIDTH    24
>>>  #define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>  #define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>
>> ... there's no reason to #undef just to the #define again to the same
>> values. All of this would be removed in a subsequent patch anyway,
>> and
>> it's less code churn (with code nevertheless being correct) if you
>> get
>> rid of the #define-s right away (as iirc you had it in an earlier
>> version). If you agree then with these adjustments
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> It won't be compilation issue (redefinition) in the current one case
> because defines are the same as in <xen/bug.h> so it is possible to not
> add #undef in this patch.

Avoiding to add the #undef is the minimal approach. Yet as indicated I
think the #define-s should also be dropped right here (x86) and in a
prereq patch (Arm).

Jan

