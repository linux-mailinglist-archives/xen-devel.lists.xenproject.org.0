Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BE4CCEFA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 08:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283969.483085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2HR-0007jC-64; Fri, 04 Mar 2022 07:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283969.483085; Fri, 04 Mar 2022 07:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ2HR-0007hL-2v; Fri, 04 Mar 2022 07:23:13 +0000
Received: by outflank-mailman (input) for mailman id 283969;
 Fri, 04 Mar 2022 07:23:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nQ2HQ-0007hE-BB
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 07:23:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2198876-9b8b-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 08:23:10 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2051.outbound.protection.outlook.com [104.47.8.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-xanM2N8VPdCwo8-Tr2emRQ-1; Fri, 04 Mar 2022 08:23:09 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6296.eurprd04.prod.outlook.com (2603:10a6:20b:b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Fri, 4 Mar
 2022 07:23:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.017; Fri, 4 Mar 2022
 07:23:07 +0000
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
X-Inumbo-ID: f2198876-9b8b-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646378590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62xcxUc4w+30iYjWp36YDlow73h/33prvah3JI0xBSQ=;
	b=Q+jM51kXNMgLzWzK6KjayBY8+ha2JYINzGl3XCdBTTUtDwORSPV6kF/RyifjroV775UQEI
	UcOtLZA6QJqpTyFu7aF2ISjXWwFmvfoUd22YI0f1apLkCFcdnjlQ4MDDoUcS3BPGC5M2Wy
	kiGW+MzPiLHSp1MK/P0mTts/RqeBAgU=
X-MC-Unique: xanM2N8VPdCwo8-Tr2emRQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jth0Um6UxX6n8tRx/gCjlwFYapZbZJ8aLXwAMNxhz1P76w3H7Hl2Uq8ai1i8lmm+70RHi2UC1agXwhOQkqK9q44bpbOqm1kc4OlnQUP2nMCIkh2Jek9kGClit/6n4e2OlfCS8lTYQKhF/Dcdn+DAlGXpHEncJzx8iiUyqp6WbDdZvsq1wSzoBf3blhQwLY9dIdLxnCRviMXchx+AWxKjnIyUVKih6GFAYRi3gDegb7FnFVkd5fQgQaXLuHAAigMUjlQiy7cKdt+qoMembkz/uhBQr1+aV+tsTvxlzZkV0/g+uTkEx4Ya+Y1hcHk8P4Ye5PEpDWY+1ODYlPM4S9/IRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62xcxUc4w+30iYjWp36YDlow73h/33prvah3JI0xBSQ=;
 b=br7r+DgqB4lMP/Zz45tIAMKWKa0f/98Vrh0RZlQQ1DjECFVmQcO2cGtn1XjUnoYC2cUZryiKB71y5Umx1rHi0N7xo+EO1kpCstsi0WcMc/NiN7jcIVBMAvgaqadFFfBUzFkOSd8D4dO0yYe8XcqtbInPWzqrjZ0psFD4skGD5nh6ACxA8qA4NndTdtX+SysAtXA5ES5/5eC66JfQoJEKDluITMp76Mo10xfkhQsooSm7AlDDSb3K9lIHwmceifhO8jVLwf8ZEw9370hToShA0VYYQl5v2pOTuRCQqLFvsqrq3ta3VCJFhK5hFvO5xSfOa6cqRC8r4dKZy1Ae3Jd+/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <175a55cc-70b4-4832-9a78-0db57a9ae4a4@suse.com>
Date: Fri, 4 Mar 2022 08:23:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 1/3] xen/vpci: msix: move x86 specific code to x86 file
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
 <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
 <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <41F03A07-F8D6-423D-9E40-F4B89C611C87@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0372.eurprd06.prod.outlook.com
 (2603:10a6:20b:460::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 912c8b74-c6b4-4f23-ec46-08d9fdafd47f
X-MS-TrafficTypeDiagnostic: AM6PR04MB6296:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB62968CAF728B466F037E97E7B3059@AM6PR04MB6296.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LP5tffhteh7looCCngw5BeZbAYSZrFDIKowndRkX85VZXf/OHw2zvFNpBqr7olis6W6FsYNhNq8TYSeOsO3f4zzwHd1gltYLEIzRp7XbTR9ogO5TRA1hF681s6taWCXhV8OtS33O5Vy+agZG+ANOXKdZixjzv4v1l9Q6bKBKtbo7OIhZ4rBso/jR+E2NGw86/KYkY5HfPic9EgTm7KGZHB2Uv3WcDg3rpTVyIfLalYw//xMi8m++rs3ALvl7S7brHYgCefkSt2t791EN9M3tmikTIgYi7SMkUurnXrLdBwk+31pa1WIYR6OSutRMh189reyKKfwBgwllQtZQsL1tHQZo3lX7QMu+8//yda4Tv8CbU++x8AwlnjfOFTSHb/Rb9ODETh5lc8N/cpqsitItyebsIU1STuN6L8bmarwIcBtRC0LMuRbowvV96BjSCGCzqSVWeQA1cE+DKNUGBobFRcH1h+Oal47AV/JTm5UNT9scDwgud4Zd4S3ML0JCuLV0QPuufERBM6Os3DoZO8AF4ekldQSu6WQvkwNmNZDrb9ZJkB8KD0c/ZSw19dc7XAuODeXxi6NiS726xTPakydeo3+v9whxwAuj1l2OfSum7qYLayec9CQsq1N4usbPJLzg8BpoSUjqFoAmYk60gPg48N56HSV0PQX3Q3odQtaQr6B/unGJIs6pDhNpicn8+XIMQocjv7iVmLSH/Guk26Rf2Dh50MmoVzNpUhAer728lM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(8936002)(5660300002)(38100700002)(6512007)(31696002)(6486002)(6916009)(54906003)(316002)(86362001)(66476007)(66556008)(66946007)(8676002)(4326008)(508600001)(83380400001)(26005)(186003)(36756003)(31686004)(2616005)(7416002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZElkQnY5T1E4d3JvQm0rYWo2TmI3ZnY2YVA4WEhkdit2YUZKa2NKRGxjUFZQ?=
 =?utf-8?B?S29YYzhCUXM4N1o2ZkcxWFpOc1MvSzBqVVMzdGtiS0dxOHFpOHJacWxqZTY5?=
 =?utf-8?B?bVpTMTNuTlJxZDJZWEMxVytoT0JPdFB5bHRSZmlFcUdhK3Y4ZkFBS0VXbUM0?=
 =?utf-8?B?eFlOT0JaWWVURkNzMlBaaFFXajdVRnFia0EyalNPUG4wek8ra0tRU1BZbEh0?=
 =?utf-8?B?QUpSZFM3S2ZzdkkxdHdnRjFyL09hYTBRZmRqZFdkdXpGSHZIdVJkREk3K3h4?=
 =?utf-8?B?THE1WXJWRmk1M0s4eXJWNlNPWmFhZkEzVGp6Y3ZZcDViR1VDWEIwM2hHV2pl?=
 =?utf-8?B?ZmVRdTRObHo1bXpTMEhpbWFHaXpJSjBMK1RRZEovaTBBUUZTSDUySG1VZDhN?=
 =?utf-8?B?Wk15emFqN0I2b2p5c1ljSCtrZ1RnQmVjMUhiejJzZjRDekVwanFPZ25pYjR0?=
 =?utf-8?B?OEYxSG11aXk0RFNzVzJSQnhSSnpWNGFtc1M3ck5tcnlsUE5qL0dOSU01cGJk?=
 =?utf-8?B?S0orR0pLVFk1UFhzZXlid0ViYmxLWno0UW44TFdWclQ4STVjSTBsL3dEdGVv?=
 =?utf-8?B?b0ZMUUtJQ3BnM2tuTHRjeklKWDUvektydzkzdCtvUGV0MHhIeVkveWZIY2xD?=
 =?utf-8?B?aHdLR3drRmZKc1R4ODVmUWtMQk5IRVp5MGdiMFFtZzhNU2RBOFVPYmlWNlFX?=
 =?utf-8?B?T2xOL1ljQ1dFN2o0b1kxZEdkcytFZTRCUGN2aHp5WDNLblRHSWpWZGQvYmNi?=
 =?utf-8?B?TDFNdHF1cjE1ZXRJTzA3Wnk4NTJCbkVCL1pleXVxNW02R2NRVlNWWGJoTWJZ?=
 =?utf-8?B?QUlQSXUxTml6ZmFZWmJkUVRpQWZwbWNXd3N1c3p6d05RdW44aWNrQVc5NCts?=
 =?utf-8?B?NzlXbmRKaVEvenp1ZjZuQ2kwZFZUQThhYjY4RzVGTDBXajJXV0ZDMGNyUlpp?=
 =?utf-8?B?NEFjNTJWMzdPQVFKY3ZpVzJYdW1wSVVOVUNzZUVURHZSelZOQ2xxTHYyUE0w?=
 =?utf-8?B?d3JLMHVtMlgyTGNsN1dvTVhTWThwcUdlNnR5VVQzZ0V6Q3Y3ZlVIYTNlU01l?=
 =?utf-8?B?S1pqcVo3ODFweDZ4ckNWRUk5aWU2MkhvWVA2K1VHOE9JNVNTQ04weFMxai8r?=
 =?utf-8?B?MEpqU2tZWnBHN1d0ZExHL1o2UGNtRzB0QzIyWnBOYUx4NVR3ajNHWjNUeGpn?=
 =?utf-8?B?UDVEME5FK3FXZzJtZ0NQL28xNGdFNDZYUEpMekNDcHlsdVd6Ym41NTBWenRD?=
 =?utf-8?B?Mm92bUVRUWhqMG5aVkdReHpENVQ0bTlmY2VlQW9mcVZIb1hhSU5BdmRiVDEz?=
 =?utf-8?B?blpkMVFPWE5zeTdyblNLTjQveGg1QlF4Ni81R3diUGxMUE50am42MG1KaElE?=
 =?utf-8?B?ZEFTNWlRUUdGV2pQSUtGNTh0SXlOcXA4YWt1QlV3aWRmc3k5UG0vT0ljU1d5?=
 =?utf-8?B?amdRVkNoejRrQUpkTS9JUnV3Y3VFdUlQaDZ5LzV3bU90UWFocDR4QXRlTEN1?=
 =?utf-8?B?MUVvNGFQUkZ4K3hreGJDdWxlOXBCL2lRWjYzbWg2b1U4NjBMeWRWZFpCZSs2?=
 =?utf-8?B?UlZPVG9EaEl5NDk1N0NlZmhCL2FXRnFnOFF0d2tuQlRSN0NndXQrb3doOTBV?=
 =?utf-8?B?NDhoQnJNbW9nVkJLRHRBUlRmVWl2MDE4bkdXVU5qLzJ0b3o0WCtPbS83Skoz?=
 =?utf-8?B?REE2Q3MrOGZOUGs0UElWbEhtaHp1OVVvTjBUQnRJSlliZU5VZXc3Mkh6SGhV?=
 =?utf-8?B?NEczSHFIMEVsUC8vREl5TjUzK3NaR1cwaHVOQ2dLRWNSd0J1QVZEMmIvVXVm?=
 =?utf-8?B?Yk1JTjhWcFhOQmR2WlVHWURlcUFFVmxId0U0Zm5SMExWQlBmNndsODYrMkpw?=
 =?utf-8?B?THk0Y1hudkVscE9GTFhwa0sybjRBNGxpY1dpQ2c2N0Z2eHByZWNqRmtEZDln?=
 =?utf-8?B?bzlobjJ6Q3lzODhtQnhnYTY3ZGpMcEp6QUZCZ1FrV3BaeUtmUDFGTGdlMndn?=
 =?utf-8?B?R0JkZ0ZVWDhUYm55d1pjaS9hVWZvUVM2Z0Z4QWdjQ1U0RzlxWXhYKzlQcm1D?=
 =?utf-8?B?a3VtMStXTVlDQjd6RHpuYXFua2JlK1BlME14ZjJQTkR0WG1PWTMxOHpiY3Ns?=
 =?utf-8?B?K0p0UXMzKzZIVzl4bUl3ZWZxd0pZNXBOeFB4ZjdVdXg1UmQ1dUtNb0FHZ0Iv?=
 =?utf-8?Q?L7wMiaRgqjp06SpyamtnXBE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 912c8b74-c6b4-4f23-ec46-08d9fdafd47f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 07:23:07.6986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq8fAXghsWOFHCYsCfVaDQ3D1frTv8jsi5zAbJR6PEQ1zNuiqKf0fzK4f0Hn7z4k2PhTzDoCDI5zeS7O5iSkEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6296

On 03.03.2022 17:31, Rahul Singh wrote:
>> On 1 Mar 2022, at 1:55 pm, Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.03.2022 14:34, Rahul Singh wrote:
>>>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 15.02.2022 16:25, Rahul Singh wrote:
>>>>> --- a/xen/arch/x86/hvm/vmsi.c
>>>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>>>
>>>>>    return 0;
>>>>> }
>>>>> +
>>>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
>>>>> +{
>>>>> +    struct domain *d = pdev->domain;
>>>>> +    unsigned int i;
>>>>> +
>>>>> +    if ( !pdev->vpci->msix )
>>>>> +        return 0;
>>>>> +
>>>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
>>>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>>>>> +    {
>>>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
>>>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>>>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
>>>>> +
>>>>> +        for ( ; start <= end; start++ )
>>>>> +        {
>>>>> +            p2m_type_t t;
>>>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
>>>>> +
>>>>> +            switch ( t )
>>>>> +            {
>>>>> +            case p2m_mmio_dm:
>>>>> +            case p2m_invalid:
>>>>> +                break;
>>>>> +            case p2m_mmio_direct:
>>>>> +                if ( mfn_x(mfn) == start )
>>>>> +                {
>>>>> +                    clear_identity_p2m_entry(d, start);
>>>>> +                    break;
>>>>> +                }
>>>>> +                /* fallthrough. */
>>>>> +            default:
>>>>> +                put_gfn(d, start);
>>>>> +                gprintk(XENLOG_WARNING,
>>>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
>>>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
>>>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
>>>>> +                return -EEXIST;
>>>>> +            }
>>>>> +            put_gfn(d, start);
>>>>> +        }
>>>>> +    }
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>
>>>> ... nothing in this function looks to be x86-specific, except maybe
>>>> functions like clear_identity_p2m_entry() may not currently be available
>>>> on Arm. But this doesn't make the code x86-specific.
>>>
>>> I will maybe be wrong but what I understand from the code is that for x86 
>>> if there is no p2m entries setup for the region, accesses to them will be trapped 
>>> into the hypervisor and can be handled by specific MMIO handler.
>>>
>>> But for ARM when we are registering the MMIO handler we have to provide 
>>> the GPA also for the MMIO handler. 
>>
>> Question is: Is this just an effect resulting from different implementation,
>> or an inherent requirement? In the former case, harmonizing things may be an
>> alternative option.
> 
> This is an inherent requirement to provide a GPA when registering the MMIO handler.

So you first say yes to my "inherent" question, but then ...

> For x86 msix mmio handlers is registered in init_msix(..) function as there is no requirement
> on x86 to provide GPA when registering the handler. Later point of time when BARs are configured
> and memory decoding bit is enabled vpci_make_msix_hole() will clear the identity mapping for msix
> base table address so that access to msix tables will be trapped.
> 
> On ARM we need to provide GPA to register the mmio handler and MSIX table base
> address is not valid when init_msix() is called as BAR will be configured later point in time.
> Therefore on ARM mmio handler will be registered in function vpci_make_msix_hole() when
> memory decoding bit is enabled.

... you explain it's an implementation detail. I'm inclined to
suggest that x86 also pass the GPA where possible. Handler lookup
really would benefit from not needing to iterate over all registered
handlers, until one claims the access. The optimization part of this
of course doesn't need to be done right here, but harmonizing
register_mmio_handler() between both architectures would seem to be
a reasonable prereq step.

I'm adding Paul to Cc in case he wants to comment, as this would
touch his territory on the x86 side.

Jan


