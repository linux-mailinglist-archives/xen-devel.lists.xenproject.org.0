Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729455B81E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 09:14:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356268.584390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iwR-0004Pg-Ev; Mon, 27 Jun 2022 07:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356268.584390; Mon, 27 Jun 2022 07:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iwR-0004Nt-C8; Mon, 27 Jun 2022 07:13:51 +0000
Received: by outflank-mailman (input) for mailman id 356268;
 Mon, 27 Jun 2022 07:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o5iwQ-0004Nn-Q3
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 07:13:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b10cee43-f5e8-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 09:13:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6578.eurprd04.prod.outlook.com (2603:10a6:208:16e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Mon, 27 Jun
 2022 07:13:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 07:13:48 +0000
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
X-Inumbo-ID: b10cee43-f5e8-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYGSJIAXcSaAlI9KoMsMOep03QEz14s8kGnHvBeDIwykhpaw7WlLpO4sa6hPTwGRbeaDHTXHUpDj6rQi49Eof91r46cdIFv58ixE1PAxXmmJwtC2SrP334d1pTck9jL9jjj5bxCLPY6jV9x8Fu2DK144gfXHmVZVzB9S6C8iZ64R/7RwX2NP9IzySjTHtkKof7E7kQD+UwqPX09ddlOF5K6hJ/TOD2n/UCuc75LaLcyaElJhlOs5K+k0j+ciqbdUmQsGm0N+6xIWAcdX0DZQyuV8a3bZGlPILXLOsjQNzkCW29+2J5ZR/Lp4+/8mpcP3sm/VbcwoVRzacNFVCYf3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3BhsXnHvkKjEXDwDNzitNlTtgOH9H5PPi2BSZcYUiQY=;
 b=EG98RZXkYKE83+s058t3I3KV20U0RgG9IPDm9WHYO3Bd61CDRI1qsuvdJdCAbVMAOOjPJKtqejlhr60ZzFWXjCFi03Wz7WwiKC70Oj4kpmZMxF3M5PLims/f78Z41c9uHj4/6eqFfmYXfQ8b9HHPtS/12hjFloLWzKmvdmm2jt8p1PiqC7TwbvFSHGryPW5VMFMVKEVMn96B9OvecpAxBwKgjcFwP4kx6GHPj3CaiVCQGBmDAUHf/xHPrjSvqAHWT66xvxEJdLqr3bSNEFAXSEwRq4MPqSTGXu2vY8ta1GNDtUuZMNWvGyPy3uuXqMhtFI2bW/ftMWZuZXXt74JRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3BhsXnHvkKjEXDwDNzitNlTtgOH9H5PPi2BSZcYUiQY=;
 b=mFZ3XNQ5TdTDSAsZWEVrO3cyCiYflOti+cn2dLKxzGB+FEHWBD2RVqTp18FuV5yJTjpXGD5aWolJUQJe3r9BBsHzc1ffoHXa2++KzG/u1XgBEEWSvG/1L31D6wcUIGxkc5+R8HzRhRF1YcZWQ6Si/HUTkRJ+zP3bNmYmbUozo8c/h4OkWGLiqnQnL0GsfBCWAsBt98d5nboOZTNNKhAaTqjE5aQRmdfu3WrgJU+md55awDDhaZIteJ/+TL95Yu5VFHvS3QgyIrEXH1xqUkRzsem1f3NGn59nYTjFNIVGoDMNbbsQJyo0SeqgJUCv4HmrWZH+wG/PUEb6EXrInd0MAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fa2bbcd8-ee27-c9b5-5428-ea07bf9a4734@suse.com>
Date: Mon, 27 Jun 2022 09:13:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] xen/sched: credit: Fix MISRA C 2012 Rule 8.7
 violation
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20220626211131.678995-1-burzalodowa@gmail.com>
 <20220626211131.678995-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220626211131.678995-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2c226ec-49c3-449d-9a68-08da580c9478
X-MS-TrafficTypeDiagnostic: AM0PR04MB6578:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z6vn7ZBCpffPgtDNf8v0owT7okVQNgTvcP473zKkd73tC3Z03WMnYGBKLwED7JN8ex6lR4mWwlFBV8tZUYwmv74mYi3g9IZHnP3lsUAJNYSUCaBbPa5mDIgozyZyCNrrxQdZtCK7HTvvueVYUHrBD1vgiVcyj3FTP33C4eWgDxQ8G/ZMh2aaVvSup94oxrdBj3z+Ag5DIT42HQtCJphnlACGIAGa0QuuCquWjEJOeuivH0F+s6rHxhLTHRu91m2Wd0rKKnOAkrHBbLnIkvXXs9wz5Xy8GN6od9gjfril49biABfopYB45kypsGsEWQCn3TDXvXh4Lq6vagoaQNQSeislBwMRTo/b9Cg4ZPMzzvY840pjhilHV7xX5qosyf3kVfs9RvBjxMI0g7I9VcSeXKWpqcUCWrTXkEyBqHG36VtmWShve/lQhrltgW0OXFaaXkoBcjfoIh6CLDXSf0D6Y32SdVkq7c0SHw+09t4ZViDH/bGPhC9r+jMML2qfBX8eO78jOKSAjeZfNWhxQDC51AD8GTWoEP895sxOVYtqbnaIAIN+0IuqsVZ7c7r/rjEVVQdEVDayYFcDxpFDI2ERNc1opxx8rykGzZmhL6HTZqjBnNTsdZbPHA6FM6WdQc5Kw8sGtSb5kGdEFbCruo8U3fZKGXucbSfMz7lhccGZmOuFp0e1Yy3VQhqAPNZL88LY+gjY3KyVOq84iOLs6h2Wr+Jp1BVnMWdg4Czj1p0TPQudswNzzjZDDX3DGnHPPW/ZN4LWvXFD/CNoShC+eZdq9e/07uVVO91domQ2Z7UFb7jarGZgDgafueqtnk+9HBQIHMNibfXzIUeUuA3OcM6R5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(396003)(376002)(136003)(346002)(66476007)(26005)(31696002)(31686004)(83380400001)(316002)(66946007)(54906003)(8676002)(6916009)(6512007)(66556008)(4326008)(4744005)(86362001)(6506007)(38100700002)(2616005)(2906002)(5660300002)(186003)(53546011)(478600001)(36756003)(41300700001)(8936002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmNVaWdudzdJL1k2aTB0cXhnc2hUSUQ4S1VpUzBBWSsxMkVnNWpPODI0dGE1?=
 =?utf-8?B?VU0yRXg2SWo4VXdrSndZWkMrSTRyODlPdTBaREdZTngzWXdUQkdLamF4ekIv?=
 =?utf-8?B?d2s3dFJhMWcyRzNPcE95ZDNyUkxEK2NjRmFQOXRlRU1YQmF3cWJQbDNybmF1?=
 =?utf-8?B?TlB5YU5vWTFkVWNuTHBlT1ZNck5MNmcxOTN1ZEpFbUJCcXlWcEdkSUcxSzJz?=
 =?utf-8?B?OS9iWjJPWHBqN1FpL1paTXRMRjJpTXkwRnNBeWREeUJyQVB2Y2cyUWRhZEFW?=
 =?utf-8?B?WHV1ODRDQVJDQTQ1YU1ESVJvMmU5NjNaT1ZXZ1JZWWIvSTZ5c1dka1RUZHJV?=
 =?utf-8?B?alpsSWRUdFlaRXJYT09pVEhUdmZwbEw5UXNYWFd1Vi9JcWsxMlByaHBkM0Rl?=
 =?utf-8?B?enpkdHprWnJ0Sk5UeHpCRjBHYnIyb3ZHZWlJUEs2T2tnN21IazJ6ODFrbnFI?=
 =?utf-8?B?L1YydC9wWFpFRUJKbXhtV1pHRFZCa0FWS01zL0FuVzFLaXZjUisrVkpYV0RJ?=
 =?utf-8?B?Nnd4VVFNVVBVd0t3SVg4ekNaclBDQ09QMW95ajRteDEwRjA4WER5ZDJSRnJ5?=
 =?utf-8?B?YXoxdENyL1J5bHJMSWUzSDZ6Q3BvUjFJemRuU2ZLZjYwMXZMQkpHQkh5cy9B?=
 =?utf-8?B?UDc4NXI4K0tGWVF2TW55MFpQZmdQTFdBMXFhaGw1MnVRSlVudEdtckY4Q3dU?=
 =?utf-8?B?TWVJRjlacXA5K1dOVGg5RlBGUVVNT0xXSUVoOWg4QmJjNWNWdzJXMTluZjJw?=
 =?utf-8?B?emNlWit5V0VERW4yVmZLSU1yRGpVUXFxOU4wN21ySnRZaHhZaTN0RXF6MEZq?=
 =?utf-8?B?T1FISXRuSnFOKytWY2UzU2svL2loeG9semZWdmd2anNMU2Y2T3Yzc2FZdHNw?=
 =?utf-8?B?YUxwc3g1ZCtWcnkwblJTNUZZMkRmYmhzanVWb0QvTmJ2UTh4S1lZNWZrczQw?=
 =?utf-8?B?SmZ0dzR6anBaK2tubEUzTU85T3NGNHJIc2xJUFJoL2tNREVxSXJXZ0w2Z3pq?=
 =?utf-8?B?TTd1V01XczdmMFhzV0IrWmNnYXFNYW9WbnFSdWc3Ynl2SGt6eUdteTYrSGtq?=
 =?utf-8?B?VDFFZzlNa29OamhpS3hNU2RUeUhuMWUwQi9hRGhZdjJWS2V3b21teExPWlND?=
 =?utf-8?B?STRVL3VFR25NWG5jWW01S1pSUExocW52UXA3ZHd2VHM5b0tGNDNZa0xIb3dC?=
 =?utf-8?B?VkpKMzBXRXl2VlhUc2NRdkM2SXBSMktMUWdUWWdHRFZhYlRzU3hldVVQR2o2?=
 =?utf-8?B?MVpZZUFkUzlralNaakQ5MFZCa1ZrQnV3dGZlVkVZRjVHVERoM2pnQWV0SkFZ?=
 =?utf-8?B?bGhxS25jVXJoVEQ2UURzd2VoSTdFeWhLd1FCN1VwcGJoVzdHTXV0TEFkeWI0?=
 =?utf-8?B?SnFkK3Z1emVDanZ6cVN6ZElaaXBPSVEyZkp4RkMxMnBJd3lHQXVEUFpXNHcw?=
 =?utf-8?B?TWlGNjZhNjFXQVRLbjlqd0V6U2krZzBUMy9TclFhZW5YNjdLWG9mU1ova3BY?=
 =?utf-8?B?dEd3Zi9oS241UXpOTlRUekduWjBCaUhXc3p1ZVk4c3RpYmNRaHRPSzdUTHNE?=
 =?utf-8?B?QmcvNUFLdVJKVS85c3NGaTQ4L04xQW0vL3doY2cveU55MXQ0c205aExDakZo?=
 =?utf-8?B?SVp1WENKbXlaY2UxcUFiUmlHN0xId1Z0RElRRGpKWkhDM2dOaFRGbEFra2lT?=
 =?utf-8?B?TFRGR3V0ODZQd2RXM0EwdC9qemxvSlBaQlVUczdYWVFxbU9yOU5NM0dINnEv?=
 =?utf-8?B?a0NNSzdUb3NDZVBIYUlvRFV1SjBKMURjM0FvVEo3ZnlaVzVqQStDTU5EYUpH?=
 =?utf-8?B?c2p2bG5SL3BNZW1OZXpnOHNzRTRpZmNRc0NCd25YT0xBYzREM3YxZFQzTUtT?=
 =?utf-8?B?TXJoR2xSOEdYZjF2VjRsUTI2cFBxTVNYY0VoU25HNmozRk5teDNBd0VDU1E4?=
 =?utf-8?B?Y1VmU3JTMXpMV3lXSWVDUnhDMWNvbjNaL1hXd1ZXeEk5eTRYZkFZeStNeGxI?=
 =?utf-8?B?WEo1U1ZqY0pSNlYwVjJJZlNSL05BV3lBMU02M3phV1o0SlN5ZXAralh6ZGdR?=
 =?utf-8?B?SFpCc2lIR3BlcUFGM0pXd3Q0aFBpYU1US2dVNENOcjR1Q2FVSTFJTjVRbnl1?=
 =?utf-8?Q?q/oy42NckWhLyr2FWatX2dz59?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c226ec-49c3-449d-9a68-08da580c9478
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2022 07:13:48.1380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W05DMExPs1u3/l6HGQEubm6Z7FUBAqu6uFayCs4PeMYukglxRKDcKIBZ4eDVvwgi9SF1RlE+3oQmeACOwGaYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6578

On 26.06.2022 23:11, Xenia Ragiadakou wrote:
> The per-cpu variable last_tickle_cpu is referenced only in credit.c.
> Change its linkage from external to internal by adding the storage-class
> specifier static to its definitions.
> 
> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation warning.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
(again with the same remark as on patch 2)


