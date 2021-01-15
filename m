Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152592F7784
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 12:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67970.121543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NAA-0005C9-Cy; Fri, 15 Jan 2021 11:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67970.121543; Fri, 15 Jan 2021 11:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0NAA-0005Bk-9X; Fri, 15 Jan 2021 11:21:06 +0000
Received: by outflank-mailman (input) for mailman id 67970;
 Fri, 15 Jan 2021 11:21:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0NA8-0005Bf-MI
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 11:21:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 45438794-e843-449d-864e-376adb8100a1;
 Fri, 15 Jan 2021 11:21:03 +0000 (UTC)
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
X-Inumbo-ID: 45438794-e843-449d-864e-376adb8100a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610709663;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NHzQ7BMGozyB6GjqKgG3IOzwjfMZ7wI4oQAHcB8kUCM=;
  b=FjGheosiugSx1N3IObhtGwBdZa7BK8fhDTrQWfMnBInoKK2/ml1r2D4a
   ZlMQl+gb2HWuNvieb3HQQ0df0yYCGYufa0A2asjTvMddVszYIfiyZJSQQ
   MGY+0IXalpN6nmiiuuIVBFiCtgVSx9MAxTejCoD9kKedRmRn0Z9e4cP7C
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: XITJ2p/sfI/MjuQNun8odNjdfUOpvRAzgS/ek0ikabJc/m7e0mX9/fVfDHuMHs7i4U6mvSAvY8
 9ZU7Y8U6d0v60yAHsCAfcMb4xGBDRhlhGttguKNSAuM50I4qPgesPb3yHSqr+uf+Mm3phtMMiG
 ICFqfcZYUTy0ObpCDbhljRenUX1fzPL0OxQlDC6QEdbfGMq0OCVtn+dycQC2mF/D2jSj0kgk6k
 4hGfYZ4K9n6E/aI2CRPQWwkgciH+RqpnmoWMvy/mqIFxgZE2MZASc1qB46072LmYCtOkIBtSTj
 2a0=
X-SBRS: 5.2
X-MesageID: 35381189
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35381189"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcO3fB4k7DzR76myho0OuY/7z/3i1GY/JEbAAi1+nfKRo0poueb+XqTnIKMEjOclbIHg+Al0IomSGsyZBg7aGtoI04m1SfsR5BIZCI4RhiysTBQ6gZXZJ/gIGxBR0AuB01hLlj9eXT4rjncrvIxVb+Kt9n27Zgf0T7k20KrB8UIRVpAjSImku8xW/b97U3fHvHDp0tWXtYEIsDb2iVUtqUtYGQ0j6gdnAHlOW5f4LJIrk3FtRj2fNcSwaiiTi06hZK+FVw/UriADGyqeRzPIX13hGIjbjyV9YyK8x4376qI9x8yogX/b8zLtlS5cobbGnnIGH8Kz8i9ISAoLplSHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHzQ7BMGozyB6GjqKgG3IOzwjfMZ7wI4oQAHcB8kUCM=;
 b=mQPAnjqLR+7DZI1tViEVCSOTUsBmmevHCu8wk0Qyp30Gcvi/zPOKO+WH9Lr9hz0QrlDR1Ph6yubiZaV4f18i2hCmOVaxnuptKDMqI4gDYf/Xph+ss4fIQ9LnHfMinUzEPurbnjegKxD/pvGWUE2xKWrrqREwTAViEACkPKxHponzk0o/i4MdqfqBFqYjx4n5Oz0G8vGulMYQxZhIqegPlvCbdbEVt6dSFSIQ8xiwQkONE18w/R0DXbMsjy05AfYeDkTxk7SiWJvCcO1p9sl5JFwjylh8smY5BpZxtZvDKVCwa8pdK+Gn5lXuF0YD31kVqn86MShUISApf57bzPxQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHzQ7BMGozyB6GjqKgG3IOzwjfMZ7wI4oQAHcB8kUCM=;
 b=NvgKhUsytYSQphAzlIyNQmMbog2vveVSsOyabhU5bROEr3+C3Gl+iBiU6MuDSZqjP69gK5oZanw3dtKJwEOZPzxIMCdMWYkPam+oYUv/rGIP4DrL5JWM9/nYezWqJr7/Pc1wxAaptUqdLXQgKKE/axXgzmjTdSrsNAjSK6kKSH0=
Subject: Re: [PATCH 3/3] x86/Dom0: support zstd compressed kernels
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, M A Young
	<m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
 <09a4795b-0d9f-a078-63e6-22d5aaa1878b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ee1c251d-5347-c6c0-e8e9-8cfbf68a5d19@citrix.com>
Date: Fri, 15 Jan 2021 11:20:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <09a4795b-0d9f-a078-63e6-22d5aaa1878b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO3P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:ba::16) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8856109-9b07-4a41-d430-08d8b9479610
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5807AEA12E7456A7B2417498BAA70@SJ0PR03MB5807.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:419;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LHrVcmiF7grAzI9AQbo1L7dxX1g0R7v4LQt1M9Mvl/7ddni4j0JTUhuIv3UM3LGtUIuvu2+xN3WFFgtcep7DVnGJ1rzSunxMVgtvJS458dEQTGB248hejq/HtldJE9oJXeBk9sLut9XLi1qMmfBTEEbAzc7R/slhXKBX5tGs3Hmmyzfz6UlU9RBOlAiqNZ1mYB6i//kP6Kdj8MOoYh1YTCOLpZhH7UAyghSED4/Xnd1ebGaSrGOEtMgA0SAYBv6We+02B3Bd0KOx5Nj7DvH6SW56Fmk0LYsowlcxCqkSYWBQqBLlJF6Zu9fKgWxyoNeVrXHpRvEy9FOadUT6QVE/EUw5zvCux2iIury07XN9iRqdj1pa614Bl95/FuaNCaUWAlf6UXx0BES8yeqoKUKFnj5RuGAZj3KH7lCPhUbhcXv0tgE07U/cC9DmyyyObdqQS6/Ugbjv5shy/xonnuINwtTvRO/9aFHIVuL/vr947nY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(26005)(5660300002)(8936002)(2906002)(110136005)(36756003)(6486002)(54906003)(83380400001)(16526019)(53546011)(186003)(8676002)(6666004)(2616005)(316002)(66556008)(66476007)(66946007)(478600001)(4744005)(31696002)(31686004)(16576012)(296002)(4326008)(86362001)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SEFHVE1DL2psdEFoOXJ5QUl5Rmlab1h5UW5pUjdybFhIc3MzYzVTbnhkQk9C?=
 =?utf-8?B?aVl6c2J2T2xQK1hua1doQkh2azk4NzVINWhVZ3pWUUl1U1VuOW1XNjF0ZGZR?=
 =?utf-8?B?U3VPcDYvdlFwU2N4K3duT0FxSjNQaUlBWGlrMmFudUFXSE0wdURaazRONnJE?=
 =?utf-8?B?eXFWN1Z3b3dpRm5meHFZMC9aS1JoSFpkNWFDQ1lPb0JTVkhWMTZ2dlNVdHZn?=
 =?utf-8?B?QnRlK0hGNmo0Z2RYSDZOQW1rdlVxcGJEQXJGbDBPejNEbHliYnVzYURaRlpo?=
 =?utf-8?B?RGJ4cVVaK1VvSVhad0hmUGxIbGJiUGw0clgveEVrNldNZndHTzFvVGIvb09K?=
 =?utf-8?B?dzZidkNFeXU2bWROZnBkalNiczluMzMva1dRRGhGTDBJWlBUZ1lTU2tLZDFZ?=
 =?utf-8?B?MmxLMFVNS1NJZFRjTTY3eEFxcFhYVmxFZzBXVjV4YTE1UVhkVDlQVncwVHFD?=
 =?utf-8?B?blZWK1RLYkRWYW5XbkJucTQxWnM0a2FrTnNPR05wQW8rRVpFd09nMEk5QlhC?=
 =?utf-8?B?eXFHWDdkMjVBeDY5WDRPODlJZ01VVzU5QjdSYTZvY29DU1RtbGhIYzJIcFZV?=
 =?utf-8?B?Z0RLc04zQjZRSWRub25YY2FDSGNwMGMvczF1VnNRMXQzVXNwWHBhZ1Vub2hO?=
 =?utf-8?B?cmRhRkVMTUl0b0NKU3J2OU5XRnh1U2VhRHhmbXZXay80akxnU01pbkhYdzU0?=
 =?utf-8?B?RU5EeVUxTFBUTlJWZUFSc2MzTlk5UmhPN0w3TDFIZGlNU05rcnN1WkZMeTBa?=
 =?utf-8?B?cU9CdjRDMEhtb0NMbDl2SGNFZXN2UzI4ZWdpbXZmcXhFVnFBOTVEVzI2UG5n?=
 =?utf-8?B?VTNQRGxQTElsWHpVSTZSNUVsQk4yRk53d0o3NTk5Tm5sR0daYjhRdzlnZEZy?=
 =?utf-8?B?cjg2dnVYR2lBNFBYYkdaOElNU1hvU0wraDNYZHlienhVYysvb1FtTTY4MGRp?=
 =?utf-8?B?WERuVU9pV25TVUdkTHVSWU4vV2UrVnlVMWd3azZkUmtQZG44TWdBbCtVbzNw?=
 =?utf-8?B?c3JGUjcrSHdjK1UwTi9HNjVXU3UvL0hKR2hISHZ3cnB2NWhsZ2NMaGRSQW5S?=
 =?utf-8?B?RE50MHBMeXFEeHdWSkc5aE5BL2VYajIvR2wwd2s3Rkh1RGFqV2daKzVITlY0?=
 =?utf-8?B?RnF4OUtGRVNtc0VTZGkyam1BN3ZkMkhiT3QyakE0TGxCZ2JHQm9tcWwzVFpk?=
 =?utf-8?B?bGhHMms4NGtDbkNyV0VMMUNGeG4zcERDUFZ3SHlUQTQySW1oYXMxckhCamlt?=
 =?utf-8?B?N21aUCszbUUxdytmOWsvT040cUttOEgzM0Z2UTI4ZmhvZDhtVUhaaUtFVzkr?=
 =?utf-8?Q?Lh1vL2pcFyMTWzODpLNhRf1vW1rc3A/jgv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8856109-9b07-4a41-d430-08d8b9479610
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 11:20:38.6146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8wpmIT/7bz3ZZC4ivi6Tx5y6ojBfdvVvW4JcrNW943e7MRm0kkRi69rrUAn4pb1uZwOZSOMdbq7dJusLE8lx+Cx8nIzpDrCgIA3JVVHagU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5807
X-OriginatorOrg: citrix.com

On 15/01/2021 10:06, Jan Beulich wrote:
> Taken from Linux at commit 1c4dd334df3a ("lib: decompress_unzstd: Limit
> output size") for unzstd.c (renamed from decompress_unzstd.c) and
> 36f9ff9e03de ("lib: Fix fall-through warnings for Clang") for zstd/,
> with bits from linux/zstd.h merged into suitable other headers.
>
> To limit the editing necessary, introduce ptrdiff_t.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

