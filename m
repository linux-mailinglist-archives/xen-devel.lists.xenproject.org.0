Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7546444046
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220787.382191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE1l-0001QO-SP; Wed, 03 Nov 2021 11:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220787.382191; Wed, 03 Nov 2021 11:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miE1l-0001Mx-Od; Wed, 03 Nov 2021 11:01:57 +0000
Received: by outflank-mailman (input) for mailman id 220787;
 Wed, 03 Nov 2021 11:01:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1miE1k-0001Ml-9u
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:01:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7470bdca-3c95-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 11:01:55 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2054.outbound.protection.outlook.com [104.47.6.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-hRcxTh1UNRiAuoEmgV4thQ-1; Wed, 03 Nov 2021 12:01:53 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 11:01:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 11:01:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0039.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 11:01:50 +0000
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
X-Inumbo-ID: 7470bdca-3c95-11ec-8568-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635937314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0HVm1SDKyFermP+v37lZ/FDpUt2eEuCLTA6qXdb+7gw=;
	b=Yl2CWIupz3DJShCaTsPyamfmIwxSyFbyNvXTKUJi0MWuDkAPAG0m0RY3dqUMu1bSzKRUVl
	IFLvZxDZ6PW71V4yIBR5Bw1AaBbPgM6hzlxObROP+7wfvEjr7hFlc9wfEe/AUSsr2FAQab
	1Sa9dghuhDx+dVAsxzNJNXlSWPGUk3M=
X-MC-Unique: hRcxTh1UNRiAuoEmgV4thQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUU2GrW3Ri1fnE/gQ3syjp6YSNPrOMmMOhkmKIdY1xTYxOm4ifySmK79dP6LKvF/BltGglIAFJDGPHHXCXZcmtEbZunVpsTsljP4QAHOrTo8edW2IT/rjeD2boLuELUhhLvBlyPkfXcAV+n9eDywOz8OWCIH/n5m30bNUO/9Xn3igA8mmOZUoVt7hNbugYwh6O5xebiEj8cPxfgIjiizrkgssjyCDN7mVh/IcaW/CtWff91yEruHJtyz+5x2SxZQowpvkRlYI4FNygRWhnhso0jzEAfksRHvrTWc+ajTE/nQn7gbLWKZjRpx8Uwymy4xFN2xnmcUk2b2dsJbRV/wdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HVm1SDKyFermP+v37lZ/FDpUt2eEuCLTA6qXdb+7gw=;
 b=iHhbdWdoTM5CJQhNI5teEONRDhDxr2y7jf7miDZ2DUgdzWPxHE7jEw+cIyU2QfFO1BZSaY8CihDqjkWGfD+XudhPECfYIDCjsOVESF+909guvJqO9TKt9NAw2hCUFgG2Qah/O1sDbRm2P75yKo/EJM5A2qyoEzm2b62UqE/t3TIR0MhfP4vT+6OzsyI/xdFm0oM0nO5dm5EZ+9gk6mr5keERdFpVSazs4Cipgc54GWSr5F7jHp16C6XAgryAbcnEnhoyoqJCWk7pgVQCCqy+2MHNRyVlC8FZOY7SvAFU2OAMQgyXBNydD2tkRpWPTqkdiut8U5RocWjTnMSpws/oMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dde21f84-861f-9c68-5e55-28f5bf407aa4@suse.com>
Date: Wed, 3 Nov 2021 12:01:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 0/3][4.16] x86/IOMMU: enabled / intremap handling
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <09137aa2-649f-08fb-ba68-75f8eb16fc63@suse.com>
 <a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
In-Reply-To: <a51d6449-caba-8a67-3c11-b593574f3839@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0039.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4494b6ab-4175-4929-8bb9-08d99eb956b8
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295D3CBACABF79CD4B663F2B38C9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R2GAsoTqll4eHR8thsWFHzdhSTcH8cb+cOOpHikWHP+aLdvFKMDZ3wisMUigRvBeS0VdJXkr0LBh3V8RoXavW2D2QQK2Hq6HN4Qt86YW2yzR94H48aB0o7yvdIQbmRF92mG4xHdzFvhyQiEFgRkVrz1N6zMC+t9GbnOdmsZiXrWdCFAw+/JTIXs+ziSK1eSerLAzgc8//J+Jni12xD2G9gVbAOor1od5G2m51xmiFWh8RNWbSzu1w41ufS5WVRyOOz8CO73GENohCsBSwjhesvrNXual/20To9y7+QuzA0TUPgcJbvLBxOv59cD/A1ssbxjYqRG+x8hsq2jriYARwurUvhJR0oLu4gRAjVyqsA7HGy06jBnXXSAMIr/iDdjuYp03mDfDh+uBXcUqDw1EJP59nRpbOO8t+3GyNITYdUUuQESA+YClSh7YZgtXiAyjHP3elqpWG4Cpn7ABbAD/Dl1TOGtPIJu8vCnsd77a8kvgBbjKBSATLbhBf50UgbnlAVSNUlxOhw2RMp5+L3BU7wXBuehsSH2Ao0XPH40cHXOtnKKxe8U2FerohmZoA+tjeYX/SLGLdUef/DeHlfNzi/73dhRiqJjYhUDGFLlt2WC6x3WuIooaYZbl9bJdcpCbwT2YMRe+08UzQguL7HIB0qDL2OI3jqD4hISr7aGkpAMkIqSDsOahfWWeZ9g85gSJg1EsN3jhZtshbUykdweRWXP5v1RjeDWiY2HYkqL6Y2tN5/Wq7OzS5BM6BIN5E74R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(5660300002)(26005)(53546011)(2906002)(8676002)(66476007)(66556008)(508600001)(16576012)(31686004)(4326008)(186003)(86362001)(316002)(956004)(31696002)(2616005)(6916009)(38100700002)(6486002)(8936002)(54906003)(36756003)(83380400001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cldTS0E1dVRMV1pqN3hCelUwSmViRS9LVy9IbDdnMzdSWStpTlM1djJmNDlW?=
 =?utf-8?B?ckt1MElzZS9HeGdlUFpsVVY2MnV6NmE3NGl2cytIY3paSGh1eXBOblZka3Ns?=
 =?utf-8?B?ZS94d1VWSnc4Nll2RWI2NnkySVhYYnBDeXZHMkZ6Z2xrM2pVZlNINjAxbUlQ?=
 =?utf-8?B?QXFYbXVBd2pHREJoTTNTVWQ3aVFsTnV2eUpUVDM2b003NGxrRFIrVC9BMVpN?=
 =?utf-8?B?cUhtNEREaUtreWl1eHVJM0lsN3dkeFFtcElPajJMSjJtTC9PMEN5VHNWeXda?=
 =?utf-8?B?KytwYTEzZnpVMU1MVTlDK3hjVGphTDF4RHZTRFcxTmNnTGQ3SGpjaXEybzMx?=
 =?utf-8?B?aGVsbkdHZ2lGU1hQSGpJaFFicTBBZEtQMjZUYVl0d2JjNlhjbVFEaFRwNVYr?=
 =?utf-8?B?YUdHZ0Z4ckUydnZiYnZEcG5VTnVaNmdwd2VHRWU2VHdrVnYva1RqRW5SQTlj?=
 =?utf-8?B?NUpBd0xqSXJraWlxQml0azd1K2YzbmNpMGJ0UGNPVTdzczVpSkNFcnJib3hv?=
 =?utf-8?B?ZS9RcnNvOEkzTUp3dDBORDR3R0Q0YnZXejB1U0haWkFmcmF2QVVwSFhHV1pt?=
 =?utf-8?B?L0ZQbjlJK0ZHcyt0SGVBdTRqYmVmSFIvLzNNc3N3amVvNmVRc0pEejBzLzl4?=
 =?utf-8?B?S0NBL2tJb2creVRnRWtyM3pQSTNFOHZNRmx3NlBJY3E3ZzBtRUxFMnRWUVlF?=
 =?utf-8?B?S0dPKzd4UFZYTmwxZStudUJzc2JpL3hjUjlkR1RSZGoraUVSdFJZK1poU2x3?=
 =?utf-8?B?ZXpxY1hibWRNc21XSmhRSm9VcHdQVEdiTlRRMXhKZVBwMWp0NzByYnBlckND?=
 =?utf-8?B?WGJxck80N1hqU0lQbXUyQUhhaW1BSUpyOThDL3cvRkpGdTlEWnlUNjF3UjNJ?=
 =?utf-8?B?RmNDZmhyT0xlZm13M0hKQ1JWUGRQMC9sbkVCa2lKelNuZmdsWUw0dVBFY3lV?=
 =?utf-8?B?blYyR25zOUNUMjc4eFpHZ0phc3IxTzQyM0NScmJYNS9HN1ZvK1BKUVdPRHFQ?=
 =?utf-8?B?L0h3OHZRd09ya3l4NGdKTDErc1VKc0dtbTdpZmlrZ3JTOTByUUk5QXk2ZVZN?=
 =?utf-8?B?L2lPc0lOY01naUJrc1h3c2g1aC9DMHFrQytLRUhJZnh4ZmsyNHRQd1FNNGFo?=
 =?utf-8?B?NGtvL1ZURFVCL2ZXV0dybTNPdFRsaHFVYlh5ZmhvM0k0Z1lUMHdnWThrVG9m?=
 =?utf-8?B?OGJaNVlHbVlTcytZeFF6Qm8xT1hMaGFhMDNOaVBVc3hBZHZiNU9HeHJ6OGxR?=
 =?utf-8?B?STlxSXIweTM3TEVhNjNaam9kdDJsekZMYXZBNm1pR3BnQjkzTlpLUTJuamhB?=
 =?utf-8?B?ZW0wSFBCdjlINVJrcjlmUkRJOWdSZkFtQkRsckpIbHVmbmp3K0pZVkx6SmNQ?=
 =?utf-8?B?bGV0K2VqYzkwQ3NqMGRVM3VOSUhva0QxOGNqZ1B3Q0M5V3U1SWpRSTdhbU02?=
 =?utf-8?B?VnRUUSt5TFIvK3JLVTA5VS9EUkZTZUdBTnBxVldZYWJCWUJoM1hxbm83OGo4?=
 =?utf-8?B?N2crbnNNcjJ0VGppSDUzT0kxMjZnQlVFSU1VdDdwbWRubDhvOERST3REMVVK?=
 =?utf-8?B?UDZuaERVS21pRm9KaTVqTDlkWkRHR1pnV3o5V2pMU1RPMFJSekhOdUZuVllS?=
 =?utf-8?B?K3JodGJNSGdIVUFXbXBjTVF5L2R3WGY5NmhhSUloZHllK0l1cktiMjlqb0d4?=
 =?utf-8?B?NnFFSHdLcEwyZTcrTWVGUDZiTXhKYVRxUXpVa1VnNFlxTjZ6aXZydEI1a3dt?=
 =?utf-8?B?RWpjekdURHJyU3NvN0c5dTFzai9sZGdUZk5Pd2hzWm1zZmhTZVgzeTJtUW1V?=
 =?utf-8?B?TGhIelVGS0R2RHB1eHpGdmRIeWs1UlhmTmxwcXgvNzVKU2d0LytKUkhPTGZF?=
 =?utf-8?B?d0xqNkxicTBBNE9JS2l0alZwMm9GSlRkVW9ES3Q5UWtia0tYejlHck1UQmZM?=
 =?utf-8?B?VU43NVByUkFFNHBmdi8reHdjc2hQU09uVC9zRk9tN3Z0b0RJMjZvK2dVS3Uw?=
 =?utf-8?B?a09UVzNQUDU0TXZXWUE3R1NmT0I4aVlmaVBoS2kwMGlWdCtQaFJ3ZmpmNkRw?=
 =?utf-8?B?ejFTSVZwNEhXQXZzQjRrRWk2NVFyMXNjaUkraDM0cHdLRGhqV2ZmbzcwQVNx?=
 =?utf-8?B?WFF3UlM3NVo1bXZ2Vnh5b0J5RG1OSmxFaFBGQkNHcmpCZjhaWDFuOTNLR3NB?=
 =?utf-8?Q?e7djMq6nvwjuylMHDYtfZQY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4494b6ab-4175-4929-8bb9-08d99eb956b8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 11:01:51.1888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APazvBvZ5fBspYRQGr6QbsjJTPAYVcnDquVampSqNJldqrnMRAvl1iG/BUOq8Y0pJPcxmp9rm239yh0ZAmMIRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 02.11.2021 11:17, Jan Beulich wrote:
> On 21.10.2021 11:57, Jan Beulich wrote:
>> In the course of reading the response to v1 (patch 1 only) I realized
>> that not only that patch needs further adjustment, but that also
>> further changes are needed (and there's likely yet more amiss).
>>
>> 1: x86/IOMMU: mark IOMMU / intremap not in use when ACPI tables are missing
>> 2: x86/APIC: avoid iommu_supports_x2apic() on error path
>> 3: AMD/IOMMU: iommu_enable vs iommu_intremap
> 
> Ian, while we further discuss / refine patch 3, the first two have the
> needed R-b, but will now need you release-ack aiui.

Seeing your reply on IRC, here an attempt at a release justification
(the patches were ready by Oct 29, but no-one cared to commit them
in my absence, so I thought I'd get away without such a write-up):

Patch 1 addresses a regression identified by Andrew. The main risk I
see here (which has turned up only very recently) is disagreement on
patch 3 which imo has an effect also on what patch 1 does, as to the
(non-)effects of "iommu=off" on the hypervisor command line. This,
however, is not an effect of the patch, but pre-existing behavior.
The behavioral change (in this regard) is in patch 3, which is still
under discussion.

Patch 2 corrects an (unlikely but not impossible to be taken) error
path, supposedly making systems functional again in case they would
in fact cause that error path to be taken. The risk looks low to me,
given that two function calls with previously assumed to be
identical results now get folded into one with the result latched.

Jan

> Andrew, did you perhaps have a chance to actually try v2 of patch 1? It
> works for me when suitably configuring the BIOS on my Skylake, so I
> wouldn't feel uncertain in committing without a Tested-by, but it would
> feel even better if I had one.
> 
> Thanks, Jan
> 


