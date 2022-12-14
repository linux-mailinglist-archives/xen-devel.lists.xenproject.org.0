Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AC264C643
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 10:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461965.720118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OOI-00082I-Ht; Wed, 14 Dec 2022 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461965.720118; Wed, 14 Dec 2022 09:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5OOI-0007zb-Dn; Wed, 14 Dec 2022 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 461965;
 Wed, 14 Dec 2022 09:49:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5OOG-0007zQ-G1
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 09:49:28 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2088.outbound.protection.outlook.com [40.107.15.88])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98a34be1-7b94-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 10:49:26 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8530.eurprd04.prod.outlook.com (2603:10a6:20b:421::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 09:49:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 09:49:24 +0000
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
X-Inumbo-ID: 98a34be1-7b94-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lz9jt6KQ5BFRR+SfYSqYczau/n5sdbdX6MiGC20fetPsTLtBeetdg/jQefXZ37rSDf7RWpRRiugOXyWJOdzliMw8kdmrN08zj/mfiGV1yrHaeTRq9BKH7BB824CGvh0WkS1DgyXfHKbJcs8NhnrHEexFoNx77N/iBHlZVT2yHufgDPVl/2Hvi/M2nzfBNAZ7tiUW6gor9tGKEkuoRQJbqRmpFByfOA9P3m4udKWfmiC9EH3oXsvW1cZb4CTIykVoTSOlSTDZKdwikGimuGK9Qz9eWH3qxgUvkEfM7l2on5IRK98fn2+zBaXzspjFIUMxtOV9Sqfq9zcn4mdH0I7f/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9lGysKBPyAhxV7Qw/4sGAi02bOVAJ9Bp3/Xvrev0Ow=;
 b=kt+pFn+4H+zUbNb2sNyDmWcLOwGRH3ycsjAx7RtdSgb1k2mMpFjRPGnoBc1AIUibodHAUAz6dZFB9lMxKlD9l+N7RUavCH2NzjPQ9vZ/8Efqg8j19/0Qgi7b8l/5JMuXCA2f1m9kVRhD+5z23duyJZfytjrgFUv33aDDHKm9zwBAnzTDi+HQmcB8O6XSKcnkwwtgfeklM73n5oUoNO9kVs4ih5uyshfEbKFVqYZ29ToqWw+RUOm+Xo+jI5XEVzpotnteUIIbFawW1mdaJaC1b2Gk/UW2ySuishjfYbZgamoUZdUkezhOBs82n+/NvasbC+atH8NYed6hGq8JSP490Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9lGysKBPyAhxV7Qw/4sGAi02bOVAJ9Bp3/Xvrev0Ow=;
 b=tz5j0IpPbSNNoB/qhBRytNCPfQpBDl9KJtkRNre0ttvu6MtcaVpmJYfF8bTswGGl7ecD1iEQEKxgRe6DjI2alvHhynr91DZGcP5KjpKpBkVe6kZ9vX3J/os95d/LtUKMdF4Icy1LI4bHArMnx5C05PG0nMPLpxoVJz2gSqXnFSjl3VrXNFlnykHLGN2BiMJUv/xylyPWReIME8oMcDhDJQqRnNNfCN/wKcWs/uC9XKE35OyjNJI1mSULVrTRkkAFIz/vhvS82SCj9pVmEnG3mEpKYnTSR5aznhyXyZuBj3IkqvDi6fUuHZefyD2saRQgQW9Vr7njY5vHep/9cQyBLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5b085c78-d77c-004d-a74b-eaf952335ba7@suse.com>
Date: Wed, 14 Dec 2022 10:49:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 1/3] x86/vmx: implement VMExit based guest Bus Lock
 detection
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221213163104.19066-1-roger.pau@citrix.com>
 <20221213163104.19066-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221213163104.19066-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 577d2824-2bfa-410a-4d7c-08daddb87bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9LipWnyIGYcFpeGdC74+6hRHPbbkd3EFF5k3vHOIunzVxy807Kj8MoH1hmBMp9QMUNQ7m2qSJZ9qAh/3J/gBDLEsfyRvcbirc+JSut35Kp/AMmvufvluWWa5CF4ffOaNMgWEhXCw9JEiLdBCFTtHt8C6UHGhYRcWUE6J04g2GpyrBPhnahBRdYFYNIk88JUQCgZoVCPXDdER3q2dG8KkzJukM3a2m4QdSiiC3fguelLV0pK0puP38080xZXeksKxRb7HTP0d8f4sVjUDMxGnR418NBeIwUyjnpzAYUCA9tvPMSuAjtVu0Y5LA/N+nBJt0wXpLC70gpR6UXsEo8kRPna2iSxDh09l36fbWDGF6fsUBDGvqL31BIufE4yOH/BIa7/RBOpALtQHMJPWoTyfLqWK4fIphG2l//B1/4hsQu0Z/rMGks4eEvWcNDKKmrDQjLyrUN/GWDGZTlSPiof4tLj6OMs3wqZ4QjDAxr6bxSA0vExcyCKFWVhJyhA/2s+TzN/hGGRDE6vjfCMW1jqfW2F2WCGFpknYbah4r/CbcZsX7W8MmgmChjUmb4UBs/ufrqPdEQhpeIFVMV74Om5mZ1NJTL0O07TyBqWrnCqlOAad1uBlHpLDNju7HkmB7WuIHyeiaVKGQcMYKhqW/2dQEf8KbAUfGTFBu6Tr1D04297qC+NOpywSSy+2f2fEw7djzs+nvWzg6l+KqC/GNZtphhA/YyrJhA5abqGyiqSBqlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(346002)(39860400002)(396003)(451199015)(66946007)(66556008)(41300700001)(8676002)(66476007)(4326008)(5660300002)(316002)(2906002)(8936002)(6512007)(26005)(53546011)(6506007)(186003)(6916009)(54906003)(6486002)(478600001)(31696002)(86362001)(83380400001)(2616005)(36756003)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWVUWDFXZUQ3Ni9FNDg4b1NoNkh6SFhSajNweXRERUpUYUJJZ3FSK0Z2WFFl?=
 =?utf-8?B?K05Rc1FVVlZXQktkUXNNclNCUENVOXRrZGVUN0JZM1F1VGhjNFhzUDdjcmFy?=
 =?utf-8?B?d2k3OGE0Rm90Wis1WmJJcjAxZkx0bCtFVnZxUWRFSVJnSkh0dEkyTHJodTAw?=
 =?utf-8?B?VGFkaituY2lTVG1mQ3Nha1FpVnlITjBmSFY4NEZuY1pkZEFGNTBpMmpMbW84?=
 =?utf-8?B?dFl0U2kyYVBRRWRKWExQTUVNaWg5OVBMQnRteGV6VGhmc0N6VVRmcFpDRldQ?=
 =?utf-8?B?Q2NYRnhkcnF5TjFsZGs0UHBDeWpTV0c2WkxQTS9uVGdwOVpzZ0kyUTJVNWFj?=
 =?utf-8?B?UTdQOW9RcG14ZncycUNmYVpTcXQvRWtoZ3lyWEREa013MjFsaDE2aURkU1Ir?=
 =?utf-8?B?WVBhMTVoV205UVdaSk91MzNiSG5HVFcwS3FqMUhkbnFTRWw1T1RwS0t4Mis5?=
 =?utf-8?B?T2ovUjg1TklOUk5ZS3ZkN25uaTE3VEZVWWhzNFpyU280YVNJT2p5TktBL2R2?=
 =?utf-8?B?emVNVEFVcUt1TzhodVNMM2xHVGxzeVZQMnVPMzZ6dzhYNk9QRkZQbVorMzFW?=
 =?utf-8?B?UWFlb2RIeVRxTEJ1RkJQRU9IWU5nbU4zTWlTWUlJVFR3aFlnL0NjdWU3cUl4?=
 =?utf-8?B?Ui9xTnI5OGRkdUR6TCtLWUREdk5GUHJINDlGalg2QmFLaklZbFhHMmN3Uk12?=
 =?utf-8?B?S0pRRWg0UngrRllJU1lSUXMyWVMxb2hkS1o1NHM1NjEvZWQwR1ZsYXJ3ckRM?=
 =?utf-8?B?akRkTlNWOTc3RWNkQ0o0WmFMUDVpeXlDdnFnbEJBdG9rTTBrblhyU1grN3hB?=
 =?utf-8?B?MmdBb28wWTI5UGJpS3NtSTJGQnhrV1AvYnBwM2l4d1E1a2tiVXBrN1FIN2xT?=
 =?utf-8?B?MFFrbDBaT0RGaUVkWGlnbmYrdGRycWV6V2tOS2R0ZEltc3VhYVFvQnMyUzNQ?=
 =?utf-8?B?VWNIVlAzYTZ3WkJzdi9HQ0lyODM1TkJ4RFV6SmJ5OEsvMlVJbEtuRWpwNS9X?=
 =?utf-8?B?b0V6VHlsYUcxcElKQzZHQmM2WlcyUzljK3dmVnZEYWU2b2U4YWw0SFREeFFP?=
 =?utf-8?B?NXJPQkRDaUw5anBXb1I1NGtjSzBtN0s1RHJYNlR1c3pJcHRSbEJPWDBnbFFl?=
 =?utf-8?B?bkI5Mmx4bFJTb0Y4K0twYkR0WTBGS2wycUZwS2dPQThWbW8wWHppelhjdklV?=
 =?utf-8?B?b1V6alUwTFUwc2ExTUpvbzlwMG1IdTd4TXgyUVNxNVYvbmVSKzlUUFJRdEZ1?=
 =?utf-8?B?VXozN25xVlVUL21vUWhhVnVvSUJuTVFrYnVFU1M0bTYyZGFnRmlxclJnZEJ6?=
 =?utf-8?B?SDZjWmRNd3lnYmdrbmNMaldjazFtQjNJUjVBRU1taU1lQTc0ZUo5RUJGZDk3?=
 =?utf-8?B?Z1orTldKaTNIN3dlV1lMVEJjeE5XQ0QvMkJBSmNMT054M2dQbldRUlhVSUxS?=
 =?utf-8?B?Z1kwLy9QZ3Z3ZVVOK2JxQnhyK2l2REtsZkpuVnRENlFsTFo0MStTcEVVdERM?=
 =?utf-8?B?V1Q5WlhUU084cGVwMzVsZ253R0RMTm4xcURGaWRRWkZqRFVqMmROUjhmVDg2?=
 =?utf-8?B?QmF0T1VobW02d1RMMmxVa0poWTQzOTFYTEZ3S3dsajNUWUx5MXdxbEZ3Mm9w?=
 =?utf-8?B?clgvSk5WSUkwdHQvTzZ0OGQ5NWRNQU1sVVhFTnV2V05XQVlKS29XSnVxVito?=
 =?utf-8?B?L3hBa3hIQXZKdmNHajk4NWtqU0JjbkZGL29LaTJ2ZTNCRkFJN2tUK1hNYkVZ?=
 =?utf-8?B?UUxtcGg3Q3cxMGxYS0RPS0lSZzJyMHJIT0xNWFovaDdtYWFSNS81UkdkdXB3?=
 =?utf-8?B?UUNzT3RuSTNkWjlVM01SUDNMSXZXakdBemdqUTdDanJ3SndnaXJpaU9JaC9n?=
 =?utf-8?B?czFwSVZzalJ2eVlpZUtERXVQdU13ZjNvVTZnb3NPWDJveG56bjUrU0pVbUN1?=
 =?utf-8?B?eUdrOUlKU01GUHN4dnpaaGlQMjJiMUhFcytMOGE4MXdpRHg2Wm9YSlc2Z3Uz?=
 =?utf-8?B?c3g1dnM4ZzVveDh1ZUw5eGlDOXRybk0zODdscnlGb1NkTUtZNGRyelhnbE1D?=
 =?utf-8?B?cm1EN0E2ZnRLLzdxSThZYWxwemo3blg2T09HL2VXeUpQRTU1NXVHMi9HOEpE?=
 =?utf-8?Q?Q+GfrhuZc+sx00htETKUAnHvL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577d2824-2bfa-410a-4d7c-08daddb87bdd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 09:49:24.9262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+7Q1kcwQpPU+3qceRdx6W8Miu74fek0TnsaBGS/p65XjmwsdmnNJURjfa1yrtts44LBwmXYyikXcq+7YurMCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8530

On 13.12.2022 17:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/perfc_defn.h
> +++ b/xen/arch/x86/include/asm/perfc_defn.h
> @@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
>  
>  #ifdef CONFIG_HVM
>  
> -#define VMX_PERF_EXIT_REASON_SIZE 65
> +#define VMX_PERF_EXIT_REASON_SIZE 75
>  #define VMEXIT_NPF_PERFC 143
>  #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
>  PERFCOUNTER_ARRAY(vmexits,              "vmexits",
> @@ -128,4 +128,6 @@ PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
>  PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
>  PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
>  
> +PERFCOUNTER(buslock, "Bus Locks Detected")
> +
>  /*#endif*/ /* __XEN_PERFC_DEFN_H__ */

Is there a particular reason this is added outside the / another CONFIG_HVM
conditional? (I realize the one we have only covers part of what's HVM-
specific, but it would be nice if new ones were constrained right away
(unless there's a clear expectation for them to be re-used in a more general
fashion).

Jan

