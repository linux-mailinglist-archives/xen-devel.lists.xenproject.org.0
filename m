Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B71247BB70
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 09:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250161.430804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mza8t-0005dm-EJ; Tue, 21 Dec 2021 08:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250161.430804; Tue, 21 Dec 2021 08:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mza8t-0005aT-A8; Tue, 21 Dec 2021 08:05:03 +0000
Received: by outflank-mailman (input) for mailman id 250161;
 Tue, 21 Dec 2021 08:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mza8r-0005a4-BY
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 08:05:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1a8e234-6234-11ec-9e60-abaf8a552007;
 Tue, 21 Dec 2021 09:05:00 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-13-QgJwi1keOxS-80NML5EMzw-1; Tue, 21 Dec 2021 09:04:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2336.eurprd04.prod.outlook.com (2603:10a6:800:27::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 08:04:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 08:04:57 +0000
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
X-Inumbo-ID: b1a8e234-6234-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640073899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvJZFlFi7ZP8SdU97BHY6Lhk82xfcB05gFJe5Gp1YB4=;
	b=PzCt0thHARspYD/1+TE3VypAw5uZvg1E6+guCvHXqbgGKQC5NYePoRlCLlm2zdATHp3HUT
	4Vr/lU92JYGKP8G8v6UKIWpsRZZyHkzGu9fOGcH5zivp8rbwfei1enDSwHW0Zx/I+nJBQF
	h03XbxaUHaHSGWcTY4HD6tTfd65Sa/k=
X-MC-Unique: QgJwi1keOxS-80NML5EMzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksJHr7zi3j30dnzo4sCcxg98S4MSHSfD22x8QMbhDF6pjDbShETYon25VRAMjS5Xdm8U0Z+GooyX4t5bb4Znf+1WqjcVSd9UgzrSfFvoCtee+cHkmT2g6XFzEaBmMB1HieKk6EpmwlkQTq0A5Fos8nqtNnDtEtfP4pjIyw82bP6brwD/0AbQ5gPeH4ExHJI8EutTbZjTiHw8U3eGOSknWcS5iWqac1ip+WGXNbth9ROSgBZ89Zyyyjt/htlHKXLP8jHfqaIAEW0J6GaQDX5psOBcpfp0GY3cIBbPJFqIms79ax2+KNQz3PubuFt1JcJnG+QmbDm8hrAk7eBLJOGTAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvJZFlFi7ZP8SdU97BHY6Lhk82xfcB05gFJe5Gp1YB4=;
 b=LwbE+Oz7kzOwb+DMltYcM4FH1/GSeoTBGGVngYcqv/EajsIrjR/TMgKwIzuMUC4TsGOXdocQHKWtuS2AmdNEdK2wSYkjIlJP3n5aSitT1iRkJJmARh/VpaCjmFb9zfI2Jht0OAaairMgo28YYycVrrvo/yWslA1RPHhQtz7/2Wlcre9dvHYd52rEoStc9sHSixb/jHjm/5QMKQ3mESrz0x2+3zDpJxuR4cZ2wjtCY52rHUigojDV50MSzw5t61hUlDYJT0eW/q2tizYlxpWA2jZpgSebCrrB6DE4VkREW7RuZB4nVmZaQxGz2UundpfZjcUzWGatisppEBb0cQiSog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ed3002c-ef20-d7db-3968-793f27ee1c07@suse.com>
Date: Tue, 21 Dec 2021 09:04:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/18] IOMMU: fold flush-all hook into "flush one"
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <e40ee980-9151-101a-1484-b1710aaeafb0@suse.com>
 <40CD83D3-4D85-44BA-8F21-969B544267CA@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <40CD83D3-4D85-44BA-8F21-969B544267CA@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1df2b614-de33-4e0c-e0cd-08d9c4589471
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2336:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2336F876E6A7D9317916D77DB37C9@VI1PR0401MB2336.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p3ARWKNlKuR0xsGOReVgG33QSwmJkv2frPCJe62wkwhB7Bm+w0fK+8PLkaGbsb4xmM09Ir9Wq/vC+qBA8qXxJsojZGZW2QfRWqeUUmNl3Py2fnYCYzuUYZ1rIpl+mnrLEpHNkhzGeVcag3x7ZZo0fmTQ8mo9D+E19MnSorCiwz/cACLCFP8SL/H6TVt3f16NFL8pkTkqF0opFiVzcm0Ncvex+xZBfQ1HuTouXdsNS3TkvgRvAZAFmCsjpgvc3No6264T7qrwzEXCKi0RgkEjep1vwd6pPvGqfg3+Rf++axuQ6SJg1Wuxm7NJJ8yJce8DZzsu/8kaJC57d4SQQIZTzVkoU9Y6V6mixX92Gx/ADimhJWI7hhgXiDCMuway4WOhieZ5SLUa2DkfQ84k5naKOj55XXoeN474w0LF4RukkRqaBS9861KRZBDFkZWaCjj6rEaediCbv5kqNZC0DOMAyelnn2NB8AltqtFGe+1sQGxqBOznI65a8jXpDwRkhlWAbpk25NVEkk8O96Ri4FZTjW6f4Ik6CNT2ZR7tL/EC3qgIPZBkDZ9aT2yseOkTjogMfRhMdmn0gXzZStDXzPcOCl1u5NL1AG0qXH2upPPJk03hZECLL5y5mMd5g1JXfbUjvhtEtYK9QW1PM6yocnB02ujPWb15GbksWudO1Nno/x3/kwyrG+jcCXIjsyhnhYCoLA+iW/0xZ6FFyrlHBqhK1aCHPPZrIIKudUb0+NR+QDjqj+VTCeGiajxI09AMUTq3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(8936002)(508600001)(66476007)(31696002)(2906002)(6916009)(66556008)(36756003)(66946007)(6512007)(2616005)(53546011)(6506007)(31686004)(4326008)(186003)(26005)(4744005)(8676002)(54906003)(86362001)(83380400001)(6486002)(5660300002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGg3VVFoQklZaXRlMmZyV1UzdWFMVFdQRVpiL2tmSFlyVWF4cDQ5bTBETU9F?=
 =?utf-8?B?bVRVaHpoQzdMTTJoKzhjMUd0WERGR2pmNzhjelZFd0JBMjFwNG1xaGFERC9s?=
 =?utf-8?B?NlljcFFqWmxGTmQ3c0pjMnlwODZvU21UNHVIVWFlbHdCMHdEYWtKTU1jTTBh?=
 =?utf-8?B?aDlvYzhWT1ltVXB6T2RneURuNjNvU3Z2ZkFKQ2R6TWJSSWFXMkZHWlBObCtL?=
 =?utf-8?B?VDd5VVpvaEs3QzMyem1mNkJXMnBjUWxMb2EvVklJYWpiZTRESFRCdERYREV5?=
 =?utf-8?B?NGYzSDQzN1YvZDhsSE1zelhYYllyQWd1cVZITldUYUhxYThwaTVrN2toT3FM?=
 =?utf-8?B?K1dteXU5bVdpbFRKV2V6VG1Da2thb1o3ZWVOSHNnc0tncUplMHBiOVlvVU1h?=
 =?utf-8?B?Vy9LbHZsVTgrQ2pmeTA3dTVEYm8zUkc5bHgraWZxRlhBRWFoWE95TTFGTXUx?=
 =?utf-8?B?amJiMXdneTFyVUljRTR4NkNTeUJCWUxSaU5NbVNMYmpnK0ZIWSs5NTBvZnlD?=
 =?utf-8?B?dDA5SlZ3Vys0WEhpUmJJR2RLNWFzTUtPY2I2dXBkalErRmllOHhnak9FOW1U?=
 =?utf-8?B?VUFSTmYxdytyaS83Vk9nN0pFZHBvN09rS0laWUltakJabGh1T2ppcVpmQzdr?=
 =?utf-8?B?WWQxUmhZRDJSc0FnYllWQzFxQ1J2eDVXSCsycExtdDVqcVBGcUdIYTlKVnd2?=
 =?utf-8?B?dlUyTnRnVFdiMm40VUVHeUU2WERrR0wreDB1b3JRZEs3TnN5bVk5Q2VzSWJm?=
 =?utf-8?B?S0tITW45NzhLLzJtejF4SGtYazFaR3BmbVlZeTNST0RrTklqejV5eTBDQXdG?=
 =?utf-8?B?TytyZjliRGc3b3dGM29QRXo1Um55Q1B1eHo3T0dKMEFLeEVwVTNxeWtGMFVG?=
 =?utf-8?B?M1pyQWxNbHJqK0Zwd3ZIVU11R01sQURGbldzcndpbGtXbnZoekNFbU1MYXpC?=
 =?utf-8?B?MU5pQTJ1RnVCbEhvK3BBZi9VRkJrM0RwbUJNQWhMbXJJdFVQMjJsNGRuc1Bj?=
 =?utf-8?B?VWlTVDBpUE4wakJTQnk5eW8yM0MrQW1xNVZYSGw0WWVsV2VEVXlrR2ptSWty?=
 =?utf-8?B?N0ZsdmxudkNOVEs1emNQcWtZUU9FcHhZb3NZakVBeHNJVmd5bkk1bjFCcUNT?=
 =?utf-8?B?VGxJeW4rczNmVk5mczVkcWIxZi82K09QOUJCV1dneXFmNU92bEFNb3hPUmJP?=
 =?utf-8?B?NkpHbzkzOG82eS9zWERMaFJ3ZVFKUmdvc2RBWVgvY1ZiZUdra2pQQ0tZQVhV?=
 =?utf-8?B?NDJIOHRCT2liTHBJTEhibnRuSHZiMEowZ0hVL0hZZWhnOG43elgrdFQ4aWJn?=
 =?utf-8?B?SlNZd21BeDEwWk9XQ1VINzRaWGRvWDJpSnZIaUZDcUZXd0M5cDFDNFhrajBO?=
 =?utf-8?B?M0x1Uk9XbmlBT3I1OGtZNlp4YVpXdXgyQXJzM1pLaEZOR20zSnE0bFlIUlQy?=
 =?utf-8?B?dnhMTnpxc01qSm9NT25Fb0NISkk1aXR2RldtbjFlUkxTNVhGaVRvUExmaEdU?=
 =?utf-8?B?d1RRRVQ2Ukptay9RQkV0elljWGJvY2dVVjJFSEp0TW95eGljd2xzTG04VXBZ?=
 =?utf-8?B?MXAxQVQ5WFBoaEsrcm13dUZPaFFaWlg0QWM0Z0NwQW1WcVJIRHZpU2ttbk1H?=
 =?utf-8?B?RWRIdEd0Sy9HYUxXTlhzTUpxVjhjVTAwRkY0cElkdGFaelFpRGptN09vMVRX?=
 =?utf-8?B?SmdicVppdXFkRXNwSEdyUTJHcEtMTW5temZaZnZ3RWRRS1JMS09zdkJWM0Yy?=
 =?utf-8?B?NkIxRGc0UmZjMGpabHRYMVNjaEphOWlqVzY1cjNRV3BndVRVNGwzQVF6Rkph?=
 =?utf-8?B?MFl1SlZiWDA3TlRETmtzVm8yYTRNZEY0M0dnMVVtZmdYNmY1NHpoMXJHaGI3?=
 =?utf-8?B?VG9DOFkwWG5HMFo4VjVzZkxGUEZXbG1UVnBqa3pBQ2M5aVV5akNOeHY4dHRs?=
 =?utf-8?B?QUlUMXRLbnZHZVM2U3RvaTFQaEpLQTd5Z1dSVWZ4VTNxOTExK1YzeXV2SzFU?=
 =?utf-8?B?NklSaHdiSktLUFFsQnlwZ29TSWliOW1EZ2kwd1cwd0tBUUtYSENCcWNaMlhy?=
 =?utf-8?B?NFk1K0plTTA3WnpHRFAyaWZnSi85TkIzMGRNTkorR1BCWlllTEI4SXVzNFd6?=
 =?utf-8?B?R1VPSGFKQ0tMOFNDK0xSemgrNWhCTTVQQ1JVaTZrRDZETlVtenBRSlI3WWR6?=
 =?utf-8?Q?Mg5W94wbQGpGRRU4hPwpBF0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2b614-de33-4e0c-e0cd-08d9c4589471
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 08:04:57.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgUuND2Hrj7wVE0/ik9M+d/gvQVrs/lcAYSr3Sfh0JRKW5EEgWiD7oXA5I2ATVq01gAU5lSulfU0SPtRgkPLrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2336

On 16.12.2021 12:30, Rahul Singh wrote:
>> On 24 Sep 2021, at 10:53 am, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> Having a separate flush-all hook has always been puzzling me some. We
>> will want to be able to force a full flush via accumulated flush flags
>> from the map/unmap functions. Introduce a respective new flag and fold
>> all flush handling to use the single remaining hook.
>>
>> Note that because of the respective comments in SMMU and IPMMU-VMSA
>> code, I've folded the two prior hook functions into one. For SMMU-v3,
>> which lacks a comment towards incapable hardware, I've left both
>> functions in place on the assumption that selective and full flushes
>> will eventually want separating.
> 
> 
> For SMMUv3 related Changs:
> Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Thanks. Any chance of an ack / R-b also for patch 3?

Jan


