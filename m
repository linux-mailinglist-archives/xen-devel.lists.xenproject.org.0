Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0408E6ADB81
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 11:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507273.780573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUIk-0007mE-KC; Tue, 07 Mar 2023 10:12:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507273.780573; Tue, 07 Mar 2023 10:12:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZUIk-0007iq-HL; Tue, 07 Mar 2023 10:12:10 +0000
Received: by outflank-mailman (input) for mailman id 507273;
 Tue, 07 Mar 2023 10:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4ndv=67=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pZUIi-0007ig-KT
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 10:12:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8308a040-bcd0-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 11:12:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9300.eurprd04.prod.outlook.com (2603:10a6:10:357::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Tue, 7 Mar
 2023 10:12:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6156.028; Tue, 7 Mar 2023
 10:12:03 +0000
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
X-Inumbo-ID: 8308a040-bcd0-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cYkYyR8XazbhX7IFIMs3uEs24jSxL+q2t6L+LtFF5GYc0JMG6drkK+4Vbuif/rgfPjXWtGLJHS8l2rhDkfyISUtbIULvW421NyzOJRvbFBRwigVhBx1+sFeAVXJ++9qw0YjmgwIrMLh9vkgBraMbEMvHTBtMmgMlu4fUP1iKnJfWnQz2vUm66PKCXrZgtuIEtegjkO/wnwzFA2OhXlKILqEAZRdnm3MxXulw82frf88iDwudhScrpqD5KriAPJ6KMxKuj0zozvzwQoA7otJGge69HKV8dzSJPHHj3F8KA0Ec7/dmEXVHzhbp1NGIoVsN+BwY3oYOlqXmdPdZwiINhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJPnfFe8idBUNYlVhDXOIMLAPqhrMoUJbXW8Se90YAA=;
 b=SnegFLsSL/WPOwRiClW+9iHLzyi/EhGdVfb7vYfVQJ8O7tZldTGjxCeE5ZfufFsyULiOWD11jmkd8ONESmvZv3SWyciWITBPiKgQLlH9vW+1Mg5H3AyqyGSsLeBrTzCKSqmCAy3ZN2jipELbP0bMUOJR7koXOhwsi9wenNR4OIwmkPZOPTo0PABwfDnpMFSTplhn2ItCZ82l+kveqerpzU8pjxlEbTu9zrNZQGNgyer4jNq+Q7dszNm8uIqA1iVokCArGT+f2FDAQYjvfSUy24WA+BMMy/X/KIxe4Hzu686aCx7z4hlUKrefcH41Sw76dyGAJu8p64zfncKcc2wMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJPnfFe8idBUNYlVhDXOIMLAPqhrMoUJbXW8Se90YAA=;
 b=RHgiYp3SdcVh2FukQDTgZZEg8RTshX/T/JUghmLDLXNP8pVJKvyUzI2R61Q3SHLYJx4DJLffnGwFCEtINVOljMLKh4+cONIITgOpOLAYJsbJfLWRvOwJlTZO5F1s5MsFJlBeb5U3KB7H5pqbJSlGPMwLwrdK9PiFnypIMJrfmrD9waoLpqMqn+J4+jIIctqIHi75LwDh7ZsgZSD05bFGl4L1XEWiwJ9GIpM9XzQPuV0Z7p8uF+k+sw3uaNiZs32Azl43N30yaNpmqO+KF2PFsG0b6hHDAPIFVMglZ7EBtWAgYmZP+d35oq8AgZIqLoKRibxJftpHxfRif4qXxuY41Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c40f1a4e-63a5-af2a-e5db-729b1af80708@suse.com>
Date: Tue, 7 Mar 2023 11:12:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: API/ABIs: Re: [RFC PATCH v2 0/2] Add a new acquire resource to
 query vcpu statistics
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <matiasevara@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Matias Ezequiel Vara Larsen <matias.vara@vates.fr>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1665138677.git.matias.vara@vates.fr>
 <90a551bc-ffda-6db8-775b-11c100bf6f52@citrix.com>
 <20230306142315.GA745324@horizon>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230306142315.GA745324@horizon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: 1902d995-41cf-42b8-2aa2-08db1ef465a5
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N220IfqJFOkNjOcN3OQm/eRZ+ns2IoF+0TLSs7J7XqH0EyOKpusQwA3mWUM8wX6GUiVsJ4lsxvR+29+KDWavhAzVNlrXx05hczoBBRIrsDJd2SBRfQDcPS0NNi0N1yu47b5iGa80Ky487eZlgW9tnGZzccOlayv2OANASCQCD+OHNst3GCP4Wz7EXQo9uBBBU2GCkMr2gllXE8xc7xBhoE4M5G0r9YptyJ5g5uiLOaIYP+II02mYGYX3U83jv+YZZm62IlUxYk65myRxVMbR+DARvzWhQ31MQVwQPqHupcHOwhJNbDLS8DmCmwbLWjSPZlgyrCMRf1iGOp5zqrJV/2B11PcF4772zjU/z0JfXXR1DKiD8ObRcYeRaU2zzmfiXCkML6Y8O5NeB1bza48b+QBPXMid0oZHpw5u/CeRgyQg760AAfJaVSNF5/rCrwMv7vXRIFZp61tHeukg1JUgVLNW90CA+l6T8595RV//Lw78riIbMqIUTefgzqIiW2lPideZdkafqojKSBM19fSvysHEdQWxkmgC0S2OYSKPjymXxfoLxL6SfVcRSlEPt3VxDDN0JUfw6a+nX2P0RGmWEBUfguGLwgMnJVuhQOm4WU615j/xyHv8Zy2fUJGXdU1mhj9wzW90nygqBbLsuZoMdjsv6KPypv8vyieai7u5UWyQx0ufa13/ria49K8EzWLogci/GjHsHxXnRIw/lryo9ofvE7BuJPySnbgBYDnxuqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199018)(31686004)(4326008)(36756003)(66946007)(66556008)(6916009)(41300700001)(7416002)(66476007)(8676002)(8936002)(2906002)(5660300002)(86362001)(31696002)(38100700002)(6486002)(54906003)(478600001)(316002)(6506007)(53546011)(186003)(2616005)(26005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDR3andjcDFBczBFREZVMDd1dkw4QnRJM0dyZlNiVHZkWlRudSt1RUE4WjQw?=
 =?utf-8?B?clhJWmErRSsvcElScHRBUUVrMTNqVnpJVFI4N0ZnZW9pcG5EOHhoZmpqY3ZE?=
 =?utf-8?B?bkMzRk1aT0NRNE5HazJWMTFtbk9OS2ZKcW16d2toRnFRazNRaHZHWUVaTzg1?=
 =?utf-8?B?Y2JHVFhrVTJIcUZ1R0JUWHo5cy9MN3NPM2NuMitkb1FtL1h4eEEyODRMUjI3?=
 =?utf-8?B?blRhQmFVeG1BbWxkZ2pybzFSdml2TmFYcThJT2ZRQndLTnZQOVpCT0ZuRmZw?=
 =?utf-8?B?dlVaUkppNmNOc0dHbzViYTk3b2tEVk5zTmlrSklqTkI0bEc3SGZ2ckxVRHUv?=
 =?utf-8?B?RDZDalhkeURnL2RtOE5naDBHNkt0Y2ZKbVRNVDhOeDEzeHppelRjTUQrN2Vv?=
 =?utf-8?B?SjZTS29GUmorS1pPQ25QQXVEY0pUMWZQT1dLeStDRFBKWW5aL1kwK05QazM2?=
 =?utf-8?B?NVBYb1I5QWNaMW5pbjRHbldQTFMxYkVKTnhtMG5ybDY4b3JBZHJhaGFuYnZ5?=
 =?utf-8?B?SHoyeVVzNlQrZW9kU1BpUlJYdFliQ3FJeG5rc2hPRGtaa1haOWJMUVJJM1lq?=
 =?utf-8?B?R0FVdVFuNHQ5Ly8vWGFJUEtkdEFsWTIrRTUrTlRScnFYQ1dPaDlPWllLVE8z?=
 =?utf-8?B?TlVjZ3ZFNWQ1QTR5Ty9mcjZtYWFhZFNaOW04d1A4ZDlacHpmMEt0MFlHZEg2?=
 =?utf-8?B?Sk9lSjJWekp2cGZhN2lOVE10ZGpYK3Nmb1EwSndvRENtckl2ZEoybGQvUEdR?=
 =?utf-8?B?Y3hXN0oydXBwakY0THVJbWQ1aHBHdDNWVFN3QWNWYUQ2T2dKMzdoZWltV0px?=
 =?utf-8?B?cFhncmd2VlpEQUNpWDV0S1E3VW5OaW5rcjc2Y0tUTG1reGVxazBKVGhmVEZJ?=
 =?utf-8?B?Q0dqUFhOUlVIWEFuRW92cjJMRXJGaUF4bDlyeFpYZlNRWjRwdDdDdVBaNGdT?=
 =?utf-8?B?VzZhRitKMG1uNHF0MUVxTXVMLzRFWUdpa0pyZDZ6aDlzSlFqeWdNM1NQZk1V?=
 =?utf-8?B?OTdBcWg4S0JiU0R3YlY4bmlrdVN6TmxXVnV0R1VQRDdMUWg1a3doUkJVTWxL?=
 =?utf-8?B?K2NSbzlmMkFzeVlmUVNPNCs3dWwzdG9IQ2pHUzJQSktKWnBYKzhQNVhhS2tL?=
 =?utf-8?B?UFZNTFZOWGV1TlR4RkNKWHBvV3RFbm42Nmt2dHpZaHQ0azhibko5VVRpNGlX?=
 =?utf-8?B?elM2ZWJnWUZYajRwWForcFpBa2JwZmxNZ2puN3NvQ1N0M3VlN0hlVEZHQkNK?=
 =?utf-8?B?enlQeE1yU2JoWlpRREhOMmlCMWhKUU9OMm92UTlMbXpaZWdTMHNMbTNVZmVP?=
 =?utf-8?B?eXJpTkQ5QjV0SmhhTDFJczJxbzhTV21ERHRremRTaWt3UUQxemxHU0NIU2lR?=
 =?utf-8?B?dkxlcUNodWdlelhUVGpweUozTGRiWklleXdVNklkRGtuWmk4aDRJN3ZxdHg3?=
 =?utf-8?B?OWpOQ0R3YUNTa3BiYWVJUWJFUVlNQTlmY2Q4S1Q1dzhlVDJTRGd6TjE1L3Iz?=
 =?utf-8?B?SHVicG9QS3RIQ1diVE12Q2pMYjdROUpmVTdzcmUwT09jTExTQXFZTy90U2lq?=
 =?utf-8?B?ZmJiWUhaWHBlUzNNdjJzZkhOYjR5VU1vRDZxd3V1MnhoYzdzSm9aYnpoaEhN?=
 =?utf-8?B?UmJQL3d5YXpUaTNpLzM5VEp4ZlBIZnZKT1JiWGw1ZDNhaWJzT1gyNmt4ZmN3?=
 =?utf-8?B?Q3NSWGFQc01IQmNqSFJGTkFENEFiQlR3REN1UHNVekl6Z1NsVHZyZTZ0OVdU?=
 =?utf-8?B?RlZydzdHVkRGNHFVNDdlZlIrRms2TkFiYTJUTG1GUEJXSDM0SFljaDZlSnJT?=
 =?utf-8?B?SU1VT21MYktyQjNaWjBHb2YxcGpKSmFRTC9sVnNYeVB6RGNBTWdhaklkaE5s?=
 =?utf-8?B?OFkyOWU1N2xvRnNqN2JyVkQ0MzV4aDdZbEVHN29uR1ZPdFdmWnpRZHB5TmhT?=
 =?utf-8?B?RVBJWlFWMHYrNTJDQnovbGZhTGRmdVFBd2tDeGdub1FOeFpZSUw0KzNFUTA4?=
 =?utf-8?B?U0t6bEtUallCWnRXWDFIb1NnYVBKaU00N3pXd0ZlVi9WWC9CM1pIL2tRc0pW?=
 =?utf-8?B?VHlkd1dkTE5RY1lDNFpqR0ZzeldxSkxSMmxlSXpybzMwekZqQnE1NmRqWFhp?=
 =?utf-8?Q?iCF+NNniwB8mvfqF7+w3HE/+j?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1902d995-41cf-42b8-2aa2-08db1ef465a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 10:12:03.2514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wz8CQTGZyJTmqtPMXVd8wt8+SWh2FzUpp0uw8qiMDm/19Dd+e+iZbjeygGmCPiG6cweesdR/kmh8wnBtgA2jWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9300

On 06.03.2023 15:23, Matias Ezequiel Vara Larsen wrote:
> Regarding your email, I have the following comments:
> 
> - I still do not know how to choose the value of cacheline_size. I understand
> this value shall be between the actual cacheline_size and PAGE_SIZE. A value
> that could match most architectures could be 256 bytes.

This isn't a concern anymore when offset and stride are stored in the
header. It was a concern when trying to come up with a layout where
these value were to be inferred (or known a priori).

> - Xen shall use the "stats_active" field to indicate what it is producing. In
>   this field, reserved bits shall be 0. This shall allow us to agree on the
> layout even when producer and consumer are compiled with different headers.

I wonder how well such a bitfield is going to scale. It provides for
only 32 (maybe 64) counters. Of course this may seem a lot right now,
but you never know how quickly something like this can grow. Plus
with ...

> - In the vcpu_stats structure, new fields can only ever be appended.

... this rule the only ambiguity that could arise to consumers when
no active flags existed would be that they can't tell "event never
occurred" from "hypervisor doesn't know about this anymore".

Jan

