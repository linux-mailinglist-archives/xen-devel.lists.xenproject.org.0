Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A157A64C7D2
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 12:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462114.720289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pqm-0003ib-4P; Wed, 14 Dec 2022 11:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462114.720289; Wed, 14 Dec 2022 11:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5Pqm-0003fs-08; Wed, 14 Dec 2022 11:23:00 +0000
Received: by outflank-mailman (input) for mailman id 462114;
 Wed, 14 Dec 2022 11:22:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5Pqk-0003fm-5M
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 11:22:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a85be5e5-7ba1-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 12:22:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Wed, 14 Dec
 2022 11:22:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 11:22:53 +0000
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
X-Inumbo-ID: a85be5e5-7ba1-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frK/xWBkk6ehSVRjBauO1biba6QwtmRrzrPb8JIZ+6kU4QrfjbUByr5nMEqqfQzbbVQuOe3oqf7vKaBLm37iXacpEsXTS0fObOXP56M7bgVABKPOe7xUiIqR9nvMJB/RxPsYw8emmvUtPcwGop2f5uSJcjX2RbCs6s/8wvCMaxF7PCs5YNE9IKSal5zd/jaIFfTgR7uKsTE0hl5NqZWtKy9bAfTGRbq0C4rngdY9d9YSpq1UWjSlsx5Z+zcyUhkGlweb755zYKgQMv6NNyU513sQF6SYVWDHvAhvvD3f72pKLe//sm+ZGsiCi/f7YSdedvvigVa3dv/1aepmf2+XIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBA5lNcjGcZD7ReAdaK7UScmScRtsExD91+lEt51eVU=;
 b=Em3Hxr1WjxekrkRDW65gYbeRykPxjUBHZSzvItF+QX04dXFWzYC1fsIQvR0QRk7CXgx5stlb/v06ysONXMgbSNqiS5ZSnbi5zPOLt1uuCb96Ge+BXejDzXcbZGMzVOKDbH+FesDmh1EQtwfWKjIQ0Rcc2hRP1aPnKc3pMyBT0omo2XBAQboGDCEi8j+q9HCqPUPahuB0UnmJAJvzkaUZUUj0vRDu+bW82B+owAQdjkHC5qvIXVw7F3zIEowPMhkyC/GEiZjrQxH0iRfGuedZibGfnZ5uWPwuhlQywWXTF+LqKSzkVq53MAyhD8Hvi+gz8dXsT+MociXvgaK9m90HQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBA5lNcjGcZD7ReAdaK7UScmScRtsExD91+lEt51eVU=;
 b=I36Xh2q0OlNbpx9Sh2xAxyVk7HfWidchJFOVZuss/HVihimCPJSQl2riS70SSuvUlkkmSzG7XrCAgfXw+EmWk5+zpTChNSg/YI7g30wb/A2MDB/krYWDjRzVjDwSLWtUTdC+M+7QEzCf6dXnFpuedhXpfEg0PdLtn97k9HEt8Jk+OjbbIDlhgsXKyGCfoYmvEc8CEaGZbcbJ4F1ImMOL5XIhvLot+5C/HJhQLhKcadO5NMy9pB9biTRoBxlCUR0uqheGBp3ySFZCHuRfiHHVKnnVT51o6N/eLJAfR0OkNcCYSxVI9owfA1sRnavZEWaATJzngoMbVoPtt+3JjQm0Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ecbb51a-02d5-1ee4-d484-0a16c52d2493@suse.com>
Date: Wed, 14 Dec 2022 12:22:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 06/14] x86: Add memory type constants
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <71482430c20a701b1d577e87dc72e7c2661e69de.1670948141.git.demi@invisiblethingslab.com>
 <d01afab33bcf551f96f5650c37c51a567c43ad4d.1670948141.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d01afab33bcf551f96f5650c37c51a567c43ad4d.1670948141.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b6b961-0132-4771-83c6-08daddc58ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dvLb3kTpIPet7kSGMM26IOmTJa+mQeVGpnCn9++14EJaYvwiDZN5sdmD9TYwF1GoZ2KKp/5OWSKia0kCNKTUSp9Nz7Ce5GyUHVv8IpublxLo3odeWa2qzHO+dnsvPsaDhQnajp5+wxJP3lD4C7NcrAnX+GPOnTJF2yhLwt9ifPs9f3wnYUeK4SlFbs3LlcJnFtXDqgyF6xIN7CmWyNiSlXx6ibdgJKkQJEyMiHJLPmLrr7w+C7FQqT2fWBRqOp1kRk/G1LqbpoEqeT6VHRfRG8T+ddgmS7Zhg4mZtDVQarm36n8EnWyqPSTnUIzFaGlNzcagZLozlzhRH19B+0X5iPzo38tieQZtXU52YUapg+9kBSxNO3/41N0RjOB/3iyxxUSuoHvpEKCJa3JQE+R2JeBA4PbJ7d4hNF+skr0Ljg6O/xvoQ9wgiUzOT1Jw3Jlu3G+1lB5gZKz4Sz8eNxQzuUNFR6DIc3thcmgf/Aa7vAycn82BJMLVnpB7fPgyxkH7WGTZcBy31dSkfPMW+v0iD1bTH4Z8EpvrraVPXJFQ/1XfbGshM5jPQ+6VfCWivjIGZhQCeFTqXGX+zpaGkJcXscI00N4Er5L1bZngjOfzCXdx/6uhgb2HRNXUXNNVXm9XmRMf5B3hd8fPrgT6E3fgy5FJoxy3DUxAVBWlWvb6rU5QDnHsNroRJV0xFYo/aRaBVnensVOoei6GGvSIzBKE3Q0aAw2X7QgS8ILMjyuvUP5xAixZW3M169QA0+x5Y2X9Hg4usr5qH8Dh7XGffTjbTnO63qIWug+1imu5GeRNJb8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199015)(86362001)(31696002)(36756003)(54906003)(53546011)(316002)(6512007)(6916009)(6486002)(7416002)(4326008)(8936002)(66556008)(5660300002)(66946007)(8676002)(41300700001)(2906002)(66476007)(38100700002)(2616005)(478600001)(6506007)(26005)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1kzcGZObFlWOFQ2KzkyR0pldFRMRkJ3d0dNdktUV0xBL0FKU3kxUVBpRTFn?=
 =?utf-8?B?aXd6b3VIRk9ZVGxFNmNuL2swZ0VkU094cFFBdzM2cG5DazFRd3plZnZBb0hG?=
 =?utf-8?B?NjJWbHpUTHZHRVhzaytERTl6VHRIVEo4TTV5Nmt5Tk5MSkpDUGw5MEVDTDgv?=
 =?utf-8?B?THluK3c5SUVmVUFjelFoMkhLV0RUZTJBOHkxL0xkeVd1bVFoaFNQenM2OVZM?=
 =?utf-8?B?WHN2NU45TUU4c2FoaHF1NG0wMVRCck5Qc2htVTZPUThNMHUwZmNYa3RYSkJx?=
 =?utf-8?B?ZXFWUEFlYlZ3eTJSSWJyZUtrVEU4ZGZWN01yRnZ2dng3K09nQ3Y0dkhHMnF1?=
 =?utf-8?B?QXpkUUJNdjVuWEcxeHUrNW5xSkx4OVdoQTZCL3c1ay9SL1l3SHVFR3B0NVBP?=
 =?utf-8?B?V3hFT0JHNXFYSHJxY1VYaVdmbWxRTEsxUHBqb2U1N0k0N0l5NzYvOVNCeGVR?=
 =?utf-8?B?RHYrd3BSVExaeC9xODRpbEpFdTUwYlZtRERyS3d4VWFuMmFkdnVyT1FWeUhh?=
 =?utf-8?B?blBTcm1ZMEFYa1kwaTQ2dlh3cktjOTJVeWkzTnRpTnVwK3I3NmpUSXhUWlp6?=
 =?utf-8?B?YVNiaEZHSE1UWCtha2lVVHREVjJLdUJrRUVhQ0t5bTB4TFVCbytoblQ1MkFp?=
 =?utf-8?B?bnhEQXBXUG01ZTkzU1IyNUdvbTcrRUJGekYwdUp0TXk3NEt4UUtIbmtzb2M2?=
 =?utf-8?B?ZERmTVZUWEErRFNVOWFXNzRJVnhlT1d1a2RzdHVrU25hMWtNYTJaTWxUZE1i?=
 =?utf-8?B?eHZMRlVIdWZ2MzQ1RXFnVWNURXIrNVJtWTEyQVdDTDMwOEZIdlhDY2ExY2pD?=
 =?utf-8?B?MzBIU2RuUnJZSGdVMGhPRUpLYUJBNHN5ZzJWb3VTblMveTNVS1N1TEZ1L1lh?=
 =?utf-8?B?Y05zd081OVl6SW9HKzA0SHRqOU1aNG1SNjdzOGJBdldJbmZ4TGd6ZVlaUHpK?=
 =?utf-8?B?eEFEN3VvaGo1KzVUV3ROQk1DcnI1b2FXNWZwREVrN2kwMENaK2VnQ2xHUFlW?=
 =?utf-8?B?OGNUc3Ira3YxSG9NaGdBSnFoamZNRDdUSGZJUTV4TzR6K09Na3JZTVZqVkZz?=
 =?utf-8?B?R0JZUHA0QkVNQnFwVVFaaDYzY090NVhMZzJXd3FhTzd0Y2ZXTklKYXhhNGlt?=
 =?utf-8?B?Z05pM3R0eDNWUkJnN2JuQ2pJZzN2RWovSDJKWERRUFBjU000Z3NaaWtBUVpn?=
 =?utf-8?B?WHVtOGxSOStoaHVUbm5KVDJVQ1hwZ2hpVmZRZ0luRThpYTVhNFI5ZENRUXph?=
 =?utf-8?B?dGV6NjBCeTV0M2hKbEVva1gxVWJDdGU3WHJyU3JLZ3pQa1ZOSDdhM3lPK3Zn?=
 =?utf-8?B?ZFRGejRKcGJxQnB3Rld2bUVaK3JaZGpRbTdyUHlpRmx0TXpRVHY2Ym1DeHBj?=
 =?utf-8?B?ZXhrQllueHB6RStCUndpOFdFUDFRcXpMZ3BJMWdLOTBMazdONkNxbUhxckhL?=
 =?utf-8?B?SElSaXRkckRta3RnSi91YjZkelJXOFdUYld4U3RGMjBtaUl5ZHZIUVFPK0d1?=
 =?utf-8?B?QlRKTmZ1cUN6WXE2WmxnWStvb2cxSjJDdGtYWjJPWS9vei9vNFYybXMzSDh2?=
 =?utf-8?B?TXVnYS9QQ09SNVZGcXV0cTZ3WDJobjNWUStaaTcxbnVCRExtWVF0bGVrUTRW?=
 =?utf-8?B?R2pOWXJpUkExRlo4aGFNM0NsaVFNL1UreEtqQ0NxWDZQbUtUYUlDR3lpZWk4?=
 =?utf-8?B?em9xRkhPZVd3cjl3c2JxQXRCYUJ0Qnl4Um1nNXNJSWlKZ1d1MitCNUdtWnVj?=
 =?utf-8?B?b2xzdHVEYjZiL1JXVkhwNmx3RC9Rd1pCbW5leGtSTDNjVldla0Q4VjUwc2FF?=
 =?utf-8?B?Mm0rdUFZMDhya3JUNkxydlhFcDBXYk9SeVdzeU5aRUtDWWs5RjQ4K3hQUWVh?=
 =?utf-8?B?eWliOHFXNXJZWXhIQkNhSUFyby81dTV2dnUzYXBnblNxUEZBOFpuSVh0cTBS?=
 =?utf-8?B?c05mckVsVndRVG1WY0l5WW1pMitSY3hGZndOeU9LcmRKOWkzRko1UlhyajNZ?=
 =?utf-8?B?V3A3ZkFia2N5clc2WUZnL3Y2UXczUzQ0eXBDWnNuQnJoWVpOcGpueUNPZC9I?=
 =?utf-8?B?akNZZGlnMFlndEFHTTk2MmpON1lhSzAwOS9GQ3NmZWRhTStEdS8rYit3ZCtD?=
 =?utf-8?Q?Sq4t3iwJh5QCJcrFYQ/Y257r4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b6b961-0132-4771-83c6-08daddc58ab3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 11:22:53.3850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXYVFHACUMmmAXm7hLj8nnul0cENhe4lAgc0hb4ZYCCUtwQ7bGBFptHxFb8s7XKx+zv7Bv563egYENXUoIC3Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572

On 13.12.2022 23:26, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -153,4 +153,17 @@
>       (1u << X86_EXC_AC) | (1u << X86_EXC_CP) |                      \
>       (1u << X86_EXC_VC) | (1u << X86_EXC_SX))
>  
> +/* Memory types */
> +#define X86_MT_UC  _AC(0x00, ULL) /* uncachable */
> +#define X86_MT_WC  _AC(0x01, ULL) /* write-combined */
> +#define X86_MT_WT  _AC(0x04, ULL) /* write-through */
> +#define X86_MT_WP  _AC(0x05, ULL) /* write-protect */
> +#define X86_MT_WB  _AC(0x06, ULL) /* write-back */
> +#define X86_MT_UCM _AC(0x07, ULL) /* UC- */

I'm guessing that you use ULL here to simplify arithmetic when constructing
PAT MSR values, but did you also check that this doesn't lead to compilers
needlessly doing calculations in 64 bits when 32-bit (or yet more narrow)
operation would suffice?

> +#define X86_NUM_MT _AC(0x08, ULL)

This pretty certainly doesn't need ULL, and no use of _AC() at all.

> +/* Reserved memory types (cannot be used) */
> +#define X86_MT_RESERVED_1 _AC(0x02, ULL)
> +#define X86_MT_RESERVED_2 _AC(0x03, ULL)

I think it would be better if the left hand numbers matched the right hand
ones here.

Jan

