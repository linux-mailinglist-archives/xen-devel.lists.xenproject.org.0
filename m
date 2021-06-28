Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6D33B6651
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 18:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147911.273073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtfX-0005Ll-5d; Mon, 28 Jun 2021 15:59:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147911.273073; Mon, 28 Jun 2021 15:59:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtfX-0005JO-2D; Mon, 28 Jun 2021 15:59:31 +0000
Received: by outflank-mailman (input) for mailman id 147911;
 Mon, 28 Jun 2021 15:59:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/HW7=LW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lxtfV-0005JI-9x
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 15:59:29 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff3209b7-673f-4f25-91f9-df135ffc4980;
 Mon, 28 Jun 2021 15:59:27 +0000 (UTC)
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
X-Inumbo-ID: ff3209b7-673f-4f25-91f9-df135ffc4980
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624895967;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N2hImsygCLrcAFlAz1cbvthrFYOwPIIe+WVxekBt4aI=;
  b=XjXz8t4QNuIzebwUJJB11M1qUvQEkgfHQaFB71+V1WfnKm4huc42cVOj
   QBAeZLfwKkNK9lApiUbPQGYq2BZCEyDxvYTI/jaiMatHKp2iY82BrW0ct
   uqNAHCHnQGkcLRNOzAmjZ91ynqjJEOg9TiXl2p+L7VivsSzrGUigrR+5f
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kOlcXvqGIFcGmP5ynFV8Om4x2BF4DDUzavt4O1RygXpy5Sl4vEoWKnGc3cNbWKggHuzZyUE058
 6j3a1vyOSwWhBDI9vcQ+RoYe7eeyhi3nd1pDSRwPLwikCATvl2ksHThB2ONaKrsQE+BYiZS3WF
 I+kjtei4Z5kL0qV9q3ESZ+VqaO8XYXsBsDyZ3iIPNNHOkUnypPYrZfAwe3GgXNYMn9SS5/THGK
 aWiGFHOBU0M/6Xy/N22YuAQ9vxHc62zNVI1J6EvkZACpBuFMKfDQTF4D2KrEjL8sG5Iwj0aFn9
 K3w=
X-SBRS: 5.1
X-MesageID: 46828034
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DAo0hq5eVtELRLhEHAPXwAzXdLJyesId70hD6qkQc3Fom62j5q
 WTdZEgvyMc5wx/ZJhNo7690cq7MBHhHPxOgbX5VI3KNGXbUQOTR72KhrGSoAEIdReeygZcv5
 0QCZSXCrfLfCVHZRCR2njFLz4iquP3j5xBnY3lvhNQpZkBUdAZ0+9+YDzrdXFedU19KrcSMo
 GT3cZDryrIQwVtUizqbkN1OdQqvrfw5evbXSI=
X-IronPort-AV: E=Sophos;i="5.83,306,1616472000"; 
   d="scan'208";a="46828034"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qe8GQsrSR5EEhLLCYPE3bNxwrPCiNNREx9xG1xnOU0ImNB07u231FiX/rg3DGAGuxojl+AJa9Fdcbdahp6NsowhEegO8U/FCo5gOp0leDYa0jxmVLJ1KZLdYnIYT0NWKTwq74Fz09dSjNEEOm9Y/ID1LICGbDc/XAvFPSi0P92BM++leDAWXf8+FMImc3AWSA0Hqy3EEeYY+ccoj+ZTGdFmIoTbc1Wb76Wm/j+NuMD55RnSNifiMZdyhJQCAdgFDbCC4NnUIVYO8JDvg93aml7PX+tYV95RT3yoygOiurRcAuTVDD+FH+vU2rc5egDqjSaKSWuW5Jm2WyBv9ZXrdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1LhmWwCqtXrWqJaeO70GCgK0KHVkduuA9tc0a5w+b4=;
 b=MtpMtsNqbQMyPjtrwzo0Qkx1l+02soA4y1TqBEs55HtvAw93kaprNdYpV4lA8Dg3ChaIOv8VY7ZK0uT5mEjDjuh81cRKZ6iuZnqNqgfJ5nL1sREwm8ivGiIusMSyH2gfPToVZrJSxivh147rOBHAqHdfO1v9MJXEPisdXGFLVVtFXzmACQgr6fpGmlvcZ74OVtFGeIVKW5Xn5YPC/8FU9wM3ZDCYBYgVMJ764MeRYbZ9/Rjsh7zBrkOTKerRiCGaXo/cuy/6xYNtWjCn0hX/XRoK//f20PN4xjgjAP6EcLgsaJ3HgwR+SefyRiYin0bjJg4hPCJcVgaoxKgEYeT4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1LhmWwCqtXrWqJaeO70GCgK0KHVkduuA9tc0a5w+b4=;
 b=qphAmmGQizCXWpAdKRBrhb4/6c+ABFzufW8MR31b2As1Z5uhW6qndzwyXrZKhZr5wciC0K9hpAZqHGB5VjmrCdv5iTiLSG6riyYsaCpo9o85cMJbOu4ZIkTPjrdip9cvvfRTpeCnBkgnnA8heoAHO5vmdhJ8PY8rxHXyWwmP9YQ=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony Perard
	<anthony.perard@citrix.com>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl/x86: check return value of SHADOW_OP_SET_ALLOCATION
 domctl
Message-ID: <ef6a73e6-974f-67a3-5a4f-6be6f27d412b@citrix.com>
Date: Mon, 28 Jun 2021 16:59:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0277.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451b1a3c-fffa-4f12-40f6-08d93a4db235
X-MS-TrafficTypeDiagnostic: BYAPR03MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB455284B183D3E99E55CB2B85BA039@BYAPR03MB4552.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M//auQucFyAUjsTZGa6QmMYu+U5R1nqUbkEquMx3yBBWIQolWp6TKiLIhn/5n32x7o9/mc/WGIZJnyhgi6EzoRjnoKkxEOB2lJuPMeOMRHoFowgrGdXmAR8hEkg8A/ZARt7fIZJ5pZ2Qb6HoHkmhgH9HTg70I6qutCMi2sXQYe1+l8tOCTbOsdEp0nHbHNWgYKg+g66SNRDJZikwHsXTaZma/BsIaeud2WfiyydQBGK7FXJFGJPIJ2H63/UmOZ56xZuSwoh169ASqqPmqLu7M41rjD3Vwni0X0Hyd4toiu1Y7KK3yWtWD3QBEzG00m3MpInYxsn63cUWYoQjV4IXqfMeNJWtBcCfhOTNDJXnI2/CiRnR+9fx+EfhPM2pOvL8aqzrE2aFJ5gW0HR3ArX5fi+6H+ifgyT+4LU4Qxb0Pg3cuBeqIzETyjxNmgHEsuiVgqwnIKctiBU8DQ+FyAKvkDCpBvhTOefhirJb0VU+lvCJWZZIP5NhEhqj23Cl86UjsTxIM4JXxIJJ335oRJA3jZc/ve5/3G22zLeZSzfu8o7g+cFJ5OSGEKOih90c44tEeaQS4xSOI8+VYi3suUfC8UGhMXXNbGhucY87JPg2bEVShx2hBquQ7Kt05BeCbPtzkIvJgH9Rn2v8p54+UrdbcJO+IlSRS8mg6OnsirswjMJGCHYkUwRbRFUM2cOdM+LUjdCpVr2l3p+D6Y8mofCAHtVVAvsfT+bXLQxiG5DR6xY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(107886003)(956004)(53546011)(2906002)(5660300002)(66946007)(66476007)(316002)(6666004)(110136005)(66556008)(38100700002)(54906003)(478600001)(16576012)(83380400001)(8936002)(186003)(16526019)(4326008)(6486002)(31686004)(86362001)(8676002)(26005)(2616005)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9Ec1FxTXFuNytCNk00RXNMMzEyT1lIdGdlTjhKSVMrblc3dHNyVlFVRGJU?=
 =?utf-8?B?VUhqUmZyMjZZOUdlakRaRWUrL1BFbE83NTlxSEdDSzhHTnVKVFlSRzJMT3hi?=
 =?utf-8?B?RGdZUDlYQTJEVjVzeE1lS2ltZUZIY0loaXllT21yc21ZUnh4VExYS2tnUnhW?=
 =?utf-8?B?dUJPQU5xbnBBcnNRTXhJN2tHVWRzcHlwc2Y5Q21MTllQT1JLSzRYWUp0NWZl?=
 =?utf-8?B?bEdLM2NWbjdQWG5uWllYamFtSXNMdDBldGpJYk41ZFU5UEpoNTlCU1VvWkxE?=
 =?utf-8?B?OFE4WjdiWmxhSC9kbkFOblVJcGl2Y21mM3ZkR3A4R1ZidEV4V0FVWlpRV1E0?=
 =?utf-8?B?eHVPOUptNDZSREYxWGZYb1d1ZTZhSDNKdnhzZStUVzkraDJ6RkN2VElFazdq?=
 =?utf-8?B?ZGs4T2s5alU3SzF1YnBsVUhlRjl2NEVkanVFMUpxd2dXYzFPc1Z0ajlSQTVJ?=
 =?utf-8?B?aUJ4bEFFR2VsUVlZVSs1M1pZVlg1Ry9JZG9tRVpYTzBvQ3UzM1k3TWNxbmJN?=
 =?utf-8?B?Qnd3cEdjM0J5LzVON1QvSTNJYUNYSE5UWU04bnhIQ3pGN0I4V2lGMkxHdnhx?=
 =?utf-8?B?a3VGWSsxZklFY3VkZm9lbUgvOWRZTXlKNVRjalgxdjZqZEdUQVVTcWFtN2Ix?=
 =?utf-8?B?akdYR3Ftak9MTlpPbXhZZHZJajBUL1YrS1kyV2JERk0ybHE1WWRweHVwN1Zo?=
 =?utf-8?B?ZFp5bXl2WktPQ3p1bXY4V1Y2dnJPU2hxZTJhOEVic2N1czI5TDlKaGQ0amhE?=
 =?utf-8?B?Sld6c01SazVwOHZvblZrTHIwL2pwMFBRRld6SlBXZS84dGp5aUlFUjBPMEpJ?=
 =?utf-8?B?TmV5ZkpLbDk5VkRwbFR6SjB0SkF3bmxyZWZCck51SEE1dlRkNzdoYzBwMGxz?=
 =?utf-8?B?bmhWbVQ3bm1ITEFodWo0Sk10U2VySUFKd2lKWjFQNTRIZWhWditWQll2QTNw?=
 =?utf-8?B?d2NlRG9BSkV1VUNwYVJUWXdkajdXZ1dYOHhMdExwWWFpQVc5c1hlSlVNUzdQ?=
 =?utf-8?B?enNxVSttM1R3eDAzRzFWN0VNL1F1Y3VHdEc4OWlBRncyTHh2SjVqem5aMytY?=
 =?utf-8?B?OUlGMi9lbWxPdVA4UndSY2pPREhxYlNZNGowOFk0Q2puVVE0bmRIUXQzRXpV?=
 =?utf-8?B?L3JMN2NYbTNpV0dTMnJZdVZJTFFKMEJlcjhvNFhoT3ptYW1aK1NpN2FDa1Ew?=
 =?utf-8?B?UEJtSEppL1RqUEgrTHBldmdob0gxblRqK3drYUllVHNVWXZ6TGZYcmRvV01J?=
 =?utf-8?B?Ymt1S2VCWEVod3FoS2FZT1lSZ2J5NFAxQXBuL3k0VzhiTmRnSDUrV01kWjJt?=
 =?utf-8?B?ZmZWR3kyMXE2a0wydHI5cC9hREd4dzd6NHlFbitUd0wzRnFVWkJxN2tyeHFQ?=
 =?utf-8?B?anl4ZGU5VEo4anFISkpNRWJENUZHNTdaYVV1NEswZHoyNmdua1JTZkkyRFBn?=
 =?utf-8?B?LzRRL2xhKythMHlyaisrQWsrandVNkIvcXhaMFE0OUlpaW1PcjNzN2FHQ0Rv?=
 =?utf-8?B?VzhjZGE4anZpMGNxSmM5YUFEa1c2RDBVQkFmbDhYTWpUZmFpUitUaGhrZzRv?=
 =?utf-8?B?KzZBODNsUHdFUWUvNDdUUlB6VlloWVR6YmRYSWhJbXRTL2ZqYStNTWp4THdt?=
 =?utf-8?B?Y2NjQmgvbnRZM2RINWFFYkRrUHo5K0d6THVRNi9wT0taOE1wdDlvUU9reHpR?=
 =?utf-8?B?Wm9iN25sRVNTVnBsTlY3RFMzSllDeitkeWF1bVFzZ0FncWVtVnE4L0VYbXVa?=
 =?utf-8?Q?WKbH2KBLXjF+hVU0FKgdphTC6TnBjsp7gARhfnq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 451b1a3c-fffa-4f12-40f6-08d93a4db235
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 15:59:22.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRpRHhI8JtfGBe/PDJJ4HBkmU/cXO8eh8HHNgXq5w08tQlC4ahJ4ymNjCcZHLTareDG6VtfOusVO54RXon1pOkigR5m7YeJ3RaVdJMZMhFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4552
X-OriginatorOrg: citrix.com

On 28/06/2021 12:47, Jan Beulich wrote:
> The hypervisor may not have enough memory to satisfy the request.
>
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Especially if the request was mostly fulfilled, guests may have done
> fine despite the failure, so there is a risk of perceived regressions
> here. But not checking the error at all was certainly wrong.
>
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
>      if (d_config->b_info.type !=3D LIBXL_DOMAIN_TYPE_PV) {
>          unsigned long shadow =3D DIV_ROUNDUP(d_config->b_info.shadow_mem=
kb,
>                                             1024);
> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLO=
CATION,
> -                          NULL, 0, &shadow, 0, NULL);
> +        int rc =3D xc_shadow_control(ctx->xch, domid,
> +                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> +                                   NULL, 0, &shadow, 0, NULL);
> +
> +        if (rc) {
> +            LOGED(ERROR, domid,
> +                  "Failed to set %s allocation: %d (errno:%d)\n",
> +                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "sha=
dow",

The error message wants to include the value of shadow, just in case the
cause of the failure is because the value is stupidly high.

Having traced the number through, the local variable wants to be named
shadow_mb to try and make the units clearer.=C2=A0 (Also - why on earth do =
we
have a hypercall which takes integer units of MB, and a memkb field in
the config file...)

Otherwise, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>


