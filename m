Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0B4D9A7F
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 12:39:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290754.493216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU5Vh-0005Sj-4H; Tue, 15 Mar 2022 11:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290754.493216; Tue, 15 Mar 2022 11:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU5Vg-0005PC-VM; Tue, 15 Mar 2022 11:38:40 +0000
Received: by outflank-mailman (input) for mailman id 290754;
 Tue, 15 Mar 2022 11:38:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU5Vf-0005P6-K1
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 11:38:39 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741ad558-a454-11ec-8eba-a37418f5ba1a;
 Tue, 15 Mar 2022 12:38:37 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-38-oCCE11cXNQ2hWIIyAr4PwA-2; Tue, 15 Mar 2022 12:38:36 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4237.eurprd04.prod.outlook.com (2603:10a6:803:3e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Tue, 15 Mar
 2022 11:38:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 11:38:32 +0000
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
X-Inumbo-ID: 741ad558-a454-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647344317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dZvx1MHyumdEYfCvg/DWVJqlP4uJVcd3ZDKREXVk+XA=;
	b=WioYWbko4c0mYHyb+8wASW9L0KHiry4OjMw67H31nqYDLmAFaDWgsd3e++G6+u8Ygcn5el
	qQNwG8y/geDH8YVYBeuppZfnOprK14tzSpyAH4DEGdKaUVuy/mlcRS8PyTa7vVqWfVJhbP
	sITsOFZ75hhmS1HNNSONNVEeqjCqoJI=
X-MC-Unique: oCCE11cXNQ2hWIIyAr4PwA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6lUMSKjKarx0mW/9pmhTQgapbcW5Nu8L9tkP7ETe78IRTSvlz5kD9LSE4Y5D2WD+2ZcmGbtL6WrlZXDBcKNCwjg628q+bYK4TZ6O71V+Gl+iuhv1i8vzq5GFRQMSS7/e7iniOM3z3ihXcwsXVrshBNWxw/Bdh/XXdIEzoISb6Bw2xczHB3u2mG96X7F3INZI6tzegqlrhNCTre1Ljw2tL2PJCQ7lKtGm2w9LmvM20NcCkNRXxwo0nHpLRnL7kzBgVbj/Zc0rACJDfX0R6/Q3QOzwV21bNawDWtCWETnhgS4r2x1zdj9uTGxGJbHU/P2uYqpHwfFWKTOVjw8jYNnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZvx1MHyumdEYfCvg/DWVJqlP4uJVcd3ZDKREXVk+XA=;
 b=lNwATcGPHEQYRvm7DKdYfXcB60JlULb8VI++lqkIoCruNUwThSrtF++7U+mZDBPRI5JH9lLzmJEvoBQlPRdnMwM8y2cJ4/B0dlwdhWH9eHXWfogeBvwz3jqOnD4AaHH6jJ9EZeoFzO2LzrheIkLBqgriZTpE57UZozD4pieZTJxKqgiHNT3zCIZM/5AuFzsMcITPPSXSrukyoYTJnoIYE0vbJzuxDnokBiFf5t8bFAaWSR+a2BznxBpwep1eIpx+8Zb9geeO8pLqT6jPSHvQX+txxZ/igWG5g+k4eF/w0PqBh5jtBeCbWq8z7gQVeyGwENXl6xDvs4hsYYj2m9RPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <23f5afb4-c712-f872-acee-7f18b98b73e6@suse.com>
Date: Tue, 15 Mar 2022 12:38:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [XEN PATCH] tools/libs/light/libxl_pci.c: explicitly grant access
 to Intel IGD opregion
Content-Language: en-US
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz.ref@netscape.net>
 <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b62fbc602a629941c1acaad3b93d250a3eba33c0.1647222184.git.brchuckz@netscape.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd026408-939d-4d2c-9af6-08da067854f9
X-MS-TrafficTypeDiagnostic: VI1PR04MB4237:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4237BFE8FD864A22EF773819B3109@VI1PR04MB4237.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQUDVy9o3KxuKDvPcyuyt2lETrYgpkkd/qOeLizbFWN1Und6HqjuSnCHA9n5Ss/ZJEA5GG6LJf4ca4hDtw8B185V1mi0gnuhzdMchsCGHRWflcrW5vaqYF6R3cf6IrYvEbrsqlOgGFOtBCB+T+vioXeuQkMhCdKOi+DqBAcixkaR56H2UneBy6Y76Wu6ceFGXmKaEGc9oSGyiRAOyo3RViDlPaawWj4LyrdWqSmVwC2qTwlBtzsW95bspFLuYQ+5wxjSbUIICoI3Dz8XJAQk+I+5l//EDsPNs8DlQxNSClgAFKh7xgUqazhBtfWfgKci/ot562bYyv8Rg+iKstqyqvCCn5ygz6Bpmp9Z46kuBtwXtP5E641rvPMecbGs6ow8iabtIyLstDeNL6ZKHq2V8w271yYOJ6ol2vrbwglNq1v/BkvggG+3Ujr/FFiHYn0iHwYvudT0dHod1x8Cd0MmN0G+ZlRvm4nGLWnd7+alXrhp4TFgNhKoiHJ9OobTpAK2NgsScxprLWIzpNa4pFlopVRw7KH+QXfs7a9h41PdZT1knYCeGTeC5zGUpbHL5T7smRrIV4xepLKLu37uKNNs3YnLhJ3FxcZzcQsW+s5IhRZq9rT+vEH7tmlZQ4j6zQzUUvTw0EjvTJSxbGTz+2saZ1rgVlab62+qPJihFnmI/oiNXE+GbXrFHABOYZVsb9yCrW7DUTsH2EUjQQMizaTiOZV+lb9Zp8v/p1sBY6IUbk4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(6506007)(53546011)(2906002)(36756003)(6512007)(316002)(6486002)(54906003)(6916009)(66556008)(66946007)(66476007)(4326008)(8676002)(5660300002)(8936002)(31696002)(86362001)(31686004)(38100700002)(26005)(2616005)(186003)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1BSelBHSktTRTVsemI1RktRb2FtVVVmeU5BdlR6WFhiMXMzV2pUT3dzYTI2?=
 =?utf-8?B?a21tRlpSeHJuTHFkM0lQUnZibnBIOGtnN3FkVWRTa1BIL2RvSmtuVGpVZ1k0?=
 =?utf-8?B?K0pzWlFYZzJJYWtQYjRyNVRIZlFRaStXVDF2WmN6NWxwYzhYWEd2SW5RamlZ?=
 =?utf-8?B?VERBRUtxOXhWdUtySVRDajBNY09tSHNyRGJtcURTNkpPNzQzNUNBNjRYTUIx?=
 =?utf-8?B?TVlXRHJRbGVlaWJ6dEhsWGVBRjFKUVBza0VTOEZOMTMydXZVTVhJOU5Ec3Z5?=
 =?utf-8?B?MTliK2pCOXROeFMrV2xFeDloL1R4U1RYQ1lJeXdCUWlJa2NUMDhtOTBmRENk?=
 =?utf-8?B?R1RWVkpiZTd6aklBbHRVK1Z6YVpaMXdwYU8rTlJxR2tTOWxXUWZXclBDVFll?=
 =?utf-8?B?MXp6YWtsSmZGS0g5WGVVL28xdVNram0vaVlmbElXU29RNWEvMHI1eG5ScWtF?=
 =?utf-8?B?YmRSRjhMNHE5MWZBRUN4VC92N0pzKzlvdW1vK0lEQ21LYm8wVmZlTlROZDc3?=
 =?utf-8?B?SWpGSWxVUm5hMXU3bDUzSytKSzdoQ1pLWUFMdS8rbjdmS1ZJT1huTi9rbmxU?=
 =?utf-8?B?R3N6OVllbHRyOHR1V09sQUxVeHh5RDJvdGNzVUFudDRITUpmQW5DbS9SU2Jr?=
 =?utf-8?B?VXhpTnN2YzVGdmtFNXBsMW1rbkpaN1pvbm85LzlXRFM5b3lCZFZMUFZHM1Nl?=
 =?utf-8?B?T0tFNnVtV0x2cDl1SFRZaE9jLzlWVUF6VndBMTBIWXp0elRyc3dYaDNEcTE2?=
 =?utf-8?B?K014U3Zvcm9DVndkSVpEaFcwRWgxS01WazNMUWVaY3dON1VZOWtHQSsvS2Rh?=
 =?utf-8?B?bUFXVXMvdDZ3ckZQOFlRMHhzUU03T1ZRelk1OUZGVXJMZ0NoS0tlSEZTbk1T?=
 =?utf-8?B?dmVrMWxNTE9JV0k2ZWJrMlpWMzFaMEZENXZxT1ZlVVRVaVV3RXV5WE5VVVJM?=
 =?utf-8?B?SGUvOGI2UGNhUXlBTThDU2krbklvd3JZMjlITTBaeksySzA4WXF5Wkp4SFNl?=
 =?utf-8?B?M2ZJWGlOeDczcTZkZllCSUlrQ09JZmNtbW5xL1dXZDlHK09PTnBJSFovY0Uy?=
 =?utf-8?B?b2ZtOU5hZFFQSm9sREQvM3hTK1NvK3hWN3JzbE5od3V3bmdIVXNnQ1RzdmVp?=
 =?utf-8?B?dWMvSHF5SVZLNUZZaFFOTjFKak0vWFpXUCsxVDA5bjVWWFA5a0x6bHdPcXdz?=
 =?utf-8?B?bmsrWXNQUmhwNWhNMjRWOGJ6alNkd1JST05BTTFIQzI3b1B3WGMrQTV4c0Vw?=
 =?utf-8?B?ZVEyN00wYlJaZnJDZXdWczR4cXh3U3JwZmMvU3ROUlQyMEdVRFAxdTBMcGhp?=
 =?utf-8?B?NngzYlJ4dzZpRCsxckRtRFFUQWt1QVpxcjBUUEFqSjVLcC82azVrRk5CbE0y?=
 =?utf-8?B?d0hoN2FIaVJ5N0VaZ3dmNVFPanpmbUZWeTJ1SU1WM1I2L2psUk4yUXB1VFU1?=
 =?utf-8?B?UmRuV1MvZVlwZnJQRjhvZVd2RkpzQXZHdDVQdmZKQjJDa3RYamhESFhSUTBM?=
 =?utf-8?B?K1ZmT0x0K0VuK2ZKeUFNWkNDOFNsOHRoa05VdWJ6Ny9ER1hpNnNFNGJuSmVy?=
 =?utf-8?B?cmlIdnhrUXQrUm1tZ1FnaXM2dFZHUmRQSW9MY1F4b0xNQW83UUt6VVd3ajdV?=
 =?utf-8?B?T1JGU2I4c2xqdmhFZTIxSVBuaG9TNXhXRUdRSjFIazhqbTdXczRHdEVkUzRk?=
 =?utf-8?B?d2NaK3puUW1LTmRMWE9maFFZQ2pXSTlSR0dzdUFneVh4d3VuVzA5M3o1WUs5?=
 =?utf-8?B?SHNsKzQ5QmZhbGl2OXhRUDllb3RvRDZDNEVnQXdOMDVBOU5PbUUrc3hEM0NX?=
 =?utf-8?B?NkRjUVRLdEFXMTZIZHJuSFRrK0JmYWFZZzRpR2NxNDY4cjBYV0FZem1VTlBu?=
 =?utf-8?B?Rit4T2psa3NtWHFVSmR5ZlgyVXFDZU9kdHJkL3RTWFZ5b1A0Y0o0b2U4cXQz?=
 =?utf-8?Q?DejgIXBBmLnsXqUpVoRESwOONYL4lwcg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd026408-939d-4d2c-9af6-08da067854f9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 11:38:31.9551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqtfw8MhHWV4kih4gnJGkErbcwEipVGogROt+rp+F6iTrtqB+YbU/1hEAPyxZOcTvzOyB055gvi2VB6NId97Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4237

On 14.03.2022 04:41, Chuck Zmudzinski wrote:
> Fixes: abfb006f1ff4 (tools/libxl: explicitly grant access to needed I/O-memory ranges)
> Fixes: 0561e1f01e87 (xen/common: do not implicitly permit access to mapped I/O memory)
> Backport: 4.12+

Just fyi: This is fine to have as a tag, but it wouldn't be backported
farther than to 4.15.

Apart from this largely some style issues (see below), but please
realize that I'm not a libxl maintainer and hence I may not have good
enough knowledge of, in particular, potential unwritten conventions.

> @@ -610,6 +612,45 @@ out:
>      return ret;
>  }
>  
> +static uint32_t sysfs_dev_get_igd_opregion(libxl__gc *gc,
> +                                           libxl_device_pci *pci)
> +{
> +    char *pci_device_config_path =
> +            GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/config",
> +                      pci->domain, pci->bus, pci->dev, pci->func);
> +    size_t read_items;
> +    uint32_t igd_opregion;
> +    uint32_t error = 0xffffffff;

I think this constant wants to gain a #define, to be able to correlate
the use sites. I'm also not sure of the value - in principle the
register can hold this value, but of course then it won't be 3 pages.
Maybe the error check further down should be to see whether adding 2
to the value would overflow in 32 bits? (In that case a #define may
not be needed anymore, as there wouldn't be multiple instances of the
constant in the code.)

> +
> +    FILE *f = fopen(pci_device_config_path, "r");
> +    if (!f) {

While libxl has some special style rules, I think it still wants a
blank line between declaration(s) and statement(s), just like we
expect elsewhere. Effectively you want to simply move the blank line
you have one line down.

> @@ -2531,6 +2572,37 @@ int libxl__grant_vga_iomem_permission(libxl__gc *gc, const uint32_t domid,
>                    domid, vga_iomem_start, (vga_iomem_start + 0x20 - 1));
>              return ret;
>          }
> +
> +        /* If this is an Intel IGD, allow access to the IGD opregion */
> +        if (!libxl__is_igd_vga_passthru(gc, d_config)) return 0;

Despite the provision for "return" or alike to go on the same line
as an error code check, I don't think this is okay here. It would be
if, as iirc generally expected in libxl, you latched the function
return value into a local variable named "rc" (I think).

> +        uint32_t igd_opregion = sysfs_dev_get_igd_opregion(gc, pci);
> +        uint32_t error = 0xffffffff;

Please don't mix declarations and statements. I also don't think
"error" is really necessary as a local variable, but with the change
suggested above it might disappear anyway.

> +        if (igd_opregion == error) break;

Like above I'm not sure this is okay to all live on one line. I also
think it would be nice if you used "return 0" or "break" consistently.
Of course a related question is whether failure here should actually
be reported to the caller.

> +        vga_iomem_start = ( (uint64_t) igd_opregion ) >> XC_PAGE_SHIFT;

There's no need for a cast here, as you're right-shifting. Also
(just fyi) there would have been three to many spaces here. I'm
additionally not certain whether re-using a variable for a purpose
not matching its name is deemed acceptable by libxl maintainers.

> +        ret = xc_domain_iomem_permission(CTX->xch, stubdom_domid,
> +                                         vga_iomem_start,
> +                                         IGD_OPREGION_PAGES, 1);
> +        if (ret < 0) {
> +            LOGED(ERROR, domid,
> +                  "failed to give stubdom%d access to iomem range "
> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
> +                  stubdom_domid, vga_iomem_start, (vga_iomem_start +
> +                                                IGD_OPREGION_PAGES - 1));
> +            return ret;
> +        }

I have to admit that I find it odd that this is done unconditionally,
but I notice the same is done in pre-existing code. I would have
expected this to happen only when there actually is a device model
stub domain.

Jan

> +        ret = xc_domain_iomem_permission(CTX->xch, domid,
> +                                         vga_iomem_start,
> +                                         IGD_OPREGION_PAGES, 1);
> +        if (ret < 0) {
> +            LOGED(ERROR, domid,
> +                  "failed to give dom%d access to iomem range "
> +                  "%"PRIx64"-%"PRIx64" for IGD passthru",
> +                  domid, vga_iomem_start, (vga_iomem_start +
> +                                           IGD_OPREGION_PAGES - 1));
> +            return ret;
> +        }
>          break;
>      }
>  


