Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E44F8D50
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 08:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301125.513871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nchio-0001tB-Rq; Fri, 08 Apr 2022 06:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301125.513871; Fri, 08 Apr 2022 06:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nchio-0001qD-OZ; Fri, 08 Apr 2022 06:03:50 +0000
Received: by outflank-mailman (input) for mailman id 301125;
 Fri, 08 Apr 2022 06:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nchim-0001q7-JB
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 06:03:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a737c84c-b701-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 08:03:47 +0200 (CEST)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-37-xV4G5GKeNvKi46z3qrVAcA-1; Fri, 08 Apr 2022 08:03:45 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 06:03:42 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 06:03:42 +0000
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
X-Inumbo-ID: a737c84c-b701-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649397826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vsVpE/z6laqzXfNvL1yEb/zsFtdxv061bBUPWii4/Uc=;
	b=VHbtjpnsIzkRzOQt/NdGCBPgybAp21eqW/RiDjcz7e6t/HDZq/3OPHEhFmRRRPHv9pJj4e
	MA5jb0MHfLyuR18i7sWZGgJx+FAud9GRXAyaYhasnvO8NIaBz9FaLdyakjKnCPYZRdZe2M
	e0KunvIeZfzyGjhX78J3VDYtRrbPV7U=
X-MC-Unique: xV4G5GKeNvKi46z3qrVAcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eBeQRk1/AibbsO53vUA6ahfxCvV20aNYlkhjdskpsdhCFUGGpP4u6zElXQrhHGgkgr5OebAO4bXs3kwLu0qS/EmSsEJUqHIPGMGU7ZvZAv7yfA/FY0xQlMJdyKXkTUKyhf3R0KRvnnztl4sROBrlhLdtEc6e0K8upSlGnzH6/ozwNbg61Lk915nyb0A/d0jRpIeumLS8wQk0ElHWfMwvjt++EaLTeP3ivmCEN6DrNQaNhFSwK05ZQUnHSsaD9NsedWET/Y5ZWNGHTaESrl7GS2cIS9OsmjW/jA7wmO4Nzcpx2GIPPhOBHAz94mvLxe/vhvGdFkflsYz7anfgt+XXRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iUQMe8rwMW19mCVcx3iXH18hdYYZg4WLaVzzpl0b+o=;
 b=A6Ohh61foZiGNPKqCY4D9bLEDh5gFsZOM/skzQDienNLU6ePsnKb/iKgKKDu5OH/n0DX5l6ibzmmLJIGYn71/DgHAtH+UowZOe/arEIVyKZ1vnb/Ddi3FvnD86GpyF7ykHCaouzJnFwe9GoVs0+WlDouX7CyDMAPFJYMvlTU8B9+QbPGfG/fZLHruB4cr1QQTh2LhpScXYGIdKH45hjYxRYvX1tWaXBipDrB1droMsejNEQ+8Pbpgj3SbEmtawoNtS2E+p2u286ZTcK3Q1jQfpET36RcbKviJsTSRZ0F4aLWoYo+1+vVSAQlbFSelZwZ2SSsyoS8DndcGGF9xWQByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0057e1c5-a651-dfbe-18ed-dc118abb723d@suse.com>
Date: Fri, 8 Apr 2022 08:03:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] VT-d: avoid NULL deref on
 domain_context_mapping_one() error paths
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <6e1c7faf-d1ea-1a61-5452-9dec5b8fd221@suse.com>
 <6739cf19-a74a-208d-82e8-28dfde7710f5@suse.com>
 <Yk6VvXJHWxJZTgeF@Air-de-Roger>
 <15a53720-4dd1-3139-5d78-5b8a5704a953@suse.com>
 <CAKf6xps+VAvi1QcDGG=mB2pVt3frWFj=6pYrDMVKH+KgE6qaEw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xps+VAvi1QcDGG=mB2pVt3frWFj=6pYrDMVKH+KgE6qaEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c656d26-7422-43c5-4be5-08da192588dd
X-MS-TrafficTypeDiagnostic: DBAPR04MB7350:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB7350D9B5667168969D01B9AAB3E99@DBAPR04MB7350.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RnlQcAd4tz2tGywsv6FcwsOpZKwdWyzHwwV8Rh///vlVtCLjPbDGwp1VngMZmjlMo3XS1FJLXdEzDrEc8C92fH1idahtKMQNCHGTonXTRn4QQxKtPru1EF7Dmss2OvAGY/sCdPuaEKK4EdDJWfwoJSeQVPyVpv7PAE2FgREyfrVPaX5bu9FJpTIjDqBdRciWPWWmhalLOAhwAMHW+lpFEN1AcB8mF9J2PjuUbpOD6//bSEERcScDDKXM9lHvx83Ub58bZdyeJBY3h+9SU9I4zdqOsQqBD78KzPZg+23VoryIOr7uudL1UYDQe6PvXRvxaiQKUKICYdHSc16u9K3aDGHniYYHJNoODKb1wX9G0fmFe4Na08FqZZtAKcQGLDuiQCkv2rzuHzUsX3QvLLdKIEsK4gNMFht6IzdTrsmFKHsr4D+8mUxyDS7d5YL/3oo95RdFuDCXlyg8X3KGmrV31//JHHZdxAzPT+3s+EhTNwxy1jMAEtJeUcfBUABbCZ9AQQuu/xfTRQElxp0iZi0EeGmqy2o9ZBkr1YxjMBTBNzQnDhpuJgo/0cf44vf+IigaD7+WAWm/RX8/RX1+y1mKhrYH7ZoLR0bYEm+Qrq/yWUJpYwRevpcoc3LzR5Dd4Gla2ZinVxGYQY2AddSkuJOjbNGfQGHM7RRSg8FYe8tbfGef1ycuCLKen9JynIYpZEuXzwbgCGUmiQr3zXXQFnBABg5a6WhvCkBoTxnMmoftZhZ30Q49zhBnI030YLEghIuB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8676002)(66946007)(66556008)(66476007)(6486002)(8936002)(4326008)(31696002)(31686004)(38100700002)(6506007)(6512007)(86362001)(53546011)(2906002)(83380400001)(26005)(54906003)(316002)(5660300002)(186003)(36756003)(6916009)(508600001)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nTWbVKcPDx6ZYkMpGQ5EeX1slovt2LDf1zC6noaH4hb1rmnhaiXu4SwgEjAi?=
 =?us-ascii?Q?2FqXV/YFR9O5G0PctgvopnViI976dla7QkkE20+2VzR37ebDD/VlPaUpeIxR?=
 =?us-ascii?Q?nNFugAC9r9kfEMc9Haxt3TYx1TOhdaUMopq8FYlWv+ENx6M/c8K0Z88u6uvv?=
 =?us-ascii?Q?/n1aHAxwcC/sAyU5CCONxrXgP0m6qqiqBaHMguy2jbKB0okj5rBjydgOpqnV?=
 =?us-ascii?Q?ricNDyYX9w3XCWhKBapTQpa7oCGqVQxhKcgcy+ftDxcO4NHSPUPX2pCUI2Uk?=
 =?us-ascii?Q?HNZH5xLIbJptBWuw1PujoYdHRcSq0gf66ID6Xo+CzIuwrXnFYlmh90cwIDgr?=
 =?us-ascii?Q?PpjemzGuoLgjQq9yOwcCmmqf97CGeYTb8e9NzlGauT6cW40Sqop53xleRbFw?=
 =?us-ascii?Q?TS/Pmj5p6ofkqxFwYQRi3EW3yZdaXNmzJ7aUA3xtuDBnhDtnmocPxNKOrNYJ?=
 =?us-ascii?Q?DfM8ylWcmTPRurJwnPUTFwDKYgUs7/QB3K0vCAIyOJ1JFRC/x2F2saEZhQ96?=
 =?us-ascii?Q?+viWcuRUFg95iJTFjk1naq8lj0D1DRBFy+/54KXDRTKCgqZOett8SqLDDglP?=
 =?us-ascii?Q?UK/k36tYZc6Yvio4zf1gtiG2oMbzyAuTjPcsRum9bAv1GCCzRLwpLienVFJZ?=
 =?us-ascii?Q?6G/uCt/GvlWP54XFqq1V35mDPwSF2LUOakdzSAzHlyNFOR4fuDN5AdZQ2T3o?=
 =?us-ascii?Q?K4M9rkAUzUbbZUHf/CSdIDqm7AEH4oN6nh0eTjtTdCdFlnJvFvLe+GfOf/oe?=
 =?us-ascii?Q?3s5J7GBykkfutUEDIP7Cycdl4zexXrMS4HR0iTJt8yyf2yuKy2pM5cic6evi?=
 =?us-ascii?Q?rcr6pj8AHTKEM+uhyB4B3Wn0wSMuqu3ALOZPiWKnr/UUCM4zWIEbQbI95pgs?=
 =?us-ascii?Q?L3WMyD+Qdowk/vU7diErJpUXVHqn9ZUtm/zbPY5G+3sSEqZcl6rngvC7hr/e?=
 =?us-ascii?Q?zZdvRAkA0kOkumAqhN9XiH9SJ1CjgG/C0QmqB9H5h9yJmkLKu4PTCueFjhwp?=
 =?us-ascii?Q?A2YzbMBJc7kUqxJKQcZjv74Sh/7/Talo2bS524Lpj//703fcCXzIvOhb9ZkC?=
 =?us-ascii?Q?KWjfm4C5DY+kzF+dJYjnSO8u9BoapyFx74P45c/MYtbffZSnBBE9q5IBENr+?=
 =?us-ascii?Q?yeSf/hPmCuIQ9UcWK+i9ecKw8635VscuV2JL3dEXy9ki2QAGF2lx2HJa/L+/?=
 =?us-ascii?Q?f8mFB4TpjmDUyklnYl9me78raE2QZs9SagdFx+O4x3F/xtY9UIJng1lHpOdr?=
 =?us-ascii?Q?JXtYNrO9ANOnPfnFFU5J8rze4UHXa062yyn0BoQBt8zuwLydPJ2Xl41rxvAU?=
 =?us-ascii?Q?q2odJ44OR2D5adJAzT9gG2JuQIftwxDjLFV1KjCx40a5xTIFuxSQV0OhI9nx?=
 =?us-ascii?Q?IQZKQT/sQwPtRCxyHcGSsAcG0KNsMrWkjG+t+XiWyaDOupEWuH+by0qLwmNJ?=
 =?us-ascii?Q?d0hhWN5Ylb2M05Fxbc7s+c5a/wv2+SkAljchMjveI/IVN33mvaHG33MjCCD1?=
 =?us-ascii?Q?V1hVdIIUWJ9ma24oDNAe6+WkfHLePT1Yv9RdWnZZbZV3rNPEX/2dyPCPnMey?=
 =?us-ascii?Q?nG7DigzWs5fRlfOMU3ENqNAPFPqNIChsQGgFYmIruzWS5cPPbiiXr6oianAO?=
 =?us-ascii?Q?7pR3MuiPUIDbnECQryBhcBeJMfnw8JsRPrBbV3uR6HWRu+lggi7OJZXCmZSa?=
 =?us-ascii?Q?uJpFpkp8LlfCkw57Cf7jkrp/uQaBQ+MAczrBCZ8hzdGT1Mx+jzyQ5MkpTbUk?=
 =?us-ascii?Q?nqp9eL3zJQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c656d26-7422-43c5-4be5-08da192588dd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 06:03:42.8441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wlvx8X6KQJZ00AIXn6FSCqIOC69bzdSqHmZbVduli9n9JJi3Bh1JEeG12GYBAi89ct2e7/QFArRJPu2Mi5FySw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350

On 07.04.2022 18:31, Jason Andryuk wrote:
> Hi,
>=20
> On Thu, Apr 7, 2022 at 3:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 07.04.2022 09:41, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Apr 07, 2022 at 08:11:06AM +0200, Jan Beulich wrote:
>>>> First there's a printk() which actually wrongly uses pdev in the first
>>>> place: We want to log the coordinates of the (perhaps fake) device
>>>> acted upon, which may not be pdev.
>>>>
>>>> Then it was quite pointless for eb19326a328d ("VT-d: prepare for per-
>>>> device quarantine page tables (part I)") to add a domid_t parameter to
>>>> domain_context_unmap_one(): It's only used to pass back here via
>>>> me_wifi_quirk() -> map_me_phantom_function(). Drop the parameter again=
.
>>>>
>>>> Finally there's the invocation of domain_context_mapping_one(), which
>>>> needs to be passed the correct domain ID. Avoid taking that path when
>>>> pdev is NULL and the quarantine state is what would need restoring to.
>>>> This means we can't security-support PCI devices with RMRRs (if such
>>>> exist in practice) any longer.
>>>
>>> The sentence:
>>>
>>> "This means we can't security-support PCI devices with RMRRs"
>>>
>>> Seems too broad and could lead to confusion. So I would maybe use:
>>> "legacy PCI devices" or "non PCI Express devices".
>>
>> Right. I did actually forget to either drop or edit that sentence. I've
>> now extended this to
>>
>> "This means we can't security-support non-PCI-Express devices with RMRRs
>>  (if such exist in practice) any longer; note that as of trhe 1st of the
>>  two commits referenced below assigning them to DomU-s is unsupported
>>  anyway."
>=20
> Mentioning "Express" makes the support statement clearer.  However,
> I'm not clear on what unsupported means in "assigning them to DomU-s
> is unsupported anyway".  They can't be assigned?  I'm testing with
> staging-4.16, so with XSA-400, but not this patch.  I seemingly have a
> legacy PCI device still being assigned to a domU.
>=20
> It is an 8th Gen Intel laptop with:
> 00:14.0 USB controller: Intel Corporation Cannon Point-LP USB 3.1 xHCI
> Controller (rev 30) (prog-if 30 [XHCI]).
>=20
> lspci output for 00:14.0 does *not* have capability "Express (v2)",
> but it does have an RMRR:
> (XEN) [VT-D]found ACPI_DMAR_RMRR:
> (XEN) [VT-D] endpoint: 0000:00:14.0
>=20
> It looks like it is PCI compared to 39:00.0 which does have Express (v2):
> (XEN) [VT-D]d1:PCI: map 0000:00:14.0
> (XEN) [VT-D]d1:PCIe: map 0000:39:00.0
>=20
> As I understand it, an RMRR is common with USB controllers for
> implementing legacy mouse & keyboard support.  The Cannon Point PCH is
> fairly modern, so I'd expect it to use PCI Express.  Xen seems to
> identify it as DEV_TYPE_PCI given "PCI" above.  It is an integrated
> PCI device, so it has no upstream bridge.  Maybe that is why it can
> still be assigned?  The "unsupported assignment" is a legacy PCI
> device, behind a bridge, with an RMRR?

Ah yes - the "behind a bridge" aspect does matter (but I can't
adjust the description of an already committed patch). That's both
for the respective part of the XSA-400 series as well as for the
change here.

Jan


