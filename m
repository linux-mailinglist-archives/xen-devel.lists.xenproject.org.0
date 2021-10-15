Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB8D42EEAF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 12:19:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210206.366982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKIv-0002Tn-Ht; Fri, 15 Oct 2021 10:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210206.366982; Fri, 15 Oct 2021 10:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbKIv-0002RL-Eo; Fri, 15 Oct 2021 10:19:09 +0000
Received: by outflank-mailman (input) for mailman id 210206;
 Fri, 15 Oct 2021 10:19:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGCa=PD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mbKIt-0002R0-Bf
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 10:19:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 537d2d04-2da1-11ec-822d-12813bfff9fa;
 Fri, 15 Oct 2021 10:19:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-36-IOfnjC1DPIG7Uj_Cy2Q5UQ-1; Fri, 15 Oct 2021 12:19:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5325.eurprd04.prod.outlook.com (2603:10a6:803:60::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 15 Oct
 2021 10:19:01 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:19:01 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.9 via Frontend Transport; Fri, 15 Oct 2021 10:19:00 +0000
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
X-Inumbo-ID: 537d2d04-2da1-11ec-822d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634293145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vG7th2ViwhqEtFmOJxS6pXO2/ai+G8iXQXhuBqqK2A=;
	b=hToeyWoTyw7KTq+ciNs6/jtn5eGrFL1NMSWjrR2VrPSCoclCRacsaV7ju+c7mjjQyr9n0A
	SjmilInEjdS/TRPxrcRzrrpWlcFoBBc4CPcTpbNP0Fp8pE1v6rVnzebtl2sQT0AAH3LTCg
	M1IQDw+MCqWysKZJcWvQR1c0Zt0P9ak=
X-MC-Unique: IOfnjC1DPIG7Uj_Cy2Q5UQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTIl/22J6k9ckUcMak60hrJKhSXey+letY2S9PpCTRlxjk9tBoZAQB+x4IWaNKoHuxHSJMhuzZUKKRN/zD6vpCYn2liEwTfRubVZhUQ1v54ELqJcMKP+aHL5hUY0gprW19NTDZix7vjgqBmWHCgVhEmnhOH3jikO8p9LiB6/cA4UFbso+gLqQwt+825ClWE8PxjqajKJtjFNgYm7o1pn1lYq9d/aNrBL6dd0fCVGfm6M7QTm11IG2NtNSQJRKu19tMvQlQEZTltXGtAIqVwGHg0VVzMFUToWVf/qFpTarXQjHKNtMI4ME0o0Mk1+pCb71HGF61dLDxfFSp5/adToog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vG7th2ViwhqEtFmOJxS6pXO2/ai+G8iXQXhuBqqK2A=;
 b=HYNcMjhFbI6hDYtlSnZ5+s3fjVvV5THMr/jlF8r5Yg5xMYMUtxp8nplGQZ20SuedVU7bk70qYrODIAgBCKjBnUV2IWHjka1fMF6hob3N5qSGpewvtYD2c0Nklu+rK7deeUnoemLgtz93l36vuMBebkorbAVGcOMP1iCouYw0QEtToL+FGU8sFFk0oCr2xsu52p0673IKPe+Ry22kVNchO4rWvCIgS/V5Xzc0qV3OVVdOtDe5kkZ1O0GoJ+kb7Awc1iYbHWieIGzTD2+2uL3wQLGS7ng29dYsDez16NYfdBxlI+rWCgIPrUfCZAWTAl44PKFqNKNsfYCJ+3nLa2RdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Ian Jackson <iwj@xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <f41f59f7-69ed-e2fe-dc17-434b456cf693@suse.com>
 <57A39480-34DF-4BF5-9B0E-802D30F94BBD@arm.com>
 <24937.21631.538303.29471@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8fc68e6-2bba-ef11-4c4a-50c2046ecb04@suse.com>
Date: Fri, 15 Oct 2021 12:18:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24937.21631.538303.29471@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8544c240-52d0-4935-43e3-08d98fc5355a
X-MS-TrafficTypeDiagnostic: VI1PR04MB5325:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53258224DE4C8F9077196044B3B99@VI1PR04MB5325.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iyHJjXt5nmtiKx691PXAdaI7yGcNOq4ujcoZRzvW4vF3/UUmm0Faz7FKuBkju8t1C3g6hyZlU/0biyRLqrOMsZWL2jaXO1zqnIVPRXwgK7P41annzWMNEGYMbzyAIVtWKKbGcpo7CMT6Ca3fNaJSfkBLVILZMK5Ut8GbcsW/C1yir6XbmOAjhQZMEIP/LH0DNVPJXxFiONFlnkoOKJMHwdsNQ0wasOsX43T0llaNvlwVpyxsvnk6EN06aD0O8x5K2/mdjqcvJ2Iut5T33BauQA5Po3FOhre0gbF05W/a2JX+AlcVUhCXbH4jO6RPU8bwIQzEk7cMoQrMSnx+FYQmXoaln0ymIMOmKRHkGL5VvRxw6UTJ2AHo5s3KpoXBJKbhDQjUiYI2Bff4HemU9fMZjmlegahzhltUI8IwCikAnuvqbkBWvc8FJHXjQIvcyl8ODTjzM70RG1ToAneixgLNEFtx1jH7PwAwhf1ODZG40wxtpfBkX+kYghTZDzVOS/krW54x+Rbc1NefSirKbtRSlT9n6+LB57BX6Ey0BHoHB1tk/Fn1AJIM1TMVawCXbaXS6CPEZ1EC0M2tTYQmX6MdODPR/dBCrI9gfX4bBJhMX/LPVi0V00Codpz7SVyITFrPXCpQMI5aDPkrh/zNEBRwdKCfKnUxhR9Hnlv6QiFa+J2deZXGpwk4+qyAEjKhADLaqH+hyq66mFiBQnUUexkKlLkNrlGMzETWIBaY/YuUl7X1UlWCIMLl8BL0AHiX9Jws
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(8676002)(31696002)(26005)(8936002)(36756003)(66946007)(2906002)(38100700002)(66556008)(7416002)(53546011)(16576012)(6486002)(186003)(956004)(66476007)(5660300002)(86362001)(2616005)(110136005)(83380400001)(508600001)(4326008)(316002)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2hBMzlNQkZUTjlHT3F5bkZ1aENwWWpib1I0REttOTZBNm5CK1FucElmRDUx?=
 =?utf-8?B?SFErM0M3ZVJKWDk0eHRoMU10QkNjci9YcjlIc0JoeFdYRkgrNDVKM2dvcFRC?=
 =?utf-8?B?OGtsYTRmQXE4eDRwSVBPSTBsc0FUN3JJN0FDeFkycUIrZ0RTeG9SRWRYeUlJ?=
 =?utf-8?B?K0wwUWw3cjlZZGp5dUUyMHR6ek5TcHFKbjJiekQ5U0FpR3VWNTkySzlSNzhI?=
 =?utf-8?B?MHQ4ajBBNUR6OFVKN0Y5anJ4MUQ4bHBYNDVKZHBOeUNnemp3TUs5N3ZkRVBi?=
 =?utf-8?B?QzUySWQ2a2tIbFArKytUbzIwbFhtYllFSmhLdHJYcXRJNC92UnUzWFB2RHdB?=
 =?utf-8?B?Ny9adm5ETEE0N0FnbXdhWExWQ0UvRFZnOWh5YjdETXNRNkdnSnV1WHo0SDhQ?=
 =?utf-8?B?TGtQY2E0OGdtbkZmZmtnRTYrODN0eWtxWXFFMGdWSTdGTFNJd3VQbmlwNmkr?=
 =?utf-8?B?QzE0NXY4MDJIeC93SGdCRkVaTXJka1dNUzVNbE1OOEZUenoxdnB4ZVlMc0Uv?=
 =?utf-8?B?UElqYnlLWTEya09jaHpNbUlNVzdLdG9mVnR6Q3h6bFdnNTdIbXVqeTM3UkZG?=
 =?utf-8?B?ajZWK1lyQm1CU2xuRnNFdlY1VTU4K01tM2RGa3lwb0pxZTBlTU5uejE4Q1FK?=
 =?utf-8?B?RmdhYmZtNHNPdDFRS1p5NytCWlMremVtS21zRzQyRFpGK1pGZ25XVlNaaGZz?=
 =?utf-8?B?Vlludk5JclRJVy9qbGxjN3MwRHRMNWQ4VVNteE1NR2VzOW9WMXk2anQwK1ls?=
 =?utf-8?B?a213MHl3ZHlMMFgrd3UyUFJXU2JDeDVJcWRsYTB3QjQvK0VkbDE2cnZmZTdW?=
 =?utf-8?B?TXk2SnhMSmtFT0tPR1JnUmlZc1ErMlF5VHp2NTFEZEkrUit3NCtseHZCSzVq?=
 =?utf-8?B?OEFMSzVCWlgzZEt1dWppMCtlRVdXY3pqUi9wcnlob3pDRVZ3c2V2anYrYXdw?=
 =?utf-8?B?cG5KazF4QkNDWVR5WHptVTRISkNNRVRBQy85OVl6V2ZWTUhFdWVPekZyVmRV?=
 =?utf-8?B?R1JSbnd5d2pnV0lVT21xaVNlU1U4R044eEQ0Zzd6bHREaUMvNUVCZWtXdnp3?=
 =?utf-8?B?YThlaVY5Y0ttYXorYkZvekg4NytSaGp6akVFeTQ4SHNnZ2JnSHEzQkZ1WklG?=
 =?utf-8?B?Nm5MOFV1cVJEaXhlRitsQXpLRkxKWXF2VXJickJadmhLTGVnaElqVHNzdXdm?=
 =?utf-8?B?d2JDZ2gzQ2h5SVBVcFlVTXNoY25UVDlxODJ1QkovRlBFSmlSRHJWSTNMN1NB?=
 =?utf-8?B?bzFXVHpHYzBQdTJVTmdlMGdKVGFCKzl3ODJUNGU5djFIczhUWDBvdjJ1VXZi?=
 =?utf-8?B?YzFvUFZ2eVBNZGdMVHFKWTB3VjR0TFNwM3c1UC95dS9HV1ZneCs3b2llMi9L?=
 =?utf-8?B?UEJSakZKMDB3VFRZbkRYcWdLSGpDd000Z0VPdFhoQ2ZsM3g2T0FqdytqcUZL?=
 =?utf-8?B?aHk2bGxTbGY2LyttZlJ6RGxVdjlxRXNSeFVHRGtIays2dFdGRUdCU005Tm1w?=
 =?utf-8?B?ZVRXVmwydlN5amloMVBVYTE2ZkNWU1JrZzhvbzJzQS9wcVZGbklueFVWbjdP?=
 =?utf-8?B?ZXpoVU8xbFlnaGdybFZyV1hqbHdXM1p1bllKMENPNnV6dW51SkpqREZMUU02?=
 =?utf-8?B?SjgxZXd4MzQwdWx5UzRUU2xtc05zcmV3bXZRcUR5VmhwYnpxd0JwbVNUMW5z?=
 =?utf-8?B?bEIwYVFmVDhBQjBQcWJabiswb2tZN2FpdjZidkhJaTVoYXBUYzhYNTc5OW45?=
 =?utf-8?Q?pqvAiRmDO1/oUXrNR66ah4optln8ALrGokl0oK1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8544c240-52d0-4935-43e3-08d98fc5355a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 10:19:01.7032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlW9zH9E7ONrThLReatFtndkoBaHuHPao0n7YKOwJZTV14Ft8Iqx8umuwRad4uCV0N+viSpIc9JzhuTwDj9ArA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5325

On 15.10.2021 12:14, Ian Jackson wrote:
> Bertrand Marquis writes ("Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI support for ARM."):
>>> On 15 Oct 2021, at 09:00, Jan Beulich <jbeulich@suse.com> wrote:
>>> The latter is fine to be put here (i.e. FTAOD I'm fine with it
>>> staying here). For the former I even question its original placement
>>> in asm-x86/pci.h: It's not generally correct as per the PCI spec, as
>>> the bus portion of the address can be anywhere from 1 to 8 bits. And
>>> in fact there is a reason why this macro was/is used in only a
>>> single place, but not e.g. in x86'es handling of physical MCFG. It
>>> is merely an implementation choice in vPCI that the entire segment 0
>>> has a linear address range covering all 256 buses. Hence I think
>>> this wants to move to xen/vpci.h and then perhaps also be named
>>> VPCI_ECAM_BDF().
>>
>> On previous version it was request to renamed this to ECAM and agreed
>> to put is here. Now you want me to rename it to VPCI and move it again.
>> I would like to have a confirmation that this is ok and the final move if possible.
>>
>> @Roger can you confirm this is what is wanted ?
> 
> I think Roger is not available today I'm afraid.
> 
> Bertrand, can you give me a link to the comment from Roger ?
> Assuming that it says what I think it will say:
> 
> I think the best thing to do will be to leave the name as it was in
> the most recent version of your series.  I don't think it makes sense
> to block this patch over a naming disagreement.  And it would be best
> to minimise unnecessary churn.
> 
> I would be happy to release-ack a name change (perhaps proposed bo Jan
> or Roger) supposing that that is the ultimate maintainer consensus.
> 
> Jan, would that approach be OK with you ?

Well, yes, if a subsequent name change is okay, then I could live with
that. I'd still find it odd to rename a function immediately after it
already got renamed. As expressed elsewhere, I suspect in his request
Roger did not pay attention to a use of the function in non-ECAM code.

Jan


