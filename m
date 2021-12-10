Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DBB46FDCB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 10:32:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243645.421510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcGX-0005iQ-Sv; Fri, 10 Dec 2021 09:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243645.421510; Fri, 10 Dec 2021 09:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvcGX-0005fd-Oy; Fri, 10 Dec 2021 09:32:33 +0000
Received: by outflank-mailman (input) for mailman id 243645;
 Fri, 10 Dec 2021 09:32:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvcGV-0005ew-QC
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 09:32:31 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18bf62cf-599c-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 10:32:30 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2053.outbound.protection.outlook.com [104.47.13.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-15-JqxeyDmTPh6tvLUrZfxByQ-1; Fri, 10 Dec 2021 10:32:29 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4190.eurprd04.prod.outlook.com (2603:10a6:803:4b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Fri, 10 Dec
 2021 09:32:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 09:32:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 09:32:24 +0000
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
X-Inumbo-ID: 18bf62cf-599c-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639128750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7CeQ6U9qkYLcuHRR0iukM37EAFT/0aM4VwLDK2b7IBI=;
	b=YEIK05pFfgqGO9kbmO/0O2QyubBXZzAEot4M17SVArGB1mcxTcM/ObQ6ydMFx9BSJpcqhg
	iStUhc/uDo6M6BKWziMeKCiz0qjWh79RaOgvrXxwe35QRhRn/6lreUl2OQnE+lVvJlx6Wd
	SieVK04Z3b9ejKYMkRSNR2raLtUIh+c=
X-MC-Unique: JqxeyDmTPh6tvLUrZfxByQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AE1SHNj4Oqca6u05qxy3UNVa6mUwgNIyARdVALjUu1aOhBRTpMkiliwhOcxrHicG7XLtShVJjOUUIbn8p+4A8NrP9oYT2xQpoCTx2IeFLFLV2J9wcsi79/PWfZ3G77S/zI3uIvCn0EE5mWpzVHWLQnyvwvGD4pduUtanDxe8Hm9lKcRhSn3qDunjKxUWf++Q6ioOoz+Y28LSY4TOLO/1tgj0VlBNbAo88iBur7I5DYAk8fpVdHKT3H8Tt0amjsFhACrSuI33GBYje5SjCnDwBSNSJh/SK7e8mPR1Yf45TAWjz991jcaoc0W6LUwDsjNgDwWaDmBM0V+bK3juJ8GB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CeQ6U9qkYLcuHRR0iukM37EAFT/0aM4VwLDK2b7IBI=;
 b=jJ0CfdJz2L59X7lHL9C+GgjZS2J+igHlXn2BY/nCYMKOzK9xM9zPXxhPlg0QWpnnQ0on8ZghIOUlFHO8Aoc1UfvSIlNGen4OxeyVu6UKKQXENXWrFK9EDg6mke+xnZVPrcnvi5bFXYISCykCgPptw0Q4bzRX2siD+99iCj8aoJxo571HtmoaAzCWUvtsjJrve5D2U1iRbtWnhVrIJPEcY9P+HEVnlV6rrrqx6yNqc8ol0lDxQC1sGZpOiD1rnvDkl0U2FlPQUPzUTGgPwwa1kx67sgeAi9CCsm4KFuZ/t+bZtZo6mO8Y+nAzJttTJ/iqXh1NpW5fcJreMayKvBvdxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b0f15d3-b3b6-b5f3-8419-71b4d0cf0e28@suse.com>
Date: Fri, 10 Dec 2021 10:32:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Ping: [PATCH] x86/EPT: squash meaningless TLB flush
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
In-Reply-To: <c503e06d-9174-1dab-4f3f-1d7c88b499e9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0082.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c2380c83-991f-4b2d-6c72-08d9bbbff943
X-MS-TrafficTypeDiagnostic: VI1PR04MB4190:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB41905B64B7AF5531F6DB6901B3719@VI1PR04MB4190.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WPOwDdXKNXdpxYO/iiBgx5zyiAKPdT7bsL4ljZ9AKFzJKJJ+3ECEunk+4sij37leuyV3o4/o+thTQSN//TRHME2g4rZhtAMQxmkt0210oX1HE4nkZSwPu6pTQCAYFUwGuND/0ILaRLvW+d3zCTwcKxOnaBWzcc/Z28gqckIpmMj+yWxO1mAc9uJ2oHgXdPeKaJjZF1wMDXqu976imhiCJBft+uY0eSEFVkXKIZpQ0hbUy80F1PNOGDHkOdB6TxGqe55WMkeO990/TXHYnuF2qdoz07RBpybaRTo91PH0DEdNeusSjXrnGxArjoegOusIXSVX9xPwVlg9tQYSL8URBWuvWJ4S31xyMGmTFuxpbhzrBMHpkyynDKyVZ+2otj7ZitikJTRYTNJL2QWjwFEb7Cc1i3kgYzV2oDO7B2x8UAcarEUZ/gwyF5C/ZkaJcl/8b+zqHEQ+oQX7gwE05mvYyw4+koh1YJf5xRiwgHx1UB7/IKXqNTn5ZUKwVLINPCnso9Fq62FhbGJmLkiS/NLA+9EzXWYV3ZXygcP0hDPehX3IeD5PbGNiSnONba0E1upf3PBaB7gtbzNa0SgYYgCj+uf8OSHuSsy/3bwNOtnQxRsQrTbNZ8wDqjgGvPxkgoQe+qB9S7aS8JdElUKdGc72L3blMK3W2EthjfUEzE3PDo6YUp/Xaxly8rw9xC42RvCFfQknoyAGtRT5T7IjKvAgReYulfLnl15pfCLmiUAnr8A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6486002)(31686004)(36756003)(8676002)(186003)(31696002)(38100700002)(110136005)(956004)(53546011)(86362001)(316002)(8936002)(16576012)(2906002)(66946007)(4326008)(5660300002)(4744005)(508600001)(66476007)(66556008)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk5IWi9rWFB2MHl4dFl4Z2NVOTBaWDlkU25oUVRrNkxIMGdIWEJLZWNQVFh1?=
 =?utf-8?B?cDlhcGprR1ZRVmF3RHFxVWJ3STJHMWx6SUdUM0d4aDMvb21UdG1yR2pxeTJ3?=
 =?utf-8?B?encxYWRkT2VzODByN0UzYjFEWnlXZmZDdUh5RnBCOEU2bzVaQTJ2a2x3MGJZ?=
 =?utf-8?B?ZGY5T2NSMlVhQXF1dlhzS040YTdSOHNlbkxyVGlHNFdORmd5d1dBUmFYb1NM?=
 =?utf-8?B?dExIR3VRODNNWVlYMEtMdW8rNFZFWlhXSUJETVY3cTRFaFBwczlyM1cwWFRi?=
 =?utf-8?B?Skk4cFk2akpwUk4xYUhpSUp4Vm9UV0xtTElUc1VydFhxdzNobFJOMTlIRnBK?=
 =?utf-8?B?N3dZaVNlL0xCMUhDL1h4aTNZY1hKaGhrS05rZS9GY2plZmNwMGZlajIxL3lj?=
 =?utf-8?B?em51cnRWdTFFRWk1VVdyRlFLTkRrZnkrdDhKL0xoRW0raXhhTmxwQmJzV1JR?=
 =?utf-8?B?TG90RzdNQlVKOHVFdjdoeldjMzNxMFBxVVpHcCs0ZlVoYWN5bHhBRGFsM1ZZ?=
 =?utf-8?B?ZDRnUkFQeWFEVjUrY0thOUFDMG9CRk9JeFpEUGRNd2tFZGV3U1VFanBlTGlL?=
 =?utf-8?B?MVpqL0VxOWRsQ3dEUzF2R3VoeHczNXF0Z2dpT3hnTmYvRTRmUTBUMFFnTGMz?=
 =?utf-8?B?enJGaWFwSDk1enNPY2dCK3N1NW1jTnFFN2tHVks0WWhxdm1NeW9aUnl0d3NX?=
 =?utf-8?B?V24yVERLcUZSTG1iSUtDeHI2dkU0NVgzZmdRMG9JK2VMa1FjMWhsdkZ6S3Q4?=
 =?utf-8?B?eS9taTIxYmhmMGZlaFRjSTBReXhRL0k2eDNrSStrS0haY1pNWS9ZS3N4blR2?=
 =?utf-8?B?d3k4TjJDOFFLN1JrSkJ6L1JQcEZFSFpIZkpYOTh0eFZmNUIxSEhjcXAwQVAx?=
 =?utf-8?B?N3VSSjBERUFLVmlpYjc3bThPSmFMdWUrckh5T3dmMTZjcEtHOHNQZVpXSjUx?=
 =?utf-8?B?VnlqbUEzQ1pmS2JyYTFSVGdrclZrYkJYcEtYakdDd1NGY3BYbHlnS01SZisz?=
 =?utf-8?B?cE9ZZ3dqVjJMemZOREtkQ2UrVmhSZkVPYUVteHhHSDVvbjljV2hxeThDakgv?=
 =?utf-8?B?cDhJMHg5VFBEeGF5alFjcmNxRC90bmJOYVVLT1RUS2UzNGt0dG1DVVFZOE5a?=
 =?utf-8?B?WnM3b0tBd2tITlBIS1o0VmF3dThoL1JrTHVRY0xzdFpZRERFanNqWnlyc1I0?=
 =?utf-8?B?bXQ3UjMwaTA0ODM4blduK1cxd0hyQzVRN3dDWnk0dTFGL1dRVnl6UGRRVDdh?=
 =?utf-8?B?L0xXQmtpY3pBSHN5SndUaWVWb1pYdUJ2WnRYZTU3c0FIVGRLamxhRnp3K3dJ?=
 =?utf-8?B?RUxJeDFYUkpOMTloMWFPWGo0S2o3VnRtS3oyL2E4bG9Ca3lYdStUVjNmVFZl?=
 =?utf-8?B?K090ejRocjBpVmZDZGszRTNpR0x3TUppTldkU1B0WHRlakQwYzROWHNwb1pW?=
 =?utf-8?B?cGdNV0EvS1diWVdvMUx2NjBCM21rNkJZaW83YXJRVHJmVko1UWgrdEFnZjQ2?=
 =?utf-8?B?bG5rcVFNeE9Ld1JKdCtVQW5mbTFYTXlvVVZ3M0laQlZiYWVhd0U4NS9nTnR1?=
 =?utf-8?B?amNXME5xd0gzemF2clVwQ2Uxbzd6Y0FTWjl3NzR6WUlaRldBRmRuam82QnlO?=
 =?utf-8?B?cE85cU82UXhnUElMM2ROa1JMa0tJb2g1TlNIWVQvMFBSMGMwK0paM0x6RGtI?=
 =?utf-8?B?Q2JKY0dsMVRKQUJrVjhXNTZ6cjlTY0E1TjFiNnN0RmNjVmxEUS9oMmU0RVdV?=
 =?utf-8?B?eU5EQ0VZdElQTEJpWlBkTWt2eWtOYmdQUEE5WjN6amQrZEM5cVRINVQzQUhz?=
 =?utf-8?B?dU8yYXpwOGFCSTFkTGd4eS9tVDlPYU82eWlVMkhHTGdScUp3TnFJSURzQUFO?=
 =?utf-8?B?VU1qSGt2VjRqaEhhclRzZUlsNjh3Q0lOakpMdGZ2WlYvYitoV015aUhoUU0v?=
 =?utf-8?B?aGtrK3Y2UVJvY0xYNy9HYXpLbmZ3cHRUaTViWXk4c2hIRFIyOWloU3JuVkcy?=
 =?utf-8?B?ZDNRb0U0bDRFWDV2UE9taEIrL2pndHNwdGhWSThMMVp5akxhNXo3WFNrbmxZ?=
 =?utf-8?B?WG5YWEZGSUFVaU9VQlVvcVkrRVFlVlI1Q1lhTXVCbnpIK0g5WHdyb2NCNE5l?=
 =?utf-8?B?MjQ5bXNmaVE2cmdSeC9iK0hpMFl6RzZkR09GRk01WTFmNkV1cWxVV3psMGt5?=
 =?utf-8?Q?4B2lFTzAnERReLo95qRGB7A=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2380c83-991f-4b2d-6c72-08d9bbbff943
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 09:32:24.5758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+KJ0tGhGEUw/Fzoo0EBNg6oKjQTKnaOBmAXYDVJQpP8IHi1/5MYarP+X5c+C18oSqnyxuOu5+K5o352TNPTPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190

On 30.11.2021 17:10, Jan Beulich wrote:
> ept_free_entry() gets called after a flush - if one is necessary in the
> first place - was already issued. That behavior is similar to NPT, which
> also doesn't have any further flush in p2m_free_entry(). (Furthermore,
> the function being recursive, in case of recursiveness way too many
> flushes would have been issued.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

May I ask for an ack or otherwise here? From all I can tell I have addressed
Andrew's comment.

Jan

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -246,8 +246,7 @@ static void ept_free_entry(struct p2m_do
>              ept_free_entry(p2m, epte + i, level - 1);
>          unmap_domain_page(epte);
>      }
> -    
> -    p2m_tlb_flush_sync(p2m);
> +
>      p2m_free_ptp(p2m, mfn_to_page(_mfn(ept_entry->mfn)));
>  }
>  


