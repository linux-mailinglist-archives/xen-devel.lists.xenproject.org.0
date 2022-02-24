Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2754C2AD0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 12:23:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278174.475329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCCa-0005G6-Hh; Thu, 24 Feb 2022 11:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278174.475329; Thu, 24 Feb 2022 11:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNCCa-0005EB-EV; Thu, 24 Feb 2022 11:22:28 +0000
Received: by outflank-mailman (input) for mailman id 278174;
 Thu, 24 Feb 2022 11:22:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oTFz=TH=citrix.com=prvs=047b345d9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nNCCY-0005E5-Tt
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 11:22:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0939efe3-9564-11ec-8eb8-a37418f5ba1a;
 Thu, 24 Feb 2022 12:22:24 +0100 (CET)
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
X-Inumbo-ID: 0939efe3-9564-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645701744;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PP5ZeioIF4xFGvxeh3WqJzqQDY3AtgMV8UlX+LI3gwI=;
  b=A+m+moxWEd3aEAoCb8x3ARk6AU5xwdanR3Qiq28De1copNVwl3cuUth6
   cmGuqZr3CY2TgfJX7MiriYV5dCM1v8xUWzQYhz3p1NOz20TBUvnSbUe3t
   fBr5v4UnX8Fn9kfh5EW51I147xKuiKWhxuo3df3LEpBGwosNfNINH7vFm
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 64895913
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2+vDZqIHYiIyHaVGFE+Rw5UlxSXFcZb7ZxGr2PjKsXjdYENSgzcFy
 zMaD2vUOqyMZmTyLd9wPt+39h9XsJKEzoBrTgplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2NQ02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PMRhbHsUwAjBPXNocUmCUd9E2Y5I6ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qON
 pdIMGEHgBLocyFpB08lCsIHtsD0j0GiWCRnjkKHnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0zpDxdfONGBxD6t9nO3mvSJjS79QJgVFrCz6rhtmlL77m4ZBQASVFC7ieKkkUP4UNVaQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJ2T90XtBuKwJCM4j+4PTJaaz4GL8Ip4ZpeqSMR6
 neFmNbgBDpKubKTSG6A+rr8kQ5eKRT5PkdZO3ZaEFJtD83L5dhq00mRFooL/Lud04WtcQwc1
 Qxmu8TXa187qccQn5u28lnc695HjsiYF1Vljuk7s4/M0++YWGJHT9HwgbQ4xawZRGp8crVnl
 CJa8yR5xLpTZaxhbATXHI0w8EiBvp5pygH0j191BIUG/D+w4XOldo04yGggeBo3bpxYI2S2O
 BS7VeZtCHl7ZiXCgUhfOd/ZNijX5fK4SYSNug78NLKinaSdhCfYpXozNCZ8LkjmkVQ2kLFXB
 HtoWZ3EMJruMow+lGDeb75EidcDn3lirUuOFcGT50n2itK2OS/KIYrpxXPTN4jVGovf+16Lm
 zueXuPXoyhivBrWOHePqtdLdQhQRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:xU8p4avF+4PRrZ8utSZWVjHn7skDctV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVMqM03I9urtBEDtexzhHP1OgbX5X43NYOCOggLBRuxfBODZogHIKmnT8fNcyL
 clU4UWMqyUMbGit7eY3OBvKadD/OW6
X-IronPort-AV: E=Sophos;i="5.88,393,1635220800"; 
   d="scan'208";a="64895913"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P24ve/cuFPPg0A5c491iHpt+sXbZ+9Vq37cSJgGxzAdNm8e9wOuWxg0y5E9UKNkJDSap+XDCh2z+INs/SD9jMGnZBT2hiAwUnrcOdPowzFh2UtBK9nrqOguutE2u/7i4kKD4M3+udtf6N+wqDrPYhsMJY/6MJp9QyQuW6NiSVkLwXkkSUcD21uWcLnZ7bKnRRQZjg3UcNcoOZML7R3GUCKhacb10chDQLpic7wc+1aa4VrPa7MdUntkLME5QFFfhV6SexgXuLLHZwjSKmoIoz5o6QDd+N/pj2eyZ5XzxQd71L9pDs2flu1v0vZb8+kwMSYy9PjuVK4muLuZLXwO+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PP5ZeioIF4xFGvxeh3WqJzqQDY3AtgMV8UlX+LI3gwI=;
 b=FxevyrEAiPqDhple4mVp3luu3hhYlMYblFQH9aMaBKzsIqF8+zHtuTa6hvsUiHOmD+yEoTgWDOZNQxZv96alie5nVL0YNhRTw9Op9il1tGUtTjuQrLGfukvZtanpHbI8SsuMfgHIx53/VVdAOJpSCR7UsfPCOjrkFlEX0FP7M28X5jLTRF54yEYjyVxoJJXTyESuRzTvafwgM3z8fqGiw82TdW85Zv8h/1ODbMv8of1xKFnRC6gKgfhAsNVCexEhI0brXKvOvhfyufT4yIJ/VDjfd/IIsfwfrWyZZ+Kcfok4a4eh5d6U+f46n5oWjXIlmLb3Hd5eYrqyZkljZWam9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PP5ZeioIF4xFGvxeh3WqJzqQDY3AtgMV8UlX+LI3gwI=;
 b=XUeYhN8RJaZUcs3j1K3b+9xP70OS3ldWubWmfNxNPgsLV6kP4tgy2yZn3J+j7V5v+RrlxplecTbek8M17FeXUzn3tGzx9qcwAlVqoLvcyWz1t7hII16R2gnM3c1ho12cupxnJzL0xLRTfV+4hpwmc3lc4JDhL+DPDJTcPUl+fUY=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Topic: [PATCH] x86: make embedded endbr64 check compatible with older
 GNU grep
Thread-Index: AQHYKWdr96DvHtmiCE6n5nuoqf1KFayifeMAgAAQ3YA=
Date: Thu, 24 Feb 2022 11:22:17 +0000
Message-ID: <d6392c5c-b70d-6efd-f49e-567e703d64a3@citrix.com>
References: <ceaae3c8-0c35-efc1-c7bc-f44364ce29e4@suse.com>
 <cced4ec0-f522-9273-b10c-0e652bcc5aa3@citrix.com>
In-Reply-To: <cced4ec0-f522-9273-b10c-0e652bcc5aa3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed36e512-cfdf-4adb-e393-08d9f787eab5
x-ms-traffictypediagnostic: MN2PR03MB4815:EE_
x-microsoft-antispam-prvs: <MN2PR03MB4815234421439A3C139815F5BA3D9@MN2PR03MB4815.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YPk/nl9FYVo5Jg2HA08yLJR/eTpIAXMjMo+jUAkGTGdNCw7qFZPbtSSRVbREuGtb8gTk+59h3DCUC3gGTcgg7rmTJL6ASUaOlUFzcQF5D4EpPo0xl68dITAPA6vHA8GY960GUOFwQ9tPXf8WucS1izNKR3AuzfZjVsuiUIR68NJ+V3FCu5BNZdpa0Ih7vPiB98wWmIToqUGHtI6to1grIs2l4Dvnp1n82SIQiirwMguMOtzY7KdToUT71LUjbpZmaLgv/0GCrbk5zCsbLeD+aaApa5rEDc+7znvso5g4nhOKEWF7BdElbdTSEU+vJV71XgsF61ND4c6P7nM8uE2rW4/4gfD3M9nIDj1nFy1vRcVFKz7ZZ4npZdf5VGdgF1lnDyfo9zf9T3mugggcwD/M19+a1Mhg6qO9bdjpdIV/q3HAH0lddU7wWkBGFgMHzHjugpyr4hauiqUSLI+hnKE2wBZnI83uftkN/Mgmwl2cQ3an04LxWnTbes8XWUywyl1UiR7yeFCG8eaaM9tYizf4a4PVc+otFdePStN3Q9SvHE4jCJw8UClCkfEiL7p6XW7h8AsCZxwdNuEn7PDO7gUuwoehdJBW3/qbecSTDIpk8MXOacmgszJiS4u6WYH2dt3g7qEwqZegPPy/MgWfSpO/uRQrVEJgXQg2DR09N8eNX0lj+PoXihFiylM6GcFGrKo0ncwh3kO8CwRcaiZ1rsL2ptAT25CixtKpqGYHQWnFhgvJG5naeGjUm30nKIaFdEsWU9m7O/i578++XbOguF3MHeDch0W2epniSfqxPzQQamJOpV66k8aYGAiqRJwXiHYpxAUsN4M1Bq/ueihu3DH3hBv/iOC2Rum9jGs0UZI1SDg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(6512007)(36756003)(107886003)(186003)(2616005)(26005)(8936002)(31686004)(6506007)(71200400001)(316002)(5660300002)(38070700005)(508600001)(66476007)(122000001)(91956017)(66556008)(66446008)(76116006)(66946007)(82960400001)(8676002)(966005)(64756008)(4326008)(54906003)(6486002)(4744005)(38100700002)(86362001)(2906002)(110136005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2hXU3N0TmJlUmVNLys2czEyL2ZqSHRLeVVuNDZ4OEhlMmtrWFhUY3EyTmcz?=
 =?utf-8?B?Q085VTQzN0FUTnkwSEtUb05XQUQ0cG5SOHVTU1h0bDI1ZDBQcnpKem5IM1Bw?=
 =?utf-8?B?WnpaQVVnbW1NSG42Y1kxQTByU29RQUs3eUsvNmY1eVdtVlJaRVdLTXV0RXo3?=
 =?utf-8?B?cXhuNkx3VVdDVVBKVXl5R01lTWg4WU5wWTM3WjNocXZvODZueGRBRUVNcWtQ?=
 =?utf-8?B?NjdGWXFFVTFocC9hSTZZMkNOdTk5ZFVYdHN6cmUxK3BxVndnVldQWDZOMlRV?=
 =?utf-8?B?QzJPQTk5RVJKenpjSTVZNzFzV1FQZVJkVkJUZnVtMkxSMGx5dXFNYzZ3cllI?=
 =?utf-8?B?eVFST1VBRXFVcmplWHkvSXZNc1E0V08xNzFaanhOZHF0Z253K2NEWStzY0pp?=
 =?utf-8?B?clRWWkN0MFBsaHJWSml1S2hJdkp2cXNwM1psc3pzS0RXM1JrcElVZHQzR2Jl?=
 =?utf-8?B?Rkk1K2FxL2FWKzArU202cDRGbGZGODUwbnhRMFlPbVh2OEJVYVFFVUtlbUZx?=
 =?utf-8?B?WXB4cHE3T29GVXhjT0R6Yi9tYXRWSGVkaGVoMERFNjBncWdTdEVXVlN1QnZC?=
 =?utf-8?B?cnBIaWdabjJicHVIbWp5NDZqWTRUeWxKYnQ4NmFrN3EydHd2dGRyZy95dmt1?=
 =?utf-8?B?cldHenFvbi9HTmNEanlnOW1YVlZxNjJvQ01KZnNpRlBVdDMvd0R5b0UyQ1Jh?=
 =?utf-8?B?aUoyWGdZSVNCUU5odXdaTGVRczJGZXFnS25scWhzZE9VeHEyeGx6WWdSVFRV?=
 =?utf-8?B?YjRKMndpU0FkeE9nSXdDaTdRUnJtY2Y4eHN5bzFqczUvM1dVcFIyUlY3ZVlM?=
 =?utf-8?B?cURCWGhFTnlsZkYzdUlQcTZhb2pyYXZBZmV0ekhlQzdmckhpYjBCZDRKYnBP?=
 =?utf-8?B?SmUvSGJLWjZ3VndXSkhrL2h1cEpoby8yZ09aR01LYVlzenRmb3NwMkwvLzgx?=
 =?utf-8?B?S1FYOGJyWW82eDVrZm5uaVhmTzJRWFlVSWdCbjdubm40WWxkL3lIV3dkaTd5?=
 =?utf-8?B?Mndua01Qdm1ldFBOSEZIWmFuTGk3eTJnN2NCNGFqYjBsQXpOKzFyUHdIajQ3?=
 =?utf-8?B?M0N5S1V3Z1IvQXFteVJUUG8zTHM1ZzNlSDFoald5SXJJV2NrT214bS90YlJ0?=
 =?utf-8?B?dHBIUnROS2VVQnpzMUtxTmEyLzZCU1JUTTBTZ2pPOXNvdVk5Tmh6N2laUFhz?=
 =?utf-8?B?OTR6YU8vZTNFRzEwWFRiVUNrSkw3MjQ4bTlwc1BnTERiaHkxWUt5RStJNkZj?=
 =?utf-8?B?RWdtWmxuUkdVdk4yYktBMGYwT1c3SHVoYzhGMjQyM2JEOUlHV0luaGdsSUFG?=
 =?utf-8?B?dWZMT2ppaysxdDFDU05MZktWTG5NT0lYMDFubDVYS01NY24zTGdCaDd3MjBC?=
 =?utf-8?B?ZExUcFA5YVJvemkwQ3lBdmp1TE0wS0V0SXdUb00rZDViMHlJdHZzL2JxZndJ?=
 =?utf-8?B?TXI1cmR5RWdyK2I2U29LSUFKbVhJODAzT1ozVzV5T1lnVUZNcjJPdGQwZEI1?=
 =?utf-8?B?TlJMKzRRa2FaSThJS3E3VEg0Q1MzQUhwb1FnSXh0L2dXTlNKNDVzYlc0bWlz?=
 =?utf-8?B?bTROdExIMytNMUVCSHBCUVpFM2VoS25leUdDR282S0NhUkhubDZFOHlQbnRP?=
 =?utf-8?B?WkFQMWMzRW5xbEMwTkJmZ2FaeTFUaUp6MWVLMlBmSWJPVkVJRjY3VWhxd0h4?=
 =?utf-8?B?NndHRXNSekdYakpZMTJESjRuZERZcHRncUN1QTViQjNwOHU0SEhHdWFIa1ZP?=
 =?utf-8?B?eDllTHJHOTBGbSt3YXcrbXV2R2VRZTNzNDJ3aTZZT0VFWnd3Sm9waDhIWEJr?=
 =?utf-8?B?M0hsQW16bU5tWUthTHBtM0ZZZ3lDaXpDZThFRExBZVdTZkNlNUlpSERDWmJN?=
 =?utf-8?B?WEdxRjNackNQWDNYOXNENnVWK0VPR01DNlA1dG9rVFFnRmJSY2Z0RWUrVWY5?=
 =?utf-8?B?Zjl1TVJqblIzQ01BdTN6K1AzVU1jT1ZLRlVvU3RtcnNUSGhvME9xS3VNQnhD?=
 =?utf-8?B?RFQrZStKY0RoeXBwN0ErNjlUWnl6QTVuclZsdHlpUHdRa08rY0FxL0RDSDJY?=
 =?utf-8?B?VGJlMHowUGNpYjY2VWlEdTg5b3FTdCt1RzNyWHRQbWhPcXZ0WHJYbXNLdWlV?=
 =?utf-8?B?RW5vR3A0aCtFQWIxenQ4NU1TMVNIb1pIYWZHaFoxVkhWSVAxZWttTUZKL0Nu?=
 =?utf-8?B?WEVWV2xHeUZGN2dxbHk1eEpuRGEwNWRSUnZJTnJEVFlHYnBZdWhJc1JCYjNK?=
 =?utf-8?B?RGwraG55S1NHQjJVMHNCciszeS9RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE1F37170044C842B5086F5798019C7B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed36e512-cfdf-4adb-e393-08d9f787eab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 11:22:17.8976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZKSO7j9zx85vOauA/Id9y72CewJFjbFrsHNfDuUcnNpqN6YxHVWTmWvTKrnvOP0Qr6D754+TQha66mrxBYqQQCcMQU/ytOymKlbwnQyj/1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4815
X-OriginatorOrg: citrix.com

T24gMjQvMDIvMjAyMiAxMDoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjQvMDIvMjAy
MiAxMDoxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBXaXRoIHZlcnNpb24gMi43IEknbSBvYnNl
cnZpbmcgc3VwcG9ydCBmb3IgYmluYXJ5IHNlYXJjaGVzLCBidXQNCj4+IHVucmVsaWFibGUgcmVz
dWx0czogT25seSBhIHN1YnNldCBvZiB0aGUgc3VwcG9zZWQgbWF0Y2hlcyBpcyBhY3R1YWxseQ0K
Pj4gcmVwb3J0ZWQ7IGZvciBvdXIgcGF0dGVybiBJJ3ZlIG5ldmVyIG9ic2VydmVkIGFueSBtYXRj
aC4gVGhpcyBzYW1lDQo+PiB2ZXJzaW9uIHdvcmtzIGZpbmUgd2hlbiBoYW5kaW5nIGl0IGEgUGVy
bCByZWdleHAgdXNpbmcgaGV4IG9yIG9jdGFsDQo+PiBlc2NhcGVzLiBQcm9iZSBmb3Igc3VwcG9y
dCBvZiAtUCBhbmQgcHJlZmVyIHRoYXQgb3ZlciB0aGUgb3JpZ2luYWwNCj4+IGFwcHJvYWNoLg0K
Pj4NCj4+IEZpeGVzOiA0ZDAzNzQyNWRjY2YgKCJ4ODY6IEJ1aWxkIGNoZWNrIGZvciBlbWJlZGRl
ZCBlbmRicjY0IGluc3RydWN0aW9ucyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+IExvb2tzIHBsYXVzaWJsZS7CoCBUZW50YXRpdmUgYWNrLCBi
dXQgdGhpcyBkZWZpbml0ZWx5IG5lZWRzIGEgZnVsbCBydW4NCj4gdGhyb3VnaCBDSSBiZWZvcmUg
Y29tbWl0dGluZy7CoCBMZXQgbWUga2ljayBzb21ldGhpbmcgb2ZmLg0KDQpTdGFydGVkIG5vdzoN
Cg0KaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3Blb3BsZS9hbmR5aGhwL3hlbi8tL3Bp
cGVsaW5lcy80Nzg1MDg0NTkNCmh0dHBzOi8vY2lycnVzLWNpLmNvbS9idWlsZC82MjU1MTk2MDE4
ODM1NDU2DQoNCldlJ3JlIGdldHRpbmcgY2hyb25pYyBuZXR3b3JraW5nIHByb2JsZW1zIGluIGdp
dGxhYiByaWdodCBub3cgc28gdGhhdA0KbWlnaHQgcmVxdWlyZSBhIGxvdCBvZiBwZXJzdWFzaW9u
IHRvIGJlIHVzZWZ1bC4NCg0KfkFuZHJldw0K

