Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C726732A6C6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 17:55:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92497.174414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH8I3-00024W-Fv; Tue, 02 Mar 2021 16:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92497.174414; Tue, 02 Mar 2021 16:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH8I3-000247-Cp; Tue, 02 Mar 2021 16:54:31 +0000
Received: by outflank-mailman (input) for mailman id 92497;
 Tue, 02 Mar 2021 16:54:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KcId=IA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lH8I2-000242-4S
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 16:54:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 442ce265-ef4e-4851-9c62-ef0333e8a252;
 Tue, 02 Mar 2021 16:54:28 +0000 (UTC)
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
X-Inumbo-ID: 442ce265-ef4e-4851-9c62-ef0333e8a252
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614704068;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=e5yUiqCvuD4f+50vBDftQB9thcofM4ETGq9kM1dZUXA=;
  b=V/ZmpH2/p+A97iZ5qfIl08NaSSsO6b9ZYPmhETFVm4+t3wSPFgGeTTqF
   HGNAJhyEKwLigruNrZeungmvHSOxgpttCt1CHgFmUdIdKPwnnhgtYsbmB
   /eUO17TOPiFRObQSUyXAISB2wA2w3eCbZHplHFccY41R5VPewS/TRWOKJ
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: V2e5z+RlzawdZSXba4phXi66VNDhKlB+Z2tp8AVhZ/lTqXNg4y2SycQ+2EjkJkxwl8Ei9l5n72
 TRsXwUNpiPVMgRrraiT4nuN2ob9s+zRmzgxicO2mZ4xW8RHVxlbSDXuNDmJmAFNEmLtwdE8fCT
 CU+oELDCQBQac7szb/fK9exp79HxOass/cwvtcN6nqVr9c7f9P6/gKnyz7jYMwakoSs9e04r+C
 xSIC9i9PeNSEoMBqnxrPBRfUU8st0wQSEImngmPenOJpbYIOPKb6gNZ90kwLDrikPzs3O376jf
 /JU=
X-SBRS: 5.2
X-MesageID: 38277625
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,217,1610427600"; 
   d="scan'208";a="38277625"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQyAx26lC0T+WhMAaHV8AaIJwwzpGrxy1vwSpqJugpLvig5CwD5i1YudRIY6s88PZdAHdkSbRcmg4PmcpR1OPbUPh84SAimlkIh1PfpW70Jvl1WLFc8MXKOgd1lCfnD9wTrVxqS0girb+KFpOyn1KwRajIYv11oSTO8xVGBJxjOidIzNn5ESfGRSDr0SvSNFn9HSaTNPl7ED8UhAsSx/Aekg6YLizKP4msxuxN0wgmLPdIuM7pzZTcRg3I2EG0+oFEyuWQeJQTNItaL6KV/FP8aOMRYtHo1WC2PksHnz6jdaC5775AMMOI6x9ATN9zBM3RVkYFeH1QJruqvsgM7tFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5yUiqCvuD4f+50vBDftQB9thcofM4ETGq9kM1dZUXA=;
 b=AwROahZyRR/T9noj2x4yzOmi5s4Sw2V2SAo4kkr3GDHovZFwG6wDUavcu8E8xrm6efoNudEoz0J9bwoF+FsTgSKEfGtDphRJaRNBYemHb0RR4K7Cdw92KG0IOi1jwWoCe1+BbXrei4LR9gSg4VK2PHeJ2rYNQ8jSLsM0yBY1ucdY1MHtz2ZYCqJdaMMS0gi1IPapQ/w3GZ7S81lZW/L/tW6zBzO18ozHMq29yNU/rJq7qLSPUR+zXrJkmaedmdzK1AgOWDYtS05pkpx+9HXUfihc53hr5Uq8u1pp0B8iQMPs92EWGQPo/sxb4Bmzq5X0dUGXebjYGCRBRKX7e47cPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5yUiqCvuD4f+50vBDftQB9thcofM4ETGq9kM1dZUXA=;
 b=D56wuazJPpVKAuGPPBZ9Dyetjc7hfxMr4SfWFu8XBkF1gi/JHy84VC04LLOCrIPZlOvkkqA+Q+co5PGUFaNqwiQYgIxQzbES6txuGPnBeytOEkkfCkmT/lqBiB9BiV+4LH4ntx3LP6On7zhcofsB7xKOR2vDuxhTtlVzkLiPtkw=
Subject: Re: xenstore_lib.h and libxenstore API/ABI problems
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, xen-devel
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
References: <d3423af3-6fa5-c0e2-6572-1e4baeb520d7@citrix.com>
 <ec572c8a-3d30-bd0a-a880-1c00575b56f6@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <f68d5109-4238-dac5-5154-4eb47533410e@citrix.com>
Date: Tue, 2 Mar 2021 16:54:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <ec572c8a-3d30-bd0a-a880-1c00575b56f6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0366.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d725d239-0973-4ecd-fc9e-08d8dd9bd57f
X-MS-TrafficTypeDiagnostic: BYAPR03MB3688:
X-Microsoft-Antispam-PRVS: <BYAPR03MB368874F0555AD7068AFBC925BA999@BYAPR03MB3688.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rz9NnStB+zBc2gxUmfRKuWEKeFhJLIAQ0Q96Py5BWfm9qkqCzGWSHnG4pB+qKlr/u7A2EbE9v/mfvKiT2Af77uTmZIte/gOEOE3Bi4eK5tZq8R1PeSBtfKUz/JvCM66EPe9NVbfd/eecn00ND1aiihNRijOwKGuKx37tOZ3IgRqxo0qZ+5TGYiorY7uueloELBV/E75VOUZk2IYlRFC+tiUNBVpcqX0912E5bTHoXo6GqOkHStDU1sMW7OTs9VDzjsxLtCNFInnblLFEPtNG23sUL5e6cDjsZBCUYQatjA67SL6WLiGeCh9YFJT5XrE4LtLdI/ocP9Noa7TWllcXZKYuEq1GpJJDQHQZ4tNG41c4qQTQspjsDL9YX6I78vT/jV9fsa865dCsUw1imkFQ7msM39ENNvPNvBONCnMVahSP3/BKWQerLt3QDDMeyiriprVx+q+tJmp2MiS7+L7uM5uEz2QPmo7tAV83aKHf6WVf3BRBApaVPtmoeHVbNKJ1ock53/6htELkkagjOt9cYLNLBLZR4Px8PPl9yy5WwYnGjWGVnM9QkY4lc3ffvfHc4BcZlnUPNW0WM9yQFr4us02HtC8icukXY0YItPYAob4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(8676002)(54906003)(53546011)(86362001)(110136005)(31696002)(36756003)(2906002)(66476007)(66574015)(8936002)(26005)(66946007)(66556008)(478600001)(16576012)(4326008)(186003)(316002)(5660300002)(31686004)(2616005)(956004)(83380400001)(6486002)(6666004)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SG9YbU1aY1R3N3ZiNmFjMHdyZnFwekJDbGdyQXkvNzVFNDRGUFNoL0xTa1Q0?=
 =?utf-8?B?MnphLyt2aEt5RGtHZUI0SVhWWFltN0laLzlXc2QwT29pSEV6aldPa01IeldF?=
 =?utf-8?B?MXBoTmlKaEpFa3g4Q2pjRVMvZEZ0emRoUEthT215MHlFVUlxWllROUFzK3Nj?=
 =?utf-8?B?TUE0TE90UU0zL3pxQUx2RktXMlN1ZzBsSnNjT0lEdjVTcXNhK2E1ckEzalp3?=
 =?utf-8?B?czdzV0YxRFpmTmlxSFNMNnFLMXFzOEtSK1RVQmlXZVFiWU90c0VCSzRZNi84?=
 =?utf-8?B?ai9ZK0RtWUlnKzhDNnFXVndhQUZGbzk1QzVvTEtPY0pCVGRRYVN2VWF0S0Iw?=
 =?utf-8?B?ZzZFQXRpRS9mMzV3QnBFTDVFM1ppMTBocFc3U1Fyd1BzdzRkZCs3aGdsbkIx?=
 =?utf-8?B?UUdiUStVR2N3K2NoWHE2UGZoaTlpNlhSTzlkV1pEWllqMzJyblZqOGxWd0FF?=
 =?utf-8?B?c1RLY2dvNnBqc2RnQUtGbE41KzU4Q1ZVYWllTWR4TFRzZ0w4bitxYi9PYlF4?=
 =?utf-8?B?S3VEZWdaSXcvOFFLdkZ1cUVPYW0rWGVvQjVIbEFWYW03RElaalorZFFtY0hk?=
 =?utf-8?B?Z3c1cHFlcXhyeTBGWHRQZkJTS0swNmZVMHlwUFJ4S1lSQ3BGcHdVeHJlMTNa?=
 =?utf-8?B?UVNBekNGT0RwcGcrUlU1N1NmQ1NtelZ2MTJlUEpXL1J6SzZyK1g2dDdRRWxi?=
 =?utf-8?B?SHQ0WVhpQ2U1eU1JV0YzZzkrU1BkN0xaNWdrdnZDTmhGb3hRZFQ1Sy9CVFJu?=
 =?utf-8?B?dnVaMzdVMUZHdjhGd3N2RDJndUJnQWJsMEVwQ0owY0JWNFpMQkVuSW9lSjZJ?=
 =?utf-8?B?czhYZDJGbC9HUm9EWERXTGgzeUtlUDZFWHRZSEkvdnR5L25sNE9oTFhwMis0?=
 =?utf-8?B?WnI2alRacjZpbDM0K2xIWDdXVzlQR1lPYklJT0ZrMW9PQUV5Y2hPbGltRW4z?=
 =?utf-8?B?VFRyN2RudU4zNHhGYjNxMnlQRkNiN3g3ZVdva0RPbWVqVkcvQjdBR090U0FW?=
 =?utf-8?B?VkhFV0t4bUREL1EzalNONHhONnFIVmxqelEzSnd2Vjd0WUVrNUUrZm10MmM2?=
 =?utf-8?B?cjhleGZvbnpmd1IxampUNExpVlBiSFdjU0dXMURwWGpFb0ErK0lUSC9hbTln?=
 =?utf-8?B?S3RBMUc1TEpMbXFCWTlTeTBRenJpYlNNU0lvQmNHU21LUE9KN1ZEcmkzUm9Z?=
 =?utf-8?B?cjlsYU1jL0RXYVo0d1d3M2pKQUhMVHhZQ2l2NXhGeG9iN25LTDIzTzFieDN5?=
 =?utf-8?B?QjRnMXVUZVJvai9YN2hOUGErSDlGcXF3R3BoN0swRU5iWFR5bXZWOFpmZ3lQ?=
 =?utf-8?B?L3JUdmFoWUdmQ0pHd2hGZUx4SlIwSmpKTDB3SUhqVjZYeEJtS25mVUhkZ2ZD?=
 =?utf-8?B?NFVWK3VEdzVJeWkvNVU0ZU1oSWlzODBUT0tFK0FXdENwcWtXaHVxdVpSK2d6?=
 =?utf-8?B?L1ZuNGd6bzhnNTA0eStOaFZsbkJOd2l4YldELzZIcnh5MmRlK0NEWGNJbDdI?=
 =?utf-8?B?bHRXMFB5VWc3enNzM01OcnVDa0xwYmxvbXNKbFNVWDZ2M3RWaGRFNitsaDZP?=
 =?utf-8?B?bjc5OXRIb21ocVYvMlJxdVBDb29Va3lJS1I2WUZZblFURkl4RzNaU3ZiOUNE?=
 =?utf-8?B?SEYyN1ZxZno2c2gyYVk3alYrTENiY3pCTkllMEVOUEtGRGFjWDlpQ3E2RWRG?=
 =?utf-8?B?aTF5dEJSR2tEdVQ2TmNwa1dCYzA1dE1CdVE1NW1jM3ZTZm5tQTh3Y3BhaWVv?=
 =?utf-8?Q?sTBgJdh00Yxmnr2acar6Gtgy6L+B8ANZBMjxDHn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d725d239-0973-4ecd-fc9e-08d8dd9bd57f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 16:54:24.7267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1DrXzVUkoZ1Hd9XaZFeI/zC8oNOeASlN/zRoSQN40ein49qWHIvfttDOGuT6BXEp5BmNrBPsmLc6ShAa2m8gVtZ13rzW5alJ1f6asztyHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3688
X-OriginatorOrg: citrix.com

On 02/03/2021 15:33, Jürgen Groß wrote:
> On 02.03.21 16:23, Andrew Cooper wrote:
>> Hello,
>>
>> This is a total mess.
>>
>> libxenstored does not have a stable ABI.  xenstore_lib.h contains:
>>
>> * struct xs_permissions, which contains an enum - one of the very common
>> ABI traps.
>>
>> * the prototypes for expanding_buffer_ensure(), sanitise_value() and
>> unsanitise_value(), which are inappropriately-namespaced symbols in
>> libxenstore
>>
>> * struct expanding_buffer with a classic string-handling trap (int len).
>>
>> * Various xenstored-internal details such as struct xs_tdb_record_hdr,
>> the internal permission bits, as well as stuff like
>> xs_daemon_{root,run}dir(), and worse xs_daemon_tdb(),  which have
>> absolutely no business being external to xenstored.
>>
>>
>> Its clear that most of this shouldn't be part of libxenstore, but that
>> ship has sailed.  3.0.3 is broken and cannot be fixed.
>>
>> My best suggestion is that we freeze 3.0.3 where it is, and create a 4.0
>> which has all of the xenstore_lib.h content deleted.  That, AFAICT, gets
>> us something which is 99% compatible, and stands a chance of being able
>> to kept properly stable.
>>
>> Thoughts?
>
> How would that work in practice?
>
> Would we ship both libraries, or only 4.0?

I *think* we can create 4.0 with just a tweak to the map file.  Then, we
could build 3.0.3 side by side with 4.0.

We already have the compat for xenstore/xs{,lib}.h which adds to this
mess.  I was thinking of adding a build time "want xenstore compat"
option which gets you 3.0.3 and the badly-named headers.

~Andrew

