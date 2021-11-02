Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF024442B89
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219953.381014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqre-0001Oy-Rl; Tue, 02 Nov 2021 10:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219953.381014; Tue, 02 Nov 2021 10:17:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqre-0001Mo-OS; Tue, 02 Nov 2021 10:17:58 +0000
Received: by outflank-mailman (input) for mailman id 219953;
 Tue, 02 Nov 2021 10:17:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxJb=PV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mhqrc-0001Mi-Uv
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:17:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f34beef-348f-4a63-ad9b-1aa71ef6b259;
 Tue, 02 Nov 2021 10:17:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-qe4u5NbIPbefkjTNXThgqg-1; Tue, 02 Nov 2021 11:17:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 10:17:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:17:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.5 via Frontend Transport; Tue, 2 Nov 2021 10:17:49 +0000
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
X-Inumbo-ID: 3f34beef-348f-4a63-ad9b-1aa71ef6b259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635848274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oYARCj2u82W0gfYot+NYl8jrxu0Zq7pcXQvz3SehTog=;
	b=GrWZ+KqJaeZpxsJ4JW/X5++q7iyAS5r65gNyjs7vRpcCfibhlSLcOVLFH6IQGldNqPga+a
	Uh1jrCna3LT26u11ICbiJpiulH/+4+YEb68nrQNqcUhewF72a7jcijbMfJefiX1ed70S6y
	FgXstVC8upJ83VcHFtgroEb8ksy2RyM=
X-MC-Unique: qe4u5NbIPbefkjTNXThgqg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOYZMoMgnl58ClVMrUDTrxOCgRKAGEuBO6ng/1c3us5I6RoznFs9HZJB0h/kFlAv6kzOe7JN+n5hyehgrXEG1TD4Ir9YlQ1dkc30RUjll1SU6SEsMUBLm+l0j6ksWTQQnl/QLMX81Vk1Xevjo/EiDG301qDJtH1pZyd/ZBGk3zt3xEJA8iRoN21W1RdRBWIhPqhWaA3RCTfV5UEGhuZeGS2BIpKYQsEq1yPkJqJfl8A39afbi3w9C7TMB39XSs/zGnQIUldSL0Ge2GkDKJYbGz38uaXAthZh2yyCIM5mYESK9C+IBHCr2bta5I1MX4T4S9hnvJRxJGQ+W2HtffdniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYARCj2u82W0gfYot+NYl8jrxu0Zq7pcXQvz3SehTog=;
 b=gcdBDF64N2Ck1beOVxmixV0I/5iQXZKf+o30QdC41+HhYWyN3bMbNXSzqyAr3LuLFzJfXcToBK7FR3o9o+UZPNgmQHx5bpswlvXCePHUGTGt+To2hwgadLp5rYJyft4RmgMyyVbQcqFpqqIywsKvyDrkoygj2GOAEz3HooNve96O/jSEgUwgjOI6uWM5i+clU5F3tY2ekquVvoqQGEKNCutJY5lspBIrrPl+1JhfAi64uR/AyWGDa//DslLYXzeA+9tsHmO9Bq40VyaTUIjih1xlOB1RE5JIhzGADbzB9CUsmS8THAh+/wKrgcyycDu19hahNKpwRNfSP/tENixKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
Date: Tue, 2 Nov 2021 11:17:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 0/3] x86/IOMMU: enabled / intremap handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
In-Reply-To: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ab899f-7c79-4536-e77e-08d99dea0610
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46054C6D4D7B6874ACAB09CDB38B9@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s3JbgoaolaoA6mqQ45ohoIoZVMNe3mhznEbrC3ZUtKIe4b++1PRmJ6bEoR0nX5LCUyN/QrWTz0hcM00rOdJlFEbdxhFAqKaDdfSOiQ2aQI7teo7IRqwZM/YmidhRLv01Zpu3/YuyUNs01/c8Q4IRd/d8yA68vM0r5gCi0CojzUKkxAQr+zNGJW7I2f1c6TqmkuLd1s1GmArR6rUbvLnBo2CQcvQuS2ll0sDj8YpN6/p4elQ+2g7mhCC2L8kvB4aLHhuZcszjWbk1u9+nF4vvJP8eBCBePlp7thoGMBdVnqQKOC+Bc1uVcWfcilGWJl2KDwiY1G9OUEVtXEXUgvADE2JtnO6qEibz5Ke2HjtnY+A1fEFHgRZt6uS4JI7+zAl9Xv73QAEeeYJk03WM3Pn7j07PIUZYNEC+sNgTzRfJqx9fJAcLvZk6krNYpimgTCB17XkChHf3GopswrFYttTChYSnhmTbqzEufz/5ppkHK5HoLUOzYnEXgmSKahPoW2Sk6akawAauXbdHOuRIq4WRIelROlCdBnCPdmODvXd3UHg872KsvRCRUf5RCgVbsPDkGXfhy2FMAYXXdkVjIAA8JKAjkwMV7ghdYpbCGcVhzcVoayjJ1TsJybGz0lm5PEdwT0aUl44lvJrx53czDN8K2DVJ/+fn72Y1aDktAqueTE3TT45teThPZGeXbeESTOUnbGTI3KESfiXMEop4bwGYb7eYKprI3eT0/iDolouJfbda7p5Hu8QkxsxVeOFjxsea
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(508600001)(110136005)(8936002)(66946007)(956004)(2616005)(5660300002)(4326008)(38100700002)(186003)(31686004)(66556008)(26005)(16576012)(316002)(86362001)(54906003)(6486002)(66476007)(2906002)(31696002)(36756003)(8676002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHMzRWRqb04rUFpEaCtiQ25CZ1I3N2t4elVleC9zMThURStVcHZDYWd0cnhm?=
 =?utf-8?B?TkJDWGVCR2IrOWl0cFRaQjZmSER6WGw2aERDVDFUa2pmbTFoMjBjYTJ2RGNt?=
 =?utf-8?B?elhjVm0rTzBzTGJhMksyZDloQ2IrUUZrVUxrNGg5N3pxUHB4Tm50aUZ1VTND?=
 =?utf-8?B?NTZIUkpiTTdNZHY4Z0xXSkdqU01wQlVYVEhJdzBkVVh5eEhvaW1xKzVQN1Zq?=
 =?utf-8?B?MUgwcHNrSE9NcDJEZkNEOS9kZTkwb2JWMm5pcldWRWE4azZrMTUrYzhlMmR4?=
 =?utf-8?B?WExnWTdPVGIycWZ0TGRtQnloS0JRenFwclRWdXJFKzlNVVUvMTVoblBKdjlu?=
 =?utf-8?B?UmtycEVjM29BOGtHbXczeVU4VUZad2RmL1gySUc5aHVqZkp4a3hDQWRDTTl0?=
 =?utf-8?B?RG5abUk2dG9VTEtDc1lEd2ZQRitPSmM4SGlxSDJRLzlqM0JaQ2J3SUhoUVI4?=
 =?utf-8?B?emFlUVpNNkVENzdRK2tqL2Q0WE5JbTdkM0FYTmtlcU9tK0Q0Z0RJUmd4ZWZU?=
 =?utf-8?B?S0tBemc0TEJzNTB2bjVjQzhaVUlVQzB5VjExTGhzalUzUm1JckhNYVVsNWtJ?=
 =?utf-8?B?ZmZ1YnN2a05JUVBSZGJhQzVhS0xmWlBnR2VFZkV4d3V4dVpuV1cwRFJBY0M2?=
 =?utf-8?B?ZXNhbUdadllsazhYRmZmcndpZVFsNWltWDRtdi91MXkrVmtkUWVUeEd5SXVl?=
 =?utf-8?B?b2ppQU43UmNvRUQ4VUNmWkdFcW1YUWcyOS9DTFFld3NtNi8ycXJwcTBWVFI1?=
 =?utf-8?B?bDNCREN2QXB5RW9qTUpHaWNtTGs0elJ2V213SmQ1RndGL1VuR2Rlby9mbXlB?=
 =?utf-8?B?aCsxVENkRCs2SzFCaWJENDRKVFFIb2tXdUdsaXA4STZTZFhValpFRVJ4TlZj?=
 =?utf-8?B?TGN0NC9sZDlxcXM3aUxOb25YQUd1d1NuR0hOMnpLZWM1R0lIRUtDSWp6OUs1?=
 =?utf-8?B?STdXMnIzZ1ZUR092NVl1YnZpNnorU2VjdHNma1kycXNxSzZWTllPZDBZZEZk?=
 =?utf-8?B?YktpS1VCQU15UWt6a09PWExEN1B6Z2prMnJVOXFXd1c2cDBUR08wcXJ3R0xt?=
 =?utf-8?B?Zk55OUlGYkNURno5Z2R1SVdxUlplUEw2aTFNQ3I2SzQ2VnVQWFF6RXprSmlq?=
 =?utf-8?B?cVJUZ29sN0VVRjljRVVOUWo4Mk1FK3VWbFYzWUJib1N4M0NrM0FDVDhmcmVH?=
 =?utf-8?B?TVpLc1I2eEhScWhsN1Bsd2lDcDlnb0Jnalk3YzZLdElJbUtUZjRyanlYeTZQ?=
 =?utf-8?B?emtwNk9uK1pNWEg1ZXhxcUM5VXBuQytFcktqUHkyb0dZVFF5czhrOC9UblEz?=
 =?utf-8?B?cXNZSGJiNjM4clY4STJ5MTAvRHZJdFR3dU1Pa3ZIWGovMnNqWm9vYlVMTnVU?=
 =?utf-8?B?UjBCOWZRU2dNeTNFSElSRjVVdWdHRmxKcmFaMkUrdXA2UGNUbUhHYjVua3JM?=
 =?utf-8?B?czcxSko4OWh1UmEzWDVhZUFscUpDM2RScjVGSUJxcHlrbXdON28xQzh0MFNK?=
 =?utf-8?B?MjJGQ3c2YjlkaUN5MWQvVnZWc3ZtUWhyKzMyN09DS3JKcDBScHc3c0txZmRD?=
 =?utf-8?B?TGdNOW0rVGE4QmgyMnpCTElkRFBEOEFVb2VEaHdaV2luazB2NGdjMWVDOXVJ?=
 =?utf-8?B?R2dTOURnU0lqeU0vWitmMHZYQ1ZDMVBhcXRYUThydzVmdWZOSzVXYzVhTlRS?=
 =?utf-8?B?TDN3US91TkRxZ0E5dFQzVll0dk5Bc082QU9VNmdYMmpTUGxiMVdIRGdqdUJF?=
 =?utf-8?B?dHpmMHVodzA2SHFHY0RSMXk1ZkF5cllGWlZSZUFwbktBVUhma3JLYjBCemh6?=
 =?utf-8?B?bFc1WkVxMEVMSjBudUtFZVNFUnkwb0YwWFpnSUExV3pBdVdJMldtOWQxcWJz?=
 =?utf-8?B?cHhQM21Jd3g2azBiTzhZSld6U2hYOXNTdytBaUN0OUxQOS9VM0RMb01WSGZR?=
 =?utf-8?B?RnlvQVFiN3dMeEZOM1IxSDc2Ri93S2J0aThZVU5YZ2I1ayt0TndtR0NLdERF?=
 =?utf-8?B?WFUydlcvS3lFbDFLSUJBSE54V3F0MVVzZlBIQURobTZwOGtiRDdISkZsTVhE?=
 =?utf-8?B?Q2VLb08zVWttWjN6Y1UrbTJ5ZS9YSHVBSVo0VFhyRmxQSkpGbUkyWFQ5cjlN?=
 =?utf-8?B?dFJSMVRZaFovc1puSHpGRHhLMlM5N1dmaUJsN0c3ZWhxcHlVdFA1U0hscDdx?=
 =?utf-8?Q?KUp/DjmPOK3ZZtVNkd5oUjI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ab899f-7c79-4536-e77e-08d99dea0610
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 10:17:50.0414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HJP62Bkl+udLIrB14ZZx+MCqNGcqRYvc9CG4oJXEcjTMv8ykGQL0K93wL6tfe39zc+Ncwr6wXeYh67cNynRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 21.10.2021 11:57, Jan Beulich wrote:
> In the course of reading the response to v1 (patch 1 only) I realized
> that not only that patch needs further adjustment, but that also
> further changes are needed (and there's likely yet more amiss).
> 
> 1: x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
> 2: x86/APIC: avoid iommu_supports_x2apic() on error path
> 3: AMD/IOMMU: iommu_enable vs iommu_intremap

Ian, while we further discuss / refine patch 3, the first two have the
needed R-b, but will now need you release-ack aiui.

Andrew, did you perhaps have a chance to actually try v2 of patch 1? It
works for me when suitably configuring the BIOS on my Skylake, so I
wouldn't feel uncertain in committing without a Tested-by, but it would
feel even better if I had one.

Thanks, Jan


