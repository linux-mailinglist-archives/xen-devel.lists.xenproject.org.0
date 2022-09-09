Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D4A5B354E
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 12:33:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404170.646526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbK5-000595-Sh; Fri, 09 Sep 2022 10:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404170.646526; Fri, 09 Sep 2022 10:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWbK5-00055m-PF; Fri, 09 Sep 2022 10:33:21 +0000
Received: by outflank-mailman (input) for mailman id 404170;
 Fri, 09 Sep 2022 10:33:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWbK3-00055e-H8
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 10:33:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d184da91-302a-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 12:33:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7734.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 10:33:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 10:33:16 +0000
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
X-Inumbo-ID: d184da91-302a-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2IFAEToincuQEUtTiLMqLNNxcHzE+V83V0IBMXf6ni0hXC4VXWArcvcXeD6wSQeADqvG90ncXeFnJw6rIJSLpmCoJCHKz4OoaJIDp3i3j8VghuTFMiykYgKWgoipIoJiPw+5vmBhjTVpUqkC3W45h66GAT1UWor5ITV9Qy8alWcVjZmzjsVvfSjJJMn6YyzKdCMtRup1/HAYmDEkBqIa6df2mdc9fNiZdXjB9L07ROMhmbZiKtPv6aYLoJPy27s48dJImDruLiuaMQ/E/xHeHH2vvfFZncgtZsYPDGd8ixJZwgt+n6qptgfYmbwDZHhx8U37UdUQZ8UkTduoZsZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OahClhzLlKj9h06YDZhAqQ53tGmERBosoEPBQJdhwkM=;
 b=Vg4LtjlD9xJ9CaUBXZtlLzSDXOa8vJpGXx5chDFRs51KVk6i6LxMCdtTNC2cDTYkv0cYeiaIXviKGLkOsNbQGgc3qscTg5haUw9c+HsrPLw8YIR3EGnFKGkNYr4Cg9BU7mZXNTbhPs1AiUhbuMCcL+zD7SgPtX/G9+KN6XKeo9JsUe5iwmg9XzVn/3eFLNqyWySGthIRvjyecMli7inmydiWiK6AAhDdRuyss2OdmIG6zUghBNTul4NyvfZUGEECoPmfdUKVyz97cDYFaGcydr0G3dbieK9jgnymlyMzj7IZThODCtK+It2RU/R2Ew2zVjXSyDRPctoFUIBDmDGCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OahClhzLlKj9h06YDZhAqQ53tGmERBosoEPBQJdhwkM=;
 b=QAPMOYHTCPrlLK36ku5HfaFvH0nO231xNqNZ+Gvp11rcbnSOlq9+htFtvg7zZtW/qoIGC2/H4X6m/cRbjDFAvptLKsRvtba2pG+6NPEC9uxR246DrAGTnGDqnx0WeikdGLzxIU/bO2ZvKdy3f/gR8HjA47x7vHsc5G6KscDsG5jUBpKeW6ms5+484Er1zezaRcKBzo9pNcFpcnBbi+0FjruHGXnbvs4LP9BBeByV7dTm1QpMExjj1+s1Km6eAtf/m36Q+WqX2M0wS1iIC97lOkhlrvgOWYmQlZFWMYelEihebj1/f2l2I8qTbfyQj4fkgt1GAzaWuYT1KZ+a81xkHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1a7486b8-0f16-0335-de6d-3b77ed2a15f2@suse.com>
Date: Fri, 9 Sep 2022 12:33:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: libxl source code
Content-Language: en-US
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>
References: <DM6PR12MB4297E6A74761806DE47A937E9F439@DM6PR12MB4297.namprd12.prod.outlook.com>
 <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <DM6PR12MB4297F8894C8867A67C07C4789F439@DM6PR12MB4297.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0506.eurprd06.prod.outlook.com
 (2603:10a6:20b:49b::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ceb578f-555c-4032-b863-08da924eb4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1Izc5pG8JcMqIXm+c7SFRALjffKPnZ0oMSrPowJraJSFZbKPiNBqHtjKC40GJpSpe+VK2qyYL0SBj1pHnW3aeSfOStPwk7L3X01Hqb93YymhWt0Nq5ZAMRMeicnrtUfuDl4pVGQU7MXDCk2z4hyiZ2F7Tcgu9tXNLWTIL/5WMdUcDuuhS1RU1SSwMbUS1HWXM3O0PqAzdq241AkLQDSHYnp0iZ/z+9Z6LOesQMNR3ex7XD1RiXtzIChUMEOg+PwaOLT/4u7ElO23JtdJXlE5jFz3oYVyx1lZUZDIephE6OS4BOdHys238T8GisHfFHklKFl7IQARC7Ega1gK+3fghu8Rccao0l76dY5RLwFAYM7l8NP1hjYWwmrn5ACOcqvDoxnf5xpLkxJQ8ueZfNgqo1Dp53S2W0T20Z5TjkTUPt+Dhg3NyygJ3TyVCF9IFX5E4BhasCT41DxeT7HvmGw9ZhqGeN/68CjJ80/Ju170GbsrldzRQL+ign+tEP/zJzH9uU1QksgsaNoJGg1iT1SG7qFKzg1v/HsR/YkShs7ITVQgjPJ0WtwsXpZzzUOafLoEjmJ54wQH6ivP8y5tedBeHHiIsNV/pv/C1Lg0H+R1bJ4o6wz7MmDxpzfAVnMbyPnGMfINvtRoItKGb44sun/fqkA4cAlyc/10RIqXpN/q9RH8LLDA34HYh89GKNDZ2+g+80LYYpDlZ3lVpDmbTcI4QOZPXcKMmd2otzfYH0AF/t/rXxlR2VssTsnacjU7svO194MZycnudS8bLXK/C1esacaIMRP17XfbUfGWrOeOW6lcb7onfdRMhafjDjeCWVsNTN3soLvCLu7px/YdUX4Nc7+NA4ELb6oz4LcTMVo1C2YvZNvb2wZaHFl5EybF01v9
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(376002)(346002)(136003)(366004)(39860400002)(41300700001)(6512007)(26005)(2616005)(53546011)(6506007)(8676002)(8936002)(5660300002)(66556008)(4326008)(66476007)(7116003)(66946007)(2906002)(4744005)(186003)(478600001)(6486002)(6916009)(31686004)(86362001)(36756003)(38100700002)(316002)(966005)(3480700007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkEzcXpwN0RhaEtrTWttaWlyWDdEbkYzbTB4RFUzNytpVGYzTnptSzJtZEZX?=
 =?utf-8?B?VGhaTkJOcy9rSU5iWjFVKzFIZXlJdU1ZUm80UHZNWEhucjVHb3BXdkFzSkJ0?=
 =?utf-8?B?NHJ6ekhMUkJvcENlMGtWbEF0NlRTd3kwVlpMaEhPalJxWGJoQ1BSejBTL0V0?=
 =?utf-8?B?T2l3OC9hTEFmWTlVNkl4dzNMRGdXdWZQMlUvNTdpcVNNSGhWWFhUMDFIMVZV?=
 =?utf-8?B?NEROU0tPd0w1aHI4UDdEdEhGNnVoTkdSZEtua3g5ekdyWlpaOXNPL3ZuN1BE?=
 =?utf-8?B?SE1ZN0VVWWxYcnVoKy90RWcvM1JJSUhBWGkzTGNuQVM5VlFCRUlGdFlBMWYw?=
 =?utf-8?B?R0xPcFpkbmFzK24wS0t6aFhUM1Nhdm5wQURKbmcwWU9QS0trc2hEYnJVb1hW?=
 =?utf-8?B?SXJ1MkRTS2FXMHRYWHFDOWoxNEh0OGVSTmNhUU5lbU1WQkZUWGFqYTU3RlJW?=
 =?utf-8?B?bnN3aEwxcDQ5R2E3UTlwbnF0YWh0VjJaNFU5aXpORE81bHBZTml5a2pGTU5o?=
 =?utf-8?B?REtlQVZrRWEvNEJXUktEeWE1SnZCMm5yb2JlSW1Ba3Y3aHNuOGt3Q1BUZ2I5?=
 =?utf-8?B?ZS9lMTZuS29nM0VJbHg5RS9iUlljYWZVb2FObEtSUk9XVE5Ua0Y2UHdDdkp2?=
 =?utf-8?B?NjNDTEtkYnY2Q1V4WGNHMEhsdnd4b0o2Ym9rd3NMaVBtM3MzNm1aWGlnR2FH?=
 =?utf-8?B?WmhHRVZqc2RWb29ieVFLcGs3MXpoZXZXN3pNL2QvdGNxeG9PNkFrckMvNmd6?=
 =?utf-8?B?UWNmOHZxMlgyMDd6UVlFcnd2alZQeDRwM0xQYjg3Rk43MDdIOXhWYXRPUVVp?=
 =?utf-8?B?aUtCejc3VTVkRGJmQ2JoWTZWZDJiRmlxVno5UWZWam4yaFlHNWtEck1wamh0?=
 =?utf-8?B?NG1rV1ZXcEdBOVp4eWcyY0VhREY5M29UMXVaUk12TVhxeDNiak5zeVVVSlRi?=
 =?utf-8?B?dE1NWld1RFN4cEdpeUNxcTdMa0F3a25KZVlxallGcmpwTzlHTGJ5VjRZTEQ4?=
 =?utf-8?B?eXNPQkpRajRRZnNaN3p2eXdOVnNDZlBLcFZ4enBOWkxIaXFFeWZNZE56U2Ew?=
 =?utf-8?B?MU8yVFl1THY5bGNEbDhCcS9icCtOYVF4bDRtMkswV1NWQ1d6YXdnc0RnNVk0?=
 =?utf-8?B?VGhjVEMvaElJVXhGVVVYSkNsSVF6NWtocmMwdUpmc1k0bE1CMHJLU3FWazFw?=
 =?utf-8?B?YjRpMGhmNjNkQ3MzcjM3VUYwczdiaWdwdW85TVg5cHhJNzZYVTdHZW5rSldC?=
 =?utf-8?B?NHViUm9YUWo3R2tNbEpJUVRaaGdmZmZMbHB1M1JLVm1oTjBpc3BySlU2R0ky?=
 =?utf-8?B?b2xLWVVwRjlHZ1NjZEJ4Vi9BL0ZWQiszZjBYdmh4RjdkUDd2bk52ek4xcGhY?=
 =?utf-8?B?ODVreHQ0ZGZocmRYUGVJUVgzREswNkVHWVdDd3Y4VjRlTjROYThYT3F0UC9W?=
 =?utf-8?B?WkxwM1pHNWFUMUFvVlJKenlwNmVFMGg3MGU2NTNKT1NaNWxWOWtIZC8yd1Ev?=
 =?utf-8?B?QUpXMVByQkx1WndlaGg1bHd1Sml0alVLSVBwZU56c1NpWk42d05KNGJ1eUtn?=
 =?utf-8?B?djhsTjMvYVAyazZaM3VVVEhycTVzRWs2UDF0T051alFpR3RFZm1ZTmxYUGpT?=
 =?utf-8?B?dnZkRDg2bitLUkRLUldmQ0JBOHFRbFBUWW44QzBiWHV3U1hDZUgyN2pqMVVK?=
 =?utf-8?B?TlJHSzBod0JLSVplczFxZkVkOVJUTUM0TkMzQ3hHeXI2UlUrQXh6QVZRZjhN?=
 =?utf-8?B?ZkpBbk5tNmNROGJwU1BZVW94N21XY3BSZHNCQzUxbzN1RXYrR2ljWXlkdHlW?=
 =?utf-8?B?YlhjTERwa2VIY2hpSW9NTkpLSFhYcWJUbWZuZG5pOC8zQld0NkZPc2dNU0pu?=
 =?utf-8?B?WnNaSS83Qm5taGZzUUp2dDczb2JidDBmZXA0WEc5Mk9UdWxaN3J6UFpoZmpR?=
 =?utf-8?B?MmtKeHR6Y2RiUmNLZXZyczd2cXFxM2hvaXk5ajFseFh6TGp0S2dVUHNZaUVY?=
 =?utf-8?B?Z0NzTXkyR20rM0NHTUgrUkZ5bnV2dFZPb0UrU1U0cEtIaWwrRGdFWXd2R1Rl?=
 =?utf-8?B?eXplRURsU3RnRUtVbDdsa0ZXbGtkeWdGa09paEl5R0pOSXU3dTVDSUR1MWxZ?=
 =?utf-8?Q?rH4tgHJFkszW+lXP7iJ/kZ1Mx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ceb578f-555c-4032-b863-08da924eb4a1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 10:33:16.3354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7mfuPjrqD4H6sSL4kJcvN1Kon4pq/TsGWF6CGEoYho8f3k7M1NMymwbLdSgDcczgEn4B26nJ4TjEQY/S2z2gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7734

On 09.09.2022 12:24, SHARMA, JYOTIRMOY wrote:
> [AMD Official Use Only - General]
> 
> Adding xen devel

Please don't cross-post.

> Regards,
> Jyotirmoy
> 
> From: SHARMA, JYOTIRMOY
> Sent: Friday, September 9, 2022 3:52 PM
> To: 'xen-users@lists.xenproject.org' <xen-users@lists.xenproject.org>
> Subject: libxl source code
> 
> 
> [AMD Official Use Only - General]
> 
> Hello,
> 
> I am looking for the libxl source code to understand how vsnd (PV audio driver) has been implemented.
> However, if I look into the xen source tree (https://xenbits.xen.org/gitweb/?p=xen.git;a=tree;f=tools;h=9b2efe082223bbf60b41e947ceb4821e98708c02;hb=refs/heads/stable-4.16),
> I do not see libxl folder.
> 
> Specifically I am looking for the code which is present in the following patch set:
> 
> https://lore.kernel.org/all/1509548687-6071-3-git-send-email-al1img@gmail.com/
> 
> Can you please help me locate the source files in this patch set?

The tree has since been re-organized - see tools/libs/light/.

Jan

