Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9BB3C98D8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 08:38:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156395.288560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3v12-0008GI-AK; Thu, 15 Jul 2021 06:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156395.288560; Thu, 15 Jul 2021 06:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3v12-0008Do-5j; Thu, 15 Jul 2021 06:38:36 +0000
Received: by outflank-mailman (input) for mailman id 156395;
 Thu, 15 Jul 2021 06:38:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U73d=MH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3v10-0008Di-Pt
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 06:38:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4656ec8c-e537-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 06:38:33 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-eDhoEMmKORmp5sAHS3gpxg-2; Thu, 15 Jul 2021 08:38:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 06:38:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 06:38:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.23 via Frontend Transport; Thu, 15 Jul 2021 06:38:30 +0000
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
X-Inumbo-ID: 4656ec8c-e537-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626331113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n4jDv3GrZh+N1xcY1h2t0YTDogdYBMt0c5lboacvDeY=;
	b=COHtmdiqZQgmmSVwdho3k1o0ndkYbRsLnaiodBoJuu9BGW8PbRcIS78qRqsadtIX+uzUzJ
	0oMyxz3zu9jFpoEiFdP6EjjhWQ4G1F/XRi92wxwcgQFINc12p9kZfSBad6TqY4CZdH13kW
	jqQ+/nGk31OuaGSUBD93slOdjgt85UU=
X-MC-Unique: eDhoEMmKORmp5sAHS3gpxg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDktseBpViaRO14P1Yb2NRy86E7M9qevsiAtbhRhj7Dt2SahPR55zEgAANzDtBA0n0uF3gQR/bNBRCJCuwkZ/V9NUgwlndsoUKaRZo0NJIlS+57xBilmgUsE70Z9VoVlgPQbEv9g5g9T5QthN2ZWljtTse0f3Sg4SAVZPLydxO0+QRc+8RXdIvSNYgCraxifTNzfuxQW7dzFVvNHNA3AjjBQ95puEV3M8AEUjaN9OPBriEQ+ztj4cmMEGUsHznn0C4NOhjbpe8+mx3WWKrQ7omhQWS5Q39++BnLdfIfmuqgb7Bz/EtWeHQZX2AajOEuap0m9BFm2RGUKcX0KHfpCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4jDv3GrZh+N1xcY1h2t0YTDogdYBMt0c5lboacvDeY=;
 b=QQZMLCRWlVzVClX7GG6zfyKk6pGX96EjsUBv404aCCeaHmMbIAy21eo1BtDnwlyi1+oJlwFg2SrBK3oH5OYMr7wXK4w0Ff/uDzGNnkpcVleL0DjUkpyR9j9ixRH9ndckhUcVAv3ASbI7g13iEn14oNQ2lnUePDg1T0tugpDL0IyO1dRNoQERxVEI3GrP7rqB3W63u1xIv9KyFGkFAx01CQVdaAlgZMvFFixT/MNY6cmlJRzUTwgu9qwgzCJvCrI4gV/UOtaVHeFICUvo6jZpXnwoteL0sPk9s4Hu/+6O421/a/UMM96r8x3t9v31IqN73KfgDK/+7Hm7v5BxaVhp7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 13/13] SUPPORT.md: write down restriction of 32-bit
 tool stacks
To: Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0bebfe8c-6897-dc8b-7fe0-9127d4996eb8@suse.com>
 <ddff8b28-274d-d7fe-4ba9-0772859b7a72@suse.com>
 <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dfc17ae6-2100-cb27-9826-1f6001788707@suse.com>
Date: Thu, 15 Jul 2021 08:38:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <e12989f7-9217-e2b8-a17d-5c252dc89248@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0215.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddd1bb79-0eb3-4316-748b-08d9475b28fe
X-MS-TrafficTypeDiagnostic: VI1PR04MB5600:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5600340E39B8E93BFAB0A02BB3129@VI1PR04MB5600.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	udrp+Ry12INI2eknZYgamTVIDBNPtE/a7YEBVR8Qki39EP9Ojh9LMjjH4gSNrJN9bEFObaZs1uyO01E3azYPqfpLj04yfNPqF8rMyKLz7iyYEL8NDM7ECN4NShlHUmxQDPXA9t44+2pcgqnWsgD3eroTZFyR56im4VXdcVyXQhPNhs7eNwPTL/zvXfZ+HO6onfAiSpquY2rIaFFaVN/rerSTlF3NLckQEc4KkdPRAJNmmrOG6ryYGCNNTO2bd5o3Qd83MCqTCskLEv4sijFztdoo6VkTcYAzsGTib57wo2Wvd4rODttTx3tbRPQYKEEtoYMlPiMfwBa/BKm4axSu2C+IYu8AI/CftmyuT+o1bDymdCUYBD/Paq8bLRvv3AlWmX9pUyLYljOe7BX32u26fF1gMB4gAE1VXgTTXewXZ5mEK4zyZW8hVFv4R6TGKDAVToB7+AGDKSPBv389KD4pfy4s1/tBfJEhtaTgAZ3sUsXKeKrRpfD82ZnQERY92Bt3MrDhA2cubRTm0SemPCiSBdSiCf5nyjKeMgGjDnmhiP+CYaTwh4J4RcNefefAvALrCpbRqOyHQ5qTf7Lobo7MmJT8jKQ8uB7bHr3n/WqLW0m1kCIipiguBG+KCWm/ZBuL8Cw1OovwasfukLOcQ+nRZn3h3GPZIQaCfKmSg+JtPS949i5rTTuA9q7TWFCwV9wXjbVzQhach6Fpm7bTvGmyCgQAiAq6/NeTnpWWTzBg+m4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(54906003)(83380400001)(66476007)(86362001)(66556008)(4326008)(31696002)(53546011)(26005)(316002)(478600001)(186003)(31686004)(8676002)(6486002)(4744005)(8936002)(66946007)(956004)(5660300002)(16576012)(38100700002)(36756003)(6916009)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHN6Q1c5Z1dwd2s1UjFYblhwZ2x1WEFISjljZGwvTmwrL3NMeWtWVEhMcEtF?=
 =?utf-8?B?bWRtb01VWkIreW9GZENHTzZ2eS9idmhrVnNSbG45OUZoL3FzYzVibVBldDQv?=
 =?utf-8?B?SWhadUc0K09wVjYrZEVTVU5aZTRvZUZJeVlUelNvTGovRWNHcktienBrZmY2?=
 =?utf-8?B?eHNjUWM0cm1wU2Q0WWlwa3VEWTR0WHduTjMvRkN0ZE9GcGExUXlWaTVDdVZR?=
 =?utf-8?B?YmtESUhkNmU1NCtTK04vdlFGcTBIYjJhSW9hdXRKeGIyakJVRjkrT1VHY0cw?=
 =?utf-8?B?RkJ3bi9jZ1p4dDJiYW1GWjVpMURyWDNJeXBrQkEvTGprYVQxVzMvSWZ2WDRy?=
 =?utf-8?B?cXEwY0s0S2pja0JWOG0xbUZ1L3pSdURqdUNFY2FBMzlnbHI1Q0pUY2lLMHpB?=
 =?utf-8?B?MzdMbzMvelJMRHNoV2xQREVjeHcySTNnMktqOFBtZG9hZ3F3Zk9LZWlZSlhZ?=
 =?utf-8?B?T2w0cERyazArV3lVU2h5MTVZdTNBTDVpeVZ4ZWVmTmJibGtYNTR5RWNnTmZM?=
 =?utf-8?B?NWFobi9CRk9IL0F2eGVPdnJkTDFFQnl4ZlFRWHFSc1VaUDNOWDhkbTAwQm1O?=
 =?utf-8?B?dWczbGczRWVLQWU1YzZKUUNpWHRXeE55MEdwblF2VmlmNXlmMndDVXUrNnVm?=
 =?utf-8?B?amtOMkxzSGxObDR2T1NTVmY5NTRmSEdJOTdGZUk3ZmhiRk1iMnN0TFNsTGhB?=
 =?utf-8?B?TkQvTTJVM2N1MlZndVlhRjMxT21DNGhHTGFCSUFTZS92MmxFWHoreGo4Q3Q3?=
 =?utf-8?B?VE96bkdkSDJST2JGbU5VVjg4dnpIK2J5bDhmVEVSVlZ5ZHM3ZTNjanFhUUNy?=
 =?utf-8?B?NEh6U3RwN1FodnkrM3BwSGF0ZGtBMGc4L1JSM2xQbTNqaklLZFZ3Z1p5QTNx?=
 =?utf-8?B?VFpNVVY1RVY1WWZIeHVwakUrcmdTWEpyZFFxZHd3SExJc0VxYlNNRWZnZi9L?=
 =?utf-8?B?TlhKd3pPRXN4NXN1U1R0ZTVqc2g3N3RPaE1XdjJ4NzFVTkJ2SGIvRWE5dmtH?=
 =?utf-8?B?T1UwQm9QVURVOTlWNFRUT0lTUVRTTklWZk12N3hGNmYxMjJ1WGR6RzNrU2h4?=
 =?utf-8?B?QjFMUHI4Nkt0SXlnVHFOY3VyMnEyZ0R3ZExqWCtCTjE0VEZWbUVrbk1DTVpX?=
 =?utf-8?B?WFdMb1VsblZ3QU1ZSUR6blA2YmF4S3dVYnk1dGFzSmlmSHVjNU5hN1Eycy9o?=
 =?utf-8?B?WDhRUHFpd1hRbkJMbi94alZYUkNnRjhXRVg2UzQwUFFidHp4VnBXcnJYYWdR?=
 =?utf-8?B?Q0R4SkUvUVEvWG5BMjljbHhXME9QM2RtS0FDYWluQis3UDZ6a1hYZFVidGZv?=
 =?utf-8?B?RFFZUTlzZjBkTlBaRElnNm9QZUpDMjgvdEpHQnlVVm96cTRpbzBpNkhZTWVy?=
 =?utf-8?B?RDExWDVWUGtudHcrVHhLK1cvUGdINjdFcVE0NlNwbjFEZy9qa09IQ25ISnVB?=
 =?utf-8?B?Y1RXR2RmWktnTHpGL1ZHVjBwNHkxVWNoaUNLOHlTbjAxKzduT2ZIQml5amc2?=
 =?utf-8?B?cHdEYnZzT3FrdHhqK2pZTUNkSXZsbm1DUWxpOUhkM0xlUUpSc1BHYkhoK1VD?=
 =?utf-8?B?Ni90Qm5KNEhTV3NKOWc5Y0VBUmxTR3ZyelFtRjBMTGdkMDlLNm9CMDJwdlBX?=
 =?utf-8?B?Vk9SYUdhOWJndGN4OXVIQ3AzR0IybFB6VUV2dExrSWNkU0Fsb09WaFdzaUIx?=
 =?utf-8?B?TU43WDJxMy9Oejl2cGsrQ2t2QjRJKyt5dnp0T0pwT0ZmYzZjcEhMSFUzdERR?=
 =?utf-8?Q?ge1snkxpkAF4MAgphsAUIsPs4RPZx5+eapfCqBh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddd1bb79-0eb3-4316-748b-08d9475b28fe
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 06:38:30.6295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z6GB1dKJ7KHTTffGwCtp9zw41o8q3N96oIHYx5Z3pDGjcUR5BREPxviccArC45rYhXWwzsAXB5vE5BFpChlXGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5600

On 14.07.2021 20:16, Julien Grall wrote:
> On 05/07/2021 16:18, Jan Beulich wrote:
>> Let's try to avoid giving the impression that 32-bit tool stacks are as
>> capable as 64-bit ones.
> 
> Would you be able to provide a few examples of the known issues in the 
> commit message? This would be helpful for anyone to understand why we 
> decided to drop the support.

Not sure how useful this is going to be. This would be pointing at the
declarations / definitions of various tool stack internal variables or
structure fields. Which also is why ...

> At least on Arm, we tried to design the hypercall ABI in such a way that 
> it should be possible to use a 32-bit toolstack.

... keeping the ABI tidy in this regard didn't help at all (albeit it
of course was a prereq to writing a tool stack that would be capable).

Jan


