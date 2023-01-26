Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D267C591
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 09:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484818.751639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxOV-0001zn-L9; Thu, 26 Jan 2023 08:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484818.751639; Thu, 26 Jan 2023 08:14:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKxOV-0001wQ-HX; Thu, 26 Jan 2023 08:14:03 +0000
Received: by outflank-mailman (input) for mailman id 484818;
 Thu, 26 Jan 2023 08:14:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKxOU-0001wK-CA
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 08:14:02 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2045.outbound.protection.outlook.com [40.107.8.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 637ed24a-9d51-11ed-91b6-6bf2151ebd3b;
 Thu, 26 Jan 2023 09:14:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by GV1PR04MB9133.eurprd04.prod.outlook.com (2603:10a6:150:24::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 08:13:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 08:13:57 +0000
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
X-Inumbo-ID: 637ed24a-9d51-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SH95VcRID7fFh6fkEqoMIHiNCo5lC3K8CqfOh5RM81/FmNVCMxXyeqAT9/OX0XR7zsOUkAJXeYnfGBfCM3ziTcDpIVaBNHC2rEAzNL7gXwlR850SFwjCWIsDEdqVYxTQdIwwHFkn5mN06R1M0/q2W4KEs1q+wp5TgsEuK3RPPwUOTllqUygESJj29klSu1vdKXH+CXY6n3bPBAcjUs1PGSZDzwEh1CA7uuX7pUgEO2zI1vEgzw4on9QrnKLM4KtaRhuCMAB7q6d4Syob7s/8pjUzRzWlgT8Px8toer8RY9EGLvlsucbFhEuNLHpRSSmAHRIdlNG7fdX9kzpOB6bd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d72iJKQhYowTECgr8vXItHRLRcBZNOVgJ+n71MAuwuk=;
 b=AL9MWgo5YsudVv5fUEITCjvxTndVFeGn5rBZU9aSzJi1u6SfReOcutCQ5Kg20NaB+3qTCGtxKlSZB0nmGoUtbWhrNwXcgdZsYVfNw8wyW2tyLPtKujzcFyFbV+70MsaYNilE5laZVB0E4e+n0M3zsUvVC5IwR69bZeoCdOLCSnH63x/FLn4oyVuPJDw4LYjsFkMhG4DjFJ+koUzHKL5Sm6NZ9p6zM3CkfaLoZRnFpkK6hifIeyC8kIQHpDenFTnoizxKcJYis8iSr6/HmVH0Q0PjB4H+s2y69R98WYWVFRqFCkoRD5YpKrgZgjOCyYLGJDUbuAKaIKYxWX1Pfxx7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d72iJKQhYowTECgr8vXItHRLRcBZNOVgJ+n71MAuwuk=;
 b=cvh7cdrVGlTiVTS1SD7ulbXlisQCqR4Ftyvb2nne+NCK+tnH7iJHcWdQx2UyD+4rmgMdFcjaAGfZRxX377//ewvLbrS6NjQy9L+JFNUWtFUbtXu2KDuOMB7/1vvUA8cn8+I36sKqK5XiduH+t+ixPzh86LlYDj5FdOWv9lBnlgqyLKVEVZRHAeZFSBuEfdvshEJ2Xq/9Z6Jk7bfSSfeidsn7/v7ryWp/cX3FEwjnqdV0ePQpr99U5O+DI0jfE1RQvu5jg/UnCRrISqQ9gStiq03+5GPcWmldfEcjuBujTyRvEtDyRPtk64Wpvx6WiXE73N7JMS1QhFdEcOQayLcVVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfffcf15-c2fa-6529-d1ff-a71a7571bfe2@suse.com>
Date: Thu, 26 Jan 2023 09:13:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 4/8] x86/mem-sharing: copy GADDR based shared guest
 areas
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <33cd2aba-73fc-6dfe-d0f2-f41883e7cdfa@suse.com>
 <dad36e4c-4529-6836-c50e-7c5febb8eea4@suse.com>
 <CABfawhmTe3Rxwo54gR5-4KGv=K0Ai7o9g6i=1nkb=XdES1CrcQ@mail.gmail.com>
 <a92b9714-5e29-146f-3b68-b44692c56de1@suse.com>
 <CABfawhkiaheQPJhtG7fupHcbfYPUy+BJgvbVoQ+FJUnev5bowQ@mail.gmail.com>
 <6099e6fb-0a3e-c6da-2766-d61c2c3d1e96@suse.com>
 <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawh=1XUWbeRJJZQsYVLyZX-Ez8=D2YYCgBYvDGQemHeJkzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|GV1PR04MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9a32f9-7407-4873-314e-08daff7545b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	giyhcqB5tgFIQT8EDmo+CL0M5Dlgw1drT7GEhPOicgcNMuRq9ADJIb65KK/VY9jpTt3BjOvxv7WAMnlBQph09reEdEXjJgDxOQ8lcmrRb6SN4j7eYlyuyo785kXnFpjwMR+Kwdn3uwVZhWTKbbZFAyeezmZlORbpBzPbEE0+6jUELRUK/BeXYvxWOAmee3nyxdqbGiR2qqz4JSfbzc+SD4e8mqM2PFCI/B9jrLiAG/B7AsZvhvSkucvoEy/8o9ZnKS7+Xy9Q67kZlXUnaDvY/CdXktkbvyI0mwLgIRLnwQX86jSLK4QmFYCzxEmsS/PO1g+aSPLssx3Csid9wK6cQKNV3nyiIClNSOfxR7H0f2jBLjGREOKzz24EYO2Jr+LaNWH2GLrPQ9MFO8GwOWUtEwyvmM6CaFb7DJhpPGdL9YyctDtzfK1zzUWrynGTZccO+ITErmgazNsgDpg6GBnq543srQs0mn8Yvx+bM3kqyZowfGTTfoTbomAOLnrnrs76X6l2phTAZl93ZwZlgsM+EaKYf+YHJzbf/5xb4SZLe8/ihkEEWF3JSF8bsu5wqGzbZXtk6tK3QUm41DlGUm+/YmFGOEv40r74veljVjIqtKk9jVvF9eaoJAE2x+P2FuuE+mIy/FpIPywDUwN5ThE3wcKYzdFMTKaQAsGrjADQQqE53Ou82AXsdO0yhC8lQf3bdtuTHHCDdt/Zc8V4hnFRt3svFTTpMwbYJ8F9nnv5LXQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199018)(2906002)(36756003)(38100700002)(26005)(53546011)(6506007)(186003)(6486002)(316002)(478600001)(6666004)(2616005)(83380400001)(8676002)(6916009)(66476007)(66946007)(4326008)(66556008)(86362001)(8936002)(41300700001)(6512007)(5660300002)(54906003)(31696002)(31686004)(66899018)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEhFTTRuYUF0bklkdHM2SlVaWG1hNEVQK1VHbHBtNVlRUkxLTmZDbEVaVUFz?=
 =?utf-8?B?eWJZN0dFdEtXQ25EazdzSmoxaGNGay95cjlIa0VnZXJpd3JVSFZPT05kdzVz?=
 =?utf-8?B?UUJJYXJob05qdGhjZHEwN3dFUzg2dFAwWVJPamoyMzNIMHBTTWdpZlB4T0ts?=
 =?utf-8?B?aXJIRXFLem40Z3V4VFpYeW5lMVU3NEFVQzhlQnpRYnVyQ0FxUDdZeUI1NHpC?=
 =?utf-8?B?OTdhYlAvN004TVBzeDVCRktxS3NzblhGYys3WTA4dGpjY2hQOWxaTCtlSzla?=
 =?utf-8?B?Y09ORTkxVGhVMFl2VWFTRjdnTE9EWFpJZjZpa2pWVmM5dlFDZTJ1OFoxUnNl?=
 =?utf-8?B?KzBtR1YvRzB4S1FHczBYcytKMnFibUJkM21kaHE1TXo0OEc2RWFnQzh5VlQy?=
 =?utf-8?B?WHBVZWtIN29NbnZ2dDRIZjExdkI1cTRHeE0zb3FEUC9BTVpXQlViNmFBYkpS?=
 =?utf-8?B?V3J6eFluMDAzWTcvWW5LQjBQcE4zNER4bFVqUUVtSlV1YnFuSW9MUjRoMnFh?=
 =?utf-8?B?Umd2NWIzQ2FBU2JOamcvamtPbThyUElqS3hmeDQwMmllWlROT1lMZ0JLT0Vs?=
 =?utf-8?B?cTlaeHVBYjMvY2k5aVFBMEVpUE05NnZrVFJDNTUvSEFKQXlOQTM4dm1YMVJJ?=
 =?utf-8?B?WmZYd2JJbmg4Vk94cVliM2NYSmNlREtIRkl5cG1IUkhJWDBlQ2RuVU5aajBy?=
 =?utf-8?B?eE9uSXRzcFJLSlp3SFdFY29JYWZWS1lFWDcxT3JDWUIrbGhSMENSZk1wQTRF?=
 =?utf-8?B?U1ZQZ25hTER3RThFaFY0aEgrTGh5aWtkQVlJNmVxQ0VuQXZHdkhGSXNZZytS?=
 =?utf-8?B?SHJRK0RlTlp6Mkg2Tmh6MnhVQlZTenQzaTJFU21VVDN6V0Eyd2EwNFhCdkdw?=
 =?utf-8?B?ZmRmZWhkdG0rVnJSM1Q1cEV5Tk1KWTJlRXp6M1Z4RklOYjRVaWJOYlh2RFdu?=
 =?utf-8?B?YVNXeE9jUlpUM1dhY3I5TmMxSVBLUC9YaGRnTnpBUmZJRjdHeHg2MmY3K2R1?=
 =?utf-8?B?RDFldlVKcDR3K0xRTHRMZ2t0Y3lIYU5OVTJBZ3U3ZW4zcGZYY0RnY2RlVnJQ?=
 =?utf-8?B?bFNvdkpCeWZHVmh2WmNyVnJQcFRoOEhIRmdsNzAyUVFzK215MUpJajgzQklJ?=
 =?utf-8?B?TzhrTmJ5SXBIN1kyMXRJRTNnd3djaWhnb3QzZjZObnZiWi9DRDd1NG54QjFi?=
 =?utf-8?B?S3BPSGd4TnVXcFdZamRvd05tMGxwNWRKZkN1NTk5dXBsU0FadExreTFYb2N3?=
 =?utf-8?B?c3BSTTU2cGo0RVIrUlFqQ2h0aUVHZXpQVnJMNko5QlJQMTZ6SEM1RW84RnlB?=
 =?utf-8?B?TmZrVVdWMTVJNlY3K3Ayck5qdWlpdlVPMWRQWVhkTUwxeTJWaHNzUFM0bUhy?=
 =?utf-8?B?VmlWc3h4YWhqQlU3VkIwa3VucHRwT1AyOER6dlAvUjAvNmpyU2NsTmhiVDVr?=
 =?utf-8?B?Z3lYSEpUYXphcWw0TGRvaHZUaW5hRkNtL3J1MmdWVkRsQXp1UHJJd0twMXlJ?=
 =?utf-8?B?UUlmbzJmd09OamVxZU1UdGpoQUZwUjFBMWcvd2twRXM4eWhGZzVOUVRZTE45?=
 =?utf-8?B?ZmJSOSs4TE9XSjg5Z3Z1aGFpUlJuSXM0aVV4MVhoMDZzUnVXSFd1R20rWXpU?=
 =?utf-8?B?TWZlWlpBYUloREN2WFdIdFlWTDRleHh3Q1hLcWFpWTZyWWdldUdQMjB5Vjg1?=
 =?utf-8?B?b2pCaFZnUWdvUE5GRzRORnpSTEtIeksxbmFKWm8xbDlHUmg0MmRlaE5wc2Nj?=
 =?utf-8?B?WjA4Y2U4d2xJSE9JZ2t0ejlldjJ0V0lJV2NpZVBvZUVwVExFc0FaTHp5SUdL?=
 =?utf-8?B?SjhMVGZLSXgzKzA5azl3clhPMTczcWxnYmxiblhoN0NtUk1aV3R1QjBTRDZ6?=
 =?utf-8?B?ZnIyQTN1c0JzWFRRUFRRNkZwQWZNMmJmUzhaKzE1b3oxMHkzbTBobEFpRjhs?=
 =?utf-8?B?YjF6ZU5ZOWt2bFMzYlpnYTA3bVBUYUgvNUl6Y1k2Ty9uSjRkUEF6ekc3aFFv?=
 =?utf-8?B?eXVJcmVHWDFqeDIvZzR6emZCQkdWZmlOQzNCaURkOVJHNnNFTS9EVUdZRFR2?=
 =?utf-8?B?Wnh5YUhVZGtJTkFiS0FZUll4TVR6eHVMY0QvOXNwUDFSNCs4WFhOU285ZjU3?=
 =?utf-8?Q?JCG+YduTrQTqQ09mt52AVWBVt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9a32f9-7407-4873-314e-08daff7545b4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 08:13:57.4071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOLD5xKDf7IugIIDHBQRsOjNx0ZxTXw7ADWUDhzHEueyrPtPXnrf/FiKVPxjXGySQ6wSB3vT7AIcnMrsk5NZbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9133

On 25.01.2023 16:34, Tamas K Lengyel wrote:
> On Tue, Jan 24, 2023 at 6:19 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 23.01.2023 19:32, Tamas K Lengyel wrote:
>>> On Mon, Jan 23, 2023 at 11:24 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 23.01.2023 17:09, Tamas K Lengyel wrote:
>>>>> On Mon, Jan 23, 2023 at 9:55 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>>>> @@ -1653,6 +1653,65 @@ static void copy_vcpu_nonreg_state(struc
>>>>>>      hvm_set_nonreg_state(cd_vcpu, &nrs);
>>>>>>  }
>>>>>>
>>>>>> +static int copy_guest_area(struct guest_area *cd_area,
>>>>>> +                           const struct guest_area *d_area,
>>>>>> +                           struct vcpu *cd_vcpu,
>>>>>> +                           const struct domain *d)
>>>>>> +{
>>>>>> +    mfn_t d_mfn, cd_mfn;
>>>>>> +
>>>>>> +    if ( !d_area->pg )
>>>>>> +        return 0;
>>>>>> +
>>>>>> +    d_mfn = page_to_mfn(d_area->pg);
>>>>>> +
>>>>>> +    /* Allocate & map a page for the area if it hasn't been already.
>>> */
>>>>>> +    if ( !cd_area->pg )
>>>>>> +    {
>>>>>> +        gfn_t gfn = mfn_to_gfn(d, d_mfn);
>>>>>> +        struct p2m_domain *p2m = p2m_get_hostp2m(cd_vcpu->domain);
>>>>>> +        p2m_type_t p2mt;
>>>>>> +        p2m_access_t p2ma;
>>>>>> +        unsigned int offset;
>>>>>> +        int ret;
>>>>>> +
>>>>>> +        cd_mfn = p2m->get_entry(p2m, gfn, &p2mt, &p2ma, 0, NULL,
>>> NULL);
>>>>>> +        if ( mfn_eq(cd_mfn, INVALID_MFN) )
>>>>>> +        {
>>>>>> +            struct page_info *pg =
> alloc_domheap_page(cd_vcpu->domain,
>>>>> 0);
>>>>>> +
>>>>>> +            if ( !pg )
>>>>>> +                return -ENOMEM;
>>>>>> +
>>>>>> +            cd_mfn = page_to_mfn(pg);
>>>>>> +            set_gpfn_from_mfn(mfn_x(cd_mfn), gfn_x(gfn));
>>>>>> +
>>>>>> +            ret = p2m->set_entry(p2m, gfn, cd_mfn, PAGE_ORDER_4K,
>>>>> p2m_ram_rw,
>>>>>> +                                 p2m->default_access, -1);
>>>>>> +            if ( ret )
>>>>>> +                return ret;
>>>>>> +        }
>>>>>> +        else if ( p2mt != p2m_ram_rw )
>>>>>> +            return -EBUSY;
>>>>>> +
>>>>>> +        /*
>>>>>> +         * Simply specify the entire range up to the end of the
> page.
>>>>> All the
>>>>>> +         * function uses it for is a check for not crossing page
>>>>> boundaries.
>>>>>> +         */
>>>>>> +        offset = PAGE_OFFSET(d_area->map);
>>>>>> +        ret = map_guest_area(cd_vcpu, gfn_to_gaddr(gfn) + offset,
>>>>>> +                             PAGE_SIZE - offset, cd_area, NULL);
>>>>>> +        if ( ret )
>>>>>> +            return ret;
>>>>>> +    }
>>>>>> +    else
>>>>>> +        cd_mfn = page_to_mfn(cd_area->pg);
>>>>>
>>>>> Everything to this point seems to be non mem-sharing/forking related.
>>> Could
>>>>> these live somewhere else? There must be some other place where
>>> allocating
>>>>> these areas happens already for non-fork VMs so it would make sense to
>>> just
>>>>> refactor that code to be callable from here.
>>>>
>>>> It is the "copy" aspect with makes this mem-sharing (or really fork)
>>>> specific. Plus in the end this is no different from what you have
>>>> there right now for copying the vCPU info area. In the final patch
>>>> that other code gets removed by re-using the code here.
>>>
>>> Yes, the copy part is fork-specific. Arguably if there was a way to do
> the
>>> allocation of the page for vcpu_info I would prefer that being
> elsewhere,
>>> but while the only requirement is allocate-page and copy from parent
> I'm OK
>>> with that logic being in here because it's really straight forward. But
> now
>>> you also do extra sanity checks here which are harder to comprehend in
> this
>>> context alone.
>>
>> What sanity checks are you talking about (also below, where you claim
>> map_guest_area() would be used only to sanity check)?
> 
> Did I misread your comment above "All the function uses it for is a check
> for not crossing page boundaries"? That sounds to me like a simple sanity
> check, unclear why it matters though and why only for forks.

The comment is about the function's use of the range it is being passed.
It doesn't say in any way that the function is doing only sanity checking.
If the comment wording is ambiguous or unclear, I'm happy to take
improvement suggestions.

>>> What if extra sanity checks will be needed in the future? Or
>>> the sanity checks in the future diverge from where this happens for
> normal
>>> VMs because someone overlooks this needing to be synched here too?
>>>
>>>> I also haven't been able to spot anything that could be factored
>>>> out (and one might expect that if there was something, then the vCPU
>>>> info area copying should also already have used it). map_guest_area()
>>>> is all that is used for other purposes as well.
>>>
>>> Well, there must be a location where all this happens for normal VMs as
>>> well, no?
>>
>> That's map_guest_area(). What is needed here but not elsewhere is the
>> populating of the GFN underlying the to-be-mapped area. That's the code
>> being added here, mirroring what you need to do for the vCPU info page.
>> Similar code isn't needed elsewhere because the guest invoked operation
>> is purely a "map" - the underlying pages are already expected to be
>> populated (which of course we check, or else we wouldn't know what page
>> to actually map).
> 
> Populated by what and when?

Population happens either at domain creation or when the guest is moving
pages around (e.g. during ballooning). What is happening here (also in
the pre-existing code to deal with the vCPU info page) is the minimal
amount of "populate at creation" to meet the prereq for the mapping
operation(s).

>>> Why not factor that code so that it can be called from here, so
>>> that we don't have to track sanity check requirements in two different
>>> locations? Or for normal VMs that sanity checking bit isn't required? If
>>> so, why?
>>
>> As per above, I'm afraid that I'm lost with these questions. I simply
>> don't know what you're talking about.
> 
> You are adding code here that allocates memory and copies the content of
> similarly allocated memory from the parent. You perform extra sanity checks
> for unknown reasons that seem to be only needed here. It is unclear why you
> are doing that and why can't the same code-paths that allocate this memory
> for the parent be simply reused so the only thing left to do here would be
> to copy the content from the parent?

No, I'm not "adding code" in the sense that I read your comments so far.
Such code was already there (and, as pointed out somewhere, in slightly
broken form). Yes, I'm introducing a 2nd instance of this, but just to
then (in the last patch) remove the original (slightly broken) instance.
So across the entire series this is merely code movement (with
adjustments).

Jan

