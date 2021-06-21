Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF023AE3A8
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 09:04:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145354.267440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDyR-0002OZ-2I; Mon, 21 Jun 2021 07:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145354.267440; Mon, 21 Jun 2021 07:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvDyQ-0002Mj-Ut; Mon, 21 Jun 2021 07:03:58 +0000
Received: by outflank-mailman (input) for mailman id 145354;
 Mon, 21 Jun 2021 07:03:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f9W1=LP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lvDyP-0002Md-N5
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 07:03:57 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75388125-dea7-4e8c-9bc8-2238defb87f9;
 Mon, 21 Jun 2021 07:03:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2170.outbound.protection.outlook.com [104.47.17.170])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-1-6Jcj02l_OPme_XEFxTKQaA-1; Mon, 21 Jun 2021 09:03:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 07:03:51 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 07:03:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 07:03:49 +0000
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
X-Inumbo-ID: 75388125-dea7-4e8c-9bc8-2238defb87f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624259035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bgKsnnteWjheYKz/topZVXsci2lt42zenZ3ki+XMsZg=;
	b=NU2fmCllcNOmP1KiGq5KRCJ3YG6mk8B89v3CDYXn15iOGxv+AX30hLWwb4SxnF+UiU9Td6
	Ca1+RZtk2gEfA77XfatatoZCTzeDm74T96R6WI2FG55wlJU3xF8uYLnbNm8BGu+1EbwIqm
	iJRP5EZhpTVExaRcyrvu4TH1+XpvqzA=
X-MC-Unique: 6Jcj02l_OPme_XEFxTKQaA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwZt/kNfVy0daiv1Hjqjjg7Psq5m04TOBmhnME2kPaZ7uk70V3NBHz5KEdCQM+AYa0XLGWE/fT32Ci5tAvRf+hXyiNZF4RhaOMZNaPhMYu8ctMx0A2xFu09/17wf63+7bMwKlOiXz074DGmdlz2VFzG4NT9q/6dZwJ5wb0x2cSQ8PpR/nqgpboK+UaOgCzGlZ2diQICYERqzhdObrDr58vE2aj8Dh5lirbrk46Jf35KNPVD/a3ockhnqbe9/3eDp3tlAnwCFgwwY4POI/UIzyZIrH42Xni3ZzZhk4ApVVpBvgxNPx3a/tTo25ooPUeuSFCHZHwONWBj9IrNJDiMwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjDrlNUQDeor/lDlEup/fopOtBtExPBqffBIyfG2bLo=;
 b=lO72+jRxQxp/jZe4Oo/zKXnrZIra+BBrbLRO1oElxjm+DGRzmJGTR6s22KKD/jmX8c2b7PMjhaY54c4q2UDQ6BjfDEDef+sz+k8Tk7CwvR9NSlTiI/jJLhfIEpyX8buHweKavLT6i5fRcoMxGeqSRyxjLQqJlDSFDH0CB9pmVMqkLw1T1DZwaVcMz5pgxKB/wIeBJogXmezbwF7jjAMqVWB5cPbNGEnMNArfCMw4iGsFay8A19ZvBE8EmorM9pISxwIh9kGGlbUWHB9SwdFk63poKXZOTn9vnWyOZItMAp3mSf9LS8fvYWDwIa18fN4g9DUrtaNVRHaN9jxbuQhPNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: apertussolutions.com; dkim=none (message not signed)
 header.d=none;apertussolutions.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Tim Deegan <tim@xen.org>, Juergen Gross <jgross@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
 <c8bd347f-cf14-8b86-81f7-51c035c5c972@suse.com>
 <3a86c791-e508-36a4-a48c-6cdb810f81f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3fd8395f-87af-b32a-2dfe-1683299c4906@suse.com>
Date: Mon, 21 Jun 2021 09:03:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3a86c791-e508-36a4-a48c-6cdb810f81f9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0042.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9eeb846-bb73-4025-5f42-08d93482b93a
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2445CD779ADB35DDA19953EEB30A9@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQJRizwUv5a2t2JnuK6b2hg6jePCcixTNWjlSKQDgtUDeHFX5WQFDSHgUJSguG0NLbqPZhjwAYagri6ijp+dzzpIM0hUIoWL6LeLdCgJ/pSafrArWJzN4ZKS1yltTRROP5DDNDaMzfgzDUZTn851mLG/QydrCf1bDGBEnNSgUB1N/jGlYe3dfI3MqAx4aArk/tku1KQEZ1mOz2R14LpfVG1823C+efJjoAbFIu9AhKGIcsLDhqHSfseDqfGYLGL0JNme/Tum1RAzR5lJM1EkEHy0IwCfNsmkug6Yc60/bJoXrHH9bVl0gEr77d7pgNEYtt/2Gh2XqbV87VS7TUJA2Bdxr/ADU9/GgwKYHpqMLHzRIYLeMM3XjF38UhfdAMqtlTWixz/QHQHki34f6owHdNJSkRxNT8BExh+6M3A/hzJpSs6iQZGdGIlnqojvYi4G2hfx+J73uF35J5q6rGAnR6ow+SpTNH5SntR7WgZrOzZZS/SL+prxoMPYIQd324mXF7PqgUoe2Z8dBuLYxajNxdYtK4OABuqzeuVorYTjpXRRiiBk0Nr+QUviaODAg/Cnh/IPBIFC8CtYqViriDzi4YLeAXEGzOIwmx9toZEf4TMkezxB3fLZ7iaJNsF8nDCk0EtCDA5ZLBvtD5/GjGW5N8eaWalHfvOP78Xzb+AzsYloddrdgKpnxwTe5lq4CYts
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(366004)(39860400002)(36756003)(31686004)(86362001)(186003)(16526019)(8676002)(53546011)(16576012)(31696002)(7416002)(956004)(478600001)(54906003)(6486002)(5660300002)(8936002)(38100700002)(66556008)(316002)(26005)(4326008)(6916009)(2616005)(2906002)(66476007)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y8EwWtM43QxlW9aHKtqpXxu3kIaHfadjwo94rMa5BmcvvEA7OzjqKTeeJ765?=
 =?us-ascii?Q?yTWHUyItqcgJumhV82OBscrN+AeR3x1IHt5xjEqM74gAgW7uiXspi/8KRUr9?=
 =?us-ascii?Q?Hb5qg7H2XRf1+UMaJrpHC5T3vt+gDJr3domGfB7509FEOx9Wxhy8vgODp9JX?=
 =?us-ascii?Q?NjpY5uH9eSJYvvVAURDBnX/YI4xAk3p5XRI5P1jUVs2KY0TdJOmZOchTK8hj?=
 =?us-ascii?Q?JjvxRM2ruYyMlv07Ly9Z5spPxbH1mgQ0AP461GRi0DoRIXOWLvY4yvV+3s9n?=
 =?us-ascii?Q?ut3zVIx5Y5xcjTSAuCM0noJehxsA4bQvPxszhZSyUUsP5MrDVeNdS7k8WHzN?=
 =?us-ascii?Q?Xvq2rAzHZEAhj7b015BYxgGk3wU+IaJ3XnsnbW/v+uAbp1kaI0sK2W+27FRB?=
 =?us-ascii?Q?OXLl/Ez2vv91WWb1E4YzFQaCeYX+ykv5N3HNaKxRCVT3q1q4IBnHak2WX5uN?=
 =?us-ascii?Q?3h+DZaj2I/rQ/V1j1IptwVHVTMc1wZHy/Y2IE6SE6IkfxExEKR8O8zZ00m0T?=
 =?us-ascii?Q?NRcjQSFD5xb2exG1yB1Zt020v0t4uQ9qv2C9qzuuYHspR7RwvVnNFRz27JRI?=
 =?us-ascii?Q?Vh4hL2LD1eMs0vJy7MeieinUrpqDJs0hEE72K+rGbkl+VTq/RMPHpXSNc/RM?=
 =?us-ascii?Q?oeY6xVgBp+ugx3flhA8uUgkMRZqf2RbD/zK3Qm6k54cZNyqL6y+5BvWi23Rk?=
 =?us-ascii?Q?0snGxyIkUsSr9zJU4JJHUFgo5MeoPe6Gpo4Vgoj4VOJhkVtGKXsHPDdhf9FE?=
 =?us-ascii?Q?lJ4ndzOgUOzNAgGyXAhlJeQ/pih8aD2cEuYleGXEtvQLjXQ57vHNH+L60vwN?=
 =?us-ascii?Q?fP7Os+RmBZwYOb2kMNBEInJppVMNJyMOYOhq+lYt/ezuwcYrKVsQ6lTgiEUk?=
 =?us-ascii?Q?D/CHEHASkwmWIag2LL0lUlF0h/O2ad9KCsNDQ3rh/q1SFEq7BHTUoxTRvsEl?=
 =?us-ascii?Q?Dc+I4zhC4vkoitscwzwDZVThnCCD0Pl42aIt0v28WvzIFsytTufGoUp1WD6Q?=
 =?us-ascii?Q?yg05NYY6QG0ZIMQiR6LjUPxLhyDm6kio4vceqohJpZey/FBftPmCFZFAF4JC?=
 =?us-ascii?Q?FF2sE9eS+ZMlXFen7U032pq9b1EfcV5SzAtZEpJz8xu9pFZIzKfd4cHAxWtp?=
 =?us-ascii?Q?gkAXxMY5T06b+v2xUcxlFIMIfNgkvzJySK8w9L9Z7tlRRMyCLJkCkAO4UWck?=
 =?us-ascii?Q?1XbV+2wy0WWaoieAN7Ak2zmPa26WDEL+ZiyfdnE7pdJvoSgkDpJSMEtnQRB+?=
 =?us-ascii?Q?jMEmNFqTKIrS/w04JBmbEsyVdAiGCkTdlFZMCENwQuJw+GUL9pIzzTam5Sz3?=
 =?us-ascii?Q?W5sxiQLb1NXJuKcODxc6RToz?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9eeb846-bb73-4025-5f42-08d93482b93a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 07:03:51.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgj/FpOfOHgt2dpXONeRMOKgB44jRHCAsrz7QZbQWpWFzepUu7VL0cbIs4m8DAHF/tNC7fHbdMbPXVSlpGGFoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 18.06.2021 23:20, Andrew Cooper wrote:
> On 18/06/2021 13:26, Jan Beulich wrote:
>> On 18.06.2021 01:39, Daniel P. Smith wrote:
>>> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM=
_SILO and !CONFIG_XSM_FLASK
>>> is whether the XSM hooks in dummy.h are called as static inline functio=
ns or as function
>>> pointers to static functions. As such this commit,
>>>  * eliminates CONFIG_XSM
>> Following from what Andrew has said (including him mentioning your
>> changing of certain Kconfig option defaults), I'm not convinced this is
>> a good move. This still ought to serve as the overall XSM-yes-or-no
>> setting. If internally you make said two variants match in behavior,
>> that's a different thing.
>=20
> I firmly disagree. There is no such thing as !XSM even in staging right n=
ow.
>=20
> All over Xen, we have calls to xsm_*() functions which, even in the !XSM
> case, contain a non-trivial security policy.

Compared with the full-fledged XSM, I view the present xsm_default_action()
as sufficiently trivial. The inline wrappers of it really only exist to
allow #ifdef-ary at all the use sites to be avoided, and for the code to
act like before XSM got introduced. Whether you call this !XSM or
XSM_HWDOM_ALL_POWERFUL is secondary to me.

> The fact that under the hood, XSM vs !XSM creates two very different
> implementations of "the dom0-all-powerful model" is an error needing
> correcting, as it contributes a massive quantity of code complexity.
>=20
> This series of Daniel's takes steps to make the code match reality, and
> getting rid of CONFIG_XSM is absolutely the right thing to do.=C2=A0 XSM =
is
> never actually absent from a build of Xen, even if you choose CONFIG_XSM=
=3Dn.

As said, what you discuss is just how to call the child. What I point out
as undesirable is the going away of the inline functions, replaced by real
function calls (not indirect ones thanks to alternatives patching, but
still not clearly on par with the current model in terms of overhead).

Jan


