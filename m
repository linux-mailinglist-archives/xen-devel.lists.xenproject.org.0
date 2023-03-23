Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BBD6C618D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 09:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513684.795054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGDd-0007Vg-K2; Thu, 23 Mar 2023 08:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513684.795054; Thu, 23 Mar 2023 08:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfGDd-0007Sw-Gp; Thu, 23 Mar 2023 08:22:45 +0000
Received: by outflank-mailman (input) for mailman id 513684;
 Thu, 23 Mar 2023 08:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfGDb-0007Sq-UL
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 08:22:43 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05a3e1b-c953-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 09:22:41 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8236.eurprd04.prod.outlook.com (2603:10a6:10:245::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 08:22:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 08:22:36 +0000
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
X-Inumbo-ID: e05a3e1b-c953-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzKUtBgsP8oZyY1NdnZMG9w6szom5UQnaeShIB/jUbPyIYrTt0GrNGwQStshXw+eWFVqubTposJOGNBNUEg1KF3/gtkLCPixVzbqB+kxDw5P4lNAv05kyDRJafg95tXXOhXc9/X2ey3kaYpRHTWPsNvNYFhZfdI/dz10dnAsCSMfZIqNiTrLid/IODnfEUo6kg4u7/Eflj+g2Wmw4/3koN9ZQCYTCwlbBSLmUiC37TcXpoZDq8Zx/DwrnQghyekBNJ6pxgHmDRoMb6ISQ0UL08RsQTlAcoPwx9PVkEDD8VMffGh/tmVRPm1h9z9IMtaC+8zaI6bZir1IbuDf/8/61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSvYwoib5DH5FKwteqcEQP7Khci2CxcJFttYEbLgq3M=;
 b=L6uxtKOaP7M8jY40J7qrBaIKLEj347pr5QFliBuV1GbKJrEVIIM2WIavQ9FYiJb/1CVPmitvKdq3hCnsmjSOcDo9jxgJuy///9WVrZfil2GyDVBcjyyUF6r+PEz/Ts6vMYqAPtvPXoaCVALLSbMoZElGHJwbi5X21leGHY8OxrzqtaVjcbXUoYBsPhqt+zJbpUeWkBNnjRsWm5FBHHzAEVY0tcV15ECBWWba888BxbLyJvkf49QXn6QYMGNJuMzNs2wCcjTWsvujIPvVyrRbRs8vmeVQGXTP0oCBU/D4UcrkmUHmUvLtme5p3fGMbi07yE6WQ2FruZiawRLAhbAmIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSvYwoib5DH5FKwteqcEQP7Khci2CxcJFttYEbLgq3M=;
 b=QpLrIrfoKdtRCZNYhjnivgclAjLA0GKcqgePTUj3HYSNy5NgBNx9y17ATV2Ak90cmSKnA7dKo9aQV9GaT8tQYOmixgPp+xp4tcYJkKBc+96PUDkGb5edhEOZjSbJyG5NjMcqOKtNYQnSMHSMqSeVD9rtahp3dPd6W+TYVE+RFrSgvwltW5K439d2trUP3ROMtq1UyMvcD+F0EH8LKdg6vmr7d8hMCbnRptqAscPwSGcVu8xE/fp4Kh96n3NsgBfpmnRa4GWj31/vKPTQXmBrkuon7ZsG+wV9GWjjveLvSwjn5BKP5qesJDJmz+tMmSswSjHahE3PwtaJOCw18sajvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <49127a0f-ad21-a3ef-f096-d0f41f99aca4@suse.com>
Date: Thu, 23 Mar 2023 09:22:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope
 contains phantom device
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "Marczykowski, Marek" <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230314013221.124930-1-marmarek@invisiblethingslab.com>
 <BN9PR11MB5276832A2E3F31FB7695D0098CBE9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <3242c56a-7a95-4fe3-3195-bf25738da351@suse.com>
In-Reply-To: <3242c56a-7a95-4fe3-3195-bf25738da351@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8236:EE_
X-MS-Office365-Filtering-Correlation-Id: 429d73cb-29ff-4c8a-6f29-08db2b77c1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	isgLIeL2bEvBQTA+q+9K68dZGT3UAZp0EOvrq2ej2fPvgqGR6g2/m9NOVOXQ1LZ3qLRp5t+nOwDbLilDxQ3oeTlDNu3cDK3WU1K2/+Fh75CGvFJo9ouKP4T4YutkOPy7uQXkHlOsb91U8AGAcZp/TDm6iX90FXRUkCmXmdp9VBuqV0K/41THiA+y/uQQYXADFtX27+vTVm8mGngy4YbQME4va8zRKfuArLZTIYkakyTk35hTv7QeycC2odJwuyvaRvNdPcRQVB0G2BWCM4zsiNjjM8xuPoI8DAdHdNnccPVt0Ghk5HZ+nQSNUxylKgAIt9hJOsDPS8ubYY9Hk5Fz3/B1B6n+HcpCcSz+cDS6lstE2jBulnjbk9uWZfZj+Q36TIUYb6w1tPAww1sI/cxK6F06TX9rfWPogINcSRhIf9JJgflwjkH9Nwynp4lHcJhnrBXY589Rh7hc6T2T4lEdIHR1aZ5itgm4G5kFzPTdMuR88RE/JKRJ2NOCryVO4K0CZ+izV4eugiuAtA7fKTnXSdSeCL1C+boCbBHECV15INel1i1QD1X7FP7cwCQeIQAU7J5rVsoAxjIc213GmTl69vHZbUZ4SKt2YOQqm4406uHZdTdIDZqgHsU6j6blf/aasXzhQvFLJk6u6IvTemKj0Jn5VuU8nSzf+icajQvHawxa/oLZNUwsJn2OOY2ur6/FMxlcKwtyfosA8I1U1ERT00stgftnqO3zA7mS7HZfamE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199018)(4326008)(66946007)(2616005)(66556008)(66476007)(8676002)(86362001)(31696002)(478600001)(6486002)(31686004)(41300700001)(8936002)(53546011)(5660300002)(36756003)(26005)(6506007)(6512007)(316002)(110136005)(38100700002)(186003)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0xycDZSbjJsbTN3L3l1dlNVWnNjTlg4cElZaGU0ZGtZREFTdkVOUGJrMVFF?=
 =?utf-8?B?SkdoaVdHQVR2TUZPWjJnZSsyREk4RE5mdThoUlRyYUY2dmlVR0N2eUIzTXRG?=
 =?utf-8?B?L3IrWmFibXZvZ0tRZlVnbFd0K3VIV0loa0ltdWVjdnJ3alpUMkVxcG1iajVl?=
 =?utf-8?B?cUNBRkxlRDNaRlRyZHlzOVRrZis0dWRINVU2MHBZVFdJWjFOQU1RREFEckp5?=
 =?utf-8?B?NTcxR2g3c0VQUml5bGkxOWxTSlNGUU5rOFRhUUhLeW1lQVVBTnRQMmd2L2c1?=
 =?utf-8?B?SVc5c3pTNlk4TG9rNXdkMENyaWxDb1ppcmx5czdIdDBsUFBsZUVqbmdzZHhW?=
 =?utf-8?B?eTJST01VZVdKNG1RdXJJcTUrNkx6RE9ZRG5qTVVhWXN6RGJtNmpmOUtodkxF?=
 =?utf-8?B?UEtxdFpocWhIdG5EekltQk5la3h0R0hMTFhlWlFjOWliTFJZRmp5T3cxZTMx?=
 =?utf-8?B?UHkyVVRhQ3NhYzZYQllhQnY2Vk1HcW04UEZpcTIvVHRBQUhaTDk4Nm1TV1ls?=
 =?utf-8?B?TTM4RFFHMENNTnlWS3hyNDdvc0JBZ0pldCtHRHJyamNpcEhSRURickpxWXlm?=
 =?utf-8?B?NlRLUVUrL3B3V2V0MW4rNUdpTDQ2dGFHdUpvaHVaUHBDT2xaUVMzbU5aU0tn?=
 =?utf-8?B?M3lVRW0xZU03cVFnaWlxMVJUTzdJRS82MUU1RlY2S0V1NnY3WVlqcWYwb20w?=
 =?utf-8?B?dEUrbTNkWm42OTNwd1k0RGcwSnYzUUJzbWo3N0xlK1pDTzBIeG1uaWNPS1JN?=
 =?utf-8?B?YS8wTmR4QURONVlSS2M2Z2lHTENtcVNhNEYvVjR1NTJxeTl3ajN0NUJXVzhw?=
 =?utf-8?B?NktrUWFIU0JJSTZtSk8weW5XRU5USmNlSy9seDNEN2JKc3FMZHJVNVNDRTlY?=
 =?utf-8?B?Z2hEdHBMY1dlUFdqWnZyV0J5UUphK0Vybm5JS0l6UXFGdjk3WDI4eUxveFBW?=
 =?utf-8?B?bS9tTFRheGFPdVF3Y3U1TjIvZC9mQWw1WGtMZERLa0NXRWxRbkhxRjVBTExy?=
 =?utf-8?B?RnlFY3pZb0xPS0J6ajYwTlg1NzZrZHpTRkFFN3lIVUxqaGpRUzNLQWlZc1B5?=
 =?utf-8?B?aFlmdjhBOWhSbTFkRmJNTmdlZUpTTkpNRDZBMTRQSVVxcmNXZmxybm5rRWNi?=
 =?utf-8?B?ZzczR1lteEVxQllIaG9pYk9rTmJ2RjcxU2xKNlo3SDdQWHNzRHpJbDBzMHhJ?=
 =?utf-8?B?SllSc2ljNS9KR3lQb08veGRkUmdQUzdHeGwyUi9NbVlONU5uL0V3QW1IRUVP?=
 =?utf-8?B?VXJZbFRNVFhLejhKR043Vzc4Nk50bStzS0lMdFRNTGdGK0t4MmhwdGM0anIw?=
 =?utf-8?B?NStQbzBocU5ZM2VtbGIrM2dLQjBqVzZSL3M1RUdNbXA5cEdxMXFoV0VFZ2lq?=
 =?utf-8?B?QzNVZFFzWERXU2YvUzc5djlIWWRHUG4zUHJiT2hwNHdIZktZaGNZWDZSbXAw?=
 =?utf-8?B?RDRTVVlMQUxFN1BGRStEbklzbnpzcDljRCtkQXZPV1laNXRNbloxL2R5YXo4?=
 =?utf-8?B?WGdOU3o3eURUQkNIZ3lta2k4Y3JROE1OVDVNMStkckYzb205TStEb2xwLzBm?=
 =?utf-8?B?TEoxcjdiQ1VPY1hQQlo3UUJhQklZb0FEZVlTNG0xM2QyZDRyekxMckpIRW8v?=
 =?utf-8?B?TWZnbjRwdHFxN0NiMGMxb3NYai82bVA2bFlXVTdlZURPajFzSURhTWJ5amY5?=
 =?utf-8?B?MUlKWXlFeThqK1lhNDBWT2pKaWJ2dmFSaWxCRzFaaWlKbURVNkRRSk00Wkw4?=
 =?utf-8?B?MDVUVlN0eHcvR2ZvOWdXSGZtRXdCdE81cHhWajNKQlMwTkR3a0Y1bXlPTXdX?=
 =?utf-8?B?N1dNM3lkTkFhWVV3cTVLdERTVFFpcWRobHU3c096c1RsblA4SWNwd0d1TGZP?=
 =?utf-8?B?ckdwa3Vnc0Z5MlRLS01LNFpZUEQ4ZFVyRXd2VGVIUFpwaWNOaC95c3U0V2dq?=
 =?utf-8?B?bTlhNllwOFY0OFVuUFh3RDlrM0svdHVpdDVHVisyMGx6Q2VuY2lEYlp0eHdq?=
 =?utf-8?B?ZUtRdXNIdldrL3EwQmdabUFNZ050SnRXcmJuSW1OSmlCWW9jd3NtQktsa1FO?=
 =?utf-8?B?czk0Tjl0eHh0MWw1Q1grNlJvcHlnRXVmSkE5TktkODRqdXNIZDU4TlNiTTNL?=
 =?utf-8?Q?E6R+SXqXq7xK75AkpZDBFVxxs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429d73cb-29ff-4c8a-6f29-08db2b77c1f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 08:22:36.0212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVEfkcSa2QV18WDCp5L8UKNS35NEYtGBq5OmwyuD11YjjGsc6DxsaQ4gXp4atp06/R+e1GW/3zmPp/3SUCgo7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8236

On 14.03.2023 11:24, Jan Beulich wrote:
> On 14.03.2023 02:50, Tian, Kevin wrote:
>>> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>> Sent: Tuesday, March 14, 2023 9:32 AM
>>>
>>> If the scope for IGD's IOMMU contains additional device that doesn't
>>> actually exist, iommu=no-igfx would not disable that IOMMU. In this
>>> particular case (Thinkpad x230) it included
>>> 00:02.1, but there is no such device on this platform.
>>> Consider only existing devices for "gfx only" check.
>>>
>>> Fixes: 2d7f191b392e ("VT-d: generalize and correct "iommu=no-igfx"
>>> handling")
>>> Signed-off-by: Marek Marczykowski-Górecki
>>> <marmarek@invisiblethingslab.com>
>>
>> this should be rebased on top of Jan's patch.
> 
> Right - I guess I could take care of that while applying. But I wonder
> whether the description wouldn't then want adjusting some as well. Or
> wait, with the v2 change it should actually have been adjusted already,
> as the igd_drhd_address determination is now (intentionally) also
> affected.

Since it wasn't clear if/when a v3 would appear, I've done the adjustments
myself even if originally I didn't mean to. I've also adjusted the title a
little, first and foremost to replace "phantom device" (which has an
entirely different meaning in PCI).

Jan

