Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BC45575C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:52:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227205.392894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnd9E-00075x-LQ; Thu, 18 Nov 2021 08:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227205.392894; Thu, 18 Nov 2021 08:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnd9E-00073L-Hj; Thu, 18 Nov 2021 08:52:00 +0000
Received: by outflank-mailman (input) for mailman id 227205;
 Thu, 18 Nov 2021 08:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mnd9C-00073F-C0
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:51:58 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ee5047-484c-11ec-9787-a32c541c8605;
 Thu, 18 Nov 2021 09:51:57 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-Sjg6FybWPRK9RS8H9QDf4Q-1; Thu, 18 Nov 2021 09:51:55 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5168.eurprd04.prod.outlook.com (2603:10a6:803:56::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 08:51:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 08:51:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P195CA0001.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 08:51:53 +0000
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
X-Inumbo-ID: c8ee5047-484c-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637225516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQX5CLDzlmQSnFZt5g8zkeAIoHqPfiG2F+Fiy0jggLg=;
	b=jqT1CEaBtIh6HQwcP6Ao5Ot/n2bKh+/mcneJVsL2Q7XeGO4dgVaQ01rWI+VvTXr8uMub3t
	KF9rroptPOst7hXvTud9VIYGNM1RCS5d7CC2mMfYDAuQ3aHPfRsuXx/dKIKzYb1vOalyab
	S4ps9BTOypVi6iv2hd+KXLw3S+Bor7I=
X-MC-Unique: Sjg6FybWPRK9RS8H9QDf4Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/bA7djiPnPxd5nxqf3faGe+Gxq8CeWSzr44+Dali7avGX54H1Kg0bDyz3yqo69q5bQm/d5nQ3iGrp6nCedIU1s0WbovSokymJwx+7Mo2DAM/0tdUhtfnWvHJsHDSPf7WOY8KgJp27GusvLgJ8VU/RJiGL5B+xMUCiDllz1bWaM6OvJrP1/feH2RI8LYxKnYu1D0kgz8VfE235VoH47dPHqF1JJ6FbfDdKBDuKGLO50ddZyhMR7OGq+JZ3F+LPQW3ORgNWcIUe+7HmKQEg4nSfiS8CKx+xRHnBv7kMrHojUh5v5VpdClKmKrh7WQtGwfeIOyhwJEztxdpiTBUmkwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2bIi7qqVnbtprCFd8P/L6h6IbLumUmEouKCpGEjL+g=;
 b=jpnJc2dWjkbEYSd825/8oudT1mKDQBO1PzHOPlNyqyOw0fYoPJL3pDlItYhQWWevrl7NkNojiN3Zn1RhiuEiR7SzJIAvVcYWH/dQBS58XoeAaE7/A0arIE0sQukmce4V4DCO2nYddjB0tJoQyfx9lE3ajDDEYgcFWLTIUqiSw7nwfN8NvDuwbCmjC/tMOeJUfVVuQAGylCAtTrtneP6Yleaoo/S7nJ9qPkvOMDldL1AKpSky1fTSN4zpkWt6bWCkBRdkuq893E9aSovSQ/TMTiOg3DrREc/3lEfQFKdr58AtC4BTCjgbC9KVMNXQTE2uFw+MmP5PA99kdyHcswWLow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <def0133b-9eb2-44cd-33c3-39c9d0dca9f4@suse.com>
Date: Thu, 18 Nov 2021 09:51:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] x86/passthrough: Fix hvm_gsi_eoi() build with
 GCC 12
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211027200713.22625-1-andrew.cooper3@citrix.com>
 <77acd9ab-1bf0-cc02-3865-bf9844b3eae2@suse.com>
 <24962.46376.136195.463274@mariner.uk.xensource.com>
 <1950ed44-5b0f-bdad-75f9-b91c66d95fdd@suse.com>
 <67d7cf93-2860-f8f1-9de7-932da7f537e0@citrix.com>
 <2051641d-17f4-07ee-9db2-0234e6ce4c70@suse.com>
 <YZYP3BpugHwOhNuV@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YZYP3BpugHwOhNuV@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8c89ace-8f07-475b-a8fe-08d9aa70ab30
X-MS-TrafficTypeDiagnostic: VI1PR04MB5168:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5168F3F698E1C9B74EAFDC24B39B9@VI1PR04MB5168.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y7I7mzlkqfvgFbfhzJwAh25gtK0OCs6q7/NLJA8lO586k/AoEX9c/O5jZaU93VkSwsX6C1rzdjnlSw5Mv6IazNrd0Jis9YsNO7xAetTtiud5zaIoEbIKYNed8ApK/nIlqud4s/vxLasgBo9pxlSp0isjUAjwSQRxqcwGYJbMnrvAsL4ApEIttkeb8uMasPahTcLCi0Mu2mGGwd24dcIHKu9n+IDXbF5M7cLAk4YzgXXUfJN49bVf3hKBmMjIEticm2KN+yDf7X9WHvBEyZHRaVd81x4bXZrtAHiFkY+kKZarA4BDo4cmQVDSTwyTYZ4lZaHNO24p4WdNC8mo3VWPTzuvBAXmLEsv+kBMH28rNF3wuzkd1xSQnYB8KgKNZrGao0yO9/brp5pAu1y65Pf5JUO9D1S9JcOwp6UNbV4T0dSCib4HJZKyD5jlkR7K+BDftpji/0aAF5MnP9ZO4bXM8yW4/xNfSrbmRV9FJrj+mLYWKyGfC9oFIV09fo+2GZbiIrjFAQf6z0NiLm+mdGjt+06a3g3ulCVmGkl42MVk4mQiz0Wj1NA9FPlloqm9oo0lSWKfldSRbGIBbodKq8UEXGRIflFmWQ56sQJZNElCit7eV1bY5k2JbEKEEdmPp7H1u6JoYwJW7l+PK36ER7giSyPWO4YVsFBOAz/hxPiGh8PnaJauuyKLCIOLzIcwqfG84ybxkvCSihV3lUXLVP0ohUXmAxRnlrW17yk6AIJ8gNPiZBEGiuULyrVfmW614IftKQGnU7AkDH22IqOmo4LIRxw7jstEwuazM2YDlOwGtH5DGDTHqNh49+oYUJqYdpboCbIx3aSYYoIdqRfjEAekYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(956004)(16576012)(508600001)(2906002)(31686004)(66556008)(186003)(66476007)(6486002)(2616005)(53546011)(26005)(54906003)(38100700002)(8676002)(31696002)(5660300002)(4326008)(8936002)(966005)(66946007)(316002)(6916009)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DRDaBAULzr/63tmzqEzOd/FLTyNw+IGMViDKCL9xApUSRli6JEWLm+HCeBet?=
 =?us-ascii?Q?YQ6Vpjx3e8gH82RFo3j6X06Ng2b6SwqhcE828qJFvah/eP55jIY+MRDjbshY?=
 =?us-ascii?Q?p3VJm25G/aBrigqOPlZkF/t1Zrh+744m3F68IWurdW4cywCCfRbWYfpfErJw?=
 =?us-ascii?Q?h9qICAYhvWaw/6W612LUmFZs5pcHgHFscwa2oI2gvxFyElX061XFwDEO8Sv9?=
 =?us-ascii?Q?Vjbcz1w2xBR+KSvTQhkThDkazTKiLP8hOfX1BlY1McbecfSRwzU/Cr/L7lzt?=
 =?us-ascii?Q?pPuwR2x8RfawWPj+mqhcOsfOPlsGFJG/WsMsUk/CPKaxA9DOYul/+MDFiRXd?=
 =?us-ascii?Q?hb7MCze6ymwNN8CNF8ctVRzeHs52lJDLSJIaPM3n9FaMmlhMsrk/2BmDWVza?=
 =?us-ascii?Q?qrd0lIrCSiYj810iiONQ+9+X3YyvYzuNBS46gpelcx061FYLLMar8I2RrO8h?=
 =?us-ascii?Q?hoRDn7SiZVTcqRa126zEhnImCWVyXIwSzpdVbmPA38ylqLyxrHJuxFQzRR8t?=
 =?us-ascii?Q?rm03/qP5hhXbpO4V66GodYOhZyTiIzw35K2CgFc4z7piOvRfYpBTnCxWhrlF?=
 =?us-ascii?Q?vLcreDreptWm3ofN5KnuyS/TBTMlLZKAtoXE0+sgsdVFaGxOYWFVWvUXBXgV?=
 =?us-ascii?Q?pY7pHhBwcB9jiYxp2Fq3pstcRNJdm2lwiRhAny/s9kUJBJO2qqurCzKVdGBN?=
 =?us-ascii?Q?PPpxcmP7Oylc6bNAMarnTNwjnHrlLbGfyHWG/zOA+/95ir0yNZCZksnmlcOR?=
 =?us-ascii?Q?bvkXvY9UwP7cK2DlAWVOzQED+IlLB9/Fuz1SD35cI+tMDESVX/rdqKb1AUHA?=
 =?us-ascii?Q?9xYsGzCaM7EQ9nduy70t/Ryn+sFmzVIbZqFP/5tC9jKg4XBuII6rF2ViU42B?=
 =?us-ascii?Q?gyWKo3Y20m9lfiCn+qi4j0YOaoOBBSUOOULwsisk1vRTV0b6/jBtCqrJ337A?=
 =?us-ascii?Q?nK2Ir+bJluruc8kMR9ZfdOznJdJYyPh7w4hYbtw5lIyaraNZ1x5xmb0xTerK?=
 =?us-ascii?Q?L1Q6br/3e0dCwVN765whwkEfeltC4yOkkzGalntCVPLVyFD/IJDzbdQknR3A?=
 =?us-ascii?Q?olDZl/cT1esVFSFcuCWRJ2Rv6M3op5aD4/bx/bNcKEGQJi7bB5w8VmysEB10?=
 =?us-ascii?Q?8ndz02tvmMlfsjbr3XjmLnW7aAiP0k3jkGr4AGo6rm4xYeFekD1anYwtliGP?=
 =?us-ascii?Q?wVEnqxDFz413fEVBFNr85qwDHwtECuTNDQR92tsZRtRpGH2KoweOH/ZX9y5u?=
 =?us-ascii?Q?58keHTHzlEsYIpbiGdT8sj0dvj5H5wwxHDrEbJHuP2SrHyy40Lu1kgiTnglx?=
 =?us-ascii?Q?k0kksnnnMAMBBehe8nLAeFldD4OZo2EC3e7LR+jEKf02rQuZulbyNLsyLWns?=
 =?us-ascii?Q?O4KcbHRau6jtYGe4IJZZi2Aju3d10Dwuuvj+5VNCoGQf200PHG5IUwuClYR9?=
 =?us-ascii?Q?q/RGGBfgksbagez/wJTXkHujGqmWzVk1ge5llmPh3T4p7qrBwM8W1gV/gc1d?=
 =?us-ascii?Q?zF2MS0O5dIRpanDO2tcI/yWXAkk8k3INFPJWdZxbJU4cm2sJNSKaSjkSM6bX?=
 =?us-ascii?Q?bZVwM+KdNlwgeUJ/Ni0HDeOCpZg+OjoZxrhN+mgD+Xo0YZ1VagWif1UiEDQL?=
 =?us-ascii?Q?2kSpgkwL9Q04J1h8SkVV66w=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c89ace-8f07-475b-a8fe-08d9aa70ab30
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:51:53.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbUfLfjQHZB1vofL6ovzxlusrbaTqpltJ5gcgdXboHfX0oBJ3qNSWYtWdjMHrpUgfQZ2pBpOW8KAVJlw44eccg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5168

On 18.11.2021 09:33, Roger Pau Monn=C3=A9 wrote:
> On Thu, Nov 04, 2021 at 01:17:53PM +0100, Jan Beulich wrote:
>> On 04.11.2021 11:48, Andrew Cooper wrote:
>>> If your answer is "well actually, we didn't mean to say 'if a GSI is
>>> mapped' in the comment, and here's a different predicate which actually
>>> inspects the state of a dpci object for validity", then fine -=C2=A0 th=
at
>>> will shut the compiler up because you're no longer checking for the
>>> NULLness of a pointer to a sub-object of a non-NULL pointer, but that's
>>> a bugfix which needs backporting several releases too.
>>>
>>> The current logic is not correct, and does not become correct by trying
>>> pass blame to the compiler.
>>
>> I have yet to understand in which way you deem the current logic to not
>> be correct. I'm sorry for being dense.
>>
>>> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D102967 is the GCC bug, b=
ut
>>> the result of it was them persuading me that the diagnostic was
>>> legitimate, even if currently expressed badly.=C2=A0 They've agreed to =
fix
>>> how it is expressed, but I doubt you'll persuade them that the trigger
>>> for the diagnostic in the first place was wrong.
>>
>> Well, thanks for the pointer in any event. I've commented there as well.
>=20
> Did we get any resolution out of this?

I don't think we did. I'm still struggling to understand Andrew's way
of thinking.

> It would be good IMO if we could build out of the box with GCC 12
> instead of having to backport fixes later on.

I guess gcc12 is too far from getting released that there could be any
guarantee for no further issues to get exposed by that point. It has
also been common for us to backport fixes and workarounds when new
compiler versions appear.

I could agree to being proactive if the change to make to our code was
uncontroversial.

Jan


