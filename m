Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A73C542891E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205474.360779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqz7-0005ik-19; Mon, 11 Oct 2021 08:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205474.360779; Mon, 11 Oct 2021 08:48:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZqz6-0005gw-Tl; Mon, 11 Oct 2021 08:48:36 +0000
Received: by outflank-mailman (input) for mailman id 205474;
 Mon, 11 Oct 2021 08:48:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZqz5-0005gq-9u
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:48:35 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 041e8ee4-2a70-11ec-80d1-12813bfff9fa;
 Mon, 11 Oct 2021 08:48:34 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-Nvly-ZQePSCTwNZddTJu0g-1; Mon, 11 Oct 2021 10:48:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Mon, 11 Oct
 2021 08:48:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:48:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Mon, 11 Oct 2021 08:48:30 +0000
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
X-Inumbo-ID: 041e8ee4-2a70-11ec-80d1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633942113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=obiM2HjdzT3HorsYf+EzFdPbdqP3jaTwHzTN8YaWOjI=;
	b=NAeN7+jiIugRd3m/OsnXmBGXtyJlehWo0ajAJT/soeC4n0GyP/8Cv8E2qWrEPhgTS90ODh
	S2wJJMxj8/H9jtVvAA+FBJ1kz1gjn+25IHWR3Drk7C8ARapk2Gh3R5ifQmMBY/Ljg1eE61
	dUm+JiRPy9/ZpRITYWwhU7UH0OWcj+8=
X-MC-Unique: Nvly-ZQePSCTwNZddTJu0g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoNHRtJkoiAxJNu9gJYTFxpqLxwUKmJEG1QYzONFEvkd29btg3yBCysBRGiOd6I8YOiubTLftblEsYAzWt35GPBVAqE5043N2Mk4PXD72N1szL5RQv58s+FfcFt+xmHIZvdxn5ga1bSrywDjZXWVvJKs0p8yvhMQ/Hu0dODaqho/V7Qp94um/Oot9KPubontITu2fQ+IVG58oEH+AImww/UB9bSs6jmfXnfE8k8BRG9O7UTrTB/HnfBG2HlCBm2Sk+nNJNsJLixdPboRhFXKOH7x3Ru4m0kWuEMWynTJr7tACup53KJ5h58c7pQsRGfAf+wrzuBsq6HVvcqGL7A9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obiM2HjdzT3HorsYf+EzFdPbdqP3jaTwHzTN8YaWOjI=;
 b=jJ7NO3bPjKTCXCuFykSZCX/0N3EZVOrcCE8vxMG4kS/Fyt88U+1qMkOsOuuiY0zDUVXBBzEtXsW9adsvbEN+sYtnEf/IimsbW1QKDAlOKZvr91O3FQk9VgiAjVyxzfIUV89iPXsg29oZFGIqRF5QhlOh9gGEZttGb/9H13msbv4AuXMr9ePTvRBkzmKiaClI69brLnV/VGAKibvJrp2T/XjcHpOj1/TaaRIftUoP0el8KbBGxc/rtPhw9QXiBS0XDn8TCw1YcuiFkrqYp8xlzcxukG8Nlb/8uskLluqq/S6GbXbt7lDCxn5151LuZ7WvDMU0nQUUJHCd/tAa8R6qgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] VT-d: correct / extend workaround(s) leaving an IOMMU
 disabled
Message-ID: <ced41449-6aa2-3b20-77cd-78dafcad4bc7@suse.com>
Date: Mon, 11 Oct 2021 10:48:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 397b18f1-de98-4724-6ce0-08d98c93e663
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7150F30B672520CD71438E53B3B59@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wSluUst639k7E6O7SOthDxoUIb876QY7UOaWjJjDMrFptQ9SbFgoRj3zBYKFimUMUAPul2skpXa1Rt9h3pLy+i+e1RAa0RvzW5SkGBoyhrvQh52lj79zWj/trFMeetYSFah5u2Axa4CDnsf8deJR/bmMGHzLJQHj/ypfy77Wa3EHN5c496OUWIhAi0jxZEdPkUX+LbAfA78ewh0iRS6YL5SmwBA4G3sVz5ypHZFflJtAT6tcQUr1ZecIXrdyA6E+cdmzyZFDdt6SxEear/NhOIBXSWt06m3btjLRD14rvEXCqseurjMyYRBg5VcER05gtQmFDHZhyUAlw6y0E5M5vYNBqGGOiBulkhIgNl8VJI2jD1amtkBViEkPUKR1NlPfj9D21wX48Beg1vw+85JzmYgo3k9RCvfDC+IMWeRd/W2ZEXUrHpP2+1vyqbv8OOKarVpwblp5rRLal5+xllLx5JZq/8wAKjnx30GSzQNd9ThvSOe78HsTS+q3fr2k4SW3Ts4zreYY0ILQ59i56ZWp2RI6AWHr3BV/h/926KGaMP4vWvHgMeUrrpLlfSKixWGMIXP9TAf/T6t5SJ+mb5SU2KqdQOnQCzbtvdypcqtbM69SBRPC0V9uDZHjtPVFTCPM6rW7AK6f/9ZM/3mFn6kD7l/k7Hx4xvetZhr1nDYgtzJFZTasu/lTAT+heUEZLRzMOJQ+9eYLrzVB3no2RjIMiwsQ2wo4sfY5DughwcLUXN0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(31696002)(66946007)(316002)(16576012)(6916009)(54906003)(956004)(2616005)(66556008)(66476007)(4744005)(8936002)(26005)(2906002)(508600001)(186003)(6486002)(4326008)(83380400001)(31686004)(36756003)(8676002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1EQkRwL09RK2plTEcwRXBsZWJlS1QrTkFKNWVaYU9LK2p4OUVrN1VERXEx?=
 =?utf-8?B?dDVSS1pMK3Z5T01hb0xxanlVeVNxMDJ6SnM5YnhCL1FwNXR6NmEzbGo4T2pP?=
 =?utf-8?B?ZkxpaUF6YTQwVmliVm9OV3NZMFhWYW9Uek1IMXcvOTR6YnJ5Ykc0ZnZnZDJm?=
 =?utf-8?B?MTh4cWVjZUZIY01nNURzL1lMaDVFejNheHQ1b0VDY0xZU21sNDl0OG40MGhX?=
 =?utf-8?B?NnljaHlmZmtPOG9wdEU1anMraThkT1pFREdIbDNGZmw3ZzZNV1dvQWtXQmlt?=
 =?utf-8?B?RWdUY1VwUGV5dmJCdFJpTVRYWTJYZ3VHOFdMRlZZRHdNdnBGTE9FQk9kL2ZY?=
 =?utf-8?B?b2JjVTVCSndSUWR6aCswMDdoNzh6RmZEZDZ6Y2lFTENweU5EYzYwb2VNN1da?=
 =?utf-8?B?ZytoMlFWNGcvcXpaYTg1aE1aQ1d2RnZndWplTWttQWl4TnpNNzdJUTZLSHNi?=
 =?utf-8?B?WE8rV0ZOZEM5UER0Vkl3RjhKVkxNMzdIVCthTGxpUFF6eU5nWndENVRva0dJ?=
 =?utf-8?B?RFZVMDRtUDlmUUNSZXR5RXBjcy9ZVUMvbmVMckNtMGx1aFBOdFcrZy8vWWRZ?=
 =?utf-8?B?NmM3NmJWRE5mSVlCTXNVRURDenpoN2VwdUF5VzZsWU5leStaRFJaSWxIaERz?=
 =?utf-8?B?djVNUzBUS0MvZE02dTFqVkxiR2svU2JQRmNOS1BhSUtqbElVenRCZ1VCQ1N2?=
 =?utf-8?B?c0pqUm9EcThTbDZDZFZUSitoNjQwUmx3S3VXTUJmZGJjOHZYY2ZEejl2NEYr?=
 =?utf-8?B?dlhuQVV5VmFBRms2MkdzYzAwWTh4TzBRRnFKdmpLWTQwTTFuNUJMUDFRZ09p?=
 =?utf-8?B?MmVpemJ4UndjNjFsU1R0RnRiS2lBNEtXY1NjWHFPR2N1TjIycU5FSG44WHB4?=
 =?utf-8?B?SmVrZW5uQjFRbVAzbGRBaTdvUGNuMUF5SkVWQ2VyR0ZoYm1jb3pCTGVJbDZM?=
 =?utf-8?B?MFNOVzZaOUhGdzJMRzJNWW52aHFSZ05aM3lYeTFiLy9JbVB2R3hiam0zQXBn?=
 =?utf-8?B?UHBHOE5adjBwWElWdGZ4NExCT0ZUekxPQ2o5cVBnVHhJN3RyVTlpV1Rqc05w?=
 =?utf-8?B?V1JWVlpIUUNKU3F6Vnlkait0Tys3cVZTcG9vU0s1MzFCcSsxQUYwSEx5Wndi?=
 =?utf-8?B?K2ZDNjU1c0hCQ1lpV28yUHdWbGVEWXVlcmdjVXpwNDBvVlVYV0RPdmcvbU9E?=
 =?utf-8?B?bmp1alJwc1EvdXE5bWRyZUxCM3I0VklPTkM4dEpMbEpUc1pMYnU5MG9aSHZq?=
 =?utf-8?B?aW1FMmIrbTgvZ3VVcWh3cVZEL2dEZ1NERUFwVWtRQXNjc25jMXh4UGdMbjJO?=
 =?utf-8?B?ZmdhT1BEUW9ZS05kNGVmL05oYkpPczhZQ0RnQ0FLZjlEYUdsa0pLOHF4NUNs?=
 =?utf-8?B?eWlzL0JQRXRDSlBzM3FWVExzU0phN3AwakMwbmJsb3JNTitYUktkYjdWNGs4?=
 =?utf-8?B?TFB5cUdHNFhoMzhpa3U4M05FKzJXdlVVSkdKdndJMEx1L2FGelRUa2Y5VnFt?=
 =?utf-8?B?UDZBZEVOK091NkNuTzd1NVl5aW0xTDhxWHk3VmkzNnBabFBOam5rZlNVcSt5?=
 =?utf-8?B?VHRWZzdySm1jSkdsdTV4WWFXVm5TdXptb2FxT2thVUZsOFpEb0pwelVSSEhJ?=
 =?utf-8?B?ZFpVb2w0NHo0V2ZPNjlDREM4anJFd05NMlB6bEk1VDdaM2R5WThVTUVHaUxB?=
 =?utf-8?B?L1hYUzdSWUoyU3hGbkN5MFNlTXh1T1AwUjZxS25tbklCTjhzZUlvREU2bXpQ?=
 =?utf-8?Q?HHtqYGSASLD8kWECQsVBv2NCo/xcVJyvSVFbt1P?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397b18f1-de98-4724-6ce0-08d98c93e663
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:48:30.4121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eh2zwBJZEufVqV3zyvIg1a4SGsT6GVfEFvl0yvofCGDYO9kmfn6POakhT64tJLzZ4ZtfPu2J+4r+Xuja2qg8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

This gets us closer to what Linux does, which hopefully improves
the experience for people running Xen on affected hardware.

Ian - I'm also Cc-ing you since this feels like being on the edge
between a new feature and a bug fix.

1: generalize and correct "iommu=no-igfx" handling
2: Tylersburg isoch DMAR unit with no TLB space

Jan


