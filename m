Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC2A317154
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 21:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83710.156491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9w4D-0005df-5x; Wed, 10 Feb 2021 20:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83710.156491; Wed, 10 Feb 2021 20:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9w4D-0005dG-2o; Wed, 10 Feb 2021 20:26:29 +0000
Received: by outflank-mailman (input) for mailman id 83710;
 Wed, 10 Feb 2021 20:26:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=08uA=HM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l9w4B-0005dB-33
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 20:26:27 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 573f853c-e5ed-4250-aa1e-c70901ac5a64;
 Wed, 10 Feb 2021 20:26:25 +0000 (UTC)
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
X-Inumbo-ID: 573f853c-e5ed-4250-aa1e-c70901ac5a64
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612988785;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lP5KMHlh5fAjRnXf9xvgb7P9qjltwPFN2giLnMpQCbw=;
  b=OC9z0nR7V15Erp9mL1qTJQi9XalqszqXrv+D9nCF86kZXBwjDsqyLvZB
   WdX6gTvsx7kHj9z+AVY+DDfFOc/9S8NyCUnOYTBPEGNgH2Ezr2gW0B8aI
   Pzk09ZDnrDMACP2pVqyfdZCmoD/HcQUPo/g+2KhMmpPe+GWjJg3c5VVMx
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DBHDTUI4HcDm5gOJojwfNs+OMAz+pM3QPKtfn1JzQOLz1GRDq18rPAIDhf+G9psVj7oR6g2fSk
 rEYqhOgGRtQIIrD+vgxpfNl2d98/8owlIP0W5nGySjB9+lII8CcVsQuBRADQUctePrwtcWfx7e
 uhM6SpjFBaZvxfPUDkzJUjKWMgjoRucEtN4UR7ZKxBPzjbaQ6b6GNk2tX736pMO9uRsl74C+DO
 Q58u7/PzOmTkjRo6FY5KyH5rXsc5hwat46yUBTLwQIhGmRWCSxvmkujFAy6zfUCvJTtRHLDhO2
 0j0=
X-SBRS: 5.2
X-MesageID: 36989356
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,169,1610427600"; 
   d="scan'208";a="36989356"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kq0/HGKT94QBvJ2iOKa79Q2jE/5bIjCx2mwd8LkXBCX8zGVEGIip9kz2JR3QkXgkA+3QHuMBuOSP1/MvfR3a2L1yH/TYYg+9mF6QqvED1PL4wWgG0g4grLHlP1qPCZ1YA5Pyg9251I7oJjIVSmcjLXp3HJ3WW2Wkl/jhHblmIsBLAJsyuK6oMzfFT2vqxC9JnMhvfOipUji2ZNXnC98g04dX/jaidnH6IfUPb9918ZcrDF9+2umvkfSi4KRxrh8nnAKajLRxzeKt6UvW2iB/SlHdpF+8FaWwmG1aGScp8YXm40STCirlzlP4aSgVVkxaCfsMaiu2IFwhDmIowAFDTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP5KMHlh5fAjRnXf9xvgb7P9qjltwPFN2giLnMpQCbw=;
 b=DDrPS0DYHWeKQVBcJKZcKypJ2g/9xLhExpnfZHk4R18SClTxSRyUQxkDLu+5Saa/0AEfkrFGSBj3MoNChgcMeaVUfWE+CrWIlPI3aU94qjC4SFr+5IilP1Foy9LA1d+CQhjo6PBEHAZ/FIUdVJ06gTQFQ9iRZUSs2TNAiiy+gBI64Zqc7npcg18Hp30emjWlnVyygNbnZT36+9XsnxZjwqMcizf6cf9j1NWev+v3glZhhWiyADodu1crJ3Tjwr+Anm1U/79R0ci8kGnSxsLK4Pia03HSRvbxTf+jTpWQ6EADRHJWKj5LurYvydhRuBlcPa1rhBzy3Y2bJfKz+Q8ZyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lP5KMHlh5fAjRnXf9xvgb7P9qjltwPFN2giLnMpQCbw=;
 b=bQKw0JxpQ4mkf4cL+4A3hIE331eyP7Ug9eC7O0ey+PK8darOxT3e70wny3fTkcKpMtsm7r7Is9ok2watHsBprDzCg8glBdvyZhfEqIOttxIofqebrgNZ3PHF2kgu+XRZXRc3/5dTMQetQTnUkl6ZIL5barC/jQl4nJa/XRJeTLM=
Subject: Re: [PATCH] x86emul: fix SYSENTER/SYSCALL switching into 64-bit mode
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <7ce15e4b-8bf1-0cfd-ca9e-5f6eba12cac1@suse.com>
 <d66cce4b-6563-4857-30be-5889788ca6c8@citrix.com>
 <2eed5630-3e23-3005-245e-989893fc8476@suse.com>
 <bf31a01e-4a32-5938-c158-38923100355d@citrix.com>
 <77fda392-6f6a-c8b0-f1ea-15b917245f5e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f69d0f8d-3d13-1bd5-956d-29cf73c9351f@citrix.com>
Date: Wed, 10 Feb 2021 20:26:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <77fda392-6f6a-c8b0-f1ea-15b917245f5e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f20e2ee-890e-490e-dcbc-08d8ce021ac3
X-MS-TrafficTypeDiagnostic: BYAPR03MB3559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3559EA06AE2A5E8021CF0978BA8D9@BYAPR03MB3559.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDWLr41+FdoW46dqVMul+bA1uTq1RzvRKk6RG0kPjZK5Nbw8UKg2x68n4Yq7mTCaSyaITuhulazddOzcJWRffOtPa0FN/ZG5t92DqQZT5KpegjiueKZ6V3CNE8bKxgGoCGtdF3SU4c7N0QDbSGvIL6dIqdu8OcQB565lP644Cw6mjFQYFzYdFeWEneYlqGtmA3XawRL/dvNZHrn+zN8tdWNZuAuJQjKG8FqYnxEucKjmh0wDvi7Fr6v+DR4Oh5XGIPXulkHzbpeR0gR0fsMupmA7hZQ4ERt7Fz4YZuJcUXQ+olkDZuhGzpqPAnfM2SXu10UD03+QTCinNNg7ew1sHgCSKm+JLswrEbq6kPTbdieuHzn9ZVQi0tA0WmdujdFviB87BGcJY5gt2/ckYfzWBTMvTZN9cvepZruhnfD7JeoXGCD2leyWzsvASp9XISNuXsnKU/QmbajISo0/Fp65NKKPBA0yYipYgezlo5kKJih2bAthTFjXR5buzyH7p+mv7sA7KDrDteN3sZ6BqJsLeMs8KGDPDhp4/qCoU8Q2/0SW0Lhd5LbpLqsJ09GlT+QS9yRrPj1pVc96ZP7Lt7VhfsxOc2a6HUmWu5HO0j8N4fs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(53546011)(316002)(16576012)(66946007)(186003)(2906002)(956004)(86362001)(5660300002)(36756003)(2616005)(26005)(6666004)(54906003)(6916009)(6486002)(8676002)(83380400001)(8936002)(4326008)(478600001)(31686004)(66476007)(31696002)(16526019)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFVpV0szS0U3QW1NTDVadXZXWmxEc1VZK3J0YXVxZkNhM2hJSUdSdU41K01x?=
 =?utf-8?B?WGo3YnUybXRQb1l5bUg5Zk91akV5elJqTWlsam1FY0EvenJmREFrZFkzcy9G?=
 =?utf-8?B?NlVpYk93NTlpUmplaFl0Q3JERHE5czBkYjhuRGw1aDlOL1I5YitldUhmK0JD?=
 =?utf-8?B?RzdsYUM0NmFpcThLSGt3L3hSL01YTlozUGlNWEdXZVFZMk1Ld3I2bjVXOGZ5?=
 =?utf-8?B?aGIzUEhZNmYvODMrSTJjZlllZFZJNFNqM0NnT2xia1VtNEpWNFJsaGF2eXlv?=
 =?utf-8?B?NzlaLzRnY2hqYTFqNHFBcXlOMHNMUXFycHpTTVJXa2hjV2wzRzh4YjRsWnNB?=
 =?utf-8?B?TGc2dzVvUG82OTZubVd4cjB6ZG1UdTVOMEpuU2dIZ3F3Q09IdWFtSG5lNWxs?=
 =?utf-8?B?N0tNQmZ0aTc5eE1FUDZrcmZRVHJMdjBZQ1YrTWkyQnRDVENST2lEemJWMWpl?=
 =?utf-8?B?VzltTlRXNmtHUkhNT2E1Zi8wK3ZpN040ZFlwcXBNRnZzdGk2Y0QvdVVZUGcr?=
 =?utf-8?B?cE9sUDM5Y2sxaDFWOWFjaCtEVzYvRkQ2b1Z5ciszanE5S3NKWkQ2bFA4WmJt?=
 =?utf-8?B?VjZVMnV0VDY3NmRMbUVJdTZDRUlZSjBTMDVYUzNPYUtEamxva1lmNTcxRHhw?=
 =?utf-8?B?OWYweXBtbjVQTWp3SGZQSWxoeHpDS1ZLSmV2TzhIQXE1SG96NHFSOGx1MndZ?=
 =?utf-8?B?NXZ5VVoxUmxzSHppZHljTTN0WDdjU0l5VGhsNGJaaW1Tc0ZPdm5wd0M1d0s0?=
 =?utf-8?B?cGdhbjg5TGl5SDdJWW9weG9DaXZ4OG5FMkdJS0tKNjlUMC9VVWdvM2trcjBC?=
 =?utf-8?B?UWU2NnVVcTBGR0dCaEV3VFljYzFaNkRDLy91OWhKdGw0aDRyQjRUbXFvaHR5?=
 =?utf-8?B?bmZqZG16Zms5dk0zdmlwTjNRTFZCcjZqR0VFMkxyTnZqNVA0My9vY0NORHdj?=
 =?utf-8?B?TE5QT083WDlCUDJnbENjZDQ1YWorUm4ra0V6c1ArKzNyWXY0cS83Q1ltNy91?=
 =?utf-8?B?bzNMNHFDZkE2bGZURXZsSEU5RXRwdjNUWGsrUjJ0Z1BTVVlva2lPZGErVDNB?=
 =?utf-8?B?NkFRNit4TldoWXdDMDVNdDl0L2l3YTdNa0IvS1R5MWhUQlZNeURTOTFnTS9P?=
 =?utf-8?B?N0krOUZUSzAzZ1NPNVJOcTFkZk85Mm1TSHJEN29oYXQwZ2Fzd1Y0MGQzdGFH?=
 =?utf-8?B?M1VrZjYrd0dxZGxLZExzMGhRQ1lzbUl4SzVVS2tGYzNWT3lhMmMrMnU0dERk?=
 =?utf-8?B?MmlaWEdJOEtRVS9Mb1BJRTUxMS9Ga2hHbzVWci95Q2NFWUV5cWVubU1wUGFk?=
 =?utf-8?B?d3daRWJFdVVjR281THd0Y3VWVHU5Rm4xL0JPVSs3RnVmQmNtZGlJS2lhTE9X?=
 =?utf-8?B?c0JIZm1ZSzRKbGl5OTA3d2JORFdkcE9Dc1J0REluUUNIbWw5N0J1eGorUXdn?=
 =?utf-8?B?bkFvM1o4b2xReG9ESUorNDZCUlh5Z3g3SmNac1RoYnhObklzdjRuZTI0VURZ?=
 =?utf-8?B?a1lJSUY0dkZTMkxDbDdEZkF2T2tPQlZXSGM4b0wvbUljaHpCS2xOaTlVa3Zy?=
 =?utf-8?B?T3pZRExWY3NFb0VsVElUc3A4Uzc1NVlmTEw3V240bTZ5Y1ZnM2FJUmthaGVQ?=
 =?utf-8?B?T2xwbHZ0TUNVWEF6enZOK3JaYktiSTdxc3N0LzZtWDc1QzRVL0l4dWtNYkV2?=
 =?utf-8?B?T3BUUHVPSmVIaWxUcHZpL0lhZHJsSXNGU0d0LzNPbmFCTDNjeFF5Y09OYkRx?=
 =?utf-8?Q?o1xYs+Iqcq6TgyTVg1chgwkKV57UZOikVVsx1oO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f20e2ee-890e-490e-dcbc-08d8ce021ac3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 20:26:11.0293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K92dgqUoaLSYHVxAnMe0/l8m02hKQlGfZsK6KVrcMwyACNYPSJJZqlGN8iM8tNHQ6V2TGLAhdGfQ+ZxM53c0q5Yx0IUubPkUdGGW2wnvvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3559
X-OriginatorOrg: citrix.com

On 10/02/2021 14:18, Jan Beulich wrote:
> On 10.02.2021 15:02, Andrew Cooper wrote:
>> On 10/02/2021 13:54, Jan Beulich wrote:
>>> Just like considered in the post-description
>>> remark, we could drop the conditional part from sysexit's
>>> setting of _regs.r(ip), and _then_ we would indeed need a
>>> respective change there, for the truncation to happen at
>>> complete_insn:.
>> I think it would look odd changing just rip and not rsp truncation.
> Yes, this was another consideration of mine as well. But it
> is a fact that we treat rip and rsp differently in this
> regard. Perhaps generated code overall could benefit from
> treating rsp more like rip, but this would need careful
> looking at all the involved pieces - especially in cases
> where the updated stack pointer gets further used we may
> not be able to defer the truncation to complete_insn:.

There are other differences.  rip gets updated on every instruction,
while rsp does not.  We also have instructions with (possibly multiple)
rsp-relative memory references which need truncating individually to get
proper behaviour.

~Andrew

