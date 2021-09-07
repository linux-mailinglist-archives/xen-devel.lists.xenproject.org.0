Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1781A4024AD
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 09:47:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180527.327228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVot-0003RL-Qe; Tue, 07 Sep 2021 07:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180527.327228; Tue, 07 Sep 2021 07:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNVot-0003Ov-NN; Tue, 07 Sep 2021 07:47:03 +0000
Received: by outflank-mailman (input) for mailman id 180527;
 Tue, 07 Sep 2021 07:47:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNVos-0003Op-DW
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 07:47:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e6f59a7-31cc-42c9-b7fd-e76f51f3e32c;
 Tue, 07 Sep 2021 07:47:01 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-9m-ODolLOeKbciDOBV25xQ-1; Tue, 07 Sep 2021 09:46:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5599.eurprd04.prod.outlook.com (2603:10a6:803:de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Tue, 7 Sep
 2021 07:46:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 07:46:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:18::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Tue, 7 Sep 2021 07:46:57 +0000
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
X-Inumbo-ID: 1e6f59a7-31cc-42c9-b7fd-e76f51f3e32c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631000820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89Wcxu97YlBjEmvf+rIXeD4kJNc16BNfojpE+slgxM8=;
	b=VsBQjFhjEZ8Od2Ywenq/rvsk+tign6RYfhR5/rWsKzXR/nNSgwCW3IsR64mGdCWQjOyLmX
	JJCVR6w3gywpd1dN+4dlaEfMLsxvhPLq+1BC1IoaVOQMEXuVSkyJTD3YicLgxfMA+Jq1A4
	4RDfMou8mWcouJFRxlcYZMwT/S4eON4=
X-MC-Unique: 9m-ODolLOeKbciDOBV25xQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kZHNJIy7H3pI1z1hzTSmbsVUvLU+kwiHA/zEsPFOx+wlQCW/2GCQ3sZbpJVf6Jg+gCTvrfQJBVs5uQYEIOM8kDp0fEUBTl9hM2dJ1T5sfgFHNPWJFZIo3TFAJh8FS8btcxwXgwWFr7PhbElUld7aQlhRTVJEnact7n8zLhtVPiQwlAkkkT1laO3uIikrN/bce5XgRDsUzmHPh1RuGSEJEztVkgTo+FASZwKj38DW2ZwAlMQqMsfytzN/4BfxpKQ0SKFvV7fiIKANxNdtGUH7keT2v0PKHteD/orDNdj+/On/+RYkg0VwwIp7I3umGs8UJ75q9M8HJChdUYM8fv3aSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=89Wcxu97YlBjEmvf+rIXeD4kJNc16BNfojpE+slgxM8=;
 b=OSz7iR0XVgfTPztoWg4KWq66VC/+YfFIMjBzN9XrVHg5VqwpzybP1j8HhE1qOR5WGCZM9RH3sz+0lO6HrWW4KXr+gAN4p8zkf67LhRXiLahtmSe8aJMbf1qh++FWvC7BXD0l68l6mIWfLxUw7yfCX8wJWAhA435myEPzJwLjvD9Fqe/+5Per/Ah4ePOJ4uCKnyJ5f+qLBbCfa6aFoJ4E6D5hnDrblnHiYdLzZcsn72VQCdx8fmEv23yiAY0wzozYRAhwUZUbdslZog9ZCDDffA9NGoP9+q90Zh1vr7Y6yJBgiOo/7FPiXGxnXk5Nb3ZvPsXsKI2uCgnKJRAGynGzxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v7 00/51] xen: Build system improvements, now with
 out-of-tree build!
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <YTY+PNBccQYPhX0a@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8d23409c-8334-b507-082d-9d6472b9d8d2@suse.com>
Date: Tue, 7 Sep 2021 09:46:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTY+PNBccQYPhX0a@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0090.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89f6afc9-8405-4d3f-0aef-08d971d3ab5e
X-MS-TrafficTypeDiagnostic: VI1PR04MB5599:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5599F97204DFF9B693BA9D69B3D39@VI1PR04MB5599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1q1CH1tPWWM+nD0vnOByfWeK/W47qo9JrPg2EudA3uFHUURNtt/HycTuRlsl//OBLd/L1NKxB2QFvaPk4PwJKgZ+avi/KpZheESy+nmyYulUXccFRD0rzK/vrRbPntEDLE51YPc8To5+3FhpWX836uueK74zmwx9ltzX99PAeeTQmUXzN58Lm48fHo8XiyMdbGOEqnO5mHD18Y5RsW63nAAxLKeV3bR/aUQgfEV+k1mNEtSEcynXxl1XQqYg7It1oAB6oCXwtCtwKyPq3hGz1xVf80DWOh5YtC3MQq80001RJl5jH5Rm6Rv4YakBKm7/NQmwOWjy27kD8rTHH0L7SVfaAfegELRRdX8NU9Px9SUyM/mm2CRMuzcACqujOudAM17yUtvpqfzc/0rZ6PaiGNnp0TcEjW3cRu3WGGzkuf7kP+4ls0LoccabQCaZneSAVWil18vsBZL3f2ZeMa5eiaNEPoqVYwHxe+Uff4p/4/b6mC3lSlgrKN3mZtBiGf3FvOCJo9NARGoKuhjtZPu2UcwPZaT07u27heDfRE4kMrhyb4P8DewlZWawqGzUVHXyxPlFId9mQxVzUdi1V7calyfzrDiROLqNDBFoMaAb/olXjp4W1uUA/1vfWy2LTVcIPSterxUNzlCsWh8S62tU7+hcFtZeQgbHWJ4nlG0fTj1U5XS/hZBQWFkQfh6SO4vVZughFVDES5DjXzlCSWqmy9Hxka2kf82tDY9Y8ftmnLuy554I/V2QIMQoBemPyb0V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(136003)(376002)(366004)(396003)(66476007)(66556008)(186003)(53546011)(6916009)(5660300002)(38100700002)(478600001)(4326008)(6486002)(31686004)(66946007)(16576012)(956004)(8676002)(86362001)(4744005)(36756003)(2616005)(31696002)(316002)(26005)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3BqQjJTVWVnL3JjU0RScFFtN1RBTVk3SGxsdlhvOFVrc3A1THByVlBvd2ZQ?=
 =?utf-8?B?eDlIVzdjQXQxSlEyNjRmZmpvVk45NG9Ld0VzQ1FWNXhHSmF3ZFR4ekFuRk93?=
 =?utf-8?B?ZFRSWE5HMkswN2IvbC9vQWhzbEt3R3FsZ3VsTHRERkNSUWNaMTdUVG42QUty?=
 =?utf-8?B?dGIrWlliYndTYWhkcWk2SERJYWZrQnZ4Z2Zrb2dOczZnd2Y4M3MvQjZlRE82?=
 =?utf-8?B?SkZoTUJrSlE3RDRiaEpoVFpMeExrYndML0p0ZHFENTlPa1lzQ2dnVENFZjNF?=
 =?utf-8?B?bVUxR2MydEhoalpUYzNxUU9SN3RvME5CK0hyWGZLczhHZlBiWFFUdEtMMDRF?=
 =?utf-8?B?cnpLVFZydTZMV1FGR0QrcTdib1gwTmJNU3V0a3lpeVJuUUhmWmpCM1dGTld0?=
 =?utf-8?B?NUhuV0xHUGZPWGp3L2FSL1BMNEVCbDVXUCtsN3E2azh6VDZDUFpSN0wwQzRJ?=
 =?utf-8?B?T1FZcU1mZnJ5amdtM1JTQ0pHZXNWZDg4VGNxUGkzeHpWYkxoS1pOMHViTldz?=
 =?utf-8?B?L1ZvcTBJTUIreHR5ZCt6RXJTamNEWjRwa1M1WUZSTElLU1VEZ2Mrb0hadkVi?=
 =?utf-8?B?VW9CL011SmV2TFh1ZG9ZZDZXZ015c01VSmNWNnBBM1FPWCtiazQwbGgrQTZl?=
 =?utf-8?B?ei9qcTNNdXd0bWJPSEJRei9vd3JRT2IycmpOdkVZMTNEQzRWOGxDa3JiY1dr?=
 =?utf-8?B?aEw5SXRqYUFtV3lQYlU5bWs3aURJdUMwcUI4TXhhd0YwR1AvSkNjOTVaNkgx?=
 =?utf-8?B?VExDSVFVUUMrQkZxZWs3Rm95eFNWUm1QMU9sOHMzYkFQc0xHam9FRk1iNndu?=
 =?utf-8?B?SU5xclV3V1MyZzBkMjAyUlk2YmFsemhCNFB4TUdnR3BUL1Q4R1pBYytaOUtB?=
 =?utf-8?B?Q29vSHFPZXY2dWRJVmptSlNaMEtkMTltVUdHMGFHR2JqeUx3TUFZOTJURndh?=
 =?utf-8?B?NWh1SUVjYW5uTHhYZW9TMlNUN3kvRzZ3QWM1RjNkZ0Y2WWlJVVNlVFJ5b284?=
 =?utf-8?B?am5pbDFGZWhQZkVMNUpRdTJRVVVhbklsR2svZmFzWnE0VXhMdnpuQnltOS8v?=
 =?utf-8?B?azVjQXNGcFBGdUFkMk9rdWhqM0Fnd0tZMFQxUGJaV3NYQUlhbkxFQmNxenJI?=
 =?utf-8?B?UnhEbk1ZdWVpRXA2a1QrSXVLUjdzc2FWeXlTRnAyQlJwZnphcTNvbW5jZ2tJ?=
 =?utf-8?B?dnlSNjgrUXNBcTlNRDEyZ1REelZYNlRmUWN5OE5icVQrWnBjaUI5TzJsc2VW?=
 =?utf-8?B?NytsYnNmNjRiRE1NcXhiR0Zjamc2dXNkNFV1OWVnMHdVUnF1M3BOY1hMa1hU?=
 =?utf-8?B?NHJFMzFqVEZFc1FIUE56QTRkTUw1TUROSFhUY3lraTU4UmVoVURrRm5JVDZx?=
 =?utf-8?B?anJ2RCtVTnMwOURMNExpOFdSaTN5ZEErNjEwTXVSNFVwV0hST1Fkc0tlWVBa?=
 =?utf-8?B?M0x4M1E2aHF6NGJSN3lIWTZNT1c3YjZKTjNyWDNHUWdZQVI0WW54S0gyemRU?=
 =?utf-8?B?VWpxYTFMMktKcXBXS1psRlpRcFZ2Nks2RVNqRXhtVkNDZXhxMGdyajlwWm0r?=
 =?utf-8?B?RjEyd0ZOWmhZS2VkWUhQMUFORWdlN1p4Nm54ajRpN1ZoR1dYeWJQV1VLcjlB?=
 =?utf-8?B?eERDUTVHZFUyb29FNFl6b0xQSnFqTzZwRkMrcUtPK0I2VUpLU2poVjBoejdX?=
 =?utf-8?B?MzFmUkJROU45R0ExNmFOc3dXZUZrVEtNZEppNXhwbkY4M1BCcEtWN3pyODF5?=
 =?utf-8?Q?7g5pPFfWcuEg/9f6CQDvX2ZIOOxAMnkmAUqJ3NT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f6afc9-8405-4d3f-0aef-08d971d3ab5e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 07:46:57.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bq0+wk9JkVdWlN4fYuHfeGwnQaTanIiuPI3zBO8eMrUdGjemly0v4qnNyaq0uAGUR6NsVBfkNyydNnH1Tk4KKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5599

On 06.09.2021 18:13, Anthony PERARD wrote:
> On Tue, Aug 24, 2021 at 11:49:47AM +0100, Anthony PERARD wrote:
>>   build,arm: move LDFLAGS change to arch.mk
> need edit commit description, but otherwise ready
>     not needed before [PATCH 21/51] build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile

While you did indicate you'd be fine with Julien's suggested edit,
he did indicate he would take care of this Arm specific change, so
I've left it out.

>>   build: move make option changes check earlier
>>   build: avoid building arm/arm/*/head.o twice
> both ready

The latter didn't apply cleanly for me; I didn't go look specifically
why that might have been.

Jan


