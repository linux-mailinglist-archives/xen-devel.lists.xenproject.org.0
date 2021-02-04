Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B21B630F765
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 17:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81362.150276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hJ2-00044u-6z; Thu, 04 Feb 2021 16:16:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81362.150276; Thu, 04 Feb 2021 16:16:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7hJ2-00044V-3U; Thu, 04 Feb 2021 16:16:32 +0000
Received: by outflank-mailman (input) for mailman id 81362;
 Thu, 04 Feb 2021 16:16:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KAxh=HG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7hJ0-00044G-25
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 16:16:30 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0bdd263-eea2-4200-8b80-d9a5e63c1869;
 Thu, 04 Feb 2021 16:01:28 +0000 (UTC)
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
X-Inumbo-ID: b0bdd263-eea2-4200-8b80-d9a5e63c1869
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612454488;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3CpNVcu44AkPPgf8hXnwiZ6OvnbnOEUo26180MBXtRk=;
  b=enVcOJqxSaxgvXQykGIXPD9U3qC/T3JwC0hlrUWr1huHk/5IpPRb4DMR
   bZ41Os2TH8llZGZhumSPFsFRBKv1XFSwqLVAnvnJDo+vStu9OswRaWmQx
   E8wpEYsegt3qX2BBOK59XqAIKM3ucUrZ5pIG+9l17RxMDjxJPYspM6eGx
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UiQh8a7BPeIiUXI9t/Gjm+GOYKmqxVAhAx2BXV24SdTEHBSh5JdZMirIDaYLUwzH6/JhBjQ9bi
 VuW5jjeFYVg5ioG22yw9Z98KZOJE2UVce0EmoHKjll9P1QH8w4VsUOVdEIGaWF3yuCYPysumv2
 n8Hd6Lncj7C8YzrkUAcgnUnM2EpVlZ9+de7cPyClY5AdgxfRD64CadNNGS69p0EUagK9E9WH8W
 ESK9X8VQccLXvG9fs+ku7KqFIrkiFDs+HxrkB4xw3p8bODEtZeegpzWzh8GiQZdIrYjCCM8N1A
 3lE=
X-SBRS: 5.2
X-MesageID: 36601349
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,401,1602561600"; 
   d="scan'208";a="36601349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dp+UOsUQkg+ImPqtrwc+TnwhIC40wXpMGxa8b/CGcNNuqvgtHbnuGp0iqAvv8U7V0Ggl4PvPNuYbGchub5OuXSmZ4A5QTNoTg7sNYo81dzo+NQ9+abLQHjCsFoAsUOESqw4ByvtxaYPmxcq3woet1Zs05ndtR6nUIS8VnKSC5ExVePjA2dmcYaHU1LUPDN+7KOipzrTO7E9w1tNqs391wB4FYPaVSIXxj9WLUpbdoKeO8uGWdK2GM4xmuUYNUXJTh/PL+lZHA+h/089vHAUoTlTX36TVKrgwYDXK/Osf+5BzFAEAfSd2RJZuy0AH3szw90CuBQeQBOt9iAG9LI5tVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyeC+rgF7z7nZMewkrDjJA8ro9Auxcty6b9jmd3lXiA=;
 b=WXSANyZtlGe5PyjLydx56khymVoavHk7CI0k/mmkNjmj1DAakmPjBjA7Kvv/8GTJ2surNH0U3FBstVOp7f0mNUoevB6Z7sq9vyIX7tG1KbFFDsXtF/jSScyz/VyhqjLoPqWOQcosqkcNxv54E5xV1jkgDDzzoG5oR58MLaqPx+R2mLTCSB7SR3nAGGRiRnQ73wjfzcDapXe87YrHlVnRubBHEQh2AZR1HyuDqXTJ8TwAyNTyc5QXNgvMNRRi0ugp5LoKxU+YNjipqRtrEsN7qEeV6WPzlOUPJla/MwrxV+blP0jiOpdnZNFdrqGgY3zpP57RHnNnGtG39tPEmZ9U4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyeC+rgF7z7nZMewkrDjJA8ro9Auxcty6b9jmd3lXiA=;
 b=DZkBUbDKafzH706t1J9+wKyx5/9zNToDkNVuYwFV0FhqIWpz4f0zGWoLej1+y0dxCPcA3Kpeo8wkNz0qbCm8iXVat1yPJ7geyhS8cJSq1bQOrzDhKzXTol65JZPHWtelveYhIBBGw5cZ356q9lgo0QAq5jrFiFt3M4427Mv9yTU=
Subject: Re: [PATCH for-4.12 and older] x86/msr: fix handling of
 MSR_IA32_PERF_{STATUS/CTL} (again)
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, James Dingwall <james-xen@dingwall.me.uk>
References: <1f4a8233-7f7b-dbd9-26f5-69e3eb659fa2@suse.com>
 <a04862e5-b534-5f38-e072-be63b3fb2152@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a55aa54c-cea6-8b33-0fd0-9534ffdaaf3e@citrix.com>
Date: Thu, 4 Feb 2021 16:01:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <a04862e5-b534-5f38-e072-be63b3fb2152@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0267.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::20) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fdbe9ba-bf6d-45e5-116d-08d8c9261a95
X-MS-TrafficTypeDiagnostic: BY5PR03MB5185:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB5185AD219F96F745149ACBB2BAB39@BY5PR03MB5185.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N4o7iwz814hgZrs09qbOeVg2U75jkhIDa75Vs02FZ64AnUbTLDjxgjEdMamuUAEbN03jhhA4/mpV3juvYA37QmfqqCi35vdBNTqjshaNH748t1kWYEZ8kHRXW3ytawoops2YGpQLqb/80RD980FGm9z39QDxZx2XBgxQyeC+QYylf9ktSMQSBjFp4/pTnCCzIGrcO0/JqRlFyaSBPZ3SeNFr//Lko6FTxSD+jDwpD+1QAhicu+iK6HIeWFAhzg0YVoEEMjpbCnLvzDAFDJHT5HMInmoa56PxB4GH+/nJTy2vw/fh5H7uoCq14twOUdgSldr52WsZsUMkuVOOuG7FlOmnEO5+hQfoQMS0ZPLvllyZNkeJeKITUF2vat+4EbZAHbxbe6JcqIzUivHpl3szZcXGBigGBNJC5G/NdKjYs8phfWuxBKnu5VvczXYDNtpMGLHPF9skoyShjIK9UHI+qnmiDf46eI6J6ptLl1voRZOG0yWDE5fbg0wuMam5E5Gi1GJFapvWq38vnLw+wSbT7LNBXY3+loWvpjojD3qtJl/awsc695T0WUzjmu0BedmiwmQxqGTjt7E1tqm2pCVJVrey06UfvPCbGf5KJnXPXcg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(396003)(366004)(376002)(136003)(8936002)(8676002)(54906003)(53546011)(4744005)(478600001)(110136005)(5660300002)(4326008)(66476007)(66556008)(31696002)(2616005)(956004)(66946007)(316002)(16526019)(6666004)(186003)(2906002)(26005)(6486002)(36756003)(31686004)(86362001)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MVlHNWl6amNRNjExOFdqVzNCVm9BbmlHQ29seEtQSFpIQm1oQjRsa3p1NmNY?=
 =?utf-8?B?RmJvU0lkOGkxREgycksvVmQxN0VrRDlDYXpXYVNMSk9iZEZMYWFrUGNxOEV0?=
 =?utf-8?B?UnZYMDRSN1ZzNXd0TjZkdDEwNnR3SWcrZEt1M01vVjl3RDJidG1nQUhIc3Zh?=
 =?utf-8?B?aTJySEs4bXlmTEFHT0NUQlU1eTFzVUNCaTNOR3ZSU21HZVNIcHIwcFAvZUp2?=
 =?utf-8?B?eVgza1l4Ui9Na2RPay90SlBCd1AyWmJpR2tEODFkMGdWR1k0Rml6aEhqL2Vl?=
 =?utf-8?B?MStkUHRmUzJWY2piWitYbG1zMXhzdjFCZkhpSUo5WEVsV1BiQjVqVktoRndo?=
 =?utf-8?B?b0NpUmNOenZwTXZqZ2JrOU14bHExWXZIWlhYS3dkbFVPVi9mMmo0YW5EUzVJ?=
 =?utf-8?B?ZWV4VTdORHFQdTErbVhOU2ZWcGlMSzFTL25odEZWYlVxK2FENVd0TzJiKzZV?=
 =?utf-8?B?VXBTT2tZZFl3ZVJ5Q3RoU2tPNXl2bDdvQStaSEVtN3h0d0ZKZ2FTY3M5Rytj?=
 =?utf-8?B?TVRLa2FJSlRIZkJFVno2K2ZHZERVMlQzZTJmMHp0RVZ1U2IrRmRpWWl6LzFL?=
 =?utf-8?B?U0Y2R1RNQTZjQ2JwVmdmbTA3blZ6aHE2KzRHZFBjMmFNaTlvK2VMTmsvSVBO?=
 =?utf-8?B?YkJMbjEreVk3UGlIcXU4NzdhdXZkQUd6SkNUTDJGVXhJYjNETTFxNU9rREpk?=
 =?utf-8?B?Uk10cFZCaXFuRGR5eFBpeUdRdk1OWmVSVURXNlBSeXZGZnpUL1RyQ1VQZFFJ?=
 =?utf-8?B?N0xyQXMvYjlVbU5TczJhMWNmRmJFd1lidVRZVnNrd3RURFlEOGplMjNHRU54?=
 =?utf-8?B?MTBST2FVTDVhVGt6TG1hRW92WFEzQXp5MmxjUm1QWkg5SC9Ybm13SzJlMm93?=
 =?utf-8?B?bll2cDNhWUhIN0hxVE1GSU8zL0tMSmgrclpKQWh2WjRMZ3E0emllWG1obDgy?=
 =?utf-8?B?T3VnL0ZjbDJjNndhZFNKb2ZiNWZSeHlqMXdxcm94eW95U3dzSEwrSTJucDly?=
 =?utf-8?B?T3R5VEhRMGpvVENodzJQQ294M3N2SGpqS0JTdWM1YlFRSUQramdpRzBzOThM?=
 =?utf-8?B?NTRwOUg3VnV0bldxRjlJOGJoc04xS2E4cjAxU2lJVzFwbTlnYUMzOUFZbS9H?=
 =?utf-8?B?UkVFLzZBU2trZ01mT0ZoVXk4alNYZ0lzTzRQdmRkN2FqUlVFRHhZbTNGN3hw?=
 =?utf-8?B?M2R4STVrSFROdTBIWTBKLzlXRzhtSWE5M3R4SXFJdGt4emdtbXh5Um1keHZU?=
 =?utf-8?B?eGl2SXF0NGc0VWJLY2NIcU5DNVBQd0Mrd0E4b0dMU21RV0VaOStWQkEyT1c3?=
 =?utf-8?B?ME1jYkZzajcrcFdHVVV4SDM2ZzNIUHhLVmJaMFZuL0oxU1RPc29OWk5sQU1t?=
 =?utf-8?B?bXFqMXZFaHdFb2hZUFBQMXkvYVFOL0s3OXk2ckpZL1llWTNuNkU4S0dINEVo?=
 =?utf-8?Q?DaDvuhTQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdbe9ba-bf6d-45e5-116d-08d8c9261a95
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 16:01:17.4316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMVCUJL/ngMKkVJxl/Q2oUTwJdWo+UZwspE1J9nkdvcFncAee1PL6ZTaIo3Kd9VrBLOgHGmKeKFFOhHdM1DbieenGdVqCUTCOBykf+OuzIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5185
X-OriginatorOrg: citrix.com

On 04/02/2021 15:53, Jan Beulich wrote:
> On 04.02.2021 10:36, Jan Beulich wrote:
>> X86_VENDOR_* aren't bit masks in the older trees.
>>
>> Reported-by: James Dingwall <james@dingwall.me.uk>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/msr.c
>> +++ b/xen/arch/x86/msr.c
>> @@ -226,7 +226,8 @@ int guest_rdmsr(const struct vcpu *v, ui
>>           */
>>      case MSR_IA32_PERF_STATUS:
>>      case MSR_IA32_PERF_CTL:
>> -        if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_CENTAUR)) )
>> +        if ( cp->x86_vendor != X86_VENDOR_INTEL &&
>> +             cp->x86_vendor != X86_VENDOR_CENTAUR )
>>              goto gp_fault;
>>  
>>          *val = 0;
> Darn - this was only half of it. There's a similar construct
> in guest_wrmsr() which also wants replacing.

I really should have renamed the constants when I changed their layout...

My R-by stands in light of that change.

~Andrew

