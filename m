Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6802A58D70A
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 12:03:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382879.617938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLM3u-0001eO-Bs; Tue, 09 Aug 2022 10:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382879.617938; Tue, 09 Aug 2022 10:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLM3u-0001bO-7a; Tue, 09 Aug 2022 10:02:10 +0000
Received: by outflank-mailman (input) for mailman id 382879;
 Tue, 09 Aug 2022 10:02:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A/TE=YN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oLM3r-0001bI-Vk
 for xen-devel@lists.xenproject.org; Tue, 09 Aug 2022 10:02:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2072.outbound.protection.outlook.com [40.107.22.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51fe3524-17ca-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 12:02:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB6293.eurprd04.prod.outlook.com (2603:10a6:20b:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.21; Tue, 9 Aug
 2022 10:02:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::fcd7:eaf7:5345:210f%6]) with mapi id 15.20.5504.019; Tue, 9 Aug 2022
 10:02:02 +0000
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
X-Inumbo-ID: 51fe3524-17ca-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go4odYZP+GCebMc0gVTfVGGfJz+C6fshN93RpMdAH6pfS2CYtkzH4yVXiMRSaHSzbf9WNfWGITIMhb78c2oTRL20OPKFPO/8E9KmYavQJo2xHONkC0UWzlltqrkcIVd0W100Y8RnUNmPwrFp4cUFCp/iPfjwO5Z/owHqSzS85dBQTgvJ8QAEG75hCT6vz6UdeJY5eqeJQAXa2Pe80WaaEiCPsTNqBXjnxfz+1OxOkvXr8O/M+wZpUANFV4/7rnu3pHXTI+kcx8iJxS0H6kgd3xINdjqPdC99bkJoBt2xpBFWiZosIYPZphsMRcTZyPd0khx592eu8gjXJFhR/W0r2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXirUhgLbJ7enE2EkxzaOjXcrOZEYsMjX+mhcy725Bg=;
 b=Ql8otdfhx1NhcGffuE5+ysZbOXAbxR5XfuFRlUAbdAnV57yMplJGxxpnC1QCCrxsiF4cCRBVoGT3Y6kJ2+Wu2jcqa5+ZC093mWhsti+8VRxLDy1zWHvd5JMO+j0u2xda555rKwe+taAv42HpoWjr6hwjl24Hn6nL2K9wMP0Ggvbp28vwMR6Okr0IYKU/UYYp+AM8ez/Y3x9ef+lCjG6d4RMp/qyCi2NDS2dy9duzU1EDRWFDUftDKSO4q+0+aGcdmSLYqhsQSNNUrR/MaJcOUZBwP6XWhZBEl+QP/inrBIY3fwmG2ppIkLtGoUIESSoyab3XXxvGdwNP8jAgDj7JGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXirUhgLbJ7enE2EkxzaOjXcrOZEYsMjX+mhcy725Bg=;
 b=Oc9/zmRwVIxCu/STzaGa5aW4Qznu+QF4LxUM4/1kxk2ieM/n5dspvklRBqBB5bPVIWHbISHMmGcL1/v1Lfa6ac4qhw/Y8OVK6K098kVPoIGarJR+3RfOHmw4dPQvJKBV8OmmC9hir4OQGXNSRE+4DMc4Xr0x73EzH1zEkMVQSBTxpu0ycT1zxXjHeUILkLiRf7QtHwVhQJUQ/58JftCREa5gNuwQuRSLtlRMcR/eCpugHfpmnLqXRTiaoZOO4UB2NX9K2VI9Lr+MkeVhg+XCTPif9nNLNdwK4k8FGh1ejhxkZpL0jraGLx6rS1sTRztr3AODv1aqM8dJfgVu7R5EEQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd0ad0a4-6a01-7e35-51dc-614477bb9556@suse.com>
Date: Tue, 9 Aug 2022 12:02:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] [RFC] xen/vpci: modify pci_get_pdev_by_domain() &
 pci_get_pdev()
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f94c790-01cb-47e6-a22d-08da79ee351b
X-MS-TrafficTypeDiagnostic: AM6PR04MB6293:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bireU2nDuMvzrKMqOAQTV2z4iI4l9o2Y19egG7w19fBMg8pd6XYt7tN32mRzrrnTqBU8Voydp/MOxw/TulCeiuI+MuLHhRVEV+9JGPDS4nSgBAaqawbs5ImRNZoP/LkNAPfoyFYx1APHuVFyRr6/ssQC3PFsbXorcf6DXRQJ+5WF8WZIRPAqXfSAw3vqvBkkkpIvCW8f9cu4QMjy6WYLnZxbIKp8vB1FAYEPOcJVRDUnXQqhCVvHtRacE+LnPvi2iloVqWDKnGzs0L1+NCVUFVzKECM1J0JoQI9umQ/CyZuJnrdOAhHuoTQtSuFwVhsQFfZOAYTAUeyXhW8LyQmTa57ivRuIiLjDVOyVYl7csQFAfqsacFqhyxOe87Ht7t70k24mMswaO2JAGJRRHiA6zrjDsbdmBb5G/M4hnaqtnpAG55qGDrJgW3WUwJxlUNd//qwmtcIz/X/qwNaqrmXWuqb/6kOlmT+q9y1uZmvMwX41E08xiMrwgsogGV1cjWyZSSDncBYD2YHsxJ3O+U+CHP9vqb6kxXAgRI3usUYRH5xGFlse1eji/zee1cMxyaPEV9vZ3Btujubb/Y1AacD0xNrz2USmZoSE2oRkZzR8wvRGjM4K0TPkOU5r6+i3ULNrArExlChODv+khP3Iz/H5f+SHhTxQGuNqJj+m/s1OmCyql3sw0qK+dvl58Ut0tDNhsfL4IyYZHJO41Th3jYqQELSo7HumiEO/eRqlKU4oyzL/k4y7IEs6bqqBLv1AdRicjQuiOWEUTTCJMcBZn08DESm5SGyy3fTUVRgJloKHQw/8vnlwfpMyitWe/jqcUIAlOy1sVoASLv1F3JeOG5+1kw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(366004)(136003)(41300700001)(31696002)(26005)(6512007)(86362001)(6506007)(38100700002)(53546011)(186003)(2616005)(8936002)(31686004)(5660300002)(2906002)(66946007)(66476007)(66556008)(8676002)(4326008)(6486002)(36756003)(316002)(6916009)(54906003)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkVpMzNNSnBSdVN1NW9jZmtBbk9NbENWL0Rka0grNlZQcTJoOHJ4SVI0em1I?=
 =?utf-8?B?d2d0dTNFc3RSTUcvOTVZRU9hTGUvYkhrZ25DNkM1dGhETWFhWTBybTUrUHNF?=
 =?utf-8?B?TzV5TXUzYjdLdUk1ZnhML0tYVSsva0QrL0YyRnN6NnhSMjhGWUZ6azdoZ1Yr?=
 =?utf-8?B?dldKY0RWdTAyenVaM09hQ2xPVkh1OXVLVDU2U3ZGNy8wMFZIR1R1WkYxa3FZ?=
 =?utf-8?B?c3pwVEp5dE52WXhtS09jM1VDcmJ6MVZpK1UyOFNTUkt4VmdPcmZwZzlKWnNn?=
 =?utf-8?B?TWtveFhaN1FlbTVWZ1h3MWRMUEhDa1daeTljNSsybjJYWDN3NE1jRGxTNWFv?=
 =?utf-8?B?SnM2dzB1cmZtMnpwTWhNYWdCZis1Z21mOEVBR2JHNGVFWmw0NjFRS1VjcEVz?=
 =?utf-8?B?WEJRL2ZBNE45NHhBUklNNHcvMStaYWw1b3R0YkhCK1R2UkttdXIvQ01iZW8w?=
 =?utf-8?B?RE1qdDk0RU40bytJc1JDMHczOUpOK081MVloZkFVcy9oQ1ZEbG1uUWVnN1pB?=
 =?utf-8?B?WnRqRVVncm5Hd3BEeTZLVFFoMyt2anNHMGROSW5SWVo5RW5IYlp5TkNjeE5U?=
 =?utf-8?B?aGkzWnliaDg0UmN3QURWUWRQUWpVNVkxaVpFU1R4SlJENnV3V0w1TzFLcGM2?=
 =?utf-8?B?WklnbXBDQWl2VzRIZzU5a1VtYnJ2ZGxOYU5uVlRlZTdlbEpsWk9zbG53VFBz?=
 =?utf-8?B?Wk00S1R2aUVjZFVEc1VmcE54WG9iMDBxVkdKVXQ2S0NwV2hGRTVKa09WTVNz?=
 =?utf-8?B?bElaZy9zRTJqekp3VVRyb2xha01ENTNHVGJJWlVyVUJWcXVjMnBCUlN2cVdx?=
 =?utf-8?B?WHJVNyt1Z294QkdQQmM1bkt6Q3NiK01sZ2IzOExoNS9VcS94QTJjdTd6R2JC?=
 =?utf-8?B?RFlpWXd5YkR5MnROTmNRSmZ4THJaK3hDU3FCNjNjY21mWkQ3L1duMXBXY3dM?=
 =?utf-8?B?bE1DVVJKbzY0V0JibGVtVGRGelB3elBtaTQvMzIrYUY4ZktKYlJMNS95SVhC?=
 =?utf-8?B?SUN3b2JaWFM2aFNqYmF0THcwZy9Ha0lCQUgxTk5kdks4dVd3WGRPWWg3M2Jk?=
 =?utf-8?B?NDU3blAwMTMvQTlFb1F2VTVpa0tabDIyNjRFcFZXRW15SlA3ekIzK1VTb0cw?=
 =?utf-8?B?Z1NldmIxMWcxMEUza1loNGZEVENLbE11dFhvWGhQazJocHg0OExRREhsRVNo?=
 =?utf-8?B?cW1aY0xxUmhWaUV3SGJwYXA1VmUrL2gxeWl6Zko0dU1BcWZtaEIrcE1tVmVh?=
 =?utf-8?B?VW4rbVhSOGRNR1Uwc3N5bHRVRTE4RVlCQmRKZC9ESm9pNncyWFlmWkxpQTNo?=
 =?utf-8?B?NjMrUFRVK3VzaWR6WGgxU0N2bzgvQ1djYVRUNHgvRmNKbWs4VmZCdFduN2RH?=
 =?utf-8?B?NDlLaGFhVUQ1UE5haXR3eFlMY3hpUXQ2dlhMY0t5eVhlaUFMcTB1OUxQVmd5?=
 =?utf-8?B?ZzVuSkVoYnArb0U0Q2M5c0l4emhzakV2emxmZ0hZQm42eC9lY3YyN3llZ1J3?=
 =?utf-8?B?VXcvZ0V0V0hUT2x2QzJtUlJLT211K2EyN2lqMHFRN0w3cVNodzVodG4rczM5?=
 =?utf-8?B?RTVyVEc3bjlkNjFISUQ0eVpMOTQ5NThSOEY5eTZIRFVIQ0NzTy9pb2p4bXlS?=
 =?utf-8?B?REh1N29tNDJGdVVhTDVKdGYxUnR5M05WdTVjWlVEeTIzT3pNaWtJVnQ4aHdi?=
 =?utf-8?B?QXBLdFo4dE1tYkpIWHdFY2QreVY0cld4MkVtZGszb1FId09QYXNkQjZLbjZQ?=
 =?utf-8?B?Y0RlVnZNNmJLRXZkUjJ0RnV5WTVHYkhOcTdjQ0FxTVo4TGpRZlFJL1lRaS9i?=
 =?utf-8?B?RFErNXR2NnlJYnpDalZ1REg2Nk5nWjNIZHZHaDdST1h1d1hqZnlneDJJT1dN?=
 =?utf-8?B?QjVnRWNGUlFDcXZ4QUx0aWp1Z01QYUdEakdzM1BZVldxb1BaeEg4SGNyR0p5?=
 =?utf-8?B?MjNhTFo1V3RKbmI0bFE3aEd0VDJRcTdRSVRZRnliaS9pa0V1V3E2Vjgra0NL?=
 =?utf-8?B?Um4vSXB4ZW5ISWQ4NWpDSEJ5NFgwSzZNclQ2Y3U1TmNGbkF6ODJjczB6QWEy?=
 =?utf-8?B?aTFkZVdMNnFkcDVOWEdTY2h3Z2FZYjJNczg5Vnk4VU1NK0oyTk96b3ZpVTZi?=
 =?utf-8?Q?3fv8tIFK7gLnyuLithWWG/Skm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f94c790-01cb-47e6-a22d-08da79ee351b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:02:02.7933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXb3q4cWC7PZfeFkPmdTAkS3WrgKenYGPT53OZSOPfNFWaCuh91kfq+E6iVa/QsHXq60biKZG1YlcqS6e5Q4sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6293

On 05.08.2022 17:43, Rahul Singh wrote:
> pci_get_pdev_by_domain() and pci_get_pdev() functions find the pdev in
> the pseg list. If pdev is not in the pseg list, the functions will try
> to find the pdev in the next segment. It is not right to find the pdev
> in the next segment as this will result in the corruption of another
> device in a different segment with the same BDF.
> 
> An issue that was observed when implementing the PCI passthrough on ARM.
> When we deassign the device from domU guest, the device is assigned
> to dom_io and not to dom0, but the tool stack that runs in dom0 will try
> to configure the device from dom0. vpci will find the device based on
> conversion of GPA to SBDF and will try to find the device in dom0, but
> because device is assigned to dom_io, pci_get_pdev_by_domain() will
> return pdev with same BDF from next segment.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

This wants a Fixes: tag.

> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -593,13 +593,10 @@ struct pci_dev *pci_get_pdev(int seg, int bus, int devfn)
>              return NULL;
>      }
>  
> -    do {
> -        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> -            if ( (pdev->bus == bus || bus == -1) &&
> -                 (pdev->devfn == devfn || devfn == -1) )
> -                return pdev;
> -    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
> -                                     pseg->nr + 1, 1) );
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +        if ( (pdev->bus == bus || bus == -1) &&
> +             (pdev->devfn == devfn || devfn == -1) )
> +            return pdev;
>  
>      return NULL;
>  }
> @@ -642,14 +639,11 @@ struct pci_dev *pci_get_pdev_by_domain(const struct domain *d, int seg,
>              return NULL;
>      }
>  
> -    do {
> -        list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> -            if ( (pdev->bus == bus || bus == -1) &&
> -                 (pdev->devfn == devfn || devfn == -1) &&
> -                 (pdev->domain == d) )
> -                return pdev;
> -    } while ( radix_tree_gang_lookup(&pci_segments, (void **)&pseg,
> -                                     pseg->nr + 1, 1) );
> +    list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
> +        if ( (pdev->bus == bus || bus == -1) &&
> +             (pdev->devfn == devfn || devfn == -1) &&
> +             (pdev->domain == d) )
> +            return pdev;
>  
>      return NULL;
>  }

Indeed present behavior is wrong - thanks for spotting. However in
both cases you're moving us from one wrongness to another: The
lookup of further segments _is_ necessary when the incoming "seg"
is -1 (and apparently when this logic was introduced that was the
only case considered).

As an aside - my mail UI shows me unexpected threading between
this patch and two subsequent ones. If they were actually meant
to be a series, can they please be marked n/3?

Jan

