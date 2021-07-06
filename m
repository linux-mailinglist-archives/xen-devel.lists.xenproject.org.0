Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360933BD7B5
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 15:23:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151308.279644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l2e-0007x6-Ju; Tue, 06 Jul 2021 13:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151308.279644; Tue, 06 Jul 2021 13:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0l2e-0007u7-GT; Tue, 06 Jul 2021 13:23:12 +0000
Received: by outflank-mailman (input) for mailman id 151308;
 Tue, 06 Jul 2021 13:23:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+rBn=L6=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0l2d-0007u1-1p
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 13:23:11 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e7fdc04-de5d-11eb-8494-12813bfff9fa;
 Tue, 06 Jul 2021 13:23:10 +0000 (UTC)
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
X-Inumbo-ID: 4e7fdc04-de5d-11eb-8494-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625577790;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NjCralRfuo6KXP8cRSsUNCnqGq36yk3L/tVo8FNlcGs=;
  b=GY5hhBuTixXzh7tIsPGm1j5UpOS1O/Mh8AFxUFBsog5mDEMK3CjeBFC9
   Tm1qomXxmYc5ogFS3KFkzNuHXUA4uYRZZpLl2HwtY1ZklifI18uwdloUI
   jXWa+01g7VmpTnn5U7WbO1oytYv1rOH8Mlf21CrI9cjhFB9t0FS+fhVne
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: zTe+4uoOoTx0P2r+k0+741ZnJiSH0fP8t8JYK6wQyn3oLGYCYF2i9HCR8S2VHQPQe6d/umjeNU
 2A5Hliz3eC6RvKgTQENllH4IdXzMijH47HqDD0G+rFjFw0FCvIGxOnt/PMgfsK0zhm0rdNVSgo
 VHBSZmYTnPXczZem0IrweN3DH0JttQvURAyZU0TDcw6iwI/H0Ml3dIrhS7dDmaSbnCJwLFaU70
 oZ7oNMOdOquvHNHRya4V/jtGP+/OQHqSziQBuiaj8OFLpTXXuLpcAoACeaDZFoGC8R5lwWBXF3
 ZeM=
X-SBRS: 5.1
X-MesageID: 47709345
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RpOVLKlXFuZnnDX9kDIIN6ZiNiLpDfLz3DAbv31ZSRFFG/Fw9/
 rCoB19726RtN9xYgBEpTnkAsO9qBznmqKdjbN+AV7AZniFhILLFuFfBOLZqlWNJ8SXzIVgPM
 xbAstD4bPLbGSTjazBkXOF+9RL+qj7zEiq792us0uEVWtRGsZdB58SMHfhLqVxLjM2Y6bQRP
 Knl7N6TyPLQwVuUviG
X-IronPort-AV: E=Sophos;i="5.83,328,1616472000"; 
   d="scan'208";a="47709345"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FmD5nORtwbHfiAcslYkFRSFXsZzxwFtE1larFwUDU1Ca5m3F9Y+cX8ilnLt4sVEJIRdCMyEtGNGFrjz78aSRO1a88s5YtxLSYIQtRlnJHkz47CumzV9zgcWfD67+zkedQFLnQd5IQ2Wi3jYQTpLrjVF2qb52y7HTitehRr4w0AsmNCDdB3TRu07r62DL9I8gGWMfaNUxVddJnUj/7W9aIHMCsR86rpu52IzNG1GAeEYySAx5Fe80iXsZbAWo1XAGxVHhXHvSWmCoavIXbni283fswSTGSw0lfI7j6rYkCwoIxCfpGbCJS9lG5Rq+RjfaunUS1epryvtsxWF632MZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYOhxNok8oB7UbiPy3NMo9UxyT4ijQTaPd5J4FhASV0=;
 b=UBNqGEv1OMckdEUzCeVXKJmcm2a1ZyvQoMRQGHp2MjiBkg6ZJ8ihZuIr6j/f8Y7/K7Lh1OSXifE5CJ+EUWTGo+2pMDR5JTVueMiARcF6gylr+NgtHwJjpHkg1n0ACy2i1nRk/4a/JmRhfJVVkQnOFPtW+OsDLuVp7aro5S6a6F6ucRQDYdHhjgESTF2QOpNFPJE1GKtU/hYIGuR4oX9pQNdTTImEeCKcgxfXxQ4/9JRE2ifpiEgLsXJCykj0j0Grnl312mzLOp/RPJfMH3QsSSWFYZHRLC42c6ESfdILwq8D6V4OOa/VtT/G8BPnWOUx5uSqzRpGQPZXD+yFs8HJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYOhxNok8oB7UbiPy3NMo9UxyT4ijQTaPd5J4FhASV0=;
 b=A+QBPSQOpR0xf2LbC0d+ThIOL8vtLnQBvxCyQWdvUrl2Qq5C+4f+r8xPA5A7up1EcsLgJcDCr53BUYk+TmQ80lFVXbf0ffpmk+4X8PN6lPqqzbYzexXUIT/hdxkl0DZgMCMF6rVdVBTP36827BGYGdKv0xOhehvipKF2SZ1qc0Q=
Subject: Re: [PATCH 2/2] tools/migration: Fix potential overflow in
 send_checkpoint_dirty_pfn_list()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Jan Beulich <JBeulich@suse.com>
References: <20210706112332.31753-1-andrew.cooper3@citrix.com>
 <20210706112332.31753-3-andrew.cooper3@citrix.com>
 <20210706145804.1ab98f16.olaf@aepfle.de>
 <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
Message-ID: <1fd51108-82d2-4605-5c37-410c3f4c65a0@citrix.com>
Date: Tue, 6 Jul 2021 14:22:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <902720b3-d71d-82eb-9200-97f2b17dd264@citrix.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0044.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1757a9a-6c23-4d52-58c2-08d94081306d
X-MS-TrafficTypeDiagnostic: BYAPR03MB3495:
X-Microsoft-Antispam-PRVS: <BYAPR03MB34956D834573EB66E2F47F25BA1B9@BYAPR03MB3495.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfPeURFvZ6rkWVfZi/NdIZAjkfSXIa1rkBqK/jOotH6/n9ppHOQIyA1Ki+/cu340jR9Pdbe2boH31W1hD6svCdKjKda7kliI8QFetTak+VH8dIBuLY+1PifJ+gDU6UbOIYaoPBZiVuUgl3rv7KvakkwEAggHGxdLi8oUgX6dqX6D8W9XRA8DGvKgXbGA6yutiXfkZAsB9Z/dDSU9yitG1omvlfQCQ5c9t07/ThZ8WQ33hn/LH5cyHJDMnMw8BFnhGa64VSiaY98py6Zsmog3JxN/l2RWs7JL/VumfiJoa3CDsXrPBBxt0zETNgc+eJgbBHzJivJblJ1syb1LWmg2nPUYBBeFJIpfZJ/ibrliZQPEL1uWXHHEgape6D897jJK+2v4noOLUUZJi5OJGdH8sN/t//l61DYqplRBWVsCdIH0bIdCOfXUPjxY68Ugw7ns3efMk3cMHW+NSE0aKwsrMwWALZQkj16zggrxtXcwiOW9+nfauC9HAUwMy6DHssIbcQUIfNlMtokohxNiXYEWDcrw11YKQETZLj9j5LIib0Z+O4Y1JVsSNRsux6VuXcvj3GchwEcbFaxbVpWXWArbX2jWETBVOga6txVoQThtR0XAty7o9VGFcdq+bDG1c95mWdep/82xswvlktRn/r4R9mZpte3yZDTDIDuyM6ub3LA41Y0hwGp/j3euAL/IiLu8NSGc6hq8eZXsrYQSkocJcLZY5oGUcDcEGrE/QPv67TDACOOyHmEvQgbhfhvwc3F3Nf5r+quRwUe2DOQSZ7vv7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(36756003)(86362001)(478600001)(26005)(5660300002)(31686004)(6916009)(53546011)(54906003)(6486002)(2906002)(8676002)(316002)(31696002)(4326008)(186003)(66476007)(66556008)(956004)(66946007)(16576012)(38100700002)(8936002)(2616005)(6666004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?OmzW713AjL65TzTz8ri4pwwIjv91j5tTsBh0uUUu/1mvVmoJ58S/ROAD?=
 =?Windows-1252?Q?WERPW2A9JLorc63v1IgO5BAlxytUl4UkN9/5DUT+rENb6ECSe1zQRdXQ?=
 =?Windows-1252?Q?TSGr9kMVyKiut6Gctm0xQUv8SvOoZhWk5YikXEoDy3jLWd2gk1SJMF++?=
 =?Windows-1252?Q?KU2iN+lY7U2DqAEHrDVKdTi/jqZEJVpfrlgxMvhnbV6A00WtTH15sefx?=
 =?Windows-1252?Q?Or2+bvo/HJnF4nJqWxEtE++BZtuGLD2qh1kZOUY+Y9ZTo/a3cFFiF+vJ?=
 =?Windows-1252?Q?T1wXEF0ptqS8QEiC7PsxVJQj685TcJIFzrCuMfxJL9dGVxA7OxL/PzCB?=
 =?Windows-1252?Q?VGKgcjdJ35pXlkzP1Sld6ddpDBo9l0mf0JBop5VI7FYFcY0JtnKZt1xT?=
 =?Windows-1252?Q?/SVGiAMM569l4Ewnzt9oKWA9y6P9fQzveI4rVEuBNWCNVZDttQUbrvQ1?=
 =?Windows-1252?Q?rgbfuZbm7V4bI6Iah1ehSRktNJb7PPIum2chj+GnhKKvDKE4rl5Z7lJI?=
 =?Windows-1252?Q?bBDo7+D6TqoJ6RWA0XARbFa2BhJfxtpWCa2t4YZ+n71KTbqiv7vM3uEd?=
 =?Windows-1252?Q?kQNsbR6r20iYw0YQJy7v2oghK6Ey0mDgn5JSLgv8EW3niCFBG26T8xCC?=
 =?Windows-1252?Q?Evw8yaveSV7iUuvTZwPho8So+VDVwq9pd1GwczjwzaUWy3BxlnIraPZo?=
 =?Windows-1252?Q?3oY+YnaA4B0BOl3uccl6CqGYhN2Z9sqQeUlmIVj1nXduGtmVpLKzjIhS?=
 =?Windows-1252?Q?hGYGju6QCpg6YX+/En74ogjT+pa9r5rBW6+pWIWLIMC0jm1a4BVfn6GI?=
 =?Windows-1252?Q?XuEXg8JdFY6xoT0MCSSa1QEspvQblNimVO3f2VWNYVkweLYOtbL36inf?=
 =?Windows-1252?Q?nBcJZYoXxq2dAt3bpM/+vOWcof7IHJ4qTDpWexwR0B15tn0xI+m11wKX?=
 =?Windows-1252?Q?y/X+mR0Re1yh+taL7zSVM/IzTTAzYjwS0L/wk7cQ5qI8G132oQDcetoJ?=
 =?Windows-1252?Q?j8eOPf7Nh2LP8Q1gNrmInC09ae8QvXA8oBniiWid5c+gQfzIC32ZKvbI?=
 =?Windows-1252?Q?m1ekj70ihX77NajuV8ly/KXK1vvI+NdWMBaS0PzU6nIHQ5aNqytKrE+s?=
 =?Windows-1252?Q?rKe6Gpq4l0r1kDJr2mk0eA8y88wD/HN8bEFwinN8125+VSWcZKNhETCV?=
 =?Windows-1252?Q?cMp1YpUsWD8jEix0FaLSEx7ok3duLcVfQ/E7sjmWQ2yrcugYPDeLuS3h?=
 =?Windows-1252?Q?ZLqf2nE8g89DrqL9p9dt31eXqOwzDAit+EjCpriZeGdP2d8bY+3FvAGM?=
 =?Windows-1252?Q?OL0P73ZdniT+IPjohCktZeS0WLftXOMFPp2gQMBiX+9f6CBHI0NihCVv?=
 =?Windows-1252?Q?unuAjdUh3GDs//8UYABhdQh220gO4abhHmmh/1yo6G+WHE++NE6BCwyx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1757a9a-6c23-4d52-58c2-08d94081306d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 13:23:05.7946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5RrdPTjLAE9MOC/w/pj0YB74XhjbFc/cHeKyhRtopdbnYfLtMFk4Ww4B14X0Skl4vVb/yR2F+YFv/qCCBq0dPqV+Cy3UaykQ7X2mtqYDD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3495
X-OriginatorOrg: citrix.com

On 06/07/2021 14:19, Andrew Cooper wrote:
> On 06/07/2021 13:58, Olaf Hering wrote:
>> Am Tue, 6 Jul 2021 12:23:32 +0100
>> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>>
>>> +    count = stats.dirty_count;
>> Is this accurate?
> The live loop relies on it, and it worked correctly the last time I
> tested it.
>
>> I remember the reporting is broken since a while, and testing a busy domU indicates it is still the case.
> If its broken, it needs fixing.
>
>> # xen-logdirty `xl domid domU`
>> 0: faults= 0 dirty= 258050
>> 1: faults= 0 dirty= 257817
>> 2: faults= 0 dirty= 253713
>> 3: faults= 0 dirty= 253197
>> 4: faults= 0 dirty= 255154
>> 5: faults= 0 dirty= 260876
>> 6: faults= 0 dirty= 259083
>> 7: faults= 0 dirty= 253163
>> 8: faults= 0 dirty= 258349
>> 9: faults= 0 dirty= 260330
>> 10: faults= 0 dirty= 259754
>> 11: faults= 0 dirty= 257273
>> 12: faults= 0 dirty= 255756
>> 13: faults= 0 dirty= 258209
>> 14: faults= 0 dirty= 257847
>> 15: faults= 0 dirty= 59639
>> 16: faults= 0 dirty= 81
>> 17: faults= 0 dirty= 86
>> 18: faults= 0 dirty= 111
>> 19: faults= 0 dirty= 81
>> 20: faults= 0 dirty= 80
> What is this showing, other than (unsurprisingly) faults doesn't work
> for an HVM guest?

Sorry - I meant HAP guest.

What hardware is this on?  i.e. is the Page Modification Logging feature
in use?

~Andrew

