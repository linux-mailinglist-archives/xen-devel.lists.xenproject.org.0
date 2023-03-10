Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0636B3948
	for <lists+xen-devel@lfdr.de>; Fri, 10 Mar 2023 09:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508438.783096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYTh-0000FY-SN; Fri, 10 Mar 2023 08:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508438.783096; Fri, 10 Mar 2023 08:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paYTh-0000Cp-P4; Fri, 10 Mar 2023 08:51:53 +0000
Received: by outflank-mailman (input) for mailman id 508438;
 Fri, 10 Mar 2023 08:51:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1paYTf-0000Cj-V9
 for xen-devel@lists.xenproject.org; Fri, 10 Mar 2023 08:51:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb99da0d-bf20-11ed-956e-85ef70e17bfa;
 Fri, 10 Mar 2023 09:51:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6792.eurprd04.prod.outlook.com (2603:10a6:20b:dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 08:51:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 08:51:47 +0000
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
X-Inumbo-ID: cb99da0d-bf20-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AHYIxv3aJeXJxA8dU3HcTNLqX89rXbP4xxQ/sygNlbABzC9uF9OUH2sDeaZJ24k2b6pqeLOvaalzBNZrBCUoVOiS6EKD65KfxsN8+Qhopx8+rFyKa8mX2mV0VXxRt8BZ/vPzHNmn/0U9mxe1L2nej/+ysZ9kGqikxLi1clWJF/6mWl4RG1EOorXT4qOH9FAJuPDlbbj77ivL/e66Q/9gMii9J3lPvJDalecWfeC0tqIjCVEYr+J7i1csvL6nk1cbaXJ29AFcJR76anPlI2L1fcn9jW+TKE3aYOnrOjhLS2SH/47VslghtEeXfozP7du7jD81zNhoHAAKHgDpzDC6vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIPIkZZL3Cr39uJznkbwAl8D4tX48OMxrA9Ljh8Ljr8=;
 b=YVd/FzYcOelqe/knWiGiV+ayh9SAUl62B2SXwBYN/+brpzeCjdqsMqfd2wtbFFjBxzQSvepsWuU+tnXn9qCIk6rjWuS56NmbROHc4+hxNqhkdeXo9423yzb65oCNhSrdmbYJpvjGpaaDQXrNMOrYupCmyqZ/h9qQcMt6CGM7/Jhs7zgI+p/CEtcvEP2Hti7v3UgS61OD6YvU2VvzIx4oeTsbVMHem5y1O/z/iCodvp21UsucYYf55rrWJdAn9IP7Y5MkA0bA7F1SRGfYmw221IMFTdjqiNdug/Okmxarh4hcgfmEPk5cWEj5CcPmqONPsGpFAW49LEiOfq4poZVVKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIPIkZZL3Cr39uJznkbwAl8D4tX48OMxrA9Ljh8Ljr8=;
 b=YIR9wWRC4eB9MbX1B/YvQ5rtoAqmmXFOkjEgjf+5+JqBjiHa/Sw30BkTtIPg308p5lNKgkf/5YnPvGBN8e/o7Eh1hnVxnaYTUgqyhfG8BgJi+b4FoIaI2Udd4sz5vukbDPMXzZYVJu1Ng7cBNoBwA9znd2waI99pIx+Z6cpEJFrNKEr45ZLC/eAixv4y4BPnVV7hiZw2PVRfXQpWnn3Gv8HP3of7kAJ9MkOZdFlq3snI2DvxAReZAXbPWWCmjwKqzHYV1nWRHRT3tjcL1ONAO0PBocf2cxKlhoKFjp1ajjBYakk74YhuFbI3e5jAesM+Uj1kH3MYm7umRD9ceuelcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
Date: Fri, 10 Mar 2023 09:51:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, tachyon_gun@web.de
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: b90e9e4d-ece6-404b-f99f-08db2144aeb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3nb6l1e9CecUvMncbGGqxeqQCWkJQj+uXzJRUlUdp8c8Htka/MfkALnO5pxaekQsQ6XGxcbq0wODaW1CtUYHBtmSgHlUg402g/AZh3AdgwEzKRzyfl92Yo99z7sSghL18SUxX5hwxYoH/k3PBtKL8lrvCrw6RjWsns01j4leWiz2GnOvaHj9k8cXBdbxM54IhD3Udd1+5yqr3l4eroP0uC8TtgtlRZsccFpwF6iHSXf50/ivJC7kqk0HY392sURm0vdZMV8igPs0hnt47+ClzvSuzrEObHRHLXSjDr1dtdYpmCYVwKcjeEO3mkWewJaoEw63CmSQti1a/ET+tAMu3gSDFXiOImnMe8Cy/ZcABeXKD7jsPPdjHWf9EdN7apApuwKXmD5NuEzpOVpvPtLoQgGfk93aPgbNl8qK8Wjms5kxlWV4D6SDnjXHeAoRyosNVolT9tPBfBeBPrmUIZ46bcC9B58yuIQtdb9ddRpTA2gP9s8wz5tOkvzrBi3JR98wfzjrvuWYceLs+o9ErlXRYerNqqJZOmG3hrdxJ/vobEnjFPfLtG1fmQ01QBrOCPdEX68+deJ6gn/xlc6FWuWNcAWthdBxIPyf+85Qy5axpSakOnS2nrWjHHDgdYACZT7MLgvAlA4aAhQj7CXva2DNjIXBm22RhjkTe1EFhw5AG+iv9m9UV31Us/1TwM9CAqlYQ0+OJWBEkcvIGD0CVHMcsAmfwfYojUuZQSUj17hhJAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199018)(6486002)(2616005)(478600001)(53546011)(38100700002)(83380400001)(6512007)(31686004)(26005)(6506007)(66946007)(316002)(66556008)(66476007)(8676002)(186003)(4326008)(41300700001)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Slo1VHkxN3hOZkxwNm9zTjdyMmoxaXpWZlUzeFRwUVZKSlY1QVg2eFE3Zmdw?=
 =?utf-8?B?OUxtcFVtaHFhU1JPR0xyUG53WU9HSldjVHo1enY4MDJ4WmhBUXM5Nk5nMkwz?=
 =?utf-8?B?YlVXNnJ2OGZvcml3dTBnT2ZBM1N6RmJNVkF6L2l5WU1SY1dVQVdmYngzcTV3?=
 =?utf-8?B?bFRDNTJZTExHaDRvQmRTcm41bXB0Qy9BUHl1eUVhTEZCOTcrQkVaMFRtMXM0?=
 =?utf-8?B?bEdOK3c4cUhlZjdudU1hQm9qYWZYRURyOEhpOERWZWtWYnc4SUNpUU92NDJm?=
 =?utf-8?B?UUE4dFVuRUlMSmZXY25ld2FJS2R2dmt6VmxTWnJDcUo2c0ZtRXUrWHUrdUxM?=
 =?utf-8?B?VldhU3RTQVloSlR3Q2I3WlQrMXBJQkJ4QnVWQUU0WEZFalBaSjUyQkZlZ0h5?=
 =?utf-8?B?NklBWUl3OHpvRWtLQUcrVnNaamRCSzB0cy9pZmgvUDNYMzB3d3NtREF5U2xS?=
 =?utf-8?B?OUt2WThmYTN5bktJUHI0bmNsSWNLUTNYdmVGa3ZzeE5BcGxyK3Zxa1RCaEh6?=
 =?utf-8?B?cTBOOFcxV1BySkcwVkRHSENVdUJ3ZGpEWUNPRnR2b212ckRNdGl1NkMyN0V4?=
 =?utf-8?B?RjhqeFIzcnFwc1ZBeGhRSW9Gc3RNa3pnWjd3akhPRmlWeXdabmFQaXk5V0FL?=
 =?utf-8?B?bkExTU11NHk2MWhDTDE2RWZEenYrSE5IbGx6S252MHhYcjRwMmJ4emxIdDRx?=
 =?utf-8?B?N0FvRTQxK2tsbG1VV1NRMVk0SGJNZ0srdWhZNU5PVTdFRkVML3N3ZkF3dits?=
 =?utf-8?B?bE9uTXdNUHF6aWtTUWZLR1FmQm94dzhFS3FLTDIrelN2MUJ3aURKamNaRnd6?=
 =?utf-8?B?ckE2aVNOeUZMS01GWCtpaWoxN0FKMlZ0WjR6aE1rSUEyczc5WGQxV3BpZWp4?=
 =?utf-8?B?WElsTjU3ckNObW50d1R1SGpielBwaC9iV2QyRTNOcXdjK2Y5eXppZDUvTmFa?=
 =?utf-8?B?VWRRUGFkN0xvTTUvR25NaStYM2FadEx0UDdCTFRwYUhYNU55RlVMUS9UTzYz?=
 =?utf-8?B?eHJXckRoT1g1N2lFWjl0Ly90T292Nm1ESXQ0QUs2ZjV0YnJQeHhhMWFiazNQ?=
 =?utf-8?B?OVN2d1lYcHhBTXl6bHcvcVBsMGhwRXVKWDVNN1czWEo0cDd2Y2J4UG95MWtp?=
 =?utf-8?B?MXJjMUx0K0UrT0t1Y3NlZ0xzY0t1R0tGdHpLY1dSM0k5RytXa0V3U1hWRkRW?=
 =?utf-8?B?T0Y2SmpCNDNCSzVLOGsyMGkwSHVTZy9QUFRFcG9NbU9NbkhIajFWcldLT203?=
 =?utf-8?B?WXJuMGU5L0R2dFM2eHVIdW01M05YWkZ1RDRwTGFXRDR1TFV0eVZxbDZXRTNK?=
 =?utf-8?B?ZEN5WDN6dlVFQmo2WmdTMEczUXMwdFlldFJReERvSGpiUlRBdmxMRjhhSkNh?=
 =?utf-8?B?aXQrYlpsVDZaUnY5ei9nWXVnZjFBSWpwK3hud3VpZ29ZUytiRVBYTUdQMlU4?=
 =?utf-8?B?NWVid2NMUjAvcm80QTYzUmovYlo4NFdtb2YxV0JBSjBqOUJCbm0rdXk3OXMr?=
 =?utf-8?B?WnE2QWpNMDJYUU9IU2tlNS95ZHpNcGVSWkJ5dG15U1MxQnh4dzI4ZXRmZHVi?=
 =?utf-8?B?V1BHcjlFWnlIVXpmRDhBbWpZOXNYdjlDbTZxRGp6V1phbURPTTBrcWZVL0pa?=
 =?utf-8?B?amxNdURLYWFTbkZIWkJBaUlRaFd0eFVKdmljaVU3R2twazF3RDc0dXRRSGlV?=
 =?utf-8?B?WVJUakdzanlkNTllN25HWnAxc3gydFdXc1BBUUlxRy80dC9pY3JHR1UvQzJJ?=
 =?utf-8?B?N3hKbHVjMCtnZ1JNNGN3QjIwdTQ0M1lXbkZrNE1YbWR6MWVKQm1sSXhMREN3?=
 =?utf-8?B?b0gvQTZOaGtXU1VtNmNLNFRXMEJGeFFVUm1BNGdGNEkvaFZSNTUrY2pJc0t4?=
 =?utf-8?B?WE1TbnFTRjhsWU85STArMEc3YWh2SjdWWldpbmlQT0VBTldVeS84dTlUTkEz?=
 =?utf-8?B?dDI3alJPa0FmcVRmL3BmeklxWS9wNUxHSG5STVllVWVXWE9DTVlITmw4MWJo?=
 =?utf-8?B?bzRGSUlOTWxQNUkvanp6OXc3M3daZmV1am03UEdqRDZtUmRkNStBNnBnRFdo?=
 =?utf-8?B?Zjl1L2V4Vi9XM2czNmtWQnhKbGZoY2RENkdKTTNrc3RoNnJuSnF2NG50b2VR?=
 =?utf-8?Q?1lrqWuIRU2Rn2sY/+59DsAYW3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b90e9e4d-ece6-404b-f99f-08db2144aeb3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 08:51:47.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO6v+M40W1z6+t2dH8fs55dOmq2t7DxuDrnnLdWdPERHu/1cA9Ivx9VQpasKkVAZSriDe7AexxZzSritdx5PRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6792

On 09.03.2023 21:37, Andrew Cooper wrote:
> On 09/03/2023 7:34 pm, tachyon_gun@web.de wrote:
>> Subject:
>> [help] Xen 4.14.5 on Devuan 4.0 Chimaera
>> From:
>> tachyon_gun@web.de
>> Date:
>> 09/03/2023, 7:34 pm
>>
>> To:
>> xen-devel@lists.xenproject.org
>>
>>
>> Hello.
>>
>> Following the advice of Andrew Cooper (thanks for helping out) over on
>> OFTC.net in #xen, I'll post this here.
>> If this is the wrong place, please move it to the right section of your
>> mailing lists.
>>  
>> I got some problems running Xen 4.14.5 on Devuan 4.0.
>>  
>> The AMD-Vi and I/O virtualisation are not being enabled when booting up
>> the host system with Xen.
>>  
>> Hardware used:
>> Mainboard: Gigabyte GA-890FXA-UD5, BIOS version F6 (2010.11.24, the
>> latest version)
>> CPU: AMD Phenom II X4 910e
>> Memory: 16GB
>> Storage: 2TB Crucial MX500
>>  
>> A short snippet of what I see when invoking "xl dmesg":
>>  
>> (XEN) No southbridge IO-APIC found in IVRS table
>> (XEN) AMD-Vi: Error initialization
>> (XEN) I/O virtualisation disabled 
>>  
>> What I would like to see (taken from Xen 4.0.1 running on Debian
>> Squeeze, in use since 2011):
>>  
>> (XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23
>> (XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
>> (XEN) Using scheduler: SMP Credit Scheduler (credit)
>> (XEN) Detected 2611.936 MHz processor.
>> (XEN) Initing memory sharing.
>> (XEN) HVM: ASIDs enabled.
>> (XEN) HVM: SVM enabled
>> (XEN) HVM: Hardware Assisted Paging detected.
>> (XEN) AMD-Vi: IOMMU 0 Enabled.
>> (XEN) I/O virtualisation enabled
>>  
>> My question would be if this is "normal" behaviour due to older hardware
>> being used with newer versions of Xen (compared to the old 4.0.1) or if
>> this is a bug.
>> If the latter, has this been addressed already in newer version (4.14+)?

No, the code there is still the same. The commit introducing the check
(06bbcaf48d09 ["AMD IOMMU: fail if there is no southbridge IO-APIC"])
specifically provided for a workaround: "iommu=no-intremap" on the Xen
command line. Could you give this a try? (As per below this could be
what we want to do "automatically" in such a situation, i.e. without
the need for a command line option. But you then still would face a
perceived regression of interrupt remapping being disabled on such a
system.)

The other possible workaround, "iommu=no-amd-iommu-perdev-intremap",
is something I rather wouldn't want to recommend, but you may still
want to give it a try.

>> I'll attach some log files (hypervisor.log, dom0.log, xl_info.log,
>> lspci_vvv.log, acpi.dmp, ivrs.dat, ivrs.dsl).
>>  
>> Thank you for your time.
> 
> Let me braindump the investigation so far before I forget it.
> 
> Xen requires that there is an IVRS special-device record describing an
> IO-APIC 00:14.0.  This check failing is the source of the "No
> southbridge" message, and the cause of the IOMMU(s) being turned off.
> 
> The MADT and IVRS tables agree that there is one IO-APIC in the system,
> but that's the northbridge IO-APIC, not the southbridge.
> 
> The block diagram for the southbridge does have a PIC/IO-APIC as part of
> the PCI bridge, so honestly I was expecting the MADT to describe 2
> IO-APICs.  But OTOH, I could see this legitimately not existing in
> configurations where the PCI bridge isn't in use.
> 
> `xl dmesg` does have a few unknown irqs, so there might be something
> down in the southbridge really generating interrupts.  Or there might be
> a IRQ misconfiguration elsewhere, and this is just a red herring.
> 
> However, a consequence of the northbridge and southbridge being separate
> chips means that all southbridge IO is fully encapsulated by the IOMMU
> in the northbridge.
> 
> So irrespective of whether there is ah IO-APIC operating properly in the
> southbridge, and whether or not it's properly described, I think Xen's
> insistence that there must be an IVRS special-device entry for it is bogus.
> 
> 
> Furthermore, Xen's decisions are monumentally stupid.  It takes a
> specifically safe (IOMMU-wise) system, and because it can't figure out a
> partial aspect of interrupt handling the southbridge, decided that the
> system can't be safe (a false conclusion) and turns the IOMMU off fully
> to compensate, which makes the system concretely less safe.

So this touches once again the area of the fuzzy split between the IOMMU
being disabled as a whole (meaning DMA+interrupt remapping off) vs only
one of the two being off (where presently we are unable to turn off just
DMA remapping). Indeed the original Linux commit, which our change was
inspired by, results in merely interrupt remapping getting turned off
(afaict), and that hasn't changed. (Would be nice to have this confirmed
for the system in question, i.e. without Xen underneath Linux.) It would
certainly be possible for us to do so too - it might be a one line change:

@@ ... @@ static int __init cf_check parse_ivrs_table(struct
     if ( !error && !sb_ioapic )
     {
         if ( amd_iommu_perdev_intremap )
-            error = -ENXIO;
+            iommu_intremap = false;
         printk("%sNo southbridge IO-APIC found in IVRS table\n",
                amd_iommu_perdev_intremap ? XENLOG_ERR : XENLOG_WARNING);
     }

but only if there aren't any earlier decisions that need undoing, and
only if all subsequent code will properly honor that turning off of
intremap. I'll try to get to doing the necessary audit some time next
week.

Jan

