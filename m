Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3EF3B4809
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 19:10:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147338.271516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpL4-0001So-QO; Fri, 25 Jun 2021 17:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147338.271516; Fri, 25 Jun 2021 17:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwpL4-0001Qp-N4; Fri, 25 Jun 2021 17:09:58 +0000
Received: by outflank-mailman (input) for mailman id 147338;
 Fri, 25 Jun 2021 17:09:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNyz=LT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lwpL3-0001Qj-BZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 17:09:57 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cce38ab2-1a13-4edc-b88b-a248d8ef5fc8;
 Fri, 25 Jun 2021 17:09:56 +0000 (UTC)
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
X-Inumbo-ID: cce38ab2-1a13-4edc-b88b-a248d8ef5fc8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624640996;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MqkJs+10dOjAdnTgVMK1Et60QKTOIcdAUzMWHRitG3A=;
  b=X287Nsf+2iM71hYAFi5Ge1xoQwj6eEArrXsfm3RMVa07lBZzLYjpITRX
   82TOg1Zmfz3erBS0n4Dd16VDk4Y7rmZSMnyQLDzFSvEDkpt3mPIsEFPms
   kDLTlUwMbmMKpIUlrLZAkDEauZkgkPL+TLRF9z0d9PzCjWCXVnd3uAEOU
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0v8A0RUI265NXxX552RpXsXZyNEd5NTjWYD1t5olAYWEhG6GVGTleHVa0qvLh+YH+qMOmj8cZs
 NzhEA8k51jYwzbnurvgk3UUCrrmQ8V8BXDCUbU0TLI4ZuK6qony+u29rTAsSMbGI0S/0S9Uia4
 i3Iz/XxtQ9jndkkcClMYoimbh9Y/CwjaRp9IV3EFSf6ROvwAtXtUmRwM5EBCO+PUggXFerYs+S
 dfxOAxKDwFd2juxf52jlBaBdpI7m8YeJ23mvebi7ADJwjvfVRQTxHmrO0fcjdNJ1Q+lWJJI+jU
 ghs=
X-SBRS: 5.1
X-MesageID: 46990931
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:5HZMDqOG5mIegMBcTyP155DYdb4zR+YMi2TDiHofdfUFSKClfp
 6V8cjztSWUtN4QMEtQ/OxoS5PwPk80kqQFnbX5XI3SITUO3VHHEGgM1/qb/9SNIVyYygcZ79
 YbT0EcMqyCMbEZt7eC3ODQKb9Jq7PmgcPY8Ns2jU0dKT2CA5sQnzuRYTzrdHGeKjM2Z6bRWK
 Dsnfau8FGbCAUqh4mAdzY4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJrsQOMD3jhiuheYwkcbyfuzIepv2p9T8R4Z
 fxiiZlG/42x2Laf2mzrxeo8RLnyiwS53jrzkLdqWf/oOTiLQhKSfZptMZ8SF/0+kAgtNZz3O
 ZgxGSCradaChvGgWDU+8XIbRd3jUC5yEBS0tL7t0YvFbf2VYUh6rD2pChuYdE99WPBmcAa+d
 BVfYThDK08SyLCU5ix1VMfsuBFXRwIb127qwY5y5SoO5U/pgEx86Ii/r1pop43zuN3d3B13Z
 WxDk1WrsA5ciY3V9MxOA5Te7r6NoTyKSi8eF56dm6Xap3vfUi98KLK3A==
X-IronPort-AV: E=Sophos;i="5.83,299,1616472000"; 
   d="scan'208";a="46990931"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bLXR4XcqgvNDjDWErYcOMg5UHMS35Jk5ouQK7OA0JT0zUetQ0+JcoUg/hBAym4sdo1sGPQgJq8VAoibMd9S03v0aHwK/fSSK6ziEdJYeMLHnREBoIh/rT5cjmVcMPQzC2mmRKed/xZHt5VAAyVZnsJYdZ+8997yBIqfDnQgXjUcRXaI2P/GLW7WleZomv0ZHzf81f5WEXbgkWS3pSsaRoFTChdh25dRApMASW5jUnJqcldwy421cKg1DOSEld8xjpLi217+XDpt2ACWCyEU4jv9ppWPOl1rL+2D6VrHevgDJk7e29fgvl0F0xaSPCoIZGNKTLDy4FjhKCQy01t1Oxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2YarMUpOQxZRELYwNTJRw5dWIndo6T3fl3kMbrqguU=;
 b=fdPqxlTQmvAfBXsHcIudVr1RpLTLIlhrKSS4RPsKQ/WqtIzupxZ3lsuX2D+tNO66np8WkcGzK6eEMvZZbF08P8IfYOKJy0jv01LOXWpO7emaut95kYj5cpS26aYEKgsq00W7EsqyTJ/bncxDmzG6YZKB8hE65luMtkO8MDqtNs+2wjOBpMrnfnYXNa8oprc4tj9rdbucq+H1/AQQJTj925P3Hy0dYYkKWNjyPXH0G/35IT/x8f2Yif0GxsNG/hdgigeN+uDxOBaZ3WRL6WTh6GU3+j5oe5KIsfGYj2LQy9SENXQq7wHnMlqqQoG4heOH4k2tJzcTg93+S6VIKWXikg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2YarMUpOQxZRELYwNTJRw5dWIndo6T3fl3kMbrqguU=;
 b=v39WxJ8t7AHh5hi6umMyiGEe9728nWB3Iimnp4Hak94XlqXFYDuhBMbGAli5Wf3gocuN3+2NJpRTU9gXbGB2P/xVOQB7dEDGUAaa/Y9qRdm93QbM53pPyZUiYLi2W42RQjSCiQKa1oepPqS9qa1A8x4ibjlLZlV51FCDf2WeHmQ=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <55875a26-7f1d-a6d9-9384-b03b3b2cb86d@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 03/12] libxenguest: short-circuit "all-dirty" handling
Message-ID: <60be051f-7751-f15d-ae4d-2c7e9af82693@citrix.com>
Date: Fri, 25 Jun 2021 18:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <55875a26-7f1d-a6d9-9384-b03b3b2cb86d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LNXP265CA0059.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ef2a7f5-a508-4e39-cdfe-08d937fafc29
X-MS-TrafficTypeDiagnostic: BYAPR03MB3671:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB36717592933552DD70901238BA069@BYAPR03MB3671.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLM+f7OgpStp+MUmWFeQj0w6Ll7rs5kYk6kYSkYeInGJ+ei2hGXqpdTkQulvYEZ/Os4aVOlhsox7ASxCrkdZLLjSS8eRUiacXItAAMK1Ef1Nwx686FLNQmk4oeUjFIPF2rxYSzDRRCv8E3dW5fWV6IJ/CqTHEMLRC7onzuJ9YDO7nrJ8jApa8jxVVmUd/tfBAL+XIhf8bPri/8/BizAKbrg0Qr25ra/iJ9FtUXE/Ae2T7bdFo2yA6oD3xaJZcQe8oje/Vd/4orxVApq2X04ZmHLruXL/isPhXHUiPAPmgs75+hZjRl2gQCcYvFeTVR7UBICEEny8W2KWl27+xPWOkhf2szBS6G1BTBGsmNpUX1KhDHt5NUMfrVtcz6hnk7XP3U3+GEn8EcTU/ubtMWZ+56mfMRlDTiam8CQ417pG89tTTDe2LufFr++fYe4YI8tNyKju02sTRJ0Ng46vf8obwiS9jypCn6FoYC01yIjgDPoFHOU7ykGHh/HUTojLmpVDT+rWLhmjmUq5GjE+/zvl89uqnLWMUrZ/D85noPiLo9iuq6bJrvfv8EfUpB2LSuZPERO/vBrcWSfsE5vA+50vYP0lerDemtvfaHhRQUdApmVTkEwmdNwOhrdhFcaMrQFo5V/aolCoX9z9Gi+zZGHwhFobBdR7vBVTX77vr7lp4cbC6awWtvaIux73zISZJgGNcQnjv/s/nGo08GclP7IdqY9zkpWRd1Pa6qaPkQ8qpjrUgPyJt1FvZmxz4AZWhlLT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(366004)(376002)(136003)(26005)(478600001)(31696002)(16526019)(5660300002)(53546011)(4326008)(66476007)(31686004)(86362001)(66946007)(186003)(66556008)(16576012)(6666004)(110136005)(36756003)(6486002)(54906003)(2906002)(316002)(2616005)(38100700002)(8936002)(8676002)(956004)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWVCb3NTQUE5MkhGMUZOMHY3R1BkcGxVSStLTkdhRHVaSHVYdFhsbFVQcnFm?=
 =?utf-8?B?NUU2MWMxSVMybnAvOWVJeFdmMlpRQ1BFUGdEMGhVc2wzN0w5MDBvLzd4ODF5?=
 =?utf-8?B?dm9uQUp2dHNEeXlMYit5ZklKNklZNVVqVjU4dDlqbDlZT0xkekk4TVRVU1o2?=
 =?utf-8?B?SDkwalRadnJPVXZsU2ZFdDJvaDVRbHE1TTFPc05tRzMwM0VsVzlHaFpkcmtB?=
 =?utf-8?B?aytxalBEYTRhYlphN0RBM2djMlpEMGNyak0wRmpMYjlLSEMxMFhqMjV6Y3Q1?=
 =?utf-8?B?NCticHpVQ2Nqd1dVQlpLeWM2YjZ4T2xwM0xKVXNUUmRVN3ZXK3VOWGJNMXZK?=
 =?utf-8?B?Yk42ZStsQU9TZ25ENzdPVWJSWFlGYjQ1aVpZQmJneDJLZFhoTk9IQWQvSC8w?=
 =?utf-8?B?SDZVWWM0a2tnaGpTUjRrOWxucExKVFY3aFV6UEF1cWZWeVdzOGtRTnFEZmRL?=
 =?utf-8?B?ZzNxWng4aGZrN2dMT1dnWm5wYnVvZmlWZy80ZytpOHI0VXRhV3RPQndIT3Zr?=
 =?utf-8?B?a3I3UHdJMVJFaGxYNTREM3hCR24zL2UzWDhhWTVwWWpjN2dZeW1MMlpWbGpk?=
 =?utf-8?B?cExITUpZTTVLbXQrRjU5ck9na3VZLzdNZHp1UU1STytKNWFManZQaW9xeU5H?=
 =?utf-8?B?Rjcyck9mRE8vanlTbHZEbEdpS2xxcWRGR3hVSzkyWkE2dXZnbjgxZ091NVZJ?=
 =?utf-8?B?OUI2VUtHSm83cEViRXQ0VWV5ajZ6cjU2Y2U2Y3RlR0ViWHJWV0NEeHZ4Q2hx?=
 =?utf-8?B?c2FQVHk2SVNzRFgxbHkxNTNLYm9oR0w5bStTek14QU9BTVNOTnpNNjhLeEp5?=
 =?utf-8?B?SG1hSmZTdzJFUWlzZmxrL2xxZVpqb2UxR014cFIvL29vZVg5Z0kwN1UxMjY4?=
 =?utf-8?B?K011SlRSTjVKUHg3eWkyeEFMQnhBSFE3bGlUNnFsRFAxWnlxUTgyKzY0RjBU?=
 =?utf-8?B?UkNWQm44WElvYXFUa1hKNUpkTkJxczRXZ2tWa1k4aVpQamdhYzlaTTFWb1Bm?=
 =?utf-8?B?OXFaL0QvYWszVDBhQzJIbHZCYlRqaWZ2YUd5RVk0RHhTbmFLWXArQ3ZoVHdN?=
 =?utf-8?B?VmhlYytheWNDK21sLzl3NWwrT05haHlYemVVZ05LbWVDbDJOZGtFZjBKUWc5?=
 =?utf-8?B?YXkxbzhnMCtOUkVCZDYyc2VuSXgydEFQdmo0amcyU0dUbjBCMUFyaVo3Vms2?=
 =?utf-8?B?YWdwbWROTSsralBiYmhUSk9vd2pvUThZWk5KZGcwUjBJVXRLdGllTGM3VHJu?=
 =?utf-8?B?WmJTUE5qYWJOOWNrOWZXR3dJeFRYV2x1QTY0M3lZNkIxNEx6YU4wb0pWUU1y?=
 =?utf-8?B?MjNSNzZtOHBwYVdNQXdlOXkva3A0L0s3TW9sRi9mcHVjL05SV2xhenoxNTNU?=
 =?utf-8?B?d29YTW84QlpmVGNJSm0ydUd6UFI1VnRYek90Z3RJNm5WSlNwdkdJQlN4eXZS?=
 =?utf-8?B?R1dsRzlnUEo5c3hudHJZcC9nVWtvR1lBVnlyVmZGL3dvWHc1cGxGVlZXczhV?=
 =?utf-8?B?djd2aU5kRThoSk1lMWhtV1l3RnJTZzhNaEhGc1VoUUhVdGtXQ29qR2Z0aTNW?=
 =?utf-8?B?cG1kTElNMlA0OXNQSkN1Q29uMmRDellQVktLdzYzUW5GalRzYVNDeTJHcm5q?=
 =?utf-8?B?alRpZ1NTcmd4eDRTK2pOZ1daSWtvOFRNMnR6YzRWVWVBTER6UmZaZVlvZ1Rm?=
 =?utf-8?B?cHIyM0VmTllnbzd6MHVKNkZIMUdMcktPTlk1Um9GT240TnZwQ1hjQW9YRjgv?=
 =?utf-8?Q?5CjpEZJdH6MpZFqK68WB7y3wEEr5C16or8MZWzi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef2a7f5-a508-4e39-cdfe-08d937fafc29
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 17:02:16.2834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpfS6vqw1mNYfbKdtpU4/R6o3uNCCEXnsveL1BKBCsBm97tF/tMil6uNjjD9Cr/zzfQbQsYeqmcPjGN+VXdZqsURyqF+XuNjvtjNmDTHrhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3671
X-OriginatorOrg: citrix.com

On 25/06/2021 14:18, Jan Beulich wrote:
> For one it is unnecessary to fill a perhaps large chunk of memory with
> all ones. Add a new parameter to send_dirty_pages() for callers to
> indicate so.
>
> Then it is further unnecessary to allocate the dirty bitmap altogether
> when all that's ever going to happen is a single all-dirty run.

The allocation is deliberate, and does want to stay where it is IMO.

Single all-dirty runs are a debugging technique only.=C2=A0 All production
cases are live, and you don't want to fail midway through because a
late, large, memory allocation failed.


As for the send_{dirty,all}_pages() split, that was deliberate to keep
the logic simple.=C2=A0 The logdirty bitmap is tiny (in comparison to other
structures) outside of artificial cases like this.

What you've done with this change is rendered send_all_pages()
redundant, but not actually taken it out of the code, thereby
complicating it.=C2=A0 At the moment, this doesn't look to be an improvemen=
t.

> @@ -807,8 +798,11 @@ static int setup(struct xc_sr_context *c
>      if ( rc )
>          goto err;
> =20
> -    dirty_bitmap =3D xc_hypercall_buffer_alloc_pages(
> -        xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)));
> +    dirty_bitmap =3D ctx->save.live || ctx->stream_type !=3D XC_STREAM_P=
LAIN
> +        ? xc_hypercall_buffer_alloc_pages(
> +              xch, dirty_bitmap, NRPAGES(bitmap_size(ctx->save.p2m_size)=
))
> +        : (void *)-1L;

This is a pointer loaded with a timebomb, which doesn't trigger NULL
pointer checks, and for which {set,clear}_bit(dirty_bitmap, large_pfn)
won't fault and will instead corrupt random areas of the address space.

~Andrew


