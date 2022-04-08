Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8FD4F9500
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:01:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301467.514488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnIg-0005wE-9Y; Fri, 08 Apr 2022 12:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301467.514488; Fri, 08 Apr 2022 12:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnIg-0005u2-6C; Fri, 08 Apr 2022 12:01:14 +0000
Received: by outflank-mailman (input) for mailman id 301467;
 Fri, 08 Apr 2022 12:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnId-0005tm-Vv
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:01:11 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9479c721-b733-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 14:01:10 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-H-K1EbqLOeq8MHjaG17_7w-1; Fri, 08 Apr 2022 14:01:09 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by AS8PR04MB8039.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Fri, 8 Apr
 2022 12:01:05 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:01:05 +0000
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
X-Inumbo-ID: 9479c721-b733-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649419270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTwYta0hLJaFLLJVCx3cFaXfh8k3WbEKyxvvotHAmyA=;
	b=Xaphu6oxiEyQMFRDpwoYs5smRbSE//lszv8NSsBtKnUgReXlNgcCG2Lxz0uFF0Za2Gjqst
	qnWYKgvXmLGahzfRWSObE2jYFUenKHJ4LtDDy46hfW+T56AOfJC/9l9IjOXZIrA+oRJx+i
	u5q73fuVy00NIwegLDLkKj/oCzGz31Q=
X-MC-Unique: H-K1EbqLOeq8MHjaG17_7w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWvprlJtsPRdZG/pQYj/mcrkcByTKrt/QA4JoIWutF8IT07tIEGAynfO4nPnPnklStw4VyG/CmRoUvKJQtIW5fwSHWAyXnP42mvWYSJ79V/ve7GhHsx4k5gey+2wR9R9m6+WLVI2Ct6FP+yYqEICxpysQm0SC3AQAXXrs6sPiWBSjZ3dIDlQqIXAIaUnZiKn9MNWdflGxf6huyEesCLiTAduvmpZu7s7cet38UjFdMgf+/M3cy41dEA4rKGU06oYGIyarcGDVyxuPsm7oI6a3bzhNUaNZRwggSoVq4u9scVbhusyZFW0AqzwBW09Bgw9872LIw/im4O6eS/MzD0yHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XN3WTJFEKD82PiIFkvb8ac/2L9v1ssxFrbkCnU3IPpU=;
 b=cfi+KBLhjN8H37feeA5WSNdJ7F5tcpnUlp2ehJDufrEZ/zSQdN/7tsodPG45V3yyfU2cGM6+xQjfJfil5r7NAfoIWbTIFgWZIJheFGoOVjsIdpDCV4UYNHF92fl7T+YQcb+M2xztvVpI9aUcIxTBkNlme3cvohY+x3JvIVQlcuttYm31ExlE5N6xHMukr5xzC3APgy9I2SL85fT0YcJHyvdHSoLAMQEK7Ow51L459e5h1y0LWiCKkRyn5+8Z01Aefi785Pm4sYpZE6qRtKpYjuFn0izlcGlxn46hkduWr9skqhXMrf5oiKkewNJgK6/QO6llhS5cZf3pI7FVaPlsPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <507516be-e0a1-c8a2-64cd-1facfc36d7c1@suse.com>
Date: Fri, 8 Apr 2022 14:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [xen-4.12-testing test] 169199: regressions - FAIL
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: xen-devel@lists.xenproject.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>
References: <osstest-169199-mainreport@xen.org>
 <43ad1e8c-dacc-9b7a-7250-9348e7e52580@suse.com>
 <Yk/tzuKq4D3mFEQu@Air-de-Roger>
 <a6c6901d-0f6f-f4f6-eba9-c3d169c30433@suse.com>
 <YlAWBom8O8d1lCpQ@Air-de-Roger>
 <ab27a3c3-a85d-b9aa-de0c-ca96f3e2a3fc@xen.org>
 <YlAZhWVFziwoL0rb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YlAZhWVFziwoL0rb@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0105.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::46) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72b9d0d8-dd7f-4039-2aac-08da19577574
X-MS-TrafficTypeDiagnostic: AS8PR04MB8039:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8039D94861E186048631EA06B3E99@AS8PR04MB8039.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2YOqsL7RhAlt7JsN8c3wrZjyp+uTh13jE/L6eLaFT7tYYnUMeQhALv/0MaQOT8rQmNPEsbQZDOkB3wFYhJ8qMO4dyQEdQYKZrxfYfTKiLtQJCGZ7EElpaTWPCtYoW+tWOiNmr2fqWKR06/LbEQtJVDxacCN3rccDktFtc6/VBMC1wYhi7PCZy+g+YNUUT6+3ysLUdI+xAJrMex+npGY/6m2FFi3kQAo18LH2jkrTnbuCZ91kOwCGgigEjjm0yKSwW79cd9Uu7xZtU7F+xHZkl/ra7VQLMM5D2+EDSPjR9E9bzvaxtJ1k+9OfRSPpoPmIVRmt55vF4lSfFbAxarrzbI2jiM/d/p1f5+sbCeRL319Rc+LtUNYIvkaibuC7IclvtCqwgHTXRBM+myLCjXqk8PwVxgIO3mW5vSWy5HUC0IpKBxeW6iiezw2HZ91WnhLPjh3kUKw4wsqYLfl3Q5jvtku2UUSvaeyusHRoTiUxykfwn5hbHBt0QWW87tZzPKwCKvD0pe7dPSkBkL7YltPZOJ4d6bHKAxCLFoOqvWcO0pyYpT/SSX5vRTKlckJd42a76w9mKel/KRXxA2Q4u3FjNX86UmD2bXSjqKq1Cag1yHBCOjaqdwaVvDQqn+88eMKbSi+uATeeCjqOuaJtejGCyD97chNazoHCnp8Hui66PELonXlL16K7EddXC+fG7ijwimo1cvxLPhJKmdBBENa4zrFI8f2lFlR4rPuAnFHOPYWXRiUizh56F8pNYTOE9biN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(66476007)(8676002)(5660300002)(316002)(31696002)(54906003)(66946007)(53546011)(86362001)(6916009)(8936002)(83380400001)(4326008)(508600001)(6512007)(2616005)(38100700002)(6506007)(26005)(31686004)(186003)(6486002)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MvNUNd7NAJY22FEIwf2JZN9Cr/IzeP9l3aanucQD1RsGC6f1LdV223bbPP3E?=
 =?us-ascii?Q?Sx+XewdGib807AY7E1Ihof4qcuchvBJO2qOnES7yXEF3XkBxwgbXY+eP/SJa?=
 =?us-ascii?Q?WKtdsXr8nJtU7T1qqSb0jjVT3vkDgmfG0+BgdogbgUiTiG3yKmdfB8DrZ52F?=
 =?us-ascii?Q?rGkWg+87Vg17GbPwfOe4tvM0vldIygnf4GWMJ6Ba20iBnyTE/9MizHjQeAa3?=
 =?us-ascii?Q?TNSSBGS8Mn5U+PQaHyXqKaJwo591ZtiOCJ8PH2DX9LRBpxZQklrI6D5Cuwam?=
 =?us-ascii?Q?H3RuX1X3vzeme07Gr0clhc/ERln/c8ghWKIhLUh3DFg1SlDMeZvH4xUUBSjX?=
 =?us-ascii?Q?fsG0K8PXkVEP+r11/MFo9km/UDHgOCzmB+PtC6qUFLWbe0mAJwo2fCpYdRJW?=
 =?us-ascii?Q?1OlHNwsbhwfbSEeo9BUb4lBGCN77aBV/iqcFEwBLcvyNrGbGrhjBWYJm99+G?=
 =?us-ascii?Q?kMqjEMrK6QenrA121eUKuqigO4eZ79BXSVk+SowpIcg3ZQHXeYLDMLtm4Srs?=
 =?us-ascii?Q?TV2pxT79XL8JSCxO0nJfj8FrI0/fbpyxyBLnjSWrKtq8b3OvycwU2HZN6VW/?=
 =?us-ascii?Q?HrCbbmNOWb/jCHQTjC7il+GW5ypQBJXAvoYo57aVVhPx70/my2kLKppkhG6U?=
 =?us-ascii?Q?gN6Y5jepsQlCyP8hYKht4cXsKl1PHk4Tnk+lXPLJCYeDTEeckj2pBx0BpzQO?=
 =?us-ascii?Q?8wJlvyXxfPYqw6Hc9Wm+1UV2W5eL6FGijzm6efXWLFB5yMSpAtvOrVh2JxxF?=
 =?us-ascii?Q?SWAmEedP0X40VNsuNAYJcnbAUCN8ZzH9gvHn3px3SDnT7B4OMEinOWn6+e/A?=
 =?us-ascii?Q?HSeruHiWi+I2Bvtmuz4AsRs2vEg7AwEfGNadCTh2cVZLZT3PovSw0+SwyNO5?=
 =?us-ascii?Q?U1pGFRQREWhWwKFD94fVUQ3JP8F37mqFPPslVYXKIuDjgUOqDfu3YNPfrgXq?=
 =?us-ascii?Q?/CNB5d+m0pP75NIza+Dwt9T3uhjsrZB1Aw+fIeYndY8eYcDsF81UWhnj8ai+?=
 =?us-ascii?Q?UuyOHJVCU5+5NjVHLzS5e/DoiYNS8/giSgYioqCPxWqam5wrrTNMmG8puKzG?=
 =?us-ascii?Q?dy72NdLeLgDLZqRARgbm6leFioSrQcPxEy3TeY+aD2b2zCpycupZLiGXCvod?=
 =?us-ascii?Q?r9LG5Vs0N7pcAY6JhV7z2nPrMNxGDQVjJ1Yznz1pZp/Jpk0NB2nrq+SsT5bf?=
 =?us-ascii?Q?83t/yk+wasdw5v7eJyPjfhiiOroohvPFeodR64AfDEJtPx/RPZoAO4qQAfMK?=
 =?us-ascii?Q?tLdwlxsewWk0C6UnkUaYMNwOeozgXNg4Jf9Cn+iy5aAOJQf3aulqhtpzPTaH?=
 =?us-ascii?Q?HtR6qkCz1z37BUX+lmkUgwkZiE7Ig5tHTGwuDzO/1L61J9AbwhZkFcZ7hrtp?=
 =?us-ascii?Q?FZ+0bGEDqKJOpxMfYBmQKXHsJPxQW8GKBoDtI+RBnp+H5PWpbzsHW6Z8EPw+?=
 =?us-ascii?Q?3ZeensnmpT5938WjRttHvZEs0mmT519kZ/m5MT/XVRcV3QTXwWMtLS6oTLZB?=
 =?us-ascii?Q?eAa/9ssi8WKbEBdOKqqc49xxsFzS1Xo/PtmxWHTyoPAvMVB61Vp5fSh/LJmS?=
 =?us-ascii?Q?SrZh87byQrDJPaQyHcXT4HovUx26YxnziInfnC/2E3oP8irm9rWKZ4zXQd7q?=
 =?us-ascii?Q?4lhs3FjgGFx2cuA1fKnZiN9XOwqUgvkWGc07AXpMkfyF8YaCvPxxAzsNSgFj?=
 =?us-ascii?Q?u4ZUp86wht8pqRjwnGVd+zcBuhmahJb1PNVoPVwtHBwFhAJGfXX2v2bARvsM?=
 =?us-ascii?Q?AFEDunqjhg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72b9d0d8-dd7f-4039-2aac-08da19577574
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:01:05.0836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtSSdfLR8TCwBKZ1RnkngFMY/aXKjYV4dQQczyXtvHwjg2Sn+opd/PYBSSuSogOBNRV7bzWlX9IUXY/um5htQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8039

On 08.04.2022 13:16, Roger Pau Monn=C3=A9 wrote:
> On Fri, Apr 08, 2022 at 12:08:02PM +0100, Julien Grall wrote:
>> On 08/04/2022 12:01, Roger Pau Monn=C3=A9 wrote:
>>>>> I could add a suitable dom0_max_vcpus parameter to osstest.  XenServe=
r
>>>>> uses 16 for example.
>>>>
>>>> I'm afraid a fixed number won't do, the more that iirc there are
>>>> systems with just a few cores in the pool (and you don't want to
>>>> over-commit by default).
>>>
>>> But this won't over commit, it would just assign dom0 16 vCPUs at
>>> most, if the system has less than 16 vCPUs that's what would be
>>> assigned to dom0.
>>
>> AFAICT, this is not the case on Arm. If you ask 16 vCPUs, then you will =
get
>> that number even if there are 8 pCPUs.
>>
>> In fact, the documentation of dom0_max_vcpus suggests that the numbers o=
f
>> vCPUs can be more than the number of pCPUs.
>=20
> It was my understanding that you could only achieve that by using the
> min-max nomenclature, so in order to force 16 vCPUs always you would
> have to use:
>=20
> dom0_max_vcpus=3D16-16
>=20
> Otherwise the usage of '_max_' in the option name is pointless, and it
> should instead be dom0_vcpus.

I disagree: Unlike for DomU there's no way to keep a "reserve" of vCPU-s
for Dom0, except by offlining some once Dom0 runs. Hence this "max" in
the name is quite applicable.

Jan


