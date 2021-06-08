Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E92139F191
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jun 2021 11:02:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.138363.256163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXcf-0000Lh-Aj; Tue, 08 Jun 2021 09:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 138363.256163; Tue, 08 Jun 2021 09:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqXcf-0000Hx-4z; Tue, 08 Jun 2021 09:02:09 +0000
Received: by outflank-mailman (input) for mailman id 138363;
 Tue, 08 Jun 2021 09:02:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JFXD=LC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lqXcd-0000HI-JI
 for xen-devel@lists.xenproject.org; Tue, 08 Jun 2021 09:02:07 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 630a6917-be65-4ef8-978e-1ee70eca846d;
 Tue, 08 Jun 2021 09:02:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-28-Hm2sbt-uOb6xTJX8nSrH-g-1; Tue, 08 Jun 2021 11:02:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4942.eurprd04.prod.outlook.com (2603:10a6:803:59::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Tue, 8 Jun
 2021 09:01:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 09:01:58 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.10 via Frontend Transport; Tue, 8 Jun 2021 09:01:58 +0000
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
X-Inumbo-ID: 630a6917-be65-4ef8-978e-1ee70eca846d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623142921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXUVAskYuBPTTkqKnLrSCrT+NGkTOFXscl97reCM+DA=;
	b=Kwb+7CO3Qn8Rd69sBkF4G9ycyGnBoVskuHdyThC5iHf2UFTkXXm7py1adrxhWtINwifk21
	2dqTWz730OGFBeZYksPczGVqdNJ72JhA20G96VuRDL/YnPkzxXXY3szHkLGFZ8MTHeQLn1
	Kg0LuKFR8x23MBZrc/fW/QKsr/fCr4E=
X-MC-Unique: Hm2sbt-uOb6xTJX8nSrH-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=It0uAqTEnmPZxtuyzpE96XJnQMi7eh+N3xa8w1DQ/7nMDEzkl39spWmB4Z5FZOI3eThPmUB/bfpzN+BGVSZCIXRRTAcaDN0fN5nF7GGUVXgExla2Er0MSVqzTTQIETqrjch0kHSTFicO8GFfeKW/6c7LuNegwV65Ho3pHIlUcK5i4A8cqKM6bvTovOKcqofK/b2OCLrYboklvphfljBFSYhEpxhN/HTCG8Cpo4CMM7M8t2ZVPA6Xadz/3PTlbBDb7LbNvuDy7zXzQDCjJtxhqKLRrAXxydjm7gaURVce2ndlhLIEliIrgnKjScl/xHxsi+l+xqupBPr8UjiI80xRwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEy4ES23OSIRiVz8iq3E31vclCeAlR3mb/3fj1yt3Tk=;
 b=HLp/ybkDehpHW2/tsSR5V/wHoAMDytBilOd8OSJ089RS8ePtup8FTaVugpinj3TuPEvrMw+emX7zhqDhPOpzz4gXIlAroYcaZSkYuQ/2qoierMAr4oZYh+EnOkvBEb1gMfHLaZi8fJ3bp6vo+kAed/Wa6TgoJHPlQpUz6jO+Y7+4DWiwFb/M2774h76BbTQcoTx7XNKX5IOKCwR4CyG7LlRjECwa3xQZ8JXK8MAeWDy7IMMy8GXArN5waQYqZXf3V2VdTppFtdX5LpUY50jWYGK+cLHQI4dhYXKM1yo3njX5O7k/ch4uElAaHTbELr8apuCqxWeEnrqzPpysfvfHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/cpuid: Drop special_features[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210607124141.24767-1-andrew.cooper3@citrix.com>
 <d09c3a27-4b89-be3f-6dea-37f3759df570@suse.com>
 <22ffd522-89da-d9fd-3918-bf07eae1be1a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <84ab1f8d-7ce5-56cd-231e-bed2da6ddd26@suse.com>
Date: Tue, 8 Jun 2021 11:01:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <22ffd522-89da-d9fd-3918-bf07eae1be1a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3968b99-2829-4cb8-4a04-08d92a5c127a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4942:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4942E362A0FE92D4A82DB398B3379@VI1PR04MB4942.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QJ5zHVg4Bg4cXeVjdncA+oiih5bfccjt7kQDSWmK62ZWDlcETr/mX7Lo+Cu7ylovyHpWKLjKXzjPpyCUli+foNkdYOf6k3HOu/+lj6QJEyEJYyO0ntxd/yy7SuW4HI70xwx1OinLz/wYvwWPg7ZpohgZ3qgzbx3KmGzLrpw+5bTcnPXpKzTU3QcG88b6zIANc5KnnhcYdQIzcVUm90yeKPp62rZkW23aBLeh1CMT2UUwobLovbUV+CBxxHIbzyV3umjiIvEYgtabKNstsutlp576EwScJuSnTZHMMOqx3gvp+7rp9fdypojbwdiHFdmRmvsXo0DLwFv1r4sI7tn3oh5hEXDlia+PEq288YzHBbzBLjeDWodtXFx1lK1oNJMmImvV0kcSu3hLI4gc1H3mRqvJHnY43pKlGBpvQ8Hvv+r0FSI5ZvVxgf3dGr793AwdTidI2+w0iOxu+4ufcD8l0MQFTh4MgwPXg0/9/nfq7DBs1DDXytUfDepad0QCXprx4kkTidir9QLDj1hNzVuXbwRBiWnbWOwjyGv3dYw1akyyRXc6GL23V8U70hTW1keXQM14nRv6P2bq76Yx4OjYalLhF+gXteXktnbSrHWLbkrY2JbX+mnbrILpCLbZVN+xlMZJ+0S0+ej430/xpwGnC5Ccn70YVpHerwIuk/Bgjtyv9Za+wAsUi0YOfj4DC11Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(4326008)(54906003)(5660300002)(16576012)(6486002)(6916009)(316002)(2906002)(6666004)(31696002)(16526019)(31686004)(83380400001)(36756003)(26005)(186003)(8676002)(956004)(38100700002)(8936002)(66476007)(66946007)(2616005)(478600001)(66556008)(53546011)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?us-ascii?Q?gfBPX9JBkZxhSSj/2lZzZOxolmShp1jF06n2L3UJ0QLgvuwzhP+ttDocNsxV?=
 =?us-ascii?Q?FOHFUs4BhEwk0ssZhLsI1fjXde0XhJKpwKsypo44z2/s0KgRIt/HvrjG1s3e?=
 =?us-ascii?Q?xWw2e1rbCNfXkKUz7yK4x1nnGNLEKY2K5QMNS8QddHVVsd283c3q5m0RuqCQ?=
 =?us-ascii?Q?/nE+BklRLeDiP64U9TlzniMkkV6Co5fEWdhvEltznzif77Ny2yrT+DpZwG5H?=
 =?us-ascii?Q?j38gQS6ZosJMvHoMZEhqAOgteuhgMx2CKe4SssX+ugyRneQJC3M+EFS5rQtj?=
 =?us-ascii?Q?BnXLKmTU5V2eE9Qi2bYkMl9mP2CGWxoTMH8KxOzCVGFIxeYAU0ATbq/Hd9SK?=
 =?us-ascii?Q?1LG3q3U8fXiMQObyehDmifw2XQPwVHUCIX8FEAIgbBSQK4Dmtx1HSxjXTA6n?=
 =?us-ascii?Q?Jjgo3BPN0mnozP8hCPg4PcFL9zOe7HCYzbGUBn/AXBf9AMrQV3lHP/gvVCSA?=
 =?us-ascii?Q?9SYenMbZhpaVRbKkmctm44wSmujGafufOFBTWA1fm+KQ+NdfWYj0wA/sVG4V?=
 =?us-ascii?Q?Ye5gjsqOSSbW0vTCKwn0VPVjLX2n3SO+9+Por0hj/EQKIqr1xehw0N7eNbFl?=
 =?us-ascii?Q?uX0UpOjpccDoVIzM8GsHHp01hpXMLlyVujV7aIVMqmh9Dv/NpAaaZkyBUK7F?=
 =?us-ascii?Q?Uz2EHoIBp6vNkicKP/lGzCzOjzDxgCj6h5/YUzZ6uKdmjl+lrwNpCObFz1yg?=
 =?us-ascii?Q?OCUMcwQUw5lCrZEWZnrNXKchwr44vyX1NSBPgKnPNsYOgZuISKrXad5/2gtD?=
 =?us-ascii?Q?ZXPmasyWVp2eO5wm7Y0XTyDaGVwFr8oBEifh98avoLm8OZp5tkghriT3EYiU?=
 =?us-ascii?Q?j7Rcaw3fI49t/ocqZuIn+DsMPK9QnvPwEwIPAz5/78/YLGr3oGbeOlw7rZPI?=
 =?us-ascii?Q?4JynqmwgalsaMz1GxNzfG9XwVmCqQ5Fe0ofmInjd0aJKpLHR3DXQPF+Zmkfb?=
 =?us-ascii?Q?dWs0zPy1Ahlvn++uH+u5Xb8ayWU1TS2dYgLwiGiZBICwbgbg9IyBifXUh+ic?=
 =?us-ascii?Q?pGkgxKv+YVhcD6vuZWDSVJDpX2MTF6+8iR3ntKhdqp3anF5VgIEt188opJXd?=
 =?us-ascii?Q?q3DTWnE95oWOsbB9+RtZQBo0izY1l5ibUeJ+Ju70cwv5FBWFssNzzgXS6+lh?=
 =?us-ascii?Q?KP0oJEkkCrhnrJiqD0VCA38vFQxROvcTp/mwOT02MfjKPNBGdarOy7fRV6B9?=
 =?us-ascii?Q?ad8JLfAsHTCkm497UmuKSMfOmwjvSBhY/HpN3FVXmSJkSAhlEwulUYZ/OFQA?=
 =?us-ascii?Q?FcJzwpBJ6aI6r9hAvReW7wBnychCcvE10ZNiLW/umfrqzvtpIuj1HvKR36Ws?=
 =?us-ascii?Q?7GQPycVV6m6GeEDSoOYfkMjE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3968b99-2829-4cb8-4a04-08d92a5c127a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 09:01:58.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNHhnW92ioDSxGHlw0prPEKk7x7zEhjwJQLl8yTwwdXBj+uaGs+w7p4EaHgilXDVhUKixBT+U4mvDXlO2Js23w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4942

On 08.06.2021 10:46, Andrew Cooper wrote:
> On 08/06/2021 07:18, Jan Beulich wrote:
>> On 07.06.2021 14:41, Andrew Cooper wrote:
>>> While the ! annotation is useful to indicate that something special is
>>> happening, an array of bits is not.  Drop it, to prevent mistakes.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> CC: Wei Liu <wl@xen.org>
>>> ---
>>>  xen/arch/x86/cpuid.c        | 2 --
>>>  xen/include/asm-x86/cpuid.h | 1 -
>>>  xen/tools/gen-cpuid.py      | 3 ---
>>>  3 files changed, 6 deletions(-)
>> As osstest points out this didn't go quite far enough, or too far:
>> Either XC_FEATUREMASK_SPECIAL also needs dropping (including its uses
>> in libxenguest and xen-cpuid) or, considering exposing this
>> information via xen-cpuid isn't entirely without purpose, the script
>> part of the original change needs undoing or making conditional e.g.
>> upon __XEN__.
>=20
> Yes - Gitlab CI didn't spot, because there is a different breakage from
> PV32 blocking things.

Oh, what further problem do we have? What I can see there (picking a
random build log) is the failure from the change here ...

> I think I'll reinstate the gen-cpuid.py hunks because having xen-cpuid
> print out the bits when asked is helpful.

And maybe put the #define inside "#ifndef __XEN__" then?

Jan


