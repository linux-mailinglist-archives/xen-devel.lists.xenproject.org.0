Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0136E76E3F8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 11:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576121.901907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUKu-0006Og-0g; Thu, 03 Aug 2023 09:09:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576121.901907; Thu, 03 Aug 2023 09:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRUKt-0006Ml-Tw; Thu, 03 Aug 2023 09:09:35 +0000
Received: by outflank-mailman (input) for mailman id 576121;
 Thu, 03 Aug 2023 09:09:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRUKs-0006MM-8o
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 09:09:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75a322b6-31dd-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 11:09:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6851.eurprd04.prod.outlook.com (2603:10a6:208:182::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 09:09:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 09:09:30 +0000
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
X-Inumbo-ID: 75a322b6-31dd-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQCsFwQA117si/FdDE+LP0fgHvRW6uPAo4uK3s5MzNKYtZl9S6wkg+nsHgjSqTNL1+soxtVuESRGJPKYgUcJqPcAajla2B5IlePXUh7nRsT6IApRJapaFLVi4eJLST8K02CSkZWXVNGpCAl8SXKMJ1h1lBZ1ippHL62M7DdurJMfYbCYmV656XooEFG5MnSVoLuNTHhzWnIXxuSrk5Bxv7DA7ZxRkhcRn5fVtj2M1F4hhxNv8DXRTTmrnrvOmNk7s/hNkvrxBoRW3V+901v8Bv6AGHjnJUd+ZhPYwMWEjfM87PXLGNC0XfbBzxvn0lLTlx42CxQkh6Xj+C+GyhENWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8eveVOsOqlgiWdKX5XlNF3lqVszhPaGXVqKswy2xkU=;
 b=WZTDJNZ67h5eRe44aRzysFQ9N+b3InYJ0qoLcuZ+uOqgmLRgJEnhN7+6VDNayKhf35G3vUWL5UVNT1VULFMjmSbeCZELZTcB462NcyEk5lw2G2Xq4lCUH3VXr0890vCJ83/kT3TFK88QqM/7TglsS2WuvTC+xAbCBjxDkPBxTnPxQ8ZaOHhizthAig+ZasKnJ9bxXFDPDZZ2yQojKH70qY397nwy2Z7wy0KKv19dgK84V+kngwrf40Cmwg3AB0CD8kHX8nzG07CvueOJxySat1IeAmsxDVN5959MJ9zwZiGEqodCb7wBaw9cTfx6KI+7yRyoQneq3tbWJDd8WWtwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8eveVOsOqlgiWdKX5XlNF3lqVszhPaGXVqKswy2xkU=;
 b=JEDWqCcxRJVZKp5FZYA3hk3DyuooIgTJASoo1RlAGAHlX949TU4tYFbIAlbYHVsoJxskgEj1E+fIu4mN6vmWTbMyoBA4moYJFqm60ESgDY88RiO+rxyzxT3IN7BoOCqch0qVubaLGid/32deP25NOLkh+hQzigvP8FbDHq0ssLVWe4vdNbb8bq/Amw5B979UM3tt7VHb8PQHrtCAQnxDn+26G8oo1aS5zBBaYvA1lEqq2DxG9P9ancH2alUDdmRtfCB0jk8Ap7ZckqCEr+0uK4iyKSwoO69v0YCy7UHMyeSJz45FCnV1Z6JdaALyNi5+X+RoyUT2aTA2bn/OvJEiGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02c49ab5-e943-d256-e5a1-95b5770f48a8@suse.com>
Date: Thu, 3 Aug 2023 11:09:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 04/11] x86emul: move variable definitions to address
 MISRA C:2012 Rule 2.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <e958e4831a5363efe2a3902171fe5d7a37908e69.1690985045.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2308021915020.2127516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308021915020.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: e53dc178-4f19-4bd8-8f73-08db94015892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+igWFaFi8y6x3PUqbOBNhKnOHzbmSwEbiPlaKnmbytoqdYTJ4pTCh57kRlnvmv+D1md1XgmuAhYy1kyO88rTOJcf9kVMYvuooqb8ZP0ACR5P/kylRHUbKFQXOQZy6MvUh7880JNDFBZ9AJSB6yVGsjFzHpN01/N6O22G83GVBvywMZgjSxQVaAP0F2InBAOq6vlgIySn0q7LBHibjqLFqX0J+pOxyWKiBgIAtQ/oZ3MbNY5pekl19rB8vcYNbIi21kpF+YXOgqaK2g8AwvUWDWL+j/Wtrko4NR6z5PFciU0KLvhxugtNOUzbxsZSgp0L7fdYEvIMFGoiPfODji71WOCXmVRly4pMllgGvVxI8NFFu+cz4fLHZFsk+zRNZ7gi7jBnj7+TlsgUOJTKr0ZszqS6ZE90FUITejv1MwNysbgzWN9M5lqIL/LI1Ne/fvlsyME8pi7hleem9nbd/CPnJpRCnaGhoCT7MXkL84rVhKOjog37YxcZtCqEa23lNDMF6M9rC8Y079YlLy9dwbDaHw/yMBp7OEqBAG/2ADnFlocCkBM0RUnVVewso+TieuQOP7CiaA8BbQ91BpcyvEoivOfv/zJGQ9ox971aU3TVV3GgYaXoY4dHr4LMzyttd1/N8V4NUasLjVjCJbrADZoQBA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(2616005)(53546011)(83380400001)(6506007)(26005)(186003)(41300700001)(2906002)(66946007)(4326008)(66476007)(66556008)(5660300002)(316002)(7416002)(8676002)(8936002)(6486002)(6512007)(478600001)(54906003)(110136005)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bitEdytpcXJjOFlqZ1RVSlFOSXlPSVEreDVWK3NoQkVSSkY2UnFYZ0luejZ0?=
 =?utf-8?B?cURxMXNlQXcyU2ZxOEdjdGFMaXRzYjY0ZENQd0JvQWdIVlk3KytMb29BVmxX?=
 =?utf-8?B?eHhDVW9CZGlLRzlVZk9BbTRrMjhHWDJ0eFQ4WExhYmhjYkJDQkp1R2tjamxi?=
 =?utf-8?B?K0VCNFQ1S2k3Z0N4Y3ZNcXhHV0NNM1hQWkF4UGZFNXFjVDJuK1JUSHhIbVFJ?=
 =?utf-8?B?eno0Y0ZpdXJCSUpRVmJFMkVrd3IwRERIc0krbmh6QnRpckJkRXdVSWV6azNo?=
 =?utf-8?B?eHBUZTgrcHFYRzhIZWYwM0pQMmhpYzNWM0RvNlZ1Zms2SmlqVlVFdThMNFow?=
 =?utf-8?B?YVQyWDMyaFV0OEFFb1lyeldnTFVocmg0SndjK1Y1amVqMUR5YmhYaVl2QkpK?=
 =?utf-8?B?VnpJQ0ZYZ2FtYWtjYi9hR05ZOVMweTRNbWpxUE41NGIxY0ExMlY5N0s3ZUtX?=
 =?utf-8?B?Wk10T0E5ZDBYYlB6Yi9venMrT2JxNnFtZTRqOUNtVWpSZitvbENoUmFqOHpy?=
 =?utf-8?B?L1REbHlFb1Nidzd2bXpGRTBpOXlDaGRxa2FqcFA2ZHI5R2kweThSenZJd21H?=
 =?utf-8?B?a3lwY1BhcE1Bb29uSk9RZTlkSmZoY1RJaUxzOFFWUlVqdUN1T0Q4NCtNaStZ?=
 =?utf-8?B?TEcxNVVjOEVTZWt6OXFlYmpBMlM1dE00S3BDdTcwMXBnRFlJbHdOSC9LZjVy?=
 =?utf-8?B?VVFpSUlsSkxQSkNwRHcxOC80K0lBckxsak1zcFBGTnIybUkwSW5WWUgxdXhU?=
 =?utf-8?B?eDlvWWk2YjliWUVrN2RMMEdaUkdXN3J2MFYwYUVVaHdwTUNmVHA1RzVsOFQ4?=
 =?utf-8?B?YmR6aCtwUVdnWDNYTnMxUVZSdE5KRDdkdzA3UEhCbTNhRjRRaTByK2xqQ0h2?=
 =?utf-8?B?QnQrMlpiVE9OVUN4M3hKRVExZVhxSUFSOE1UcFUvOFoyeXNaQUphVCtsNzd3?=
 =?utf-8?B?V05mK3BhKzhZTHgwSkxpekkvVldUcDNJN3hkZXpiT3h4WVRoQU1ZcmNLbHQ2?=
 =?utf-8?B?SEo0THhPamU3d0w4VHBaWnplRE83T2pHMlI4SUVucVdySWljWUo5TDl0SU16?=
 =?utf-8?B?cndVdnJKSnBDczdadVJIR0YrY3krNUEyeUdLOUc4K0tkWGQxK2p0c1NQS2hn?=
 =?utf-8?B?Sm1NNUV4blF0Nk5vMk5zUzl2cXlQUUhQMHVPWFFNQmZFWlB3TjhWeDdqdmZU?=
 =?utf-8?B?SGdsdmNybU5hem1TS0FDVmZITEU1VTJTSk1jZW5BblZBeW1ERWFGTmFRZ0Y0?=
 =?utf-8?B?QldIeWVXZ0FWRW16aTRIYnBXYkorR2hsMzJQVG4xU3dua3htY3VBZFpVb0My?=
 =?utf-8?B?MlpTL242UmNMbGxEd3BFeEtuYlJ2c3pDWHBDTE1iRFhHVndWcGxNVHMxTGVa?=
 =?utf-8?B?NWFvdmdmUVRmSmVJMDZsZHVVSVAvaCtmcmJQQVh3V1pQZzZWMnN0dUFPK3pQ?=
 =?utf-8?B?UGViUlR1dmoxVkxtV3ZKTEM2b0ttQVpHWHpyTm5oTDQvaWJYbUVnSlR5VDd0?=
 =?utf-8?B?bTkvaXRqZVJQWFF2eWp6SEtYZ1hZQnBqV1JzWk5PSzl4VU1tcllpMFo5OEYv?=
 =?utf-8?B?Y3VkRjV4TldGMG8xa2QwTDRlc0tUeXVVNWZnYmZzK0ZKQUM0SEFJUlNRN3A5?=
 =?utf-8?B?WXFCa3FRTlgvUkI2NjhabUNDOVpHeUJRT09sM3B1S2dWMmE1YmRPcWt1ckxx?=
 =?utf-8?B?bTFzczdBSlpuTHB2eVNXdWRjdHNFbnk2dGsxUFF1WGovb09rbEdHSGd1bkIy?=
 =?utf-8?B?eTg1NFhtVzdNWkx2WXFmM2l0V0NBS1hNcXNIVVJ6UEZHcVpkSzEzTHowUVNj?=
 =?utf-8?B?RXpBNFBYdnB1MFlKdmV5T1NXVXNCMzdmVkFPcTVVaEFSbVhqT29UZkdQTEs2?=
 =?utf-8?B?UnpuUW9pQVREWFdwdDFHRVpGRUVRRWMxZ0dFZUNha2laNCtNcEMrRjZSa2Fx?=
 =?utf-8?B?M1pzY3dZbnZBT3MyS0orR3I1MVRFSXJVTFIwZEVaSURJSklVdTFRTWdJTUhX?=
 =?utf-8?B?S3dHWjhnWHh3MERQZ3VVaE9VVEF6T1BsV3U3SkZCbXJiQkw1SmdKTVNxWU5x?=
 =?utf-8?B?NDZROVRDWFR6dThPS0lWQld4YzFtQWEyckJtT0lBNjVpTC9sVmw1N3VhMTJ2?=
 =?utf-8?Q?Bsq2IihcPg3VrIb5fospA6PF5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e53dc178-4f19-4bd8-8f73-08db94015892
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 09:09:30.6693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jDDVrYT3vhbzn1Os774ehJUdrrBSU2xqN/bgURLqz+6+HtFOwlG5EyvqKL5ivUNe0PaHmQ+gIN+PlDmNalRTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6851

On 03.08.2023 04:33, Stefano Stabellini wrote:
> On Wed, 2 Aug 2023, Nicola Vetrini wrote:
>> @@ -2289,16 +2289,15 @@ static int cf_check hvmemul_cache_op(
>>      struct hvm_emulate_ctxt *hvmemul_ctxt =
>>          container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
>>      uint32_t pfec = PFEC_page_present;
>> +    unsigned long addr;
>> +    int rc;
>> +    void *mapping;
>>  
>>      if ( !cache_flush_permitted(current->domain) )
>>          return X86EMUL_OKAY;
>>  
>>      switch ( op )
>>      {
>> -        unsigned long addr;
>> -        int rc;
>> -        void *mapping;
> 
> These three could be...
> 
> 
>>      case x86emul_clflush:
>>      case x86emul_clflushopt:
>>      case x86emul_clwb:
> 
> ... here in a new block

Except they're likely to be re-used as new enumerators are added.

>> --- a/xen/arch/x86/x86_emulate/util-xen.c
>> +++ b/xen/arch/x86/x86_emulate/util-xen.c
>> @@ -77,10 +77,10 @@ bool cf_check x86_insn_is_portio(const struct x86_emulate_state *s,
>>  bool cf_check x86_insn_is_cr_access(const struct x86_emulate_state *s,
>>                                      const struct x86_emulate_ctxt *ctxt)
>>  {
>> +    unsigned int ext;
>> +
>>      switch ( ctxt->opcode )
>>      {
>> -        unsigned int ext;
> 
> This can go under case X86EMUL_OPC with a new block

Same here.

Jan

