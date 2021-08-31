Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF23FC9B2
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 16:26:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175833.320189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4i4-0000ZD-Rz; Tue, 31 Aug 2021 14:25:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175833.320189; Tue, 31 Aug 2021 14:25:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL4i4-0000XP-Oi; Tue, 31 Aug 2021 14:25:56 +0000
Received: by outflank-mailman (input) for mailman id 175833;
 Tue, 31 Aug 2021 14:25:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zqic=NW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mL4i3-0000XJ-QS
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 14:25:55 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 58f4f0b5-0a67-11ec-ad44-12813bfff9fa;
 Tue, 31 Aug 2021 14:25:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2112.outbound.protection.outlook.com [104.47.18.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-jjs8IFFyMcqy4hUZs2Mjhg-1; Tue, 31 Aug 2021 16:25:52 +0200
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5905.eurprd04.prod.outlook.com (2603:10a6:208:125::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 31 Aug
 2021 14:25:51 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::4822:460f:7561:33bf%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 14:25:51 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0271.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 14:25:51 +0000
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
X-Inumbo-ID: 58f4f0b5-0a67-11ec-ad44-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630419953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRtawFD5AaVLaT6Vrfr1hq9HW+U79Jj78hal9efopIY=;
	b=i8PULXUYmBik5bbkDdQrg0drnCpkkMH9VEZ6dpZYRL+11mZDoQBFENHzIUwsOna9+yR/Ng
	E9nj+phMGtFAr4YKAkf/CBeBPiNZMUNAKL3h+qd4ve7IeBDMBLBZDrwQaqRuFyS7+rGrs0
	Ch+ce2kvvGDsOSHdG40xJn+Q7S9TPuY=
X-MC-Unique: jjs8IFFyMcqy4hUZs2Mjhg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHSNmLMqdcv/jHFIfteYaW+quY/OuIYRdw+HeirZOboF9y8shV4fRByoFkGXOB8tD1Taxu4Rs4McoGEipIjNq3BXXqFrc3u4bnFxa9H8GViHu5JJE2P6gywGEuUjNxLOXZYqZxCf6JDDeIZw7V8Ng9SVtHKin1nAks/F7YQWGq1cFUDl4wK/n89JJZ9XKecOpUd3PvUcs1lW1uoCZA/gXhZvQH59lCeppHcs4G1qzUsaXLE5a/h96Y0o4ZDT7+24FzJRgGUgNMCbFkZu/JWmxUun+zqpInils6UAVX1/qj402EXWYiOho18Yo1z0n0+P+XKPSnEPElqM7/qZDzcRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/4PAPFzahX5ZZq/XpFDgg9zbHBTXaNrXsQGd7kupnw=;
 b=Or8Pv+0lunS0XX3fvFJ9vXqSXJ6pTYaAfxOEW4uN5/kJxBY90nf1P/iqh/H30mgIF/gpxAqqe4EKLAL8kzz3m2MgNAsC3XqdATFXqONL7CHzDt06Fb62KtThiHIASzfCO8/cE5ZFZchkuM0Hn2EvSvrf5f8ZrGKWIfS2Ca+ubDiMrIAoWwnnBwPI8KUUQPFYE6Uz/rbfN9+2huu/q537SUH5TRNmC0YgVYLlhpF1119l1pLduaPeWZF55ubhMwf28VOfQZORVKfPHmdLwur4hbiTyUTRCLNVNgFIF07uhkE2NE8dK8mMqhNnsVi3SzD/UhYrW7fTSqQT0aF8Wxgzfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/4] x86/PV: properly set shadow allocation for Dom0
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <35864b86-ae6c-f8ee-99df-cf78751d275d@suse.com>
 <0f00a4fd-47c2-8ba0-13b2-2210d8b4e0e2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b07f0c48-67f5-edf7-eb60-a99d95a9854c@suse.com>
Date: Tue, 31 Aug 2021 16:25:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <0f00a4fd-47c2-8ba0-13b2-2210d8b4e0e2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0271.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::19) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fff59bc3-a903-4439-3a70-08d96c8b3c32
X-MS-TrafficTypeDiagnostic: AM0PR04MB5905:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5905240ED5A099385D632868B3CC9@AM0PR04MB5905.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jUysPymAeMz+sKxkLlYs5KfXxmeJaMzr5xZf8v+OShIwJINR/HOByNSa7eZG4SozzQMXKXrlrCjzb6e4TW+POQcNCASSRwaxokX9UeS70uPqzd2UP02YfIS2Gqg+XFApLtQFRPI/jjFm0uZUOrpyVaAbU+UU8DqG/in/opTLCxaQDrkWRun9hXpJ0xKAWoe46hxBJ4byFPy4IgyurxmZePtjo2zHPt9JlccFZ+qnwk0Fs+YCXqA9s3S5hmRhqLIvoHFWPWuw+a+GiyeNenECHeJhCtyIsQ2XdYeMIf4uwAe5S9nyF7cw0CWMHeZICUT42kNEzkTIH4C5BWj6J0cWpGXsnSi+5cdQqfk7uf6Sj4u7luN2SQ98gWNsNwDvU9btu3+RZlDF/k7wy+gFnNW8WhGtJmCXQTyuWo3tyjQ8ssxsjUy7m0NY0GkzfEQvPzpmVtq5V46q/2ycv3SFlvZ+rl4HMYxvSh6Y21EhVw5YFefFuxhnyVETGCpxQpiMkSTUr8kgdPgyUszFpzzUcf12ZthAllWhsj5VjU91H906FU2pQZmG99/wst+868Yu0j11bHnAEmJwC7n9SL/kGl8PKEAAIuv50crcclrTHtc46sd+VkFeTk0RA2seUckJQEoecp4PqHSD5qH/dHU/Mk9+0IHEWSfauSO0hrrT/WyN1lIiz9EYiTmWL6iOOS4dXHkXhXNZuVKBe3TDXhG66/wqV2BxiEXx6P7JryAVMeuOghw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(376002)(136003)(39860400002)(26005)(38100700002)(2616005)(31686004)(53546011)(316002)(478600001)(186003)(956004)(16576012)(8676002)(31696002)(5660300002)(66556008)(66946007)(83380400001)(36756003)(66476007)(4326008)(8936002)(54906003)(6916009)(86362001)(6486002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zXW+xoZkXPFzLJ+JHcmvrif2P5Ac4BRur9fqoWCkd2bvsVLnXncqH8wf/XMj?=
 =?us-ascii?Q?SsQTe7nFxc9PaKB5TgUHlzF+lAh/EQoX3+6q6ekyGsIUKN93dPPtNmSp/EWr?=
 =?us-ascii?Q?cOXSNLpY+ms3GSp7jU6KuH5dV7OS0WNkNGJa9hg7TV0Veyl6wjM7rZvar8qM?=
 =?us-ascii?Q?KuuVLAzqJLj+1jHjJHd5k4dHIQqLj50DPEzAyJ0+mqFHdjfjGAu02i6qDoEM?=
 =?us-ascii?Q?Sj2PKVFnJvp6qmxJ0KHBDlbICoPpnec7rcMI3WdGfGtOMmCPvf+PgqFXfLg2?=
 =?us-ascii?Q?bbkLM4ZfYH3O69gFssikPQvEogjyICWWj4cqR6v2kijE8fMB3DMxHsMicdwm?=
 =?us-ascii?Q?wPE2I2+pXHCdqIvmG0zxHWzhPmtrndsPPdxFUPmOzKqMxQRpw3ArWFZSw+VN?=
 =?us-ascii?Q?WCgsf5+8FOR6ROuKBdI2WqJkUS3soAEeM6W4sQOzD5I8RDQIQAfLFYTihOva?=
 =?us-ascii?Q?V4moxDmZ1aPUCF4jJiieaM67bx6d/wfA76ewzYyxP7I7/lhForbcAq60yBjj?=
 =?us-ascii?Q?LjSbZTBbhTaLD4m+53RY4d0DWtrXlK1g7d3kh55qClBgczmWO7P5HvdIDxho?=
 =?us-ascii?Q?iZ8S+KIhLsMCY2RcVKf4g1wS6Hr8K5DkPKzKrCWr5gjjuc12Xj00LeB17dh/?=
 =?us-ascii?Q?ZNXdeHcX8MlDcxu1nJvxAMquobvmZ1+0jTkgQVHLa60Oy+UId6vhZwbcbR1W?=
 =?us-ascii?Q?F5UQevpdAgdjVHreXDM7DivyluA3A9fSuWh5o4lf8+9nGqxCmOBIktkOsUmX?=
 =?us-ascii?Q?G8J+yK0BTvC5zWXE9833Mv5lEvCRHUPgzq4Hngx3ACQLWrZd8Shg/WFwt8Dv?=
 =?us-ascii?Q?AqHniFZy/nfKsxkdExv2xdRQ0FZIzErfpbd6ruo4/V/MgsYKXRp0InB2HzTF?=
 =?us-ascii?Q?OEN3hNPY+RLHFQfQ0CPR0fG7IFDwXi4L1W7BWcvaV2t8Ar3H0n1whv4OnkS7?=
 =?us-ascii?Q?QS1j5xUEQRS7XNofUAjS8gjPwOi9aaIa4YhfvkjAH+hY8gX5t1MzIWPligkA?=
 =?us-ascii?Q?dG3y5YDHhpDMDGNwIGIIC5VR/Dq4fX5byGDqpmZZHnk2Be2m6x1/vGwM7WUY?=
 =?us-ascii?Q?yo/Ach1y0a0AKcXvWQrudr64FfpTU0VB7+7zQNKFsBz3HGxz8n9p6UJl76B9?=
 =?us-ascii?Q?gU/nHCHF1xluck7vq7yC3n9MXd7hCkArubcqPt/Nw4Q2g8cxlDfvyhanMDvj?=
 =?us-ascii?Q?GjCniYMlBCbY20gXDlvk6eSmQAaNGqPqN47DAGdN/nrpYRR+l/0mi50Y77oj?=
 =?us-ascii?Q?mrEMSv4eoDJ/X9WLLygCNsZdwSKeXvJPGdjIy0Bu5PvRnvmJCPzOodSqbqnk?=
 =?us-ascii?Q?wCij7kUQDIXr4QP5HIy+Fpsp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fff59bc3-a903-4439-3a70-08d96c8b3c32
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 14:25:51.7003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN/XNpc2ywecPqpvCmQkVbS0qK3XrAQN2xlCcZddYhsuUspvgtlN/yUwETt9RNWUT6j+Lc7YbwO13TDvRsgEwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5905

On 31.08.2021 15:47, Andrew Cooper wrote:
> On 30/08/2021 14:03, Jan Beulich wrote:
>> @@ -933,7 +934,17 @@ int __init dom0_construct_pv(struct doma
>>  #ifdef CONFIG_SHADOW_PAGING
>>      if ( opt_dom0_shadow )
>>      {
>> +        bool preempted;
>> +
>>          printk("Switching dom0 to using shadow paging\n");
>> +
>> +        do {
>> +            preempted =3D false;
>> +            shadow_set_allocation(d, dom0_paging_pages(d, nr_pages),
>> +                                  &preempted);
>> +            process_pending_softirqs();
>> +        } while ( preempted );
>=20
> This isn't correct.=C2=A0 The shadow pool is needed even without
> opt_dom0_shadow, because some downstreams have elected not to retain
> upstream's security vulnerability in default setting of opt_pv_l1tf_hwdom=
.

Are you suggesting to set up a (perhaps large) shadow pool just in
case we need to enable shadow mode on Dom0? And all of this memory
to then remain unused in the majority of cases?

Plus even if so, I'd view this as a 2nd, independent step, largely
orthogonal to the handling of "dom0=3Dshadow". If somebody really
wanted that, I think this should be driven by an explicit setting
of the shadow pool size, indicating the admin is willing to waste
the memory.

I'm further puzzled by "not to retain upstream's security
vulnerability" - are you saying upstream is vulnerable in some way,
while perhaps you (XenServer) are not? In general I don't think I
view downstream decisions as a driving factor for what upstream
does, when the result is deliberately different behavior from
upstream.

> Also, dom0_paging_pages() isn't a trivial calculation, so should be
> called once and cached.

Sure, can do that. You did notice though that all I did is take
PVH's similar code?

Jan


