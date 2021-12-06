Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB2C469125
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 09:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238725.413770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8yq-0004LL-50; Mon, 06 Dec 2021 08:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238725.413770; Mon, 06 Dec 2021 08:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mu8yq-0004JY-1i; Mon, 06 Dec 2021 08:04:12 +0000
Received: by outflank-mailman (input) for mailman id 238725;
 Mon, 06 Dec 2021 08:04:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0GdR=QX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mu8yo-0004JS-Co
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 08:04:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16c498dd-566b-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 09:04:08 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2053.outbound.protection.outlook.com [104.47.8.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-21-qjOV47uONoCzoVhU2hU87A-1; Mon, 06 Dec 2021 09:04:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3533.eurprd04.prod.outlook.com (2603:10a6:803:b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 6 Dec
 2021 08:04:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 08:04:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Mon, 6 Dec 2021 08:04:06 +0000
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
X-Inumbo-ID: 16c498dd-566b-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638777848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHy3Po9Hq6NQybQT3MQiEqo9cdlBS05cCFyBDEiqRxU=;
	b=fS8ufosaR0YE0CZnPnVbonXYPGPiks7KQafJRIwactf7qpV8ntVUeEPQTduGv0JqcvEjt/
	GPQimsxsPQlJ+P3YRHdFOnyB/cUNiMnWVTm2EZLZu0GvtHJaCffD3cAsp59o/hTTHFBZ6b
	1Zde+ifImSZf8Z6cEV0EwmGd06M5JxQ=
X-MC-Unique: qjOV47uONoCzoVhU2hU87A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA0MuzyQimkgducQ1NJkFK+oPyUa7YRPkDULK4UXTD4up0V0QnCiVMaXgN340lNyGmbtz5TfkKUIrkC5IO+aG0CRgwdOjeclQUPQKE/dkUzW8FWgZ9B4k+RTGEsja4U53PhZWXeJm77L753U95S9qe2jZcig3q5sAMilI/DDXp0POmz5D0CsMaELF4HMhF0q1Rk7CNOGwZZ4Fjot1H7iIED78OhzEKP+uocIQWW/wcUpEU1cW/MgtnrtQLPd5CMR6l6t+dLQxmvDYpP42JrbszHQaces11EndyEhnS9zWZUf/eTnXzz+cLz01gQlf143GRJ9/lVej8jyf9WXCvMF0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9J+hbBIj1avDe+Vi9V13D4/4hloqmCBy6Qf5jdxfXmc=;
 b=iOluXtM5sNf0gEuAw1IJBATaea+hVYqIwn4ibNF4/WT2l7SBsnpSzW0g6m/ixlDO8/vnfQaI4iK3HAgnqbxr5cKTlVcTtLGkmerLB1yWoQaZjFgug6Rrc7uZSWuPhUuGtoFWgUHGoLio31DK5xkdQ+ILv8oRIFw4F4LUjUTFYH6AT7XBxxg2EysnLtJp0pXhGsnG+HWWEsk90cFzs2gmsLvai22qywShNg8oezUf4rFqQ3C52/PhU+wasAS/J3P70FVJ/aQcAcdovBsswByWdc5RFiNhZ1LUc7uej6exv5BuC9F4nJ9lNesyOvGPCVv34NFiLjThlvVz1FNjA/i4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5afac577-ec37-8a66-b144-0ce9d7d40f1c@suse.com>
Date: Mon, 6 Dec 2021 09:04:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 59.5/65] x86: Introduce helpers/checks for endbr64
 instructions
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126163340.26714-1-andrew.cooper3@citrix.com>
 <e5da1903-20bc-4523-9d0a-6071f117c3ce@suse.com>
 <ef297668-96ba-851d-2990-179f6dcb9f37@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef297668-96ba-851d-2990-179f6dcb9f37@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR2P281CA0019.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90618400-7963-435e-666a-08d9b88ef9c1
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3533:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3533F49442ECE3C2C14BAC8DB36D9@VI1PR0402MB3533.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gqas9F5PA0K3+a3HH7zfe1FPadxQVKT8QEM7L1CwgxK1U+X2afJSLbDICqKVKY7vajZYmyDzpAAU2PkHGEGorZ6XRZm+PALJTDAhAl5lP/Pk0EzkM6XuZH6cOoPUGbDj4npuJoKyJKI6pxZhZA0jVWuX7GzYg2tvra7H4gF/N+ilNgyZ6ahkrJjAynfN+n74Dcl3SlNUvlZVQxNZc2+QKHrxMchFOWYeOqYOXZTE3zYBvewJoWQyBdNnv+J5bLm5xeGembz+PbN7DtTnGZWFXpxmTGG4a6/zKzQ+i6HuR6NRIr/P92ejcz7qW2tA6aWYyRp0prf6W7FY2asffSjOGFesJ8jumGveDULrqlqJp67O8yvZW8Zner4tEvj9+YxtA6GMfO/RDob5LyFEWIhSLE6tqmWaZUnmdHcrgwQUdvZUxt2vJ04fYYqj7ON+G273aBAbNECLVzgL1sQ5LcKOJgPvrvie+/edF6KgIlpj+xS2IvjLDfac3SPDl0B7ESGBUBdWCcshjfhgV6IxFFRCnQgw2/GpiABsQhT3p5E+xd/s2W/sp1xI/9RATPXrRVrk/z6P88LFidTYX6ve4OXopvszHSNhMl0cKaZGILlUNjnJqB/ht70Y9RLDkPrx8wNqoNogGhIrKsm6W/BNuNuFhLT9eMgTXVpXM62ASNMZ93Zo5ihU1wUzgXmAmyH1qccyztS2Tpc4BfRd/R1j1baLEm5B3ja9VZW55BSrKxrFHtw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(66476007)(66946007)(54906003)(8676002)(8936002)(110136005)(4326008)(53546011)(2906002)(186003)(26005)(36756003)(956004)(2616005)(5660300002)(86362001)(6486002)(31696002)(508600001)(83380400001)(316002)(16576012)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iWKg6mxApkUxtgDBJ3lAGF7eJAxEIWk9iRC7YeqC9B/03/xUZ+7aVFTXI5Jr?=
 =?us-ascii?Q?k2sxaK0V5r7sNkxaPy5G8vq8Nel1togquhT0N5YZjBPqC/d7+ZUNRkyfKpR7?=
 =?us-ascii?Q?eeudntFjXUCH+xxoV0fM60jesJ14zlOoEza+NmwBfdH+D5wDoIGyQBPL7h/y?=
 =?us-ascii?Q?G6KhFPKpcjMf6I/OiU7OeeyQ57kF26azkEFzc338qLslwEOsILyrhhKciapR?=
 =?us-ascii?Q?RSbcS9PBIjv0h/MPz0FRY2PVBRklwcdT3VATvMjCGk9Nkzku8LYpOkiuSu61?=
 =?us-ascii?Q?F+vHjd5uYY5YD4tCjOWLDbMcYZvuKW80lxR4hhEQoWIJ4uuoc/COdCkN8mFF?=
 =?us-ascii?Q?gn+9r0D5GVm7HuXANkpIgSU+tRXutIc+Di4EoyCGLdljZl0Bf/7ARMFPUoRU?=
 =?us-ascii?Q?TvoztDoMNJGzjmIX+fzHKQbxBqS+mYyMLk2/aVbCLhyani4L87uEc3IMfeaO?=
 =?us-ascii?Q?J0cfsfBor20AR2uuIPnZ66eokg4ldURzEtwZP+iKiWKYQd92mIhq7IqNeW99?=
 =?us-ascii?Q?GuC9X/NU5W9vGBl3H9iJHg7D/ejd0IZdrKAsvvcEOGDw2C34NT9EUC2Kxn2i?=
 =?us-ascii?Q?XYtl/c8lPrMJAWIYYRJLFo1v6LrAOQvFKk4putMYBHKU20t7EkpnxNnOJwyg?=
 =?us-ascii?Q?rN9fhD04vDmzquYibevxbv06p5gVPY48nUbSV6PSPWZnTD+ZCfqb/qOkx4ZN?=
 =?us-ascii?Q?xVKkx/w7An3luB5JzSpq2TZSHA6C9VnPkJYtfkLp88TyuyiyIxZ4adFpAPYe?=
 =?us-ascii?Q?yylBuJ4FiAwYNvOV0IkPW1v4N6xfKeyv2rSFWUE0lv5ftdIQbMIjl/ep2Qk5?=
 =?us-ascii?Q?aqnJiBxoxoXciOhmiMmMma0j3o4SZXPFbVLPhWNEVIwAC7TlMKUmlfDWPQUw?=
 =?us-ascii?Q?6SmwWM2I9OmLBxU1Twdhj+IOpSvVpUsJtdh+8C+4o6grks83OavFoj8iGmdC?=
 =?us-ascii?Q?xvHhZ6j9cXVCjzNwTMilJ3cpnkh5nq83EMNC6ZygZFEDh+tHsT9c7SR58cle?=
 =?us-ascii?Q?8863niXKa9CLU1qEsKsxSk20I21sZAPDesSxuaOmSl13MQzuUqUuoAcnhfJl?=
 =?us-ascii?Q?+QS/XyOGitwaaK6T6o8BbGRRtwBfYRdVHRqSqXPbGgF4C17kYu4gsH1MmiGO?=
 =?us-ascii?Q?BswKIWFvcomc1KKIQn1/gmjp/h0vaAkP0PMtR6LYqSkIawRDdzXVcHlMDwa3?=
 =?us-ascii?Q?5uyb3MdHQDLAggDKN/F2zLSV6snUtFMBPy/JarhPcpqEIzGu/imKKNhJMvX3?=
 =?us-ascii?Q?/79BN+NUHn45WyCx31TUum22SQBRYU0c7lY8iW/hCW+4eqgTIUEuM3/bH8dT?=
 =?us-ascii?Q?BOaWLyutEpM3QfRpcg7J6kEpzhMkNgSbOzPWg9wC7qlMEo6gPi/qr1kiwoHY?=
 =?us-ascii?Q?1LbKv4L7ggIY5JAra3G6O1zwr/QYvYnLSfPU75vW4UM+fS7732FSxd8EKUDD?=
 =?us-ascii?Q?5Miz0O+Wrk86D3wZ+yox3DymX+ki6gPXJRpDevlq+0539hivyvOBtkGHRQtg?=
 =?us-ascii?Q?Zu6msH6BP6R/enXOj+o8fs4gsc5cJFpkL9TvVHVmFl/SpaVhIv/MA5+PAGVu?=
 =?us-ascii?Q?kEstj+/VpmSw+/kRbDgu8Fx6rlMk45xqGohchW8PZkaGWpvuxWB4vFd2lR0h?=
 =?us-ascii?Q?RZdj+0R6vPYrTGW1jNC/pJE=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90618400-7963-435e-666a-08d9b88ef9c1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 08:04:06.6123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzNdrhOZDcQyC3OOIIm/MbK4e5z3FiwA2dOQYsjoDEHFtRT8c0IzK2f0SRrnLoHB4an4ssVWUwf2Mq/aXBthZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3533

On 03.12.2021 15:10, Andrew Cooper wrote:
> On 03/12/2021 13:59, Jan Beulich wrote:
>> On 26.11.2021 17:33, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/Makefile
>>> +++ b/xen/arch/x86/Makefile
>>> @@ -190,6 +190,10 @@ $(TARGET)-syms: prelink.o xen.lds
>>>  	$(MAKE) -f $(BASEDIR)/Rules.mk efi-y=3D $(@D)/.$(@F).1.o
>>>  	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
>>>  	    $(@D)/.$(@F).1.o -o $@
>>> +ifeq ($(CONFIG_XEN_IBT),y)
>>> +	$(OBJDUMP) -d $@ | grep 0xfa1e0ff3 >/dev/null && \
>>> +		{ echo "Found embedded endbr64 instructions" >&2; false; } || :
>> I guess I'm confused: The "false;" suggests to me you want to make the
>> build fail in such a case. The "|| :" otoh suggests you want to silence
>> errors (and not just the one from grep when not finding the pattern
>> aiui).
>=20
> The exit code of grep needs inverting for the build to proceed
> correctly.=C2=A0 Without || :, all builds fail when they've not got the p=
attern.

But doesn't this invert not only failure of grep, but also the
unconditional "failure" of "false"? IOW doesn't this step therefore
always succeed, making the message merely a warning-like one? Or if
that's the intended behavior, what's the "false" good for?

>> Also isn't passing -q to grep standard enough (and shorter) to use in
>> place of redirecting its output to /dev/null?
>=20
> That caused problems on the BSDs.=C2=A0 c/s e632d56f0f5 went through seve=
ral
> iterations before settling on this pattern.

Odd. The commit message doesn't mention any of this. v2 of that patch
already didn't use -q, and also doesn't identify a respective change
from v1. I wasn't able to locate v1.

Jan


