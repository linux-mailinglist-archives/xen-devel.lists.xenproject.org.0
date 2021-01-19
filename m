Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E832FBAB7
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:06:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70464.126472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1saN-0002v4-4V; Tue, 19 Jan 2021 15:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70464.126472; Tue, 19 Jan 2021 15:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1saN-0002uf-0U; Tue, 19 Jan 2021 15:06:23 +0000
Received: by outflank-mailman (input) for mailman id 70464;
 Tue, 19 Jan 2021 15:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1saL-0002uZ-JO
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:06:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d82c4622-d07c-4d6c-a6c5-2cd30da431ab;
 Tue, 19 Jan 2021 15:06:20 +0000 (UTC)
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
X-Inumbo-ID: d82c4622-d07c-4d6c-a6c5-2cd30da431ab
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611068780;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ldfb+FlYk9elc/fhYFG9ciL8xX5HRSR/ddujdzXtX9o=;
  b=S8K7bnGs+3U7gi3Ou7qgzrAC6atdP1uravgT/ZCFPaZgNuqA4N9DIWQE
   k6ZnHYzq4ifJz/ovRdcCNnEB1LiyjCr32V4xF5dkOpo0NrQtKmaxAw8hb
   i/U8s0KcaN9uPlTPbzhUE6c3Z81uKbShnhQmz8/HwtTJefViKdBIdOqZY
   g=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: nBSAy65ISpew0MFuEPXM7uFB4ZLRDS+zPyaZ2XILNM1VyJ+Bqfz1IBsOcJmpfGPuKlA3dEzlTm
 xSTRbYIP+0hl/NbR75i3kwkXA+il+KY5nA6quf52w9AtpP/6SM3eLYseJp///dM20ix/XfaWNi
 j8r+Fa3swXk3o2wV+CIHEw8Sv0ZQghn9ZeVYCwp+gJNr2oRlCNNVmMuIfYWyf4uwfKWGZ3em0v
 LkIo6dsaIa/FcVdQ9wXYxGnoVVXmcuTmgdfwK6T1kqClUGFkEJBwBFX77nzevL/KWNOGyqSdur
 2tU=
X-SBRS: None
X-MesageID: 35379367
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="35379367"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IC543+8jTGXRoUprMQJn09I5bTDnZEFNGo/ZtzuEysf58Bx/vRWu95aK4QP0SrAH0pq+Hy80XLXsAUVCs53ioxYCNdaMpvr/iXn5n/wtsnZlHmeElEMnv2pv0XQXvBXKJ85P1pY8zc0GAztITEqkUFruHKWAT85rNNBRhd9CBc46MTcEwCis5nam+9MC7RZLbrYhR/7ylTNma8ySVkSvKub4bDKvK8vpnumT3/PWpupKMOHBweqsSNXzzWFXJPen23lXIDvEj+iXOL4/n/wurQqzFV133fi1txAJRaamZymUO/Cpim1krPiua3y8dcSxYBL8Xo3dhH6NP0w9gf7aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldfb+FlYk9elc/fhYFG9ciL8xX5HRSR/ddujdzXtX9o=;
 b=gYsvrVf9anhiwNBUk3+SH2IHfDT7Rs/RZDkKTVbMEFTUj89J2kGduG7FwxQUYl5OpBjCymDU4PtfrBQH7JtN4Ert8r6cOApnESHB8OHIItytaGdB9nlqU8IFkn4C8oVERAr32c0/3V63Qx5AU3km1Kj4Xr0ii5lJ7pYGbwNdwzCi9PB+vdjZ2g53KdGR5Ra+w9Q+JILXx+90hGNKbc7AOUWMNZmbs5JEK0LqeM88iH/7z28FoY/EGKt+YyB4cxnQOjX3Cop6fpndLdhwm1qASZs8VKLgOGvHpSHuocbqOq8WQ1W0J8MtHeEHh1iPfgTBlFgjAZaf6zuOyq9pUwjmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldfb+FlYk9elc/fhYFG9ciL8xX5HRSR/ddujdzXtX9o=;
 b=D/+VdUB02xY5WgqzCHuwJ4DHWIiL6AmkewNfvcckHZm8gpU1BcHc3ShBA23L2tu1CpdlKKZntjFJ6pI9IOzAHOrsYASE15dtCNI7CyLBEEnf52xVLP1gszTiJZIRLbshNc8ggmElVzQcrR6Oqz5k9hTkG3tyWmxmDh5b03P6+g0=
Subject: Re: [PATCH 2/3] x86/smpboot: Allow making an INIT IPI conditional
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, =?UTF-8?Q?Norbert_Kami=c5=84ski?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.com>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-3-andrew.cooper3@citrix.com>
 <20210119145814.ctjgh5aekxaapztv@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2b61194b-3c0e-685d-bdc0-7ad9a3e95db5@citrix.com>
Date: Tue, 19 Jan 2021 15:05:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119145814.ctjgh5aekxaapztv@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0121.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::18) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f90fba-9e97-4719-ec1c-08d8bc8bb26e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3845026C95FE5EB6AB451FDABAA30@BYAPR03MB3845.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMxehgmg9P0qKaA8GFUqx6vxSKH/tu8lHGV05GwYv46bOuQV+APWVDL0DKkWfaecdP31hmzD5vXP669/7o2WqmMzLKkbR2DjBAU7f8F+ibmB8iRY0CKS2eVTv5zQBk/rBI4lTUk08ONxck6NAsOqfRX25U9u8UTDBcIuiYXGtrKZLQE3eP4fm7/69uq327fqFF4wfbZOGoghRzC0bFyA9cCcGxIknjwULtFg9ZqbRB5sRGGxDOQtbUY3jS0CBEG63sC/tAHQsyLV1xlmPqbu+4Dp53qviGqJIGSpLNb4AEjGPJDayv1W9OLFP2VFgt2F6v1amyEbIePLYAbWR987XOl+zviR/9T+ij0SiKObnWkA3smtJ5OGmpcO8bVgaaTuaf/NqvRMuEAH+Q3QLN6riN2czqH8DleK1ISLKswoMsbgxDTkUtfA1+3Rw6cW9JZ4/Z+9kQKGQh1fL2xeBY2hUKU6s/kQchujAB+9mQdcfxkE478j/sZLOy3+TKblDGSt+8YZkTSNAUxBb+hmtBT1t4ECoRbkLOybiXqwerprqbzkk5ZEgrPWctYI8orW5CrgqyhBehDdBPx7xBHOWgTTzV8vpihKlrSmWh2SxQEvurE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(36756003)(186003)(31686004)(26005)(53546011)(956004)(4326008)(54906003)(86362001)(31696002)(16526019)(8936002)(66946007)(2616005)(6862004)(66476007)(5660300002)(66556008)(316002)(8676002)(16576012)(6486002)(6636002)(478600001)(6666004)(37006003)(7416002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?enJ0YzBybjFvQzNqa0szSlBIdUMyNDhRT2JSMkt3L3BzeTBaOXQyUGl0SkNr?=
 =?utf-8?B?TzJMQWIyL2xLOTVGZUxySVhIMGw0b3RkM3VwaVRTRHlNVEF5NlJieXFRYUds?=
 =?utf-8?B?RDhlZmpSQ25zSjVwalVjNFVSWHkvWXFmdEkrUjV5WWhxREs4YWVGYUJWTW8r?=
 =?utf-8?B?dVVBMGd3MWtPdTZ1RUhIWXNmK2s1UVhEbmhBZld3bXkzRkx6VEVEOEFzdnM1?=
 =?utf-8?B?RmY2ZDdrVVZoSXRvcUl0Myt1S09iWStBM1hBZFRjV0ZTTVowR3BKamt4MU92?=
 =?utf-8?B?MmZqUGVRUjhraDFnRHIxdlU4aU8zWEpvM3hNajZxZE1VY0lMTHVEV3ZQVUlZ?=
 =?utf-8?B?NjlyV3VtSDIrY09wd25NMVRoU0pTVEw5dTh3bG5LOGJLdzBKU1E5WklzMFR1?=
 =?utf-8?B?Z3JpTW4rYkpRZFNiSXRJYTVKUW9lcStGeVFSazdCMFhGbUlmN3N4TFByMlc4?=
 =?utf-8?B?c0hoVmQ5UHkyYXVhdnQ1bXpVUSsrSUJKU29IUEN3SWdNbEhKOTVxQlhlbWRa?=
 =?utf-8?B?ZjNwczVTMGd0ZWhGYXdlZ3N3dWgySjVlZFZxeFpjYUZqS2NELy80OGRMTFFk?=
 =?utf-8?B?aTNjeDN6bWQ3RnZrazd3RXdKNHU4Zk1FRkFnczVRZ214UDUvTE83bys0eENO?=
 =?utf-8?B?aEJaendiUWRUVlRsQ1lmRlRkdjdBU2VPMlNTQ0dXdEtjcElUZkJFWW1iVjEv?=
 =?utf-8?B?bktaVEorWFBJRGdOR01RYWlvdjI3cVIwZzcvMnkwVUh0NjlRL1dmU0FScHgx?=
 =?utf-8?B?MmpoWkRYdlNqQmV5bnpPSzduZEcwOTBjMHNYS0FTUi9iNjlCbzlSSzAyYkEv?=
 =?utf-8?B?MVJxNklNT25QRGhWS0JMNklkYXc4dWY3R3BYbWgvZHZKdklxbGNtZUVYWlEz?=
 =?utf-8?B?MWZkUkZiS0d2WndWaVBqemNuYUtEYmduVmdPV3A1MWQ5ZkFVbUVaVVJOYTZu?=
 =?utf-8?B?L0pPN0VycXN4eUwvN0o4NFpBaHNYZFg5TzJKZjJGenROMmlMek9CK2tGbjhq?=
 =?utf-8?B?SHRvSXJvZUZjK1VJMDBRYXMyaEVzay9LaE1MUW9JUmdldGZBTmhzb3krNkk5?=
 =?utf-8?B?SmtTK0FvSVZ5b3dhMGdxNng5U1RQbExIOWFIV1FUVWt1OGNPcmxoa05hZWw3?=
 =?utf-8?B?SWRtRWx2c1FRM3IvSHVtYlNlQ1loQUtHaU5WcEFTbFdUTGdQOFNqRzc4YjI5?=
 =?utf-8?B?b3JCdTgyNDQ3ZXRweHhMZUNmYUdEbk55cUtPdUd3dnpqS0JDb25ydnVLNGxl?=
 =?utf-8?B?OWkrV21KN2xQMkRvSWxWTkdCQlhpUmFPZTJXU09mU3NWM09ZL3pqNSttMXFu?=
 =?utf-8?Q?DXR2Lw/J4pu4tmYlrXJ7TNUxAfwyudSLVX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f90fba-9e97-4719-ec1c-08d8bc8bb26e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 15:05:45.4744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OujQfwMzQLmoELn9hbUXYNTsDCUSFH7X6/EOqbBnFtJpMdvRfXlnCJYOt0IgyFrNy5y+R9ba2q8Zk35sATXrsPZmv8o3gzxabAfRh8ws4vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3845
X-OriginatorOrg: citrix.com

On 19/01/2021 14:58, Roger Pau Monné wrote:
> On Fri, Jan 15, 2021 at 11:10:45PM +0000, Andrew Cooper wrote:
>> A subsequent change is going to introduce SKINIT support, wherein the APs will
>> be already be in the wait-for-SIPI state, and an INIT must not be sent.
>>
>> Introduce a send_INIT boolean, so we can control sending an INIT IPI
>> separately from sending SIPIs.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm not opposed to introduce this, but maybe it would be better to
> move it to a separate helper? send_init(unsigned int apicid); or some
> such?
>
> Would reduce one level of indentation.

I've got a lot of cleanup planned for 4.16, but splitting this up
INIT-SIPI-SIPI is specifically not one of them.

This will get more complicated with Intel TXT Intel, and I also want to
integrate it more nicely with the virtualised AP boot logic.  I suspect
we'll end up with a function pointer per platform&configuration, but
that's too much work at this point in 4.15.

~Andrew

