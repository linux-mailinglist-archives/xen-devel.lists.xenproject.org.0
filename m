Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EF43B5D66
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 13:53:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147809.272837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpox-00052Y-3F; Mon, 28 Jun 2021 11:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147809.272837; Mon, 28 Jun 2021 11:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxpox-00050i-05; Mon, 28 Jun 2021 11:52:59 +0000
Received: by outflank-mailman (input) for mailman id 147809;
 Mon, 28 Jun 2021 11:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxpow-00050Y-1O
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 11:52:58 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df311f25-970e-4456-884f-52316732ef94;
 Mon, 28 Jun 2021 11:52:57 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-EcTwmc2UPwGOd-N2Wn0rCw-1; Mon, 28 Jun 2021 13:52:54 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 11:52:53 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 11:52:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Mon, 28 Jun 2021 11:52:53 +0000
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
X-Inumbo-ID: df311f25-970e-4456-884f-52316732ef94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ZczkSMCRVUGG35vGro3rUeJaFaSvSdJdIGBjDs1ovM=;
	b=D84wx6H7QgbVPdRJTxCLlirJVwsZC7/4+VOFl/88cxickQGkFGJa3JiDF8IoNBc0OPddoD
	F+rCoDeF27NCYLCQ1d3biAp2j4sOI169LhfVU8lEhUcRfQJj8iYGxMiIHXdGWlCuxvYrVj
	7yAZhU3hKWOTmRIE0e+9agZTLIELHQQ=
X-MC-Unique: EcTwmc2UPwGOd-N2Wn0rCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hY1Y04TdxN/UBNm+8TNrafGM9yyJLGr/TYIjVTGgjYStlwGIjErvXalfXz2jatYdNBGLIia95hwhC+4L6BhAfr1QInHqveDUyy7bkBt65RfFZNILqAI2+fHrLQxQt+LDWwvVrIb0vEq3xTmtUMXpzrgbm5s+GfXbszYpdAqnrNuljy8bL7vtqgFP3CaMY8mRXF6EBRGbyeBWWeEa8hsLlkB+MtW3+HI19lkd87BAiZ+sKu0qkZ4FSkB80Lz6jDeJyrgqTja+EvsybK2kmINoxYGvQMuKTIQP/GZM3dZygNE5zitUfZAZGPdoXm1j0VSDnXBrMbxCFcAdaUTCLfgZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZczkSMCRVUGG35vGro3rUeJaFaSvSdJdIGBjDs1ovM=;
 b=nTq0S6jTU2PYi4m3uLor3sija4Ge32i3/p1Dtc8LEphZNjkMt8reuoX/JmSGIgJurNYZlcDKXEKic7uzRMvVMWOfBMdZzdzmoiqzc/lplLppv9H7HMB/Bf2ggF4VRLZ8TCpK/i1I3BmZfYPqSptFrbcpeCRYOQEhCzUb1QGXYf1dixhZOpCTvmGf5OGr21scfUMNtQaeECIoDT6cmhkO/gEoize9weoNokAMFEpmvxSg8Sm8Yv+Tz7miOiYYmlaja2lT8K0lAqXKc8klhfFwfzaxU19GeHLsvhXEgqp5OoG3Tn1A7m2Ff8q4hfPVjclHnAtF1JjCQEf1RGi4rqPS2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop a bogus SHARED_M2P() check from Dom0 building code
Message-ID: <47deb99d-3ffc-61e4-26e6-7e7ab186a79a@suse.com>
Date: Mon, 28 Jun 2021 13:52:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM9P193CA0006.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5d22c09-8593-417b-3b93-08d93a2b4357
X-MS-TrafficTypeDiagnostic: VI1PR04MB7150:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB715048B62C71BC6C43489A6BB3039@VI1PR04MB7150.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mXeq1nhun6VK4/vXQ5c5t7dmISQ8lQt9iEyvAbzUt0g05gTmFV3W/s6nPKr2pbuBN53z9+yACG+uNIJS707V0EoP63VHbSo1K+qH1hwHczKgUgDuygpI95xFOAteeKLGU2wXaptV936t/D+84SrQFYDJYBX6LyarEJ5PUsHWsqPpdskbJU7pv2HecZnIitfBG76IxBK5xmhYLqVvYjAc/zrbOPGPIEN+w6UFGvzMIN6F7rivalZl48ZJCpOY9pwEpqXYHm67i28S9siJn1PCRsnTZ8tkKKbAxOySY16BpEq4u7jGYBw55s3EshG89QGPiN0Nn0G62TWgBb8W8wdzYUSjopvwVdUlWmrvks5qclO44pz4uSQzcXMwZQYFjuaPBSkR/pmB7ssSMNoX6h/vhhmxnBnzASSLhO0jR4xS0F2OOKVxdBTG3ksCeo9bPZ2Irg/xi3hIqDKKxfRaw1cGw5NpcS/SsPI4Cjo4cNtlki/0rjlAv/MOUkXnKpvhZMxuBdYThmt9z1HhwgpV+w4sfQ4jvYlDLsE8RZtqOcGdE0pI+40oug9Nqgh7Z+jt0BzrevXwGvgAquupCnWkuxdMn9BCOFzySCcj1Tc6KxeF5FXxUtPtf6NjVNOCkBbvTEkQXl4Rmk/oorVDH7l+uGzIJZo6D8MFhAxNWaeev2xwAI5JzLEGxgXUfeKEtuibErTVEAG7I8RWS9tals4uj6/oLUse8bC9ZOR9thcn+GOg4s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(396003)(39860400002)(366004)(136003)(2906002)(36756003)(26005)(16526019)(186003)(2616005)(16576012)(66946007)(86362001)(31686004)(5660300002)(316002)(8676002)(956004)(66556008)(38100700002)(478600001)(66476007)(54906003)(31696002)(6486002)(6916009)(4744005)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBLZlZVTVdLSmxaMHRNUWJ5dTZmYWl3REVZTWErdXp0cVliS3VTWUM4THlJ?=
 =?utf-8?B?YUN1SHhtdGs3WGhHOUdaN3FGR05qeEVVY0hsNWlUZzRVSGFPQ2xQV3E3VDY4?=
 =?utf-8?B?RHB2NDJCRWtZSUc0WU5UTERuYURXSGdvVVUwLy91NmJxN1lMQmt6ZWo2cnhZ?=
 =?utf-8?B?MS9CRDMwNkVtQ2xwQnBrUlpUV00xQkdXenpBa0RMTzhsaEpjRW93SzZRVHNB?=
 =?utf-8?B?aW91NmZjRWVvZ0tqUWVYenYwc2FvdlMwR3l2U3FoMU15cFhoVkZiUXYzMUQz?=
 =?utf-8?B?QVBkVmdnZTJMcnExcFlSeE50TmRiT1JHOVQrOG1iMmpwNlFvRXZPbis2Ri9V?=
 =?utf-8?B?UW1VaHNCK3ZhZlRBUlFVVWZ6SE5MU1c4VFJtbmhTTWxFaXRsNnhtRGo3YWJM?=
 =?utf-8?B?Y0o3S1g3cktkUTFqL0lDM21FaWN4TkVGS0FTbU1YT3NsUkZ5ZGtKaStFSGd5?=
 =?utf-8?B?dUV4UVVGaThhZEJKZjdNUEExT1NzRWpYOTRaRkN2WTdlVE9xL1B1NDF5Y3NO?=
 =?utf-8?B?Z1VuNmpuNGNpTTBoQzVYNkRrRm1lVWg3K21NN3duVDBJaWtldDZsSTNwblFk?=
 =?utf-8?B?WC9udSs5dXZmTGdpMXlRZG55UG5MdHNZTGRTTkZvMDdGVVVDYmdTM0kzaExa?=
 =?utf-8?B?b1Q0dWJmK3ZFYkx5WVFWeU54TU9ZOWY3T2tTT0R2RTFmQlNFMkRjMVFxaWtU?=
 =?utf-8?B?dGF0QW4rMDlKWG1TQWpreDhpckl1cFltc3RzeXAvb09xUUJRaUw0Y0s1Q1Ni?=
 =?utf-8?B?OWlDd0xFNzBsWkZJQjVObCt3eDhPQzRCbVNVL1BkY0I2QmdyT3pFanhERm5E?=
 =?utf-8?B?c1liWjJSM0lWd05lbzJGTnJacThxR1ROM3VxbjI3Z2pCYmhJQXNKUENuRmtq?=
 =?utf-8?B?b0h6MGxzclhKakx0dzV6S1l4T2hCa1Y4OFhMMndqelN0ZHRVU2VlOTZoYUZY?=
 =?utf-8?B?NVltalFpN0cxcUFMbTU1TW9Ub1hzNkgrMmRNSFdwYzB1eVptUnRJZ1pqbEJE?=
 =?utf-8?B?NHAyTDFDUG5CTEk3VlRuNGFjT1p6bWp4YnUwNFRpaFpFamd2Z2ZBQ3ZPL3M0?=
 =?utf-8?B?U1k4MER4eC9teUdCbUQ2T2hxWDBwRXJtYVdWRit2a0ZtSE5KNGVSMlI1QUpl?=
 =?utf-8?B?N2x1U3VjTzROQ0ppU1BxRDJZS0t6dGJHRys1c2VpSGZEMzRVV3BIQXJYZ01B?=
 =?utf-8?B?Mk5ZS043TGkrT1dLZGhNT0FCL2MvMzlGT1VLN09GbkcxOExWT3dNUVliQnJG?=
 =?utf-8?B?ay9BeE9Fei8zVGlYUTZQR1VWSWcwQnlOaWNsTmhjdTBCREh1TER6ZnZpa293?=
 =?utf-8?B?bWhya2RRWnE0aTdUOUl5ekZyWFV5S3cxOC9IZjJPWEhSWmkxaXIrVzJMcGd6?=
 =?utf-8?B?bEplaFVhVkdrVUlXMXJUSXh1TWltRENtN3ExSEZiR0NPK29ubWl4KzVqTmcx?=
 =?utf-8?B?MVBoYlR4ZisrMVBWaGYrbXpnZEZnb1ZpUTZha1plUllOOXFqN3lTc1RUemE5?=
 =?utf-8?B?RCs2d2NCNnJrMXdENWUyQnYzRDQzNjBma3pTVmJTcklKRC9hcWhBL1JMcVR0?=
 =?utf-8?B?ckZ1OXhwbHYwUjdmQmN1UVdXWVgzZ2x4eTF4SXdGMGpJbjJlRHROeENVK05X?=
 =?utf-8?B?U3hleUZMNjRNdjRsYzluYlRiNG5OL0RuK0FHSUppL2xYZVZzMmpJWVJ3bXp4?=
 =?utf-8?B?K3FWSFRndlpoem5la2w5MU9Vc01vNklVWm9XVk1FVUhEMkJ3L3NleFZrR3JG?=
 =?utf-8?Q?oEBAj/rWvV6LPxH09tLmdPNjxzI8AmGU+6eZ4BZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d22c09-8593-417b-3b93-08d93a2b4357
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 11:52:53.8420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i14L1GqIwbvyTwvR2w2IQzs0WKXQp3n27GmoOCB97fMZaLVyBC/cM0mfiDXo4N3PA5Dimr6eTc1bjyQYptHy2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150

If anything, a check covering a wider range of invalid M2P entries ought
to be used (e.g. VALID_M2P()). But since everything is fully under Xen's
control at this stage, simply remove the BUG_ON().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -815,7 +815,6 @@ int __init dom0_construct_pv(struct doma
     page_list_for_each ( page, &d->page_list )
     {
         mfn = mfn_x(page_to_mfn(page));
-        BUG_ON(SHARED_M2P(get_gpfn_from_mfn(mfn)));
         if ( get_gpfn_from_mfn(mfn) >= count )
         {
             BUG_ON(compat);


