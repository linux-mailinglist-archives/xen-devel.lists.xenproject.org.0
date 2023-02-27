Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B316A475E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502829.774835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgnH-00051O-DN; Mon, 27 Feb 2023 16:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502829.774835; Mon, 27 Feb 2023 16:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgnH-0004yO-A5; Mon, 27 Feb 2023 16:56:07 +0000
Received: by outflank-mailman (input) for mailman id 502829;
 Mon, 27 Feb 2023 16:56:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWgnG-0004yG-Dz
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:56:06 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ec5ee76-b6bf-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 17:56:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8641.eurprd04.prod.outlook.com (2603:10a6:20b:428::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 16:55:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 16:55:34 +0000
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
X-Inumbo-ID: 9ec5ee76-b6bf-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cA8WQKWUgoLB54fKstOXVAzWhEb+2Z5KgBcBMMuSIGu7+xsiDHRSAM99PiJZi781Ul9g02ahtst4xA4ZlPu6MgL3d7Fzsd9qGQZAgNSYZhC4uKUJL+23EIixidIR8r9pQlHYDUN/gaYRB5t6lIie77fT9Nati/JFqnFRQO9Qk73UGQ7Z7J5OCQ2mX2V3TnjWpGOl0iAFu39ey/42ctj6k05ZiZY2f9vlkXSE59vFOH9DNED8FXTDtXVR9CGU2Reox+xUKoLdsQl27ouiSgnpQO3fs1nkPTpbxJfrT5q2sVKImOSuttC2EJioZKW5s6kQCdqGwRgcPoFAGCsCPE7otg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0J3ewT9MFOG2BqMeY/Msa0rH9hQug4Apo/qJD+XOAF8=;
 b=B3MjriUBWvm3En64ggj1lH0BLwkc+avphNkhpkqIDSb+gE8x9GhR9UK92AQZSXZ2OLDUrXPyDnRcaArmjxXZZAr8oKhVIIKoHThz6GcnMvHwQNCWzP6Mqu9K2CvaZiMzT/+3PQXN9fiVHifLb6bbolE1orLOKNsGsVjFSTCsdmuukZdChI/GRYTrKtPn4aOyTy6yALidg+Tu5MezIhaaAPR5qKX733ZkI4gD2SikRKEe5jg7vqyB6iuZdg7HK8j0Edw1YvS+UKpo4cDltFxnV9ODu888aJBDi//NFV2q017MoyUbcn3y/qgccBg5Ol/2UnNlIK6AalBdgSuZthFLVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0J3ewT9MFOG2BqMeY/Msa0rH9hQug4Apo/qJD+XOAF8=;
 b=wdIVj+plSPcpUx53SrMERzJ6FV4szQVL2G8DBJYjZBNjL/SCkBPKljdpBP/gwt3MnOXbbGOP1vDtwZ/1zkLW2d7Hfm2Ykwa+eD0KScYU8/mxlohGJityRseOYh+kexYOJT/vBvrUCFLN9Cv3Qm12w03+ULCeRoypHcq1glr+iGoZjN196O8XdSwUueCyejytT3GT7LlEKd7LObFvf0oE5RdI4a1oRSQuQs2MnP1rN7jg3Ialmosgvq7XjPrVjJA2kzpwJy2K4UDJK1zEhpPnPRCeupKe1xQfVELBg0NIMYIsZmybpqZqJAStHwGB6MpTsSY7d/429fn0/HAncxWkdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0914b98c-0813-d28b-d150-c26d0c37a132@suse.com>
Date: Mon, 27 Feb 2023 17:55:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] IOMMU/VT-d: Fix iommu=no-igfx if the IOMMU scope contains
 phantom device
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230226000822.42384-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230226000822.42384-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8641:EE_
X-MS-Office365-Filtering-Correlation-Id: a8684822-a424-488f-0cca-08db18e37103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dlyTyBtZiJEEmVuVjHtjLJtuCjv8cXmOn7eAlGLLYBftHHULXT0BWfI9u0i0ApFBDtFhCViGd1F/hMh5EyFNXlej3+8Wp3TVkhXDuHoWT5PH3JoJxcKJmiXli8ka6E6dUOqUUHJNoKXVGYvwbjJeFx0QRcgMxdlTJLqa9EaBLYMylpWFhObI8QKuPfYp8cbykaIN33XdaohcES42po0QuRyfH/jS4B/GvpTbw6XFFBdj27e+n9lc97+4N23ir9AaJ5WFpdnMmitU3HhUeq3RbF/CmPoetg57II/FfS6CZywam31WdSWxn610wmDTsVu52N3OSB7G5J3vaJB1e19Va60+mQWSWiR+UU3AQ4BoZcvudhgugTEf9QJroX9z6mIo6l4m4RNPKNr8tSeZCOLxy0oRZhrFGWu10ectxh0uk8mxmEiF1DcoetvWVAQO2fjBnVY0ytacHUZpTYFekPsP34szs8gZvV6Ec094bpSBGG+iNL0HeE63TL2o5yMXuMT+yqDL4M5MR+9vN/bEbGxWK8wuY7T0Nes9H7xVCi2SeBvMFEvSXTS5EvKCg5mLIldXr2PKoT0+AWTOKHvocDVL91Tp8w2kf2ZpORpNi4smzYLhi4dzGbTcxojRStShzzgpfOqxpi1skLuqK8+yqO37/Uv+FQ/UNDSgMPUMaNC9RVnO9uLUHIFPSS+0wOqSdYbxg0+4QOFMUb7kL5yd2SFyBSX9KdjuwUIlfGIQFz2xH5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199018)(66899018)(31686004)(2616005)(316002)(36756003)(31696002)(86362001)(6486002)(186003)(8676002)(5660300002)(2906002)(66556008)(8936002)(6512007)(66476007)(4326008)(66946007)(41300700001)(478600001)(53546011)(66574015)(6506007)(6916009)(26005)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NG5lcDRrV0tkVlJGbUJ1TnMrNlgzOVI1Q2xTVXpnMDFybnEyT0JqTFJGZGh6?=
 =?utf-8?B?QUp2RGVlVUxTbEI4SUZCV3lpekhDcTNkUS8vdTdTeVZRcC9hQnZKM1M3b3lR?=
 =?utf-8?B?RDFXZ0Y4RUtzaUN6c3NaR0p3dnZaZWRiVDZ0TnQweEgzclBUd3I4TU5ET3RO?=
 =?utf-8?B?Q3F6T3g0S2VxdytWQnU1WDZHcmh2ZFNhUlhDZmk3Vmk3S2RHL0wxTXJ5aW1P?=
 =?utf-8?B?U2pUZjc5aGUrUUExVE1ZclE0bU9zR1R6Qjl6ZkZuWUJVMGN0Y0wwTHByNFVF?=
 =?utf-8?B?cmZxNW95WWxDdVFTYjZ1QVlsUGs2Zk9BY0N1T0ViOTVkaEp2NVN2S0M4QTNh?=
 =?utf-8?B?RSs0QXVHbTVTODM3VDFDQmdrT1pnQWlzRlRHQTVMVlE3RXl0UXFmeDFXeFRo?=
 =?utf-8?B?dHpwcFpxamdjVkNVeU9oVm5DdDlERHR1bTNGQXNEZEJrZ0hrbnUvbUk5ejFV?=
 =?utf-8?B?SkV4RCtiTVNiWW5VRzY1aWVieSt5eFdMenBZQ0FHTlJNeElmVXBxV21TaTQ0?=
 =?utf-8?B?QlRGSUFsUm9hUFF3K09vd0s4d0JQMFRMVDgrQ0NIRDdHUWdYT1ZwVDA4Sm8y?=
 =?utf-8?B?ZFI4aUlrWmNlNmxhMEE2c1hxeGJpYTFCWS92aVZyNUoxRDdmait4SlNLRDhL?=
 =?utf-8?B?VkUvRkhRb012U2craTIvQ2xJdTlMMG1GT0hhcFdveGZzeW52NlV1RkZmU1FU?=
 =?utf-8?B?ME5wS2pCcDZLcnpRTEI4cjk2djJNMHJxTXJUR0xvajlWQWRsVDZjNytSSUV2?=
 =?utf-8?B?aC95NVd1OCtxU05CWHNtbkp6Rm8wYjRjVkJsNkwrRWIyN21BTmtJazdzbDdh?=
 =?utf-8?B?M3VIQVRUZGg1OVhNZ0tSeU13Y1I1a1FOcjNQWkJ3TUtMY3VMa2lCUVc4M0dB?=
 =?utf-8?B?NGVFOHJnQjg2MDd2NWJGQ21FdUh4MVNLMWw5ZDFvVjI5MC9JbEVKN0toRHBE?=
 =?utf-8?B?a2VKWTlKQWR5S0U5elNNRnNlK1FVa3lLWXlPWHV6a2lQY0t3Y3ZEQ2pPS0s4?=
 =?utf-8?B?K0YwM0VMQ2JLaENnbHQzUjVXbGptQTh2eGtNRVMyb3ZXSUx4b2tKeDFoOXdG?=
 =?utf-8?B?ekxXSlFnY0lKVldWdXJkQjZxVjk3SHkzYzQzYXhuZmNjMmFocnRtdmsyUjFu?=
 =?utf-8?B?SE03Q0hRdHpnS0s0T1IzRGNrTGJDaW0ya2g2dUpFRWhhQWdNK0E2K2tUUzRT?=
 =?utf-8?B?YmJRWkUrQXFjZ0l1OVlZdExWOEhBanpRWkE2Nkdta0hOait6czBTcWs2Z0tD?=
 =?utf-8?B?SUZtRWRGNTBDbnFReGxZWkNYdE40V0R3WGxFNzlUVkxKWDMvYUdKWlRwb1RR?=
 =?utf-8?B?dnJ2RmE5U05zSU5meXFGOUJOWHQ0ZUMyS1ZXVmFGWEhJT2M4ZVdwbDh6UmQ5?=
 =?utf-8?B?Nmw4clBUcTRvbTNFZWhtSXE4ZFV1VkY0d0ZhSytNR1llRXp5cTN5OGROUUlW?=
 =?utf-8?B?eHQ5NEIrUnpadnVCWnZtZTlLYlpEa2FpRk5kMGRETTBRbXFKWHorUDIwcDQr?=
 =?utf-8?B?bTB0b1dFdHNCVUJOVU1mTGNXTFRYcllBb3NVa1U4eWFWcitsc1pSNWIrdko5?=
 =?utf-8?B?MXluVW1qNEpra1Roa215dnhwbXFOdG43ZXNKd1FZcVk5YjV2WTRTS0ZySUZS?=
 =?utf-8?B?RnRxT3ZEMjNvQ3d5T3RMZWFWTTdYWDUvdU5ONmFaN012K1VpTlpZYlNWWUxw?=
 =?utf-8?B?WlIwU3B2Qy9YNFArQlk5dVdoK2NxUXFnOGg4eDNaR2tuSUxnK2Y3eGJyUmM1?=
 =?utf-8?B?byttK0JZVzdaTHBoeG43cXlya3hndEFxbVluMnpxdDgyVFdvQVYyc1lhYVhF?=
 =?utf-8?B?YjdkQ2hQQUpRSXpTR3oyMWZlaHBDcWVhOU9ENkE4Vk9NWStHZHdmbUZvcnM1?=
 =?utf-8?B?TVoyOVg2a1NhUUQ3VzBITlBjK3djSmNTYjlXdDZQUWJTQ3lOT2VuQ0k2em5a?=
 =?utf-8?B?Nlh1cVBxUzFRdnc5ZndrTm45c3A0M000bUp1NWtVNzdCaTFMYWorWE5Id2o4?=
 =?utf-8?B?VTRXN29IU3RSS0hRZlFUSy85WEdPdXF4a0JuMG9qenZNVzZIOWtLYmJPcEtj?=
 =?utf-8?B?RHVaYXpXOWkvWGZVSmhlSGkxdHVGa1BrS1pjZ0lqdXJkdHAxaTE4YVp3Zy9u?=
 =?utf-8?Q?efCEBlBmZN92vzc7PEfkT5X1P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8684822-a424-488f-0cca-08db18e37103
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 16:55:33.7756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQoPYPu/oLMYYmprILMfJGV+A46UARSXNXz1KNFqtf3c393qA0nILMrT1ZTBXNEjLBQBqi6lQISD6VIqy2cYEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8641

On 26.02.2023 01:08, Marek Marczykowski-Górecki wrote:
> If the scope for IGD's IOMMU contains additional device that doesn't
> actually exist, iommu=no-igfx would not disable that IOMMU. In this
> particular case (Thinkpad x230) it included
> 00:02.1, but there is no such device on this platform.
> Consider only existing devices for "gfx only" check.
> 

Hmm, perhaps

Fixes: 2d7f191b392e ('VT-d: generalize and correct "iommu=no-igfx" handling')

?

> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> ---
> I have looked at existence check acpi_parse_one_drhd(), but re-using
> that one wouldn't work for two reasons:
>  - gfx_only logic is very much tied to acpi_parse_dev_scope()

I think this one could be dealt with, but ...

>  - pci_device_detect() in acpi_parse_one_drhd() is skipped in case of
>    (implicit or explicit) iommu=force

... I agree this is a good reason to put the check in acpi_parse_dev_scope().

> --- a/xen/drivers/passthrough/vtd/dmar.c
> +++ b/xen/drivers/passthrough/vtd/dmar.c
> @@ -396,6 +396,7 @@ static int __init acpi_parse_dev_scope(
>                      igd_drhd_address = drhd->address;
>  
>                  if ( gfx_only &&
> +                     pci_device_detect(seg, bus, path->dev, path->fn) &&
>                       pci_conf_read8(PCI_SBDF(seg, bus, path->dev, path->fn),
>                                      PCI_CLASS_DEVICE + 1) != 0x03
>                                      /* PCI_BASE_CLASS_DISPLAY */ )

If we're adding an existence check, then maybe better in the surrounding
if(): Setting igd_drhd_address when there's not really a device at the
designated address isn't very sensible either. (In fact I think I'm going
to alter the inner part of that if() again as well.)

Jan

