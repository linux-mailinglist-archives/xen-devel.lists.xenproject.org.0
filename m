Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3036653CA9
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 08:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468254.727310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GMG-0001Rk-Sj; Thu, 22 Dec 2022 07:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468254.727310; Thu, 22 Dec 2022 07:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8GMG-0001Ow-P9; Thu, 22 Dec 2022 07:51:16 +0000
Received: by outflank-mailman (input) for mailman id 468254;
 Thu, 22 Dec 2022 07:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8GME-0001Oq-Uc
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 07:51:15 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2075.outbound.protection.outlook.com [40.107.8.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 681398fd-81cd-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 08:51:13 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8543.eurprd04.prod.outlook.com (2603:10a6:102:216::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 07:51:11 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 07:51:11 +0000
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
X-Inumbo-ID: 681398fd-81cd-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TZ87u3BS+jcVe8Ez7FnZt68eF1WeAZzWbRwJGP8HicYoWMXEBvnCwy5LPC+ZUboxkLhi+Nzff7wew69JvAHFjA31hucX7RAIfscmo2ksSMC4lG1HAR/l1WvD+0B5oD+f9eepx3YTmFBso/ghCtuMkrjzT2LKdJ1jb9ac6KQjBYLrut70BOh1UOawGx/WUVTuhMa8Ol7OexJv3nW7ZRgy9v82mnD6nciR9jfPhiInSFKHkhdTgsTutlqisq1tuLItH/fk3WjH/Y38mFbX7TvZbdcmc3wQsSd7yAXT6zKmmlZW+Ixj0dhRbejDFNCiDtw/Ul6T1JUdUnotkAzm6YvCTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBK/7aIhNkhuSvmotKbl0FJ+DCMmPzTTwe+v/6N+nYc=;
 b=jrSBhB/HSNCjnzJXoo4Cjyol59yOTIqoAWmBYlGqg8g+8Yh144cT3bk4V+78HOLD9OSMyShCTqjF601xISuAlYAy3X9ieHgfUk9uUCxh9SMmSr4YjRwZ764inIJ1wwtunnkUA7haadoW45m+JRs1G+gYqD+MOW9gqEOPVVmgj7QKJYX7SpOLNuetz/O4LfLtmos2IIHL02kwjQMkn+eJTRoSqGoR1dqZkPuH8e+zHgHg5HT/nPI6g+jqEA6EnkAil1HKsXO5bdRZ8zj3PQNkMcloToYPoFr3KqRzBkT/6X0bseQo84HyLmGxOQr8OTEW8C0Ek8z44A6Kgr8dG/Py8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBK/7aIhNkhuSvmotKbl0FJ+DCMmPzTTwe+v/6N+nYc=;
 b=ePAZ8J+lPZ2OdSk7ZY5M3aM9A+S8MHUy2Z0tqffyM4EDeEQiZ2d+uuhlnxvCY2VGnPDJ1Dw8RQBAmPZsvcN5+2RIDg8UT3jlHVdjppX9oxPfnt20KklhV2CojYXURIhNRteVksPv5IoRLsX2HftlK8yEOv2o3x25XES1hxgRhwuqR6GAV+tIZc3vBPRuHtRDX+Cwxb9sdyyXlUO/ToPnEGFNgp8iEAiy2N2huMHL/y8yZl/mwIWcs7xcm5cd/3ILhboNCNtw77WChbvxAjGWYgolDZXDltKydkvr5hEN3sa6OAd2JI2WZ0YCwnkRwq3a/gT/srKsqquo9lzLSretvA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <780eb542-34b9-c64f-0a40-acc462b87c72@suse.com>
Date: Thu, 22 Dec 2022 08:51:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/8] x86/paging: fold most HAP and shadow final teardown
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, "Tim (Xen.org)" <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7d2c856-bf75-503b-ad96-02d25c63a2f6@suse.com>
 <8d519e00-83c6-aee9-e7ba-523aa4265e1e@suse.com>
 <af33fef0-46f7-b206-53ed-33d66f0f008c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <af33fef0-46f7-b206-53ed-33d66f0f008c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: a07eae4d-a893-4b21-5229-08dae3f14b01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OnQMSOAWH+piCzVQxsBJz+0RZt8UH4afWD4TWTvLE6WvAaCGsZZEUmEmhT1nqLdrRpa8lK8Du3rwpOP6465L29rX4kp6bMYTHCBCmL20wJISvcbS0ySJdEs8uHWo42Qq9VXhqIcI1au4wlafjKMLtXD1znL1bKNsD4iRn9Xh5vXaY9HJFjmCVjrL+l116pDGaW6VlXstRmxG9sKh1sAdhib9wN1GjGcwAcWGTN1he1q4hgNSG3HJQCVOmgbsUgFXvepYtwOY8cxM7jI0cmzrHv6TiT5VriZebi78lw49xpQv7zbSo7bM+gaLgQKVliOMB51g62uck9aOAALITMj9J1uQOasoIFyjbb2IFz1ELp04EMf/gKN5jTgouaLp/GMygOqfoQCLmooI7+8e5FrKMIgUhKEsdN4yY6UnjOiWOji3XLr14qE2aM5gIhmyXZjJryn8i4r0tNR23+Q36ln6EqUmYsM7TUOTlydBYPn4lgXqVP0PGqaREQVOA0V8durQ+TZIpx6d0y0+Lm1vb6QGo5MnIRMj3c5EzrASn+bfMyV2a+1VJArlq2AYCH8avt4mIZCjgzRTdgyh7lC0rADRDtqCR/FWEa3oy0hgdYXKdwbt/l/8oRAjtwhj9RqBxXmn6RUPQL9j3rhILH4oTg0g0+7PAH6nK6ouZQxE7gYkdj+eCPTeufSjD5Ayzrtw/Qy5qsMdbATvxInB8UBZlMDPkBKSvTESJ+v5NzuKa5NcUr8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(136003)(346002)(39860400002)(451199015)(41300700001)(66476007)(66556008)(31686004)(53546011)(8676002)(5660300002)(66946007)(4326008)(6506007)(8936002)(6916009)(316002)(2906002)(86362001)(54906003)(36756003)(6512007)(31696002)(26005)(38100700002)(478600001)(2616005)(186003)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDMrcTh3WnRaVng0RFJDOTBlTVM0eGNLbU5PN0Z2UjV1bEFzL09Yd00waHFT?=
 =?utf-8?B?WUR4ZzdBcGVndExnSDM5eVVyY0xmazVKQTJYSlRxZzVtWjBocU1iL0FRckZC?=
 =?utf-8?B?dW12akxBOVpyWGtUU29qalpPR0VpR3dxV21XMjlEbEFFVWZnOXRBVjRCZURD?=
 =?utf-8?B?RTA3Z1dPQi92MkdkMzdxUkhoMmQrU21sNEpDbXg3Y0tKR1A5eTAyM2dsQXY2?=
 =?utf-8?B?K2p1QUYrMGwxU2w0WXowNURrSjJnTEZVN0pqbzViTkRqMHluUWpnSThsZ0g1?=
 =?utf-8?B?U250dko1M3lCNzE5RjZzUDgwNnI0ekxrSzVNdVNUdXQ4K3Y0WGZjclJ4bmlz?=
 =?utf-8?B?VVkvMlEwVVJZVGlyekpVTGphcVowVys3OW5WeXFza292QVhyTFR1T2FXcHN6?=
 =?utf-8?B?MGNoMThoVURKWGtiTmQxY3M1SmRMOTdNWXhZc0RRbFFQcGdIemJJZ0NCL3pu?=
 =?utf-8?B?TkR1cUlIMTJqejRSbHpRUkdsdGxFZ05NWlZOZndTNFhKcmd4dVp5Rk1lQnBI?=
 =?utf-8?B?RHQzblJWL2NFWW5pMkJ3ZnI5QndzZEdxMU5xMWYzUG1LWWZWUFdzWDRMYWxz?=
 =?utf-8?B?ODNoUlhMSk9ZazFMM2s3STFnM3J5UjhySk9hckliNlY5ZHc5ZlM3TU0vOHBM?=
 =?utf-8?B?L005Q3pHVnUwZXhWSmxZOURJUkFBdVJZWTBzSlhRM2k1MlIxZmljSFh4ZDd3?=
 =?utf-8?B?M20vTEVuVCtmWkNERVJkMnorWFlleFdjM1dGSUhBeGpwcGZoRTZsZUVFT1Ev?=
 =?utf-8?B?WXlGRXJrVExHUm9CbnBrclYvUkp3aWZLVlZobFh5eWZlWXE4UFQzZ25POFp0?=
 =?utf-8?B?V0lja01mdUpBWmlXcXN2SXBmQWhYU3Y0Y3Q4dEJDUG5LKytRYnZsSUt1L05q?=
 =?utf-8?B?N2J1TTFqNktCZmlhczJXNW50YkVmMnZiOXRvSVNMeU5XSlF6QVNMN0VRRHNK?=
 =?utf-8?B?R1BNRG1XeVdmaGNiT0hBeS8renE0M0pPSm9uWDlKSmZRaldndDNqbmphbXhO?=
 =?utf-8?B?aDVyQnVHdHRscVhDc1ZKMXhHNHRLUWJDT0UrRi9pL0plT3czVXVZQm5lYi9J?=
 =?utf-8?B?SjBhSHNwWjRET2ZMNVNEbFNyS3A3R2ZQTWJGaUVQY2Q1cjhJaXQvSHkyUW5L?=
 =?utf-8?B?dS8vTFJLS3Q2YlZNa0lmUmhoKzFIaWlKa2RoMkpEQjl3QVVhQTk5LzJja3V0?=
 =?utf-8?B?MUwwemtORFFHSGtFUlVSU0I5MmxBdXl0aEkxRmtoSWx5Um1aZHhROEMyTkdl?=
 =?utf-8?B?RDFscDlpVVFxSEx2YkZRRDZaSUQwckgweS83WTBUZVd5NWhQOG0xWTRMMHU4?=
 =?utf-8?B?MzFkSjQvczZHeERtcGZXVk12ZHJSbDZwYUsrM2JnQWcwV0J6ZUxpbWpYQkNR?=
 =?utf-8?B?RGIvaWFRSW5VRnA2d2h4RkJXeTVtU2IrV3hQdVhUNHVyU3ovb21RdGpkTE83?=
 =?utf-8?B?citUV0FDSkw0SzZZRlhaaUthTUhDeHI1N3RscHJDRnprZktIVGF0V0p4VE8v?=
 =?utf-8?B?QW9FYXF0MFU2RmZOUGs2VmJBSEVFa1ViYWZiMnRxRzJ3Nk5TL3BaY3lzMS9D?=
 =?utf-8?B?ZllNWVZycU1NbnNMN1J6LzZWODd2WXZjY1B1RGhDL2lubjNvTE9BQmV2Rnoz?=
 =?utf-8?B?UDVtYTlJR2pIWFhLWGdJNU15RlN5NENTR0lpQ2g2OGx2aVdmN3ZKWEJoNzhU?=
 =?utf-8?B?L3Q0T2Y4MHJZLzRNQWRwUWZ1bitYMThIbWJkK0FtYnc5aG1jVzhac3RZN0U5?=
 =?utf-8?B?LzVOd1A5M2ZYNGJSTVUwNDU0QWpJV1VpVXhOWGM3bDZid2haNVE3dFVvQXpT?=
 =?utf-8?B?eERUZXl2SjlXQ2xkUjhwSlc4M0JONDNRVnlMaSsvQVE2dEFmdTRQUWo4UUcx?=
 =?utf-8?B?b1grUUptUkVzeHlTK0dQVjBDcjFSSlZjeTVFUThPdGpCOU1RQys0TUFWWHJ6?=
 =?utf-8?B?clpSemM5RjVVU3c0d2FJVnR4RThDUjFablloTThQRzRtQ3Q1N1FwVUdjb2RU?=
 =?utf-8?B?QzVBNW1MdGR6WFVlL2NkTTU0OHRtOEdueFdlVjVsdm9ZRERoOURRNm1VSkEx?=
 =?utf-8?B?TFVsN3JtZVVvQm15c0hadlkrSlhYeUE0NzlLWjZOMzNmNHllazk4TmtnOU42?=
 =?utf-8?Q?IyLoroWAMcwPq7qqRfpNaAH9M?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07eae4d-a893-4b21-5229-08dae3f14b01
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 07:51:11.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtCCAoW2Io9nkkRaVcRmccxrH5zAMJJLn/8DoJHIsNTcw9tbtP7t0XiAXm37Hk0Mt9IOhx6u9niurO85xiYy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8543

On 21.12.2022 18:16, Andrew Cooper wrote:
> On 21/12/2022 1:25 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm/paging.c
>> +++ b/xen/arch/x86/mm/paging.c
>> @@ -842,10 +842,46 @@ int paging_teardown(struct domain *d)
>>  /* Call once all of the references to the domain have gone away */
>>  void paging_final_teardown(struct domain *d)
>>  {
>> -    if ( hap_enabled(d) )
>> +    bool hap = hap_enabled(d);
>> +
>> +    PAGING_PRINTK("%pd final teardown starts.  Pages total = %u, free = %u, p2m = %u\n",
> 
> PAGING_PRINTK() already includes __func__, so just "%pd start: total %u,
> free %u, p2m %u\n" which is shorter.

Hmm, yes, can do.

>> +                  d, d->arch.paging.total_pages,
>> +                  d->arch.paging.free_pages, d->arch.paging.p2m_pages);
>> +
>> +    if ( hap )
>>          hap_final_teardown(d);
>> +
>> +    /*
>> +     * Double-check that the domain didn't have any paging memory.
>> +     * It is possible for a domain that never got domain_kill()ed
>> +     * to get here with its paging allocation intact.
> 
> I know you're mostly just moving this comment, but it's misleading.
> 
> This path is used for the domain_create() error path, and there will be
> a nonzero allocation for HVM guests.
> 
> I think we do want to rework this eventually - we will simplify things
> massively by splitting the things can can only happen for a domain which
> has run into relinquish_resources.
> 
> At a minimum, I'd suggest dropping the first sentence.  "double check"
> implies it's an extraordinary case, which isn't warranted here IMO.

Instead of dropping I think I would prefer to make it start "Make sure
...".

>> +     */
>> +    if ( d->arch.paging.total_pages )
>> +    {
>> +        if ( hap )
>> +            hap_teardown(d, NULL);
>> +        else
>> +            shadow_teardown(d, NULL);
>> +    }
>> +
>> +    /* It is now safe to pull down the p2m map. */
>> +    p2m_teardown(p2m_get_hostp2m(d), true, NULL);
>> +
>> +    /* Free any paging memory that the p2m teardown released. */
> 
> I don't think this isn't true any more.  410 also made HAP/shadow free
> pages fully for a dying domain, so p2m_teardown() at this point won't
> add to the free memory pool.
> 
> I think the subsequent *_set_allocation() can be dropped, and the
> assertions left.

I agree, but if anything this will want to be a separate patch then.

Jan

