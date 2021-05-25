Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E6390444
	for <lists+xen-devel@lfdr.de>; Tue, 25 May 2021 16:47:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132228.246717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYKU-00078A-GK; Tue, 25 May 2021 14:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132228.246717; Tue, 25 May 2021 14:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llYKU-00075U-D9; Tue, 25 May 2021 14:46:46 +0000
Received: by outflank-mailman (input) for mailman id 132228;
 Tue, 25 May 2021 14:46:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kR7Q=KU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1llYKS-00075O-EK
 for xen-devel@lists.xenproject.org; Tue, 25 May 2021 14:46:44 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50a1112b-7cc0-4514-a115-cd39386f2502;
 Tue, 25 May 2021 14:46:43 +0000 (UTC)
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
X-Inumbo-ID: 50a1112b-7cc0-4514-a115-cd39386f2502
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621954002;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fE/oDfj3ENe2yFenF9c8WjVLqopBj3TLo3USYdrdviU=;
  b=GRJ18v6wlA7aO7+Ejgu6IJtkBuEz25sw2zuq8jUBxfXIqhdW9opVDoyS
   CpucYrgdS853YE2IZQrGXUHe9+rEWt82oW2yypfz10p/0wmJ9M9y+V21z
   xJiJ4ESp5N6cTjblDVFUR8+brmL5yWuPv1T3vp3tsJuJgesrgPxBiDtPz
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: W/6iu7WU4F/CSsQuKW2yi2gzrba/apkelhlAmN+xoRCjGWikefwB2sZX73BVJlpiOksiAAP4qP
 Ay7eC7x9HrTGJ744g6WOcH1ObtQIUdIcwMqNoWZ1rgdC8mJVoc6tEXr48v/XgWAvVOdgESZUcv
 SCnDxqxGj+pN2ZjrOEt2C2EXg81D8ah/PRVVio5Ei6sj38zOJazq/4XoUjllnNwal8plh7M+an
 jvR6oYC7zIX/REm6F+C/yLA3hNZIISl8KgaQo+F28+b6VKEPtqexLre1WTb9FfCD98MoGdL9D8
 LcY=
X-SBRS: 5.1
X-MesageID: 44563902
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:LKiUbaIcw0dnem2BFE+RjpUlxSXFcZb7ZxGr2PjKsXjdYENShTVTz
 GJOD2GEaKmDYzGkftB/at+1oU8GvcODyN5hG1dlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0zrbf65xZVF/fngqoDUUYYoAQgsA18+IMsdoUg7wbdh39Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFks5O6Ew4xAq3VovVAbDZhPDsjBIQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne16TsmdpXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Gts254VTK6ED
 yYfQTlkbSvnbxpqBngwKclhoe2UimCmSwQN/Tp5ooJoujOOnWSdyoPFMtDYZ9iLTsV9hVuDq
 yTN+GGRKgEXMpmTxCSI9lqoh/TThmXrVYQKDrq6+/V2xlqJyQQ7Fxk+RVa95/6jhSaDt8l3c
 hJOvHB09O5rqRztFICVswCETGCsujcaVNAKGvUG6Bi32/frzD+2HDU9Z2sUADA5j/PaVQDGx
 3fQwYmwVGY17uzLIZ6O3u3K9GjtZUD5OUdHNXddE1tZizX2iNxr1nryosBf/LlZZzEfMR/32
 SzCiCEji7gJgccP2s1XFnic2Gn1//AlouMvjzg7v15JDCsiPuZJhKTyszA3CMqsy67DEDG8U
 IAswZT20Qz3JcjleNaxrAAx8FaBvabtDdEhqQcwTsNJG8qFoBZPgry8EBkhfRw0Y67oiBfCY
 VPJuBM52XOgFCH2NcdKj3aKI5l6nMDISIW+PtiJP4UmX3SEXFLelM2YTRXLhD6FfYlFufxXB
 Kp3hu78XC5GVvw/lGTeqiV0+eZD+x3SDFj7HPjT5x+mzaCfdDiST7IEO0GJdec38OWPpwC9z
 jqVH5HiJ8l3OAEmXhTqzA==
IronPort-HdrOrdr: A9a23:ZkMooq4kSlJXKHBbCgPXwfCBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXpVoZUmsiKKdhrNhQYtKPTOWwldASbsC0WKM+UyEJ8STzJ846U
 4kSdkANDSSNykIsS+Z2njBLz9I+rDum8rE9ISurQYZcegpUdAa0+4QMHfqLqQcfng+OXNWLu
 v62iIRzADQCEj/I/7LSUXsMIP41pP2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJpZmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF4N1H0Gxa1e
 Ukni1Qe/iasxjqDyaISFrWqkjdOQ8Vmj3fIQTyuwqknSSRLwhKefaohupiA1HkAgQbzYhBOA
 8i5RPRi3NtN2K2oM3K3amCa/hbrDvBnZMcq59ks5V+a/pSVFYDl/1SwKtqeK1wVB4Sv7pXbt
 WGSvusvMprTQ==
X-IronPort-AV: E=Sophos;i="5.82,328,1613451600"; 
   d="scan'208";a="44563902"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwkkMw2t/l2fxJPmNeIxn3elpj5D30LbYhAOI5ZDSwN4qmzy9T1KFaRbuzrMXWqSLQBYHm0vGrKDFeV52F8WkIlUtEUofniVnCWBS0DSF3JrkbvCHL7QGUaomOO3MrwyGH3QciX7K2+fWv/e09f3osBcENec+B77rRWp45R6eyA+UEqtsXnLwbyk3QuSerCDXd35p1zpIuoiG2Vatw239parG/+K5xjQ8qvWqfu5NyI1oIpZzQxN3kHx74R+AAbk/KvofLKni1t/2sxqvTdaWH6s/q5XrRaKS5gINTZVlIGaiWWuhna24Ja5Rbly7qyXzYGJkEKyiBSfy/E09iDQdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpuN/zhpoeoZJVylGpwX2Sd1Rmw9iWkU/StLL8t8Ii4=;
 b=bjvxAhVDca218xdIqOo+VL3CpxycWAupi7OfyvUzKbJrgf5I0/uFWEIYKIOREDRLEj/j4anxSOS8zg4wO8A97oB7zW9vZ4jknOwT8Y6saiLrb7VGMQZ+CcWnCluh7Q2zvhkWX4V4JOLXBa3lEoHck/lpIvZeExQhJHs7ziB/jb68rIbb3504EhPsOF50WvIduYkolr/vagNJIRHk7PKPmSP0+KwQkQxeYY5Ae+oH22n6EDj7KQ8fjYcgVd9Ha8wp4r9/GJUugja8mIzMiLavwaDKcBDqBCgZLl8U75V3asNMPGHQgCleS8h6eO8jelOVdQ+jn+NkMNXMZ+V+XjoPig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FpuN/zhpoeoZJVylGpwX2Sd1Rmw9iWkU/StLL8t8Ii4=;
 b=hhL4YsZZW7ATBkIjq9v6RWuK3kz+Fqy5GwjAFQ3+K7h2ocSiBu0PZ6coOlZ3YYzHEJvnk35MVs9r7t4+b8V2N75TtECTgwYAOX1Rxa0V0PdWdxbIFudfr/3Wb9UUuDRq5iEJCoekAQ0cpt2RDYhNPMqbV2mFbi7dJgMiqo8M9mY=
Date: Tue, 25 May 2021 16:46:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/guest: fix build when HVM and !PV32
Message-ID: <YK0NykdJeDc9Gm39@Air-de-Roger>
References: <d8230ebc-a3cb-6a87-33c3-ab27bfa17862@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8230ebc-a3cb-6a87-33c3-ab27bfa17862@suse.com>
X-ClientProxiedBy: MR1P264CA0068.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9734477-f99f-4757-46c8-08d91f8be6f0
X-MS-TrafficTypeDiagnostic: DM5PR03MB2636:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2636344EFC1E91D1FBEE176B8F259@DM5PR03MB2636.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:136;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V3WcJq9xx+6JccMCH80rlqXVwGVgQeoD42L8nTs5MpA4iJ3aIINcwiCNrsGVS4LcNEdm0BEfnQxYmRXkKZUHvxmBKHwVkJ/VtTI5wO0UWNB+lAQ4eKPwC8D8BHwAqt5g8+28TYaL56dGadgaFVWjbYJshxm84eC5duqhU3MtY2s41vK9Z9vG672NTF0S8ekn39hzua73ohJxhI6jo9rL9ht1kIWzZDV6Y0fDp2S2JZCRMjZKHf7ChIOwRDGsDQDVq6zjJyAvS8C5lhI/gj/hYPkq/tRScEnWWoZKYFefBdCmJjdNinr7amYZGwfA0CknqRhJPZkB3hPFkBCDbFE9YWmHXCzIcQ7PgCWCfViYVdtz1zgbPUveS/++h/Z3YZts7pXWK1zNWoXNT1iPBBe1/7Cm6Nsz16HZZYBIyXRsbWDcwXsfcx9RtLIobAXJyfOz6MllEr12jZ1iWjmCPMmDaheUnYd+xJRBenQsVPXVdO1LvdKmdvm1NGWs1SH5c2VnSp0ZoBCHOwAOeTG5QtKTosjHZ1K6vVUf3dxWEv5mPS4jiLXNorrpFXRGtJYSENeROWqxhXIi83BFxIJMz+THLP1RePdGJDuvAXvev04pW9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(39860400002)(366004)(396003)(376002)(136003)(26005)(16526019)(66946007)(478600001)(66476007)(86362001)(85182001)(66556008)(6486002)(4744005)(186003)(6916009)(2906002)(8936002)(316002)(38100700002)(8676002)(33716001)(5660300002)(54906003)(9686003)(956004)(6666004)(4326008)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MWtNbkZtTDRlOVEwYkZkNkRmYk5TVHZqVDhJOUR1M3g1OU5HK1ZlNzk1N004?=
 =?utf-8?B?KzlzREN2MWowN20xcmQxb1hOY3pNY0JKb0JMQmxKSlFBV2lvNGtlbEtnYWxs?=
 =?utf-8?B?b0NjVHk5OUJPbXVxUmJvRGVFS0FvSnBDQWptamYwVU5ONGVkTjFtN3liNk83?=
 =?utf-8?B?QmZlcWQ1SnJDYm5Ed01iUnk5bFg0Y0tXMFRRa0RPYmJ4UjNSZW9lRTU5TTY4?=
 =?utf-8?B?TUZ1d2tRSWVaRzVrNE9idTJsRDA2aFEybDlQeTMwVWg1Z1dJTStFVWlic1lL?=
 =?utf-8?B?RlR6WUJqQmt5YzBWZ0t3NHNJZTluSGpyUmRoYklNaFNpdk01ZzM0RHM5bnpu?=
 =?utf-8?B?MHRTblNkNWU1RmM4V0hxRU9aUk1aWWVpMFN5N1pkTzdZWEhmOU4rRk9DdlU4?=
 =?utf-8?B?cEJvRXhObFl6Zk9IeHZLRHR6NnAvVDhsdy9YeklRMW90Q1JuaWJ3VU9tajZn?=
 =?utf-8?B?MUNwQ0I5WjBPODlwN3Exd2ViM2YzMVZETTh0d2VnUk9EK2htOWpMcEJ0RzN0?=
 =?utf-8?B?dDNqYjVRdUh0Z1RuOE8wR3YrazRQN0NtKzBVWkIvTE9DQzhnMVh3bXg3T3BR?=
 =?utf-8?B?VTBOQjRtRHNKUVJTTDJCNXFJRWV4eE9oMEhZR2thTER1SERlNmc5L1ZHZjU0?=
 =?utf-8?B?bjN3VXNSQmFwNy85QmR6Q2JacWtIVFlUeHF1WVJBYUc4WmhaTk5wMkNCVjRQ?=
 =?utf-8?B?Zm1ndTlyQkEzQ21DdDdTa1YvWjBmUXk4Wi9lYWtmRFdPOS9PSysxcmZPbEk5?=
 =?utf-8?B?a0U1NU1KYVJWcnlOYmlZbEJKa08vVGVtMHlLNXJ3YWRVb1RGaGdueUw2TDdV?=
 =?utf-8?B?bDB1aWlxVVgyNmJSdUxWbE95bldRcEJkQk5RRDE5QkhVTWJkMUJBQnl0RzVI?=
 =?utf-8?B?YWdreTZlQ0p1UmxMQnZWQndCUVhmYnJPQTlUZUZ1WlQ2UGdFTDd2SkZ3NUpQ?=
 =?utf-8?B?NUVqSHNvVFllWFY5K2V4TTFpbE1PbXdBdDNtbCtqaWhpcFVYNnpXSWVmdm4y?=
 =?utf-8?B?K0hkS0RrRjU0L3Vkc0VrTFZPSlJRaHlWbUg3WnVNU2paeEJKa0tZZ2p0UkZj?=
 =?utf-8?B?MzFHNmhTcm1IRFptUlZzUlJJYzZnR2lobTRjTzA0d2RwOWRNMG5qNUR1d0d6?=
 =?utf-8?B?cWFmV2h3WkFQYU4zaS84V21QUTNCWjErZ01iMFZXZlJyWXZaakI0b0c2aUsv?=
 =?utf-8?B?bXF1eGk0MzBWb3l3RnNlY1BxczJGNStPQmxKeHl1TS9wbUFiaHhRM2ZZdHBQ?=
 =?utf-8?B?eVhPNmRkSU1yVW5QWG9INE42MjJSTURvanlUVG1GMHYvcXFya2tXY2piUlcw?=
 =?utf-8?B?VDEyRko4RkpveDd4elFTbDlTZldmeVFud29BLzFhUFVoQW5yMzYra3JCK2xo?=
 =?utf-8?B?MkJlUllnYjIza0N6dnBiTk5FMGxoU2V4d29XVG1lRUVZSWV5dHRsVHZFOXZm?=
 =?utf-8?B?R3hhQld6SjlUVHF6ZVd5Ynh5TFFPMllFVTc2VUNwMWlkUWJWQS9aUnF6R1Zv?=
 =?utf-8?B?VlIxaFE4b1FvR09Ha0Q3Nk9FMEdmWWlXUTNMRFNtRkhjTkYwTkdScmhmamdY?=
 =?utf-8?B?QnFVRlNmTStNQXhHZ2IrbWVUQnhHMWNNT2FFa3J3dzFoNXhIaUlLdElKU2xU?=
 =?utf-8?B?UWMyR2JMS0cydkx0alF1aEtCS0JkOVN6QmIrTXJzaEsrNVR3c0xsSWlFYy95?=
 =?utf-8?B?MWxtRmNFaVNqNEg4ZHFtVmFnT1FiaE1heUtuUEZ5U1d2eERUc1ZZdlY0SC8w?=
 =?utf-8?Q?iph7/1l/0JSdH9LcNmNWwwQyDZZ7pmWQP41n//z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9734477-f99f-4757-46c8-08d91f8be6f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 14:46:38.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/PDPJTPAdD8iNOMVEyU39YMbB4qQIChAHZ7DSWCYRs4mRSad2qZ5jFWONYk4Lh+igQmd16qWNwYwaMcoz98cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2636
X-OriginatorOrg: citrix.com

On Tue, May 25, 2021 at 03:20:56PM +0200, Jan Beulich wrote:
> The commit referenced below still wasn't careful enough - with COMPAT we
> will have a compat_handle_okay() visible already, which we first need to
> get rid of.
> 
> Fixes: bd1e7b47bac0 ("x86/shim: fix build when !PV32")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

