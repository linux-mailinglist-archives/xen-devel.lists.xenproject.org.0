Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F133B938E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148904.275217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyy0J-00064l-95; Thu, 01 Jul 2021 14:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148904.275217; Thu, 01 Jul 2021 14:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyy0J-00062m-46; Thu, 01 Jul 2021 14:49:23 +0000
Received: by outflank-mailman (input) for mailman id 148904;
 Thu, 01 Jul 2021 14:49:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRek=LZ=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lyy0G-00062a-Oh
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:49:20 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83d38364-da7b-11eb-8336-12813bfff9fa;
 Thu, 01 Jul 2021 14:49:19 +0000 (UTC)
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
X-Inumbo-ID: 83d38364-da7b-11eb-8336-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625150959;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ly2MHXC/HzUrKwuKhJfH6agfT2Fbq0RaeOLGcGtYp/4=;
  b=FIu2beEhp0ziIYAqE+SDrr/6eBH+qKf+mvPoKJ3/BSz9iEV8xWonIDf1
   MXr9nZShk6Wl5pazZ1M4i0rIdat0blTBQhukapZDb6nVL1oF1ZXFiXH1p
   wZmm1139F+o0+96aii182/qo9knvy+zS0F+qja7h2UEbE2DoNE2etTZsq
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YiQg9rQX8RuCbXSbGTf5LxfSIyqEKAWH5aNvcdpkltPWuKQqxyyHHAg3oYGQRe/8rUiKOUGab0
 LL5PdnizmSL05cXlbAwL2xHrn3CzpkPnDNj6LmkL1BcTq0ydT9HqIn7/3ikleSBWvCuQ/V+sLW
 gN8zWfOUq4ZiPy06x1gTiwKXtoAgej/RLRJh7puTWwTcg/U9VXyXq2K9Pf64yloQNDFdCcuk2K
 O5m2Jc24bv/80GQ7YgvFX2H4HM2OuOrtWTplWqVz1lsRhNlvdwKZGsDpW10PrvsuLN3tLCbEsz
 zas=
X-SBRS: 5.1
X-MesageID: 47097391
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:TWuzlKOVqTZRBsBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47097391"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnlMfewsKxTRXm+Z2aKZMZ2yFqtnlBBElwrZY9FlSzqRvps7gvJ7hpPnc0TgY1tS4Z0HOSiJn1TrqigFLSpp6rrbQOqVAHbLZspuq01PTolVw7KiH4J2FHi/O2JPk1bcs9JOfS078s8ILfjvVdBeYQbr2d38tUQ6ZoMk/fX/atcr1aLtY5Ok3+EMIIM+GvNx4N6T8wIDnMGEVtH9py8KFT6RWNFyQdP1j3n34NlVRMeMhmqhyofHBBqNEh/Z1duC+eVwOtfwneoap3EK0xWUWl32zsfsVW3M09C90xSFRPqY+IlXTBfOA6XCQit0Q4iybgfl+lwGLQmhBqwNs+lj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly2MHXC/HzUrKwuKhJfH6agfT2Fbq0RaeOLGcGtYp/4=;
 b=AVDHm/kR0zUWXM4btI1ILVvIuIfgWR7zVK9/9qx5T1Q5aQlBPHLl8D8Pdm5MzAp+ludy1drpIXBPAKzIubVsgS3qU12HGxJinPC2JGrO83mDpf5GWNaIXQHopemipkqbHqG4xMJNcuzd+FcRvoGAgH0Krd5PkURLlDyrLKxKIRu/iMxXj2Bj0XflEg/C+2+XNTYs2hknrPTuXMPVQ026AWc48fonoy+mCExEbOsSBkxJ9+fR6eGPu0FvCbo3MdgrhKgK3s9jfufB2pnkuTA2E19ACOnMpoboL7CyPF1TsTh/hPOO0+zFskhGUeSdPvdQ1w8hTNEmJphY0BMBiFAJzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly2MHXC/HzUrKwuKhJfH6agfT2Fbq0RaeOLGcGtYp/4=;
 b=mKRbH+kimVgfbiAKVxNBfupg/aeaJsRJ5/oc5IUozv/gLDJDYJlbLQV8TtpmSBzB3pYLEvLH/jWDjl+PQXaT1g/WBlPeg5PviMXEe8AVj69FTSmhhaqEOHT8I9Fw3EslOMmHphqPndRNwf/Bgcs4odzrvgZPAfDUzHuqZta9KGE=
Subject: Re: [PATCH v20210701 03/40] xl: fix description of migrate --debug
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Juergen Gross <jgross@suse.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-4-olaf@aepfle.de>
 <038fa686-c7e8-4afc-e84d-216c3a3f6d5b@citrix.com>
 <20210701164055.6f373be1.olaf@aepfle.de>
 <20210701164135.5ba31381.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c8251c66-0b3c-427b-c459-7d587ab85ba7@citrix.com>
Date: Thu, 1 Jul 2021 15:49:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701164135.5ba31381.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0068.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5495471-4c39-44ca-714a-08d93c9f65e5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB399261854C6FDABF0A629C27BA009@BYAPR03MB3992.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VgNpODmaIdhW04XW27kBP7F7RHlGuXu5pwQI9jK8tBp0rXD4EvonsuOBrDI+ysnOyAgyyXrEHJ/HKdEShxD/6lrlpGhWrwGdlcFS3VdHWg4ZB9NVeiaLL+5o71Rc/TuB2gJ3MgPcx3zi1uj6sIEiBY+v6LN0N0vPpZ0647u3BW8IHejK4EsYQUACIj4w/J2N9ukno3u5mYc+RSL7huGozhFx/hef0ze1y0LVHqZdMMVb4fEBowPMSU8dLUhCum0zszSIz/KAeM/+/vXDW6GY+57r2zDr4DoefDnJwIhDkmVpAtP69d0HvB/maSzVa8ogZi7YNJxMZN0FKKhI4o5gdR2QzcDsoonmGakYL9rSRNPDK5X68K3+f4CafW4GsSSldCP9cQLierhjn6yw+SVqPWfOn4MO+x0oa4f8qtKm90uaBrm+Lwt82a+NFdX+QVYZH+P4w5dCaSGZ3mwhnYajqzUzNv9CJfRs/g7PVUbnEOm2VCS6it5Gy2PSRedd4Z9l0nwFz52VRHN4lfQSe0IN76NxR2ABYDwR5p3cHmZn1snv86GrJRbcfY6hW5NnuonhkjOIyPg8KJKz+1/xMcDZAWeWRBVL9+xM1nP+6z9RW0Ha6IZUAAigix72NnJHUfdQz1Q8sMHkLcjRvLqRPrreIYMSxNGc72eVc4cXwTFbc7RrfJ8IFMuQfo4P9tJ7hXzX9V+IzJjCEQVksxZAJI3/eLLQhIYGnKQU0udgc19K6Pf/GejPHk84UyuPx9j7PHeA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(396003)(136003)(376002)(5660300002)(107886003)(4326008)(16526019)(86362001)(54906003)(8676002)(316002)(31686004)(6916009)(38100700002)(6666004)(31696002)(186003)(6486002)(53546011)(36756003)(956004)(2616005)(478600001)(66556008)(8936002)(66946007)(2906002)(16576012)(4744005)(26005)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?lZpeWYWThORshXljfvQQMCg5iSge6fIh1CgQSSeTurnipc8duPuATTVz?=
 =?Windows-1252?Q?KED8iG25w2rrjwzjl52bHQHA7OlxrclYkAFMs4c4pBixPAvj8KUg7JgG?=
 =?Windows-1252?Q?wzKri5e5W55Z8Zk1WLNB82vODGE7rUIHrS2egfdM32bjNwTovSof9R7b?=
 =?Windows-1252?Q?UV4/RcdCzIp4+Y+iU7ntopae1Tx++hL4qwatHPJqckSFPvHdPfP6ZGHi?=
 =?Windows-1252?Q?bUb3pXrZybxNzkx7arDH1KpitIGA5b5zZFxZAVL7raQi+Tq5m1zpNm81?=
 =?Windows-1252?Q?YTMfqXkhMSYK8MGY54136ObzEqskN/Who011TP95K+JveE+9DQHjDdmJ?=
 =?Windows-1252?Q?9hlUJfx8otzyp90UuOY0l9rFZl1BybTh4jWMsIsjvBIg/Cj+eayUkgSa?=
 =?Windows-1252?Q?lrU0UhIbFtbzqha4uqlWBHtJEisrRyxi3F2KIc773aIL1w77oEmN6VFQ?=
 =?Windows-1252?Q?br1d6do5wv4vQTC/ZBt9b2+jK/ESHWSaIGDz5T8UdJwvYixAXJgLwk/e?=
 =?Windows-1252?Q?Xs0omwq5CykksPNsjgn84UeThEDbGFWlIhuJ/fHl5vqxmIKnXlsWO1CJ?=
 =?Windows-1252?Q?jkJ018vZMkcyb6e/nRvU1ZiwB6dG1LiyHJGha6DJe9gRsRkDidGAp8Cw?=
 =?Windows-1252?Q?PHwIsG+CHSCJ7gg0uOA29cmJXzGhO5gyGCodkBlDSeq/N+a/nNRBdjuY?=
 =?Windows-1252?Q?H6i1SWs2qI7vXxloC7AL7EJf+1Mo4ZoIIhQPsY7J20hsN8zp8K1Z9KQ0?=
 =?Windows-1252?Q?cXQExptj0K8CSUFcDNm5aMp3UZT/ml0nxLqmY5RtysRRQB8p0025xoES?=
 =?Windows-1252?Q?rptCS+rfTo7X6HQ+LyeioAn4VHqCH34hdKqYF4mzJIRoKNfknMv58GcV?=
 =?Windows-1252?Q?LDNHS1f17IB1ukKSy7t9t/hwZINkHqmIYKnZENp06rqSqrPUdTtHLw2s?=
 =?Windows-1252?Q?92Hftn4P7upHuoiTPlUsBSzWHPt2pvWuu3XiEIMIwHiuDYfaNPFyaOK9?=
 =?Windows-1252?Q?whTxsPrZuIsZ8FwqAXDXgQoWogXpfGNEOMY9kgmumw9UgcrmYlWSU1XA?=
 =?Windows-1252?Q?I79IBHWfR0No3rui1A67TexYHoncyLmN3hFA/9AmamOJmrnHd/88BlTn?=
 =?Windows-1252?Q?N4rCzfzHTEgF+FNJS7x3ZKEFmPLcPsTXls//DB2F/iEvgPSJ/XRZ7fiG?=
 =?Windows-1252?Q?g5fChOPe6JqLyyfhxvPscowi4QlC9Hred16s/Wf0FuhJv9VRZ+L7N7M8?=
 =?Windows-1252?Q?zPipGk4NXGPmaEYjGz3sYJtsIoTvkrmcLh8t3rIyguu/9aO17QXXHqnI?=
 =?Windows-1252?Q?pSKMIR0t1TMt05rsf7JMhkbF3bNiVucfodGY5ALijerJaCxQcwWB1FQ0?=
 =?Windows-1252?Q?kSUkhhJR0bGKqqf8lvnyB+qMK0FEc10orrbmerJHyWWcFSUMiEieQAhM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5495471-4c39-44ca-714a-08d93c9f65e5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 14:49:15.7917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCkSwxn7XiR5CJRDpGbHnI03T56L4dk/E71XKb/AM1gbVuZVlTm+JW+qVq/Nx4iydU6UVMaTHUkqCRmPn7PKREX38OV89SFdm3rBb9braM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3992
X-OriginatorOrg: citrix.com

On 01/07/2021 15:41, Olaf Hering wrote:
> Am Thu, 1 Jul 2021 16:40:55 +0200
> schrieb Olaf Hering <olaf@aepfle.de>:
>
>> could
> "code", sorry.

c/s 7449fb36c6c81d2ba10a40b59e61a9f420cd8450 was buggy and inverted the
condition while making the code transformation.

--debug makes no sense at all in a checkpointed stream.

~Andrew

