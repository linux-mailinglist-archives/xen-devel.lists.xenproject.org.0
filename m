Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182602E714B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 15:16:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59924.105061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFnE-0002D1-1i; Tue, 29 Dec 2020 14:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59924.105061; Tue, 29 Dec 2020 14:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kuFnD-0002Cb-UT; Tue, 29 Dec 2020 14:16:07 +0000
Received: by outflank-mailman (input) for mailman id 59924;
 Tue, 29 Dec 2020 14:16:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dLv=GB=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kuFnC-0002CW-MV
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 14:16:06 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 150f1c53-8f02-407c-b0c7-a6e6ee218dd1;
 Tue, 29 Dec 2020 14:16:00 +0000 (UTC)
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
X-Inumbo-ID: 150f1c53-8f02-407c-b0c7-a6e6ee218dd1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609251360;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=J2ZKMYA9GzVvJNkSl584roxcziFDfzWdH5eJq7w8szg=;
  b=T3ekb3O4aU2W1f2/SeXvH8skIxhGQwaFmwJJNGF9KyIVg373NjwCEw9O
   HBVQVtXd6BJ+/dD373VBtIhCfvQjZLtvIg275GM3UgvMD0th5m5CInPLg
   6UNVmdisficScKfMrr0X6B2F9B3O99LIgxfnBspW57uj9vgrAYGcHhNLN
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: Gjgz+P4QsIl9Ux2nkn++NwvNmKZ/VvB3P7bKbA12hYBqwD3A26XJrHC6MvPtl5g0ARqXOZDX02
 7mAJCvVPC6dFUnEGLPZoNx+6mzwpE/MiniGCYIIflGPlDIFSFzVhTjNzaLZpiuL+txexPG3Gcb
 zCeN9uNvxOca566vd3n9Jo+/bkrrIAt3/RfuY1Fcgvg3BpmwKJHKJNTMTehORv4wWO49pB/kJK
 ww4y1C0FFOZiVkyQUZJyL72SIfnD9SAFMf06THct17DtjFEGaobtpC3EzEgmeQsGtvS+zVG2xW
 GH0=
X-SBRS: 5.2
X-MesageID: 34454888
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,458,1599537600"; 
   d="scan'208";a="34454888"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ekWAYmdZOHYmKO5uc0yvEdzRfb756zeUwVNYRdpb6E63kR7HuwKI32X7AFVBk9wF9+EBkpAJT/qa/wwAR83uWZrNG0y3ZP4fcPMr631FMoYyGMWGxQscrl0eqX9p5tlJxHHrhLDA7rXlnaFnjgiT+iU02mWkYGpcY9wXynufjULYbgDUcqsqa3UojXxwXBdt/5jzPmwAj1YHvvZ26gh8JJvS/iT4EPo7OKHnz6TeQYHECk9/W0iiMXAnJPAavSVpsdbBAoWf66vQ7NGeGSJge+QKXQudJyBdwdKw7wr+lOcO1h4idTzuKdQ3AH1/D73w3yOaGMfkmCPgFKsLb3gEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVHJj19dWVAuBnTsgJ6Nmz9h3IFaTTl39INuK9zhZ9o=;
 b=TWpwoCHbWitUgHVv1x9prgNO75GBUUoMBb6rKoHu0yLFid1+VIadl0QfPunCe32Nia2dNVomYOZ0q4bjWOBsZ6ixcptjCTOCykFUgSqzdEk/Uk/2YV9y4cfS+IF4ZUuUzhQ4ZaVO36N9oQ9zCNSQ+0ZKYE536S2rR35rp3M9zfv5RBvKwgIf2nzJEdxoePaEztnKh6RvWV235LPxKX0FctfJS0/AShYzb+P4vnJlqHOv8mPpKTle0YN7achOdacqagxRe2wgBDIazCcXdTEGgyagEA0UDc96Sz49Ed544QcgHmtdfvFK1YE1botii/1nml2A6XBwOunfEbF97CQiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GVHJj19dWVAuBnTsgJ6Nmz9h3IFaTTl39INuK9zhZ9o=;
 b=vcjCpKq3BUmALRX1wEKN1iiLPgjWCHvGHHdVlMsJyzoIJa0X7jFZa+lPqfVWTLrMo5YgfNRYcnWaG9/OqzR8Ufi7z69lYo8IOvudcU3G9zEE59MnbbXfdRQAt9g28cHEggiQKiXHhxoahseBmxMXzEnZJwZN76ObgkcbUJNKVFM=
Date: Tue, 29 Dec 2020 15:15:50 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@netbsd.org>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 15/24] Make libs/light build on NetBSD
Message-ID: <20201229141550.gxnhnu3xxxunjest@Air-de-Roger>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-16-bouyer@netbsd.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201214163623.2127-16-bouyer@netbsd.org>
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db6e3d06-ea4f-4605-9b30-08d8ac044235
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR03MB255474C6ACEF6C4F2B74F3958FD80@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /L1isNgvfWm7ZvKFIPQeTtO/RotXblh19pBDjY03xCuf9GC9vGc6fHBy9UFeLVRs+L6HSZ0NzmSGD+uK2ZsZPxJLb7ku0LcFv3XY5nEZIsjCSriJMr2jktbHYdqNOp2tXzj9XyWXgFaJnhrg6rmD5r+zQPPd6f3ddGDPpoh779d3kLv93uLhRbvOVwQGlsZKIucf9onOwtTZG+81027Vi4ybfNYlgO9ZA0mg4oY487e5zyOGSakol18p8Qza/gaBHAa5iOk2yp4uRQfeLzXJKQLgFdEZ2K71MCvj5y6w/1c6k9mB8PRGPSlorec5rKhb9b0xqYnX/a6RVtccTjsHOG1onnCSUcbmhxB7jFG+95N5Ukaq/95A5HX5vwiV32K/6OnBzBBd7ofKdSOUoIS1yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(26005)(6486002)(1076003)(6916009)(66476007)(6496006)(8936002)(5660300002)(83380400001)(9686003)(956004)(66946007)(6666004)(186003)(316002)(33716001)(4326008)(8676002)(66556008)(16526019)(86362001)(85182001)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVdyQjBMYTZnc1FGL0p5dXhtdGQrS1diQmIzYzR0NTEycVRIY1NZckp5cHc4?=
 =?utf-8?B?MVF4czNNcHZrUUxFS3hVN0dkbGtOZHYvTEJKWlFiZ2FLdFRoMjNsam9TZ2V5?=
 =?utf-8?B?LytZaENOV2pSYWhCVXZYd3kyd3RzZ1dlVHhWdWl0WldNNmFyYmJjYlVUMDMr?=
 =?utf-8?B?cWJBUHJrQmxZdG1vWjZCWEFzUFJjV0RXQWVhV2ZIUktRTEYyZ3pVenVTb0V1?=
 =?utf-8?B?NkxDalo2VjR5bFBpazFlZVBiL0x0c0J6c2lYaG1Sc0dWaDZvYmVFYThDaUw0?=
 =?utf-8?B?VHVEQ212VmM4UkQ2cmNMa05tQXY3dGx0djVEeDVSRXN4WkV6bkx2RDBUME52?=
 =?utf-8?B?RjJ5eW4rQW45WHZjUjZSTXVXc0E2ckROUUJKRTlhZGx4T3MyaWpIcms3QmMx?=
 =?utf-8?B?cVRVVis3VWsweDlSVXZzeHVXaUxjVjU1VmR6MmR1M1N0bkdhcWNVWHlsdUlT?=
 =?utf-8?B?aHMycXhJU1RBWXNkMEZSZVU0UlZ4dG05TTA2bFhyZDdJY0dxUmNURXErYjls?=
 =?utf-8?B?SUk0WlNjVzVuRkN6YVZKN1ZWakJJb21FNEQyRGt6dnA1QkRRc2JFaDNISUJO?=
 =?utf-8?B?VUo1MjBOU2FrSVdRVDRUbmhPRUFxdlY2TUF3eC91bzA2SmZXRlphMGhMeXg3?=
 =?utf-8?B?M09JNHBzOTJkTnozV1RVditHQTlJZS9VWkt4aytPYXZsSUVDaFFHc3dSQkhv?=
 =?utf-8?B?NVZiL2RQWUhJQlduZkoxMVpQSTBZNWRjUmVDSjNpeGZRcTVHVWFtZitUM1Bi?=
 =?utf-8?B?a1IvcUJpQkZrRUl6dGw2UDN0Z3BVbTBWNTZUbDZkQWNvNlJJN2ovcUZ3R3Rm?=
 =?utf-8?B?dUxUdWx3K2hkTmhNSWZFdncwVFZtOVhINzIxcUg0ak1DYjR1cFVwSFB4eGhW?=
 =?utf-8?B?QXo4dHVyK1pPb2ZtMkFocHpMbFJTZ2RZN3pYclh3L09rcTBrSWNWOXIyRThY?=
 =?utf-8?B?WlFsTFlwYlVXbHZPTWhMb2g2K25JRERCWVpqWE8wUyt6aURjSnBOOG8xU0dK?=
 =?utf-8?B?MitIdlU2Q256bktzYzB3Y1J2ekVURWRmL3ZQbWxUYkRIeGtMQ0FMY3F6RmIv?=
 =?utf-8?B?N0hwMVJBeG1aVWhiVlBXWExxcnRHK3ZuTlFwR1U1azloRnpEUDlGUjRZK1FO?=
 =?utf-8?B?RTMybUtvMmVrdGNQRlBVRFMrUVVOcXhNS0lyUFI2ci9pWitvbDdBUFhiRlhz?=
 =?utf-8?B?Qk9tQWE1N04zUnFxWmtabnR6MzkvZmdZLzI4WFhXQVhHMjNNNjFjTUM4dVY2?=
 =?utf-8?B?RnpaN2hHMHpzSzhJeGpXYllscUZBK1FSMDBYSDc0Umd6SmlwT2NOaEJDcE5i?=
 =?utf-8?Q?6WMp7ow7+tEv/8xC9uH5IoR44W1EIbG9oZ?=
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 14:15:56.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-Network-Message-Id: db6e3d06-ea4f-4605-9b30-08d8ac044235
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N71N6P2H98EZWVbtXwXfzWgbO7Znu46XEw2yp6LEVz6ObOu1JQk6ieqmA5VePGf1SzikMY/jEprZVmuMRuxN+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

On Mon, Dec 14, 2020 at 05:36:14PM +0100, Manuel Bouyer wrote:
> ---
>  tools/libs/light/libxl_dm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
> index 5948ace60d..c93bdf2cc9 100644
> --- a/tools/libs/light/libxl_dm.c
> +++ b/tools/libs/light/libxl_dm.c
> @@ -3659,6 +3659,14 @@ static int kill_device_model_uid_child(libxl__destroy_devicemodel_state *ddms,
>  
>      LOGD(DEBUG, domid, "DM reaper: calling setresuid(%d, %d, 0)",

For correctness you should change this log message also on NetBSD.

>           reaper_uid, dm_kill_uid);
> +#ifdef __NetBSD__
> +    r = setuid(dm_kill_uid);
> +    if (r) {
> +        LOGED(ERROR, domid, "setuid to %d", dm_kill_uid);
> +        rc = rc ?: ERROR_FAIL;
> +        goto out;
> +    }
> +#else /* __NetBSD__ */
>      r = setresuid(reaper_uid, dm_kill_uid, 0);
>      if (r) {
>          LOGED(ERROR, domid, "setresuid to (%d, %d, 0)",
> @@ -3666,6 +3674,7 @@ static int kill_device_model_uid_child(libxl__destroy_devicemodel_state *ddms,
>          rc = rc ?: ERROR_FAIL;
>          goto out;
>      }
> +#endif /* __NetBSD__ */

Instead of adding this NetBSD specific bodge here I would add a test
for setresuid in tools/configure.ac using AC_CHECK_FUNCS and use the
result from that. Then if/when NetBSD implements setresuid the switch
will be done transparently.

Thanks, Roger.

