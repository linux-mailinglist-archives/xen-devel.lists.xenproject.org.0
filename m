Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F179341E83
	for <lists+xen-devel@lfdr.de>; Fri, 19 Mar 2021 14:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99262.188634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFMD-0001Cm-Rh; Fri, 19 Mar 2021 13:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99262.188634; Fri, 19 Mar 2021 13:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNFMD-0001Aw-Mr; Fri, 19 Mar 2021 13:40:05 +0000
Received: by outflank-mailman (input) for mailman id 99262;
 Fri, 19 Mar 2021 13:40:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z0Gn=IR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lNFMC-00013O-RW
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 13:40:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5245e5bc-c1ae-4d23-b78c-b210bb4769ea;
 Fri, 19 Mar 2021 13:40:04 +0000 (UTC)
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
X-Inumbo-ID: 5245e5bc-c1ae-4d23-b78c-b210bb4769ea
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616161204;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3KM7opIg/JZK6NQVGXPTmJgelggvLHIq7CdfMY+3gVs=;
  b=BQj3FRK7ctAVLyhBBL37l2tvPZmvirvm/xNtV5nMGu/e5JmgBV06hYnQ
   XZXbgM6aVeDVOdfspb9pVI+ztyw3C5Py+qGUJXTMqt05UThgQoWFGeVXg
   NY1TFiXCwaLq77JANcpqIASCLxl3+hoDLADkxTqvPL+iG9EoASgYNiYzl
   M=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pDubzEnuIDpdr7Vuo75E+RwsYHdJuSBtjY4xSBAem00FUBL6ZwJx6wKdnvCXJgdZyUC653QUVS
 +Yt/JAoGL1JVb/76vKmzdH96mfl3wX2/5Rhw6Pi9nqZ9N7owvqRNdbjCND455DOPtMJW1I/sCc
 rxFRrgZsr7MIU0wBn9cOXgdLjlBaxePaH4QTEbV+fp30aytJUqXeu8DrWXGHvYGIhtFv0H9ZLg
 BAR0ksfEQK8jWaFYBrSbYqsLK0CaXhuKlBrSBIZS/RR5YHYM4Bu8PE87MmCNJSMRcJmpcjdI0h
 9Hs=
X-SBRS: 5.2
X-MesageID: 40051532
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:nhQ3q6Af+soTC4XlHegBtMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPufVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VHdMgXE3Kpm2a
 9kGpISNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0NcShBQchbnmJEIyycFVB7QxQDIJI/Go
 aV6MYvnUveRV08aMOnCn4ZG9XZr9rQm578JTIADRgr6A6B5AnYlILSOR6ewxsYTndz0a4vmF
 K17jDRy4eCl7WAyhHa33LO9Jg+orXc4/ZKGcDksLlsFhzCkQCtDb4RPIGqnDdwm+237UZvrd
 +kmWZbA+1Wy1f8Ol64ugHs3Q6I6kdc11bHxUWDiXXu5ezVLQhKcvZpvo5SfhvH50dIhrgVu8
 gqrgHpwqZ/Nh/OkD/w4NLFTXhR5y6JiEEvjPIJiDhnWZYeAYUh3bA3xl9fE5sLAUvBmeYaOd
 RpZfushsp+TUmXdDTwsGVp3bWXLw8ONybDaE0DtsuJ6iNRjXB0wmAJrfZv70soxdYTTYJJ6P
 /DNbktvLZSTtUOZaY4P+sZR9CrY1a9Di7kASa3GxDKBasHM3XCp9re56g03vijfNgtwIEpkJ
 rMfVtEvQcJCgzTIPzL+KcO3gHGQW27Uzio4NpZ/YJFtrr1Q6euGTGfSXg1+vHQ4Mk3M4n+Yb
 KeKZhWC/jsIS/FAoBSxTDzXJFUND03TNAVgNAmQFiDy/i7arHCh6j+SrL+NbDtGTErVifUGX
 0YRgX+I81G8wSFQXn9rB/NW278W0D28J5qeZKqutQ7+cwoDMlhowIVgVO26oWgMjtZqJE7e0
 N4PffGn8qA1C2L1FeNy18sFgtWD05T7rmleWhNvxU2P0T9dqtGn92efGtVzUaWPxMXdbKQLC
 dv43BMvY6nJZ2Zwi4vT/i9NHiBsncVrHWWC7ARh7OE/sWgXp8jFJ4pVOhQGGzwZl1IsDcvjF
 0GRB4PR0fZGD+ro76iloYoCObWcMQ5phyqL85SoXf2rl6duskre3seU1eVIIyqqDdrYwARqk
 x68qcZjrbFsy2oM3EDjOMxN0AJVH6aG4tcDAOOZJxdn5fifA0YdxbNuRWqzzUIPkb6/UQbgW
 LsaQmZY+vCDFZmtndE6ary619vemKBf0V/V2BiveRGZBb7k0c29dXOSru40mOXZFdH+O0bPT
 3fSRY5Iw9lxbmMpVSosQfHMU9j6oQlP+TbArhmTqra3Wm1LpaU0YscGeVPwZpjPNfyk+MCXO
 6FYTWJJDfgB+5B4X3Nml8VfA1P7FU0m/Lh3xPoqFWi1HkkGPzIPRBIQaoYL9z01Rmse9+4lL
 FCyfQ7suu7Pj+vNpqoyaTLYyVCLR2Wi2isVO0soY1Vu6V3lLYbJeitbRL4kFV8mDM5J4PIsW
 lbZoJRyrXIIJVucMwfYDgxxCtjqP2/aG8Q9jXrCeo/d2w3h3DVP9m186PFwIBfdnGplU/VAx
 2j6CVT8PfOYjub2ZMbA6w2J35KaEJU0gUVwMqyM6nRAh6tbedN4R6TNWK8aqZUTMG+aPgthy
 c/x9GDhOmMcSXknCjWoDtgO6pLt0KqW9m7Dg7JOelG9bWBSBixq5rvxM64lzHsTzSnL2wemI
 1ebEQVKv15tQNKtvx+7gGCDortokwklFNC4TZo0n7Vs7LWnlvzLAVhKg3WgpJfQD9JFGOH5P
 61qdSl6A==
X-IronPort-AV: E=Sophos;i="5.81,261,1610427600"; 
   d="scan'208";a="40051532"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM/yIvzTognaK2xg9AGLsMFh9HSkkW7lQPh1AqfsFMamfWAfuJGFKFVit6iDyxhmYfCZhVj2IJzypATKpHwDYizS2niIP93X/xDAS7a0kXnBYf/95kplAH8ERc2bghg2+nmyW/n0qL3CQ4dp1nkqFXwwBs2crgMBNNpa9rSDg5tGS1zdHz0g1akdRxNdz9WO4N3yDoKTQij716K139QURZFgac/OfXhzJx157hlyAGW592b3yAWip82pJ4WxjB2zc3mpNUTS1vKPz+8pGutX6oRNgDbqSuXfKEn25mzxCR764yCgt+dBvj+DbtenGDV3F8Jl8CHE8geiFeXjaN9OLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maS8I8IUEiTkrWdnnaaj1tEbuiithGPZlMk+bf3CO3Y=;
 b=WhbCShzoCR3cweTTDYVJjtwAciX+bWcciiRM5rpolmQvHKNJei/kDp6yi7j33nlPCKx/N8fA7P8DWUeD2TdmnuZWU2duPlETkxaf9n1t3QhTgjuv6piRUnv+XJ/hWEYzGM6KJSlRK0g9BBxpB9s+CdXSBjj+7wHYXCMCfVbpeltX8Dl4b5d5RL3reCOSNf9ttTChxcdb/DLfvGgb0irdlTwqOpc2P96YgDOSZPA95uq3Mtm4+BmHPH9iKfbBmTs9lf7juqEOniGBKjjUDK44CrteT1nMv+HyT9u2FPeoqQCRCraSdVU+Nkyd5iwobzlpi5JmUH+d/JIcYrIVpqDSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maS8I8IUEiTkrWdnnaaj1tEbuiithGPZlMk+bf3CO3Y=;
 b=G3Vt74ix4s3rdzJZTUd65+dI6hx+OlV0d2CH0Uf78/w0wATwIEDHWEEGuRDTfFKc8zgohI/zAuQsB3r0RB5eYBwroe6ou6Rc6YGYVLTURrb677MIMd5yyxp1FrwRKdMfkx7jCWyEAME8hRkYy37CM0YsRp3AVPe/1Gpm9A9HJv8=
To: Ian Jackson <iwj@xenproject.org>
CC: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
 <24658.6228.390535.850901@mariner.uk.xensource.com>
 <e193afc5-2b42-8ebe-b20d-ba6fcd64742e@citrix.com>
 <24660.42333.417431.528632@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Call for tools backports (was Re: preparations for 4.13.3)
Message-ID: <dd291769-9809-d858-1b64-4eca8761be2c@citrix.com>
Date: Fri, 19 Mar 2021 13:39:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24660.42333.417431.528632@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0369.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::14) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ed4b69c-b97e-4f6d-ed3d-08d8eadc700f
X-MS-TrafficTypeDiagnostic: BN8PR03MB4948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB49487F92072A759740E90587BA689@BN8PR03MB4948.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1X58uSa2H4WXiEpla4lLz/CgbsDx9rqBU0o1OY1LlgLMACkwnEjb5viiZtqOgVKDuM211K/WYN1WPamNyzWz3Wy/UTg+tRKzU0UqRfFczYO1UghjNo4uXLyAU2nF3DE6vqK8ccNzweM+0t8dXjEGFBXtRbBdFeUhPXyHKjqprHzBS5kQC4+K6g4eIg2UHTQLo3Qr3BHzgkY2zBk6/R2PnXq78EF1/p/E3WnOHbgOe+CMD3pKHBXo2H9Ufs8dkC/z+SCDGi5m30CdGul9H0FbekH07I14xOXS3N48ui4MeVgGTciPyIivXCKeEeZrPOqU2Ut1I3c2lUSPaqRsct61R7FNyo76n+GP+MtmDG/IlZ+urOpHgC6YAYuPmHwn4olH07G8X8tPLQa5iQaaQhH48tBQIO2zAO6i2Ndx6I7+haRcUifCYVxFWyC8Sj6vEokBZOqK7YHxgbrfyhZluXkPsFSUiOkyllhz+6k7xd2mTDWAKYUZppRSGHKsVS77uTZlcvTyq7CF7ZDMdFGaw2FAFl+A676RHuM5xooHPEKr4x+0zECIqAuAICwjIQv2CQCIdsK0597kVy8L0VDYVQ+Ud/LmRPiUiPVR2OXpXRXG0CiZbfd0kb2W5NR1LktrNMscstWt8PG4PRtMp/pzmDF/1gAp44d90WfVNwT4J7TTumngOFY1x1IsgZjWGAPYHdHebXfObx6yfrRaEeBNuXhghc006xYU+s1DYGnQARazdtY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(2616005)(6916009)(2906002)(86362001)(53546011)(66476007)(186003)(31696002)(26005)(956004)(6486002)(54906003)(66946007)(66556008)(31686004)(83380400001)(5660300002)(4326008)(107886003)(36756003)(316002)(8676002)(8936002)(478600001)(16526019)(6666004)(16576012)(4744005)(38100700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZStoMnNBcGFTNlpNUlV4VjVweTFSQWdWVzBsSVpTVnBpbnA4N3JQNWJUeFZ4?=
 =?utf-8?B?cmllaFdnL0Z2bDh6WUgxOHd1bG91SnpqY29ON2wvL1cyWTh0Y2R0UnJSSC9p?=
 =?utf-8?B?ODJkT3FXSHNydWJ1ekFyMVMwWDZWQTl5ZnkvbkZJZlFqM3Nmd2FaWnVyYS9z?=
 =?utf-8?B?bTVxZGxTWGdzUUFVbVBZbzRzd2pWdWszbndRd3Z5R1BVdnhuQnY4M3d5MXJS?=
 =?utf-8?B?ZThkS3ZsendRTlM1em5rL0V2QkI5WjlYUEJsak8xbE5NT2ZsTHRCdVZ0cnRH?=
 =?utf-8?B?T3RNMmdUYXBYd2c2dzViUU9HcnhnV2Z1MW1NZzg3N3hRTlg5c2cxK2FjQldm?=
 =?utf-8?B?VFpkbDNFZDYvWFd5cGdySTlZTDIyUlp5Si8yT2NiT2ZBem9YcUt5akdzcFQ5?=
 =?utf-8?B?QmFDd1hOSm9DNkp3OStOWDh4bmFJZHk4UVh2c0RoZWdyOTVQSUlMaHdSVHkv?=
 =?utf-8?B?MEN6VEE4M3JaMitsV3cxSGtEeU1xeStqVVU1aHdMWk5USEJqc0VGYUlVcHFD?=
 =?utf-8?B?bmRFNVZhOCtyajI3SXZIRU9EazJDZHBiL29aME15cmVHZ3Y4VEZHOFdYUGpJ?=
 =?utf-8?B?V0RYRGFkMFNYc25GVUFtWm5ZSnJzdnlOeWQ0TitTVE1NWU1HUVUvUTlnYThv?=
 =?utf-8?B?Ry93SHlyT0hBSVYwTmRyMEpHRCtPUFdqams4WWJMOUVvTFBzUW1WdndIZm56?=
 =?utf-8?B?dlZyeEdsZjdtR0NpN0FMc3JnWUV6VmVpemc0NWtCVzZPeWxCaW1NMGtIcWZi?=
 =?utf-8?B?a2dQaVNIekVKdWlab3BORFcyK3EyanZlTXBrWUtnblY5MDBKSEpISzQvbyt2?=
 =?utf-8?B?TGpabzFHT2JZZUFtdmphdHZLak1VbFpLVkhkczJjbW85UldmbkZwVElIZC9l?=
 =?utf-8?B?anRnYlFOR0pzMnZCZ2pWdW4zcjhwRW1Fb25OZFRiT1IrSkFzaWRXaE1NK0Jr?=
 =?utf-8?B?Wms3VktCd3l3ZHo3WXhOak13QTkyNThYUDFHbTQ3dDV3aGlRRmRkeFhaNDJC?=
 =?utf-8?B?a05sdmpKeHhOdm1NbkFyZXdwV1dXNkxLL0dBZ0ZRcEYybGhpUnpvVERadXdV?=
 =?utf-8?B?RWdsenQzYlVJZ1V2ZXZHcVcwY1p4TnZ1YzhNZlYxLytpdlhtS2x4L3RtV2ww?=
 =?utf-8?B?bFE4azExVW1DdWtqdHJoNjljbm54V3JLSkpUQ0JXTnhMeDZsWlhobUIzaVQ1?=
 =?utf-8?B?T280T2ZXaEs4c0pRdlZBenBsMnJSOHBIQ0FmSXYrY3BvYW5MQnFROC9jSE5y?=
 =?utf-8?B?WFUzdGpkNzdXSkRlY3lhS2xKTm5vcEo5c0Qyc2ZKdFd6cWZYVVZhR2FvRFNF?=
 =?utf-8?B?Y2lYd2N2T1Q0Zkxxck40MmFiQnlnQ2x0N0U4ZjVvcmpBY0YxOE9vSUtTSU1h?=
 =?utf-8?B?YW1JaURZeE52R1UxUit2SmZKZGlteE1zalpRbGJ2YlZZc25XNFhFYlQ3Y3o5?=
 =?utf-8?B?N2VhRkdSRmhiWDRhQ3hzVk5ZUEVEclRjL295aUhvSThoYzRoeFpmQ2FZRWc4?=
 =?utf-8?B?bGlSSDdkUkpocGZpeWRORWdlMHprZmNVRTRDL3daa2tkWk9QaEdjWDZUb2hC?=
 =?utf-8?B?b2s0b0dMV3NHTWpQWlNrNk5FcTV2cmZSN29rbDZHN3pWWGl0Qzhocm54ZVlz?=
 =?utf-8?B?OUV0NzNoblJEeFJsRVMrMlVmNVZxcDlrU1dzc2FVL3RtVlNrc1RyeFh4VFJp?=
 =?utf-8?B?dVJmUE1YK0JxRkJlcGFxRk5iU3NGejlRaTVtd3hTUHpzb1dTWncxdjRTUDFX?=
 =?utf-8?Q?h2N62NbbcTwLAZ0Pvv3DblLlSebnmK+RGSjLzJC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed4b69c-b97e-4f6d-ed3d-08d8eadc700f
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 13:39:37.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1jl39/rKQAUptd/QOdeODqAMQ5SqazhPNKeVvJsZcMhRpa+LoM480KP29zLPwgo0roAWdPcT3efdLYsgIeTYCsXTcGJFu1zOJDJ2XD5CME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4948
X-OriginatorOrg: citrix.com

On 19/03/2021 13:21, Ian Jackson wrote:
>> a6ed77f1e033 - oxenstored: fix ABI breakage introduced in Xen 4.9.0
>>
>>  The final one is an ABI change, but fixing a regression.
> I'm not sure about this but I think the effect can only be on
> "Reset_watches" ?  I guess I will take it.

The effects of the bug were twofold:
=C2=A0* A client actually requesting Reset_watches has the request rejected
=C2=A0* A client actually requesting Restrict got Reset_watches instead

We spotted the bug when trying to add soft-reset support to Xapi, where
a Reset_watches request got a hard error and the guest choked.

>> Do we want to backport the -Og fixes so we can get ABI checking working?
> As Jan says, I think these are still in a state of flux ?

The ABI checking side, yes, but the -Og is a prerequisite which is
fairly self contained.

~Andrew


