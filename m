Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C34A5C6C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 13:40:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263568.456309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsSI-0005Zc-Vb; Tue, 01 Feb 2022 12:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263568.456309; Tue, 01 Feb 2022 12:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEsSI-0005Wc-Rl; Tue, 01 Feb 2022 12:40:18 +0000
Received: by outflank-mailman (input) for mailman id 263568;
 Tue, 01 Feb 2022 12:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nEsSH-0005WW-TO
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 12:40:17 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b8205a3-835c-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 13:40:16 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-gOBB7BTpMw6VAap2u5q1vw-1; Tue, 01 Feb 2022 13:40:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5282.eurprd04.prod.outlook.com (2603:10a6:208:d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 12:40:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::7cc2:78a3:4d40:9d45%6]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 12:40:13 +0000
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
X-Inumbo-ID: 1b8205a3-835c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643719216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avYg0rdtgC1YI1RFwM+yWFrHbEPRW9jAzGZS3O0Byv0=;
	b=hcAdOti2i4x2LwobUxfemGwNKL8ompfsWgQ2dZdssttSx34Pd0XkLm99i9OHRe1h9Pm5Yw
	wVMm6tGREyTQ0DxwMMpmYUqi0tmGgsB8a3dl4Fz0Nlk4dXRZEvL0FF9EVq8gy5hJr2SpJX
	vt8LQbLJwTGHHPmWlLVnoxREY90E/ik=
X-MC-Unique: gOBB7BTpMw6VAap2u5q1vw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6/5F5XQeR7+H8Wf+53yvpNe9JZJFDYC2B5frAQTiHX+XPrrYrMWLw/ccVTuR8BQLqgknXN7Tjip5P3MeCmpEPmPkkiLDX8gtm2gPgyvrHfZrkaNKEuCoeYJ5DGFwu/GhImghvQ0u8jFJVvVZNdMX66A2fbJWieWEk1cHFNFEhdzAuH1zmlUMWw01Lt30x1BvcUal1mL2nD/Wf1n4NCFych8v4+sREZg9EkHZPlcxC+jSsJ9jKd08xoHab/suEa5gl/YooFBtBkrZByJzBKoFku/KBL2IyQ3QQ0OsXWhqyHjJrIYswkIKcYA+ygt/bJU6kysmmHv434Sk0aroGok7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDRW/Olnu5E8VPy5W3O0ZgHI1/knDGqygMIYuN6pLBw=;
 b=AC0YEK30+CjUztNhuaOWqNGJhAyWSCsYp/gpORQZmPoFp1AvbLn6brSJT39QBXPgUq27yBUV7RLVt7P7Tin3JOoksrZFU2E1YzhJ13thqxZFAseGxyOqTap87C/6JvCHj5yubyt3yIzceAipxCpbvXrpjATE8U9BpMl+slfnxPIKytC2iXAM27ZqCk2FoEH+gy8cfl1pUd/tVXY4OD0P9AoOkGf5MYzc6t9/fJBGueLzhZJWXt7r+9loR2P9+Qk/szROf7X4E91MHpQyEQmfM7lfHE9aK1Pglhz+cDwaQ/LOVb9xzi+ukVM4Hvfm/8SgeqZfeMreAvM4ktrV9jhT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52587ee4-56a3-3824-75cd-667c35e3109f@suse.com>
Date: Tue, 1 Feb 2022 13:40:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/9] x86/svm: VMEntry/Exit logic for MSR_SPEC_CTRL
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220128132927.14997-8-andrew.cooper3@citrix.com>
 <20220131153621.8863-1-andrew.cooper3@citrix.com>
 <00aa1f8a-9f2a-96f1-b088-e34c9ec76f3c@suse.com>
 <e48536c0-14c1-1d41-0a9e-4fc0f0aa9c36@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e48536c0-14c1-1d41-0a9e-4fc0f0aa9c36@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e843fa62-3481-42d7-ea99-08d9e57ffdd0
X-MS-TrafficTypeDiagnostic: AM0PR04MB5282:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5282E8477E0B2C049F43B3ABB3269@AM0PR04MB5282.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/IjDEwQExDL6bCF/nZy4eGtqKJDNPTaFcvDwy6f7p/bZVaCnzxfgAhNGmL1jeEjcVr2E3Twq7GvQUylJIcgb9ofJYBrfiu4dC4O8Lpkn6evTH0R5r5Nv7veIURqgydnBDrRFuvAQhIh9jujJOw8FzqYTrttbT39w3FaqWlee/dyVTFW80DJzs0FdCzRDFLpbdBdXXgXsmTC0baei8530Pu1pi4/sLTIXBiFxNw06g/NSYTOrp6BTFGt7TDMqItMHFIv2n8GlccSmJh8+CScTabZF/7br89joj6wTzRRwspndNgjjTcTOZIrPtqOR0U0eq8kdK9MJ3yPk8f77Bn2bOd6NXDSZ1hMfoJfOrTbst47qW7YIcYkm9AIFDqA6tErWewjvuti5Dh0D/REr4NQChRfaNJRxeF72UFsZOSZwdakr3tk0FjdBVUfVrDO1GAAeoXY2HJA//TQiNzuaXvgYnMaiTVY5vQx9itKzU6LtPu62n0KZISPPZ5MgeDLZD0V0p9XIqRGMOAxcEpu8/d4PvWOB5s/FH2RsvzVRm4IgP4IW92/h/aBylfOef/e6L8MR21p1tvQV5KXL6ecn1cAImS6iNRFRdT9qG6Tsl+Tx0p67ieMKSmO5E/LPXkM5irzk1T0bWNn+OC4CEAcNyen+oqURXH4TTyqHBjvBlaFsR3GIPdUgLsaK8fHENUabEpro5/9iVOR9cLQ/TExVb5YC19YGqeunCIArYafTEcoezctmh8JqNph2kpj59T/ycxGi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(2616005)(86362001)(31686004)(6916009)(54906003)(26005)(31696002)(36756003)(38100700002)(186003)(316002)(8676002)(66476007)(6512007)(66946007)(6486002)(4326008)(66556008)(2906002)(508600001)(5660300002)(8936002)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JNkeWcewM1hQDMlHBd0AYlhLGD5x5cvE/WrWyFRJh4Saov6bRC0+UpY1fATv?=
 =?us-ascii?Q?B6Uo7Rlgbeq3muYfq71LRDUw91ZCJX3cBUFuci851hS+rb6o5gkwTQmTyp4R?=
 =?us-ascii?Q?Yw/+OcC3ztB2MrykjptIouhYPwcdZcZxYB+ULqnOUhnTJ0BnnBoutHr3olW/?=
 =?us-ascii?Q?c/7jKJOnba2FEHhXVKE8rhqL12cpZI8ufd7jhYBfOvKNJtzPM7OnQp6XUYa+?=
 =?us-ascii?Q?uQCMJ6AJVeAMY8JD54q1OXUHR5/V6vu19evvksG3eoA6+WVdZ5blensJ7NgI?=
 =?us-ascii?Q?1OMLEthkVVwj1u8UyDW/k0Ib7WUAkaQ0+5oGtiV/Zl1vMlHA8IpG1VOWJczT?=
 =?us-ascii?Q?GXrg1C8g3VL6jK9zR86mZJWGsv31m97c94aaRsQY47LKXfEETv0qD6GHxYOL?=
 =?us-ascii?Q?xHb3JJ/E3pP3KgE2UFvystgLnDs9OIlpk0PwcxhAi2sYHf82BaovDgofOt9M?=
 =?us-ascii?Q?C2HTpD/u0ojnr36mgifZie5RzRljCGHlygActgyGTV4oD6LNeD10XMuCJiec?=
 =?us-ascii?Q?qG7RE97vFsVoKFBN76ebBVQI/KyIK11FClNNzzxe9adlCE7QP5IQP1CfJWgA?=
 =?us-ascii?Q?c7VmGDa6+lKfgan86WbF6EO605QnJjkdYO5kr5+09+u6Fk19ww8NRyXwtlLA?=
 =?us-ascii?Q?HXSXzeHllPdlJ/fA5ltf5wf7OvJbu+VJqM6QFPcnlcS3c9mHczzoztwe3AgY?=
 =?us-ascii?Q?Xrmp+x4jKd1ATeVws/0z76pn+r/UeJl+ftPDXn40rmjfNcTd6Cljpg7R6MYq?=
 =?us-ascii?Q?v8/sFSloCvattUNSg8FWGzOl31IkSO46cToZrrNV2YONzxBLTIIYvHPutYdV?=
 =?us-ascii?Q?hDqBJrY1wp4juKRtDMjc+CRkO3fSMFlzn8G0XI2WtGIDKmM4WdGZZJaj9rg5?=
 =?us-ascii?Q?I5VB1/RoHIRuLnGxnG6xN/5cRFPqxAfUG0OXBWTCeHRH3Q0DBiKcIfEi6Xcv?=
 =?us-ascii?Q?0rta9y3jDplYjrbnlrd+T6raDzPV8zAm96RpwUNK9PdnRf+qkwgCYmBtFPDi?=
 =?us-ascii?Q?6TJqmobW60Yz6yBGKVON7Baqd264wOgKFRXRrfPW9w+mFhKLm8lYX63HxZet?=
 =?us-ascii?Q?MRf4T6OjNl7qiLw5np7h3xgGcPYCerEgw+JWPnOigoQVrzUaZdKPyRUa6gND?=
 =?us-ascii?Q?mc7TRsiI2IESeKRcCzA8yejw9MxEbJ/2zw4Su7J7WP7++KetuSSrx+abJSCf?=
 =?us-ascii?Q?cVCoOjG8Y1kwio4pnLDrqt2gbow7VxVgpORLhKd269gJ44PghVf9HaUe4UjK?=
 =?us-ascii?Q?o1Zmx1LZVprSAm0Y+ip8NcZJIdGKppXpYH+Ke96gvMASpD0jN+1X+ljvrfRp?=
 =?us-ascii?Q?hCgEOPtudijfr+LDfc0chgnj22hTpswKxG6fSl/yrT5osqEfy93ScaJRWiv2?=
 =?us-ascii?Q?ORY5StPjRpe0NMC2Pzwz6b5ByhQrVQNGpEj9W36iz8zbedSW8kmdrWv2wm5d?=
 =?us-ascii?Q?uTKNhEBTwcIEdPjuwF+0RaacdebHM+BvwlqfC6ixdDrzoKX7y/9MIDTxrMBL?=
 =?us-ascii?Q?mdZo7U6kbX4e8r/URwhHvwySjXUJvZqUXFLiWFdrOgy1douvD6GLeO+MeieJ?=
 =?us-ascii?Q?gYbDZdBYSGfo+nSqi8F5A3H8phUv4AeHz8gnZNAweNxNnVp9WEhLr9b/A4Bo?=
 =?us-ascii?Q?6Z+GVEkn79iPnAqAGJBzLt0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e843fa62-3481-42d7-ea99-08d9e57ffdd0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 12:40:13.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dXT1onaHD+1MEQBDwRUhPV72On1XnS+eLY/8qY9Ut04gFn0Bl1l6KYUpJu2is9oxp9d+wj9ytD/8ExEmdMTyOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5282

On 01.02.2022 13:28, Andrew Cooper wrote:
> On 01/02/2022 11:47, Jan Beulich wrote:
>> On 31.01.2022 16:36, Andrew Cooper wrote:
>>> Hardware maintains both host and guest versions of MSR_SPEC_CTRL, but g=
uests
>>> run with the logical OR of both values.  Therefore, in principle we wan=
t to
>>> clear Xen's value before entering the guest.  However, for migration
>>> compatibility,
>> I think you've explained this to me before, but I can't seem to put
>> all of it together already now. Could expand on how a non-zero value
>> behind a guest's back can help with migration compatibility? At the
>> first glance I would be inclined to say only what the guest actually
>> gets to see and use can affect its migration.
>=20
> For VMs which see VIRT_SPEC_CTRL (compatibility with Fam15 thru Zen1),
> writes of VIRT_SPEC_CTRL.SSBD (probably) need to use
> SSBD-behind-the-guest's back.=C2=A0 I say probably, because I think this =
is
> the least bad implementation option, but until we have working support,
> it's still a guess.

So this is future work (and mentioning just this in the description
would be enough to address my comment), but ...

> For the ultra paranoid, a VM migrating in which can't see PSFD (e.g. for
> compatibility with Zen2) should have PSFD set behind it's back.

... this is something we should be doing right away then?

Jan


