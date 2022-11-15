Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776BF62930F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 09:14:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443798.698539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1our5C-0007UV-7Y; Tue, 15 Nov 2022 08:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443798.698539; Tue, 15 Nov 2022 08:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1our5C-0007SW-4p; Tue, 15 Nov 2022 08:14:14 +0000
Received: by outflank-mailman (input) for mailman id 443798;
 Tue, 15 Nov 2022 08:14:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTa/=3P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1our5A-0007SQ-Hm
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 08:14:12 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1b::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b47b186-64bd-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 09:14:10 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 15 Nov
 2022 08:14:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5813.018; Tue, 15 Nov 2022
 08:14:09 +0000
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
X-Inumbo-ID: 7b47b186-64bd-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T/jzgcsWRS1HAo8MtPx+A2fqU6DvjAtEa2LHJD4Wl0oLcaJKAbK5N0rCNN8w18O9K7hcATZmf/nyHOS+VFyn1koIr7IrbTK5cZStpm6E6lb7eEQmxHScXDM8O+/INYPXGPkV14ATkHeTOJ5wBEkJrzBt3V2IEwMMky0Hq/2it7PtComRk3kXcCBj5lZAeUtk+fWAhK8wbIJPIgL9PI+O0N+HTVsii1szrRDc24UPdiYkJ5OTqNQECvN+K57QdKUhTCVY43pHRwvT9F1QDoGgEd5M9HfhjknZisKYtipyqDxUL0cY8y0hL5/iAggBq4hWhaytfydUkrULkuAF1Ewyhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HBNiTXovtNWiPwUqgQjYj2iqh2e87mFpE3f4n77bZ0=;
 b=OBjkt/3ylOpKPe2/OTSW2VOI8aPVbYvttA5DShNUym7eNdWAjZTnUg0KT8u82XIoucs45SJwM1Z6OToOXMbck832SRJDivVga0S4352XsdBPpPQDSULnnlrfLoyfBdR9ZGIScOJvyGxnL+Db/MDFiJTiZ2CgcQr2DbsESj+7bp43Fyjl9yINPNXefTT0r0wTh3pYqP6HMyDbeVlCkPr5ze/9PsFB5V10dYr3gXZ4WtOqIXSdtGgCxItsw1E63T1i9yNyERo9jil2U8BmC7i8Ecctwk/dShGgWKoDJCc9dBAlBzWQ5N9np9PhOTRNAtlnMVHhqN2CsOcuLf4aEqrnHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HBNiTXovtNWiPwUqgQjYj2iqh2e87mFpE3f4n77bZ0=;
 b=JFD/cvXUr3T8C8RlxEbiQXuzSgt204gJFt8ZxX1rvZgf3QxDmGcDHe8DORzHW4gGImFVebAGpYXwc36YVsD6fjPvEFY9taAF6a/aZxqVLqZHCvy9jp29FXodYZPjgL+NaVDt6EBs0NF+cG3DoYvWDgOt0Wd7WmMOJRE1Inv+w1Mo8IEL3aF276DARhTEQen1Dj40Z9v7i2SvdZOfwd60PKnZ8VsbNgrH8GEq9BjgpuYCivzGe/0lnw1DoSBOkkg5+PTRhL9IQi4qZglYA7TBIfg/pRYSb6qRyYY/8BexrsfAinTV1wVhN1a3fEhfyBm1wPjiajSWxlvjS/oq8J6smw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com>
Date: Tue, 15 Nov 2022 09:14:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0063.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: cabe90a5-e738-4d3c-aa31-08dac6e15f0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/TIlO/Qk/itCzAhXcqzmrVMV9Y6eSbBL4H9ktbuB2fn87e3pD0wALEFkxe/fjsGk9UVMjX2gOFn7uPHPc32CSLc+ArYnZa4SjyUR3dK2MZC8DG31pgqqn1kYJNJICZK6hK+yM5IPw09RKmXZmqQj5q/6neJR5eyYWh9FyG4qdWhi8zn/IelaBcZXRjM4o9AFGEoenpZqxTVBmww6b7+ybUyMDPvQ3wdzfaQHvb70OnrgRfhydJDYI1XSRn5a0CZEyqOhJozO+nUxbLvCIs+uIge16w/TzHyOyXipVoQTnjKnuQhugPR9NZK9pQXgvk87FcKwec2O9ogTUJOWSgGh+eWYhkiBGmD91bLT2L4eRLYwERIhj4L6wu2XFdXJxgLt9aBVrmh43PputeBGN3+frMvdHl/ETHHaeTI86hggDiVYCylQFtxaFGjSnL3NCAjhK48RPCBPehYLjQcG+jIb6m7H4vyyJKuFtpr311REDQiuqdIckVwEqJ8jt4FbhfvHI3rvktuLuxmVTHHGZr+VuBL6jiLKoKlJybyIfGyN24N1oLzzCrlk/051Ow4T5szrrzFjrMhCCjmBhfPomZZYGQDKH2gSa9/699EcDmXyzclswi815H/w/33CjTUaZUe4NJuSxbTpvfBkythkBN2i9EzzZ0IFqCm4KeEVpn68O0gNWcTFYZSYZAJwA+xyYtkvsCSRg9mhBf92Rcrmp1UHMLZtbGH3z3ymROMVfCpqwCGjIDFxljPhSFn7d9hLlHe01TVm9QQjZ8DcRiBhisilvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(478600001)(6486002)(6916009)(54906003)(31686004)(8676002)(4326008)(66476007)(66946007)(66556008)(26005)(41300700001)(86362001)(53546011)(36756003)(38100700002)(2616005)(186003)(8936002)(5660300002)(316002)(6506007)(4744005)(6512007)(2906002)(31696002)(66574015)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?allsMFQxcXJhcTRSK3lXMXRsRTMzQ0NmN0dOVVFIcnNESzRQZTY0M2FaUkNl?=
 =?utf-8?B?bjVWbEZUQ3NZNGJpUFJ1THlGWjNZaXVKVk5wZFRFNFQvR2ZqaDUyQUdXRzV0?=
 =?utf-8?B?OFhQQXcvREU1Z0puNVVqT0YrSHRWamU4UTYzcG5HSUt6ZTg0a1M3bUdkekFQ?=
 =?utf-8?B?YnppeHJZU1NUbGhxZ0tHTmRnSlV0TFZxSkU0UjdYVnFFMkpxZjgwQjR6NU5S?=
 =?utf-8?B?SEgyQjk1b29od1hzZzIxQmNRdzY0YjBLRmFrT0x6U2lTNGoyTjFjbjdNU3pM?=
 =?utf-8?B?SXl4S1gvd3paNiswZTZJUGs0WnF0QlMxdUx4RjdSZW02cUVBM082SnYzY1Ur?=
 =?utf-8?B?Rzlya0lwdkR6Z1hxdzJpVlF5cUFHdzhQK2ZvSDdibnFHckN0WG5PYUloSGVN?=
 =?utf-8?B?bDVFT2plTEMyRFJydnljQjZMTkhYazl3TXR3VjhQMjRNUi9jQm9hZVp3eEll?=
 =?utf-8?B?VUQrWmIxQlh4Y0R6QjcyMWpzbVNCZU9EUHVJQVl4bUVyajIzTFNKN3UvNFhW?=
 =?utf-8?B?UGhQUGY0RTlvditDd2kwWnZ2NnJYaFlYMDQ5L1Azb0tldlJWaHpVWE1FdCtk?=
 =?utf-8?B?WVVnaUhmc09MZFlpT3JNSVlVcm1EL2ZlZUIwMVNzZElQUC91ZUIxRlJNejd1?=
 =?utf-8?B?VXZNWFZ3WW1GdEFxOWFoRkNpN2xidEtzbzJidDVOT1lZNHQvTFVPUnBUNDV5?=
 =?utf-8?B?bDR2aWszbVpRbmx2RmhYcVJObm01ZXgzMXc2dk9GTHY2ZndVaGUzblhqL2Rr?=
 =?utf-8?B?VUZ3K00wWnE4Z0s3ZkczK2ZFdTZSSVVnMjlMaGU5M0RpM1duMnQ3dDFGSkpu?=
 =?utf-8?B?azFuNDZoVGhaaUxFd0puUWg0emdCTDhMQ1M2L1dpckg2MGllc1FlbXEvbXlQ?=
 =?utf-8?B?Zzg5b2VGaFdrNW1FbG82dGMxRTFIUHZkV1RwZ1lCdW1Mem0rTmVOWURnRHBQ?=
 =?utf-8?B?MkRCNVRxV2lrb2VoMkNaRHdXVkh5ZVFzelpmbEU0ZHJNKzBKVkN1RHNwOVBl?=
 =?utf-8?B?RERoUEphRDJmbTQ0UmNsa1cyOC9OT1hHMCtnUG5lWm1XTHphd3lPRElOVGIy?=
 =?utf-8?B?M21yVHozTG9Rb0o3WFYwZW9yNW1HSGFndThIdnJoS2NoTlgyb0h1blVYSy8z?=
 =?utf-8?B?YUxLbFc0UWt4TDg3M0phTmswczNvdG1yRUhQOEYvUDVmLzRWUUtUTTB1U1VI?=
 =?utf-8?B?cHlkdWFnN3grSmlVc295WS85TGxkTkZydVZhQUpHRWlNUXZVRkxWU1g4dHdo?=
 =?utf-8?B?RE5FRCtJTGhQQjRyUTNNUWdGWkNjeDR6N0RRNzZ0eUM4dmFveW8zNXJrdVor?=
 =?utf-8?B?bzRQZGpLaW4ySlp0MHd2aEhwR1Q4QUIrQVdmdjVKSTFHTkR0bFJ4RlVLNUpl?=
 =?utf-8?B?dk4raEVUeW9ORnZMdHdMRzFJS1MxM3dyaDk1UGV5N1Q2Z1NLajU3dHh6emRS?=
 =?utf-8?B?YWNVREFIVGt5U2VpYk15d3pML1ZKcmtuKzVUdW5WQlZQZERTbVczczlrdVI4?=
 =?utf-8?B?RDJhckhYZnMyamhKRS9mYzFhMDRFOFFWTloySEgwUzh2aDJ2MjV0bW9qa1BD?=
 =?utf-8?B?WUlrVVBUUHAxR1NQZjc3QXpKeFZMQ09iMG9MUE8yUmlPcTNxMTh0V3AwVUth?=
 =?utf-8?B?ZTB2cE9LNlJ4amRETkdjZnBpTFR3bHczb0JyMG10MEVTZUkzanlnbThTMFFZ?=
 =?utf-8?B?cHM2eG1DMmpXbzdra2w1ZWpHRkdwUUhrbU5YTHp6L1J4S2p0Wm4wWnRKRy85?=
 =?utf-8?B?ZDVBSlFRTjBOamllMk96YVQvL3laYjZscU5PaDVpbzVyQkg1OWRvSVFPakRI?=
 =?utf-8?B?WlZwaFo3K1dtRnNlQ1hxdDFmVVJ4WnNnYnlvSGdrUjJQZitFU2FLLzg2bFZZ?=
 =?utf-8?B?aDAvMmplSWdUcnNSaGR2V1RhZ2pyRFhuNHNuK25DWUhPWFlScU9SWkdXbmNZ?=
 =?utf-8?B?aHVpT21CRmF4YWxSdk9GbGdZZHhVeFJWaVhybHhvSk9YVG9kTVhTWkJVakkx?=
 =?utf-8?B?a2lWZE1OeFg0Q0NSSlZ2MXZyNWlHazVTaHBZZ1dtYTZaUVlma3hjbFlZR2NO?=
 =?utf-8?B?SFJsbHF0TVZhTjdRTk92TGlDNGNkSmIycjkyVUp2RkJ3T0dFN0I2dldQMXZp?=
 =?utf-8?Q?4aVcwTe6/b/lY7nmQzyngoHmn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cabe90a5-e738-4d3c-aa31-08dac6e15f0d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:14:09.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eejE3ONt/+Z19MDOdk6n4W+D9ie0rVwNh6s4OrLWCzDTMThlky0HykOyIBGhKjLOqmOc2gmdJ+Zw/S1AVtV+wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

On 14.11.2022 20:20, Marek Marczykowski-Górecki wrote:
> The /dev/mem is used for two purposes:
>  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
>  - reading Pending Bit Array (PBA)
> 
> The first one was originally done because when Xen did not send all
> vector ctrl writes to the device model, so QEMU might have outdated old
> register value. This has been changed in Xen, so QEMU can now use its
> cached value of the register instead.
> 
> The Pending Bit Array (PBA) handling is for the case where it lives on
> the same page as the MSI-X table itself. Xen has been extended to handle
> this case too (as well as other registers that may live on those pages),
> so QEMU handling is not necessary anymore.

Don't you need to check for new enough Xen for both aspects?

Jan

