Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D13415B99
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:58:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193596.344842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLV0-0001da-Ke; Thu, 23 Sep 2021 09:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193596.344842; Thu, 23 Sep 2021 09:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLV0-0001bW-HJ; Thu, 23 Sep 2021 09:58:38 +0000
Received: by outflank-mailman (input) for mailman id 193596;
 Thu, 23 Sep 2021 09:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Uzs+=ON=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTLUz-0001bQ-66
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:58:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5de0de3-2041-4c49-9524-17e001ebd5ca;
 Thu, 23 Sep 2021 09:58:36 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-k_lmU9kDMnCB2eyoKPSt_w-1; Thu, 23 Sep 2021 11:58:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2606.eurprd04.prod.outlook.com (2603:10a6:800:51::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.18; Thu, 23 Sep
 2021 09:58:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.013; Thu, 23 Sep 2021
 09:58:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.7 via Frontend Transport; Thu, 23 Sep 2021 09:58:31 +0000
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
X-Inumbo-ID: b5de0de3-2041-4c49-9524-17e001ebd5ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632391115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZUJVWCi178wU2K6APwOZWBURHqQ6lSLk4CxpqjOY//Y=;
	b=VvP4EX1Gc15DpnCB/pgO2AEFwtEqltYDntD1aWY2V3j2va0mbl14wsS7gvr9knKYFSxitQ
	HtXbZuwHzzbg5Op6/51Fq9f/s0rgzqlWHI4pNC0M8hQNLbWyH5/LQPxLzaaTwdAlENZ8ch
	UNwYECxTXxmfjs/cYk9EwlS0e2f1Y/I=
X-MC-Unique: k_lmU9kDMnCB2eyoKPSt_w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQtCuUWIn/2i6cXNLHshDgx9MulkZBYF/z6qv2tdw6c678f76QV0DMO+LJuEssSu9vegYqqzGvDXELjQ7fUntCESaNoraPsXa2N+CQx0Dlgn7FMrvjpwkA8/JCjm2YcXKxGMu5tXxJKwjYaQxqYVnHxYV9UW+EWdBGAj79ZCZI4aewE0BW9AF/3A58FgfQlWaVis3CzQLFqdnYCtJmbgli2XAxJbG+GOsqkeXBpcrskUxk9eTQ8dFF5hrv7VvHHt6mG3r2Ey1+ozfsR9RxtF+HOVY/VhiQZ3L4MmGumjj0gBNjJ+ao71u6cJK9BbJSUyzn9uEs1BVqCmBqWW5uUX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eOMrY5KR7MGvqsNHWNxoLZPlaZKGm2IB8vaftL/+ERk=;
 b=O2fFsfROYxEu8ojJxh5Z9CLB64h9gtkAy4rGnYBS+t5vw2sZ3/k4vvX5F83h6EmbnbCwT/W/chPBzdN7ezGyb4+HuXllklGyVqU3ebNJWQnHibmc8x3Ron387kp6SvuXTp1nYDjhV9c8FXxDKl3oF89gq/XNUonyetc7DO5tdF7Fx8pJDJfqaMHfq7UfWeoONMT6AnZsvs78CGJJ2l+e+eknUqCcd1+Nujx6YI8NQJCx6xkK6j0QSDkZ1dgJRaYYArx9/gFBqKR+VqG+Mtqvy125jHAsB+2sqjWdHkupFQii8/A9GNeiDeD6PK/yoLobGXgHWR9ufzhDjRYVr2puGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v3 4/9] x86/PVH: provide VGA console info to Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <215e2ea4-cb49-7d94-7f97-c6b81e522a60@suse.com>
 <YUtFLB+n2piR+cHe@MacBook-Air-de-Roger.local>
 <e1def032-d8dd-f5df-c4f7-a9968083f06c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4438c535-b83f-8b15-91e9-1815382180dc@suse.com>
Date: Thu, 23 Sep 2021 11:58:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <e1def032-d8dd-f5df-c4f7-a9968083f06c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FRYP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::17)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69f558f3-9473-41da-670a-08d97e78b30c
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2606:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2606EF263EB20E8BAC1C3068B3A39@VI1PR0401MB2606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8NroSra/PMnZikpOmQ3FKzz/sDVopOQE5fkkPDsd3SwRtgLfxK4ByOKo54STaUsuSccOKLsPH05Z6POcsLnCzRrDSixYfeAQpe34vB3ImUZXB2Wui9KziJgZJdpZLJCbfl9mAoUnZbJoJB/OEzyVN3wJo9Fnv2RjHeYlu7YjavWmgL7btp525/VW4n39H95KF/mVuNu1QzEGAed7IcfC7XJsT1s1Pv/UWNjT3FWmeVlgbrFgKWWa4lCHolgDA/7YcwTg70s43fLPsf0uMuNn1VJpOr4BkJFZ2+iwQSHMK/jvPHNRYy8OdQ0xCIOV3Qtv80bGGSHUclwxbjrX7W2fQjpspsOhAD2r9ECK+xWJroJYY5YG83ZBP7cvK/alo2NcKPysd5CXnZwWWVW25Ws3BIF8lNtaImDJgOLTmcctJqXciLST6NzFb/zdB5PaPh/+vbMTKic3lrF5IDf8UpIZ878noOmbN+8UakBmI4v2jSFF3K8+mW2gT3e5Ko7cKhZkKv90RtX1IwWHSE/ku9i9/rRBP/73bdzegHHjV0cTDE19SbZUOoP+IR+wtcAaR/uAtkhNXsPbsFVBXoYj8kWQGObKEu3xHLfcEpXWjUg4COi1ndOTbWvHlSmcpiQbyloV9uhPHHprLrHWnLA/LudBxPxy2wecPOQTxEu5+DozI7tMEDR/j/UIdNS680TrZ1H5y5Q9BRcgNHgcVhUZpaCGXBaF57wir6CND06ZaerIVVFbCHGoifsbZ1mS7/tD8yWj4r8aPFzIRFb9M/F6nn1JtQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(16576012)(8676002)(186003)(54906003)(31686004)(5660300002)(4326008)(8936002)(2906002)(26005)(53546011)(956004)(66556008)(2616005)(31696002)(36756003)(66476007)(6486002)(66946007)(508600001)(316002)(6916009)(38100700002)(21314003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eSf2Ur9tLFqOZP5xFuEl/mr8w5acZliQeOqwYizZ9LpdtcaUsY+N5zY5yGIs?=
 =?us-ascii?Q?0pKShnCAa5Y3LZbzSjvhwqM63k1vB7Cx+ARrylwpZCoWcqmpmrq3jiJC05qY?=
 =?us-ascii?Q?SB1zR0NI39RHWnkpUtbTt257WGkpiZpA0vC2dsgTB1TMW02X5w+gbJinNO/Z?=
 =?us-ascii?Q?8yVzRzyjXfNv8uQpl3SoX7KWmmkoNWKUKp+yH1bU9V6QS+JVYQBjnptSQKh+?=
 =?us-ascii?Q?2VV7iVHO3MSUAr6/qVMqnjaYMnIItolN29m8dZii/Qdd9m1947iHzc8arhj1?=
 =?us-ascii?Q?laab6n6DQF9HiN62GxFRQ08wPi9+jjxBilwrPHbF32t92GrEPEvjjTpRCKUU?=
 =?us-ascii?Q?MrUOaOtt6aIkL+8hWBtzrxJdLorjt1hWNZxODzi0WT1ElNTbWF8rsuHWUP2Y?=
 =?us-ascii?Q?koZfFhgrXbwDSupiYY9uEyXt7Z2/cRIZHONN66H7+oX+V61gksiGETdRGqLe?=
 =?us-ascii?Q?QSYlIN2Dchev6YDVFaah/ryHOkg+jwjz9hKkhMMrlxF/ULLzgg91dRQF9in1?=
 =?us-ascii?Q?x6wBGc/2ThtjpPb2H6TtF5ZsTC8Wp0DEWPR/GeGlqaRcOvKS6Cv0cNOXFLwE?=
 =?us-ascii?Q?bgA+UsMFoVg36YTSgDw6N8RvHNA3CkFbq/FR4BRrHy9BxSxIx+jKaVrjjI0V?=
 =?us-ascii?Q?YE+cViCAXGt8kYfio+IVfBmiq0kiA2qs7DRVvjRAl8+m0BMsneGNaGRILhtE?=
 =?us-ascii?Q?CfEMPantnk1CXO2ZgUBVmYQc+y01okUI6IobETwS5gW1C5IkYIEcKKkA+r4C?=
 =?us-ascii?Q?Qm/RUtFXr4SB+dpje6241e1+2iq48h1DTgk9/wZDfiBJqarIrVg3UwsncfzH?=
 =?us-ascii?Q?vFu+qWIDHcx/jM6ttcPdv44zLnBqlH+asct8hfZX1dBrXdNfZn0BFkHmn4H0?=
 =?us-ascii?Q?ug2ow2lfw5dAnfQ3ixSpWHr+zq2IqyvDTWtHkFSsF7azMvLhiPvCALWl9v9t?=
 =?us-ascii?Q?dbQCHa3pd+WfM2N7wnom7gPzkadCwS/z6nCQSNNHS9/oBlkvI5gidasUAB/H?=
 =?us-ascii?Q?aC1vhLHGwmr7aqxAFuorHtc8Eq5MKEdlRf0ZQueywLAy8tTX8t0QOERxZLbH?=
 =?us-ascii?Q?KGO8g4MYu/9srmplwzsWwCyX74A6eSN9SQ0qEzrlzyGh2tmuDDiVCNWB1Dl0?=
 =?us-ascii?Q?l/60kHYFVlX5vk3g9Fx2/g/sdhcFaXe2DXy01cRcFAk2pUYW9mwcms9wAgzs?=
 =?us-ascii?Q?p1vasuYLu1vr8tpsSOX9E7KhsCQsl0aKYKjIkgG2+7OlJhANiOIKvtBHGJtU?=
 =?us-ascii?Q?EnSa7gzVjgYKSVQv3e+RWyVQ+6uOqjc7HCzwX/e71GIOlSQjFKWisL31y1VI?=
 =?us-ascii?Q?3gNQdZO39Pd9IlJMSbi17rnD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f558f3-9473-41da-670a-08d97e78b30c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 09:58:31.5595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 18w7lkAmADHAYGc6t1FqR6CVo1aP8RcxqqRFZ5Ek5xZ/XZGR6beHQtusKlCErsuQxMcfaH4ePyE7pPNjzOXPeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2606

On 22.09.2021 19:03, Andrew Cooper wrote:
> On 22/09/2021 16:01, Roger Pau Monn=C3=A9 wrote:
>> On Tue, Sep 21, 2021 at 09:18:05AM +0200, Jan Beulich wrote:
>>> --- a/xen/include/public/arch-x86/hvm/start_info.h
>>> +++ b/xen/include/public/arch-x86/hvm/start_info.h
>>> @@ -33,7 +33,7 @@
>>>   *    | magic          | Contains the magic value XEN_HVM_START_MAGIC_=
VALUE
>>>   *    |                | ("xEn3" with the 0x80 bit of the "E" set).
>>>   *  4 +----------------+
>>> - *    | version        | Version of this structure. Current version is=
 1. New
>>> + *    | version        | Version of this structure. Current version is=
 2. New
>>>   *    |                | versions are guaranteed to be backwards-compa=
tible.
>>>   *  8 +----------------+
>>>   *    | flags          | SIF_xxx flags.
>>> @@ -55,7 +55,15 @@
>>>   *    |                | if there is no memory map being provided. Onl=
y
>>>   *    |                | present in version 1 and newer of the structu=
re.
>>>   * 52 +----------------+
>>> - *    | reserved       | Version 1 and newer only.
>>> + *    | vga_info.offset| Offset of struct dom0_vga_console_info from b=
ase of
>> I'm not sure we are supposed to reference external structures like
>> that. We took a lot of care to not depend on other headers, and to
>> make this as agnostic as possible (IIRC KVM is also capable of using
>> the PVH entry point natively, and hence depends on this header).
>=20
> Absolutely correct.=C2=A0 C is not an acceptable ABI description.

See my reply to Roger's earlier mail.

> Furthermore, dom0_vga_console_info is a bad ABI to start with, as
> demonstrated by the multiple problems we've had extending it in the past.

I don't view this as "problems", nor do I think we couldn't extend it
further that same way, if need be.

> The MB1/2 framebuffer information would be a rather better example to
> follow,

Maybe, but I'm not sure - it doesn't look any better extensibility-wise
than dom0_vga_console_info. Also MB1 doesn't really have separate
structures, so if anything it would need to be MB2.

> but we'll surely need to pass the EDID string too (at least in
> the case that there aren't EFI runtime services to use).

According to the understanding I've gained while putting together the
patch to retrieve EDID info when running under EFI, there's no way to
obtain these via runtime services. Yet I also don't see why we would
need to pass this here - we've got XENPF_firmware_info to retrieve
this data, and I didn't think we need PVH to behave differently from
PV in such regards.

Jan


