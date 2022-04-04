Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389C4F1648
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 15:42:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298357.508240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMyG-0001Hh-HI; Mon, 04 Apr 2022 13:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298357.508240; Mon, 04 Apr 2022 13:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbMyG-0001F5-DN; Mon, 04 Apr 2022 13:42:16 +0000
Received: by outflank-mailman (input) for mailman id 298357;
 Mon, 04 Apr 2022 13:42:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwhO=UO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nbMyE-0001Ez-TJ
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 13:42:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffb9d007-b41c-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 15:41:59 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-44uasHtQMVuJ5gjSiUW2Fw-2; Mon, 04 Apr 2022 15:42:12 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM5PR04MB3186.eurprd04.prod.outlook.com (2603:10a6:206:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:42:11 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:42:11 +0000
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
X-Inumbo-ID: ffb9d007-b41c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649079732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5soGIV/sjJ+W686H/BmlYPnlzwiAAsdQ1yMeMkMv53Y=;
	b=TKaSrAJoZQt6T0SP+cTIYEVnORfwRkA2RPjv5f0rWB19NwG2ShIgWyMh2yd6KunpHRaPn4
	7EIgR4TV0BoOoDULgxpI+fyL+lXc03n+ZCxL/MvY97S7dJ8uIBKDwVmaWGr+d+PvH7fFjl
	aL5YbqDewBvVYQTHaJMxi7PxPGyWfmk=
X-MC-Unique: 44uasHtQMVuJ5gjSiUW2Fw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9KlpEmUmPd4HHJ6dqCuGTLXi2nliG36T1WQ5+6xMhcyngMtdn7HMwJBx/6do46w6Ef+YfI8kjGrbJ8T7dWMk8C3XRzmJ4zDHy5bJ+tZqKOrZyJ1mDNZphBVjLUFvYEjwdwPfDhwAkp4op+MzbkCHbMhR0MvuIeUWMWlod+iI9ESlD9NdJMdJiYPUXvzqpNtndAYIfWnJPJPgzg9Prxg9UVm0I8D//KGhRV2krprzNcqgZe+Jg5pWLHJ5bscCXk/iLL7mhE0DrOvXHd07ki14bCAsGit1+06MNu6XfALj7GJuqpGibxxtEHWMF++C3Ebke34oZ1b3qugBKMN1xeMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHoIdCEpO+jBYTPDkxu6odsSF2r1CJ9hPDTpPVF7tyI=;
 b=dMHB/+op0PloOLRQWq/fOIMlDQ+Zoa15Y/fyBXElWXYXegC4EtiYx/abUo6HrDoGHhJoi13kW1KoFyKts0PSmKzhpZcNJV79Q2mjv8XWyg0y8Qx71r3+FKL5450dUPFiqvA0t+zU5MFnHceWucZJxTt/g4JJUjNA64h1Y/GJciaDSk7yK6c1ub1CqUx8TUKPigEyPRuzhMIQhonnTV5LVAcKKAlQGBtYhDuaCqU02/DMNfqqJNT472ilJCtfJWx+u1U0Z9ixF3/XdIxz6I6JV81hfmxH3gDC1m5adaf6LgUrp4lArGva0qP9TMd0391WoBte48hzkQoksKiQCiPWhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d2bf04d9-53e1-6658-a1d7-ca61bae01141@suse.com>
Date: Mon, 4 Apr 2022 15:42:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: preparations for 4.14.5 ?
Content-Language: en-US
To: Anthony Perard <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>
 <YkcCMg8+dDjxBvJW@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YkcCMg8+dDjxBvJW@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0014.eurprd04.prod.outlook.com
 (2603:10a6:20b:310::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f1b73bf-c793-478d-9182-08da1640eb59
X-MS-TrafficTypeDiagnostic: AM5PR04MB3186:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB31868C4A4F0C73F2D7427EA3B3E59@AM5PR04MB3186.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RdEdmQxwJWyjnCz1e2l52hjCnOPK3h5dAA/D8y+CNJQIQVOZbp7BFm9X/BoQZ520EuRvJtvFRuLzDeRG4nBO2heq3UUozUwB/eEeg3aVrCAPWmTxCGWlPHqnXu3iZ++u2qqTJXSwQP42nwt+KeqCDNt3LhpMiqYiuR1Dog0EApAVKm4dI5nnL0uf9gocrg3zd8xnmU8sYlbVQPPZvHQRXwFiTBfzNJ367v/j1rrp1jp4YFGjzgZOGhTng5hz0/Xcb3hEtOJrqfclvzc04OXyP3Ewb1iDBdTKHqQ6k4bwb59WvRNm2FhRDNAVgcgXGzCqbXlPm3rZizYrI0khNKyZAoQ6n8Gg1vDHdRJc9siP3XSC/CnMhoCDBZJ3XshR99Uj+UZdag6vhjiB66oTK7cUTRh1m5NZone+M33GVc0/nEyRf4cu8p/gH3xyxyfEfW9IbWIJyfTDKv2h3n/pkvu/ueTUyth/7ewrW4xt0W6HJTq+GAAJps6pTEPumZ0n3zEUmZiKl35tsNSD1Uj+iNLNopC8YxOYwZ1Cc6tZdspc4hSFy9s/RV1UgZdoyEJqM1F4erYGH+iUITXTdUp1WUcMjffOaBuhr8WG/oDTGTBPOj6y5ZXx5Ju01li9eHqJiW7GOsXN50Z4qqWcRk+PxpNBglpmcP3PpIM8AFYnclGQJXWhiu5nLzP5LR3KaDMy2BO69NPBEKCylZzMGr0kOA6cZsUmy2O7gX0d+Na32T2m/XQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6916009)(2906002)(6486002)(26005)(31696002)(8676002)(316002)(4326008)(83380400001)(38100700002)(7116003)(8936002)(5660300002)(2616005)(31686004)(66946007)(66476007)(36756003)(66556008)(6506007)(6512007)(86362001)(186003)(53546011)(508600001)(66574015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FtHBo5PbMJpDf1awVqra1dJlWaibPa9HPnArcHjIVHXjwjURxQYAwfXHNu9+?=
 =?us-ascii?Q?REmgMRr4sn74u6eMFzG3/B/LeE6o5JB2K8URBukqgGc4xuVMOmcxKsH2Tmgi?=
 =?us-ascii?Q?uyAAit/atkbhty9/iWNj3hNXt3ygUFp1INo4nQoHVpDhT7DllNk79yWeRZ3Z?=
 =?us-ascii?Q?j2n5+46JKnZFdTh7u3ItYpI1yJCptnar6uAFZ0XtNYYg83vCAAHNj8Y7o4Gv?=
 =?us-ascii?Q?ph47gm/BmfPnyjj/t/SVfP8qaJM5SHJlU0bYTmyO0pfsPlzhkBpNhH80/v23?=
 =?us-ascii?Q?pBmB+9uabZg43JBjX05WG93zuJoXsgbPUuuTxaKdaJwaUBw5HZYsUFoNfwZJ?=
 =?us-ascii?Q?tTjXt0KYEN37BJYVM9k3KHSnnQNdEuJR81kX014uV11omb1dC4b+t7d5pa32?=
 =?us-ascii?Q?biacHJ7r3L0EsLnnCyzfyQPwXZ89+Sg6XP2m8Irm3ZBgP2hi1ZClUDqNol4m?=
 =?us-ascii?Q?lzISyom1DJ6Xza/RHLqWuoTV816MWvTknZ6jedvCj31LF3gQ8qXSr+jQOLXp?=
 =?us-ascii?Q?Od+WAuFoN692ZvEHnDjRjUOzrsvwEzRH5A5UKP25+O6Jmfx3qSVu1wYOyLOO?=
 =?us-ascii?Q?DTLw3Ij3vLnHq0CphhRN7XVgGFjTMJo0KO1rcq9eQZNfI8i1Sdk4ixTZhxkD?=
 =?us-ascii?Q?5l/qqSOjIPPNb1fF3Ko81OG13LkUwpeGErNOTt/dhNv65fW5coP0CxUoZvh3?=
 =?us-ascii?Q?bhIEUiqhGRXbuQ1GSzcAOCIn64iAU/9p7LOdlvgnw4ipLr2OZcg4NHdcmPF/?=
 =?us-ascii?Q?VR1EKD3QW1cV8vJWCfwcpA2eNPn2Jq3e5uC6P11BqsZ3mYC3U4WaMY4ckGrM?=
 =?us-ascii?Q?WBcG7eRrlB1urmIYkLIf6F/q/9n97BDIkWHDn261gjru4j5a4V9QVuR24KTi?=
 =?us-ascii?Q?VKClOlq7Rq5+Ea8F3xmugyrloj1g/ILkDbBBDy/Ly04hlF4YXAt4oGcTY7EP?=
 =?us-ascii?Q?etwgz6PIPIJ8+nr1CmQiaTDvhSy5FxhWvqROfqyUn/Xd943/vixQXfNpcclD?=
 =?us-ascii?Q?VTjFTYxXvNH3FrAEqnMSZwXY53Vud+BD0CPE5tiJBrjX58Vcj2FmLOHcsIAN?=
 =?us-ascii?Q?zcGgK71aVXqj7fTY3snoOVPNg4RlxXPQsICdacoAOgRKSHSZkeLWlPj3Cu2I?=
 =?us-ascii?Q?AOnwPq5J1A3LusApSVFslGVIzSw/BoDhHjVhX5qlNRoLc18zHbYpGzHTQjvb?=
 =?us-ascii?Q?5jGNCpL8edZAGZNbIbsCsgM3LoB0gX5VHDHfsFnUPvEBAL7wvUIu3mODPdzg?=
 =?us-ascii?Q?kxvwQIx/+O684vaXh7RLXHGMu+N8BxWKf4AU6psbpbLI7AUWQmpYCuF2Rq5p?=
 =?us-ascii?Q?w8kHQz3EcGKoT6NlV47nKOewQR82foc8I/XhASXQdiW3yzMKfmriETMfxVlj?=
 =?us-ascii?Q?IZx4MHMWJn1dGVCn9Du9TDMAQcAuVrXEWPW1j2euR33J/HQ+akRDTfs2tU7f?=
 =?us-ascii?Q?Oogtk1mwaRBB4Q+UkWOTMYrBpvXrVPeo3Mm8S+HFCKG6L9vnki9selqyd3MI?=
 =?us-ascii?Q?skmdSM9E90LlKSiMZv90eIvFueSV3Arc33L+rlbNUneiMRl4VrUDlLjP6Fas?=
 =?us-ascii?Q?atcB6/3obm2UO2JE8j55fFNF+/jn7+6kP5ZBLEyhPnF2Q321ZD8fX9S2JXLq?=
 =?us-ascii?Q?xDahJOrbcBF3xJc0VhPxMV3SSp+xtEvxTO7IZLqIeUVbpYmAyDoX0vK28Jwr?=
 =?us-ascii?Q?SPglxmjiK/bToM5RlqbJ1LIvATAakLImzAXsGF7a05yBO3z20+N0R1crzjWo?=
 =?us-ascii?Q?ukzlmDdXIQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1b73bf-c793-478d-9182-08da1640eb59
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:42:10.9985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2oH9NikkuBA/+nCx3dlU51f4VJtwMdc4Rkimf+SsFMbEv1xFEYKtZy1ARcmfqc4rfCS7C2GAAXcsEeCtQxS7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3186

On 01.04.2022 15:46, Marek Marczykowski-G=C3=B3recki wrote:
> On Wed, Mar 30, 2022 at 12:16:00PM +0200, Jan Beulich wrote:
>> All,
>>
>> while 4.14's general support period ended in January, we're considering
>> to cut an out-of-band release due to the relatively large number of
>> security relevant backports which has accumulated in just 2 months. By
>> doing this we would _not_ be promising to do so again in the future.
>> Please voice objections to the plan (or support for it) in the next
>> couple of days.
>>
>> Since it's a little easier to "batch" releases, I would intend to keep
>> 4.14.5 aligned with 4.16.1.
>>
>> Commits I have queued but not committed to the branch yet (and I won't
>> until in a couple of days time, to allow for objections to the plan to
>> be raised):
>>
>> dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
>> aa390d513a67 build: fix exported variable name CFLAGS_stack_boundary
>> e62cc29f9b6c tools/libs: Fix build dependencies
>> eddf13b5e940 x86emul: fix VPBLENDMW with mask and memory operand
>> 6bd1b4d35c05 x86/console: process softirqs between warning prints
>> 07449ecfa425 tools/libxl: don't allow IOMMU usage with PoD
>> 10454f381f91 xz: avoid overlapping memcpy() with invalid input with in-p=
lace decompression
>> 0a21660515c2 xz: validate the value before assigning it to an enum varia=
ble
>> b4f211606011 vpci/msix: fix PBA accesses
>>
>> Please point out backports you find missing from both the respective
>> staging branch and the list above, but which you consider relevant.
>=20
> I'm not sure if "just" bugfix qualify for 4.14 at this point, but if so,
> I'd propose:
> 0a20a53df158 tools/libs/light: set video_mem for PVH guests
>=20
> In any case, the above should be backported to 4.15 and 4.16.

Hmm, Anthony, I'd like to ask for your view here: This looks more
like a cosmetic change to me at the first glance. Plus it's a
little odd to see it being proposed for backporting now, when it's
already almost 4 months old and hence could have gone into 4.15.2
and 4.14.4 if it was important.

Jan


