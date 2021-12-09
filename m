Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3046E751
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 12:11:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242937.420129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHJl-0005C5-Af; Thu, 09 Dec 2021 11:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242937.420129; Thu, 09 Dec 2021 11:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvHJl-00059u-5I; Thu, 09 Dec 2021 11:10:29 +0000
Received: by outflank-mailman (input) for mailman id 242937;
 Thu, 09 Dec 2021 11:10:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mvHJj-00059o-Bo
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 11:10:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4196f7-58e0-11ec-a831-37629979565c;
 Thu, 09 Dec 2021 12:10:26 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-5Qg9j8aOMkuc16TmDZQ7kg-2; Thu, 09 Dec 2021 12:10:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Thu, 9 Dec
 2021 11:10:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 11:10:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR07CA0042.eurprd07.prod.outlook.com (2603:10a6:20b:459::29) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 11:10:20 +0000
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
X-Inumbo-ID: 9c4196f7-58e0-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639048225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X54giRiEeVSqCcwJGMXkCKCFhoT0fPvEK8qMC8Ck5oQ=;
	b=ZHUisT5Sf9k+nx9MDMdv0QJrZx2DY/VemedKF5s0+T9+LqNDTww8I8x/TBScby7ZjMpEoi
	JDQvT5e/PT0zTZr5sdp5IlaibhoBiSxl9LevUvDO5TqKBWiBKaiSqaR+XvT+0q+JOd/+Pd
	z59HeqR6EnXsp2t11qsA7OJecQnIt2Y=
X-MC-Unique: 5Qg9j8aOMkuc16TmDZQ7kg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UhIy1yG3ePpAP2QHB+3ujL4NeDK5PblpVJ4vSBeZXxgpCKCO6El6HccgYGsJ1IDnGeQX1DkUciiZGf7hbVTP6rff9dhZizm0FP1nnuitxHyIrIW4SN0GVYEFNs5NxIg2JmZlpgnfsn0BIsvo1JpOiEzV8PRq5lZHtEEHGz1hvoT67/DYbsGNp9OGz2O8jykRvCZPZJ9K1OfxSh4IJ4MYvDWNdlqppgw7qRf/FGelG0Y5PT+NGKgTRDbB0dqvSW8upKa2VIz3m3uhjGiBXWL1/o162FP1eNj/eOdKpAXimr+ohcBFBowzven1IMaWaQ1QlaCu1uRO8Z6IRbl8Ry3y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuL3XblWkbbUMBp+0ZrcRlp+/YH9/eNJVINVaxU+nzk=;
 b=HRHg+e0Ord8w6As39Vv/zUe7MNIw6agB57Qg7hLLljfd/OARS8jMrZw1xjvCyLIeUx/NbQ6BeU8ubacO9b7Cqix18E54Ul0daMEOYA/Lsvbo43Q3CkLOD8u4pkrFA5JWnzI2FvU+Ht43X+c3Re341moNGddRrWsvkcrm9/GUiwsqEl1xxiekV79NJyJlbWmMN5Dys40AiA74LOFx9La6h/BG2Te7j+1k862oUFTfz1EAgRwbXEMqET8HrlPT76902NuFuqh5FQva4IZRLJ4N+02T6t0l9yJT41Ty+YJ77ghoFWS0BEkD6TK/YgTKUQSHmqv22+RCgAAc6UQQONFmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <02043b26-ed72-df17-b446-180245b5c9d4@suse.com>
Date: Thu, 9 Dec 2021 12:10:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] libxc: avoid clobbering errno in xc_domain_pod_target()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912e2574-2adf-25cf-498f-86a86f31c30d@suse.com>
 <2d608da3-af66-e836-c720-aa0fa31375cd@suse.com>
 <d0c46d33-f51d-e9bc-0f4f-8f7d297fd8fc@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d0c46d33-f51d-e9bc-0f4f-8f7d297fd8fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0042.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 231830f2-51e1-45af-f387-08d9bb047d63
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB353376FC0A4EEE2FFC2A89A2B3709@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FBvG5lMEC21BSBjyTnzEnFUpyjpwGNXaqLyQ8B/xaDqSdrZrwxbGoA8iEtJToM8njQzgFnYivyhajMC2RDa0mKlDq+AJeV88Fy/r3PqC/pCM+/y0hgMGDPvQFApRH3i1w/bEXuDxUdVD4zxUz+BSnN0ktp0OoUdIAG2+de/rKjWV/ie1nff1XCKiYxkc+My6f0rztoS8xqRH63JrulAtSVuGY0nmLB6qvQBF6w5fAVAvYHCYHtiWaboOFzPUVqOYJTENeF+8gGS1hfJMNOmbAWtBsDbSYxIEb5r0oKi3bNYS+AV3xmQtpN0jTYIurgq4vC2GwBRRZBuDCozdOUXYtkRys/AhWf99SflIQT0XzzVZUnnMxNVhdhAe3ua7qllqxabyGEzWVCwt4uHnRnLLGFLwX3IBS2BXTTuHnaAuLTKC8CUJwmAxWsFr7mdMUzsdTHAJMoYo38b6p35OLg8ilV5uxMGOVyIbWYFWWI63CpoGJw9sPg8WCT0iBQkcf5Sz+qtOBsIEQ3roE7MfX0GvGEMCqJCZ206T6y1JbVBf5G5t7tp89WjEXNuUPeJkZQO2X/CUDgom7So9u+kznHt0/jVpkAmzXo8g89mlfNkBl+IVHnl7wS6KzHRqLfOdHo5k3b4lb+KcUq9gx7fbLGeXVfXXQGyRtMiaKPhQseLfz1NQnnUB1j/W8IyZ/FTesvvhAKfSoBJbZY9cANlOyOjUzAPsc5PGnKg99GcKzzcHIiY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(16576012)(316002)(37006003)(54906003)(36756003)(53546011)(2906002)(31696002)(4326008)(6486002)(66946007)(66556008)(66476007)(508600001)(6862004)(6636002)(5660300002)(8936002)(38100700002)(186003)(956004)(2616005)(26005)(8676002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cujjbRJOu6GVuLB/NDKhfGH1xtHWPgf3HaVdZGk/0JO5409uJSJdAM/V14IY?=
 =?us-ascii?Q?d70HE5lttTWWVoPoJa8/fkQbkgUzWPXC991YligjmPE72XzLfiZP/pszKyvu?=
 =?us-ascii?Q?7jI/3DnYxIJfF2SozYVMowo9BcxrRQqCmp7pb0PFuSFSQL4vwse3frmUIJNq?=
 =?us-ascii?Q?zwZzeyfg+RtoBebGgaTs7KoeDgDwl1VTniPDuz0sH0bofIn18h7NwsF0LjQa?=
 =?us-ascii?Q?UupX2KyvIQnZB5BiCtpBlGH/fT8pF+GNEosBuJqluDhOY4JMgsc6FGck8wU7?=
 =?us-ascii?Q?jmX7fYG3zsRGCstlDIVbYHFzgYFarssUILYeMsJbeMJsrLJbQsbqJ+kElgPN?=
 =?us-ascii?Q?Q2ID+J+bkhloPY2GeZqx4ALffE9C8KKQQyDeHtf81tyadVmIVp+RmVrH5LDJ?=
 =?us-ascii?Q?q+T+U4Va2jWGQqEyf5XRlxhQJ31jZ3D54mdj3CRvr+rKYI0TvuwhAr9SRkvB?=
 =?us-ascii?Q?d+Y7OdtNpq4UeABG6gqAF7nVZLyxDTTC7tvdMz14nk7rZdT1x4KlcdNbiYvG?=
 =?us-ascii?Q?Pqm5X6N4A47eUxWdLqeV8ATHx+ZldFtdzj/b7y7qqyl9y/Wbd3F8pob5BrMD?=
 =?us-ascii?Q?UDE95HPvXvrG2tBbByIFaXC9oQoO6yXSJrsZSWnitofboKzuUlgfK/w4y+V/?=
 =?us-ascii?Q?hvwISZ7rVKNM73xU48RZr8iEymI8rATHd8SER+eFVnqq+tM8FcDFTfdc3Jt5?=
 =?us-ascii?Q?wuGEBzI2Z3nW5FJCeR3iKBpYBmEJljzjEYUxPG4TFGJ3TzFwP9JX4U6Ovtdq?=
 =?us-ascii?Q?UMU+cRVZSnAiQbUHLHbNfqQmXMC+oy3Upx5O4cOcccyoSpf8q1FIYWRVw1lr?=
 =?us-ascii?Q?BxXpoG8LyRZrFJj0yasaa7dYwGvv7U+0ECKvaQ1PF4LsHr1A+LQb43sSV2gr?=
 =?us-ascii?Q?mrsh+YLX28rWLyarGFxRpcs1KHzb4flnpq1b7yZYxsKPwd5eI7TH37dMaoJa?=
 =?us-ascii?Q?uZNI/z6KrmSqb3Cgbc2ONNJHS4YsR3oINEPBVkitmkN4RQQW8E5nA+Jk9Sc+?=
 =?us-ascii?Q?KP2uOuvrNXtqk+tSzu95ZxBkB07yXJxxihLSLgsS54TTS991Y7aQC59E3qEN?=
 =?us-ascii?Q?765OrQdavYoW50/LYytYlOEj3Fo/phS6DzFmAbmQwdE4HhWFCfBkbUjaRAQs?=
 =?us-ascii?Q?Vm6ZDg5Cn+s96khaM5yHonAdHid+ks5Qs5/3D/XXKoibawfj+sKZiMkM2r2D?=
 =?us-ascii?Q?x93LAM+lz2aQ3Wvi1QL0Oo/RQkkvjIEsCHHxPXQ4sY1jlehgq4IL30mcYKTk?=
 =?us-ascii?Q?JwNWb9AnxZ7zvhhzalI3tNuKsNypoMjivu/+jSowNyiVXBrm42859Nvsad8/?=
 =?us-ascii?Q?oBxSGNekpyji2IZHN8bGcgAD2aCmG8nMIutbudjyjxzOEza++U10qrxwH0wo?=
 =?us-ascii?Q?tNQQP56OQXo/nmQuHigWpd6uaNxF/rTAT7sCFkYAnhdn26W3rIYPxxdx7Sas?=
 =?us-ascii?Q?AZGeFqJi/ncqlBa5flEyO8SGSf5z4vDA55mHLWrOl958Grl5PVLXnPjvr9+z?=
 =?us-ascii?Q?qBtCxeXGt1WWWh4yqD3FtB6Vq7NHM3JMLfIlyCmFS83W+jr+ijzxtsQdPUhE?=
 =?us-ascii?Q?uodK6Z0nFNvScmJGHhx4KfFrAau71cj1SAdylYrvg1YlR0DD8QLkDsVoF9Q0?=
 =?us-ascii?Q?genTLLALmGMFtIcusGsuNm0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 231830f2-51e1-45af-f387-08d9bb047d63
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 11:10:20.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E+ilyh24hlcl5id2yVyZR93jTbM+Q+atDw4Le7EXrbBxVbAopU3QHuwxr4sX3wVH5J2bRol/t8w0Z42YW1zAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 09.12.2021 11:41, Juergen Gross wrote:
> On 09.12.21 11:36, Juergen Gross wrote:
>> On 09.12.21 11:26, Jan Beulich wrote:
>>> do_memory_op() supplies return value and has errno set the usual way.
>>> Don't overwrite errno with 1 (aka EPERM on at least Linux).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> An alternative would be to let go of the DPRINTK() and leave errno and
>>> err alone altogether. While the hypervisor side of the hypercall gives
>>> the impression of being able to return positive values as of
>>> 637a283f17eb ("PoD: Allow pod_set_cache_target hypercall to be
>>> preempted"), due to the use of "rc >=3D 0" there, afaict that's not
>>> actually the case. IOW "err" can really only be 0 or -1 here.
>>>
>>> --- a/tools/libs/ctrl/xc_domain.c
>>> +++ b/tools/libs/ctrl/xc_domain.c
>>> @@ -1231,10 +1231,11 @@ static int xc_domain_pod_target(xc_inter
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( err < 0 )
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D errno;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DPRINTF("Failed =
%s_pod_target dom %d\n",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (op=3D=3DXENMEM_set_pod_target)?"set":"ge=
t",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domid);
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D -err;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 errno =3D err;
>>
>> DPRINTF() won't change errno, so I think you should just drop the line
>> overwriting errno.
>=20
> In fact you added the 3rd layer of errno saving here. :-)
>=20
> DPRINTF() and friends will save errno, and the underlying
> xc_report*() functions will do so, too.

I guess I should have checked ... Question is then whether setting
"err" to 0 on the "else" path could/should then also be dropped (its
setting to -1 clearly can be, and I already have it that way for v2).

Jan


