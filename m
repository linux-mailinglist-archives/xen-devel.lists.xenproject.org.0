Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C250B11F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 09:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310706.527635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnQ4-0001uU-81; Fri, 22 Apr 2022 07:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310706.527635; Fri, 22 Apr 2022 07:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhnQ4-0001rO-4s; Fri, 22 Apr 2022 07:09:32 +0000
Received: by outflank-mailman (input) for mailman id 310706;
 Fri, 22 Apr 2022 07:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhnQ2-0001rI-PB
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 07:09:30 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f376e1-c20b-11ec-a405-831a346695d4;
 Fri, 22 Apr 2022 09:09:29 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-_t1u2K31NOiGxYg3IN56oA-1; Fri, 22 Apr 2022 09:09:28 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8661.eurprd04.prod.outlook.com (2603:10a6:10:2dc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Fri, 22 Apr
 2022 07:09:26 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:09:26 +0000
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
X-Inumbo-ID: 26f376e1-c20b-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650611369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BolHv1M2s9SqPW1A5As/cq32oxmIFoz5uny0gNNpCao=;
	b=B8Ryqw5TCbpR3LZXnAi70/7xvcUSsvp+I3JCsUBsYXHrHX4T3RE1A8vsiDfCgzaSQpLaOx
	maX1m9JBAaLuBcOH523WCvZcz7elFyup+nUXEFEZLrPBwmVxglmEYb3+guySuQamJWdLKB
	+cB2Q1bMujrGJvXWb54t6gJ+c5pSXKM=
X-MC-Unique: _t1u2K31NOiGxYg3IN56oA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YExrMOCCUCoYEZsXZbvrMckY1m/BdyzoDlyA1y1HsG3E7lOI2WjebvCussIcSxJIYiHWSFJ6EeoK3Qurpg6GRzHZsqX4pIlRHVJSMx73mTVeZVvzEctOxxp+BPrplxdKFtS5UV3vZGFFfB/E1wIcxAp9Yr0E3o5HPGuULdhuNOFkf5267waltj26kEshnAM4+ILOIGLb402bbYvAi7SyYuSdebmNlDZ3jEHA+mkJIh1/O0wMRFBZfI/XrMF2IHTRWGIhKNMfiZJu4R6I6O6oxk8L99RQ/rYeqdfZCia6dJ2I7QuiyZDWZgvqycGUoQypSe7yNqNiz+fw2R9tyeDptw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jMX/ZkCefo+xl6c48nIAY5xxfgtI5L33BHnHz7NMMTk=;
 b=JH6Y3jon3HhaJhO+lQ4KfClorI7M/vndzXpSVZp5CXGRPC9AENZKH9k+nJ+euD7ZkfK0DlbrJXb8E/tBQOfIwtOLX18LhfzcX/AqDg5ulYWEdx7LnH8MHcoJ3gS+YcO0LsmRl35PldiD/YNzX89QfLFcYZ6Ox8M5KZ1bTbp3ChGw7pkwse5Yvj/nYJR6MGZbI7y1FkzESTJnkN7JO68d3f8ecjSzMHVBMl7EHPH7UbpYTKidLzjYwhfFoag4NobYl3oiZD5livUPnKdb5gAqDAdT28dVmEa2+QMcMB++Q/I8vM2V0dB0gLE2dlolthC8+otO+ar2hWIrrvbVR1PF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a83fc8db-f8c0-5a17-a668-1a00cb1fdc2a@suse.com>
Date: Fri, 22 Apr 2022 09:09:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] xen/iommu: cleanup iommu related domctl handling
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>
References: <20220420055736.27901-1-jgross@suse.com>
 <927d3bbd-64db-15dc-9bec-270711b9c1a8@suse.com>
 <a2489d58-883e-01e7-1b7d-0413b4006fbe@suse.com>
 <74f6105d-d3a3-6508-3c6f-3aac53285c5f@suse.com>
 <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7f55e68c-17ed-c682-9ba7-4835d8e1a79b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P189CA0024.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::29) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83c793a3-ab7f-4fd0-2ed5-08da242f095c
X-MS-TrafficTypeDiagnostic: DU2PR04MB8661:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB8661328A9172050A4A23414FB3F79@DU2PR04MB8661.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xUVZcCkQigrX6Ctd7vklMQCd77BFK2q+J+UQcCZBZKlP24OLSD055X4/J8RHRoaHPsIskHSkqyk/DeZ7jjvChd81w3pTGRCxjJufeirk8tvdyDPC5lqWXCXrOKKKI2YvsCp7+2Jq4US3sPDErRHJKV1kG5lNiTlOVF2zmGxp+Mnc9TkU4IzPdY0A/rUffRul6vqK3gQopjS5PnCB0O2df2JQdzsRiheIJ8U61LqZphvDUU2nV3oBuTspHJ27X9PAcSZgS+Ey8xVVw6LCXAnewOkTut7VZQz1MOKGPnpcW0FcWKzleO3sY+ed2bvGFErE+IICHc5Aa35dpHDOugIbx4uZSQZGFlPM8BLfnNffMP2i1q5lRCpZzsiWwyYynO6cwEEf7X7L0kgiSET5S5v0ZFi97BkJeTCHGMV23q39aCBAPjieozJFeEru3kJ+SENsuLysBrvYQu9Kt7erf8S1a839arybr0ZKWIIHlUkyzQyYFt7pJBXvaj3yJZRkMXCME9gkFl4ThLh0ICDg3y+YQEHBZ9DRWTcGRcWtKP9S2CE5xEL8/KHHhrzYWkjOJEhxdYBG9/FU/Mta3zJJrpCyE2cxiX/v+O2PzIpHPolStoUw+Ov1Ao4nGNX4T6RQFwXMcKVuXvD5IQIBUQifX+kL2cmieGq61sa5kNyFZGe8nOf1FGffidmNVIVsknvnGNq1kyZGaSgeR9mPD65q61dej/glqXQ0+ROzXlLO3z2jx4xBr658F9KVSEDOyEIE8fQf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66476007)(54906003)(6486002)(31696002)(83380400001)(66556008)(66946007)(4326008)(8676002)(2906002)(6916009)(508600001)(8936002)(7416002)(5660300002)(2616005)(107886003)(26005)(186003)(86362001)(31686004)(6512007)(316002)(53546011)(6506007)(36756003)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GlaEjjmw5bGcOFNGOs2vv3MuTJv6rXo8HIiGKIMCBu94EfOqrbVX8HZh40OY?=
 =?us-ascii?Q?jEzYIIhMuTWraeJvdQNt/9BWarjwq1Mz66gQyFmE61aa7O6JVbR4MkY1KWVc?=
 =?us-ascii?Q?x8PkhVdU3ilxHarnMSxRKtOqHN7tCKBBto0lGXDjqa6V3/jcXGr7Snm3gu6d?=
 =?us-ascii?Q?DIMDa62XhTCjMt2IyeTTly2PcyJv5otiznQYAb551uUFnExk41TKoRW+gmlT?=
 =?us-ascii?Q?+UOBeQqs4rT8SGOlVjZPr2treFGH/nxyaSO3W9YBnq7cG/4M4WGlT6AWOYJp?=
 =?us-ascii?Q?BwdumpTn9hZuR5bvhFKyS0y1AQPB3Yu+csRSHbyTA31kU66EleCDpYEQrUaO?=
 =?us-ascii?Q?aiNWntQQjrFBJEmBda3+lHE6rVcLj3gYxPZJBLXIlM+84uIlJPS2Q5kx5Z5V?=
 =?us-ascii?Q?cirgK1qhw8I9DRokv0Z9jhBMFQIEwSI7zxECQbbfBJMeb3unfiabtyb8X1sw?=
 =?us-ascii?Q?46c/uVM4VdfAA1rq6pw44A7YkfiCewiq/KZfWSgfXfiQ2WWAXLoiaO5XfDDw?=
 =?us-ascii?Q?RFFgTkoeTEtUgSRrL0Zms6ZJ5wId9sH+Bo5h23ecic+0fh5SxngAEKiwQNPI?=
 =?us-ascii?Q?dyoFp8LWSlGUs2Bo17xojbSgtGCLJzVjUwNboIblS64Zo1Vn0TL2PgOCYlnb?=
 =?us-ascii?Q?+7tCggRmpW4YP8tLQT8GOGrtDN/BOIXiwIyiUh+2Th103UNm4zM8mrW4s2Xm?=
 =?us-ascii?Q?KOKDiD+E+tZRRXqDIFsLeAaQvnjg8lGdSzC2AToGQspnEWTPgLrhKrDoNzGF?=
 =?us-ascii?Q?9yZFPKjrCa6U1s+7X2pYb0XfvH7vQtwBJvVlHwO0g2InAF//tTkHo7n9jSEQ?=
 =?us-ascii?Q?wvOlwHZV8/i5pNUJhQDUhcuilcLi3vD65KzUSxpDEufY5edL8ii2jNtwcLuT?=
 =?us-ascii?Q?ZolF5JtVtlQ6tqBowtkE0ttaedypQgstPuBPhL0+ohtXUzEtUqnKoOMmNQOG?=
 =?us-ascii?Q?rvmWJZf+YD3+ILnxYGxf0t6qbnjOcwU91dLwCH07XRy1+HwZifRNI2HCuJwc?=
 =?us-ascii?Q?6BhC8gSnJTjHTpV2Uu7CRiV4Zh+GRUsHIetawISNlUUXDvqa4Osle5BzUGE6?=
 =?us-ascii?Q?HBttiNq/iQz0ArFragxTfOKtUF6flIsHtcWDyrX3rQGxbEtpjhy1/7pQBW8r?=
 =?us-ascii?Q?4qDeAriTj/zTu2uEpzpSPcjifQM3dJKuN38KsIWHUsNXSxZZuCFrREqrODG1?=
 =?us-ascii?Q?DK96mUHvvKsPlEjCTXJ1WoNLiAV2NeuBE6oldCg2Fjah7DhG17prN3CBUlFA?=
 =?us-ascii?Q?7HOZ3JX1ThYkgn9F1mL3cnaKA1FRI5CHxgYZ02Y+t8lVRUoFbkEIBypwH206?=
 =?us-ascii?Q?QVRJav3kqwFAfq8bsP43LOBYpOdmeT5AbgOieJXxdKnx8tQ01FI+C8jGfrtf?=
 =?us-ascii?Q?aPia6SKyWAMTtzTL1qMiz+fu3VZeHFkZesNRfhrxLpo03i6OvT6+o1y4JtHK?=
 =?us-ascii?Q?maqCbnxZZyauhzmGehP3DK1lKk97hYXoLPLeKxV0pXhi3v1D/+zp/p7TQPDn?=
 =?us-ascii?Q?cTuxFtluimGORv4tdjdh6IzfoVhBHVy4RmF+5LqnFJbp++G0lPAJJno4aM0Y?=
 =?us-ascii?Q?D0Iyxh4KPn5VcGMT7+T8Hhp9OLNmC9/ioLg/+gU24MoYQDDyURi0auYtwCuv?=
 =?us-ascii?Q?zH5O9X/8srsY6B1SYDdyqpoigWtqV6wsiQEF1Uq4IaYs2R9SR8ham3bY49WF?=
 =?us-ascii?Q?TygmvE1qtaS8UD6iXE6Xsu5Xp3KrpscyV9FjR5q6HzyBkh9sPjtu+jM5WFwY?=
 =?us-ascii?Q?UMQNvW33Aw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c793a3-ab7f-4fd0-2ed5-08da242f095c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 07:09:26.6851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W4ZvCE20Ya+obN+pPfNje3LPZppxXEfarm7YnUQTNyQBJ7D2v5YJHZOTebchGwStg2FGpv6BYA3oyAY2OsjVXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8661

On 21.04.2022 19:47, Andrew Cooper wrote:
> On 20/04/2022 07:27, Jan Beulich wrote:
>> On 20.04.2022 08:22, Juergen Gross wrote:
>>> On 20.04.22 08:11, Jan Beulich wrote:
>>>> On 20.04.2022 07:57, Juergen Gross wrote:
>>>>> --- a/xen/include/xen/iommu.h
>>>>> +++ b/xen/include/xen/iommu.h
>>>>> @@ -341,8 +341,17 @@ struct domain_iommu {
>>>>>   /* Does the IOMMU pagetable need to be kept synchronized with the P=
2M */
>>>>>   #ifdef CONFIG_HAS_PASSTHROUGH
>>>>>   #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)
>>>>> +
>>>>> +int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>> +                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>>>>>   #else
>>>>>   #define need_iommu_pt_sync(d)     ({ (void)(d); false; })
>>>>> +
>>>>> +static inline int iommu_do_domctl(struct xen_domctl *domctl, struct =
domain *d,
>>>>> +                                  XEN_GUEST_HANDLE_PARAM(xen_domctl_=
t) u_domctl)
>>>>> +{
>>>>> +    return -ENOSYS;
>>>>> +}
>>>> As said in reply to Andrew as well as in a number or earlier occasions=
,
>>>> I firmly think that this wants to be -EOPNOTSUPP, not -ENOSYS. Views
>>> In libxl there is an explicit check for ENOSYS being returned for
>>> assigning/deassigning a device, same in the xc python bindings.
>> Urgh.
>=20
> Honestly, I wasn't particularly happy with your push to swap ENOSYS out
> for EOPNOTSUPP.=C2=A0 This shows plainly why it's a bad move.
>=20
> An end user doesn't give two hoots about the distinction between
> hypercall not supported and subops not supported; they care about
> whether Xen can perform the requested action or not.=C2=A0 ENOSYS is the =
more
> common way of signalling this, and having only one errno value to check
> is better for everyone involved.

End users are of little interest here. Code looking for ENOSYS is what
is of interest, when the meaning of ENOSYS is quite well defined as
"system call not implemented" (which we merely extend to "hypercall").
Anything smaller scope than a major hypercall cannot possibly be
"hypercall not implemented". Code caring about knowing one vs the
other should not be misguided, and code looking for one when the other
is meant is simply flawed.

Jan


