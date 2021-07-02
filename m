Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEC03BA459
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 21:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149317.276083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOp5-00088c-HT; Fri, 02 Jul 2021 19:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149317.276083; Fri, 02 Jul 2021 19:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzOp5-00086m-EE; Fri, 02 Jul 2021 19:27:35 +0000
Received: by outflank-mailman (input) for mailman id 149317;
 Fri, 02 Jul 2021 19:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wENR=L2=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1lzOp4-00086g-0h
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 19:27:34 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c2e29e2-db6b-11eb-83c4-12813bfff9fa;
 Fri, 02 Jul 2021 19:27:33 +0000 (UTC)
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
X-Inumbo-ID: 8c2e29e2-db6b-11eb-83c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625254052;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GJMO5191+CEUfBDPyW4CErq1LZvZxrTzZ4s7qNnQgnc=;
  b=fmKjq6q8da+8RH19x8hXGOOhv+UqeiQyVs2bjGIuGKImsU2eyt0d6uAw
   MxuGUdto2aCfGyap2ZCN7LUpNio5Y9DNuHvC6s5fbtsu1Y3S2CGWI1+Tt
   EBG3lClI1FPj4fr3euaupM+uBkh3dWr1b7+p7tw/evCW7rvobiAsIxAPz
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cnogoSSIE4oS8gDmKv9t9zMdRiq3AhzJb2wkvLQ1BUT3N6p7TmXNTub01jxdJh0vteV4LJMaLu
 cCkEjjt0vsxK8rM9MfJoTG7EJ+nKRP/smE+CQasZtDZqUz2fOfFa94f9E5UVZwNQp+GMtxEFQc
 +iVKBk2XIhgfvTJOrguQXyDTAszsy3vbWaAQqqOpzVQqSL73c0dE/1CINOF6byBTi2qWfm4ick
 mSgUDrWg3Dhs9+HGYDFXAtceSUInjSFROGLmIUC89u1J/opKz4vy+j7gybOdiUH5V3yWvEiW7s
 Qnc=
X-SBRS: 5.1
X-MesageID: 47864395
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5MTxEqrI+gQyl9ZdqT3U/A4aV5vGL9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBfhHO1OkPcs1NCZLXbbUQqTXf1fBO7ZogEIdBeOjdK1uZ
 0QFZSWTeeAcGSS7vyKkjVQcexQuOVvmZrA7Yy1ogYPPGMaH52IrT0JbTpzencGNzWubqBJba
 Z0iPA3wgZINU5nFPhSURI+Lpj+TpDw5d3bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpqXYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuK4O5lbZvuH+9La1wWx4TsOscYa
 9T5YDnlbZrmGqhHjXkVjIF+q30YpxbdS32N3TruaSuonJrdT5CvhMlLfck7wE9HaQGOtJ5Dt
 T/Q9NVfY51P4YrhIJGdao8qJiMeyDwqSylChPbHb2xLtB3B5uKke+t3IkI
X-IronPort-AV: E=Sophos;i="5.83,319,1616472000"; 
   d="scan'208";a="47864395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFREmW0qSW+js5FCssGjV33+CmubV88SX+z0J6S9d8qeMovrLFm6Mqy5ivRig2L1OQuJVRgm/baruWRDK3l5QoXsYh1HUE4ovJSBCTVstlSOMc4cWwgB2E6nXHPcMWqq8m6yPHsTFF+kAp4+BlgABMsA1NZw+CbKSgBd9/4MvXSrcPqlWvrno6fG8A2xEXhhnw5jlGFK9cQLqeVUzuc2r9Ho50psoXymE3t5cBQyG3VjbZN663B4TSyOiXU5OmN400aF5YZEi8C1zmadxBW8MNdqGfEl2lGUJAjrjbY5O93XlXDJ6gdCSLSlwepfjyT6Ph4D3VM8NIuITF6LjqyaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdVih0xujv8YQmEXpMnahM4rVK+2iTrv8F5oQBUTJx0=;
 b=J1m54eCE956lJbm/Ne36GRfMdwB9Vf8Pv25+7e6SKrYCzq2F7b2hPxeBOfrO3dHHod+shmlFHbJWh5pYt7L1/XsqBhSzzJl778/VwoyuC6ogykJxH4jmisGrXCgPxm7uqOOt8MRH6j7xUYtnNceDD7pfn3EEjCGzKR8eWMApbJLeqm9GuCjgJr8Pjcd8RVEOHJTzLNYCf4Xkdj5UBSETUjTT1OJtWOVVWk61xaaCdbHUoqQoy7xUgTfR9dGQOcHbIIcB+XNiZnkzRyEWeN9PkcET1GvwhJZivSsHFW+7b8wy8XcKBnBGFfl41Lbm2iAGW1ntqhnPPRHxsVUHHlskQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdVih0xujv8YQmEXpMnahM4rVK+2iTrv8F5oQBUTJx0=;
 b=ht4Z116AcTCBMAwmEFtTE0647+IQ+NyhnIod+EbHYHD1AXiUgVUVad+yTkW9Hinu5HEFXXGzEAp9enNR1xptulV1+V8TakRJ/6JFwug3tVReWHCaEbHrVDIJ+awL+jiGhyuwKj1bbsZb2qYXm0RyNw+F53obEUYcs2I21yYJ4sA=
To: Olaf Hering <olaf@aepfle.de>, <xen-devel@lists.xenproject.org>
CC: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
References: <20210701095635.15648-1-olaf@aepfle.de>
 <20210701095635.15648-12-olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v20210701 11/40] tools: use sr_is_known_page_type
Message-ID: <b026dd29-4c6c-3e6d-879d-b0339f2c208b@citrix.com>
Date: Fri, 2 Jul 2021 20:27:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210701095635.15648-12-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e5a2f8d-4304-4e45-ac05-08d93d8f6e5e
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5837EDA887D1CFAA4067D3B2BA1F9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hc2ZoRZ/HdrdkR6YeHUs4ExgYyWzVqbJfhsaoTZt1V0E/RC1O7eGdCtjo2bsKzByEB2975NrnMNYvL8TtwEmhNd4yWdzj8TPq1obIB44k5DApWVkJ3mWW0LYXx8EO4RN2mcCeNCVyy0yijy+fXhCaRxc/IXSUIwE2dhnhgug3XKPT1ex6IphfoDZY0dEqa2jfMHDGCdsW5wVBFk/mOgPYuyLe4y+gm0daQeqDjNFi+GIwq3GQVkfyUDJRBhklIdBwoMb1yeaCd/Ll2TNGOle8K/Bct0Mzl2j7Nm4u+NpT70GKQ0jyFlkczcFmZwt7mskuLQaJM8CRXBOxoL2lkoHtjxqUwRnqMrs+WdyTDwDL/HW0ZXN/BmkBpQpT0ddTiVDoAfd1Y+Aulsm8YxTRLu4Wlu508nTKMSZ/d+uah6bCi7IEr9kgtulSw/1UQbCl0UihR9MZgdNZZLByQz1hXVZOP0KKVPA7j8rG5ZwkwL0L0z57+ccYTUf5e5T8R3zs37rFZgclMR/gSbKtLj2WmKhjVUXTFmpIfPiY+0EfwGl4Inv3dXSn+LVvM3VH+ifdnWxaxJQWEJiZfh5YYqLHa43vy3Z78IVILi561ruOt1mgeO5uNyhsdAv4gZucepex2dxxT0t14WXA+ZQoP3mj8uisJphjuQUvQ2qvVG4Y1ibgssNnQ4aQh5Tdo/qaPloWERyXbtS5wsTbFvudY63FuSvVB8QcuGVEREvGz06BoQOwSYiJxG4NVQxVWllFXisIGuF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(36756003)(956004)(31696002)(86362001)(186003)(83380400001)(8676002)(8936002)(2616005)(26005)(31686004)(16526019)(6486002)(54906003)(66946007)(5660300002)(66476007)(316002)(4326008)(16576012)(38100700002)(66556008)(6666004)(4744005)(2906002)(478600001)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDh5ejlSdmVUc0VqVnhMWEZsN2ExVUJiU2RTMlJvRUM2NzhHcjQyTFZRRDdR?=
 =?utf-8?B?M0V2V2c3Vi9hR0xYNmNheHpOczNpVER4V0tFa0pXRk91d3hoQkdHeGJrZFB0?=
 =?utf-8?B?UFVsamJFQzFobE5lTDNDdEVhWTEzYVl2Z1Q3QlRvcm5WUE9td2k2andmS2Mw?=
 =?utf-8?B?R3h0bTl4T0RiU3h5RWNMRTV1dFMzQmJCQXBtaFUvNWJZaHN4UzVkK3VHYlRl?=
 =?utf-8?B?a1JlVzFYV2QxajZ2Z25GbHlIVjhuQTZ1Z3lkZFlqbWxvQmx6WURCaVVmMGFP?=
 =?utf-8?B?Y0g4TG9iZngrUzEwZVR0NXNwR3B3RmlKN1FzNEIzUG9xVlNOUHQxK3UvTU5o?=
 =?utf-8?B?ZnBzRTZZMGhxMkpCK0U5L0J5enVDRmpxVmIzNEdZNktFb1h2bURIT1kvM2F4?=
 =?utf-8?B?dVJXQ1BzU1dmZU9ydDNDUnVpUDJxZi9tYk9hSkhqQjlvbWRNaEJJbzRiMGRP?=
 =?utf-8?B?d1FDaEpVeVMveUR6cHEvdStGM1lwbmZCVzVRMEdzNGR0TmRieG5SSHhlS0Ru?=
 =?utf-8?B?MlVtbDBQdkwzVUpybWUxTE1oZk9xTlJ3aTVuU3FXSnpkSFBmcXJmNUlZQnlY?=
 =?utf-8?B?MFhidlhEQkF2ejBlNEJud3BKVUhyTG1uS3NlSkx1ZVF2ejc3OGNIRDkrMTlq?=
 =?utf-8?B?ZnZ5eW8zZzRsMFFwT0NHWDVWNzRhV2RCZEgwcGVtampwa3oxVHc4cUxac0Y1?=
 =?utf-8?B?UlBhSmo3SnlockZ1cVdDWlc4bFhzQXBBV2ZmREhNQUlhckdIeHR1eGYzY0V3?=
 =?utf-8?B?TU5ZZXdsT2NxQldiM2FBaFIvWW40OVBzREZsZEpKVXlBWXJYSmdFWDVGYUhC?=
 =?utf-8?B?aVUrYnlVKzR0SGFVRXN6VFVTKzA4QlRBQkhiMXd6RHBnMEpFTTlxVHMrY2wz?=
 =?utf-8?B?YU9NUG8xVWdjTHhUd1FNekdrWHVFVEcrTlBNZ1VsbkZpRTRyVVliejcvWjdG?=
 =?utf-8?B?L3h6dENqK0JiVk5vaFN6ZFZOTllGNnJXKzU1K1pMeGUyRXpTeFpodUpQQnZr?=
 =?utf-8?B?SVdZVGR5SVR3MGJ0QVBpZHJscGdwRHZENE9NM3RoQVpPTTMvUWIxYXB3QW9U?=
 =?utf-8?B?dlBPS1VibzZvM0hGT0VOOU1VSzN2OU5JN1JiZlYzRHp1ZUE1VHhoNUxHV1g2?=
 =?utf-8?B?eTNXUlBPbjlyVXF2T0RDVFYrYnBLb0Fiay9VdG9IZGdkSGtDYTkxdlg3QVdp?=
 =?utf-8?B?Y0kwQkdjT3dma3FwTkpLWlh5VlFwZmhJdnhib1F5amVxa1lYYWVJNHk4Mmpq?=
 =?utf-8?B?U0VoaXdxSk9EU29DOWlSenJEdjFVVms0WGlIN01tZ0RvQjc2bndON1d0Mlpl?=
 =?utf-8?B?RHJUcHkxM3EyS3pzSDdoSWppNVFPMFlKY09TeXdCbWFDaG1HUnlLTDJxTE14?=
 =?utf-8?B?bUJpMTJtczQ0K1JHQ2tWZ1gvRVpNWjFIci9leEZZLzNzRXUrN2NkRzMvNElt?=
 =?utf-8?B?VzNUV1VYYS9KY2lCWlhHNDEyN2xFTHgrR1YzZzAyRCtVSS9icUI4RnFwcjZu?=
 =?utf-8?B?OCs4ZlpKS25BbHJjcG5HbVJsaERBanU3cVZOQk5sQytLSmh3VGwrUnh1WFJO?=
 =?utf-8?B?cDFkMWwwT21XZU1uOC9yeElsbHhERG83eERTN0lKZEpEZ3pGWStkUFEyN2hJ?=
 =?utf-8?B?SVBvMjRmSG1lYkFuUWtPV0RDNDhPUkpSTm9zOXMwakJvcysyckdzbHpGYm5h?=
 =?utf-8?B?MnZJLzNWSWhiK3pnVHVjVWlsakVBU3NXU0dha2YvN0ZvT1BiQ09obmVYZ0N5?=
 =?utf-8?Q?LQyJUpkIgpemWGb8FiQ4eQ+2brHlUoXdoZIELfj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5a2f8d-4304-4e45-ac05-08d93d8f6e5e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 19:27:29.2860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kohGHpSfhKy6OGhT3r23R2jExywl1DVkvH/q7OLRq96rygVc7dG+XzC0UWtSH6itzZzjTvinYSBnMVHEhR/+ttg2p9WEazqNmilrgnhRXKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 01/07/2021 10:56, Olaf Hering wrote:
> Verify pfn type on sending side, also verify incoming batch of pfns.
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> Reviewed-by: Juergen Gross <jgross@suse.com>

Any reason this isn't folded into the previous patch, like your
subsequent two page type helper patches are?

> diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/save.=
c
> index ae3e8797d0..6f820ea432 100644
> --- a/tools/libs/saverestore/save.c
> +++ b/tools/libs/saverestore/save.c
> @@ -147,6 +147,12 @@ static int write_batch(struct xc_sr_context *ctx)
> =20
>      for ( i =3D 0; i < nr_pfns; ++i )
>      {
> +        if ( sr_is_known_page_type(types[i]) =3D=3D false )
> +        {
> +            ERROR("Wrong type %#"PRIpfn" for pfn %#"PRIpfn, types[i], mf=
ns[i]);

"Unknown type" would be more accurate.

~Andrew


