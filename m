Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F66C149F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 15:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511949.791423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGQO-0006Il-Ef; Mon, 20 Mar 2023 14:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511949.791423; Mon, 20 Mar 2023 14:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peGQO-0006Gu-BY; Mon, 20 Mar 2023 14:23:48 +0000
Received: by outflank-mailman (input) for mailman id 511949;
 Mon, 20 Mar 2023 14:23:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peGQM-0006GE-B7
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 14:23:46 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d112d46b-c72a-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 15:23:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9712.eurprd04.prod.outlook.com (2603:10a6:102:26d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:23:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:23:37 +0000
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
X-Inumbo-ID: d112d46b-c72a-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SEgsfdXDRmT2DPYPE9JvCTFn0s/v5Y6p7BpvZoZ44bTRvJk+oU9xzAh/APtbKvRTeeua3CkshY/I7etsaRjK6hOk5S9TAcBXGOp8XO3dCJc5AeB0P89cQA9vYh7SEILBYxjSgTMV5UdN8ZraCyxiy1/8cNqMX4vAZ+RkK16yReUppf4CqQMPopSKUe8zAswUCCvgOHtIMiz8Ol4oUiNBdfgTS1vJCrAJraLt4VbDCLObNkfPtIMypzt2CkIFSp2Zm5a+6eg+2B1xSSkYbxca00kybEtBnMxE8ZD1064vXlHF5Bz2tGiTK8jOR9TGVvI0SVteqyGKQPMpuu6CF74h+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTC22lNN0+4Xcq0zRBBrQOmevMK3xXKAJ+CYPCwNYTI=;
 b=Xu0AClyJQevYL1vnKbx1kp4ksvRdW0tcCCEuRjZZV/spRolHpGJVCnazRHeW/OLLMCZ3XIyRLhJNx0ooq16cwxfTrKIin2+JGSTVdV7GKuLn4jri1WZTv6QH91UGWjUI2v2NchbAGGh1GoYPsWYPa67I7c/ZPOc+WYqiCfJM1iS79Hz3jjhk60kp1beTztucZj8NWGKYThpmFhu+1DKDvhdoVI52wAPOJznRWk4AOXEeMoDHE0tVzV+QsA2T/mzAgSBHG8S/ROWYbth3HZIj7vXh0EwdpbJ7mcn7wxgNstncuXJKZ5GuVqNumMUtyaCsrfe+pyS/FXdffLOyYnI31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTC22lNN0+4Xcq0zRBBrQOmevMK3xXKAJ+CYPCwNYTI=;
 b=AO004vgRwEd3IqoTi0j3rVVyFvJCrozlm0u013yEyNqUcItQeO9mFZBSQ9x2b1SVIqRp1y7hyI4LOSTyFQbZVqPILyrgMampL56uxAMfp81qoNTG3PYg4kP1ErUELbViOsNhe5xG8nU6QDQfRnXfWiE7G2kVcZ1YKpsT1UyCm52PBy/IUKG8NrdZFg65NQQKtzYEqA9J/sEwSdc7I23RjR8PFs6L4kkgFeLE8isZGVXQtSh77GTO6KkVi1q1XxrnKF6Snyb0aqfde+Dao19nuqyxa3I3V+pYyfUt9+VTCTNhyHJS0xeRxhBeu5O6n0VXeFQnlI/od0Ksj0qQmMpHjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <032c5949-9723-b77d-6c6d-7f4f4f95e9bc@suse.com>
Date: Mon, 20 Mar 2023 15:23:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [help] Xen 4.14.5 on Devuan 4.0 Chimaera, regression from Xen
 4.0.1
Content-Language: en-US
To: Denis <tachyon_gun@web.de>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
 <84f66bc0-ae7c-febe-9a15-98453c48d051@citrix.com>
 <ce1a289e-6ed7-9b5c-42f5-069f16bd6984@suse.com>
 <trinity-429ff607-c131-4745-8c96-9d7f6f61234f-1678481409956@3c-app-webde-bs42>
 <31151e94-b8b3-15ab-3680-e1c6e2e97530@suse.com>
 <trinity-7e872635-20a4-4120-a08d-2d62a77d2da5-1678756503867@3c-app-webde-bs22>
 <2afa0abe-abe5-a3d8-658f-abc466d78101@suse.com>
 <trinity-7c345507-5695-4649-a62b-be4dd793cc00-1678805608384@3c-app-webde-bap40>
 <e5a4689e-27e1-6992-65f8-c59b669aeaf1@citrix.com>
 <trinity-b7bc2797-26a7-455a-8080-8d33234171c9-1679254738309@3c-app-webde-bap20>
 <f68e2621-2858-38b2-f989-32178e9f5ab2@citrix.com>
 <trinity-3058fb41-1250-49d2-88bc-4fbf3ef196f0-1679316388437@3c-app-webde-bap20>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <trinity-3058fb41-1250-49d2-88bc-4fbf3ef196f0-1679316388437@3c-app-webde-bap20>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0258.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: eb51df2d-13c4-4098-f11a-08db294eb1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mQn1UJsyEmpRZOevzbqWr3OTn5hdOgGBvFkcUwd2cm0msjtDEjEPDmxe/fIH4yzELiuR9aRTBmsHj9EP0b4UzTSMod+4eyqNc6laDpwL1eZyaqSKRuQ4Mbn+0n2moJyHkNfTg7wxEkDXqvrMpUr8L27NF9boePmSG1lF0dr6At6BG5CYUWbQn4G9umVMW7MBjjf66vCmEKlKhrBFflnFBG02bX2Xgw7d6dUbelAFRJlCx2Ye2d8ZWkSYabX2EU7IPgvu5cs90ZMHW1FLQVKh/i7S9MnzaQMqqIS8mTFRxty1CeYthAwmm8m2Y1rY3/g8aIPIXSBkuNzqnYQAXwV18chYCfcYPEgGBAXgUDonET+QS86XT3SSahbZR/Yt5e2LNlkVkWZ6aZUtoLHh2kMcTKpZ+uy7FRbkxP0xz2qdfBBGAJxlPmKk1Up1DlUTk4NJK/IWF8kicvANR4EdOIu+MPr1LdoQaGVW1L6gF6xuCc2UNCMs1njyWop3hY1/oujEh397e+1ZQDB2pjUeRNi0Vd0Wp2A6Ao2Q/k7JtBdyIhYbUMos4E1/4n5nB8JryQh64Dcv55qaVB2XrEqT7vcsPC2gA++b/kukCEmbG0/lNJI7FJdCJ/BN2BnEqg8tawc4a9m+n/MlqqyFMhum7ZzUyX2+8fuj7zDRgYQefLfeVBzaLYQqMkF71P8Kjb9d2PJGKdJ+lXgamROeqewXyX6zk5ee2Dpx04IYQe0Rklc35dc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199018)(86362001)(31696002)(36756003)(83380400001)(66556008)(8676002)(316002)(4326008)(66946007)(478600001)(66476007)(186003)(6512007)(26005)(53546011)(6506007)(2616005)(110136005)(31686004)(6486002)(6666004)(38100700002)(5660300002)(8936002)(4744005)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERxMXVhTHhUb0Z6YUd2M044ZVN4TTFKUUVNTGNDbFZDMjRqd1VBUUVwSGhW?=
 =?utf-8?B?Q3dsQUhvOGl3MWxTRDdUN1AxMGJZenV3R0QxWEh4SkZ3d0NldEp1R3RPeFRK?=
 =?utf-8?B?N0JpaVIzaUcvaCtjeTR2aXVqa0Z6eEo1RnRIVXV4a0J5YjFJYytCVGt0T09h?=
 =?utf-8?B?UkhyMW9FZTU4REsyd2I4RWtScVNWTFFHWXVhM1BRekc5bGdTTTZGcjdvR0Ru?=
 =?utf-8?B?Uy9DaThTbXpYTlBqNHgrNXRvbFdSdnA1UzZpcTZQaWw3VU9yRFZPMFhhK3J5?=
 =?utf-8?B?V0ZqL3JZSGsrZjhId0lHUm9RZnNGaW5HdC9zSUJ3bTRTZEZoSTI2R2R5NWxE?=
 =?utf-8?B?S3dKS25IQTd6YVZoanFCd0hWVDFycjFLcmVYVHBZVkdXQlFpRkZqMkRBNldJ?=
 =?utf-8?B?aVREWnlCT1hoVDd4YVZhRDdUYVp2cFNxTEh2ejdlT3JnYUNXZ1lLUFdzTGNQ?=
 =?utf-8?B?cG1yL0c0Tk9vMnV1RlQ2VWxpbjZibWhTR3lqVEk1SFpzOTRiUTZzbXNRb1hZ?=
 =?utf-8?B?aTZnSmFhWTlRQk95bnh4K2E3b29lcDlDSUNXQUhsWW05M09YRllURytBQWha?=
 =?utf-8?B?RHR4WmRYL2xMT2dSKy9DSFZ6dVNoK2Jmcm9ycUFtQ2MxNG9GUFNxazN5bFhh?=
 =?utf-8?B?SXREbndvQ0xrcVJ6Nzl6bGNuT0JLMzdvMjh0K3haU3NGS2EvaHVoQXNJcEJI?=
 =?utf-8?B?cWVQVTdvNzRHdm0vWklqSFBFallML01ibUJSc2ljNnRlK1B4STd2M2ptaTB0?=
 =?utf-8?B?cFV4djhNUWJKMEJlOTJ4czAyVTFkbUhSYXpsanIyd1JLYXorWk4xdEpRZ05x?=
 =?utf-8?B?RlFDL2dpN3VLU29pRzcydWZ5eXNPdERqZ2htcFp5Qml0YlhnWWMyNVZCZm1p?=
 =?utf-8?B?eFhuMmd5aG9mQnRvZjJSK0pEc2FrQVJuSXpmdk9GNnVHTUFqcEpkSEZ2cnEr?=
 =?utf-8?B?Q3o3bk4rZWpKMzBQMm9zWTdhNnRxOGR2Rm44RVltUTdrNEFucTlqVlhaazVO?=
 =?utf-8?B?dmxqcEkycTZxd2UyM1FubjhEZElPL2hJa2kyZG85UlA2L1lBM0k3bkJrRFQ2?=
 =?utf-8?B?OStSVEFIYnZjWnBIT0wvb1Y4amNma1NaME5XVmsrV0RCT3hwQjRxWDdCQVFv?=
 =?utf-8?B?cWlRdERyazR1NEduamhsL2pVaEJ1QUFpbjFuSWtaUGtBeU9NNTBqbXpxOFF4?=
 =?utf-8?B?U1ZyYWdCNklobTFKcVdWb21vM2JSZzBhNmJwZENaZ0l0NG10d0lKMmpYY01M?=
 =?utf-8?B?b0QvcUw4anZFajV3T2orcmM0dTAzMDlEWE1VcnBWa0hQTXIwU1BFK05XZW5Y?=
 =?utf-8?B?WEp5T3Q1NzBXbVh5eG16TEVWcUlMSEVXZkNwYnRoZzIrVjRjNFBIUmV1OTRa?=
 =?utf-8?B?S2VIT0lJbUg3anVGaDRtckhJMlBpYlQ1MDAwRFltcC9YY1pWQjhFaXptVi9w?=
 =?utf-8?B?SkVpYm9iSmlTM1VGcnFodndseEhJZFF6R01tQWw3S3dJT1N3TGRKVXVTWFk0?=
 =?utf-8?B?Sy9rTFNLVWhrYmZhMk55L3lMNTlzTEdaR2dlT2NNMXV4dHNOaGFJTFpsY3dP?=
 =?utf-8?B?WWswQmhVNko1aVA2R3hmWkdsNEp2dWJ0Slp1enpUSUtEaUU3djN6MnBadnpQ?=
 =?utf-8?B?aVhLM2xWWDlzVEdscWE5TUhxRU1ic0JNYkxRS0xYQzRYNmpNbmE4eVVTUFlM?=
 =?utf-8?B?NDFXMFpweHVLOGZYdTVQa0w1S05kVUJaeWNXOVFDZkJqbm13b0pNejM3RGc0?=
 =?utf-8?B?Tnl1YUxSVGoweUVlQ1YwYjRVQWNsMFFhWU5hbkJaWkJHLytxUi85VG9sTTV4?=
 =?utf-8?B?Tkx2U0RJOTZVKzlndWV2WnJPd0QxL05xMVF4TFdJUk4xU0p5K2hHdjR2eEhw?=
 =?utf-8?B?K1FHVEVwRW1IYU8vTFphUXZvRFZyNEE4dzJXRVpod1k1ZmRqM3RHSEdlMksr?=
 =?utf-8?B?MmNEQnVoOWd0cmZiK1A0N3BtN1h1akpBeDYya3JGaXRjalBobEMrbmE3R3da?=
 =?utf-8?B?Z25QN0k3a3hFcUVCaTF3YjR6blhmNkR3N2Q5ajFSTzNlUURQY1N3UnBsVVBo?=
 =?utf-8?B?cGhRL01iN01pdWFCZkFDc1NMM2dGRmFKMXJRdnFHM2c1ZzJQQ3IvVGtqOGg3?=
 =?utf-8?Q?Z5q68AxLFeRjyRzgwE3EppgHm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb51df2d-13c4-4098-f11a-08db294eb1d3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:23:37.2420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DS91ZzXOSY6N8sHGUvQDUjaY4Bg3fIMXCXRlNRHbPRCjHPdaIGZhh7ijweWZDZctMRPbwAtadfB6UHEs35fyhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9712

On 20.03.2023 13:46, Denis wrote:
> On 20.03.2023 12:01, Andrew Cooper wrote:
>> On 19/03/2023 7:38 pm, Denis wrote:
>>> As you suspected, there are a few IO page faults at the end of the boot process
>>> (from my limited understanding it's maybe related to 
>>> "00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller (rev 41)")
>>>
>>> I'll attach the "xl dmesg" output file.
>>
>> Do you have this file?
>>
>> If they're only at the end of boot and not later around passthrough,
>> then they might be from other functionality in the Southbridge.
> 
> Sorry, my bad, forgot to attach it :(
> 
> After booting, the messages appear only ant the end, yet when running the HVM domU,
> a few lines pop up there as well.

The addresses are always in the HyperTransport interrupt remapping range,
so to me this is a fair indication of there being something amiss IO-APIC-
wise. As it stands I only view the "disable intremap" route as appropriate
for this system.

Jan

