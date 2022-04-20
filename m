Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB425080BB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 07:53:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308798.524601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3Gk-0007fY-Up; Wed, 20 Apr 2022 05:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308798.524601; Wed, 20 Apr 2022 05:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh3Gk-0007d0-Rg; Wed, 20 Apr 2022 05:52:50 +0000
Received: by outflank-mailman (input) for mailman id 308798;
 Wed, 20 Apr 2022 05:52:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh3Gi-0007cu-Oo
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 05:52:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ab9e28c-c06e-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 07:52:47 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-iuPq8lS8NqigsB_aPBT5Mw-1; Wed, 20 Apr 2022 07:52:44 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB8PR04MB5627.eurprd04.prod.outlook.com (2603:10a6:10:a5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 20 Apr
 2022 05:52:42 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 05:52:42 +0000
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
X-Inumbo-ID: 1ab9e28c-c06e-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650433966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=locu4B8SiSaSLd5+lBTxFczVg54W/N4Lr3GQzF8mdGk=;
	b=CHe0P8o9OXgMQGWID/C2xg/ZFBM2mw4fPwmx/zrJ4psWSS7XVC1AJuB4ZHt+2nwg2+BSR5
	nleM1IHHop1MfeVZpeBwvIu0pfG6BMrr8tgsB+8Rfnbac6fBwCGQCZpPLXMsBNXEorC86A
	WGfURW5SkaeaOrwrOoR73LpoYAmQSiU=
X-MC-Unique: iuPq8lS8NqigsB_aPBT5Mw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKDxO+knrPSSaF0bnUEWeJiELTWPCiStoY4aLK1eINzaw2ilEHNOSDQCYxHQm366q/FGtfiIhV3re7TP5wX7PInF035GRCWKvfCEkuR9Iq68yzwNTfmmmKTkVawUsA52sSTUrTpgpA3FxY/X3C+ozP2Mnb02OV433+SFrTysV9yNn7NClfGiXM6TE6gc0nPQ8wJBZ0OfofbjbHKeQwHOGh43mwtei2hOwoY8ls0QqDbKSGBwsHVh8BMQdhbJ31srTJ7mNhUeKwOe4GweAqYBQdmlSMHtpyyXEsm0zpHidM5IJvplh1g/cq51COB9BChqZYJXUKH51edjQB4UG0MRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsSefV48vyqK+Ms8U5KybfCJOn1qlBMyYbDET5XnQ/k=;
 b=CK0jgWEc1uQ+suMCcO1shsGnSuKqDT7FqvvYMRt0rNO1XrpsXFXBDN/QHfPXCP1ClV+DuOONBKVt+QU63IauZDdWmVCfx2dnWScM2kMveWWV1ulOGIayElEB/gRdAx3MyL+mH4+gh6ec5PdVtvIcpskHujrodrt9bOpweWHw7OGq+Y/1BjW4zdg9EeXd8+P11hkWGR51rrU80cuRR0c/Ei+NkIuVu2AQQBHQLE9+MnDAz1bCr5UMvDCVIm7ednpmTabL7yfg04a7vwA5eb+S+roerq4rwWQxDDV0/XVQSWtmqvTIGLag1wKVSypWFRnecclQ85HNVg+AUR6Ywkbv8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d3e5ed8-dd92-bfd7-6540-fa75965eeed8@suse.com>
Date: Wed, 20 Apr 2022 07:52:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] IOMMU: make domctl handler tolerate NULL domain
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>, Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc61d9cd-5da4-e35c-fb21-eeba5ab6e529@suse.com>
 <8a8aa0c1-e6f3-2dc0-77d4-282af89f4ed6@citrix.com>
 <bd446b5b-49ea-3d6f-6792-7d785586ea69@suse.com>
 <226afabd-ea07-dd60-474f-c594d7468de3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <226afabd-ea07-dd60-474f-c594d7468de3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6168c57-7266-4c00-08de-08da2291fbc9
X-MS-TrafficTypeDiagnostic: DB8PR04MB5627:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB56270CEEC278CEB6A9833E22B3F59@DB8PR04MB5627.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oKUd4IPmp/ehgBsm81vYdUGL6HR9R00Zp701X2TblVLMhtHzEZl6Upfc7ZIprBZPs8Niv8xVGlMUMLkkqkbBQ5+rQNmPEXAatCIgC6TwXOgzKIJ+giOaAMtFZbc0BWqPPAClvHlHGj8jH5jpFtKwpG0VnrfzhpKnz6pUqEuWCPAUjA9G3DNEmrYhGTHAcCRtg+eaJKkoar3D6xzcXYaM3pIeHpKNIOuMDaNGlZQp6mWmtuGeLja2P2ppsJzB/UxEn8Gumkv9WfkQUE21j3vHBGq7m/Cg7X2nte37P1xmBYVMXtkCFqNOJAti6jE0uWjahOgcd/E3YN+zEmtEFTezAItDaHGxMSQlCBc7Lz4Qi1DWjt9abP0aSCWxjLLiKvyYvQG8l1SBKQT8o0188W6HMGhE1AHzY5eKP1UDHxqPasgdLVrGv9pqKREHZ37Q4cHag3wBgG1RP2WhVBLkTp7odtL0VMzhAskHTcR67ocJ4R6Z9kOfJlyymUFN7Md2C/qTnGCRWvi2KGszC3+08ayAIiv9ljKUKX8tOPMejm+Sgh/5+CJHH3W9x+iNYoy583qwuRidh52HrCJaJj+92kasQQ4KmDTAw7TEhtnvUnAKGkWDa52Itcs6cemuvM7ixjJQ0+cH1qzAcVfPGtyw9qVRIF4a5rjvRu+/m0uvmrNHvTHLa4zwuCjPeDN/5iBGq7gbyPk7iXn6oUD1l56d6hTaCeuaBkt6YjqBn0OSFQTcfzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(6506007)(6512007)(2616005)(53546011)(2906002)(26005)(8936002)(31696002)(508600001)(6486002)(86362001)(186003)(5660300002)(316002)(36756003)(38100700002)(6916009)(54906003)(66476007)(8676002)(66946007)(66556008)(31686004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BqLGtEKCb9UDdAxAHaP0qOfgD44TQGoxIDqUrqVbWadyxqtHyI2kqbxNpNbv?=
 =?us-ascii?Q?tj8Wcz9pDuulWSCxbaXRfX5BR3eZlnKIyzPGHFC4hIf03mu1TWt+X92RP+6L?=
 =?us-ascii?Q?rd0gkyIUbBqVGfUpMOTcu6BAAsz17MgX3NFeWPDjGrFqEXCVV6+erZk/OrZd?=
 =?us-ascii?Q?JV0LNXvkoTmR+abK5unlqmqSjmNvCT7qV210ZizpWJC3EXegFpr4IcTYcS0t?=
 =?us-ascii?Q?tLqZwy980lG++3k5EtZSVFRofW3/Nbln65WLyN4EGqrGV4SB2+88ELbJeuVX?=
 =?us-ascii?Q?d85cEGBmWkDKrW+tETs+BfNDvVar20sZ65DNUxfqK8l1ouXZ7fcInzyOtQxO?=
 =?us-ascii?Q?pJERV6SbQznwMHk/Snh5bGaE5MFSBtGPcD88vNuMf+thNWvTwW2BAcoz7D74?=
 =?us-ascii?Q?03h44MG7fsQdQBRC/6VjJHWSfK11dxcxARN2FVp/Fz1LVf3LBwFBo9/45r1S?=
 =?us-ascii?Q?6eTZaYgDOfthh9w/Rw/wTbMpvi/fiXKTTL11yxulZAo1YqOcyISQkwlAdUXM?=
 =?us-ascii?Q?4k9K8VGGnknwnCMyJIvKRSdN87NWY8q2xXAMdQT3SIcdiwf4EA7Cubi57KZg?=
 =?us-ascii?Q?EWGzCFU1cElPI4hI7hIXLc/7J12Z3RFfxE8nSWl7yn0lUv+ImJFyD1oow61R?=
 =?us-ascii?Q?k44FCaNTn1kUctCbWzU2i6LJu9sB2QpU3v3XlfryXiVsDhM6quxLJvfhYJRJ?=
 =?us-ascii?Q?VYxQ4lWuq+MvjD6UCSgvua0m01JbfbaAduzTYYTNKWGrp/3iKNRRWakPiuZL?=
 =?us-ascii?Q?eiWksT7VP0QIbo7lfeNG9lq94buLjfiebEa6NSEWX1Q1XPMjUzGkQVE2fEmb?=
 =?us-ascii?Q?UyAa2gJZkQiBavtlXnqK1vAVyvaX8YA5w5WjhcUbRkAp7YFpVJudJb1cl6oL?=
 =?us-ascii?Q?Lhw9H8lnziDcZF3airaLhusLw2i+EuUCEpbOi6kvvRrz540nR3sAYMeJA5O8?=
 =?us-ascii?Q?IQRTqrStCsHNahCKOqoYyW32gQb6aXGVjb4eiZfuMPrbif0H6gudio7uxqH2?=
 =?us-ascii?Q?D5ypYFFJW/lPxWSJmiIXGuPU21Hxh26EPbOOooMjfV8NO2v7KiDQqGhDLFWY?=
 =?us-ascii?Q?PUY3fJLIp+0FM9caj1OQTZd5ZmSkdPLYcdVNTZ5rjo1Ep+pKGcSEuqRaIAJO?=
 =?us-ascii?Q?W8ujUyCwSa6NZ/Ak4e2bCjXOjRf/XDTV0NtG/wQNSb8cQYz14vioHDb9bFAk?=
 =?us-ascii?Q?k9THZSrw1ZYatWIFRL7hyRy+2wox4jDxRC/9N7TdO668UiXv6t2iML3CxDrp?=
 =?us-ascii?Q?aBmK+F0jDpDjW9WM+UaegwyZTCgkRemF9DK3IwDLZVuZofiw9x7Vp3xgXSpq?=
 =?us-ascii?Q?K9lliV7VAKlXR5yxHTlsdu+a5eJLwGImelLwhr1Pknnp03TJO5KkctTRj0Xs?=
 =?us-ascii?Q?qvbr6thcFZEq/SNOf/goK/3GMzkf4uUA0T+eEg0AwjhKmKThtL17nnQY9cQA?=
 =?us-ascii?Q?nzDCCmW8viZo/osdgiZO/NDN/G8LwcwmrN7HH3bmWhuvgqvnX5/uQHFxAF5y?=
 =?us-ascii?Q?IpHg7b6mrxXC2Q0reM0qG6NJYXaY86eEpbmB2W47EQDuh22NqC2iE+UAtx9P?=
 =?us-ascii?Q?1q0aQtkzCXXAWfoo5u1dZweJZYOn/JjfQj+IRpvroNsKZTZQfahBcTOYK0Fg?=
 =?us-ascii?Q?VRFl0qPnMUFbzrI8QoYP+veDOKhZVGo1vTkXNJGKklP92VOMGjbg0IZ0GRSQ?=
 =?us-ascii?Q?1xsHfk1zlKmRUky66gf2yAr5fnLAov7aoe9+VokB2l5FshD5exw/QsX+7T1H?=
 =?us-ascii?Q?cGWnnafjdQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6168c57-7266-4c00-08de-08da2291fbc9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 05:52:41.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqA+/rPA7GFyRO1hTZtGGWumt+lTBFvPSoLJUaasp8lnVNvv8LR52c7C0yUYTFeXQCJi4c3knQQY2XlzWr58Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5627

On 19.04.2022 18:06, Andrew Cooper wrote:
> On 19/04/2022 16:52, Juergen Gross wrote:
>> On 19.04.22 17:48, Andrew Cooper wrote:
>>> On 19/04/2022 10:39, Jan Beulich wrote:
>>>> Besides the reporter's issue of hitting a NULL deref when
>>>> !CONFIG_GDBSX,
>>>> XEN_DOMCTL_test_assign_device can legitimately end up having NULL
>>>> passed
>>>> here, when the domctl was passed DOMID_INVALID.
>>>>
>>>> Fixes: 71e617a6b8f6 ("use is_iommu_enabled() where appropriate...")
>>>> Reported-by: Cheyenne Wills <cheyenne.wills@gmail.com>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/xen/drivers/passthrough/iommu.c
>>>> +++ b/xen/drivers/passthrough/iommu.c
>>>> @@ -558,7 +558,7 @@ int iommu_do_domctl(
>>>> =C2=A0 {
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D -ENODEV;
>>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if ( !is_iommu_enabled(d) )
>>>> +=C2=A0=C2=A0=C2=A0 if ( !(d ? is_iommu_enabled(d) : iommu_enabled) )
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTS=
UPP;
>>>
>>> Having spent the better part of a day debugging this mess, this patch i=
s
>>> plain broken.
>>>
>>> It depends on Juergen's "xen/iommu: cleanup iommu related domctl
>>> handling" patch, because otherwise it erroneously fails non-IOMMU
>>> subops.
>>
>> Which is not a real problem, as it is being called after all other
>> subops didn't match.
>=20
> It is a real problem even now, because it is bogus for the host or
> domain's IOMMU status to have any alteration to the
> XEN_DOMCTL_gdbsx_guestmemio path.=C2=A0 The root cause of this bug is the
> existing XEN_DOMCTL_gdbsx_guestmemio case being compiled out in the
> !GDBSX case.

I find your wording ("plain broken" in particular) irritating, to put
it mildly. The change in behavior is that -EOPNOTSUPP may now be
returned for the gdbsx operation instead of -ENOSYS. And that's when
it would better have been -EOPNOTSUPP in the first place.

Apart from this I don't see a dependency on J=C3=BCrgen's patch, so please
let me know if there's anything crucial I'm overlooking. Otherwise,
with two R-b, I'm intending to put in the patch irrespective of your
replies.

> It would be a more obvious problem if there were calls chained after
> iommu_do_domctl() in the arch_domctl() default: blocks, because then it
> wouldn't only be compiled-out functionality which hit this check.

But that's not the case.

Jan


