Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9487321C04
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 17:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88203.165744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDdr-0004N7-Lh; Mon, 22 Feb 2021 16:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88203.165744; Mon, 22 Feb 2021 16:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEDdr-0004Mi-Hq; Mon, 22 Feb 2021 16:00:59 +0000
Received: by outflank-mailman (input) for mailman id 88203;
 Mon, 22 Feb 2021 16:00:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3rhT=HY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEDdq-0004Kg-4r
 for xen-devel@lists.xen.org; Mon, 22 Feb 2021 16:00:58 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8edd0a69-da3e-44c1-863c-5d4154122083;
 Mon, 22 Feb 2021 16:00:56 +0000 (UTC)
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
X-Inumbo-ID: 8edd0a69-da3e-44c1-863c-5d4154122083
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614009656;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SfhWJERM8VMjLdeL9m2QrAHCx8VmAP9Id6a8RwnXkVY=;
  b=htKw/ipb/Ilfth3fzQJMqn6vNYZ6PxFSLvqPzJKstIsOtelnaY7SCZOi
   3W7SZ++Fwmyz5fQESsOiKb0MW/6NIGZQoYH4d+KXNZZrDAr/9naTlbbrv
   hDQWwwA4EIJRckE3S8CpFfgbejdKIPamy3PAVMsXCmrod+TsU1M144JWL
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: HCd/iBAf1l0DUOCyhHAIDgHIeEuaIKtyPscas30o7OliN2iE+5khxwz4mshOhjy56VyfKV4Uau
 hYU3ZommW53wHlL/GrHg1UC4B1dxBiAbrFhaQPZXJXbKZfdmFTQPfZAhAQ08N7iqcZ+qiTHwBB
 7JLdl/DnHy/t3+W+77LuIS21eYghQ24EfHmLWHP5AefTaA257p+VtsmI08lb6ZKBo6ODLpaOGp
 rL91DygK8JqwzW2JWdNohD2XxLQuhYnSz9tpNW9ItwMUvXUU/gR1Gxyvo38eQ+Dk2DzhwpAmRr
 Ijs=
X-SBRS: 5.2
X-MesageID: 37769223
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,197,1610427600"; 
   d="scan'208";a="37769223"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAFvJP5cwAxJASgWpE+4apIJMIq5Na07us7E/PweJTDsuCXaECE2y4N8H+5BzMSU+lq9/McrLCQxdk6Ukp1CzOGaRf83/kG3Bc2u7YGU/8tj3/vSzw2sY/CX8cpHSdaf7DLBIHWIkyVGeY2OQCOl455gtNTvJl03RHbI96gdXtBnTFp9ECOUDQUWwiSFIEv94WmTMhx5LTeZ1WubbzGipS8lgu5MHooFSN5Vxu6qqHzZEQUqgu/A+x+odA/DqGMp0ouqEx4XkNmipvAAk+FyJgyK9sGtIq6qIq4WMdCKimB/n2w2txVzz0+glMKZk3UUCbXuOyoj4zNoMpP3Kz+zcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfhWJERM8VMjLdeL9m2QrAHCx8VmAP9Id6a8RwnXkVY=;
 b=fqG04hFyDCxQl5zGI1jvjdVecn+X/9Yl1FkO36W+q3AsmOWcXZ4I9Tj/vAfmRtwuS8Y6FLOdlQBEoHgbm/fGUUfKEOY0i6L+T234AOsDJdI0vCrxcv7nMA+7InWYpxGyHs1u/AOa5kTaf3250ClmZdPkNOvysKaFJau0JYPpP5/SNffXQ5ew5huz9wlsXslzY/ixtjs5lO38wsRvS/9/8Hgw+20EaJXyFIFpFUCiQyHuO3qY4T5tnPQvfP34PgPz8/q4LpayKeOrCJKw/NQ0hO+Pdi1MtDmiJXiR2p3o+4YBwPQ2FKA/ASDywDGgJpno5brzeKKp4CVBgt5j3SRzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfhWJERM8VMjLdeL9m2QrAHCx8VmAP9Id6a8RwnXkVY=;
 b=sAAKVWoSZH/xIRL7oUJDy4RwIhxXpEWFRSKUDb+z0GcR/xcyVi/e4DyE+5aNH7megn6qYptrVFF9ssSyS9LwMNYaSO7aVbXgFk2DcCAk+gyWSXQpSnpKlJu5uc2ZQn4lKPaitJImS+Lp0Xf8EuzGCxJ+RWOY2BDD6WvbcADgQq8=
Subject: Re: Stable ABI checking (take 2)
To: Jan Beulich <jbeulich@suse.com>
CC: Ian Jackson <iwj@xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Xen-devel <xen-devel@lists.xen.org>
References: <68c93553-7db5-f43b-b3cd-b9112a8a57dc@citrix.com>
 <78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a2acb45e-244a-2786-391d-c6ee7d267cfd@citrix.com>
Date: Mon, 22 Feb 2021 16:00:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <78eec55c-ac2c-467e-0a2c-9acb44eba850@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33297024-2c8a-4190-581f-08d8d74b0701
X-MS-TrafficTypeDiagnostic: BYAPR03MB4485:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB44851549D40094E6C058D23EBA819@BYAPR03MB4485.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 97rW3+3LEFn5rfIp9zgsFryPkPQWR8ICj/2FA1sn7rAkS6ouyGDbPE8vbLfvzigSeEHhhMR6v2d7m0DWlun6YqDpODNWJoWhzDEsvVRR6T5Lu2vC1HmbufnwBosCrsxkZEp9zGp+TZIWmq5Cq6ar/4P96z2YmF6iiWDrTPDcS5eXSaQecVjPUNFcRmRnMdCkEMDMfCRi0/DAN03DRFdy2truGKmAcMoCikgYCzzCvtHQume3eFuh21LAXwhPD468oDojaJ21ta/m9kR/FuTrdVr3CmMVQw3rSkR38PO3OxDKM5mSWXJCf9WhsCa/f129NDasyc5jk6hlHWWgE7q8HVbr+aS61qN/RlMViuLv8U5enfLnkvrSczx+nc1jzKDvd0rofVzjnLteEu6btNjHewCzeMKKQlkSWjsMty5+tjeMh9JxCN5YQBNuES/QU/CJpdvmxMoa9QIuB3TufZyryBqjhb1/Ninf2KLm0XfrGHhBmOBQIQj0DZSx+bhOqCjrv2LWBq4ZMS4c9RIGH5RVljdfiV1HiqG4aCIeskz2/dShK5FvdLV1f1KZa4S0OJfaftw65IUJZbudwWU3+gs/y8EU11PaClkSJRYfHoN1p4o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(31686004)(6486002)(86362001)(31696002)(316002)(26005)(5660300002)(956004)(8936002)(66476007)(66556008)(53546011)(54906003)(6666004)(36756003)(6916009)(2616005)(16576012)(16526019)(83380400001)(4326008)(2906002)(478600001)(8676002)(186003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEMxK2V3enJ3L09oaWFqdGZYT3RpcUVKTzlGb3BzVnJURDVxblJqc25rOHFF?=
 =?utf-8?B?U0hKZUZFSUJtb1k4TDVtSGU1K0NTYU90S2hEeTVIbk5RUDBVR0wwRndVWWpR?=
 =?utf-8?B?WFk1eXF6RS9laHMvTWU0N2M2cVZVZy9HdnpmM0tqczVobytQQXhSb3pITTNP?=
 =?utf-8?B?UllZcTNXUUs0dkQ0L2Yya056aEx1Smp5QUlKZ3FFM1RGbk5EaDZBVDlJRFhi?=
 =?utf-8?B?N0RJelRHVkJaSUpuWU1yUFQySlJvUXFkek00cE8wMjNSRHlYdElOL0xGdmpE?=
 =?utf-8?B?eXAxVDVkRm42cWFzNE1jemdvdjNuRnR1K29hYlBsbHFOZnJEZWRxdk5sNDRL?=
 =?utf-8?B?UktoSld6VWtha2lwVGc3bjdYYWphQ1pYdEhXeHdaZDVMenNGSjIxZFlDNEFk?=
 =?utf-8?B?NTRIQzV4azMyaEhNa3VSL3N0K056NG4xRlJoUmxrYy8yY3ZZQVlaVTNObFpl?=
 =?utf-8?B?QmdoNWdLWm9JOThCcnNreG1YYzl5Q25nZ2ZyMXA3NXNQWXVtMlJpYytWWmta?=
 =?utf-8?B?cG5FZjQvRmQ5OUREdHFJaStiQnFxc2xXeXhQWFBvWTg2TGpwM3N5eWdhRWsw?=
 =?utf-8?B?REMyVXY2OVRCRndveDRIWHliVGdvNVdHRVJWSHJwV00xekpvM08wVHpmMjcr?=
 =?utf-8?B?UzVNYVVmSkM3NGg2RnQvY2NMVHhGc3JRRWxHR05aZHBVd3JRQW5wOGFzbU0r?=
 =?utf-8?B?ZHQ4Z1lzRnBOUDJ4d0p2L2tkK2hMaEhPRkhaK2ZYTG1oRlV5Y0laT1F5VUpF?=
 =?utf-8?B?bkFlVHZZeW83cW1NRGMrd1JIdHIwWDlNbzdyWFhJdkZ3a21JNmJZU1J3ZUJZ?=
 =?utf-8?B?R2Jqbnh6allDdnhyYXlZVEkvUEVDbXlGa2syK1VNcWdjMjN5OGRaSkVJekx1?=
 =?utf-8?B?Q2hVcjJnTGRNaEFwVHJPOXpmbXRrYStGcjQvb3VocTFOZm9pakx4eHgxaDhB?=
 =?utf-8?B?UlcxUUFLM3dzalM2dWxKUTBFWjNMQXg4RlgrNW0zWnZ1dFlrRURnbHErcWxU?=
 =?utf-8?B?QWxwZ2pvcWVmMVV0VFZ6S09zeEZVSU9iM2ZXVGNFZkJnSC9oNnovTGZ0R0FC?=
 =?utf-8?B?Zy9LRG1ROC83OHRPWDBzRHlTWlUxWENkdDB5THUvVnNvalNPSldVNEN2Uksx?=
 =?utf-8?B?VUJIQy9QdktmZnBWL0N3a3NqSkFKcWNDNUpMU3pOeXcrN01RZjdlVW8vTlpi?=
 =?utf-8?B?a3QwclhIOHdIMytyRVlXUllsQ29USk1jQmhQSmFENDZhemRHT1BqeUFKcnBi?=
 =?utf-8?B?cUJCTjBQTjdwWjBDMGhGaDRycWllQmJKMDFnV0Jtd2VvWGEybnFVTnFTaDNo?=
 =?utf-8?B?cld2ZkxTSGdQWXZtTi9iQVA4VlRiamxNNFFKSG5SaldCRmpOYVovWllvMVlj?=
 =?utf-8?B?eG1kSkJWZnV0QXRFSHNmdGRrcU9FYnRyZ2JDQmJrMEtjT3hMak91aUVMZzI5?=
 =?utf-8?B?UlVKMU9md0NqNmMzeDVRYS9HU2JvdFhGTFNlcmdxU2dVL1NTSnh4cURyT0RI?=
 =?utf-8?B?dVBpRGwyTnl2TUtMdHE0Wmk1UWhvK2wyYWpVRGxYSlBoOTY3S29Pd0VxWWdU?=
 =?utf-8?B?Yi9KaTNmenhpYkJ1WmFBbjF0UGVVbk1ZMktyaGhJckNGVlp4OW5LaVB0cGtR?=
 =?utf-8?B?T2xLWDJyaDFRWHFCa1FnZUx5Y0MyMVMxRWUvdlNINmo5MTBCQmw4YmxHMkZF?=
 =?utf-8?B?N2N6dFp0SUdhK3dDNkU1cGpuTHBSSDk1ekRjZE51VldOVHI4V3pmWEhZczkx?=
 =?utf-8?Q?Uo2PWylXNg8nXppuWp8BDz46Znht/0DNmF5XUNL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33297024-2c8a-4190-581f-08d8d74b0701
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 16:00:51.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +x/irqjACryDf1PjGrvhCERHtd6m52e71TIDtb+Qp9X1IqgQmV8bw/mhOs35LkrC9ie/DDNOcViuR9sQNwT05NM03wojBO+l1/U9N7pXP3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4485
X-OriginatorOrg: citrix.com

On 22/02/2021 14:37, Jan Beulich wrote:
> On 22.02.2021 15:03, Andrew Cooper wrote:
>> Hello,
>>
>> Staging is now capable of writing out an ABI description when the
>> appropriate tool (abi-dumper) is available.
>>
>> We now have to possible courses of action for ABI checking in builds.
>>
>> 1) Publish the ABI descriptions on xenbits, update all downstream test
>> systems to invoke abi-compliance-checker manually.
>>
>> 2) Commit/update the ABI descriptions when RELEASE-$X.$Y.0 is tagged,
>> update the main build to use abi-compliance-checker when available.
>>
>>
>> Pros/Cons:
>>
>> The ABI descriptions claim to be sensitive to toolchain in use.  I don't
>> know how true this is in practice.
>>
>> Publishing on xenbits involves obtaining even more misc artefacts during
>> the build, which is going to be firm -2 from downstreams.
>>
>> Committing the ABI descriptions lets abi checking work in developer
>> builds (with suitable tools installed).  It also means we get checking
>> "for free" in Gitlab CI and OSSTest without custom logic.
>>
>>
>> Thoughts on which approach is better?  I'm leaning in favour of option 2
>> because it allows for consumption by developers and test systems.
> +1 for option 2, fwiw.
>
>> If we do go with route 2, I was thinking of adding a `make check`
>> hierarchy.  Longer term, this can be used to queue up other unit tests
>> which can be run from within the build tree.
> Is there a reason the normal build process can't be made fail in
> case verification fails? Besides "make check" typically meaning to
> invoke a functional testsuite rather than (just) some compatibility
> checking, I'd also be worried of no-one (likely including me) to
> remember to separately run "make check" at appropriate times.

As far as RPM is concerned, splitting the two is important, as %build
and %check are explicitly separate steps.  I have no idea what the deb
policy/organisation is here.

Merging some of check into build would be a layering violation, and even
if we did so, where do you draw the line?

~Andrew

