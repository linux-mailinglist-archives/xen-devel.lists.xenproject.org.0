Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A5D4161CB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 17:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194405.346314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQNG-0001jY-P7; Thu, 23 Sep 2021 15:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194405.346314; Thu, 23 Sep 2021 15:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTQNG-0001hI-M6; Thu, 23 Sep 2021 15:10:58 +0000
Received: by outflank-mailman (input) for mailman id 194405;
 Thu, 23 Sep 2021 15:10:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTQNF-0001hC-GH
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 15:10:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72dc77d6-1c80-11ec-ba51-12813bfff9fa;
 Thu, 23 Sep 2021 15:10:55 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-rf9lCpNaMdeAnba_5yJhfQ-1; Thu, 23 Sep 2021 17:10:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 15:10:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 15:10:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 15:10:52 +0000
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
X-Inumbo-ID: 72dc77d6-1c80-11ec-ba51-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632409854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fceFkzy43CdmrEzXYcvTDoaKGsGNbxOgjHaMvMntd/k=;
	b=gly72MkKwo4XTDtWQ1mIrXRP+yaW0IpO0hzenaHoahdh7k9rIIyYu+Ruk7LBRzb4qECK5I
	fte/e386kR+aWhfsM3aTlJhDmDl4DQ+WhLHE50VaC91XkKHTRKR+bvpB3KXhT/07T9E2eN
	2uncuhr5AxtfROnKhquLh+HFKRz0/pc=
X-MC-Unique: rf9lCpNaMdeAnba_5yJhfQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyfGoWL58uEeTV8LDE35QQjMQMBfzCx/QM774QvOzFq1609xi7qeTOKMVHUdZUUeF3F6WAWStC0aP2WPVBbt0RU7ryDuqny+a6KRunW5jb9GBEyBr7yEYC9jUeTJRrxdPJZtKSUtL9E3DPOT9EKuNR1SrkZTctL9cqIgRP+2JfTu4Ott6MK/oP1mWHmU5XPxmTgfIaf5CDN29B+9uNzZ75FFS+q67TOWg+jt9+XtmsfPh9pFAyl0AaK5n8y+3Utog6RirUWu6DGPqAsjBFACenS+teeIytAfCSc+Cclsyh9s9JhbjgoAqtCtJ93d5QFdGWIUAcF1eQmfUd7XqkQHwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fceFkzy43CdmrEzXYcvTDoaKGsGNbxOgjHaMvMntd/k=;
 b=UlyUTdtkqXTQbk0l1ucvXLnF555uRfEFyN0mY+Q4pLOxp7JgutZ03Y7eNjbOFX/KfqAr2K0/ysl/qjUsQGmeDKuw4N/bFIyjSj2Vyg0l9VYnzbZl16rlZf0/PHDVwZOvr89Tuf+6WybmNT146JlcTvIWBCeHk6eSsfgiE6whYIlhYCb7uxVzyZbt+Tsc+6we6LI7zJak7aRg3xV8X6jtklDJILB8ALwUSZ9/oaVPFYujelV/xeyCAINZWpFlTVUa8ncNhGmYiRap4TjkGb56rOV/oPGla0XfKMrkuaQvb47PBUEd7IBSCXUJHpEXxIDmNFUvs68szh7uCFCbORihtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 7/9] xen/x86: hook up xen_banner() also for PVH
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
 <5af11027-cf9d-cf78-9f48-b2ce2edd6e62@suse.com>
 <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d9b6e98c-4e75-73f3-1e6d-42df300cfd49@suse.com>
Date: Thu, 23 Sep 2021 17:10:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2ded8c58-b9c3-89dc-6883-1794d1c4126a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0163.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0656f5f-4186-455c-0fdc-08d97ea4557a
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB686182E1C4C51339E27EC861B3A39@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7jxfke8Z/LhqiGqxd9aTkpxMxV9FCKTzX5TPhDrRSwTiki42woWJw7By+bKmhbJ2AuD0XVN4p5ytIGFDL3MTAH7a2cpFNWK+rJuHReD4IHqcjK5zXuttTfGDLMDC82X9fHXdx4c7gkMv2z13qAdmf6cptvVRb6vI6mFUYJFsQwOMkbxU5zaQg5VdfFgOElsj1FVMbUoepCbHfgG64s4d56abj7G4vcdW2yfpuyWOPoLRpO7nW6dw4heZrBVTXhOVhAxoPc7IsM4EXje/YPybBTj3E9TbN3lnYUtLeTPq1bY/He9Bjs5FttFEDD9+zAv/bB0SvqbPI2DRg80nKRB7KSdiNhkLyVg6Y4+tUBPVe0LOUZyuN1G8U9qS7eEQm55ENSIrfitHChgpc7trdrVgCLlpbAPSgzk4lUlgBi8ETFHcs2MrafMeWg4ANC4rQZeZG1XqI3HZx++UqZZgoWFSb2YQFPAhGHVSEVCG/GN1yRaEdyQUWMui+wzEXLQ6KGdWVUSAjs7ekTBbvranXA5Q1d+hALCa859/7lP5Uq4Yeb88z+2H6nI0i8uR3tkRaKNLGEjwKyTDFuGUxs4THKkz7v2U7chzyacYeadB6tS2P/TyLapnETTCzgHYLKl0OmSesKHl9pAj76luzUjjKIDNcuY6Cs0eVWADre1lVAh1RaQmNN2IPezeDj8fp+mrse57rcYgyEQ99NKsOsT6xWPCP+o/vYecLDEcNZ2ByU+qUZkJSXKzttybZhBvIPYgw9MfXWRTIYsmb0uPDN65xtI5kzhXOg157s4QEPhVxUJI2oU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(26005)(6486002)(86362001)(36756003)(8676002)(38100700002)(83380400001)(5660300002)(2906002)(54906003)(37006003)(956004)(53546011)(4326008)(2616005)(508600001)(186003)(6636002)(16576012)(316002)(6862004)(8936002)(66946007)(66556008)(31686004)(66476007)(52103002)(158003001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pzcnpJTGFiQ0x1WnJLNXZvWUI4d09pME1YZUdya3JoeVpoTlFaOFdhbTFH?=
 =?utf-8?B?K3VRQnBIcG9ySk5nZ0ZIR1l4YjUxeldESE1KL3owR2xhM0YyNEx1NWgwNkxz?=
 =?utf-8?B?UExNelg3TnNkMDdTSDBiWCtpNExBMjA5TkFZOG0zQkUrbFpGVTlJWVVseDVS?=
 =?utf-8?B?SEhXOVBiUnphdEZmWE1RVDR6Tk50VkZ3YnBtdXZ5R1Awa1cvQTZtb09tbzlu?=
 =?utf-8?B?SC9XYlVzZEI3RzNmYmh5Y2cwWnJmMkJZek9uUEFtelNraEV0dlFqRlpQRGZp?=
 =?utf-8?B?a3BVcUdxSnczQk5FZjRNVkhjeFRHdXpJMjlhTFF0Q2ZYVUdiNnEvSm1PWWk5?=
 =?utf-8?B?MDFwMmFMSytCR2V1YVBCODF4SEs1bm92eE4waW9HOG1RNHlzaUdheklubmhn?=
 =?utf-8?B?YmEzU1NHaVl4czh1VmMwbHg2NVdXMHpsZ0N2NFErT2g4eXBQQXdhazh5SEJC?=
 =?utf-8?B?bkFmNkxmYWZwSSs2dmp5THJWdU9xSzFnZjdvQzZmZjBETm1XeUhaRTIzV3Ey?=
 =?utf-8?B?SW9VVCtjbmdNdDgrNkl2a2hrUE95MzRqblRvK1NpV3BYc2dQVldZZFVVUTY2?=
 =?utf-8?B?UVV3WG8wUmpIWmFUMXNOKzhGVlUwL0xSeUp2bjhvaUhoUWx5UVJNdnZVc2tP?=
 =?utf-8?B?dlJUQW9WZG95ck1MT0lUaTV2MEZ4ZE9CVXVTeEJ4NkNpeE41b3ljWTBqa0VP?=
 =?utf-8?B?UW1xQWU4YWlTbjJpaEFsMkw3WGJTL0xOc0lCc2VxN1EvVmwvOVdJdXJsQk5m?=
 =?utf-8?B?YkwyNlJNUUtQU3hFODZVL0RTNG4vd2IraEZmWlhmaldSbFYyb2RqNnNsWDBP?=
 =?utf-8?B?QXhiZkFsWW4xMitXVkRFT3hzT2JGS3FDanJMZFp2Rkd1VmQwWG5LNmExNUxt?=
 =?utf-8?B?U25UdzRmK3Z1U3IzakgyYUxJZnRhUVFIeW5nczAyUWNsNDFpK3k2TW1tUUpX?=
 =?utf-8?B?OUNmQmI5dE9uTHhzZEdPeEFxcEFCNE9EU2FTUU1SallhYTRDWjY4aDdCRExa?=
 =?utf-8?B?dlIvc0p1NStpQ0hFQ1E3QWlaVEdCM3ljVUVETU5LTXU4YS9GRFRqM1E3K1lN?=
 =?utf-8?B?WFZkN1Nld2p6RTJMOFd2em5PMEVxMUtsMjlBQnlIbSsvb1U0UUsva2dIWDY5?=
 =?utf-8?B?Z0ZpRWZ6TG1yMzl1WmlvQ2FpY1RuZGZ4NklId1o4Vm5aRlFLa0dRZ2xncGlk?=
 =?utf-8?B?cDF6ampRQitmZ2tkZXdIVWUwemNjZGdvUFU1bmZHMUxSTCs3WHFIZFlBMlVx?=
 =?utf-8?B?dXNHREc1WVV5NFhmeDJTdE9Mbm9rcjBHQ0luYXh5QzFiUU9XV3FWbUFSZFVk?=
 =?utf-8?B?R0dnRzgyVzRNUTVlMDlFVU15NzZpKzk5Zy9aMzQ5VzJSSlQ3Nlk3VXFvaFZY?=
 =?utf-8?B?QWZYeS9Uc09CMmVYS0FpdnFBcVBFWDFJVlVZamtFbmtPWjdjbm9MRnlsL0pN?=
 =?utf-8?B?L0tweUdjRVZ2STkyVUdMY0hPUnliMjRRVFlQVFdXNnFVbWsyUjJLV0Jnb1pW?=
 =?utf-8?B?OUtiQ056L1JkODU5SXhaVG9Ccit2bmlRdGhuaWhTa3JvcTdTOHVGN1pLN3lM?=
 =?utf-8?B?ZzdJQ0lxOWYwUG1PdkpqQTNyandlZ0ZqQkUyN0doRFBvVUo0K01PcjM5aGlF?=
 =?utf-8?B?L0dqWERoTm45NVdheTAyT3ZhcysrWkFsQjFNVlgrU0NxcGtmaWlIY085TjBn?=
 =?utf-8?B?SDNiMXNZbVEzcE1SWkNabTYyWGo1L0t3clFINlpHZnNVR2ZwclM0YUhhQjhT?=
 =?utf-8?Q?tyQB0BhupmEvnOqf8pFnULEXXYUvOmMUt0kCJA5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0656f5f-4186-455c-0fdc-08d97ea4557a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 15:10:52.4514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NfPjBuDJUizHOroqFRAfdWxtmCoHN92MVcGThMqYOrL1aC1Lyk2wTNkuUWU0W8oSFq9I8t2GcjwFXmDeat70tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 23.09.2021 16:59, Juergen Gross wrote:
> On 07.09.21 12:11, Jan Beulich wrote:
>> This was effectively lost while dropping PVHv1 code. Move the function
>> and arrange for it to be called the same way as done in PV mode. Clearly
>> this then needs re-introducing the XENFEAT_mmu_pt_update_preserve_ad
>> check that was recently removed, as that's a PV-only feature.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/arch/x86/xen/enlighten.c
>> +++ b/arch/x86/xen/enlighten.c
>> @@ -261,6 +261,18 @@ int xen_vcpu_setup(int cpu)
>>   	return ((per_cpu(xen_vcpu, cpu) == NULL) ? -ENODEV : 0);
>>   }
>>   
>> +void __init xen_banner(void)
>> +{
>> +	unsigned version = HYPERVISOR_xen_version(XENVER_version, NULL);
>> +	struct xen_extraversion extra;
> 
> Please add a blank line here.

Oops.

>> +	HYPERVISOR_xen_version(XENVER_extraversion, &extra);
>> +
>> +	pr_info("Booting paravirtualized kernel on %s\n", pv_info.name);
> 
> Is this correct? I don't think the kernel needs to be paravirtualized
> with PVH (at least not to the same extend as for PV).

What else do you suggest the message to say? Simply drop
"paravirtualized"? To some extent it is applicable imo, further
qualified by pv_info.name. And that's how it apparently was with
PVHv1.

Jan


