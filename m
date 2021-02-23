Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCD23229CB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 13:00:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88732.166990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWLn-0004Rk-Ib; Tue, 23 Feb 2021 11:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88732.166990; Tue, 23 Feb 2021 11:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWLn-0004RL-F9; Tue, 23 Feb 2021 11:59:35 +0000
Received: by outflank-mailman (input) for mailman id 88732;
 Tue, 23 Feb 2021 11:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEWLm-0004RG-Mp
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 11:59:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463ea0e6-b92e-4de0-8ace-99c949fea1c5;
 Tue, 23 Feb 2021 11:59:33 +0000 (UTC)
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
X-Inumbo-ID: 463ea0e6-b92e-4de0-8ace-99c949fea1c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614081573;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YbC7vBfeYp7nhA7rfcbAxrSgOD11tHtXxR1jIsRoxiU=;
  b=R90DnHiLrO0b/1ww1XXwcTP+ENxgyQVcf3BLDpCMdeC3GrzBZdOJyESN
   NAmV7uvfr8pEFNufT3mdncS57zl/EjO+bh1GPHDFwHH8VyXZbsEplc+4U
   IMO52Y8bunVg8qfnspElolWTlU9HueHFKwVzI/h0w26+QfawxCDALyefr
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GJXlDHAIaSiqFMJuEh+pJtz4EFwKOXOp/isyF0Usi8Vd4JTbdMIQ8vLKCObr2ts9uy8MCqsChZ
 PozHbRL8+3W2VSSWP+Sycap0e+iGe1PXW+gpHtN9oDb4XtTU53M1xorxz/YOrnBNLnLDzvUQp5
 0rnu/5kCpz8kvS3WFGzhZwa5yIzFOXCF3+HvPCgRA1F65QZDs1y7M01lHYsXEPjuRMfc5zgEqd
 SYa9cxuQb4PBHYi9s9pk5zKAVNJdlr/j5Lczy6qT0iX+BUS60NhDTfPvGzRp3FixDm7535rIHQ
 DSs=
X-SBRS: 5.2
X-MesageID: 38185196
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,200,1610427600"; 
   d="scan'208";a="38185196"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fiqMMfv/tcU+mp7ZOjqHqiYX+o7Z6bqZJxdeTlNH3gQhTd0ViarmAz1uXoPgVuplamXPinKNRVpbnzUjVyJv0xP5uKKDEb3Hyl9rNuhy6mfPqXAg5BL8whilIkDzFm9CPtloYXozDHjaxRg6WdherQbjCqYYoS1bGsqckqQ13GChW++swF+uvPjwoWXzTq9HANRI1XtBlSAcSMgqee0S0s9g3vbdaln3gKylfYzUB5uH06lA4aA+YHuCrVjzb3WmCjwwgCSnHky0vj+4pYwoGdtHZfujNuNoBP9MI/NHpED7NcHTFqErqAh5sfIdn0rruwDb3TL7tTsj5z8hfVX3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgO7JImBHK/SXOfsGbqi/TqQyoKGxJPlNWajPWBAOuQ=;
 b=HDiFvPb9ciEHNRUhhgHzcCLq31mbKEatXbn4sRho3nfFH6a5rmNOXIwNX+BJEjKWkk03b1LOhVGGEoAvy/bCGA165oSxuJSP2R9cb2OxzpCxZNCVsqwwLIcLwjSpDRHO05EX/bZ1B05xv6UF7TMgdN9dGJvHbZeu5dX8d9ULz+6iILDi+4kWfRvdMRDoJeTLbhUYA+hnL3Bi17NunG6ti9mi+Z9g97DJEyxxGrXsdNTvJLfdtnAKV9s9kBVrcUqaqrqc8YZc2RQhXX7qY2ho0s3l34Yp6HYMOb3dYZyvzwiDkj27fFAr/Kaw1VrUF5IYmI11poLs+e615U7I1TwpRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgO7JImBHK/SXOfsGbqi/TqQyoKGxJPlNWajPWBAOuQ=;
 b=LQFkq5fELO10g4MdHfRD6UExidi3GvUeN54CkV3MMKR4LAn5eJzgTugKGIBmmYhh6Me30GOJpUqYLXuXmg3z6X8ghAcTphwxuMuYcLe3OZ7mgC69+LzAaTwjO2ZDCw2N7rqxcPvsRCcmco7CmVmli/duolPFWZU3jZMdsQxzqXE=
Date: Tue, 23 Feb 2021 12:59:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 8/8] x86/PV: use get_unsafe() instead of
 copy_from_unsafe()
Message-ID: <YDTuGn8YWRrWlbS9@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a59ae2f-448e-610d-e8a2-a7c3f9f3918f@suse.com>
X-ClientProxiedBy: PR1PR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::41) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6ee5426-577e-4787-1db2-08d8d7f278b9
X-MS-TrafficTypeDiagnostic: DM6PR03MB3738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3738802ECDA2AF8B7A87F8DD8F809@DM6PR03MB3738.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D7HcXHOKXegJTc27cjQcO7cBQ/I3TCxb7qCKfQyyeiGONDHdUrdreTEZOfi85/8I+oZ4HOOOMgD+cvS2/MPn3Kw9788b4eSRlNMtU4BiZLw1EGkaMHsdQDW7ZNlGzQ+vhN469JalVF6dg4Hki3Lprcdw6Cgr94dupfMMXJQxJD78F9aNqNVK/E3cUj4IJJk2HikwFDmKn4xqLs8T1u2uhmKntgxZH+3Qg7OXVQbK/XQw296T5GVgac0b7vb3TWw2f3G9ClQ30ym+ZK5JRwVSsVaAgzM5ebWTB5pVaM7fw2q3BCwPhkWa3u7pJnntoBmFO0LLgI2XOOifFbrBlQenhBXrDbJj2sctZ1CbZBsSzmkiMC+rsZHOV9y8jCOs+ksUukhYoNpve2X7usVu02XYAYfSS8x1w5pYOQXIquntROdakoq44z+YPJUXb5tXpAwBN94uKH7aJMl8VTmAnRWLRn6kUcLpUKrjUPkkg2BBuB2qoiDmNTHaa2Z3L0bGy6Hqln1NaJepf+Keb9gGU0r6IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(5660300002)(316002)(85182001)(16526019)(8676002)(54906003)(956004)(6916009)(66476007)(8936002)(186003)(2906002)(6486002)(26005)(66946007)(66556008)(6666004)(9686003)(478600001)(86362001)(33716001)(6496006)(83380400001)(4744005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eVlMdEZuNlFDN2dhdmxuaURmaTdvLzNGVW1DY3R0eU45M0M4SHRwekt0RFJw?=
 =?utf-8?B?bXVtUHJiUnlJNGVSQkhwVTlwZTFCWUtKQjRkV3Btak1BblFaWGQ5aHcrMUVD?=
 =?utf-8?B?SkRsNHFOMW1RK1RVVitSc2g0bFNmUHUzSW1HKzZJd3ppeU9kQlpJUmRCS3Bk?=
 =?utf-8?B?Q25IYThhNXRZUTBDWHVFTWV2MFVULzkzdVgvQTRQU0dDcjc1RVZoNVRmQ0M5?=
 =?utf-8?B?a2V1Zk1GbzUrZTNZMjdNaE9LcFpQbEdWNkFsYWVJQ1BZR1loaUw5WnhYNHU2?=
 =?utf-8?B?K2VqTy9ST3pPMVFGdG9WTUtWcGE2QU83RlpKNTkycnJhWlVkUDQ5dWtMb2pZ?=
 =?utf-8?B?SkY1blpCQnlqQ09tVmUrNkNScU1jS2NrZ285QjU1ZjVoNlpCL21CZkdOQllB?=
 =?utf-8?B?SmMvOTF1K2V2a2txaFp6VGVZejZnWkxKSUpOc1BFeEhlNnhGRDQvS2hBU1Mx?=
 =?utf-8?B?MzRpR041VDNTR05EdmJrdVQ1cXIweCtDS2V5dUIveklMWkNsLzVjUWM4dCth?=
 =?utf-8?B?cHg4QW11TjFMaG9VT3F5SE9zUzI1akRSaU1YeFhHRi8vdGJsSG8xUUxocGRZ?=
 =?utf-8?B?b1FRY2dOTHhBU2FZYitFME0wWjF6TEczZmoyemRjNUh1Zkp3M2FqZ3phbXlx?=
 =?utf-8?B?VWcyVDNtajhKdllveHZYbzJOa3BQekJJeUFzZUVyWWVlUWlOZks5QjBibFA4?=
 =?utf-8?B?UnBzc1p1Y0UyVU1HdlRTelZRNzJCdXRUa0JnL0w4aVJmNm5iTnF0TGk2a2xP?=
 =?utf-8?B?aTJRSEtvRHgrd2t1Z1NNVEtsUitieHFodC9iU3N4by9zVEZQQUlsNU9UOXlr?=
 =?utf-8?B?V0d0enNuQ1pZTUdJbVhBdDlrMTlyeW9wcFFEc0haRGVJa29hRVhOakFnM3E1?=
 =?utf-8?B?SkVPV3plU2VEUWlkYzlYQ0I1YXNubWFBMStuRmkxZmN6dnhvZXNNSWRITFJO?=
 =?utf-8?B?dnI2U2JlMW5LWFpDTnJmMG1nV3prbTJxeTgzc095M0U3dkZMenNFSnB3OGZz?=
 =?utf-8?B?eksxY2lpTlJsdEpwM0VnMG5Qb054b0JMck5Ic0szQ2libmZET1ptTE0reURx?=
 =?utf-8?B?SDFYL21sYlM3U1pMUFlOZk9CUEdyamU5ZmlSKzBJQ1NuUWU3WkdqdnMrRUdj?=
 =?utf-8?B?eXlISXErSkxINEk5c3pSQzN3Q2FZMkRGdWVvMzZFb0Nsd3lydjBlQzFZL1dD?=
 =?utf-8?B?RXJpcktnaUJDbFZXdkRLTXd3cnFKSEJxTU9XRlpFTzVTMU5pZkRieVpZSUxW?=
 =?utf-8?B?dlNSbFZEbHJzU1RJZEg3SFAwN3k0bjdZSHdkVVIrZjRqZDFadFdwL1RuN1l6?=
 =?utf-8?B?dFZwMW9KYkNCUUhqN1prN3NEVDhiVzN1bU5vNmxJN0JPejFsTk5EMHp3WEdo?=
 =?utf-8?B?bEM4ellvbDEvUlh1K1pkR2dWRjBVRzc3Znd6OTVvNlNKeGo0aXVGTnhEdVhs?=
 =?utf-8?B?L0FrMkNTZ0FQaGxFYmNVc2ZnLzZZNTQ4NkkwbzVMK3kyb3VURTExamdqcC9C?=
 =?utf-8?B?Q3J2R1Qyd0dzU09NMDhLdEQ3RkJkNU1FWDQ4bDlmVDRHZTdjeVU5Q0lGU2Ns?=
 =?utf-8?B?Q0ZEWjNDdlFmL1lodHBvR3ZYQkZxRW5qVlhTclVxTy9ZblNta1BRcTBWbnN2?=
 =?utf-8?B?Tk1oVVJMU2ZDaEU4L2hZTTB6Z2haSUpaYTJwSWhpWFJVbFMyaDVLeHJ4aFRO?=
 =?utf-8?B?ZVp5TWhLWnB3SWRlTGRiM0JiVWJUOGVYMFBXRXlvdzd1bHlETlpiaHhPSFhP?=
 =?utf-8?B?ekFvZUFvR3BTTHB5emRrd2d6NkJ1YTBlNU1kbFRSWlhUVW42STJuWFJOMVNl?=
 =?utf-8?B?dks3UGdvdlFmb0EzQUVndz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e6ee5426-577e-4787-1db2-08d8d7f278b9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 11:59:28.1565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rqiceotEpL+QIaHU9zRTslnf1GFiWm6F1OFS/WRJB4rVtF6wH1aUeDI88wtWkHXae8UVURL9VI758CtmGZxbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3738
X-OriginatorOrg: citrix.com

On Wed, Feb 17, 2021 at 09:23:33AM +0100, Jan Beulich wrote:
> The former expands to a single (memory accessing) insn, which the latter
> does not guarantee. Yet we'd prefer to read consistent PTEs rather than
> risking a split read racing with an update done elsewhere.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Albeit I wonder why the __builtin_constant_p check done in
copy_from_unsafe is not enough to take the get_unsafe_size branch in
there. Doesn't sizeof(l{1,2}_pgentry_t) qualify as a built time
constant?

Or the fact that n it's a parameter to an inline function hides this,
in which case the __builtin_constant_p is pointless?

Thanks, Roger.

