Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAAE2FA789
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:29:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69921.125340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YKv-0000Nh-Qv; Mon, 18 Jan 2021 17:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69921.125340; Mon, 18 Jan 2021 17:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YKv-0000NI-NJ; Mon, 18 Jan 2021 17:29:05 +0000
Received: by outflank-mailman (input) for mailman id 69921;
 Mon, 18 Jan 2021 17:29:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wFfa=GV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l1YKu-0000ND-9M
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:29:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3967e92d-635b-4e1e-9383-b8a0ee38e976;
 Mon, 18 Jan 2021 17:29:02 +0000 (UTC)
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
X-Inumbo-ID: 3967e92d-635b-4e1e-9383-b8a0ee38e976
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610990942;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=dewQAuvVGGb2VyPQX3euRmg4dh3O50WGaaKQn5ifHuQ=;
  b=Zbw/6j6x+gbLrorAoq9wANiiO5hfGAHfqUcssMbhdsNmdRDBEFgtHHMD
   6Q5GxsZpXYHlD4wJeLg3C3ZKWT3hSZc5cevO1+E7NzeL12y8w/z0MJZhI
   6CnL1AH3z4hktY+3c4+CFgKhosDUSqzrTAEG4lftP8d0w60y79RKX2tIq
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: g0MeItunwvQukE0UOsAKSsM+RSY/Vj5D+20Bm0BFvqFqvmZNK5It0X5jmovXoqnEf6/CeBD41Q
 F4kNG66QYm+4vpgI8KC6Un1u6976tgzBu2kkEzaM06wVc3XzP5cuiTC9clrbRgRNF3vCFOzfM9
 KPj31AwWH0Aj34155IklHGKaggZqzLNGe2hKzeYxIZSXYgSH3ruVtPLuyKzv9g5Wj6dJKR7/Ah
 KBGGS+cwXX9xdf6zw4EHk+5AR8uFEUcwAtpcM3EN+4tIty1U11qgKaGed8dyskWmrHvjPBQaPj
 c5w=
X-SBRS: 5.2
X-MesageID: 35305610
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,356,1602561600"; 
   d="scan'208";a="35305610"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7dfG6h5MRaIl/IQCArU1QtZ6iQ281SZ1u7/zGXYRXS6eS9lEfWW2m4NTfQqBZfc5qwvzEdGm9pIqiFc0OqF3ses+ptcvaK77We/j4BCU19rHzOeLvMlEMs8PkQRhr3DBj1FUhxJIxdbQzwPhlXRkI1HiN77N9UB6dwsqW1NQUlhHRL4b7OKPOGTP1U6kmUUm9/HyGGS87Sb0SmWzm+RkWrUm8DULzU7UpguV8ygv1XpfGJG+4xq8YpHGOxEMlGKjRhpCJtH9FilPz4thwMeB0fDraV8Biqb/YXtHnA6FTwYsiibhRpeY8fCGa2YaiUqBb0KkwJtpEfLsM6wWeM8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gga9SCUuSEho3qdMK+VXWNdTkd4qdqpYbQCLcUvOEwU=;
 b=FzfL5+1skJOlLTzQbmEYZqL61ftZBepcByxgOLuLEhuO+zme6OGtiH1SAmwI0ilZE7khONvQQID8zEaYPtjmo3ICKvJhA7SUseD/wBlIgNSExd/wUokJS15rcDK0eCjV4YlczzlnF6wG1cvso7NBxxakA9xk79w3F8J8EBZxHv2mJhjoxPX9zFJV0jIMDKBycnUpUwDHgDn7TYRQs1YB8Hp1d1wt2JFXCNS4ZqSJB7dA0YWKWJM3XPWQ55sroMpKbgSxtOktYDlLd3MKj6/i+9/Iu7vHBzps5MFovbmRQ6zcXwnbqI0/C28K9Yo8Wdh2iO6HSVAY6xEgD26/MElPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gga9SCUuSEho3qdMK+VXWNdTkd4qdqpYbQCLcUvOEwU=;
 b=eR4txwscF0qKAYTMmZVMGyTTRM5CfeO8fL3SW0I3f1ssO5z/S/h3a31iJg5W+wf6JvG7ZCatR4YtYZjfQcsf6JTj4ORthjrkTF5Hsu7V+t0Y1e7D2iD7GWfbfJsTqKwhkZ3QhAn2ZfenoO720IuCFN3q/RavwwQ+WgFAAFk0z0c=
Date: Mon, 18 Jan 2021 18:28:53 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH] libs/light: Switch NetBSD to QEMU_XEN
Message-ID: <20210118172853.rmg2ckp4lewzc3dd@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-13-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-13-bouyer@antioche.eu.org>
X-ClientProxiedBy: AM6P195CA0090.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f885dea-1551-49b6-a7ed-08d8bbd689e2
X-MS-TrafficTypeDiagnostic: DM6PR03MB5354:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5354D3D828A89E60097BC3DB8FA40@DM6PR03MB5354.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZ0xS14i+WyXFZIZCBGpsQtItCQuONsqZs75/+oO/+eMcQwYw9S9jZuRd2wvjIqG3gXOCV+aqn2juHcxUN+Luuz3pJlp0eJiY0t81YDT+b9WjZ5cgxm+WCKPAfngL20kA0XATvyCt9po8yZKyJyeSeF5FfKGoQ6stMuP6pHQATCBzi7SOWZD369NXjIzripAsxOj3VwtUdNRmOK+p/scGHNiOuLrEh770KTBlaXIcTMlZORJOuIc74H06/tyQUR6GnLkgwDCGNbAG4w5v/eHcS9n4V2fYJdWmnk8blEF+ijI58QqsGeEfNXlxhXcX+23LzkoIvSFEeBN6acleApemgfUoiB8+kdX8Q9W2J1I2cNtFewZpcD9bSLD5cBkq7Ee6F3YmkwPgEv4zruAUt913w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(186003)(54906003)(85182001)(478600001)(8676002)(6666004)(8936002)(16526019)(4326008)(26005)(107886003)(9686003)(86362001)(316002)(4744005)(1076003)(2906002)(956004)(66556008)(6916009)(66946007)(6496006)(6486002)(66476007)(33716001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWxRQzQyRFVaR0hYNWVoTFFNKytlRkdkYVNyRGl5WEdHNzk3SE9yRXhCQjhX?=
 =?utf-8?B?WkFKTFk4ODNSTEswMDUwZnR2UXprOGprWmRNaTZrYVE2MjZ1YU9wcy9JQkRm?=
 =?utf-8?B?dUpOZDBZS2lWb2pkNHNHTjRGM3loOTdBaXJ2bUNpMUh6UnB5L1lLK0ZuS1Vz?=
 =?utf-8?B?Zm0wYXNhWjFwdDZ6NDBmM3pzeE96dnJGYm1DUDhrTkh5NkQ2bWZiMERZNVcz?=
 =?utf-8?B?MUVmbTk0eVc3d2hyVU5LeWVvQlJCQjNoK3lIREIyalFEVXZ5VnJGQm4wVWFh?=
 =?utf-8?B?K1NqWlhlWGNkNGN6WXpMTHcrTHA3cUREc1FqeVRXb04xRUZ4Y0tHNjRhc3NT?=
 =?utf-8?B?Rm1BYTJRdUF0NFdocy9CcDZ5NVFtNldWKzNqdXI1ekRXM1Z0T3BZU080RHZR?=
 =?utf-8?B?TU5zQ0NOOEMrTmdBOXVXT09rQVFRQUljeXkxY0VpN3J4U2dGYjZnZXg2aGJV?=
 =?utf-8?B?REVPVENGYXFMY3I1RlI5Z1VON1VmRHB1a3FaVmZDUm03RFMwQVVodnBJcHFh?=
 =?utf-8?B?Ti9FRkNUVXE3WEFYdjIveDZyZzl0dVJmN3Jld0tVMjExRlVEUVU0dFdFVlVW?=
 =?utf-8?B?YWtlbXdaS3lPZ3A4ZmREQ0tnd1BlUVlnbVpnNG9OY3JiaUV0T29PeklKQm54?=
 =?utf-8?B?UFlQdVB4WlJqb3VyeUVwVm9BTTdzRXlzb2k0WmNSdms4eVF2WlFOODlyNEta?=
 =?utf-8?B?TVNvU0RaQ1ZKbmNQZzROaFhyTVByblg3UUNBK0NLcTh4em05Vk5zT1BGNFRX?=
 =?utf-8?B?N1VpdkJCNDE1T0ZSSEFuMjk0TlExRXBXQnBONjVwRHF1M3BLQWc5WmozSHJP?=
 =?utf-8?B?Qlkwc3lEcnNLb1V4bVBlLyttajlGRFBLV1loRFUvRnZMcTVuazRHZVIyTVpZ?=
 =?utf-8?B?K1VWYkplcVBhakVYTTZMZUV4WWFVYnlxNzA1WFhSRmNWVTFpSlQ0OUFSS0dj?=
 =?utf-8?B?WEZ4OHkydFhtQy9lNjRLRWVkNW0xMjJ4MmRMSHR3WXgvWmtjYXhlbDNwb0pn?=
 =?utf-8?B?bWNVU01pM0pGRG12bmtOY3pzZEw1VzFNR0Y1MjlpZlZCaXR4V1Z3MjVEWnAx?=
 =?utf-8?B?SVVUUjlodVQ0aUF5MUo0dXpMTmVsendJZ1BUc2tzTC9xRVhCTU9wRGZiS3lR?=
 =?utf-8?B?WGpZL0pkYThFNGFYRHV1YkI0bTNTVTRGMmtENkRSQy9XMHUwK3lQc293M1RZ?=
 =?utf-8?B?Z0s4T05tMTRFU1VZblFwc0t5bHFPRnkrdDliVnpRNjhQTlo0TFo0WUJ4eDMw?=
 =?utf-8?B?UGhvaG5adTN0SkZ4L0xTNVZaQmd5SE95ellZbml1eThrMVAySk9OTFZsNG4v?=
 =?utf-8?Q?g2L926n+iMyD5JN5HaYtnZn7OLn9EDT/hq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f885dea-1551-49b6-a7ed-08d8bbd689e2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:28:58.4629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuRPc8/55zhIFAghePFxxCEJjAs1IInT9hBRMLVplXNhiLsr4SWDglzVysN/OksHbUgmIZK0WVtg5YgSuGf7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5354
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:33PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Switch NetBSD to QEMU_XEN.
> All 3 versions of libxl__default_device_model() now return
> LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN, so remove it and just set
> b_info->device_model_version to LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN in
> libxl__domain_build_info_setdefault().
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

