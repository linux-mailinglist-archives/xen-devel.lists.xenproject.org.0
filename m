Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890D74C8D06
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 14:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281485.479834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2y8-0007vD-Qx; Tue, 01 Mar 2022 13:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281485.479834; Tue, 01 Mar 2022 13:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP2y8-0007tK-Nf; Tue, 01 Mar 2022 13:55:12 +0000
Received: by outflank-mailman (input) for mailman id 281485;
 Tue, 01 Mar 2022 13:55:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nP2y7-0007tE-9h
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 13:55:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3522f487-9967-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 14:55:09 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-24-g4GYUZhOO-2VLYetR-Y6fA-1; Tue, 01 Mar 2022 14:55:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3714.eurprd04.prod.outlook.com (2603:10a6:208:f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 13:55:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 13:55:06 +0000
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
X-Inumbo-ID: 3522f487-9967-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646142909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QJMu4YL5jAQhiUJ7KcDsX49vB3plU9GmSJbM8enSqx4=;
	b=iHXohUYMk5qr+MOBFrIl69WXdz++FZr0RN/SPCt/Wa7fX6mfPFrj9jdmOjkmtb5FrLnBhz
	N1omTy6O3U5qliezpgLgwf2srvZ5wwL5bxjgRE2GLOf76FpRUhjiiyS1CEd9arcqOH3sds
	Wh/9TwLImOQLGf+1QVGngdBamx1+EAM=
X-MC-Unique: g4GYUZhOO-2VLYetR-Y6fA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YZU1seUnjKSy0/eEwLMOBtlemWGhU0vV/tNMnJXDWlyjY0JcYGULLCxQMul3ozReqMfl5YcGHXpmLtsKMBY5nbIUdbOT79VKto/UscRtj4DT+acLktmTCp5T4u4+WtwC4XF49i+csZEQvBMDtETcljY3YYW/H0Bj8EGF9WQll/4AJx7Uhs1KJ2kMJWtsLChf204RFdiBoSeP6Slt3rFQTjcXaEHm7AVBO7WQDo+lSIDuvyjds3+NCoMqq7wKJDeSvFHCOQ4UJFQVoY0mDw0JAZqFHjzyaH+sktIRLqbJbhvAactk6a/Ha32LJ//XpkRltUIeby5+LJpLhgKmxfs5fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJMu4YL5jAQhiUJ7KcDsX49vB3plU9GmSJbM8enSqx4=;
 b=NGJKWjS6F/ROmPhoP7yDgPDt9szCBljPzJptFsStbpM8O25L81aeuOxJx5FaDHLlaOJB2N1nJF83vbs0TS6V9S+IMmPfE0M15gr/jXWFKqqst0mOOY0ClflM817rClV20YsBqyk7b0MV9Ev8VsIPfVtSYqIvr86y5l3NA48Lapv58CbVqJZooaLTz/i58gYITQrjDE/KywD8l1peYYRF18c5BUZ4inBv3OdQx6cgTVjABUovUE8ChIEZOLa4kv4gRce1wclYDjt0pe+CW6eGBnKA72HHoG+/8V4KMCGp//3vzFOnUSTbVewdeKuDVTFjZ3i5ubeVHb8jg0K7W9wnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c11278f4-c902-0eb9-ac59-e27c0f2ba912@suse.com>
Date: Tue, 1 Mar 2022 14:55:04 +0100
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1644937405.git.rahul.singh@arm.com>
 <4d2a727ba218468e4f347dc12ca051a0534fe205.1644937405.git.rahul.singh@arm.com>
 <6e188f87-7e4c-00ee-dd0c-373d42acec34@suse.com>
 <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6BFB9B87-D8A1-442D-B4DC-18760C59D7BF@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0091.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::32) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3b8f420-77ae-432c-1125-08d9fb8b179f
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3714:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3714AD039D50CF653188D8B8B3029@AM0PR0402MB3714.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qHEHguYB9/S8blyyKipJ3ZT6v6DnHDVYdthvcjRnXQxUKfpmZUyqULcG0tL0+AG8Ob1JBBxUOcV/77K6I/j6DV9kdrmMaj3V4rBfYYZAivQuz3dhAkeXmDB6qGrYzalGQwLehR/q9n2J4eIP7yNcwHmIYGFscXdIr7zmydfRLorCT1ybXxzL97MlQtaMXGFrTPF3ayuHQ8auBEprpxwog+qd4cg9eUs27QaS/O8DZk7G8MKSgaUUTYFoJftLw4uXf13E/nVlaDDeyDW0NUpjC9ZY9Z8f2sLibGzN74pp6z2drNKQacCdLHWpNQnl4n88XvRXrAT7rmhbKf2qRd5FKi+O7AEjroGf2wiv4wWXzxUlO4fAitFrOATxlF/GfWjw0zcXpyIAlGWIhBYQK2IxJDse+rRZH8oifHECfFu7TfMmDIvvYipDNaPTSMCB+ZHlywU4VE9U+PZL0U11drR6VDF/fgRSj052hvL5WTArsJJ8yMaYh5Q+m6NtCLwXNAqDerqCbM69sB7xWVM3DvpwGHHHHQffEY2wAu/ACpX4y9jFIsDFsipNVoqqeWzEcKi8+8h4AQK8O+QGBe1jJKglea5O2eASxZ5bmQ4kqVnVccwmCURlE26tCQxn8dQtpYgQtN4J1cFJxszTyhjgE29dcKLpU4adhyJK3P8em1BPYpi9nRZ6pc+7iiGh1m2CqjJ37gTaCCBg6YV4MNTUubZ2Agxznx56x1JDL7/XdG5sPoe0OnPByg0yVDZE1tn/jUuR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(36756003)(54906003)(31696002)(6512007)(6916009)(6506007)(31686004)(8676002)(66946007)(66556008)(66476007)(83380400001)(4326008)(316002)(86362001)(53546011)(2906002)(8936002)(5660300002)(38100700002)(6486002)(2616005)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3hsMndZQ0ZCbjFrT1prK1lDQjdGTHBQMy9CZVpuWjZDZVhSTTNYZHQ0RGlW?=
 =?utf-8?B?bGRtMmQ5YzJpZEQ0eXdZN1diczZSdzBPOG5LVjdmSHdLQzgrY0d0bEhvUVA0?=
 =?utf-8?B?emxsVCsyaHZMbUFzMFpKOFliKy9naHdiY2pNT3J0eklsM1ZmMXFDSW1iYXFV?=
 =?utf-8?B?anp0WmlGaW1TenByNHpMM1ZqZ1dLUG9iY1JGTHd6SGFsa2c2aHpNT1U1OFFF?=
 =?utf-8?B?N3RFb0laenN3NytFZ3FoazNHaDY3WWw5QTg0UytEMkpXdzlkODkyOVZNNjNz?=
 =?utf-8?B?a1JPaE12RHdmQjJGS21NaklOQnBwc2F1TEJYcDFJYXl0SjROZmtYckhYcjly?=
 =?utf-8?B?b1pqakxPRzRpSkRtVUdZUTdUaE5oc2FKUVh0cVpuRGljZHZMUmx6UEdXMXRC?=
 =?utf-8?B?azRvWHd0anJYblo0N29wcWRvZmZHS1BxY0FVQ1E4YjVON2lMUFRqbDhMRnpP?=
 =?utf-8?B?TG1IM1NVamZobVlsenVVUnNaQksxVXlrZTE3dStOZnZ2MENnN2s1dzBHMkRx?=
 =?utf-8?B?VExHV2IySzA2TG9Nc05YbmVvOWRNY0NvSE1FYWc0UTc0ZjNOZWxOUzUwQVpQ?=
 =?utf-8?B?dzRkNmhyUnZXUWt0QXIyQW5WUndsbnlRSVZQeTJ0aHR1M2Z2b0w0L0ozSVdi?=
 =?utf-8?B?V0l2UW1QT2h3OU4yKzNqa2VvRytFZmMzSTQycytzY2hqekxsRklZTmJTaGNJ?=
 =?utf-8?B?VDQvWTBHVFpkc3BvSjZKN3N3bHh3clZ3VngvdU80SVFBNSs5NUdvYm5UcTMv?=
 =?utf-8?B?NlJnOGpINzlaZnUwTmxaNjUyQkRKWkxaYXhtOVR4Nk53SWNjazJaWU1SNVh1?=
 =?utf-8?B?SFFVbFY2YTlpdy9qczlSYTJKS1lrS21ONG9wTTVQTXpaSGs0YTN0NEJRc3NU?=
 =?utf-8?B?dWdVNlVsVU9mdUVGMmdQQjdzYnBlbktkVU84MUFhWUQxTjU1RHVUSjM4M0pi?=
 =?utf-8?B?QzJaR21tYXVpVnBobDhncVZaLzRISHRiOWZuM2tRWG5wdDB6T1VxRjBKOFA3?=
 =?utf-8?B?OEpDQ2gvOUVSUHpOYjFjem10R3BnbnRNQ0U1YnphUThkdmd1MXY3OExFaG9W?=
 =?utf-8?B?SDVlRWx4alhzaGJhVisxM1RWYzFEbVUvcVZ6RWp1WXhmVXl2b1hPY09uUnZZ?=
 =?utf-8?B?RUNNN2RTMjNobEw2UEFUSjFTY1pid1dRZFR3bTJxQU83VzA5MWJMdGR5aUNB?=
 =?utf-8?B?Q2NWak1kenpPYWJ1bjBBWXNLMThudlIyOFlaWExLc1ZxSmFlQWhMeENJU3hs?=
 =?utf-8?B?OUhtdW5HbXVGUmh4czd4dXd5TmFNM011ZDVXU3RGR2xjdTZkTGNZSVFjWmRN?=
 =?utf-8?B?dVRyU2ZjTERVcGRPaWtIalV3NzI0N1JadXRqUExYVTRhVnE0M0JLMlBGR1JN?=
 =?utf-8?B?eUdsNUkyYWFJekZETWk5WUY0RFpMT21TWHNMU0J0M0ZsMjJ4M3dhb3dCc2Js?=
 =?utf-8?B?dTcxdEVRNzJxY0V0dW9HQlFPK0pvaUpPOVNLWHIrSFMrdlRFcUVuZ2NrMmJ6?=
 =?utf-8?B?MkFtdnQ4QVhzYlU4bEtVOTh4QnFRTDh6K2l5WEtIWDRHNUJVZ0JIbzQrSE1j?=
 =?utf-8?B?VDBSNVZZMFp4K3ZneU1sM05WQzY2K3M1VGJ5Wm9vZGd0OWxnNFNzSGNmWk9W?=
 =?utf-8?B?ZDFKR2hrR1VwY0lSRG04U0NzOGRocFVIajZkai9aeCtPTEpFenJ3ZUR2V0Z3?=
 =?utf-8?B?emN6L2hUZC9sTm5GcTNabWhKdlc2Q0ZmVG9wdWJhdGs5STduL1FsbWpJOXlm?=
 =?utf-8?B?VHN2MXBxSy9Da2dPQmpyM1Z4U29aRUlCZk4vRUdEWUVRUVlFaXhPQ0Y0eG0v?=
 =?utf-8?B?V1hySTF3dlNzbFpoT3lLb1B1aDdlMU5sNFdjZlhCMkpHbTNjcVBFd3h2RVVG?=
 =?utf-8?B?OW9kTVVFSC93RFVlMzVWb0tCR1ZJbkZaVGI3d00vL1E0K2xNLzdQeHFPSmU1?=
 =?utf-8?B?eDN4cDRMS0JKc0E3NXR6N3paNGYyTFN4TE5UOG83anNNK0dVQ3Q4ay9tcGhF?=
 =?utf-8?B?VkFtZkdoMVR6a05XZTNDcnBxbytYWHd3V2xnVjZYb0xzSUU3OU5MWElkSGpv?=
 =?utf-8?B?STFvdWZ6MDFPWkV3SEhoQjlsa0pvTG51ZFZCTEtVSXVRdWdNRm1tam8wOVNF?=
 =?utf-8?B?c2FWYzFwZDJmZW83b0N0UWsxYUpMNHJWMkFyRHhuRDVxWjFvdGl5b0psaWs0?=
 =?utf-8?Q?Z0DlzFwXa6tPZrgW890ljXU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b8f420-77ae-432c-1125-08d9fb8b179f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 13:55:06.6680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1dww6YaTWYp5b7hdbKRvacSO7SEx4EqA4ljq6N8RYDC6XQozc6UdhDIoz+w6AeG16vSScgbREpPOp2E6Up18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3714

On 01.03.2022 14:34, Rahul Singh wrote:
>> On 24 Feb 2022, at 2:57 pm, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 15.02.2022 16:25, Rahul Singh wrote:
>>> vpci/msix.c file will be used for arm architecture when vpci msix
>>> support will be added to ARM, but there is x86 specific code in this
>>> file.
>>>
>>> Move x86 specific code to the x86/hvm/vmsi.c file to make sure common
>>> code will be used for other architecture.
>>
>> Could you provide some criteria by which code is considered x86-specific
>> (or not)? For example ...
> 
> Code moved to x86 file is based on criteria that either the code will be unusable or will be different 
> for ARM when MSIX  support will be introduce for ARM.

That's a very abstract statement, which you can't really derive any
judgement from. It'll be necessary to see in how far the code is
indeed different. After all PCI, MSI, and MSI-X are largely arch-
agnostic.

>>> --- a/xen/arch/x86/hvm/vmsi.c
>>> +++ b/xen/arch/x86/hvm/vmsi.c
>>> @@ -925,4 +925,106 @@ int vpci_msix_arch_print(const struct vpci_msix *msix)
>>>
>>>     return 0;
>>> }
>>> +
>>> +int vpci_make_msix_hole(const struct pci_dev *pdev)
>>> +{
>>> +    struct domain *d = pdev->domain;
>>> +    unsigned int i;
>>> +
>>> +    if ( !pdev->vpci->msix )
>>> +        return 0;
>>> +
>>> +    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
>>> +    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
>>> +    {
>>> +        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
>>> +        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>>> +                                     vmsix_table_size(pdev->vpci, i) - 1);
>>> +
>>> +        for ( ; start <= end; start++ )
>>> +        {
>>> +            p2m_type_t t;
>>> +            mfn_t mfn = get_gfn_query(d, start, &t);
>>> +
>>> +            switch ( t )
>>> +            {
>>> +            case p2m_mmio_dm:
>>> +            case p2m_invalid:
>>> +                break;
>>> +            case p2m_mmio_direct:
>>> +                if ( mfn_x(mfn) == start )
>>> +                {
>>> +                    clear_identity_p2m_entry(d, start);
>>> +                    break;
>>> +                }
>>> +                /* fallthrough. */
>>> +            default:
>>> +                put_gfn(d, start);
>>> +                gprintk(XENLOG_WARNING,
>>> +                        "%pp: existing mapping (mfn: %" PRI_mfn
>>> +                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
>>> +                        &pdev->sbdf, mfn_x(mfn), t, start);
>>> +                return -EEXIST;
>>> +            }
>>> +            put_gfn(d, start);
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>
>> ... nothing in this function looks to be x86-specific, except maybe
>> functions like clear_identity_p2m_entry() may not currently be available
>> on Arm. But this doesn't make the code x86-specific.
> 
> I will maybe be wrong but what I understand from the code is that for x86 
> if there is no p2m entries setup for the region, accesses to them will be trapped 
> into the hypervisor and can be handled by specific MMIO handler.
> 
> But for ARM when we are registering the MMIO handler we have to provide 
> the GPA also for the MMIO handler. 

Question is: Is this just an effect resulting from different implementation,
or an inherent requirement? In the former case, harmonizing things may be an
alternative option.

> For ARM arch vpci_make_msix_hole() will be used to register the MMIO handler 
> for the MSIX MMIO region.
> 
> int vpci_make_msix_hole(const struct pci_dev *pdev)
> {
>     struct vpci_msix *msix = pdev->vpci->msix;
>     paddr_t addr,size;
> 
>    for ( int i = 0; msix && i < ARRAY_SIZE(msix->tables); i++ )
>    {                                                                           
>        addr = vmsix_table_addr(pdev->vpci, i);               
>        size = vmsix_table_size(pdev->vpci, i) - 1;                                                                         
>        register_mmio_handler(pdev->domain, &vpci_msi_mmio_handler,             
>                                               addr, size, NULL);                                
>     }                                                                                                                 
>     return 0;                                                                   
> }
> 
> Therefore in this case there is difference how ARM handle this case.
>  
>>
>>> +struct vpci_msix *vpci_msix_find(const struct domain *d, unsigned long addr)
>>> +{
>>> +    struct vpci_msix *msix;
>>> +
>>> +    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
>>> +    {
>>> +        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
>>> +        unsigned int i;
>>> +
>>> +        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
>>> +            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
>>> +                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
>>> +                return msix;
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>
>> Or take this one - I don't see anything x86-specific in here. The use
>> of d->arch.hvm merely points out that there may be a field which now
>> needs generalizing.
> 
> Yes, you are right here I can avoid this change if I will introduce 
> "struct list_head msix_tables"  in "d->arch.hvm" for ARM also. 

Wait - if you pass in the guest address at registration time, you
shouldn't have a need for a "find" function.

Jan


