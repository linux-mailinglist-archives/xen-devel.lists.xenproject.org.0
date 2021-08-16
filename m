Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F643EDACA
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 18:21:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167416.305587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFfMK-0001jZ-6b; Mon, 16 Aug 2021 16:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167416.305587; Mon, 16 Aug 2021 16:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFfMK-0001gg-2x; Mon, 16 Aug 2021 16:21:08 +0000
Received: by outflank-mailman (input) for mailman id 167416;
 Mon, 16 Aug 2021 16:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Flmd=NH=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mFfMJ-0001ga-7i
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 16:21:07 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4b46304-fead-11eb-a462-12813bfff9fa;
 Mon, 16 Aug 2021 16:21:06 +0000 (UTC)
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
X-Inumbo-ID: f4b46304-fead-11eb-a462-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629130865;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JIy/G0yIBdOD7DjFG5VmrJ+6lI/ivmSzVqrhV3lRyXU=;
  b=SzaIC5Fp3VE6l1AekvDLVsFVFQwvsd9+ommn+kt5KrxrXO4EXukDayks
   J3mSYzLdOEqFyzUNRoemfQcg+/zFfh/U6zhZofzmehnLmKns6+tZXWFeQ
   AKGnDJ+kwRaRjPYo0MrmD9Kz90u1PyN4x2Huy5HaJIiuSU7O3I0/pPtmp
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: eSSlIEV8pAooJlgsFb6Jy+Cu3VX+unJIzbl+M1YncoLTAEkwUftA5RM0IoO5Adbp89An7YLSGh
 oIQsvZPji9tvY1T2L9WXerWHcpwU37M0DA7TdIknerdYaCGOHtXDF3ipDpKhzWaLwAeYRFD8A2
 kQNNrnEhUH7A8YBcQZRVL7urrV2IW5i3CrA3cjvXe04YOwyZySqhS32Cc4X5JQAfRFzdG3DNsV
 QCoEhPa8T5dFTdQX2fXrLFbM+iOoi8PDbc5tZPmABDpeGApa8mjyMqPVFNJOz02+mKYzkH8f50
 d0YgClYAjnkfAgbLGJHpZA3T
X-SBRS: 5.1
X-MesageID: 50544226
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:yhJnmK4pR+yuKCVdhwPXwUaBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc6AxxZJkh8erwXZVoMkmsiqKdhrNhQYtKPTOWxVdASbsN0WKM+UyZJ8STzJ876U
 4kSdkFNDSSNykLsS+Z2njALz9I+rDum8rJ9ISuvUuFDzsaD52Ihz0JezpzeXcGIjWua6BJdq
 Z0qvA33AZJLh8sH7qG7zQ+Lqf+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+SemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lkdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNxN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wiJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABCnhkjizy1SKeGXLzMO9k/seDlFhiXV6UkXoJlB9Tpc+CRF9U1wra7UIvJ/lp
 f52qcBrsAEciZZV9MkOA+tKfHHfFAleii8RF56F26XXJ3vC0i93qIf349Fk91CWKZ4gafay6
 6xHG+xiwYJCgvT4Iu1rcZ2ziw=
X-IronPort-AV: E=Sophos;i="5.84,326,1620705600"; 
   d="scan'208";a="50544226"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoQdC7qgIH8Yeignzavo3B5hCcH5U7pjNXvy4Q1wK+/rhG8YkS2jKxsFLeXXCLlnMKJi1JHLJ0CxDDbhpMDixpmiTTzNoVEcfKCuoOfU807vXgXzhUXXbK9Ah0qany9gOu6QOpdGAlXUPtznsmX2UtRSq5ZhagYrS4epRD6nS4Gudz0AMFwxUeArbQKLlvZeu0OxLP+Q+3mhgyBkic/X6L2Qjd56tQ7NXcyCcMVJTb2+XgjGeIUxaZ8atvZD6RQfL5kYH6rZou+O8tPWvjKGxHg2AHphzyyTr+97gZ9ZOgiF8n1H0fPTixvVD/tNBskighpqdlkdGQUMSdOA05EauQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIy/G0yIBdOD7DjFG5VmrJ+6lI/ivmSzVqrhV3lRyXU=;
 b=gqoAeDXqNoNMGojP/vb+NpK30cTdT5XYJHX9Zw+j8tbp/w1sEe9sbF0O5+ZzC5v1bY94GItPwnoQFKYsDJjhdBdgH4TXVF7w0yppQS4KOpplyd1DKQdDsyiLFNUsRAxmTHwp+mZ3RlZIgHxwwKmKYLXin20OBADzb9IcsBnAnGNzpkTLiQ1Nl++BvrkoECHK/p5ujdzfeZuB1bxzL72CwUym2rlPt216rryrPHiAcRmMvE62E39LCQOjVqPN0B2PRA6Rnt6mvvhTeDEB8t1gq7vnNEw2gcE7tVz32iC1GTUIJqoSB1uDXSwwsSNKmutHS6IgWY6j2fW+SGWyRf586w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIy/G0yIBdOD7DjFG5VmrJ+6lI/ivmSzVqrhV3lRyXU=;
 b=SXXlBi9w1sCwnFAnxfM0R4OryYI/jN5eUWj1hjMgy/8sbo6qPQRmadhONDnADRNNmesqE5GEOPPbMpIiap4WYIVVP8AdAa49yCYxoIqs/X60/qARRe4+1hxIU810dXvpIs3GXqdcZVNkBwZvNo5oqmov39byGsDTyuKIid6T4jY=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
References: <bed8e679-b531-e1b4-5ef9-79019fa230dc@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/PV: suppress unnecessary Dom0 construction output
Message-ID: <a7b79e6e-ff66-2f5b-eda9-75552fb8a686@citrix.com>
Date: Mon, 16 Aug 2021 17:20:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <bed8e679-b531-e1b4-5ef9-79019fa230dc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e090f23-7327-47d6-1a47-08d960d1d749
X-MS-TrafficTypeDiagnostic: BYAPR03MB4807:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4807A3A0DFBCD71C213202E7BAFD9@BYAPR03MB4807.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xPMVeY0ocqngrJlHDPHtIKG9boxrLHeXbobodlED7wPjsNKc7Sf3Mkz6654ABHNmytwOee3zdwh0/eqZzYpEeXwyfxPjx/PDvRD/10K5aEzV6X+EF3pAGCm3xTWIMkwGM1lokbVS64Nl+X7TtzgDweBR6d/vull4Gm+fEpA2nftWM3NU6Zrinsn/2wKE3MPr8MxpHlWBh2isWDvW5iUhYdMc47VDaAKIEjxAYD6ZQAHtzCgBHR49G2Mz4iMg2UckBjP1v1H58Rfw2l/UOXpP2pu0qaNsJ9Lpz8r3E7A0CsdIVCiab0x0VIDLi19GvFLhr289+ax7GjwMJfJ6PcQ28Q1Gl2y/mbkjzN4Ni3kgi+md3XBc9rJCJcCjDIlsCkad5r5CziSS5Ox7VIxoUGsn+iee7bc3OVIZs0JaD0j/Uy0L6UDCGbcsVM/98AuWXyfylwK9/NbMkttgzkS8pl0RdSVoeRX3PZrROcv/bZXCNZNjgCVl02db7e6RIlLZii4yNrSPR0Uwa7OeQtZ6gVlY41iwlrz8mZb+iI2UDlphBqG2mqmcRUajOsrLi0cLnBIBhsueEDgd6oPvtku0G3YZz9BhMEfPruQGPkD3poUuWBfiicM2i6h67APJJDyPVSstS4AmltbXxmRmiyKkRM70Aij94zPBD2kwwtZTvO/LKNfw/Xi8DIhTUWj6Xn2wXhjVxoBPk6Z6cMbpr6WvS5eb4stfVx6yLteRiGL6SDEysco=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(38100700002)(83380400001)(5660300002)(316002)(53546011)(6666004)(86362001)(2616005)(956004)(66946007)(66556008)(31696002)(66476007)(36756003)(478600001)(6486002)(107886003)(4326008)(54906003)(186003)(2906002)(8936002)(8676002)(26005)(110136005)(31686004)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzMrSEx6azZnWHo5M2FYSGlvaUZnbXRvYVRRWjZ2eng1UWk1NnpETGlKQnlC?=
 =?utf-8?B?eldPYjRoTlBnOElvdHlrcWVLWFB5WnUyNEtsb0dXTEdFQnlGSzZLUm5weFI0?=
 =?utf-8?B?d09GaW9jWEhCZEFZOCs2YWNMK2czNjVPdjJISnFQWmxOUndmWWNVdEFZSjBS?=
 =?utf-8?B?c0t0MitNUXRuQWV1ckdOUDB3Mnc2dTEwMHlMZEEyMysweTdueW9rOTBnV01n?=
 =?utf-8?B?eHQ5MEJSUU9BWVEzYjVXek1zbGFwRXgvU0ZkKzc1OEd6Q1FHelhVdUVrYm9v?=
 =?utf-8?B?RUlZclYzNmcyUEozdkZ1SFd2anBUallWTXY5bHJjQ2FGdGx3WkNBZWtzejQx?=
 =?utf-8?B?OTl6YUJZcWJNeGlYVzd5TVdwV0Q2RndZbTVoRTQ2bGJXbzIzUDRsZzlnY3VW?=
 =?utf-8?B?UUVldDNtVkF3RUpkZVJJd05nRXNWb2g3a0lIczJUdWVLWXR0OVpqQUxEN0pN?=
 =?utf-8?B?YU5xVnZYeUlXNGRPVkszaXBnY2Q5Q0swT1c2cDE1L1hDK2YzdzdidHlDZ0tZ?=
 =?utf-8?B?eDdoNXJkck5mY2FkemprcGcyTFp1S25SWEVBSEg5TS9CaGFNZFJzSUNxRVJY?=
 =?utf-8?B?SXFBVS9TYUFTOWNZNWMrZVozRlNrcS9zOEgvT0h2YWIvYU15YkhjT2xQcmlW?=
 =?utf-8?B?ZUZNOTZJTXF6NXMzTmhIZ1pLTC9DOVd3Mk05V1Z3QnQ0L3NXaFA3MXdKNEdJ?=
 =?utf-8?B?NjE4a08waGZ3SHprYjdxWHhFRXNkTjNCcU9ETDJFNDg3akU1TXhyMVgwZkRz?=
 =?utf-8?B?MGVEamNGUGpNZUJLeHV6MW9TUVdCL2xoMzFEY05nTk11NjdWTXQyN2U1YmJ0?=
 =?utf-8?B?Ym9wWXpXeDc5SmNKb3NKSXYzSkMrV0cyUGlGWDZlRWZrWkN0TGNkRjZreUpU?=
 =?utf-8?B?dUN2c1AxUXhZMGVyc1BUbDZna2Z3MDVLb0dyVlhydGRDQk44VjdzVmFwYVU3?=
 =?utf-8?B?SmFkSW9sK0tad01PNmc1M0kwRkpubmxpKzN1R29FMmhGWEllRTU2UGhUaDY0?=
 =?utf-8?B?M0duNjB4bEF6cDQ3THlneUorakdGNjNTSVZZUDBPTVlVY2VsSWJ0b1U4MFB6?=
 =?utf-8?B?cHliNVRMOFJsY0hvQXA1Z0d2TzlucjhtU1YyanhZYlhPRXV0NGFmTTZJTXMx?=
 =?utf-8?B?ZmltckQzcjVVaWR2cDNHWVlEcVdDM25YWC9GWlMvemxhODhQYzdRZWR2OU1N?=
 =?utf-8?B?eW5MZ2dCUWpRNWhtN2puYVBpaTlRRElLR2JoR25tRmR1V1diOHo0SU5MYm1R?=
 =?utf-8?B?QjhjSkcyLzVZczBxTkd5UmpSUHdPTFUvY2Z3aWVqeUNsb01XOVFMWjNHR2Vy?=
 =?utf-8?B?VjA0WVF0NjFONzBMMlJqV04zVVcwL2oyL0VyU2NISmVBTDFRQVkvWDRQSm45?=
 =?utf-8?B?aXg3WEg2Wjhnd1dUeGhUVEFTR0hYWk1JUW5Kc0dIYU9GQjhlVXJuSnVoT0Zh?=
 =?utf-8?B?ZEdzSDN1ei93dnlaaER1QkZXbFNpYWdSUmRlckVnTTlMNGppNDZBeEVnN3Bs?=
 =?utf-8?B?MzZRejVBMjJnd0o1Z1ZuOVVWdTdYK0RVSzVzakVSR2lucjIyVHc1eGRJTEhK?=
 =?utf-8?B?RnNRMzZadE9VRVdWM1k4NDJ2THA0WFo2Vm9nblNHTXZnWDFWUTlOa3NTZ21k?=
 =?utf-8?B?VjJYZllxNXJJV2JHVHdIYVlZeWNqN01ZbkYvcXNOb3lZWFlCcE1DemdJSUVU?=
 =?utf-8?B?V1QvRVpsakt3NExvSmZ3T3dzTUYrUHplRi8yeVg1ejVJTWRabEhjM3VSbDB4?=
 =?utf-8?Q?Td1x9DMehl+0MLOk/Pw70H7/3GQrfbERC2H0/hY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e090f23-7327-47d6-1a47-08d960d1d749
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 16:21:02.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZRTGU8I3UdksOHbi/H265LASLigYjD+/XBQ0kSsVFUVQkOcY9DDRGqOWzQWzyc5bHIHj0izc/JPpMac56b6ZCK00GCLbdVgsOwkcOMpVuU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4807
X-OriginatorOrg: citrix.com

On 16/08/2021 16:30, Jan Beulich wrote:
> Especially with XEN_GUEST, being a prereq of PV_SHIM, defaulting to N,
> v{xenstore,console}_{start,end} can only ever be zero in such default
> configurations. And in case video is the only output configured, space
> is scarce. Omit the two lines carrying no information at all in this
> case.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com> as this is an
improvement, but honestly I think it would be better done differently.

Each line ought be a separate printk() in the first place, and these two
messages should be conditional on opt_pv_shim rather than
CONFIG_PV_SHIM.=C2=A0 That will also shrink the output for native boot when
SHIM is enabled.

It also lets you conditionally drop the ramdisk line which has some
conditional printing a few lines earlier for the physical layout, but
unconditional printing for the virtual layout.

And on that note, the earlier few printk()'s really need some newline
corrections.

If you do go with this approach, feel free to retain my Ack.

~Andrew


