Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DA94FE1CC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Apr 2022 15:12:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303664.518089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGJq-0001Rs-Ip; Tue, 12 Apr 2022 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303664.518089; Tue, 12 Apr 2022 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1neGJq-0001PK-Fl; Tue, 12 Apr 2022 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 303664;
 Tue, 12 Apr 2022 13:12:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1neGJo-0001PE-Kd
 for xen-devel@lists.xenproject.org; Tue, 12 Apr 2022 13:12:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 334d2890-ba62-11ec-8fbc-03012f2f19d4;
 Tue, 12 Apr 2022 15:12:27 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-_HsYMhHlN0SMy2uKImnpxg-1; Tue, 12 Apr 2022 15:12:26 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4961.eurprd04.prod.outlook.com (2603:10a6:208:cf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.30; Tue, 12 Apr
 2022 13:12:24 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5592:2abe:fb16:6cd1%6]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 13:12:24 +0000
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
X-Inumbo-ID: 334d2890-ba62-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649769147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKTdfBG7Fe/6AZ6CUAJbatAk7RiDaP8MjwpSBVzOHJo=;
	b=P+cjks2puymgSB45ykeuhuWuwXF7M1jujw9KXge3ATAAdu7KIi3t+PD5jBMsHiHv609xmr
	fBvtBI4h0VhssnBNkK8mYuYP7dud1JemqdzBk4CpVqVyZryxJ9kA808EpNTynTn03c7SWr
	jW3MksHU+bycmaxaMqYTjIu2h6j+f+g=
X-MC-Unique: _HsYMhHlN0SMy2uKImnpxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEURyzd1PJHOnz5n0K/4j+N2l2zPAJq8FtrWrMxMvHFvS4YVLjD9lwSrla99o8udWe0HfKpnPSNwNkly6zQgoW7z+f9QrBM2TQ9+hRYsN6Lj1H1i7lWv6X9biNMYe43rV9UbzWNSL7GcxwvvSbowN4VR8ynIa+y6iY0N3D9Q4KxoiPNuONctvXFg7aCJxNKI2yb30GBRbx2i19s9jG0vfMaeI3G9dsnsBNfS3ks4ZOUJFilAJmNpaa/ge3f5lyGjTYcuU99eUpx8dTN2vmIRFj57FK/hFw1Ddy0qv+/7FmYC0E4gRJgXEwcdl+9u8a/1gJGcftD7WdK3hPIAKLUBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aCsHGJ7V8/qU6bvyFl869Gyb23Z8GCfuOIRJqhydqA8=;
 b=hPmXBUZ0cEodzftBQg2YtrehLU0tqkytV5C68BOZpP0eb9Jv9eBTu9UqjI1OohzSY1Xu+lBuBDItsJnD1aKkZA5LbV5cC764a6y6RD5utCPnW7M75OtS1zQoc7VqKGoighQBFX3N0WNy9xrk73Cs0mWC0Irjj8uYuZHkiB/2/PBjDZT3Qs3bQYHwDeezp/vRKOsfo6IT7gk/tyv4xuFFJKyfEXCNj4R9/5njuh4kaTYiWuy40phv5OEjr8EpTKnyuVChET+4i5hA3caz8JEwTD5AuHYsNrirCIa3C+1lx21HA8ilUWMhB5Wml0UjyX8XpKG1PoRE8Mo1kYShsLXehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8d3d19e8-cdeb-fb7a-1d7c-d57e372bff9a@suse.com>
Date: Tue, 12 Apr 2022 15:12:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/8] IOMMU/x86: drop locking from quarantine_init() hooks
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <4785ba7d-8759-7441-4ac8-0866489707b6@suse.com>
 <3430b8fa-6700-b5ec-a160-2e7609dd38a3@suse.com>
 <YlVc9shnBYKShLiP@Air-de-Roger>
 <5c09c09c-01b5-c020-5a8e-c0453e3b8fbe@suse.com>
 <YlV2fseUZ6ss6bcS@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlV2fseUZ6ss6bcS@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::25) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99f3ccd3-554a-43c4-e015-08da1c861593
X-MS-TrafficTypeDiagnostic: AM0PR04MB4961:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4961A9957D63D9F5711CD9A9B3ED9@AM0PR04MB4961.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zumbwQ/PoKbTlYN5AjptvHRc8jGE2XEiV6lkgd6r4oL5fegNxp2+jdfgTGYH3c58E18RBtI8MBDhYxNXOvdFtiZajGBI+4R1TK9SYOpUXOEsZPdCKd8bv/+dteZvjPC0mt5gysV5FHBLoio8r57qBtTcCTcONjkQFRNkkJgIsMSxUKpzSC7L5j54h/yzekMmaP1cIcQyahziXm9b0mb4JAb/DO2VLubL1Wz/0YHoUIzv/jfoH+Zy1jchfmupYVunwuL/m2RT5CvY4M29yRMGW+RjSdf5a3saQ3shd8hEYIxgjcgciYd13ZIdPFnfnbR4wR9tqfgszfJ/IKqL0fgQzCgtLIbgjm6FEUSrSphsm6UcQB9U88fThvZST0EDVBpirRb93UoN6VST9BoX1TMhzFG38ICj03618rMRDRiI+gQckTUxl70YjET8PHbb8H83llsKFeIkJaTcNx0wsLGCUM3T9sQ/USpl92VoIP3rgl/mHdwDkVQhpPcwNt4+jfcyC04iWDkTGtTxKXvKN1FSQSvBETV6gFIZjX2DtJNVEWjJKsqgRSof/J3kwP6IkKA+ARo9u5L5AsAbwrSTZHS5lat8Ci8n4fK5djDiCu7DJfkSFIiT6+7v7kvuamIytyNsWFqtE9k8aAYSVuj8yHyHiHQGYb8iW6ECWoxaH/N/pzqDU8fXALN9Sd7WNIgQNqgD318zYHZeCDPPNCbhbiHXmXnruc5gUT5vzk3tlYjtR0r8Hpch+snklWbvCB37cII+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(6506007)(53546011)(498600001)(186003)(26005)(38100700002)(2616005)(8936002)(31686004)(5660300002)(6486002)(36756003)(31696002)(6916009)(86362001)(54906003)(2906002)(66476007)(66556008)(66946007)(8676002)(4326008)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PojGgbtOmsYLqdJ1/e2KvwYw+I61A8CBnyndhipgX1qplHiGWCnXyAzpazni?=
 =?us-ascii?Q?yPniq6/pD/7wwNXSMd84pB2ezS27/f2f97eY5hoOi5KRssvXJ343PNYDnvCz?=
 =?us-ascii?Q?dzVR5W0jp0ZCX8fNirE3VYYIuZBmK1oxenM/tx+SEBeEScQuafNqigghlUG8?=
 =?us-ascii?Q?xer8STJDSDi9VZyrwmoxWJ98FiPwlJuc3Tb7FmBqeWuz3xb7V98xuE2rLhnY?=
 =?us-ascii?Q?+P0ARm/DfkSpIF6I/yFuhNMD1Uj/lU694uYZq1IPPv+j5Okfrb7b2AO+GGFy?=
 =?us-ascii?Q?93zet59Mja75lUA/5v+WL+DajaejTWYnGqS3O4zXtg45SePYqzIanGpEh2+j?=
 =?us-ascii?Q?QzdT44kMs8kUIRWTqXv9DwQGI4KSxIJSiQyIHH/NpCqCLJRAvftkxPl1UJ9k?=
 =?us-ascii?Q?RMlNEAlZnzgFWbnxFNmZ/ytAa0EiTlW7TGMHba7frPzbCofSJobhAX448dsO?=
 =?us-ascii?Q?QU33fQzLrpdVLrOpH/O5wtRCUGWPICFXgr7NXPTMflI/x8i+Olj9NCX7dUug?=
 =?us-ascii?Q?AM9yadvVUAernyizRDfCKcVnUHOeSyNMMuKlbjh6hfZv81xlG7gHXRnglM+M?=
 =?us-ascii?Q?/gERWyBXr7n6z4jnC//jiQhBP7Zbf1cLFHX+DkIA1/F+iVYgwMo7GP6J+3UJ?=
 =?us-ascii?Q?dwN0+G3McX9Z0iYYN2xWUkcJqJGfS1uzVBWiyfwFmnt2WvxLaf0ApHt5jCCP?=
 =?us-ascii?Q?GZZX2DdxslXQmrAJSCN7SUpZN8p+6QkBrGHxuyAyu5uCCQA54Cjw59GZaEXf?=
 =?us-ascii?Q?ql4KMknYbgQJe+86axJ/bwDGvuxKfLHLWibZ8DVgNHOpEtqVY6SU/R31nZkT?=
 =?us-ascii?Q?5hkwSkGIJq0YRJqPFES25J8qOFQPdNOkcuLL+po/PqRc+Lwn98Q6+qho0AGf?=
 =?us-ascii?Q?HC7QuYH/XvgFD72WuyjM5iBYsJ0XgvEr655FbpJY+Mg5pdS/Q6JCYBlYFo7X?=
 =?us-ascii?Q?WhKkY1khRTf/Sw6ZMW+D9A25z5SGhVqBM4ZtOLvF575djZueWXTtOjVsDvnr?=
 =?us-ascii?Q?IJbdihaUj2RSu/hJPciKkdpXzGsTZAQdaXomb+Y+j7kWbABUmDMlz3N/6DEf?=
 =?us-ascii?Q?7Wwa8/DbDCeh2LhIF1e+FTHdlLsG+WBSYTJi0ZHfagjxiwC3nzqB9Gm0nUhy?=
 =?us-ascii?Q?xlO8Njsh5oqdJ5rVFtVwiUaR0HNXlyMYmlQc9cocNXbvKZFVSrwKn/WaFpVq?=
 =?us-ascii?Q?xBGaOjCFLjxLNxett4pXyS19re1hGYgQ2LLk05oum3aMg8WrrzqXarDK6Ms/?=
 =?us-ascii?Q?4Jp8f4i3IG1M+6+R/XiSU2BEwt46bGx4QRkj6kwnc/hphx8JcHnXYlactYZx?=
 =?us-ascii?Q?Um3wm6rWM9ZIKQ4KE4jJ2yKkm6TrQA0zUYvL0765Xh1dwmZQr3pN1/O7Atqv?=
 =?us-ascii?Q?pH7gXkNh5X7q2RbhqG0E41//KN3BvhCKyfKUoVCG4qF5/9YapCvztU2iSCUy?=
 =?us-ascii?Q?2EqlQSCiFh4tVPSzju+ax4G7sqZTuevsR78jasMCxZbQoisglFuoilIWFax6?=
 =?us-ascii?Q?Ri1HLbmVEIAr0hvBRLGrh0a3Rm3UN5FBxQ9suGo2z5qWpVn3R5/NfVyDt55P?=
 =?us-ascii?Q?n4d8O0vcD6mwGafXGWW2LgX+wSLqlzAUGWBWFZb+hvBGm9F2BEG0me0y9Qby?=
 =?us-ascii?Q?IfpMelnhAWowCPcecxbvjUEGhg75gAq8RGf31GaJffZFCYJfEK7F7jLYBTzU?=
 =?us-ascii?Q?6bQqlo/JYtApVuQPFb0Hi3tBJdfTmg2U2nGUL8XtCbcVsK+CITq9cyMD3jY7?=
 =?us-ascii?Q?/BKGyGxqXQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3ccd3-554a-43c4-e015-08da1c861593
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 13:12:24.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DDA2U/lof5jmIQsdqXAHokQZ++NxfcGDSHVxdV8mE2w5UDY5oC9yO5Iz79sH7pD2PVkukkn858Wbu5A4j0zLaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4961

On 12.04.2022 14:54, Roger Pau Monn=C3=A9 wrote:
> On Tue, Apr 12, 2022 at 02:17:16PM +0200, Jan Beulich wrote:
>> On 12.04.2022 13:05, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Apr 11, 2022 at 11:35:54AM +0200, Jan Beulich wrote:
>>>> Prior extension of these functions to enable per-device quarantine pag=
e
>>>> tables already didn't add more locking there, but merely left in place
>>>> what had been there before. But really locking is unnecessary here:
>>>> We're running with pcidevs_lock held (i.e. multiple invocations of the
>>>> same function [or their teardown equivalents] are impossible, and henc=
e
>>>> there are no "local" races), while all consuming of the data being
>>>> populated here can't race anyway due to happening sequentially
>>>> afterwards. See also the comment in struct arch_pci_dev.
>>>
>>> I would explicitly say that none of the code in the locked region
>>> touches any data in the domain_iommu struct, so taking the
>>> mapping_lock is unneeded.
>>
>> But that would limit what the mapping_lock protects more than it actuall=
y
>> does: The entire page tables hanging off of the root table are also
>> protected by that lock.
>=20
> Right, but at the point where fill_qpt() gets called
> hd->arch.amd.root_table =3D=3D NULL, and hence it seems completely
> pointless to wrap this in a mapping_lock locked region.
>=20
>> It's just that for a pdev, after having
>> installed identity mappings, the root doesn't hang off of hd. But in
>> principle - i.e. if the per-device mappings weren't static once created =
-
>> the lock would be the one to hold whenever any of these page tables was
>> modified.
>=20
> The lock would need to be held if pages tables are modified while
> being set in hd->arch.amd.root_table, or at least that's my
> understanding.
>=20
> This is a special case anyway, as the page tables are not per-domain
> but per-device, but it seems clear to me that if the page tables are
> not set in hd->arch.amd.root_table the lock in hd->arch.mapping_lock
> is not supposed to be protecting them.

There are multiple models possible, one being that for per-device
page tables DomIO's lock protects all of them. Hence my hesitance to
say something along these lines in the description.

>>> Long term we might wish to implemented a per-device lock that could be
>>> used here, instead of relying on the pcidevs lock.
>>
>> Well, I would want to avoid this unless a need arises to not hold the
>> pcidevs lock here. Or, of course, if a need arose to dynamically alter
>> these page tables.
>=20
> I think it's likely we will need such lock for other purposes if we
> ever manage to convert the pcidevs lock into a rwlock, so my comment
> was not so much as it's required for the use case here, but a side
> effect if we ever manage to change pcidevs lock.

Such a need would further depend on whether the code paths leading here
would hold the lock in read or write mode. But yes, it is reasonable to
expect that it would only be read mode.

Jan


