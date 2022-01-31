Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29EC4A4057
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jan 2022 11:39:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262929.455400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEU5d-0007eH-Pd; Mon, 31 Jan 2022 10:39:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262929.455400; Mon, 31 Jan 2022 10:39:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEU5d-0007cQ-Lv; Mon, 31 Jan 2022 10:39:17 +0000
Received: by outflank-mailman (input) for mailman id 262929;
 Mon, 31 Jan 2022 10:39:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEU5c-0007cK-EP
 for xen-devel@lists.xenproject.org; Mon, 31 Jan 2022 10:39:16 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08e52189-8282-11ec-8eb8-a37418f5ba1a;
 Mon, 31 Jan 2022 11:39:15 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-2Tftp4tyPXKQtF7DNQooNA-1; Mon, 31 Jan 2022 11:39:13 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR0402MB2756.eurprd04.prod.outlook.com (2603:10a6:203:99::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 10:39:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 10:39:11 +0000
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
X-Inumbo-ID: 08e52189-8282-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643625554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qvx2QQ/LnGaw9dsPPVOmw95k8uI8ey4KjFg7218puqI=;
	b=kWbV9VjSUcxajxeeDhHCBx1Ge0CK0sWK8PlHa9EVY65Rrz2gJCauQeQhmzCT+9UMa8lIru
	B90f7dAeU1qfAi65pF3HGmsW+ttlQ3MXT6z+Ys+jIyHLrejQxfmBo+8RRRvQFABhvJCN4N
	HC+Ky6aGkVvsLoKxmtfmMRX2z3wH4N8=
X-MC-Unique: 2Tftp4tyPXKQtF7DNQooNA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eF0Y5KOvElVLkgzF42sSn+xiMtS0wlMMk5OsYnzP8VtgEIobSXRdneHc8uvy+XufEYAZn0qrcmuft0m52L98CQS4tHQrchJIBDIswJPNZNuhiovqPlPfHSoR7CFl/7Qu8zQMxDqkoSm5t8hj7fsXUHuYMdIgabXo2CpqVgep8EpBSFNHG5/KRT4n4dLNEjHJGs9IluY3tAQ1ad7WKxZLnkHNLRLhd+rQIgvE/QRIQCMb/ZqS4tm83r6IGGR6nuWRQw0zuVaV8GK086cCF89BToehywzz+TQpYVdKYChcnaDeq8VeiJei3jgw2UTC/NJrOn2daP8J3cvraQFm5VRM8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvx2QQ/LnGaw9dsPPVOmw95k8uI8ey4KjFg7218puqI=;
 b=PY3BY6uqIJjHHbodSL57pU8aE3hAlhz2k/3BzLvIHLnVC38DbckwUH0BD4f136s0UaFgRdMC/qrObH56JAoOK9uxCNR7ExiSXGvm79HVlTQLTRqLofLe5Z6430rAiw9OAzoHG4mOG4oY4HgH3Ju4HicjkRve6uui7UXV5T6BwneWCv5tfgP9BrM0MtWFfzaLfKdcTs5wXt5tTJADIqX1S+gaucYhqmF7kiwnM34bl0bL/k7XGTjI4EfKINkjLoksQ9GjVsrkyiJ5H0gKLFhbgFqJla6Ibexhlf+ow40ze/bzSndmehh5AkqSW/S6acgHHSl8qCKh0IPVsM1aL1N1wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a1bfec2-a904-c561-aa6d-0ecafd2cf43c@suse.com>
Date: Mon, 31 Jan 2022 11:39:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 9/9] x86/cpuid: Enable MSR_SPEC_CTRL in SVM guests by
 default
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
 <20220128132927.14997-10-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220128132927.14997-10-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0071.eurprd07.prod.outlook.com
 (2603:10a6:203:2::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4655aa8-4dda-4bd2-e62c-08d9e4a5eb23
X-MS-TrafficTypeDiagnostic: AM5PR0402MB2756:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0402MB27563D7DB3E32EB061ED96A0B3259@AM5PR0402MB2756.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4vzhA/uuhoNCgtKI3FnuV/YcIelzC1XhdYMxgFK/11dFnBsd91AxyZ78T59Z8zaepQwRDsmdpsS+k/GuuyYgIDl37n+TVGVUAF00OWAwa471ccFMvdaaJXgvHcROesa9iNoQFMZ7bzVndJsBoAsWrOosX1fN6OjJs6ci82gmPxmT34pZ8QFrE9Yv1+rxrj/Jmw/Nq18e8JMC429h3qc2+kmbChocjrrKu13Lpux8rkjQX60zqLEgeQ8k7lMVSFM/ER3iKG2rsQrsLmj5GjhVIK0T6Ohl/RQXyDjoHgcw2kUCtqqWw314zHJMoCXT1zMaUpknxdioZo+/xO3lOepWc6E/Wu6+JMUBTnN+MPQ9T6Q4jX604fvAi96jsAXJi4NPSqPrmUxx9EywawJQhwXlEtRuRA31clkghB+6HH16fEmku7cTevp81XF+yDyMV8t/ltLWrUbOOZpJ4aKKO/y9U6cQYh3atilB6x48vcI/58c+LZtRvcqzMULc/w9ZwmHT5SdIYOPk8KzSGnQQScX5NMMZDjqiu/dy3Qi0+WCTSwKYAEUEzKV3MhAe87eOBIoP4iDcqKWjPc3hY33QHJxobqvf3T1dtk92HFPnIwArUV9qWNnlbATeDi3DCVvLKqc5vc1ib/DlHcD5V6twDnsiM6XLEQtEVYTUWAoWhu3Zf6aFanTyGQsdx7MCEgxBL9mttGXyw5ft6YphH1b4mGhbeVgkGT8yoN5ujjOh4hkBe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6486002)(508600001)(38100700002)(26005)(186003)(6512007)(54906003)(2906002)(4326008)(2616005)(66946007)(5660300002)(86362001)(36756003)(4744005)(83380400001)(53546011)(31696002)(6506007)(31686004)(316002)(8936002)(66476007)(6916009)(66556008)(8676002)(45980500001)(43740500002)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3FPNS9jWGlWSmVQczlFblgwUmJUYUJKUjIwR0U1cDVpWHBXYXZwMUdBZFFC?=
 =?utf-8?B?aGt1MXJSdlB3NkpjSHFsQm1nRUh3NjRwOXNWS2dsMHRPVWJTb3RqS0ROenZs?=
 =?utf-8?B?MHZmTnRVbzZ1ZEpKOXdLcWIrUHU5cmtmL0xhK2dzYTQ0aDFkUktDWFpieXBi?=
 =?utf-8?B?UTRoUEtFVjkydkpPN2U3bmV0SGx5TGphUFdORHJkdm1lL25qVzdFdXJ1dTVH?=
 =?utf-8?B?anI1UGw3MlkvN0UzN2Y3VGo4dTh6RHFCNyszM1RBSUhWbjIzM1duZnpnbjNH?=
 =?utf-8?B?ZDJXR0xxa0IvWXNkc25SZm5DclhaK2NVWVlma280NW1wWk1yRFFjOE1wdFZ5?=
 =?utf-8?B?bG9pZXJlRHdleFh5NEFKUVYrL0dNS2VBMTVOWkc0ME9QNzV6TVEzbEJ5THhz?=
 =?utf-8?B?TURPWHJvYVJnbHRiQ1VrOG5vbExEazNPeTFFQzNUUHdUc3czdk1oc1lDdjAx?=
 =?utf-8?B?OG41WG8yUXNtRVB0SUdkcCtqRGlOeVlqVHVobXFyM20zazFDOTdDZ1A1Tzgy?=
 =?utf-8?B?TkpkRGFCUGIrMmlsTllkcWI5bDVtWHo5MjkrOTI4NkFkOWdZTTFhSVBpVUFy?=
 =?utf-8?B?RHh1aTRrbGxvUi85MWNxR1VZZFlHTEludUNFWVBFWFMrMThDVStwRW5YcllW?=
 =?utf-8?B?NnpHbnpVM08wSHRDTU1kTDBxUXh2a3pSbkFvWVI2cloxUWZhZERTR2lWTHRE?=
 =?utf-8?B?MlBiMHk0RlJWYXp5c2t5K1dYdDFyRE0yWGpReitBSEtaZUxBSFB5bmJFc0Jz?=
 =?utf-8?B?ME9lR2ZhUjNXajJpQ3RuYThLN3oxdzV6Qk9GRFk3MWJDSzNNYURsNkEwNXcx?=
 =?utf-8?B?amR3eEw5K0xrYlBmQXlCNXJESmFvOGc4bDVpREllOEcrcndTTWc3ZmZ1SmJF?=
 =?utf-8?B?a2NjQ1haK0gxamZUa3V3c2dpS256R0VqYWJuRnBFZm1WZzdKaEZqTGZMQ20z?=
 =?utf-8?B?eVV3V2wrV1VnMkNZRkdmTDFaTGhqUXFDZEg3OGFrYi9jNDJGTm44aHpRR2xt?=
 =?utf-8?B?WFFlemQvUFlxTVZ5dkIyNFpNWFlPUGtraitXckxiMExaWkZlNFR6dnJSTVBu?=
 =?utf-8?B?ZXJLcEJmUWMwWWFYL0tSR042K1JNY3Q4d3llTXFuMGVUU3NQclJyT2gwY1hJ?=
 =?utf-8?B?SjQ1WE40UGZaYVJPbjQ2dkM1S0JWNTFPeDdFWHI0aTVkaFVhQXdQcEZLSWE1?=
 =?utf-8?B?QTh3YlM4c3RHNmZQdlVTa2tER0JMVEhUd09rV09MU3F2QXBkNUNrQTBYWm1Y?=
 =?utf-8?B?d2tnM1c2TTFXZE45b2d5c0xtb1NLSEFaZXdzMDNyaVdFQ0dmSEVxZklJN2xK?=
 =?utf-8?B?c3BxYjFXRHFKUHlmUWFKOVlTMm94VmNFcnR6NTZ3bG1uck5zQjlSQzBhb1o0?=
 =?utf-8?B?K21ONFJlMklKVkZBbktFNmpaQ0FRWVd5cGxDa1NCYXQvbUtGTHB0c3RCUURW?=
 =?utf-8?B?MmM1OFhxZ21GQ1BkWithRnFvbHlrMEs0OUZVYTUzeDZEMGpnZHZUMkkvenph?=
 =?utf-8?B?S3NDVjRJV1RDNmtyOWhHeWI5MG5pTEx3YXVBT3o1b25wUjduNVNjZ3d1TTRG?=
 =?utf-8?B?ZGJiSFNzTldFUGpoaUY4R2hNa0tVZktBSncrUml4all6Y3ZuSEl0cERFZVZJ?=
 =?utf-8?B?UVJkeCtzYmF5ZHp1UDdmMURzeU03WTJKcXhtUElkNHh1NUlxa0FxdVd6Q3pE?=
 =?utf-8?B?RkQ2am96bTR0UzVJUEFmWHU2RThNenRGUXVRMW1wU1ZvRU0xSXJaVTI1bU1r?=
 =?utf-8?B?RXBvSWwybUpRdkJ5dlV3QnNHa0xuaHhrMzRrQ09BbGcvaEU1UDVYdG1xYSsr?=
 =?utf-8?B?S29WTDNBVzlyVXFPOUxZU0lxZTdDN3ltclcxdmo2U0dya0lZUnJ0bjJBaGhP?=
 =?utf-8?B?ajViZkNBOHU2R29OU3FKaVgxWTBNMFBjNjJqTjdUUHJKNnRQT2dRdWc1TGo0?=
 =?utf-8?B?eG5acXhxNGpBZHRlMkN2aDc2V28rOG9MRW9YWkJMdHZjenJ4endqTjk0Lzhs?=
 =?utf-8?B?MjlZU21BYUZnd09Ya1hKbisrVjRZbWZsMCtiV2pSRGxjQVFUZVc1NWdxcTJH?=
 =?utf-8?B?cGNWY3FTVG9sU3BjN3h5U25yd3UyQUV1R2Q0b29vOFg3RXRWMm11SEhpUTR6?=
 =?utf-8?B?dENlUHVOYVZLMzYwZXRDOS9MbzI5bW9tU0JPTVhTU0V1SFNBd1FmT2FHNVQ0?=
 =?utf-8?Q?H74N2CrjeQIMKUiDOLWUD3c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4655aa8-4dda-4bd2-e62c-08d9e4a5eb23
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 10:39:11.6777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rLMwU37x8rdngeMpB4PCUodcjcNL6LIrmfSEFrowM6sZm1a181Bu22Lv5dUOcOl8KUPoj06cokYXVkiH22Lr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2756

On 28.01.2022 14:29, Andrew Cooper wrote:
> With all other pieces in place, MSR_SPEC_CTRL is fully working for HVM guests.
> 
> Update the CPUID derivation logic (both PV and HVM to avoid losing subtle
> changes), drop the MSR intercept, and explicitly enable the CPUID bits for HVM
> guests.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Oneremark:

> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -606,6 +606,10 @@ static void svm_cpuid_policy_changed(struct vcpu *v)
>  
>      vmcb_set_exception_intercepts(vmcb, bitmap);
>  
> +    /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
> +    svm_intercept_msr(v, MSR_SPEC_CTRL,
> +                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);

Technically I suppose the intercept would also be unneeded if the MSR
doesn't exist at all, as then the CPU would raise #GP(0) for any guest
attempt to access it.

Jan


