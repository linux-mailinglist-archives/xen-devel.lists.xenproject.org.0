Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ADD3F887D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 15:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173039.315741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFCX-0001Cy-Ri; Thu, 26 Aug 2021 13:13:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173039.315741; Thu, 26 Aug 2021 13:13:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJFCX-00019n-O2; Thu, 26 Aug 2021 13:13:49 +0000
Received: by outflank-mailman (input) for mailman id 173039;
 Thu, 26 Aug 2021 13:13:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HXzX=NR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mJFCW-00019h-1u
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 13:13:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71b1b366-066f-11ec-aa00-12813bfff9fa;
 Thu, 26 Aug 2021 13:13:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-tA5XIlZCOTaDTZx1QbxIdg-1; Thu, 26 Aug 2021 15:13:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2446.eurprd04.prod.outlook.com (2603:10a6:800:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 13:13:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Thu, 26 Aug 2021
 13:13:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.19 via Frontend Transport; Thu, 26 Aug 2021 13:13:42 +0000
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
X-Inumbo-ID: 71b1b366-066f-11ec-aa00-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629983625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GmqyGVlPHw9V6n5aWvNi1Fn0qM38HP/qokgUjALM4gA=;
	b=c2yXfEGom3FG0O9M6sS//nCCHYEyjF+UQvBiqmTY6Yok33GqtmdX9QYgNAZUvd+NFRWsk4
	lsqawZKSs3n707U6J+HM+8+VIjuLmuF0b8dxD/Uxc7UpSJKXxXqI0gaONJQh2h1Rc0VUau
	NDUBRVAqsFyKtbjbgqFNCjAbMXOT8TQ=
X-MC-Unique: tA5XIlZCOTaDTZx1QbxIdg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLKRK0ZL8GOoofkbmYKhzut7P8TtytazJuyVDCTYhmroVKCRkPlGnBoyGcM0l7XmtZPoYqqwC3v7teswKz7k48Z0wbR8i34w8DcmRM8FlK62x5h65spMg9Qa+hLQv+X+qMF61A16QUiBBvXteS8BZobYkYjKnbwj/tFpZV6IcLwYyuOdd4vy5tpX6AG970Gk0AFcUAe2IsNmBvvWEtiTfxl4asJ7hVUFjbjVZZ5/bDr742WQnRSwofeZ+5x6QTNZTGHbjSWlkiOHePeYPEbJFb74LbRzjSzOxAXfk4vbztuXL0uDZ197+ZnoPy9bwYk/sYLsj9H0Md/pkav5B7Vz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmqyGVlPHw9V6n5aWvNi1Fn0qM38HP/qokgUjALM4gA=;
 b=VBhSdpIUzHS2718goqcVRkVrm1nJxj9JkI1/L+Ht7xcWvkNtkkJNLuoLoLByspw6HdUIKNYj2mU/24CalcukySTRIhwR736l67tguvfczn8g9U3jQJWmS8pm6XFnJ9Eex+/845RRX2IH0iSOmS8blGxgRg3im/FCoE2z07dokR+EMrjCfOz3cdHredkxiLYbSTpGMHtKHHGjsUxT76LAEpFjCSg2Ua5VQyFogufvsnjVfCXcmBGYQ0Nw0zpjrxvg3xX1Hf1qz2rMG+8fGGFRX8GXvkTrEMbNFUVL7p0u28MziWfqNwPO++wy42lUqy7IEkX0sZh3dwOxk7qb+qSPJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v7 3/8] AMD/IOMMU: improve (extended) feature detection
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bf4b3be9-1274-9750-7340-08b29dcecfd3@suse.com>
 <6b6b287a-c5b4-06f4-6f7e-78273cb74d64@suse.com>
 <1449dfd9-7617-b4cc-89b1-3e9dd8090320@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ed2ee574-b36a-dd3a-ee9f-4b2385a0a2e9@suse.com>
Date: Thu, 26 Aug 2021 15:13:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <1449dfd9-7617-b4cc-89b1-3e9dd8090320@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0178.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6537e0f6-f7ef-401e-ce42-08d9689353de
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2446:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244639EB9483BEA693BD154EB3C79@VI1PR0401MB2446.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Md58OkvW9V/JRjxfepGEwaZgPbWM0d6t5N3P76jgNl5NdtZmcpzher6vxzHjUCbcuZZucFTyogllykvBO2IjQ3pNvwoA9SA4/oZtsn5hL+63D0+lBRS+hSlsozsLg6hMF4jBnFiHJdB/7Eqj1dj/WKEi3MU3/V74JnfF/fl28lCheUpT/rTfFJ3Ry4GN3JZmcFpctZWKYsmJHYxFcCzIoOB44YIm0gKUFy5upivJdVjcLV05wo7/+I8F3V4pjK/lwlCuqAs5yrN1GQQh72sFuV5Z0aMaguKPIGDyWnQmFcGupZE64W0llNKDUE/5SSjgtemWnPGEwaVlGncXYhZzIJUqGA44pUk5iVCgkblzwKZnLdLR/KoyGKb1qpyaSRHlMWqO2lMa1qq82czafXAIHnVK3KocErdSXI0vL1fc37lzNxr+QAf2cMe3V7Y0YidCSy5GQ1lpsyubI3YNwIdz9cX4tb3WDrLqnfUYTwB4XqEv3PPdRVQ2Wpz0mv2RJ2vYCA2ypkher/gC8508D4gwm/mHbiEfT5HUrNwRewJPtmgKFc9apScMgU6uMjD/IbZO8z4XqUnUfkrn8uNSW23aNng5Fqm1d5kNIFchjegkLCApdPfbA2RA5oqxNYSZEQECY70MOCjeooq9+nOYTZrrcLNpyZxdCE9jgVu6+fkBsBDgV7c+CHGzLGAVmBt9OBaSYfQO4M0+sP0OgNLtfU3mAxPnGBFvAGeN+duB8zArJco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(136003)(346002)(366004)(39860400002)(6486002)(36756003)(316002)(86362001)(53546011)(31686004)(186003)(38100700002)(2616005)(2906002)(8676002)(83380400001)(4326008)(478600001)(6916009)(54906003)(66946007)(16576012)(66556008)(31696002)(66476007)(8936002)(956004)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjU0YnNWMFBjWUs2WWxTRDRzYTlPQnRXUkl2d2QyTGVKek9sUk5OT0c2VFps?=
 =?utf-8?B?b1lFd0RWcGpKWEhYV1RzRXVBT3B6aDdITkJCVWdJZHB2SzZjd0Z6VzVOY2pi?=
 =?utf-8?B?ZUp0Wi9RbitidVFOdmYrOEZic2VUNDlwU05lamNNU2NVdCtPNkVScXF6WmZF?=
 =?utf-8?B?MlhGa3RFcStFTVFyK1NUSmh4UnNDc0FRQldhVHNzMHRCdTJFOEtIRkdhcXZU?=
 =?utf-8?B?QitlVG1zWnM1UWdiNUdlT09WbzlXVjFvQVEzQnRlRUR4RG83SHdsOVdTbDZo?=
 =?utf-8?B?amhGYW5zQ1ZHR3NtMytXemtpdzR0WGFYc2xwNVVqZGlaS0ozRTQ1Zms2ZUpT?=
 =?utf-8?B?NVZzd2xjTkZBdW1rWi8wUzEyb29GUzR5bkFqUGI2MGdEZThyelBOQ3A0SUtO?=
 =?utf-8?B?YUVSM05jNVlOVW83TFZ6ME9NY1NzdVNKNmdNaHByZzVucTNodWVOTThnQ1pM?=
 =?utf-8?B?dlI2eVpuTVp4V3pxS0hjZ3lWNkJmNGoyVjBxZVA5NHh1WGloc0d6MkhhSnh3?=
 =?utf-8?B?Znp5L0tpZHhyUmFQT0IzNWV4elQ2VGZtaFpLdFhXU3dieTR3RDhyWkRFblVD?=
 =?utf-8?B?d1RUVlRQT0dTTzVaOFZlU2cwTkwwWXd4T0ZCTmVQVG9sajVnV3F6TUdPN3VE?=
 =?utf-8?B?L3FQckV4aXRCeUo5cis4dm8wOFVYbHNOYzBzbDMzUi83NTF1UVl0QUswOW5r?=
 =?utf-8?B?OEJmNTBoZzdGWDl5T2EvYmRsTVhkRE55bDhFelo0OS8ra2FzemtEa3FJenJ1?=
 =?utf-8?B?MHhkRzlmWDROMWxCQVZ1TzJwbTY0SzA3eVNIeWxzYXVCeHJsV1hOaVJkRU5o?=
 =?utf-8?B?MUVJRytxZTRiTmVtdld0K2tnQTZ0YXBwcDFuOG5HM2NSeHl0NEZTR3luM0pD?=
 =?utf-8?B?R2l0ZllHNmlrZi9HNEZ3L0F6YSt0Z24xRklkdXJuamI4alRMcXZwZlFxT3Vl?=
 =?utf-8?B?cnVJazJFaGJST1RtTU1QYWtoaExzY0JYU2sybGJnY3Bxb3N2R0VycGRmdTRp?=
 =?utf-8?B?RmFRSTkyM1V0and4UzFHRnE3VW5kWEt1d3dMWXc4cjM5YnRRYzlwWVA3YzJ3?=
 =?utf-8?B?bzNGampNa3ZUVGdueTRZV01WK3RUZjh1UlJhbk4za1JwZWIxZytKbkkzeWhH?=
 =?utf-8?B?cjJvR1FHYjZSdW9oSDBBd2trazZkTXlCWVpYZkxDMENNck9xcjdVR0F5Qy9N?=
 =?utf-8?B?UG5GSVRqN0JpRFFuY0VMRzRHSWdjdmN4eHlTWEpVbEIzNjl5TXZwSXVIdnF4?=
 =?utf-8?B?Y0VMSHUwbmFzUzNlWkt5UUhYdlZSQXRPUjFDM1Nkd2Zxcis0RUVLZzdXaDJs?=
 =?utf-8?B?alhXU3RWakxBbXRDOG8vUDNteHlyaDNQOXhZMUJEbGpvbEd5UVdwNUlYY3Zw?=
 =?utf-8?B?VjBPUjN4RHdkTWt1WDJzMEs3d3NBSHZNSTZ3ZEtqUjAwWDN6VXc3VTlyWkhk?=
 =?utf-8?B?TEhrNlhkREd1U1ZlWUcwcFIwMEJ3TTVNejBvQ25ha1JtS08rZ3FycnY4Z0pH?=
 =?utf-8?B?SXhIOWtCOHV3a3JRc2Y0U2NVUmh6bDRqdUtCR05JRGZ6YlVhQ1pDeTRsM2Ey?=
 =?utf-8?B?OEp3Qmh1T3hpeTc4NHdOKytpVW1nNzdCWEJPU1dkdTBBNnR5a2Q0WU9abmhv?=
 =?utf-8?B?bkM4SVFuQTZYcXByOTAvOU12Q0RrekswNGZSM0RtRTRRTG1Pdk51Y1VPL1NC?=
 =?utf-8?B?d0FYOGUrcG1nZTJGUHpackt2Q1NudzJ3akJFT3k2M3JNa202ZkdJVVBkN3Zj?=
 =?utf-8?Q?XPqZeDkaqjs3lVRDKYOsBiZv6jZGk6rS10rkUx8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6537e0f6-f7ef-401e-ce42-08d9689353de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 13:13:42.7557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfYaMyr0MvyZcP0Ivw1nYvKbcRFJwUzhfHkIXy55Y67efqyhvlbHsxYpv8y2/sACKFlbCnBtk48bR+xV7pg37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2446

On 26.08.2021 15:02, Andrew Cooper wrote:
> On 26/08/2021 08:23, Jan Beulich wrote:
>> First of all the documentation is very clear about ACPI table data
>> superseding raw register data. Use raw register data only if EFRSup is
>> clear in the ACPI tables (which may still go too far). Additionally if
>> this flag is clear, the IVRS type 11H table is reserved and hence may
>> not be recognized.
> 
> The spec says:
> 
> Software Implementation Note: Information conveyed in the IVRS overrides
> the corresponding
> information available through the IOMMU hardware registers. System
> software is required to honor
> the ACPI settings.
> 
> This suggests that if there is an ACPI table, the hardware registers
> shouldn't be followed.
> 
> Given what else is broken when there is no APCI table, I think we can
> (and should) not support this configuration.

Well, we don't. We do require ACPI tables. But that's not the question
here. Instead what this is about is whether the ACPI table has EFRSup
clear. This flag being clear when the register actually exists is imo
more likely a firmware bug.

Plus I didn't want to go too far in one step; I do acknowledge that
we may want to be even more strict down the road by saying "(which may
still go too far)".

>> Furthermore propagate IVRS type 10H data into the feature flags
>> recorded, as the full extended features field is available in type 11H
>> only.
>>
>> Note that this also makes necessary to stop the bad practice of us
>> finding a type 11H IVHD entry, but still processing the type 10H one
>> in detect_iommu_acpi()'s invocation of amd_iommu_detect_one_acpi().
> 
> I could have sworn I read in the spec that if 11H is present, 10H should
> be ignored, but I can't actually locate a statement to this effect.

What I can find is "It is recommended for system software to detect
IOMMU features from the fields in the IVHD Type11h structure
information, superseding information in Type10h block and MMIO
registers."

Jan


