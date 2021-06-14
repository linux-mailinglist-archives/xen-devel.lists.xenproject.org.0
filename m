Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 555C53A6C32
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 18:42:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141718.261687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lspfG-0000xc-1m; Mon, 14 Jun 2021 16:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141718.261687; Mon, 14 Jun 2021 16:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lspfF-0000ur-UX; Mon, 14 Jun 2021 16:42:17 +0000
Received: by outflank-mailman (input) for mailman id 141718;
 Mon, 14 Jun 2021 16:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AGyB=LI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lspfE-0000ua-5t
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 16:42:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de7b7b0a-bd50-4957-9dae-b783964c599b;
 Mon, 14 Jun 2021 16:42:14 +0000 (UTC)
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
X-Inumbo-ID: de7b7b0a-bd50-4957-9dae-b783964c599b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623688934;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YxjuSUkcpbdBTj2DdKCqim+neFqI116FXn0pmFQyPNQ=;
  b=XMYFTaFT/kWSqdjXGkrkZMDdKteFZKVWea2ztqCPn7Ioe1peo0q6Xcny
   F9GzQSss/0TjYPNHDZ0XAAoQXZdk8WTR4VfALz5+DpZPBjbD5CSzOUFjf
   5a0j/vpPffS9B9BF5HAPbODKUPbgyOv7LHxt+r81+bclCEEgIPVNyG0sd
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pwAFhFVnoDb8Qn65g2gJMq8zaGKxeq4VPJUT73pPaYkn9+mr58kuoogA60XHQrMCVzszeC4rMK
 qiQF5tYXp+Q966tggI+6x9BV4wNyf1DHK9ZiZZO/6Hb/2ZHtY4VT1Qpd9wJcbWNvvCclXPExpp
 8L9gIEVjRBO75/in3bVNuaEaYxg+NK7U3GACzSC91UknPywRGcUn3T5tZiPphCkz24oXlSzExS
 cISzkyftuTmJSiUUus6FYD66tcNi3t+Yc/Gi4xfgnopAOtlGIbHh0o5Anzr6KD+dFtn6zPJ9Kg
 fz4=
X-SBRS: 5.1
X-MesageID: 46089939
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/C0ed6NuUkKdJcBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-IronPort-AV: E=Sophos;i="5.83,273,1616472000"; 
   d="scan'208";a="46089939"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtBEKvz5QVWEifbMg2dpdDrOL+ImH/pJ+Lg4LssJ6maiULKA9q8xSZvmz+c3EXzXuKkyfgD76aqIXPdbkdoLoo6zOeXsrEtz5YoEK9uJLCfko/0b78XYbTvEFmqcQIN2fY7QKKr1eJ48wQbNYzn2UbY1Cbydd5UJ3QF401zK+Giw6ukwT2Q1VyXJHCzHqP04EcbPigyIRJv5iDz5ydg8zrM+qE2cENfQ69VTckTvcdQUjbiMnIL/+WT/1yt4Radhi0GQ4BJS8/qpb1ywmC7i8E/nXZxeHNAgS6M3IcYCptNn4JB5ouw5nPxtQnWFMexSyaOfAfMY4dG6Yjl19i+sDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJFBPrmc5Rl4w3EL0oHertCC54rQcxAQVNjvK5mj840=;
 b=VdkQznLpiol3vBfDFsdVswatgxbeLWEAtN4MnZ8trBvOE3gAtwc/HYCaez0vG58DVbBnS2kqGXr9n0HrFRURtqE1A+7DrF0ZgzqCRsfe7D2JhxHX0E1PnjBzALhKTIvAm5EDRbsS6DuHpNtnY8FFbV3Z13+5zqy5hRUXpYwQUTmqlEdBI4MlHEnU4FUre+Guo/ZhtOvX3DLyOwunVZLrYzR41HrLXQ0/UDtKAHuLB02NJqPZAHp8kZk4aJ1ah8DKzBaDMdPh4EFWuTiA3pg1nbqPGW3YE9pLc8idv2CEuobA2riIiz7ESpaZuYR7J5EKqgxQ9urQshcFlGJXuy4B6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJFBPrmc5Rl4w3EL0oHertCC54rQcxAQVNjvK5mj840=;
 b=AFoXz8Pdl8OoBAjiMPy5O7LptllLw5P+5ajkNVrgPN3tRJ9a2qHpe5moKPHs0zyGwGRnwlX66Ld2OhYm6xCnni/6cdDuB0G7eE5kgWjUL2u1TOnEsaw6jhVFnibRl3HXhpi/ehF/F1ALZUt0N50dBnKlJSL1ksMwivhxT3/i1go=
To: Edwin Torok <edvin.torok@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, "JBeulich@suse.com" <JBeulich@suse.com>, "wl@xen.org"
	<wl@xen.org>
References: <20210611163627.4878-6-andrew.cooper3@citrix.com>
 <20210614104716.23405-1-andrew.cooper3@citrix.com>
 <3b9a4b575108a2043b2c61ade6f7389e3d6f7ad6.camel@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1.1 5/5] tests: Introduce a TSX test
Message-ID: <22439f3c-e41b-3fd4-7865-41d6821c443e@citrix.com>
Date: Mon, 14 Jun 2021 17:32:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3b9a4b575108a2043b2c61ade6f7389e3d6f7ad6.camel@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0366.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8d4fd4-1ce3-4d47-b1ea-08d92f520cf5
X-MS-TrafficTypeDiagnostic: BYAPR03MB4614:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46144D8EC83C0C5CF8C452C9BA319@BYAPR03MB4614.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8eE6Xms+nzZYtBP9+YGdT9CuPQgUxV5s5faJX0iFm4+U1l9q+QdRS8bOX/kiBM2K46xAqlw/l1+5Vuaa8E7Hf/+NulZ9L7WWDL5AVjYzWlCSuSC7vXndm0kYHL8Qan0xCvZLVzvAbAxAIl9spEpZFFKkoo0tmtNZ1Y+j1ZJv5dJBDhNRKr189lwocLCPUMHqC0Lmp7FNw2yQ9hus9l94XeFLlbBLibCQyIqyZ71k4JX+l6pu7bKr45zJhnaGYb6J2eryMyPkBpG/mttSRRBzw5fTR9Wfmx4o3S1mTbp6plyuVqQG6HGYNMI7QyqkKHIoLNob8xb5Nou8QtnmoVPZqOk4Kxm9b+cz+T1uIrYoO4NgCcxZZMgpOSRzrUQZ9HEBykYD4EYETthyH6GxfI/sHNMI2VioYfBPYsd8eVPD7K4OAz4acWWyFUyy7OmpamkxUG0VfXQhoTbcWXIFY/KrglyWg9HbK90c7DaeN8WJKc7RC34sFh1d17qHnYDjwDTlFSVE86cfBBtETr/v5VkbmTBcEOnVKeRYYYpAO9zDM5ADL3DqzTCpre9N/AxjwVaP6t/k+x48g27niSZ0GMPzbbK7QfHKHtDCdc64Gzh9jXIxYsofS8b7GQZgUAFJjPhqHb3E5PR48RuIgVWQ8DmrkS7QAaASG7XWfBqPWKKUKU24/oH51gdYpB5lftsWXT6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(4326008)(2906002)(5660300002)(8676002)(186003)(8936002)(6486002)(16526019)(83380400001)(110136005)(54906003)(26005)(31696002)(2616005)(956004)(38100700002)(31686004)(6666004)(53546011)(66476007)(66556008)(36756003)(478600001)(16576012)(66946007)(316002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBIVXlFeDRUMjR0WHA2ZE9LZEJYcFM2dUI0dWpvOVZyL0JCU1NPNklLOGFC?=
 =?utf-8?B?NzJJby9GaURtTEZVdTVMaXdVeWJvVVhKYkdYcnVnZkhtcElnM3p0ZzdjVit6?=
 =?utf-8?B?RDhSMzNWOHJMdE9QVjBrOVhnU1dTKzRLeHlQNlRVd2xLbnNVdlA3eTZzOUFm?=
 =?utf-8?B?Y3NDeXV0YzhFdU5HUWZHWVQ3QnF4SXB5dTZsNDQwQWlhRDNhZXFWTDFNMnR6?=
 =?utf-8?B?aEhpUHVjekpzY3h2d3BNQ2kxVCs0U3Ryc2pYMDN4UU9SeEhJNHFydkpDcTlr?=
 =?utf-8?B?YUJpc1NlM1RndVpZUXl4NDMwUVRLYVFKZVRTMXFMNTYyM2xrUVNUUGt5bVoy?=
 =?utf-8?B?bTNaZ1Vjd1NEbDVkeFJRL282ZzZUUjJhZHdzWTFnUnFIc01JbXAzZFBUWFk5?=
 =?utf-8?B?SUlRMmxvMjg3Q1ozMnlJdnJjeUJFTUNzM2xWaUZNMkxZWTJWZjZnSnUwSE5I?=
 =?utf-8?B?M2R4M2NLbGlWV0xHYytNclF5TzFxQk5GMUVWMHRsdEpsNnhMT25WamtSQTd4?=
 =?utf-8?B?UzVzbnNienAvZzBxRXV1eFB0MWpVc3ptcVZ1ZmRlM0pjYWxEUml2Rllqbi9C?=
 =?utf-8?B?a2txUHA1KzlsVmFScGZjT2JqOXBXMWVEdDFxWmVjZUR2OU5WN0F0MjdxaWlW?=
 =?utf-8?B?S2ZlUTg3Tm5xOHhFdzh0VlBoa0pJNTl6VmY3SWw0RTNDbElrVzdQdU1yaGpv?=
 =?utf-8?B?NldaQURBVkNTRUVRZEF6akllVm05Y1hNd2loNUtBeWdhUGdBZ3FCZ1VvbmRT?=
 =?utf-8?B?cG9uR2NKTG1HUHBLbEtGRmpZcmNmUWtCNDh4dkJqWiswMWNlQm5SMElQRmRL?=
 =?utf-8?B?eE1Nb3VoQ2hmc0RMQWN5aDBwQzlWVXBYRlZjTWFzckFTbU5XbTRZZkRXT3dR?=
 =?utf-8?B?K0FLS2JKaC9Sbll5UGd1N0JsNVFtaGNWT2ZTTE9HeGgzVHhTVnVTcGZ6cFRE?=
 =?utf-8?B?WVM4aDN1andLbFplalhZdkZScURETC9kTGRISjlidUZtZ2RZeFJsSTZRSjZR?=
 =?utf-8?B?eGozdFE4SXFad0QzeWdIaE1CaGpTSENESGE1SWRyM09odmdsb3hvMDlzWUgx?=
 =?utf-8?B?QXVRL0pxR0xGTENoRDJ2T2J2M25LbnVjelkrWUhPNWoyQ2tPTmlPNkQ5Zkdk?=
 =?utf-8?B?WVFkZFlIdkJaejhKWUUweVhCSFp6WDJSQmtjazIxU2MrUzVFcjJldHFSTWNR?=
 =?utf-8?B?UFJlQWtKZEQ3VXVvNm9WRGhxNlVWZlFVc1Jmd1RBQkxqSFZXT1VERC9XaENz?=
 =?utf-8?B?ZlBTRCtkcTR2TSs0VU4yYmlPdUVrWGpwaS91elIzWFpIdlRsWmVXZnI0azRQ?=
 =?utf-8?B?UWlsNmljbFlUNnhGV3FtcmNDRUltWExRRE9iYUVrVmsrZnRNYk1vU3c0dVVy?=
 =?utf-8?B?ZmVUald3T3ArUjBDZzFRYkU3K0ZkMk8zVVl3KzUrQzVxSWx2L2pBVG40bnpC?=
 =?utf-8?B?V3ZVMVB5VnM2UmIzWExuM0FJWW90cnl0Um5yUlk5b1NHMEM5RWMyM0VqVlQ1?=
 =?utf-8?B?UkNzN1NQdmJFN1A1QVh5Tm1ZNG1IcHo1QXJWTnJpVkkvbUJ6U2dzS1dYeFhn?=
 =?utf-8?B?TVQzOUJhUnVaU3BqVWVBNlNPdnBBQUd1cE1aa1RSeDJOZU5MSS82ZjEyT2Vu?=
 =?utf-8?B?a3UyTk1pdlUwRGRzSnM2U1JJLzJHcGV1OU9pOHh0UFBKSTdlUmsvNHdoZGt2?=
 =?utf-8?B?dWlWOFh3U3ZIYTN0SjZFWlNicVJKWnUrbGU4eDBOSENENkxVQTF2REliRFkv?=
 =?utf-8?Q?lJtI1KmevRLXQgenxsklWA0BzojR2bvOgebpUCm?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8d4fd4-1ce3-4d47-b1ea-08d92f520cf5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2021 16:32:50.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7SFPKzp6gxfI9yLMW3nPW1AOil58wlNGBZ5GUTRvdRjqV+rwVlrVrmQ6Afe3wbwHBfaDzcoOCOPmnF6AXwhX8tnZGlC/E6IDulTbp7A5/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4614
X-OriginatorOrg: citrix.com

On 14/06/2021 16:55, Edwin Torok wrote:
> On Mon, 2021-06-14 at 11:47 +0100, Andrew Cooper wrote:
>> +/*
>> + * Check all TSX MSRs, and in particular that their accessibility
>> matches what
>> + * is expressed in the host CPU policy.
>> + */
>> +static void test_tsx_msrs(void)
>> +{
>> +    printf("Testing MSR_TSX_FORCE_ABORT consistency\n");
>> +    test_tsx_msr_consistency(
>> +        MSR_TSX_FORCE_ABORT, host.cpuid.feat.tsx_force_abort);
>> +
>> +    printf("Testing MSR_TSX_CTRL consistency\n");
>> +    test_tsx_msr_consistency(
>> +        MSR_TSX_CTRL, host.msr.arch_caps.tsx_ctrl);
>> +}
>
> This is great, could we extend the test to all MSRs that Xen knows
> about and are expected to be identical? Particularly
> MSR_SPEC_CTRL, MSR_MCU_OPT_CTRL, and I see some MSRs used for errata
> workarounds like MSR_MCU_OPT_CTRL, possiblye more.

MSR_SPEC_CTRL, no.=C2=A0 It's value is influenced by the guest kernel in
context, and we would not expect it to be consistent across the system
at an arbitrary point in time.

MSR_MCU_OPT_CTRL might be a good candidate for a future change, but it's
not related to TSX.=C2=A0 (That said, it is actually how I spotted XSA-377)=
.

~Andrew


