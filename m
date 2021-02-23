Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E4322997
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 12:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88726.166975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEW3X-00032V-QK; Tue, 23 Feb 2021 11:40:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88726.166975; Tue, 23 Feb 2021 11:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEW3X-000327-NF; Tue, 23 Feb 2021 11:40:43 +0000
Received: by outflank-mailman (input) for mailman id 88726;
 Tue, 23 Feb 2021 11:40:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UeLE=HZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lEW3V-00031u-D1
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 11:40:41 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7cb0b1c1-4968-46bb-8a96-df299eee05c8;
 Tue, 23 Feb 2021 11:40:39 +0000 (UTC)
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
X-Inumbo-ID: 7cb0b1c1-4968-46bb-8a96-df299eee05c8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614080439;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/3fSsGYrIlfHef56cXyRjqj6xMTtwGPHkVEJpcIC2bI=;
  b=LO2K24HhKknBlhHKG/GIk4aFlTivmcuCdqWSF1qQoI5rlc+MLj4w1eDc
   RfcURip/rCC20ZKGOUSsD9WAMparxbSdv0hWmLQREcDNs2nbnEuRVdVzb
   Sy6XAcfhB+kKxAEbmFUG9C7OvsSy1lQfD61trVJqTqjjXWuCva7sl55Rd
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mJh3Pfo86OHdPlvaKnU/wwpmeg0AlGiI7Lcqi1xrzzXr8rbuhu+VkMaxlko5MpsIj/oVA3P/cY
 qrUPo6QrOfkPCQremMUtv2wNplgZqrfYSTRUk1+5KR1e9HKOj2a0W8Yzgaf4c6JXbz3qJ4wLE8
 WjQr73uo2UCIkiTW5sP2yq7k7mhvrfbXfRtZrE75BXm8/5TzEOYSGI5oNng0n1rRVQOVeZbqRl
 x7CI0qUyDCLiCf8V/yq+6vtaLrXZMhr1uj0F66SlIS3QJOfZWmr0k4ndKUxdF0hfW8OaBMgBqO
 LjI=
X-SBRS: 5.2
X-MesageID: 38184446
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,199,1610427600"; 
   d="scan'208";a="38184446"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4DdZoAQ4XFtq0obPctenxLLVuGCgFS0yM2GEnW4SSnyUST6eFidVDDx6nfpKvAk49q6e/nW+SilywaKHK7EzMYDKj5Y+S1QOVkzwr/LDYdDqCU8zqRHSrUcqqP20u45G93KncPnFnST12tk3LfsUVB//1Lu5tu97JPBZS9+9zOz9/C4lz4bSpsrGrv/fwuStXNd4GbXp/5fNsaPI6TrbgoqFO27IqkC9qcrPY1IfrY8aBAC0m0nGQki4TIOUAlwFcUNwSX9mxGMv0pDbNv349SgAeYyXXjm4H5CCnTbgfkvtmm/URO+ZNCsNwMPqXOkuzQfTKWN8FmS1HvhsgJrzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=587w1u7AFBGdrC/Uas+c5jv2J/eZIqKYuWOEsK6J6eo=;
 b=nQF54DM/7dSUuaVymqCkrs8ecfP+eQp66PczBoHURk/ARRwtQ/fg93d3DNnUfXFrwyovbT5XKW/BT1tyXisOgrggGfZqzUDU3ly+MUTJWf+HZbhHWJmFBl/zmtVBlkkBoelc6qn4poDLYYmps3K4uCZJ00ifDlMtysZ8lhggjy6DATA+67FCgYtENc/Sx1ibAYOPIZkxjm9p2uHv+s+g2aCHMNK9X4mMzc8RkV0z8kKYjaIOUfR2EsDgQBgJOuUn0egm3TBCHqJ797NB8qRBCrq+05t2G56l12/cPpU9D9hKDyfvsqKG/IEsV4f3cWfTqjvlKTz2GZtDbczYfBN38Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=587w1u7AFBGdrC/Uas+c5jv2J/eZIqKYuWOEsK6J6eo=;
 b=G5fryW2zqsXpqm1GAUFp6uFNh6xpaxJUvCdeRxEy4Kqm9H+nPg1iDNlcIVDgdVq8jfh1wgmmS1N2FYOvk2n6KQRABXnFag50DPXEiIP5Nf/8ziSJODtfaMP9XKZT0HcA3ZIPTHMFzDdJT/uf8Yh05DIGqCyp9LJZUzZC3ocCQWU=
Date: Tue, 23 Feb 2021 12:40:30 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
Subject: Re: [PATCH v2 7/8] x86: move stac()/clac() from
 {get,put}_unsafe_asm() ...
Message-ID: <YDTprpV4QfNLJpav@Air-de-Roger>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <c817e9be-bcdf-3c38-2298-0a3a58773964@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c817e9be-bcdf-3c38-2298-0a3a58773964@suse.com>
X-ClientProxiedBy: PR2P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101::13)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3311547-6c14-4e38-2f90-08d8d7efd55e
X-MS-TrafficTypeDiagnostic: DM6PR03MB3578:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB3578AC05D586AB5143FD40618F809@DM6PR03MB3578.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BaHndryeLrXFIMaVlJylAMw2DzXaaYtgX+4qYStLQy1KrmruKNVGHRykCJfmJERksyJZhRJ5ci82Z0FgSZNDtTSV3k7RUug9KuZeUPsnDfBnz5vNTBz5NU4ovjQu5UI/v5dSrP5f0xLEsxvcMmxqt9CIPI4bW9sCmrCOaHtGmKiCsfcHJAfMWyAGv5hPW8OLLcAF06VT0LMrwI4m6gpWY6VT5z/dc1kBwc63MOYnKjX14toqkBM17nEbb/xYA+fOgzTT8oKFlBWITtJNuhxQODfRbkaEB9a++1Bxv6C5K5WL5G1yUxc8H/jz9jKWrRUdkT+IJBiGo3Z69wRL6+BCWX96e+g3MmzKdCmCj7G3afIji5Jlp6iivOsfvh4yddkXrVvHBS+lgkEDlojcwgslk8+COHhcPt+5MuxDcrI6Qxr2Ry1qfrmj/atioMYvBhIcIREa1WPlpiE8rGLyecNQfKFU1OPHlTsNXFHzD6OpZEeIUrzKIcq2XQNmhw6+RlLnwVGxSCjS9e21h0DdytOpIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(346002)(39860400002)(396003)(366004)(376002)(478600001)(2906002)(186003)(16526019)(26005)(4326008)(66476007)(5660300002)(66556008)(4744005)(6666004)(66946007)(33716001)(316002)(85182001)(86362001)(8936002)(6496006)(8676002)(54906003)(6486002)(9686003)(6916009)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTd2NDQ0bjJVMnB2cUVNekI0dGhZMzBTaWdxTWp5QkdDUGF1bFZ4ZXJZekp5?=
 =?utf-8?B?MU5EZHVVVEsyWjk2SHFmaDZnOGdSenJ3K3hUelZHSCtBYWkyZXJFbUVaMlps?=
 =?utf-8?B?VWxTNEhaV2Y3SmRoek5qMUpXK3YrblBzK2hXVmViWXhpWWE5VVZVaWdSaUlt?=
 =?utf-8?B?cWJiYVNBM3IwVVR5b3NmL0ZHSnNlOHZ0VXFNMHhwd05TVGV3OVNHOW9CZ2VV?=
 =?utf-8?B?a0RsWWlaN0hGcEV5MktCRG1GUk5pVGh0MC9hQ2JzeXdxQlFuL3ptWHhNd0Qz?=
 =?utf-8?B?TzNpYVFPeE1obG1BTm1xVENLR2xFYnFmUjFmc0s2ekFkLzJDYjZqUXlqNXI3?=
 =?utf-8?B?Qi9mWmYySlR6a3cyQnVaSFBGYnducUVXTTFkV2lnN0xLeGVHb3RGbU5KZVdZ?=
 =?utf-8?B?eDF6ZGo5VTJ3UVZaRlRvSXY5clBoZnVNdTRnR3BPaHBjalQ0d1lJTnQzY2Jz?=
 =?utf-8?B?TjZ5YjhBbzFCV1BLNGN6UXRzMXFwTlpuZGlEV3VKSm9rZ3huYVRRVGRHcHhB?=
 =?utf-8?B?MktBWm1lbDlrMVRXMll2aHhkVnY1eUM2R3VDU3M4SUUwRDR0SHl5NERqc3hR?=
 =?utf-8?B?VkRDUU1BVVVRRG1iMjRMRHNlS3Zhc3hvUXFNMzRSdG5RdDMvRTlGV3RGVGtz?=
 =?utf-8?B?WGE5WnllQXNESFlocDdJMWFLdk9EYWpRQmp3SjNOaUw4cDV4WEVPK1pkSU5G?=
 =?utf-8?B?QkpwYmx1T1RMbnU3Mm1hTVNYTlc0cU5hZ3g1K0JLV1o0bXJIbDlZNnM5RG43?=
 =?utf-8?B?bEdueFpDSThFYjFCSlcxTU5FdEI3ajFqNTJRU0drWEVQS2ZGOG5XYnVqRnZ6?=
 =?utf-8?B?bTZqM0VGWE9aRmI3YkU5S003ZnBVUnJFaXQwN29SMWlsaUpqZzNpRHJjbXY3?=
 =?utf-8?B?Zy84RWlUM3E4ZzFlMFRqVU9DTG9ZdmE4ZUM4b3ozajZXTG5Oa0p4RjJLQ0E2?=
 =?utf-8?B?V0ZQK09HWTZRSUpMWmZkeHhJWDk3MCtjWkVKd2dLdldHYnNKSDhYNXlLMExy?=
 =?utf-8?B?Yy9TdGMydWxlTUw0MzZuQ2VFdFJkRlY1cnNtbnMzY0d3S0ZrazJIMjQyL0lG?=
 =?utf-8?B?dFRvVzhpU1BYVlhDeHhzZktUbXNwNkEzU2pMcmNpelVYOHJlVXlBeno4Vkl2?=
 =?utf-8?B?bzZqR0IxOS9LNFZVTlBxL1hQTzA0dVdUWnRQd1JZc243TkwzVmZjcjR3UzYz?=
 =?utf-8?B?MWZnNDB0d0hsemFBSGFNUFhlSmlRQndGbUFGa0lBOVJiNHlzNm9vUWQrN3Mx?=
 =?utf-8?B?MCszUmhKY29CUEFPcnZSZWNqSFRKb2UzUXhVVjJsU0hnSEV6U3EyLzdrbGhS?=
 =?utf-8?B?elBqODlBZ0FBTG9vOEUyN1pKSktKbnU3bzRtaHBLSUtzSFQyNjVxU3hKd3Q5?=
 =?utf-8?B?ZUU2UkxLak1Oam0rc1EybkNOTkVNMk04NHozbis2WFFUaTNQQldINEtXYnVh?=
 =?utf-8?B?b3RYbnJNaUhiRGdiQXczZk1XWE12aGVDVHhVZWJ4WmNwOFA0akthcGdjWndU?=
 =?utf-8?B?RVI4WWYwSjlyVjVhWDdtV1RpTDlTUElFZlNOOVM4QXVnYUJoWnBuSkV2WDI5?=
 =?utf-8?B?K1BKemhLV1JWWm05RkdiaFJ5N3ZWODBtZ0wrbENvMDgyS3J0V01ycHZxeWJD?=
 =?utf-8?B?VUlHUktQREJLNnRvMFFsRGgwQkZjOTNIaWdHWGdTRkRab2xSWWpHNm01RDU3?=
 =?utf-8?B?RndCanhCa3BVMjFybURWODJIVHg3azVOM1JEbWNFYWYrMTJLaUpoVVNGaDRY?=
 =?utf-8?B?ZTFOajZzanNqT2FmZ3ZyL1RKemRMWk5INlB1ZUQwR29vUElzeTZkandLQ0tj?=
 =?utf-8?B?RGpHZU96dXJ5aFBVUlVGZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3311547-6c14-4e38-2f90-08d8d7efd55e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 11:40:35.0686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOMbfxrOKSvMShT2wzkq33/TeNC1oR9YfQxzaq5vb78er+fdCcwVYY9R8od/kv4PWbWiioqt7DB/VrS3nbX67g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB3578
X-OriginatorOrg: citrix.com

On Wed, Feb 17, 2021 at 09:22:59AM +0100, Jan Beulich wrote:
> ... to {get,put}_unsafe_size(). There's no need to have the macros
> expanded once per case label in the latter. This also makes the former
> well-formed single statements again. No change in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

