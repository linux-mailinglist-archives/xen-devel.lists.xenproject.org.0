Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 445F16BD48F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 16:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510693.788859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq0m-0006my-Vm; Thu, 16 Mar 2023 15:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510693.788859; Thu, 16 Mar 2023 15:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcq0m-0006kO-T1; Thu, 16 Mar 2023 15:59:28 +0000
Received: by outflank-mailman (input) for mailman id 510693;
 Thu, 16 Mar 2023 15:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcq0l-0006jS-1f
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 15:59:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 856a8bc3-c413-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 16:59:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Thu, 16 Mar
 2023 15:59:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 15:59:22 +0000
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
X-Inumbo-ID: 856a8bc3-c413-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ErcG6GOmHtU4yjciHBqiIBTd+Ate7sIhSbi6rM0ydCvC5J7MNbRrUMG47vgCUsyZVKMjxMXN1z69XHUrJoGxMPGPuyHdVm1+4FD1ND8WVANGpf6BoxmQ03+V0nXalgTxQT3VMR6e7rrIvAU2y/FEPPhwuQmF7fFw9lDB0yHYXkHxYatQgGArGPXIbeVTidrGaGNdmiyfakNMvLSIJ3EqXt343CQ3uXtTYgMl7BYqYi8SwkmyMVDEVmnHE4Lcrt87SHaf183v7zv++LbmHNV/CS0SNwW++xRuvnc232DuDGxfxzSnQLpQftujo1O+ImbBcYhkMMefrK2lHVlTyuLaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZf6vndkj+NyYVflg6jDph+m3aDgThn7xs9JGKBt3V8=;
 b=N3HZRdbbVTWyOH07Ut8gsaCs+uO/KB+5UhEiZUVIbohdisl85evZDlzv1aE+Yf4jOtHhc01doswdamKzABTQ0U1rZoyuJRbZUlYLD/b27DNqlTkQtUkXh4yx61EtFsJAE6rIQs18VwFPJHpRF0skeU3B9/i056uNVSkSnen1YPQWTQ2UH0mLxgPnLawMXrOH0Eblb2IbVJkjqKFvOPyPbvdwHWt6loakiqISFcJaeI3CVOO3/KugaIK5ldA6jAoHilISEQjKCVmj0hPxprUlwMnbGHm/Cp17WoWFYISHazc4PQTsGrF9hmqJi2QKzRu5GQFJT+wGC4jm5ANvdJE82g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZf6vndkj+NyYVflg6jDph+m3aDgThn7xs9JGKBt3V8=;
 b=i6hAXO9R6PlRXhuDmPIQ439ANgWThA4e31VR+bNzg8h5MqJs4S8/nV3Pyyfx17bNNgzAm79U0tsOmms1EDhsum/LAz82iqkgM9OzDiQTGAcM6AcvNbLPW6e15SxSTE18jdgxuVjAQGn1KHVFa+RMVywqrYQ/gkciFGcsYS2GNgwsAnvnbNstPqi73PkTjDwnNEnQ18J6q+y4GY541C0AFTGFwK2weyO0JfKVAz4Ev335v5rkAfZZSQ6EkwrDV/y13tWkoRWCVMFkoqF1Yy32bEIx8X5eNSSLdN9BSjZq3QLs0l2GIQ/de2GIVljeJ/KeyeJxoJjSfei2yT4vURNPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77bcbd53-beb6-6fd0-d272-f0c9e2f95605@suse.com>
Date: Thu, 16 Mar 2023 16:59:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Aw: Re: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression
 from Xen 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c552c27-1800-4788-7f25-08db26376864
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ghQ6EZK6o48vHarzsb6rfEWXP1QlRz2N07xQ037Qdrj3mKssEi6/NRVIJIdLqJXZv0TmpzzGpStm4Hc02gClf89kRexH7jTUknDxcafCpQQTOEuHGMvBuWDtgCdH74s54TRBq5LCCgcS/WD6n73/A4wem6kMIX/nypAB514FuOqBSP51PZyo7rUcYnclcLZ0i4+F4iUFRrhrYqBKZR07yR2G4Q3U5BFVIWZNMU74zc9aDq4RhWaLoYMArBO6OS6k5LMy4lWdJoDsvVrRWDnP72WUsMYtnFgJTinN34I7WZWs/WSLcrm6BzuRiit7Jq47UPRQyshxlatLSE9JNl36VH+cnNPGqmlNe8kWYDhrFDy2Cf/G2M9cR3h2rpSWQ5OXgOypwTkaS3FXwT2j7uZCwslkF67TSe3m4Lw5cdvPxM7twPY+DlcxUsrU1B9t13z8srl6Grt4C/RJ1fpNKZxtRoas3Qfu1LmeZul6NJnYEdTmuQd1iq5gv5lrMt16YSVOEWu46MK96Qf3nGBxTHXmIeNdgdzlgrC5JGO8t+3BLC5J1KusLaUCCRuSkuOKxFAj/952u5pw8+MoT2WYSg3VowfB+wHsktyaEUNn34DdWkGwtpLvJtTX78TzGgnNrLcc9um6u3tnBKBrxGSer9LldPhMEBWhiTUW/bHyxIEU9EFWLyRNF5YMbHXhpZr8tBUJkQAfJbNk4vtpd5mHlq3QT0nKYIASLEIvulvE3E3vQgM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199018)(31696002)(38100700002)(36756003)(54906003)(4326008)(41300700001)(86362001)(66556008)(8676002)(66946007)(8936002)(478600001)(66476007)(6916009)(316002)(2906002)(83380400001)(6512007)(2616005)(5660300002)(6486002)(186003)(6506007)(26005)(53546011)(31686004)(84970400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZPNWdmbE1sb3hJNTVzSW9aVndlbEhJT2ZEYzBaTDBZaVp5WVZ4U1AwdTky?=
 =?utf-8?B?dVB6Y2JaMEFieTh3eFZURCt0ckpTQVNScTNoQXQ1dmRjSEhVMGdiUnVvbVZI?=
 =?utf-8?B?eDFDdmtpdEhLVU1JQXpzbk5WK2VDb2hYUGNQaTNpTnZ6ME5LUEZza3lVNVN3?=
 =?utf-8?B?K25lL2I2T2pSam90SU5uSE9abXdVbXFiSXloR0Z1ZUllWUFHVnNCdzdEMUdT?=
 =?utf-8?B?N2M3dzdkYXIzVWJFYm9pbjE2aU9UckxyZFRHb3ppY2FSemFZVzNPWVpEOFlL?=
 =?utf-8?B?L1ZFdVdHclRIZXpwVzFjcDlubE1icHJHNFduZTZFZzdwSWZVeHg0MHVZVzBW?=
 =?utf-8?B?UUZnRk5rK1NQa2E1VnVRd2YwSlFmV0h4UDJRZVJCZlY2RWpMeWtuSFlKMHRH?=
 =?utf-8?B?Z1VVakI5SmJCbTk2a1JyN0RYM3p1cFdoZk5RZUxhVE9QbXYzN1gyY3dndklV?=
 =?utf-8?B?UG9xbXFXeHlUU1ExZzhjVEtsNG42SENuS3JiYlhvS3oyYzB4NDRiYmd1Z3ZQ?=
 =?utf-8?B?TzN4d2J5ZjZ2QTk2RGNjRG1VOVBuUytNR0RodjcraFRYOHBEZU45cGtwZ2lX?=
 =?utf-8?B?VWxiUWNnNzdoVG9Wc3BHVUE5amVMWS8wTVV5ZHJwckU1Nk5xN0J3Sngxdmsx?=
 =?utf-8?B?djlYeDI2eUF3YTRMYW8xVlErZU1aUnhTeDV5bG5kcUNJdGZGRUpHVFBJakFt?=
 =?utf-8?B?WWFvYUZ6UWVmZzQ4TkpEbGMrdUlZMXd6UG1xR2JqWjl0WnpYWnF1azN1aHNJ?=
 =?utf-8?B?aE94Z0JPVW9scFRLT0JqSkxUUkJNZENtaGNvcnBoMStrcVNKWU9SZndoUjhw?=
 =?utf-8?B?YURNUVk2dTh6OEhEVXFQQnloeXlxT2djQkNXK1FZNXA2SzlsOFhWY2xnMm9t?=
 =?utf-8?B?R2NUSDB3emV0STBtVkFZKzkrajRrcXFyRHQ1cjFIZnVvdEhxeTN4VUZYRDh0?=
 =?utf-8?B?WHp3Sys0ZE1scmFQZ3diUlNDa2o0L3dtbmVwdlVMWGovTG53Sy8wazlmNDB5?=
 =?utf-8?B?bmpLTzdScCt6cEI1dTdCUDAxazRpU3kramYxVUpzeEZScjV6SWoxVVhtMWZL?=
 =?utf-8?B?eUVValJWN0h4akpFWW0wVUt3dW9NWUgxVE9mNnAvd0YrKzJZWkpxeXIyczhy?=
 =?utf-8?B?dmhZMVFiWmJXc1dZRXJpc2R3NG9VeXlDKzladUhvMDZReExrT0JnZUZJamx4?=
 =?utf-8?B?dkVBc3FDYW5VOWZ4RmdubFRDL1VWNGNnOC9COGNhSzdmcnJ2bldDS1RnSGRZ?=
 =?utf-8?B?aEYvazdVTVJUUEk5U2VwSWU2anRxdVNwODhVSHh2RVg0RjF4UExXcm5Rd084?=
 =?utf-8?B?akxRME5oS3JqU3djSXpEc0trZUdSVEFnYmdVc0JRYUdxMVAwNFRNTnhCQXRV?=
 =?utf-8?B?TXRXYmdkeEJSWW1pSGNBVTB0QUZ6Vk0wUU8yNGNZZ2NhdEtOOGNqejVwVGdD?=
 =?utf-8?B?MlFnVDltZGZXaktrREhqTVd5K1IrbTEvcmFRVHdHTGFiZktGL2J6RHhrZWdI?=
 =?utf-8?B?eWMzNmQ1SlcySFEvWGtkUlE0dm9Fb3V3Mlc1T1ZTS3p0bFhqRkkvNUM5SThv?=
 =?utf-8?B?NU53aGl2bTU5RU9Vd05iWDF1aUJ3c2Z6enRkOTd6aXJUbXlTMWVOeDRxOVVX?=
 =?utf-8?B?Vi9WY09CZVg1ZzU0d0VMRmlSR3RIeEVaOEUwV0ZTaW9KUCtFWDJ1S0NOZVcx?=
 =?utf-8?B?UnFlWDR0YWsvNDI5TEFnK3g0RUtrdTZFNk9EWVAydDEyZ3Zub3NjZlVTenJm?=
 =?utf-8?B?dTE5d1JXSmdVVitncVVhb0RWekJmTWNCNjRMem9mTXlFdE1IdGpGUHBwSDJE?=
 =?utf-8?B?UDJZMmZ4YVdsTDV4Y21Rd21Ic3FPbmRscVRvVVEydVF5QnJtdElETTdSVXBZ?=
 =?utf-8?B?SjZkczF4KzFJalFmNFFCRjR3SzVOby9JRlI1N0VNRU94ZzFCcldDZnB6UGZH?=
 =?utf-8?B?QW84UWp4ZTdERTE4N1lTR0hQdmU0S3JjRDhqK3d0WWN2a1JzZllTSXdka0FP?=
 =?utf-8?B?MU5yK2ZsTW5SWkFydzB5eW10cU9uaVloTHNCbFBIYk9IMWFEdDlOMHZaa0xK?=
 =?utf-8?B?MjJXZTV1d0pXMWZaalJvYlBFR2xWRU52RGh0MmJuMVFwYXJ4V1BZempPL3E1?=
 =?utf-8?Q?1SBP1p2U5se1xkVW6TK8Id5er?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c552c27-1800-4788-7f25-08db26376864
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 15:59:22.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FEob9x+e1AMmH8MtPQUbQeEykwk0lkZKeWci7bX5YKr/WOYjzfmLMoGB+IURrK5IjThYfRkwc8tEYr7/elnX5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9642

On 14.03.2023 16:11, Andrew Cooper wrote:
> On 14/03/2023 2:53 pm, Denis wrote:
>> On 14.03.2023 07:37; Jan Beulich wrote:
>>> On 14.03.2023 02:15, Denis wrote:
>>>> On 13.03.2023 10:36, Jan wrote
>>>>> On 10.03.2023 21:50, Denis wrote:
>>>>>> Should I test something else?
>>>>> ... there was no request for any further testing here, for the moment.
>>>> ah...sorry, going by "Would be nice to have this confirmed forthe system
>>>> in question, i.e. without Xen underneath Linux" I thought I could test
>>>> something which might help shed some light on all of this.
>>> Well, yes, that Linux-without-Xen test would still be useful to have
>>> results from. I didn't account for this in my earlier reply because
>>> I had asked for it before already, and I did take "something else"
>>> for meaning anything that might have turned up as useful from the new
>>> data you had provided.
>> What tests could I do or what info should I provide to help?
> 
> Can you please rebuild Xen with this patch:
> 
> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c
> b/xen/drivers/passthrough/amd/iommu_acpi.c
> index 2fdebd2d74c9..747eae25f56c 100644
> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
> @@ -1033,7 +1033,7 @@ static int __init parse_ivrs_table(struct
> acpi_table_header *table)
>      const struct acpi_ivrs_header *ivrs_block;
>      unsigned long length;
>      unsigned int apic;
> -    bool_t sb_ioapic = !iommu_intremap;
> +    bool_t sb_ioapic = 1;
>      int error = 0;
>  
>      BUG_ON(!table);
> 
> which should cause the behaviour to revert back to that of Xen 4.0.1 
> (i.e. it will fully ignore the checks relating to the southbridge ioapic).

Alternatively you may want to try the change below (I think I have now
convinced myself that the state change is still possible at this point
in time), with the intended effect of ...

> Confirm that with this, and booting Xen simply with `iommu=1` that full
> DMA remapping and interrupt remapping is considered active.

... DMA remapping active, but interrupt mapping off (i.e. matching
Linux behavior), without any overriding command line options.

Jan

AMD/IOMMU: allow DMA remapping to remain enabled when there's no southbridge IO-APIC

The original Linux commit that our respective code was derived from
isn't as heavyhanded as our cloned code: It only disables interrupt
remapping in such a case. Follow that model, noting that it is still
early enough to turn interrupt remapping off on its own.

Fixes: 06bbcaf48d09 ("AMD IOMMU: fail if there is no southbridge IO-APIC")
Reported-by: Denis <tachyon_gun@web.de>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the alternative of disabling per-device interrupt remapping
is undesirable as per XSA-36, yet then again it may still be better than
turning off interrupt remapping altogether. Thoughts?

--- unstable.orig/xen/drivers/passthrough/amd/iommu_acpi.c
+++ unstable/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1183,7 +1183,7 @@ static int __init cf_check parse_ivrs_ta
     if ( !error && !sb_ioapic )
     {
         if ( amd_iommu_perdev_intremap )
-            error = -ENXIO;
+            iommu_intremap = iommu_intremap_off;
         printk("%sNo southbridge IO-APIC found in IVRS table\n",
                amd_iommu_perdev_intremap ? XENLOG_ERR : XENLOG_WARNING);
     }




