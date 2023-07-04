Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BB747358
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 15:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558364.872387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgTU-0002yu-VT; Tue, 04 Jul 2023 13:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558364.872387; Tue, 04 Jul 2023 13:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGgTU-0002wT-SQ; Tue, 04 Jul 2023 13:53:48 +0000
Received: by outflank-mailman (input) for mailman id 558364;
 Tue, 04 Jul 2023 13:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/z2=CW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qGgTT-0002wN-DH
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 13:53:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31d7aeba-1a72-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 15:53:46 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9867.eurprd04.prod.outlook.com (2603:10a6:10:4c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 13:53:44 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 13:53:44 +0000
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
X-Inumbo-ID: 31d7aeba-1a72-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvkVe/SVmonf06KVTBVQjOQu9eFhIfznAt4LpPyusr3Y8hc1JLBkivivkcxrvwk1ZTUw1uufEy2iZXS5viSCOSSuqiXIRAGNJr2VvDuzpaaQc9sCrIJnRgMoY06exgJXEbyC/v2thlCrUxeOg50qHH3jP3N3zHaDrQhvTbBuG1fS4qaYrMZgfEP7BVaW3rutIoZZuRuDMYWQ3wYWjNycKBCGo+txeK+3xtheo2/DLErqgiAUh0vYXPSLDEUp7KBaIXdKM3JjnKLbav9FDOpcAVp73ZveKDHiK06Bzq0B4yBtJ/2nsyGsQMMdhiaCAHkk/Wpe6Q/mbwt/NtiC8jcNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kd5boOvS+q5rVVsOKW3C9SGZ7jvv4HJO+PM0gqNKnl4=;
 b=GsUKpYjO5BvYsbFDTWz7YzsAZG4so9wRCgvlxxT06zTUBD6l5X5uqhYAt1kMCabMGyai0Cb/Bp1JHZaq+HZOzUf5v1hGAkBM173id0nB7fGsQpZLGVTWssSw0DCjnpWs8/g0EFKNy7HoSSa3wUlV8IgpzuF81t24deJLq4jksjH2zuOG8ZaGhxyn+n9/WQAm/CCR2CVrBUVlw2K5vTlksank+dgM8NjkDnI6Gqhpd7dO3xLrkz9Fq0xka4BiuSANAhNc6C7iOZpLY3DjHb9jIALS6cSOCSktrTW9EiFdgNOAMv2LMz4zGkyTPygtalov2Ri71o8OaZegB+3Ra1sX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kd5boOvS+q5rVVsOKW3C9SGZ7jvv4HJO+PM0gqNKnl4=;
 b=BJlaXcAK/ynTnuUQfTUlOT7epSd1VhMqnWLflzmXucz1ZMpSiuFzzjlaY3CUrKcImgFs3pqA9ZkJrNO0LZXdPnAiYGfYooEX5Xe5mdj63vIbTq/KLy4ahqoKC7VA+NJRtVeQJUTglDB6xlEiVCBgVFDJDF6btxaB4UgLMChfKeedQGmSbjYqMVfshVFJ+AE98M6nRrOiLnX93bXzxmLZFtUx88xDKFf7JUEMGv+uTQ1rUrEoDfyKv/77Pwyq4DlySrVQflVAU0ui2Ka4lGRovkjVpRCbYfKqi9h48Zl8ohUsDOTo8ByaOR6KiF160FLbdw6vNfsbIf6Ag0ZLwHUg2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7c7d23ec-5961-3370-b774-b547f1316066@suse.com>
Date: Tue, 4 Jul 2023 15:53:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 2/5] x86: change parameter names of
 nestedhvm_vcpu_iomap_get() definition
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <7392b1adc50c77855bec846f1a14e30f6a8ae1d6.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291225000.3936094@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306291225000.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9867:EE_
X-MS-Office365-Filtering-Correlation-Id: 98858728-3020-4f80-12a9-08db7c961505
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HoJF3DZWyvW4E2fysxjh5thJm5n03bF1xfs6FjA58EYUa56oi+Q2Gz014dlxdGTjqoxLn1C2E89WnsDLMGC6A8IyuY0CzVkU1TTCCIpiOS5I0knCKSR4TQaRcA5JQNIBDf1ArNPNoQ5UHuSwr3G2Q0n6QGQp+INYgB4D50yOn4aagwQ2MfmTFflXBKvJpNjOpCm6FkeGBdhZx2EeiogilVqzpONoU06dzvkQjHb4HiepvyYPuBiObPbGd0suRmtUAAOTe+Mlb/Cyt/szLjZGH6EomqPpEfzWIAWGRCAUUIhotPLxtCbKX9JiSZLXW7FR0gpzvUWhwRnSvyke8NWPsR4u5nVVynShVbFFuQfq8NUgHUkGic2TKfragl2oivhvQZmwFcHPfxBj3VEjeIMUtfoWCY7enN5/gj6NmCD52Eo9eV/XdljeJ85ZTrd4oNcVaTufABnOPudcIszTikFyN3QR/3bQ6BsuA5r4UbliRWKew2k6m6I7/XOY4705jlYC+3jGSmG9tbj0C++6SOV6YmhZeJHkvUQY5ZeCWrPziudm1KX83U8mvBxlm7bIDDH6qx0iHiE2RPU9GbwiiO1kMc3ucCgVmiiRYOfpxpDPjVRvVI5NjC4X6UxqxZXbmG3n8AmADI3myC1xSGIRtXV7vA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(376002)(346002)(396003)(39860400002)(451199021)(6506007)(66556008)(66476007)(6916009)(4326008)(66946007)(38100700002)(478600001)(41300700001)(316002)(2616005)(83380400001)(186003)(53546011)(26005)(6512007)(54906003)(2906002)(7416002)(8936002)(5660300002)(6486002)(31686004)(86362001)(31696002)(36756003)(6666004)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zyt3dzRHajRTdW1nL1Z0V3FkUkpyUG92VmJEVjlDekcwM2h2TkNwckZDN04x?=
 =?utf-8?B?cWtQbTlEK1p2ZjA3U0VNQW9rVnBSOUtHcDZBT3UyTGQ4R0ZRZFE4UktoNEFG?=
 =?utf-8?B?Uk5hM0c3VHNjR0M1NVVyYzBWaE9uVzkyUmhrdFVPb21rQWQ4ajBlWkR4Mno3?=
 =?utf-8?B?L0lKSEk0SzB4N2IyU1BScWU2QmNGcnpBaDFFR3hUSTlQTzJYb0F2YVh1Sy92?=
 =?utf-8?B?dUY1UG9zWkZGbW1IVGRLeE8velhONVUzTTdMUW5YWVRIY0NRK3duV084NUtX?=
 =?utf-8?B?OTU5T3lIbmVIb3ZTVWh5UW9tTnNiM1h6REJwWno5OHFnSng1d0RKR0JEejBi?=
 =?utf-8?B?T0daMVBZNzhyVkQwcEN0S2k2VUNMcDNTdUdkNlpPRlBNalNIazl6QVdhb3pT?=
 =?utf-8?B?c2xPRWxRaHBmRnRma0xieEJmT0NLMWhTQXh2a3VyaGNXc3BVaVI5L3FheTk1?=
 =?utf-8?B?ZXRXQ3FFV2U5bG9OSXdFK3BhSnRHUzErTTRxdGZoUnpYOGtHd0FuZld3Tnlm?=
 =?utf-8?B?dTdab3QvZlJ3dlR1RVRVMmRpK2FLUzVoZFJ3clhpQlNjeUhPNWkyY2VQODZB?=
 =?utf-8?B?eFNDRFpVTXpvMUNTTUgySFJGRW1YMDA5ZUthM1VNbG5KQVpyU0V0dWRkaWli?=
 =?utf-8?B?S3I0MXV0OW04ZXBPVXNSaFJtVUN0U2c1SUEvbU1MTVFVbnYzcDc2RVdHMFpI?=
 =?utf-8?B?RUh1OW1HTzdMWWRXbWtEdHNLVWxaVEpkWi9pRUh4TTg4NnRCQ1BtQnhBdHJj?=
 =?utf-8?B?MUZZRFJCcDlWalVQTnJRL3ZPdklIa3FHTUs4MG5aSVdmelJxMHJwUXEvZzFG?=
 =?utf-8?B?OFVtLzVIenR3UFhkUkFDcDFmdFRLQmt4S2sreC9LNm02SW51VFpWTDFoMW5U?=
 =?utf-8?B?UitnN0dwNVhZUUFkRm9tUURINVRtS3RHcVhidUNtYW1jMVVDOHdsSHp5Zy9K?=
 =?utf-8?B?d3dYRFJidkFCTVFpR1hGVUpET2RZcDhSVXVQL29XNUFjS3RkUWxudmRhSjZC?=
 =?utf-8?B?TmlRY29UQUtmL0M5ZW9LT1V5Z09zUC9jQzdwRnVUS2hrOFc2c0xqM0l0OUNE?=
 =?utf-8?B?RHJUTTlmeEF5R3E5YVZsVm5xbnlNZHZKRWQrTmJGRVM1M21yWnU5UjRkSzhL?=
 =?utf-8?B?cEdYUmp1QlBzVTF1VWNHSzdBejUvdTZIV2ZMaFIyZXc2RGwxOVEwVGYrQjJi?=
 =?utf-8?B?MXhVY3U5NERBeHRTQmk4ZFFaeHl1ajg4VlhxZm1zcUxGZ2RRT0VaY2RrOE5r?=
 =?utf-8?B?RW1tTVJRdk9EQWFMQlByV3BoaEpaWldVZFdkNzNZbUN3ZnhrK29oL0lOR2p4?=
 =?utf-8?B?cWVVT3lVdjJVcVFEK3BZVlFRUkRvZnJVcGNjZ1hpdjBIbW5hNncxdE9OMXRq?=
 =?utf-8?B?d05abU9WbXdYcm16dDJ3VFdDOW9ac2M0blF4YzRQNVZUUHR4UTMvRHhsZHpJ?=
 =?utf-8?B?MjhkYmk5bnN1VitnbEQ4dm1CV0RxaG9hWmFVT0txU1NyeStjL0RLMEhqbThX?=
 =?utf-8?B?b3d1UHNEb3Y2MDVVd1M1Y09wWW5HbFNaOTd0U3BpU0k1MHppcTRxd2h6ZlRE?=
 =?utf-8?B?SUFraXZJbS9NeE0vbklUSDNaYWs0eDBSbzc0WWREZnFZSzhtdzNjWDdwRm9h?=
 =?utf-8?B?Mjg4Yk5VczFINU1BbmVIM2FWMVR2UElmK1diMTZhdlg3TFJYbmFzRkRLcGNr?=
 =?utf-8?B?QlluUzFIYlJQS3RZQjBsV3pPV3J4T2xGQVM1VmU3SzJvOTBpMnNNU3dTMXYv?=
 =?utf-8?B?VDJoR0JBYjdYbnRUMVVoVXd3SzRvcnc1cHVKS21Xd25ac3FydVVtdjdia2Jz?=
 =?utf-8?B?dTBaQURza1ZlZ3FVQVc4NTdwcHBxUDdFT2dSazU1UnFwQ3p2dmdyamFST0ha?=
 =?utf-8?B?ajV2UEdsUlFIQkg1eFd6MWhUdVZUOEdTcVdoRFhPbnBYQUxqQjIzcmVTZXRM?=
 =?utf-8?B?Mi9zdEVST0Q2TlhpWFdQdFNJSEg1U0M1KzBwQVcvYjdpWGgxeEJjUjk4MlpH?=
 =?utf-8?B?ZkRCVnZVa002ZVM2RGtOR2FrdWluWDBEUEhmc05iYXJvMkNLM2pOaGZHeHBP?=
 =?utf-8?B?TnBCMFZpMDVmZTFndzdOcm5TQzJCVXZmWnU0WHQ0WmsrSktPeUJVOStFZzZu?=
 =?utf-8?Q?3z7/3KPJzMlDzP0v8oZNPKykB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98858728-3020-4f80-12a9-08db7c961505
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 13:53:44.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUXeJrozc0jJ2gzS+OwXSW/5b/+6K0wbTzTfE/dNCUayyaECm3mQnFkTkisl1XdpSZSCGVrfzVG745DOUf/0TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9867

On 29.06.2023 21:25, Stefano Stabellini wrote:
> On Thu, 29 Jun 2023, Federico Serafini wrote:
>> Change parameter names of nestedhvm_vcpu_iomap_get() definition to
>> those used in the function declaration in order to:
>> 1) improve readability;

I see this was committed already, so ftaod no request to revert or what
not, but I disagree with this: Longer names are generally hampering
readability. What would have helped readability is if coding style was
fixed at least for all the line which were touched anyway.

Jan

>> 2) fix violations of MISRA C:2012 Rule 8.3.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> The title would be better as:
> x86/nestedhvm: change parameter names of nestedhvm_vcpu_iomap_get() definition
> 
> could be done on commit
> 
> 
>> ---
>>  xen/arch/x86/hvm/nestedhvm.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/nestedhvm.c b/xen/arch/x86/hvm/nestedhvm.c
>> index ec68551127..64d7eec9a1 100644
>> --- a/xen/arch/x86/hvm/nestedhvm.c
>> +++ b/xen/arch/x86/hvm/nestedhvm.c
>> @@ -155,19 +155,19 @@ static int __init cf_check nestedhvm_setup(void)
>>  __initcall(nestedhvm_setup);
>>  
>>  unsigned long *
>> -nestedhvm_vcpu_iomap_get(bool_t port_80, bool_t port_ed)
>> +nestedhvm_vcpu_iomap_get(bool_t ioport_80, bool_t ioport_ed)
>>  {
>>      int i;
>>  
>>      if (!hvm_port80_allowed)
>> -        port_80 = 1;
>> +        ioport_80 = 1;
>>  
>> -    if (port_80 == 0) {
>> -        if (port_ed == 0)
>> +    if (ioport_80 == 0) {
>> +        if (ioport_ed == 0)
>>              return hvm_io_bitmap;
>>          i = 0;
>>      } else {
>> -        if (port_ed == 0)
>> +        if (ioport_ed == 0)
>>              i = 1;
>>          else
>>              i = 2;
>> -- 
>> 2.34.1
>>


