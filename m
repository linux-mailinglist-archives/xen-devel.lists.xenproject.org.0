Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADFE328972
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 19:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91914.173490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmqR-0005zB-EO; Mon, 01 Mar 2021 18:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91914.173490; Mon, 01 Mar 2021 18:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGmqR-0005ym-B2; Mon, 01 Mar 2021 18:00:35 +0000
Received: by outflank-mailman (input) for mailman id 91914;
 Mon, 01 Mar 2021 18:00:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RrjX=H7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lGmqP-0005yf-91
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 18:00:33 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea9c4435-d502-4f61-879b-4466df48a07e;
 Mon, 01 Mar 2021 18:00:32 +0000 (UTC)
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
X-Inumbo-ID: ea9c4435-d502-4f61-879b-4466df48a07e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614621632;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=IsYFfZc0UJWeaW+md1gW2qg6L820YYdIBgvTPeIdKTw=;
  b=SZ74jQhxjY2z7f5zS6VEOm8cT3Z5A43NcwtasyRwVWtW49t1CuB4ONIE
   IzH3BPynHkIhRmczsfFe81IPB4mbVeF/hZskrMWsmlJ54svuC2GOOUUzX
   h5k7BaJA/fnzfLE7qE59TcaTsbnHL7GGzT0cYznPm7lQWJ1EtDPRBVYGo
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: J9oxg10ClAMHhvD9nQD78YW+e5e3SZ4p9xmQNwOl3ix0B1jxZfCdVC2GglV6JWR4FniOgjGPfJ
 Nq6vVtwlY0tdKW/y6FY2uq967BjQv6igkal11219cC38bXqDHId4CM8IjE5ZhYTPsnFBYET/Wh
 typR+LiPrBKAYFjA8MaUf915fOyhR6Himxkwey5/x8dKf2fZfWR6ZmGsYHu0BZQt6zvXmc7SZ1
 4o7JlD8TfAWXixDoBn0NXbtr3/aL1xazSNS2O5ciSVuRzltFa/yy2rqUSwJg2c0fCobHTcG771
 iPc=
X-SBRS: 5.2
X-MesageID: 39663258
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,215,1610427600"; 
   d="scan'208";a="39663258"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RkyanwfCvnNHVLb0BFyA/zahEPqaIOs8pPtD+WfC/N6kSAfctB2CVz17L+r+9qdWBwlneNK5Ah7jinYFXwbW/Pt7fJ9HLfL0OqQuyETlYTLfWit7HOZRAmIMznS6Grt6ZO7z3ixFfbU/KTAMpOsSXxFp/mbZ5GuxKFTv++u3CZ9zxw+lILJeQW/Asei3aUtR2KD9bg1GjaZY4zX0x7Uzx4FnpVD/XIle0UpCTWbixyhRdtvkr1EJ9o4OHwtspAj2cK3DWOoqWVPjkFcFRoBP1zFdzSzUnLZIz5Kr2EFIQ9TkqCu+gDbE1HMlxk7PdjF6dB0csrC5C341UwB0FnN9RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcG1mWCLe/SWiqsP06+QG1dmbGdRnRy4uXk+hjWYqmY=;
 b=LtInf6fXzmihb1zZlykvhXUCirQ/7pxoVrGn27TOWYOU9w6miqqhcDPjnAgqTXpOT3wHzLO+sbK2+swYms430dBqqwYublNib0VzFsb7X2qwsRxranThk5/iMpvFk5Si7lBkaljudWXQTCRsNvnmGao1UadChMwZzCRaQhoI3fgnRCrJkJi5ZCtBAZRH9V60H5bIzvoTuPVkBrDUKozaEzPtp4hBtdfAC4qLA+NBY4DxqdaLC8O/4nCHZOc8BNFBIo0BSKYgOG0h8/SFyUbGFEEczkGof9JGiKMpLcdQdrRe3mgnibGXnQOzwUksc9fsBvbVVUmaE9InKfXBO2sxrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcG1mWCLe/SWiqsP06+QG1dmbGdRnRy4uXk+hjWYqmY=;
 b=hqxw4RWPfzRRg9E61pwvdH3XZauuztyH33gtDw7bGSV09/dhEF0RAABbbNt7kcGQ7iEy7YAi7sEsKha+iGrvk3WuC6+JDkJA5wuBWMI2KAJsv6ol/iRbyh2e3vod7DInJ1eRlyjsynxJrEx1I1FUJED4p8mECw4jj1grdzDJ/n0=
Date: Mon, 1 Mar 2021 19:00:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
Message-ID: <YD0rtgJgIN2FxEex@Air-de-Roger>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <YDzzt1CXau8vKCn1@Air-de-Roger>
 <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0664115-2b36-7a56-2814-bb234fb379cf@suse.com>
X-ClientProxiedBy: AM5PR0601CA0059.eurprd06.prod.outlook.com
 (2603:10a6:206::24) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fbb0d8f-e140-4127-2476-08d8dcdbe581
X-MS-TrafficTypeDiagnostic: DM6PR03MB5065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5065EC3987FCE85A17BDA9888F9A9@DM6PR03MB5065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NIM+0SyWDCmzLypJd9+V4X2dgO16XJr7ha79/lbO9pSjxofd26/qT3hArHVh+0KrYVaPdPQqSJKl36+RZNGTkelnLvj6D6d+bcTA+krYemwW8W6+6kDKEqkUgGWxrDj+zCCOxlmrSiFSmYvm8S3vIvg2K+7Bua0OgtC3JAAXYAfaD/1iwGOrDi891D8BelpI3tydOt6qTeUSlyr16ETuiS48FHHYRM+oqtd5IkUv7Z6oYOzBtbm1N56U2AxxujnQDKFLwUEaciofGsdv3QSoD2J2ZwxkahgFRaPDCn370HxoWOhEDbXGp1ed3667DoPHgETfRBJqBsuCh4lurFyjaPuvgIvCDFUIE/0IyVqTEMvSiS/MrLbeFrMcNPoWqFEagDK4ZngIuCAlrL4jjAxAnmpN9G5wQqTglMbAOvCI7bV1FaBDqiIidFyNLEB4965Stj6eOimZpK8PhcBMUvTuXY8KpsjLcA3ajh6S8w7Idg5Bw5KYteuMK7/eDW9b35vYEUAzj6jQCdS3AGcYMv9+iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(396003)(366004)(136003)(9686003)(956004)(26005)(6666004)(66476007)(33716001)(66556008)(66946007)(478600001)(83380400001)(16526019)(8676002)(86362001)(2906002)(85182001)(6486002)(54906003)(186003)(5660300002)(8936002)(53546011)(6496006)(316002)(4326008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WitkOG9JWHlWYW00VjZiS2huN2dSQUJQUW5hbzA5US9haWJtWUNWbEx0Zk5q?=
 =?utf-8?B?SjZWSmZycTZkZUFKRm1TNlNxYm9tWk5WcUxzVnVNTWtvejhudC92bk1EN28r?=
 =?utf-8?B?M3EzU1QxVTZQYlJpV0pVb3lXL0VxM3VKMERPZ01Dd1A5bTFuZUtrdU5HcVZI?=
 =?utf-8?B?aHFIa1J5VGJrVjdNcGpCT0M5QncwN250ZHF0azRSVjNaWFpmb2tBY3lIQkNE?=
 =?utf-8?B?N1FRVjZzL1RtUmR3YWpNUE5Rd0wxWFNuUzNRYnQ3NTZxL3BwNHptQ205eVV2?=
 =?utf-8?B?Zm5yamZCTk0wNEp6SE5MZ091Y0kzYkZYWWl6M1dKK0c3b2hJajdHWDJtREJU?=
 =?utf-8?B?ck5aa2VFTlZRb1JSWTV0c05MMzVNUjFuY0VsSlZoeFhFajNXUHY0S2gzTitt?=
 =?utf-8?B?cUdRNW5jVUk0UTRuSnNvaS8reGxTWE02bExLelVxUS9wSFNrRWdzQlZrUDBN?=
 =?utf-8?B?YXg3N05LcU9rUHRLb2g2MFc3ZVBXMitHY2V2SWZiblY2Wk5QVHRNOGxaWGFt?=
 =?utf-8?B?bTVsU3pxWHpuTWlEN2QxOURaenVTanBJR3B1Nk9mS0QwcDArOEJVa21vdEho?=
 =?utf-8?B?V0J5WUhFM3c1UlRrd2JaNy95MGZJNVdOZ1V6OXhjR2F3VVhNWjMwQ1VwVEJv?=
 =?utf-8?B?WXRnWmw5RnpZSFFLT2RsdFlKcmdHYW01TURoQkx6NHlMaFh6TFF2Y2VYY21q?=
 =?utf-8?B?TGhaWTdYM3J5ZWw4VWoxU0ZwNjdLRmhvL0VmZlcyVDBZc0s3RGFCaG9KMVhT?=
 =?utf-8?B?RHVZZXFzTzBwVTVtd2RUZXRJL3Z0NFJFMSs3WU1YQzFLYjBXcnVLM1F4MjNC?=
 =?utf-8?B?bm9SSlhCcUZxWm1QNE0xc0VHQ3NjZDBSWVh6WDRtczhmRW5qMGRMeXc3L2Yz?=
 =?utf-8?B?U2Q5VURtR0R3RjFlRUJYR2ZqQ0pLUFFZcXhvZG1EQ2tNODRoUDgxWHUrVERY?=
 =?utf-8?B?SzV0LzlxbllOeWFQM0dNdklrcXRPdTFzbEpiL0xXbDRyWnlmSnVoMXMvWTJO?=
 =?utf-8?B?R2U0TU0vN3BOdW1CV0d1a05xZ0VhdVBjdXUyWmlscStWU0x5T2t5YkdLNTJG?=
 =?utf-8?B?ZkdKQml6SHltbTFkUHBaQ2RGejBqODV1WnljaTdpR2ptSFdDUFQzY1ZUT2dj?=
 =?utf-8?B?dk02Y0xoQ0E3TXQ3Y2o5YW9CdFkzK3g1NVBLWjlPODRreWVRb0ZSQ2JJdXBM?=
 =?utf-8?B?YWhrTkVPc1NmRTFJMDYvQ3FpUUlOOFpic0pqVFE1am1qRzhGSUpTajd2N0Zs?=
 =?utf-8?B?YVkyVmdDc1hlaHBaZkhoNEwzdE02ZHlxUzlCSk9JQmpxMW90cCtKMzNuMXZV?=
 =?utf-8?B?dHI3czJ3M0lPMlQvVVVzMGF1SDFTNDZzU3JTR01DbTdHVmRpL1AxR000aWRq?=
 =?utf-8?B?djFuZTZQRFRZREFvby9xelgvNDRTMjhUNzFzU3FXMnZ1R0VHQitIOWJrYlda?=
 =?utf-8?B?MmNwdEdkdG1ZemVCZ3U4ZzRDMTgvRVVQWjc0UWNqd1MyUnpMeTdPTXBEMWFB?=
 =?utf-8?B?aTBnOXFPc2ZUNWkrQXF0TVRzdlM4SGhOVitKeVhCMEFZRXYwRkhHbWsxa1dv?=
 =?utf-8?B?SnNjc3kwOUdsRG9DYmdOeG1najVQQ0I0QnVaMmlzbXM2MThZVUJKd0lZK1RC?=
 =?utf-8?B?ckhGc2hWaU85SzJQL2RwdmR0cGxPVUVFdDdKanJQcWwvKzc0SkdKSW1SSnJL?=
 =?utf-8?B?aFFTV2pwbVVBWkJLcFo4ZGNmWU1mU3g4YlZsYTNCZDdXMkRGWUZTTE5Nc2hS?=
 =?utf-8?B?a1doaFY1N3BXRlRVNlJtM0ZLRVRNdWRPV2xCR3V0UTlQM1ZzNWJVcUNubVJT?=
 =?utf-8?B?dCtST2RXQUthV2JnSncrUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbb0d8f-e140-4127-2476-08d8dcdbe581
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 18:00:28.4387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGkbZKobj96WuXEc2pT+cGy63gCPQuqGM6YeTwo+6xYvoL9otRHlxn+BsbRN7lMD/3Uh0BTKXygLb7ZsvMuU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5065
X-OriginatorOrg: citrix.com

On Mon, Mar 01, 2021 at 04:14:26PM +0100, Jan Beulich wrote:
> On 01.03.2021 15:01, Roger Pau Monné wrote:
> > On Mon, Mar 01, 2021 at 09:31:07AM +0100, Jan Beulich wrote:
> >> In this case the compiler is recognizing that no valid array indexes
> >> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
> >> ...)), but oddly enough isn't really consistent about the checking it
> >> does (see the code comment).
> > 
> > I assume this is because of the underlying per_cpu access to
> > __per_cpu_offset using cpu as the index, in which case wouldn't it be
> > better to place the BUG_ON there?
> 
> Not sure, to be honest. It seemed more logical to me to place it
> next to where the issue is.

I'm not sure whether I would prefer to place it in per_cpu directly to
avoid similar issues popping up in other parts of the code in the
future?

Maybe that's not likely. TBH it seems kind of random to be placing
this BUG_ON conditionals to make the compilers happy, but maybe
there's no other option.

> > Also I wonder why the accesses the same function does to the per_cpu
> > area before the modified chunk using this_cpu as index don't also
> > trigger such warnings.
> 
> The compiler appears to be issuing the warning when it can prove
> that no legitimate index can make it to a respective use. in this
> case it means that is is
> 
>         if ( this_cpu == cpu )
>             continue;
> 
> which makes it possible for the compiler to know that what gets
> past this would be an out of bounds access, since for NR_CPUS=1
> both this_cpu and cpu can only validly both be zero. (This also
> plays into my choice of placement, because it is not
> x2apic_cluster() on its own which has this issue.)

I see, thanks for the explanation. It makes me wonder whether other
random issues like this will pop up in other parts of the code. We
should have a gitlab build with NR_CPUS=1 in order to assert we don't
regress it. Speaking for myself I certainly won't be able to detect
whether something broke this support in the future.

Thanks, Roger.

