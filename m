Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FCD7496B6
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 09:44:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559685.874917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJeR-00082c-1O; Thu, 06 Jul 2023 07:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559685.874917; Thu, 06 Jul 2023 07:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHJeQ-0007zV-Ul; Thu, 06 Jul 2023 07:43:42 +0000
Received: by outflank-mailman (input) for mailman id 559685;
 Thu, 06 Jul 2023 07:43:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHJeO-0007zP-Kx
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 07:43:40 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe12::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d240bf78-1bd0-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 09:43:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7746.eurprd04.prod.outlook.com (2603:10a6:20b:235::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 07:43:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 07:43:37 +0000
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
X-Inumbo-ID: d240bf78-1bd0-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBmKOHxTC4J+rH/cU6LYHYQayG9GYzhIfkYkJ8tHQi4W8++a8BbdmjSCecijSq94gYuZYGQY557dH9XqTM2tzP1Y8824kZOWVyAr86cMibqiyYD7kaX33pxDYqqIxJuiMQ+ja864egUd5OR9fnzT1TIF02wURX/y/EYHAMAhQvFh1Y5LZJETbTlOZ3DbFyEwRpGytU8Ymk0CN5MuQ/oHFAiee8AbwxZT+IEHANd/iM5YFN3i+gTU9ivmfhFL3OgN4MAIOUxYLC07QzIjw1D6pPBajBqnUeeUzouw0zfjMlfNlDfQcbXyeiHjrDVpUtT7CLMWt8iw68ezLWEJFqOPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuKre1ml5J9+q2ccCSZj/nPbIAuvM31TeYDtCVeOiJs=;
 b=R4jD3rTg+5H+VMKH6tnJUBPTJxV0YnXQo2joCFQYOVyGrmMowGOczBGvw7PX0SjQPO+VXDM+VOcwciplv3UAjcpiZvv4OP2hp3Ktk94nMSi6csuntPEqakmk3t1QOySjZ3fDSh1RN9QhiLTksVne7xg3udpvfqU3wRBMd2bL16yH1KdqWFZVW9xoaLTpxUSs0nROQhwRHJZrlXcdV3pBN9wEt0P/+wf3WZfkcmHoX7SraXlFepfQ0gY9FTqAtuROi4eA3dzJru9JtxqVA4Aj1Ys94wER+FbOhwFXhXN38PL//EC3YYwDVa0Bhtaq5bLWxtL7hQNvQFJjKxjv+Zg2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VuKre1ml5J9+q2ccCSZj/nPbIAuvM31TeYDtCVeOiJs=;
 b=0ShykCoMkzbd8xg7HHXAShbCsIRP9KG3GikC+Eu6lYviG47Nz7Cmn/SEIxFYohOyzNa4niC8kZFAIcEcBMjCezyFm3D1vrjr3pzMiUScuIzVO40wpWzPspz/27nQYFKpHGqcPBKS/idAlFWMj61pGxb3vWN2fmSfIo482oYkMAc5dOnvwjlpE0iH3ImYP2IdmyA1ae+NYtJKRMDPYFgaGeWmjmBs+rspOGyC0iI7mqrSKQqnaVSf72MDj4CBhrSaEig+NxeS5CMxasKpjeDjHVHfAhyh7zotfROMyJUmzYs1OdoOQ1TcZUplHjrBpnoZqD1r2xu2vS+rLTUHADplug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a55021d5-39d9-a928-4b82-6bc6a02b42ef@suse.com>
Date: Thu, 6 Jul 2023 09:43:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 09/13] xen/public: fix violations of MISRA C:2012
 Rule 7.2
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <9e0d463e2fc09193a742fc7a64a331855705a4fb.1688559115.git.gianluca.luparini@bugseng.com>
 <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <290e4dbf-c9c9-49c9-29ea-6fc9b9a5a4fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CP7P275CA0003.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:42::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7746:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b89560f-93aa-420e-b72a-08db7df4b50a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/axOjy3p74EGbkiVdhj8Yq7kFE2pSkjl41BcXPd99JshWdQ6hHl/Y5Vp5Nn+ce0XJWDUK75SD+0kBksQwvq6MCou8qdNEfjYU1ERbuiuHFiOYewTAjZF8ZTxQnUIoVaCBnmxaUH2DbPh/DWDaFBACKXhtgPXJLTP2Qe788zozhM6bk1cJk8GJ0y6ieZtDvWdnwkKS/iLQndRYB2On+xfLllV8ePr/MzD2F5xToueik2qbbu8rj9FyV/beXZ/68VS6Nr9fwdxLxV5oe4IYGp1ZrcwtNXPtxSs6axrp1n7v8Jeh/2wnpkSFUm+yyTn01L40ZxjXZdWWTb5EHVL1NUpCyRElHKoVynZKNfXwVfwTscxN4mt2h84EI9/w7Dixo1a6Ojv2UprV4KkWLD2XvdzOxc5yI3j5V8hW/uU/lZgjww7Lhsv3qmGK/FyxVStmz37mwO+RfLi8GCqqsgjtmjlOFcxwY4sYq5iaPlZ1ovklEGQK9ZQ0OhmAsxl7g5Nzh9ouMVj333pAdI2gZCrBdhQgXGzsT/QjqS9JjyZWDwSNztCmB1ZsXeCXgVpgj5INQX5ng5YG9qs3iAdpn9sjNtOOh435HkeMobIyrGWr0Iuh2y7EBO9ESaSOztVb0hP19iRH5hsIhPOtkZYMw4hBgmaGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199021)(31686004)(8936002)(6862004)(8676002)(5660300002)(41300700001)(83380400001)(316002)(2906002)(2616005)(66946007)(38100700002)(4326008)(66556008)(66476007)(86362001)(186003)(37006003)(6636002)(54906003)(53546011)(26005)(478600001)(6506007)(31696002)(6486002)(36756003)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2ZBNVlQTm54Rm5UZklzY2VkTDRWdTF3dHo1LzE5cVJSRlJjVFpST1JsRE5R?=
 =?utf-8?B?ZXZzSC8wZjNzenRwWnpRZ0xicENDM09oWGRBRXMxM1VnTzZDK3poYURhUzJX?=
 =?utf-8?B?ZGJISi8xMDQ4c0d1bGFtRVNkMGJuL096S0tnVHhnRldJK044WVFsaDJlejI4?=
 =?utf-8?B?b1puUnFGanZBd0Y1RmdSbTQ5b2xhdHZNRDJZTjlQemM0UFVWczV5ZGtUWTZX?=
 =?utf-8?B?Z25jQlNwdDFwaGhwcnRsK3JYMHBNU2NPSWlIOGhoR2I0ajRDVVpraWpYaFY3?=
 =?utf-8?B?OTJmL1h0QWxwN2ZWV1lwMVV6QTJHUW50dGJXZEw2cGRzSGVMTEl0OXNXVjVX?=
 =?utf-8?B?TXZuRWVqWHI0ZlF6Y3Jxb2wrbG4vYkNWQnNDYnpiWjBaUjl6RVlUZks1L21S?=
 =?utf-8?B?UUg3aXhBemNiaThacmJhYmVuUjRSVE51Mm9YYWE3MzJDV01DOElJZHFBcDg1?=
 =?utf-8?B?dVdncTZQNExCV0Rac2FSVTZrWUF5WjQza1F2RTlCck9IZzRmZlpGVkhHd00x?=
 =?utf-8?B?UjB0UHFNWkFGSlVBODI4cXF2SEFCV2NyTEhjNzBFWWV5K2R4Z1hla2gxRWpQ?=
 =?utf-8?B?bVJEOHBrenVDM1dzOTg5YW9waExhK3VaOTB1bWdEZ3htWlFsUExQTm1CSTd6?=
 =?utf-8?B?dzFJa2xxd1NYRjVQcG53Z2ZpR2F3UGljSzJLVkpMV2psZnhWUDl3RWwwdWhv?=
 =?utf-8?B?QWoyS2NIaUFkSzJSVmUyMTVLTUU3bG1WVEVRcWtNWW1KNDZtODBNR0VBMDFh?=
 =?utf-8?B?MzNhSXNYUmtCa29pOGh3UVFXN2FvVDJ2UFdTaWRqdXUwYUtIT2cyWldLKy9i?=
 =?utf-8?B?Z3oyV2c4d2NScDdndCs1WWJldHdJeWh3M0JXMVR3UWJvT2crSVV1M2E1Z3hY?=
 =?utf-8?B?RDRKZ1c5eXNJcExSZll4bTJvd0xGWUZOZjNsK05mM21jSjQ4S2FNbVJDWnZl?=
 =?utf-8?B?Y0NKMjlNelFGbGRtMXdzZVU1REFVVk9wVm03VWV5cEVYQXZaR2FYY2tSQnJo?=
 =?utf-8?B?SVhramc0bGRPZURyYk9uM0N2VEF5UHNNL1ZXV2lrNjlOK0VPUk1pWlVQQ0Qv?=
 =?utf-8?B?OWhRM1dpc0w3WTlTSkpILytTYzlRM2VFbmV1N1JUa0dmelc3blNYY2VDYkEz?=
 =?utf-8?B?STlwb2FMcHJydzZPRWpaNGdhUFE1Y0xsem1jS1MyTkw4UUZNL2RlZXZQRCtW?=
 =?utf-8?B?dzdlbG5DcXBrNXNZbExUQ1J3Z2hmYWNFU2MzaHVvTjJYNFhjNDdrUHk0NDVD?=
 =?utf-8?B?L2NJNjhXR0FFNlRabmg3UUMxNVR2TUZFL2NUYzZXNVVHNjBha29SRC8yK2R4?=
 =?utf-8?B?SlVFZTVscmFGc0RlSWtwUjZHK1dodFRSOS83TW94UkRNTnpkN2ZncUE5ZTBY?=
 =?utf-8?B?S1M4ZHBTUmdYa2ExOGQza0pLOGdVYU9LWTM3bktHQmpqRTBSSzg4UXNyeXc5?=
 =?utf-8?B?RndiM0VEWTE2bHd4S3ZhZDBucXRCZHdCQWZ4b0NQZWdlQzdTTnZaMHloWjUr?=
 =?utf-8?B?ekQzVG5nRFgxTGxzUnNoQzdKMWVINUFyVUZUREkrNUpOSFNsQ2x3bzRIaE5j?=
 =?utf-8?B?UkwyRHJsQWkvWlc5RlRqZ0hiRHNiai9rdFg1TjJJQ0dFdTZIMzNTcnU0TUpO?=
 =?utf-8?B?RjVZN1AxU0c1WTBBQ0Rnai92b1V3QkszNlA0R0xNczdHR1VhdkZSVnoxN2pv?=
 =?utf-8?B?Q2toellld0tNK1V0Q29OV0NvK01SbDhPbkQreEhJMFJ5T3lKUDlrNFc5VnlR?=
 =?utf-8?B?WXV2UWRQYWpwckV4aWw1SWozc01ua3ltWXZsc0RTbkpYZkhiME1GM3lkVVVy?=
 =?utf-8?B?alh0N2FCajlncVRpd1VFSDVmN29ORy9HY1JZUmxVYkdpV29QN1F5OVJhcTBB?=
 =?utf-8?B?R1Z3RGtkN0hkQi9hbkV4RHlIWURkbjVDczJhVWd4NUZudzA2Y0h5S0hXeXRM?=
 =?utf-8?B?dTh4d0RZcC9jckdKaDhwUno3NXIxaFBqV0t6eGY3QW82UmE5QVhSaHR3Mndw?=
 =?utf-8?B?THVzL1hjVW93ampIWDI3R3drWDJmNU1UTU5wWHZ6dkJ0cStsVXVwRUd6clRO?=
 =?utf-8?B?VnJNQTFMcUZ1eTZWQ05hNFNQSDlOdXFxVGIzUWJpVjhRVGJGenBxMSt4S20x?=
 =?utf-8?Q?8QL86tCUf8EF+ZCGK6nYOLOGG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b89560f-93aa-420e-b72a-08db7df4b50a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 07:43:36.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sMpWiJNIpc9il3tATwW6vWauSxhvhmkzfKMqCll2/Sa3gG+ZXLbkWVBQqZ047BgXToecH+PY1/X/SuElYNiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7746

On 05.07.2023 17:33, Juergen Gross wrote:
> On 05.07.23 17:26, Simone Ballarin wrote:
>> From: Gianluca Luparini <gianluca.luparini@bugseng.com>
>>
>> The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
>> headline states:
>> "A 'u' or 'U' suffix shall be applied to all integer constants
>> that are represented in an unsigned type".
>>
>> Add the 'U' suffix to integers literals with unsigned type and also to other
>> literals used in the same contexts or near violations, when their positive
>> nature is immediately clear. The latter changes are done for the sake of
>> uniformity.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
>> ---
>> Changes in v2:
>> - minor change to commit title
>> - change commit message
>> - correct macros code style
>> ---
>>   xen/include/public/io/ring.h | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
>> index 025939278b..0cae4367be 100644
>> --- a/xen/include/public/io/ring.h
>> +++ b/xen/include/public/io/ring.h
>> @@ -36,11 +36,11 @@
>>   typedef unsigned int RING_IDX;
>>   
>>   /* Round a 32-bit unsigned constant down to the nearest power of two. */
>> -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
>> -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
>> -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
>> -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
>> -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 : __RD16(_x))
>> +#define __RD2(x)  (((x) & 0x00000002U) ? 0x2                     : ((x) & 0x1))
> 
> Shouldn't this be rather:
> 
> +#define __RD2(x)  (((x) & 0x00000002U) ? 0x2U                   : ((x) & 0x1U))

I don't think it matters much (as the comment says, the input is expected
to be unsigned anyway), and I expect even the one U that was added here
was only added for consistency. The sole one that really matter is imo ...

>> +#define __RD4(x)  (((x) & 0x0000000cU) ? __RD2((x) >> 2) << 2    : __RD2(x))
>> +#define __RD8(x)  (((x) & 0x000000f0U) ? __RD4((x) >> 4) << 4    : __RD4(x))
>> +#define __RD16(x) (((x) & 0x0000ff00U) ? __RD8((x) >> 8) << 8    : __RD8(x))
>> +#define __RD32(x) (((x) & 0xffff0000U) ? __RD16((x) >> 16) << 16 : __RD16(x))

... this single one.

Jan

