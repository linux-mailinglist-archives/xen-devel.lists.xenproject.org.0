Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DBD36593E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113640.216571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpp6-0000Rq-RE; Tue, 20 Apr 2021 12:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113640.216571; Tue, 20 Apr 2021 12:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpp6-0000RQ-Np; Tue, 20 Apr 2021 12:49:48 +0000
Received: by outflank-mailman (input) for mailman id 113640;
 Tue, 20 Apr 2021 12:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NaoY=JR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYpp5-0000RL-61
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:49:47 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id adbe9748-2efe-49db-a26f-dd4c3460fbd2;
 Tue, 20 Apr 2021 12:49:45 +0000 (UTC)
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
X-Inumbo-ID: adbe9748-2efe-49db-a26f-dd4c3460fbd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618922985;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=j73PFgf2gBL04/CdZUEdpjnzEcNTxgT7WVKg5lLwGsw=;
  b=ZSgGyBlLNX6H7PluMHsd9bJPrwXqvcAVtN8aMa5KFIJRZGEoAdiXONqS
   wAhlrlniIXSZSGl3xFPSAeW0FBcGa+zqsZeOuCbBhUI2BSg/WuBhCxRri
   T6vGsum8gzT6HCeuGVqLJSI+D0vbF8PqxMJmA7xUowsTExugNXzn15fwz
   0=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xlC/ltGjb8pJ/m68uU5CsWR7SlEmxqtyCGWrXDjDx0f2eNIpQdUPr1EDNdcdsDHTdubtk+arQw
 +aPcbHewJYzf5aoE5SnECZXDuBam5rn0ELR6MOwTzTrNkhRhqRXvZFhfhS5Ci0jXcnv7cS3818
 68hGajrVJoC1j15ucngq4ydujMtRzgFEhgJgVO7oiwoG8VOaLhHyrHZfnj1Rtvaoh60LSBXb5c
 SzOISl5lMEpZuUfYGOCFUBzs8nZ6Mi9aZ3S+fgl9Gu3T3OhLOdQidDG5KXQ5ejz4hKAcgL9zow
 cY4=
X-SBRS: 5.2
X-MesageID: 42102166
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:qbH8Pa2oqPmXZfGk7lO50QqjBR93eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/FIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmtJ1/Z
 xLN5JzANiYNzVHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcBdxi1SYzzrd3Febg9AGJY/Cd
 647s1IuzKvdR0sH7uGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnl4j41VTRTzbA+tV
 XUigCR3NTfj9iX6D/5k1XS4ZNfhcf7xrJ4avCkp8AJJlzX+36VTat7XbnqhkFTnMiO7xIQnM
 DIs1McOa1ImgnsV0WUhTeo5AX6yjYp7BbZuCylqF/uu9bwSj5/K+cpv/MhTjLj50AtvM5x3c
 twtgrz3fonbmK0oA3H69fFTB1snEavyEBS9dI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Meav302fA+SyL5U1nkpGV1hPSjUnMvdy32OXQqi4i+1jhbm21B1E0IxMATtWdozuNNd7B0o8
 vDKahmj7dIU4s/ar98Hv4IRY+NBnXKWg+kChPcHX3XUIU8f17doZ/+57s4oMmsZZwz1ZM33L
 DMSklRu2Iec1/nYPf+kqFjw1ToeiGQTD7twsZR69xSobvnXofmNiWFVRQHj9agi+93OLyZZ9
 +DfLZtR9PzJ2rnHohEmyfkXYNJFHUYWMoJ/v4mRlO1pN7RIIGCjJ2aTN/jYJ7WVRo0UGL2BX
 UOGBLpIt9b00ytUnjkxDfLXXfAfVH+4IJQHKDW8/N78vlJCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4Um6lFy4q1lBC154NAJ48b/gW3RFqUshKEXva4sOvN2ZZCR31HuDLRlvctPOHG
 dk1hNK0JPyC6bV6TEpCtqhPG7fpWAUvmi2Q5AVnbDGwsv5ZJUiDNIDVLZqHQvGUzx58Dwa6V
 trWUshfAvyBznugaKqgNg/H+fEbeRxhw+tPIpzsnLQtUKVoOk1XXsFVzuSUcqa6DxeBQZ8tx
 lUyesykbCAkTGgJS8Um+IjKmBBb2yRHfZ7FgifXZ5VnbrqYQl0am+PiVWh+lcOU1uv039Xqn
 3qLCWSd/2OJlZGoHhX3pzn905OenyHc1h9bW17toNBBX3L00wDo9OjV+6W6S+8e1ECyuYSPH
 X+bTweLhhH6vq32BSW8QzyX0kO99ELBKjwHb4je7bc1jeRM4WOj7gBBOIR1o1iLsrSvugCVv
 +/dweZICjjMf4g3xWYqx8eSXBJgUhhtcmt9Azu7WC+0nJ6POHbJ05+QaoHZ/6b9GrpSp+zod
 xEpONwmdH1FGr/atSLk/6KKxFCLw7eum6wQaUDr4tOsac7qbt0GN36XFLzpQZ69SR7CP2xsk
 UUBJlfyvTmHKREesQJYSJX/lYzjr20XQAWmz2zJtV7RE0nin/QAsiA7LXJo4c+G0HpnnqFBX
 Cvtwlmu8rfVySN1bQmG7s9DGRfZk878mlj9oq5BvvtITTvU+FI51yhNHChNJdbVaieAL0Vxy
 wKru2grquydyDi3hrXsiY+CqVS83y/Scf3JA6XA+ZH/5ibPluL65HarPKbvXPSSTGhbV4fip
 AAXUsMbt5bgj1ntbYJ6EGJO+TKi3NgtUBf7zFhnkPs3YbjwF6zJzA5DSTpxrNMXTdSNXCUi9
 /i6ubw7gWk3AR4
X-IronPort-AV: E=Sophos;i="5.82,236,1613451600"; 
   d="scan'208";a="42102166"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mks9l5J+jZwTyOQ1d+7QG5Gekad9j4C6oySuQ9wyy4iMa+HS+XUXCytOYgMyHQ08vHtcTOo3ykg9EtgfUkf3zdc4S0mUHjBnnts0LSSry1W6bqU2cYItB8qF24+itNVx4usMdWcRM8E9acC4wPJVNKJnI0V6cNPFGVYDpkoKv7L6BFqufT4QpjqmG4IpwOb0a7gskjy+jJtGgjyx1t2LMsxpXnjrAektT5akeh2X58sGJ0I0NWuvOhkV0DpIrNCGKBBj8dPi/LH7yG/TwP/HwkyWMGMWp9m5bHGKyeWhMBSkwo0ik1Aaa4KHt8V+Q7cWIWKdcR9TjGPPlelbvrxcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY1Gk+EUG6GQcVxbsf3kwqpM8oM+KQ7/OZt6PWh+BJg=;
 b=IP0bpOBdAbRYbMJh/mbTID3Km7fjuXO+FnNQl8UVr/Bu8yjpuHbfXHARB/4CzRgQhx1K2oTEpp3RzgazeKNHyR2hYXha/PnhsddXdH3vpOmMVAfUc/K2rQjwvjYxi59+NVNQa930AkvOpc4AvDKp7gKjJNqfTyNcteWvKrVRihFZ7RTYw1RH7cKh0rfi7iiETEQ3tLcczDmD7frLt0UpwAckubTpJoLAG2bnCr9nZREU00LolBVObPHM/q2Lwv2UgKYIj+akGDlOFymRouY2NYzklLnrbIWpvW3dFbYzVRM0uoUGnd7vd0dlKntWgpaWXUvyCz3s68LpJryVxzibNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eY1Gk+EUG6GQcVxbsf3kwqpM8oM+KQ7/OZt6PWh+BJg=;
 b=q2MWGfb+nUQsIrehqpN2/0ri6YOLCogaJb+BEe3RlUItx0FMnKEV5Dm+YgjBOiCAO0xCs1dF5BiQSc5dMTFYoKok7d67QDAzRy1vM0bru1qdhNqSE8IPXUV3lVCtCf1GqoP9bCXeMS3yFWdH251dCFB1nuBfWD8/To49bl+lp08=
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20210415144731.3356-1-roger.pau@citrix.com>
 <20210415144731.3356-3-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
Message-ID: <9879c2d3-4c59-2058-b4eb-43ec2f316ef8@citrix.com>
Date: Tue, 20 Apr 2021 13:49:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210415144731.3356-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8febdb91-2862-4183-e2d2-08d903fac486
X-MS-TrafficTypeDiagnostic: BY5PR03MB5346:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR03MB53468BA6B137150695169B31BA489@BY5PR03MB5346.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6DUP9eujRzM9VpLFQHtFJ110HGHEPtul0DHSMpI8FgVzXgRkduJIyLb2yBSnBotl6/UyOEER5F7RrP3uVKuoAPtrkxXeJ5WHJEqOgkJkNDFgon8gW8McD5gdkisgVXK2MT3Xb3xn1ffB2fxp/BqZy3H1OxQr26LZ9tOP0cWF8t2pq1meCXQy66yvUxhpH03vVCia4KG8CXGm4U+XTvvLf7ilqmSE4kn+Qlz50P3ucbnI6yw5E52tuhUTWlzdwDVYQ7pEEXd2zAEKKVgB5737vHc7Q7NEnicSX0VYSEwysgFa6zihw3xlZVphxGx6ClvPRwulSPbsyEwjGQSExsqcq580Rxuxx16N3+6npF8qKX0vju3EEeH+kS/2opoHq8XyTGbDKuNciUIdW6/Ushx5SQypAKZKNlHEpvRrjuh6Ztp1KtAWg8WR/2iUpB+bjN1Bk1h080lMorFXF+x9lIkCUGokbneK7ifnJitOb0cSYtDiamVO9F4LfP97t8qaeKCnEabeH8XlYnlpCzIS1WPLkfuCeDhnzY5R+EdtOweKpdPTdlqPSEBB0UYsen9vNzBluuFXhuufUoA1apx9t8LNj9dlBk+qNlW2Ifp8iyV/Qk/uwCXSty24uGxoZ6K1V+cOgeiC5TOUL5eYTahS3KoKOqFDT/YvT1ovRwcSlgDpV2/mzTIeioT8jwyV8bm2BTo9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(956004)(8676002)(83380400001)(4326008)(66946007)(5660300002)(36756003)(8936002)(2616005)(2906002)(26005)(478600001)(316002)(54906003)(6666004)(16576012)(6486002)(66476007)(53546011)(31686004)(86362001)(16526019)(38100700002)(186003)(31696002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SUVhN0NhSkR4TmFFRFNwM2s4Y1FMelFsc0RuWTZwVS9ZUnF2OVluZmRPVVBO?=
 =?utf-8?B?TnhpV0dOS0V2dmJ1d0p3aVRZNmVFU0taR0RIWEJnbUIrRHhiVXlHdVp5LzhI?=
 =?utf-8?B?akI5eWRUSVc1dnkycUlsMXJ0b2hSZUZkMnRWMU1qMi9iQzFkS2VROVhxQjMy?=
 =?utf-8?B?cnhuVi9NczdWRDNNSnRESGFxQ0JGaXAySU5zNEdkZlh4NG1PcWtyakozdGFu?=
 =?utf-8?B?bEcxWWRZR0VxMkRmampQa255cjNuU2Z5RWVPL1pxckFkVmlBZjkvYkVyTlhI?=
 =?utf-8?B?anIxemdtQkNQUFI3TnhQTmN3ekJ0RGJDOTY3aDJlc1NCbEJNL2pUZ0MyUk9i?=
 =?utf-8?B?RlhKL2psUnljazFtQzZ0RHJjeW1wUnROcWRGS1lkdWNqdEhuNCttRys3SEsr?=
 =?utf-8?B?Y3FCRnlzY3FYMjdZdEw2WnlPTzhTOUVLR2cwMDltRmp4d0JjU3lISWN4ekJo?=
 =?utf-8?B?ZGR6ZThpMW5iTzh3VXlOQmRvR1VQd3ozN01XSjhERzVDNTJJa3EyTkhFT24w?=
 =?utf-8?B?K1FpTTQza2FNdHdTTklGTXdkWnQ5aDhpRFltQUx5aUp4eHhid0FvdkxpUkpL?=
 =?utf-8?B?L3RRcW1OZmlLWXpXR0o3VWhiRHJpb0RsMXc2OG9qNW5NNkR5TXNyemRPSmRX?=
 =?utf-8?B?c0IvaFdyZDBRQ0dMaWZDWGV5Uyt2aXlZOXM0NDcweVlyRmxwTGNwUU15L3Nk?=
 =?utf-8?B?aVpsc0xGUTlwN1RMV3diTkNzczVUK0tHUmxQYTBlS0NQMGxMWjVDdzM5SGFF?=
 =?utf-8?B?T2pUZUFzVkhhbFJZd1drRURDWlBXZk9PemtUN0F4aGU1MjcxK3JjYWNEcjVO?=
 =?utf-8?B?UFFoWDNlNGVIaXVVc3BacVhtL04vRkRlR3JyQk1pQzYwa1NmaVlKNlhUQ0ZW?=
 =?utf-8?B?UmlJbnI2VytYeHlLZVJkWnU5MFZrc3BJVlVNby8zVzdwUm1OZUcxNEVjb1pL?=
 =?utf-8?B?R292NHcvWTVqV2Mzc25iM2ozamQ1V3J4Z2hMUXFXWFh4U3NCSEpqUUJ4Ujgv?=
 =?utf-8?B?Nk44YVVtZGFYMWFtTGR3M1JIeHdFbSszZllqU0xxcEFFUWtxUXBieXBvWi85?=
 =?utf-8?B?TFJLT1MreExBaXdIZUFDdnRUU1NoK0hUbmYrUER1SWNTZVVVUGtYd0tCTWdh?=
 =?utf-8?B?Snk5NThQbUEvOEtvbDZpb21ENVNzZU1panFTSEZ5VW9EMmJXRUJOdTJTOFNu?=
 =?utf-8?B?eGxpRnVxZDM1U2hJdU5qSUhFRlpUOTFMeHNHRUVOeHcxeVdENFhuTXF1S3Zx?=
 =?utf-8?B?ZUo0alZMQkh6ZW9USUNRS2g1RlRxMEx5Y1pTZFhlck1ibGcvbGdEMmkzTWJa?=
 =?utf-8?B?MVI4TmMxWUxqbEN5dWdJRWVNMUVDK1hBU1FYMU5pbTh1VCs5M25oL1dLUUl6?=
 =?utf-8?B?WFJmNGV6eDRoaVZpSGxweTlUUmJ4MU1kTTdCOTFGOVVQQ1hiSStscmhQejls?=
 =?utf-8?B?NnQ5QWNHWW8rY0lPR3ZBTFdSQUhIQjQ1RS9WcDhBUGpFZ0RBZ2FoaGw1bTNm?=
 =?utf-8?B?Q2pBTUVES0lrbktQZi9xT2lOcWR3eldYdnNMU1kyK0NPSmhjWHgyRGgvT0Q2?=
 =?utf-8?B?RUs0elk3MHNvMUNDdmZiMzFWS3h6NklwQkZvS3hKTThWT0NsY0FMTmJNRUFj?=
 =?utf-8?B?K0lqaEZ0eWJZRXhHb0RkWkQxb084emZIbjg4dENaQjBtL1lrVVNkZjFkeFpv?=
 =?utf-8?B?M3EydFVjOU9weFZWVTVvZHlJRTIxQ0hiMW05QytMMVRIekxsREVFYVlNM3Nw?=
 =?utf-8?Q?5DPxytcRYs7hIbSmp9ZOx7OvWiuxfBwd4lcEx1B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8febdb91-2862-4183-e2d2-08d903fac486
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 12:49:42.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 345/TJzSL1DJnWA6ZC7Pe6BlAjLUl+JyYqPomHXWc4ap7TSE0feMgR/rxzYJKQn9hF5snpwUpfV0k6EY3JYl+zhxEI1Q2qVHDk59OtrdhPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5346
X-OriginatorOrg: citrix.com

On 15/04/2021 15:47, Roger Pau Monne wrote:
> AMD Milan (Zen3) CPUs have an LFENCE Always Serializing CPUID bit in
> leaf 80000021.eax. Previous AMD versions used to have a user settable
> bit in DE_CFG MSR to select whether LFENCE was dispatch serializing,
> which Xen always attempts to set. The forcefully always on setting is
> due to the addition of SEV-SNP so that a VMM cannot break the
> confidentiality of a guest.
>
> In order to support this new CPUID bit move the LFENCE_DISPATCH
> synthetic CPUID bit to map the hardware bit (leaving a hole in the
> synthetic range) and either rely on the bit already being set by the
> native CPUID output, or attempt to fake it in Xen by modifying the
> DE_CFG MSR. This requires adding one more entry to the featureset to
> support leaf 80000021.eax.
>
> The bit is exposed to guests by default if the underlying hardware
> supports leaf 80000021, as a way to signal that LFENCE is always
> serializing. Hardware that doesn't have the leaf might also get the
> bit set because Xen has performed the necessary arrangements, but
> that's not yet exposed to guests. Note that Xen doesn't allow guests
> to change the DE_CFG value, so once set by Xen LFENCE will always be
> serializing.
>
> Note that the access to DE_CFG by guests is left as-is: reads will
> unconditionally return LFENCE_SERIALISE bit set, while writes are
> silently dropped.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Rename to lfence+.
>  - Add feature to libxl_cpuid.c.
>  - Reword commit message.
> ---
> Note this doesn't yet expose the bit on hardware that doesn't support
> leaf 80000021. It's still TBD whether we want to hardcode this support
> manually, or instead rely on a more general approach like the one
> suggested by the shrink max CPUID leaf patch from Jan.

I'm going to insist on using the manual approach.=C2=A0 Upping max leaf is
strictly opposite to shrinking logic.

It's very rare that we'll want to extend max leaf beyond what hardware
supports, and it wants calling out clearly, along with identifying why
it is safe to do so in this specific case.

It is not safe or sensible to blindly escalate to the compile time max.=C2=
=A0
The only cases where the differ are bugs needing fixing - the manual
approach has the special case clearly called out, while the blindly
escalate case has the bug hidden in derivation logic somewhere else.

~Andrew


