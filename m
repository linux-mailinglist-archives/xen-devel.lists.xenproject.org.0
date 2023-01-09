Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E82662451
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 12:38:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473534.734195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqTF-0003mr-KK; Mon, 09 Jan 2023 11:37:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473534.734195; Mon, 09 Jan 2023 11:37:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEqTF-0003k6-H9; Mon, 09 Jan 2023 11:37:41 +0000
Received: by outflank-mailman (input) for mailman id 473534;
 Mon, 09 Jan 2023 11:37:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pEqTD-0003ju-I0
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 11:37:39 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04879000-9012-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 12:37:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8591.eurprd04.prod.outlook.com (2603:10a6:102:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 11:37:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 11:37:36 +0000
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
X-Inumbo-ID: 04879000-9012-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dX8oNcqXQ0REezT1XQaLyhmHRlRZmUcmJkqy8ZBwwIA1COjnCrIDoNXnggbF7yr4GIgwjEmzJSnc/etlxmEAokVuqXtAkyRmoNO32C+wYoEDGQnUhFW8W7VUMpaQ0+rOCqmk3iDwP6nEFzUfhbccalajIuzJUYKve/IfcPUIkh68Xh+iqz9Yx32oWdUkFL5H99S5DB+Jt6aZ9kmWbj5DlgfGCOxxG94/1gLhlgPktPwEdJx4JsgNr8ORaGV+oCNh24Eb/denaXaaz7u6Kof2/ul0h3wfkFlmbXWAn8A7qVez18WSyCd+O0VXDlEILeZEEpaIPPbJc8gWWQzETVELRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeasBoJ8JVmoBzjjKM2kVe3eIn/F5S+BWSxWiQtk0UQ=;
 b=gFU98fARG9RCgLOc5pUIEISQMSD6hDjcp9IcipgolaoRpk8i6rsKxOb+ZQKO6ay345rBIWgNbOaKcjdGogguubZvcRWMHMVPNiOCqg0zp+2QYsT9Ph/7BVf29zCRbpBC5aXdKFFKZYIX0hEaZRLb/wV4ncdBHYtrvUayGe38c+eittMi97QM3SMgVDeb8Q5YjR+xdLPFcqM/stkVRQg58uLGFzZaHVvKMN9ha8ThScYI4gHwj98R9Fs8YQbuJtbp7rTq0J98LrtaSPcW6Ka+CVJCsV21Nkt/70VtWgHhYEYkBMKNleDqu1wtXAStpRJ/QyL5LhwEgthr/Y+bO9NREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeasBoJ8JVmoBzjjKM2kVe3eIn/F5S+BWSxWiQtk0UQ=;
 b=UkzOA3Krzp26Ducr1JivXXE7/2UG4nBJ1xwl8hw3Q5AVnm8HD1eTksZPkXsH4A971FVxp5ADNtPbESyq5sIEJnBicIcEEdr77caaO50bQoT7cNL/BVxm77ZBxk12XVRlLbH/q4avMtnGRQCUcRbltaxP7sWW/zvPtRFkKOXKVUGV2iPwQok5+HQDaGbXHbb1QFUcyEWv7W9VYfLbUJOAi3UMa07Bsk8ehr+s2cfyqOQ4As2gX/El5RoeJJGkTdP1npMw99hBjXtJDDX4m4RJ0XqdaWu03NUtl6P6v6fzZwKHVqSW9E3nyL2EPCRvPsFNx3YFHzHuWjDSHhWRlYNO6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b46602a-f518-c191-946d-3b343b46dc87@suse.com>
Date: Mon, 9 Jan 2023 12:37:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/4] x86: Allow using Linux's PAT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1673123823.git.demi@invisiblethingslab.com>
 <9fd0360dd914d93dab357d16b46b4290e6119d30.1673123823.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9fd0360dd914d93dab357d16b46b4290e6119d30.1673123823.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3ef517-1964-4f8b-431d-08daf235e7b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RpZyaufuPRObXfmKbM/ZsNaiBh7jdYG9GvQOhzKU9REhq0mLCwrPGD9fm/nLRO/jGZgNF1TF5A7kNodWRktjND0BweoTMSNIi5h/RCnBB52o0wznLa4a/xMfQ2yQsWCUbQ5Qfo5q/5rSR3GjwUnPTSijpHBQsL0DLqC7JDsyLk/ITtCCUpwJbGDQgqLvnasyvX0NrMyO4OSrjUZREHmCyf52bOq4dOEmATHIGLx/wtAJAmR06bss8oVlUQYTJx6+RjVLlx1sbtzVZ8ZeilBVRw+WHb2yIys/xjzHbKWvK3c5/EQa944RmWIkNwmsbi2u19Dv8yb8/91gLs1jckrDfVDMTdqQFEukhhJZNYjsa5shIEFqHr23YYH0jrabSyQiOK4/9rlJuC9HdSHALcnF9inVUW1/BkqmtUgMr1Cmfcb41tDqL8DmnIiBlZhsGTK3Mw08k/xORfV+BdlrJZsT9krZ0G6egusoPT0nJWWFvQpyi68S7YLtgxyygA1ITprAFh9svT2UVcMFGccr8JaFZdfVVC25vPGai3yfVA5xujYY6czxEwOzEma6/MNmqs6T+V5HkvZ4SHnqPAwK4IC555Me3+1GxiXoGQefg+1PIgS6Eyz6BMFwgmkjDgVxk/FPgUzo1qYgBeLhVIgskjoilVe8clAdnX1Sb+5wVIWfSOpNEYl1lZyKdPhOlQXP6LdsMrz1AN/DlCCzZsIl1+fVHXmWWSIhE4yLhs0uDhnljlg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(376002)(136003)(366004)(451199015)(6506007)(38100700002)(53546011)(31686004)(2906002)(478600001)(6486002)(2616005)(26005)(6512007)(186003)(5660300002)(316002)(7416002)(83380400001)(8936002)(36756003)(86362001)(31696002)(41300700001)(66946007)(8676002)(54906003)(66556008)(4326008)(6916009)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG84UW1aa2prc0dlYzFjWElSdkZYTXFJZ3llRi9GV1RkYnhDeWdseVpnbVdk?=
 =?utf-8?B?bmUrZlVIdytHSVRxTCtnT0h3MmJvcHJjOWY0TkpYQXpCd3JoVmRqaXQyTWVp?=
 =?utf-8?B?SE1kbWNEU0xpb1p0NW5iV2pkVDR6ZU4wNUdzSGorYUJXTXZ5Vm1mSUd3Lyt4?=
 =?utf-8?B?VXNvMUppVUE5NjAwc3IzN0M3TnRzbHZtWGtzMlBtQ1ZoUUNKbWYvdHgxbjNv?=
 =?utf-8?B?aHNWNDRac2pjQnJWNUNIaWtIWk1YLzV3bGtlN3p4eFkyNGJtS1NZMEJscWcy?=
 =?utf-8?B?S3NEK2RvUTJKN0xGeHdHWTdiWk5kV3JlaGxpV3JjbkZOdDNTUjdkYWZUZXpk?=
 =?utf-8?B?OTEyNTBEQUpCcnZRYW5HWDgxUWZydVJpcUFVb3REYVpUelQrMlJaVkVrdDNo?=
 =?utf-8?B?cFRaQ3RZUytOejZRdU1NTzZ4ei9aaW95VHlwSDV1cTBkVVUwTjQwZXV4K094?=
 =?utf-8?B?OURuOFk0dTVzNSt2NVNYTzJDbWRuQmdKNHRMWitsNmJZU0xDbDR1dnlIaVNE?=
 =?utf-8?B?Nnc1SXRJVENGRGRoOElmWTAzbm9aWThZOEF1SzN5a1Z0dWxBY2ZaUjF4UUFT?=
 =?utf-8?B?Y3BIbzRJYkFoRUFRaW9HOEp2MUVYZjJIWXoyMEQwMG45c2FwNitzd01tUnR2?=
 =?utf-8?B?QUY1bDk1Q0RrVXJBQkhEUGtWNGpGa0g0ZVFqT1hUSzBGby9yaFpGMGpMWkZ1?=
 =?utf-8?B?Ty9jL2FoK2hBQ3pMemxoSGNQenIzSlBycDkzSWZhK05YU0NoRHlXcnhUYnNv?=
 =?utf-8?B?V3Y3MEpoaHV4VlZyT2JLcHdHbVhEdGhJa0t4NVdPVHhHNkxGbzZETTRpbGpG?=
 =?utf-8?B?bWFReXp6bjBPdkVZQmRadktIV25IL3BsLzFTL21BRkFjVXI2UzVpR3lTS1FE?=
 =?utf-8?B?dk0yM1dFdG9MVmtaWTV1aDRXOVNxSlZ4ZG5ITXZlcUdKMFd4bVY5c2lDQVZN?=
 =?utf-8?B?RHE0V0srRVFEMHprMEdLYUpmTnJMSStaTXRHMWZRdm4yQWF6ZzQvWUYrRUtO?=
 =?utf-8?B?U0NJTWJ2eWhTeVlFckRoR3BPbFh5SFJRS1IxeVBpRkcvb20zbFJ1SjJXWXUv?=
 =?utf-8?B?VmVSSVoxU21ZYVBUYzBXVVV4MWlvREM5b05abW83Y2VJY1kyWVJjellnNXFm?=
 =?utf-8?B?U09haW5vQWd6YzFMakl1SmZFdXRhL3NLQTg5YmtGL1dnRE1iV0k2ZVpjbEVH?=
 =?utf-8?B?aThuSng1VjBsR1F6MEJFUEcvTk5iSzFVaG9kUmFNQmVmVmFwNlN0L01LZklr?=
 =?utf-8?B?ZHI0YWRRczUxU1kxTWlwTXhSOFZBbnJ3aFZqWVFJeGNwREZHNW0vNDRqd25k?=
 =?utf-8?B?ZGZsMHFEdWtHR1dnK256UkZyYksycUpVdTJzZGlKU0lBNS9lL1AzUGJ2MnBE?=
 =?utf-8?B?NlZBMHhiLzhSdWdURUhpd2k4Z1BSZEFpMlc4YWZTd3hGVjRRWjZaS25JMTZF?=
 =?utf-8?B?dmcvUmszMld4alFNZW9pWlgramhVbkpkSmpUdG5SYlUybVVldm5uU01ocVdG?=
 =?utf-8?B?NEQrbC93V1lVYnZ3NjdmK3ZGM2xTRlpZU1R3eVhsN002aExtMmtiS1RhQXJa?=
 =?utf-8?B?UE5kZXVkWjRMdFBjbjZPYUhYQWRtSjBVSFQzSy9YRDFPa3RveDlYLzE3dklx?=
 =?utf-8?B?QTZ1NnBRZTFIeGRTN2ZUaFh6cndPSVROZTVDeER0RzdEVEhaTzBQbXo2QlRu?=
 =?utf-8?B?ZW8xZzluRDV5bmZTZTJaNjBmenJiV2xCbWl6bUF5MS91YkptdmhtWnpVK05W?=
 =?utf-8?B?Mm9MZzUrbmI2ODYyZTJYc056Zkxjd2FJVXIrTmVDS2NjNUVGYTJjenU0Tzl2?=
 =?utf-8?B?bXh5cUhIc3JWYnI2Mk96eG9mM3dVOEpyVllrUGNhUU1rZlhUMDRhYk01bmRD?=
 =?utf-8?B?SWJ4YitGZGhrREk3dTJMZ0Vqb0lFYkd5SzBWQVVWT0JWM3JMSGRDSlpodTdW?=
 =?utf-8?B?WDVTL2RQSDY0eEd3QVpUOGlCOCtCaW1mcXV0YlJKYjNHUlhGSW8xUVRva1V0?=
 =?utf-8?B?ekU1ZnM4Z25mWjNaclRqRUIxRTZrb3FpYkFQazJ0UGlsNEhOUlcydE93bG02?=
 =?utf-8?B?YndvTlN3WnVDMGEyZXU0cGcwYkZLdk5icGRFcS9qdWhIbzNEK2xYZU9GUzdJ?=
 =?utf-8?Q?9DJxA2dTt4dee2kbn4gW5iFj9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3ef517-1964-4f8b-431d-08daf235e7b0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 11:37:36.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JH3Dmsl19TbZ1OBesapdipF0LHRVO+Mlcs7YDyZEBGnBj6oplof87T9e2popt4YkgTv9Ao58theuc4vzVlixbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8591

On 07.01.2023 23:07, Demi Marie Obenour wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -227,6 +227,39 @@ config XEN_ALIGN_2M
>  
>  endchoice
>  
> +config LINUX_PAT
> +	bool "Use Linux's PAT instead of Xen's default"
> +	help
> +	  Use Linux's Page Attribute Table instead of the default Xen value.
> +
> +	  The Page Attribute Table (PAT) maps three bits in the page table entry
> +	  to the actual cacheability used by the processor.  Many Intel
> +	  integrated GPUs have errata (bugs) that cause CPU access to GPU memory
> +	  to ignore the topmost bit.  When using Xen's default PAT, this results
> +	  in caches not being flushed and incorrect images being displayed.  The
> +	  default PAT used by Linux does not cause this problem.
> +
> +	  If you say Y here, you will be able to use Intel integrated GPUs that
> +	  are attached to your Linux dom0 or other Linux PV guests.  However,
> +	  you will not be able to use non-Linux OSs in dom0, and attaching a PCI
> +	  device to a non-Linux PV guest will result in unpredictable guest
> +	  behavior.  If you say N here, you will be able to use a non-Linux
> +	  dom0, and will be able to attach PCI devices to non-Linux PV guests.
> +
> +	  Note that saving a PV guest with an assigned PCI device on a machine
> +	  with one PAT and restoring it on a machine with a different PAT won't
> +	  work: the resulting guest may boot and even appear to work, but caches
> +	  will not be flushed when needed, with unpredictable results.  HVM
> +	  (including PVH and PVHVM) guests and guests without assigned PCI
> +	  devices do not care what PAT Xen uses, and migration (even live)
> +	  between hypervisors with different PATs will work fine.  Guests using
> +	  PV Shim care about the PAT used by the PV Shim firmware, not the
> +	  host’s PAT.  Also, non-default PAT values are incompatible with the
> +	  (deprecated) qemu-traditional stubdomain.
> +
> +	  Say Y if you are building a hypervisor for a Linux distribution that
> +	  supports Intel iGPUs.  Say N otherwise.

I'm not convinced we want this; if other maintainers think differently,
then I don't mean to stand in the way though. If so, however,
- the above likely wants guarding by EXPERT and/or UNSUPPORTED
- the support status of using this setting wants to be made crystal
  clear, perhaps by an addition to ./SUPPORT.md.

Jan


