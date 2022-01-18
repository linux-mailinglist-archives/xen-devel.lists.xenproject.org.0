Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6C64920EF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:08:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258387.444886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jXb-0001xo-2d; Tue, 18 Jan 2022 08:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258387.444886; Tue, 18 Jan 2022 08:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9jXa-0001ui-VN; Tue, 18 Jan 2022 08:08:30 +0000
Received: by outflank-mailman (input) for mailman id 258387;
 Tue, 18 Jan 2022 08:08:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9jXZ-0001uc-Pk
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:08:29 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0f5e5aa-7835-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 09:08:27 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-Jn2aLjOxN1mxaqkP4-rwcg-1; Tue, 18 Jan 2022 09:08:27 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Tue, 18 Jan
 2022 08:08:26 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 08:08:26 +0000
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
X-Inumbo-ID: d0f5e5aa-7835-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642493308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=khh3DAmBezr4X69sQrRIi1cs5bgWKcSWj6U1iiuP5jM=;
	b=Wx6VDmUbgmUy9N14DsuZb+aE1WHUmVvYbraRdNXzyqRLPQPSMc2oQT9o4yd+GHRgoW+mwD
	e/MIwKKr6BN7HP+GeV9xT3rcKPDE1dVPKwa3GEb+iTiLlCRYtctUEvjayfxN/XYWDa50pT
	oxXwUb1PSz9bC66XC/t49oggJZ+lRsM=
X-MC-Unique: Jn2aLjOxN1mxaqkP4-rwcg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS4hPRpdOZVT8BO6mDMiQAA0H1AUQ1Kbrrvqiq9C0HnDjfsiFiJJv1NghT2/8PhBual1d/Cw50PHocTSXvICHnkqUGWJNHBw8/CWvPTvLYydsljOKLXuPGZ1K3YTD4HKX9YZxhSS1dHpd4UpdnwiE5S8sKEhzeH6UNtzRdSaXY98TY86z/FLbq3Ec74p2xAWbuZVqnBrud0cfKpZof9QFv6Urt/Tgwctd+GRj/q7znqRzGzEd1zPiERMxw4EqIY8PD04/Nevwx2NOPtSsKZY9vhi4l3IUEzECH6126+CTpQvoZiTZL9WISxAelie50qlHrblgAIJjL2L0d0WGB83wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z10DVoe2B9qoWsWBTasR/Jlp+h/FmGYKdClr1dOwOZg=;
 b=YS6ZP4+Zar+2D5dY1OWLs/zQaken7HIvo6OEN/uYIw+iJAyZjJPtYG3ecGIdvZDyOgnMBPFqfyRAa+JaYyskw7y0WfNBGC/h8vo94WW1SGdGFVU7ef6POmFNjVfOox+fqB955AcYu0i8jrEvSXRYnGDP5HUjyL5xDhda/fyP9sTCkZeDGB9eiDO6jvEtBBYZl9rff4XEHW/MZPILifbW4CsyTVEFIySnqbBddYOlYUVFfFzEg7Hswk67S8rzeGwlodW9v2dntHIzOT6YFdFoFkAYmgaNwj+M9rLKvMlW5n5DWEVdkv/vVAqRZNg8NqVwRg7ARXvsC7WuFpy9dBw6CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6a0fb3b0-e3b0-464e-5cd3-26b378942e51@suse.com>
Date: Tue, 18 Jan 2022 09:08:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Fwd: Reboot hangs on blank screen
Content-Language: en-US
To: The Person <oddh879@gmail.com>
References: <CAATqfqB5=mTtbnm1+mXR2U=G0pjjtX7z-brNCE_4us3LzNEojg@mail.gmail.com>
 <E658EC8C-3C13-4EFE-B5C9-6E91D30ED2F4@citrix.com>
 <CAATqfqD70LtuCUMVAcAG7yeZNU99P7a_3y007d-M+q3i0p1VPQ@mail.gmail.com>
CC: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAATqfqD70LtuCUMVAcAG7yeZNU99P7a_3y007d-M+q3i0p1VPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0402CA0007.eurprd04.prod.outlook.com
 (2603:10a6:203:90::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b06ac766-1c8b-4ea9-fd2a-08d9da59b415
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27030AC60FDB9A486A655477B3589@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qAVOxSJ4RwL9wWxgTOAgYxgWtKRFCX0TWWH4GqchOdSeNsuqaX5+M4DeWt/wrTB4uSE5YwD1eJyc8ASfQIzvz/BW58PLIYrmErW5R+DUsx+wssPZSedpMBLNsp+x90vWyN6aAgugG+gh+wX7zGcsFRyCkj0cr/fvMRV8S8X+6pS2j6OASgCRGOjpKxFVHRUgPKSsMOWlqXUEb/D2Kypu/rsCO9gX4hwOvTEbSVYXwkqaZqYlVlApMCFqCp6n2gKsdmH+KNK6Ay46iGcZKcITyUvbP+HAxUOltOc76mB7RKm9+ry2soPefUn8g5sAC87NN9Jqg4WnYt99ZVA4qP3NcjXifvXzFqs/DibAna+RwkPDbXoWUk4FKSOVRk6DXtyzxMpYAwfATB6s38WCpN0x1N+XwrgIJnI1lLiuUiOMXPOeae3RUdd57bxXPsvhKxuGkwY2ds4rEk5ggT4coTqtLCi8TfEVDhaHn1DtNseOzXoQHWNYsgaKiSLMG0djFZl2mZQa8GuzTmZLbiXC5PYv3+PJErqq21FnB2HaeJ/Lr92aw+XmJXAoGbCoZ8hObE2wZWI1nRL63Q/AroyxbFmSZl+YJChPaKLzb14udsGsFFiabuPV3sglEFbNjwpNxyUqX+jtoy6oMduE/NIw4PImnSS+o4LfbhPTgFcklOqDawhOdxWM4JwOELTdzY3TvtDGE1Q4/cjYGAoyZi/jJR7vktWhv73iuB6XbwaeaCVMBXqUZaEOWG5QfMP4ZfyMbscq/X6kNqSvyHsJ4RCuzFyTKR/iR0pJvglnTHnTAteTvJBZ8rN0elInrpqqNHvpAXlr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(66946007)(6506007)(83380400001)(6916009)(186003)(4326008)(6512007)(8936002)(2616005)(2906002)(31686004)(316002)(6486002)(36756003)(966005)(86362001)(31696002)(66556008)(38100700002)(66476007)(8676002)(5660300002)(508600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9CseZAwCv6VnnYdlTRoSLerpTLq+RbSmYCrPnB9ALcuMazADyP331Nh8UrxJ?=
 =?us-ascii?Q?B74AHZR5nMtPOE1K/ffcNtCOloVNWc+7Zeww47c4OBrSZOCL+MvmcXtoN1TW?=
 =?us-ascii?Q?JtaiH9mAArZKynof2BDBCie/fLb4MVwelaRfNxUvfYHMSp5zhQLTbGIH0X+a?=
 =?us-ascii?Q?ipg5Hh+4g8vu2Qr8M3X4pk0jOUazcmzaPCTgYMW7Rvm35yvNLu+4WWk1Ctb9?=
 =?us-ascii?Q?X3AiYgj2nJelqy/8nUzgu+9hLyCR6UajGcXVbsPe9ggY+fLFDxIwg1plfMIF?=
 =?us-ascii?Q?IV0O/XJv823Iq1muH3rIpNdupA25lmJP5tMDtP0r3KKrq5TFM8QzGDFXOmxX?=
 =?us-ascii?Q?aoZnPUO9UTbeITpaYd/gwEaxmjT4QnbQxfDGzy8ocPVegED4l+LTcXbLTDUI?=
 =?us-ascii?Q?/p2asDgI8wiXrnJPgLVv6DbMdzAqeUageVfm+nCQEouh1ERdzJs/yuCjO7iI?=
 =?us-ascii?Q?YIqL8kJX954CQ4LYVGNkGK+qZ6c1HO9t7pE5213x3bD6GOmQvmtgMfRxFKKd?=
 =?us-ascii?Q?sMMkniJI3Yby8SVPitjS8N9T74x/PxqhZAfbihE6OaWR8UNVqSo1exGnnt8H?=
 =?us-ascii?Q?4v2/blIRuRJmLRDJATLGtCB0ssA1I7JKl6pKF4pgeTXahRMJTj6lUPfOLI4m?=
 =?us-ascii?Q?hvY1hqCu+XJiYkBKj3h28zMvYADRycogj8qe8TpmBFTjMKDgmeXBuJmHplbJ?=
 =?us-ascii?Q?uM33psh1wDNO40J+3TUKExMIq0yCuVj6XYZmtsqqklTrasJwZmhIbqUN2KXn?=
 =?us-ascii?Q?55EZ8djwk6ga+C/SQyDb5/I7NMHJs6X/ZGlk9mwurKXFVgRaNf5P+lnZt8h/?=
 =?us-ascii?Q?mNqohKYAlED72JPBwyDjMzMa4H5vzuAMl+ewODX47XireHHw3IdFnqzTELBM?=
 =?us-ascii?Q?KGswrzohzajfFWhYEeP0Q6uUbaK58nJfYd8CWNAEn95T/QMjqZZ7uSMhXIcc?=
 =?us-ascii?Q?r39fB8Vg7MKy9RiFQgIXvs9Ptb1RKKMouzErEtF6xDrRkpJJxl7ZnYPA6N9x?=
 =?us-ascii?Q?3q0JdZW56efLRdqLNHDPrEjS+71XDHVfvsSlxYIxd67Sq0cjke2lXcI6G/Kx?=
 =?us-ascii?Q?RcDZS3NmjIU2h02icUKI08Ka7aAy/sTcn4AZgjsl4b3M53GrB/7tKM++K749?=
 =?us-ascii?Q?iEqbixhdw/R/RPtKGCNCwbPD3Lj48fqKh41bn67IwRqtj8Alj6VVWoRNiDCe?=
 =?us-ascii?Q?soBenejWAXaARrr+2wJNGvgntQpZKdUOjAK0vkl57puHdFMpxsHs/agdSl9E?=
 =?us-ascii?Q?hJnjgFBoV0CRFlHOMd4YbEM66UGZet8CwmHit7pldxqntwXQGEpoOLpWOneQ?=
 =?us-ascii?Q?IBXJI7oH3+KSsKLozKqbGrWRY7yTVXTaI3NtCmp/rtOVF1YULsQJUZbFT8YY?=
 =?us-ascii?Q?1SloESO01x8aqRA1qewZNvpt/Pwg3NnfJPksOWS34cXBc7RtgoWZc7JQi0yE?=
 =?us-ascii?Q?vJTKkigHRRSgECnxqjk6JaFE583Okdtc9J4EIBHUAzbi5ZpsWwB+GtUQ6JBJ?=
 =?us-ascii?Q?C2M/kW9Cc7SKXhLmYQNss6HAT+itSElypy8wToHda0GYWRHHBG8QsfTwyJ69?=
 =?us-ascii?Q?yqPemLsbBhKmcsiBszmTKnIRfeFgOttyoksaM0eX26Sm4Mz4/FhHv5WW7LT+?=
 =?us-ascii?Q?lXf84yjradNydMGcYm7BocQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06ac766-1c8b-4ea9-fd2a-08d9da59b415
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 08:08:25.9789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VwMCf508OzMbyaC9mqMqDLUc+5rSSIKIm7uKZmKnEeyFn+PNMiyr9icMMKFt4H8YB5p6h3Ss71//KX8w1UkOHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 17.01.2022 20:30, The Person wrote:
> ---------- Forwarded message ---------
> From: George Dunlap <George.Dunlap@citrix.com>
> Date: Mon, Jan 17, 2022, 6:32 AM
> Subject: Re: Reboot hangs on blank screen
> To: The Person <oddh879@gmail.com>
> Cc: community.manager@xenproject.org <community.manager@xenproject.org>
>=20
>=20
>=20
>> On Nov 29, 2021, at 6:51 PM, The Person <oddh879@gmail.com> wrote:
>>
>> I am using Qubes 4.1rc1 and i have a dell 7520 mobile workstation with a
> xeon processor. The Qubes team believes that this reboot problem is
> upstream with Xen. I would like to know whether the Xen development team =
is
> aware of this issue and how it can be fixed. Qubes is the ONLY linux os
> that won't gracefully reboot. I never had the problem with fedora
> workstation or ubuntu. Is there a way to edit the boot file?
>=20
> Hello,
>=20
> Sorry for not responding to this earlier; I=E2=80=99ve just gotten back f=
rom
> parental leave.
>=20
> If you=E2=80=99re still having issues, please submit this report to
> xen-devel@lists.xenproject.org .

I'm afraid the above is too little information to do anything about it.
It's also not clear whether what's seen above is all that was visible
to George when he suggested to submit the report here. Please supply
all technical information you've collected so far in the context of
this issue. This being a "mobile workstation" (whatever exactly this
means; some quick googling suggests a laptop) may imply you have no
option to make use of a serial console, which may make debugging of
this issue more complicated. Please clarify this aspect.

Please also consult Xen's command line documentation [1] and see
whether making use of one of the "reboot=3D" sub-options would help you
get around the issue. If one helps, please also report back here.

Additionally I'm afraid I can't make sense of "Is there a way to edit
the boot file?" What "boot file" are you talking about?

Jan

[1] https://xenbits.xen.org/docs/unstable/misc/xen-command-line.html


