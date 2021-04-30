Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBA036FD56
	for <lists+xen-devel@lfdr.de>; Fri, 30 Apr 2021 17:09:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.120590.228061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUkn-0004dQ-97; Fri, 30 Apr 2021 15:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120590.228061; Fri, 30 Apr 2021 15:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcUkn-0004d1-5w; Fri, 30 Apr 2021 15:08:29 +0000
Received: by outflank-mailman (input) for mailman id 120590;
 Fri, 30 Apr 2021 15:08:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3Ge=J3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lcUkl-0004cw-NW
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 15:08:27 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2763b6a9-1b40-451d-a054-8e8b7a5d8487;
 Fri, 30 Apr 2021 15:08:26 +0000 (UTC)
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
X-Inumbo-ID: 2763b6a9-1b40-451d-a054-8e8b7a5d8487
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619795306;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7bFo7AR3RU498RzCm4Ttt9PVrysmrC90aMQFgr+BdgU=;
  b=e+8GlglSALCzqLb6PRsqXk+hJtKu+tYVMMCVIwLcROkBQ+vRKa2FCMgK
   pU2sz4C8IP1MO7NTSy+ZfJPBfmBAfBCo16hPi4O6FTedksbU+elF6BIxK
   2KlmLOKUqzNFWiFa8Ny8TF2kjFFzr7ldf8xwCvOQfg9/mUJ9wHUqYXUDi
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: n69wzW1m8ahtAdT+6RqSLTNaSqpPncapesjCg0zom0stNEgUrKarGC2+zKbstwgO1NViAnZdPU
 6EgsHl2QzqgDXdtr8murDuL9Y88XfuvuoXp3+V30K9HS+TgVIV/UshOBDh+iDs9Ik++T2NoR/Y
 CfwNwKUnTc2Ijfea8XzpTscPHHbTIJ/9YJZJgAzcBCneVurMNpd3jdGVuy2OQ+aQ8BRQG/xFs2
 oT/LIX4iM+Ie5Wlftepcjo/bdoWhEjI8R90Ty0xl15qkuoQoLubCcvLpGo2N5aPnwUP14O6/mS
 lSs=
X-SBRS: 5.1
X-MesageID: 43194421
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+L7ynqP3QY/+1cBcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFfLM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MFzxGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rciK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW87Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqwu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjwwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW00pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/TvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF363ACyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/ZpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/koNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUD8qg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJwfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3uinHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczq8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Std+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rdkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXCvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmRSae+jQuUIqk1xX/DFhmBrM4+GdkRbmNHADFxbYjJVQVSRUKV6Sg6
 3+gLOl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,263,1613451600"; 
   d="scan'208";a="43194421"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlCt9P9RjTwzksB0Y30zKhtxK2lh7hDyi6SJu2uUZzWlcF4gVozVb2VmGYhO5Hc2gp7X9KsLry5OBLO3iq4BvfPIpRPJMNX/6nc459drjM2kx+SIUuB+ya0hm/Lb7PQT9sRuqz377GJ1BCu3HNWTtNHMMf5J/WzQWBqvJQrewI+iANAnszHBtuny3m8jOGC2YGXCdH20q8wBTuJnHRQVxghBVkYAP7lv+e6W1giWwvh0gBbLoU/VA88aU5tLJsaxIbO11YO9yc9GG+0sM83t83L4y1WOyG9AE2HXLZUgNpGByQTuzQVBSapzf5skWXJcogdLt7WNQCQnwelN+mGLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bFo7AR3RU498RzCm4Ttt9PVrysmrC90aMQFgr+BdgU=;
 b=mFAGFvFEvhV2VYSIQPXklSZa6tiiJwgUKwIgGT1elbAAVNE9mPux80ymPIraYebuJSESy8I3w1YQpnfVbDxwr+yfWzU967C5HmnrSSMbFgsKDsFBhVPTP1uPdDl40AFMyfWu1rMZDpqMyLfgSwkNAUAO63Z4aDAGnIUF6OpxXMKU+X76h1E/AlpHZSVY6jFy0lma4FQHVZxbPjVmdbXEyu34wbItB7i4jfb8S7FB1rb8GBopL3IQOVo5aVu7b7SYDQ+xhV06mB4J2TUupWqH1M65X1/pl1uZBtZoxhVpOybl4DCL056dnc87HNNPyj0+6RSGCeHYqOoNEmxzjen8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bFo7AR3RU498RzCm4Ttt9PVrysmrC90aMQFgr+BdgU=;
 b=pPCcxwVwKoTMuzSfA0lcGDFUtUuvmk0Ylms1a/zElXbMQvxzSlEN/OZ3NiUYpD7ktWk2I9CRSL1Z1I8tHCgIC6pfv0U3vo+VlHdgM9Seb6wAjuSkEyYYVtMLbtR8LkXwdfRuIlAmOF+VaOGm5yWembXwv6nvpx9qoKtKeEjTIfE=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210426175421.30497-1-andrew.cooper3@citrix.com>
 <20210426175421.30497-2-andrew.cooper3@citrix.com>
 <d8bd932d-071a-4a5b-747c-02cbd5e296cd@suse.com>
 <86cf1d97-2034-7791-071a-48208b6ba54b@citrix.com>
 <28d7b7a9-9dd2-1664-e946-d7e4a330da0f@suse.com>
 <3d1847f2-4ba6-416a-7957-3310b5d5124c@citrix.com>
 <d0731b8b-7dd7-ed9f-e3fa-6543ed5e5afd@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/3] x86/hvm: Introduce experimental guest CET support
Message-ID: <693c7708-b699-51df-1c1b-5d25a43a2dca@citrix.com>
Date: Fri, 30 Apr 2021 16:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d0731b8b-7dd7-ed9f-e3fa-6543ed5e5afd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61a389f5-f82e-4872-7e6e-08d90be9cb2b
X-MS-TrafficTypeDiagnostic: BYAPR03MB4679:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4679811DA15E2AB15CF12DC5BA5E9@BYAPR03MB4679.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOCSfASGOR/079KBHjx9S6oubkdfcwUblOX227WXZOrORz0Q8YCZHx/MuXbHYUwFlUQfLC+NMAVIlEBDxonSVeY093UJDEVif9kBh2dVeNXRHWBjmaVPCurt2ZNIr0NuBvQrm52kkTQ6JuOPjNcY9sfc1e0j+piFoVsPRWhYkb4Ku96ifyaCDCQHJ4oBUoZ7aWRCQGHdIdA+JRJLuKK9JwGWLy246Ax3smFwUnOASe+Hpmqjibi7WG4hPul0ccajqiR8f841CGrrLA9VTLQkbBGi5+d+RgoiaiOo8i2VsIDwynHIEXq18ngymBhzzTpIO4p0v+j7tiY87uCfSYYGN5woJPxBGo4nEIiNPEs20Wdp1oTccK3xmMhRTe6vV2eSnG7s6VXEs9ZUTOKU14wg0Cd4GCRvEljp6XaFHGCevFMZKmwINyQwIb1n44kUSFwHAluCZIvKzWBeKsQh12ULECVvaH/7SAGtnEfbYz+DM3HwH0+fiy4IxlpsREUrpNfI5V6FQadFFJvZjKl1eBrcLhh6mi3i/O/mDyt6ZIydAK9aacoCEoPHmxStoKpCn+VIChw9h8Azfjbd+B1Tc/8+dxUufrGAktM6EqnasdW20SIOdhAL+78+CBI9qnDiEg6MrrfFz16gvov2KHDQz+32/+/Egpgtp6Osy8FvUbMIaDWuIesOPbAQvHY0KF9+nepD
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(86362001)(2906002)(6486002)(31686004)(6916009)(8936002)(4326008)(2616005)(956004)(8676002)(316002)(16576012)(26005)(36756003)(54906003)(186003)(16526019)(478600001)(38100700002)(53546011)(5660300002)(4744005)(66946007)(66476007)(66556008)(6666004)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFhONlN2b0lwTVZ3ci81VHRTM3o0NzloYWtqa1Z2UnJtL2QwdC8rZjg0SVJU?=
 =?utf-8?B?L1UzVkN6RmsvU1E4dndnYzZrM3lBWVBGcEEyT3Rxdzg2akR6NWdsSHptS0ND?=
 =?utf-8?B?Kys3U284emxJVXFNYytuV3RxYUZMdnMvUVl4Ti9ndGJjbWtqSTIweFkvRURX?=
 =?utf-8?B?VzJJMy9qLzRNT1NreE9NOTRXeFdoaUwxWDBNcE1CbjhKbmVITFlWVGRrQzlQ?=
 =?utf-8?B?cGE2S3FyN2pTMUxLTjRHQWFGT2hwQUY0QURyU2lGU1Z4MEdhVER4cjY2YSsx?=
 =?utf-8?B?bG9IRUVhRmppd0Z5Z2JzMk1ubWJHZDJQU3RvMDVPcktvMFQra1VyeFNudzVj?=
 =?utf-8?B?OFpnS2JVek1zSjQ2VURTY1pJMUprb2U1Q2FtTW1SMXZRd251dmVPbTFSN2FU?=
 =?utf-8?B?eU1VSnIxdVFqUjhuOGF4dkUvaGNIelFEY2xkSVdZRWVSbndiVTlJVEVOMURp?=
 =?utf-8?B?N1lRUUpOaDRHbHBoUjBtT1pDamNDYmVvb1NnSHpLR3JOMk5iZXZ1Y3h4ZWg4?=
 =?utf-8?B?UHFNRE1qbEhqdmsrcWN0SmNVakVNZVNTTFV5MzNmeisranY2Zm5FMzB3UjZJ?=
 =?utf-8?B?YlZVOHpidWdiMUxSNUdhT1R1aWRJckwvZG8rTjRyL29TR2FTSThHNnU0Z3Yx?=
 =?utf-8?B?RVh6anhrNEdUYkE0S09lekZCVnpoUDBrWkN2NHVCRmR4S3BCOGFySXVOdnVF?=
 =?utf-8?B?cTEwK3RvcEFvaU9nMHkvcWtoZmI1QWdGVURwUEZMVFYwQ2hmRjZwanRHeDU3?=
 =?utf-8?B?Y1JSV0p1Ukw2cjhHTitwVnQ1YUpPcURhN0pWL0JUYk5FVC9wdmdDejRpcEYv?=
 =?utf-8?B?TUM4VDV3cFZEeGlwSGh2aE1EQzBpdyszbFRRZnJ2MC9pZHFZQWVsSHdDYzJY?=
 =?utf-8?B?cUREZzRmTHAyeVRTOFFHTUlZblNFWFM3Q0h4aW1FdEVGOFcwNnF6YXkwWXMy?=
 =?utf-8?B?cVZaSXJZeVpNZzZrZnB3OVdxOGQwMHVTWE0zbXI2NTVCZmdZN2RLTHI0YmF1?=
 =?utf-8?B?WWpwNGpTNHpTeHBjdWlJak42akdiSDc5a2lXbTkycnJzMGxHeTZvVGdlL3JE?=
 =?utf-8?B?a1dDdFo2bmN5V2xWSlJGaDl4dzZSaVhuRWhBSmx6eVkyRXg3UzZiVXdQRGZU?=
 =?utf-8?B?czFmUHhHRzBBdk1mNVJFQWdNM21lQ29pVW54Z04zNzlrQzVPWnNObTB5RTVZ?=
 =?utf-8?B?cXN1N1ZyWWt0RFJ4NFFlQURuUm1sK0dtQTdVMG00MFhOQzU2d3VkbkRYNlR0?=
 =?utf-8?B?SEhhdFZmc2JoYUJZY0dUc1JpczNkVFZwV3N5ZnhXeEhvSkdFTWFLaGhiekFk?=
 =?utf-8?B?aVEwWHBOaHZDSXZTSGU4RkVYUnBUTit0TVZXMWVPaWJKSjBEMDRGNWp5bi9I?=
 =?utf-8?B?ZGUzVHRmU0tsUjI1QXFYdWR5ajkzWmliWitHTnJFZUEwUVhzL3ZGY1BzZkNy?=
 =?utf-8?B?S0xDeUV0TDFxYTZaKzlLN2RYWXdySEl4STY2bGZCUEI0b2EzalFIMDF3b3VV?=
 =?utf-8?B?V2txNUx1ZU1qZTI3bFB5Z2puTml4d0xnY1VJYmZMZjZPTjhnYnlUYkgxazRt?=
 =?utf-8?B?K1B3bTQ1SjNWWFo2VE1WcUJqaGQ3M1loblpsblpTK3I3NTRSN0JkUlVnNUhK?=
 =?utf-8?B?Y2RQVW9mTzFoblB0NEo0cVgrT3JtOEtnR0w5RS91K3Z4WkVXaHMwVktMaWRk?=
 =?utf-8?B?YTlhNDQ3eE5sVTZBU2tmT0pEQWRSTVBPY1hTajkzSXk5MHRxN2ZYTERGOHRV?=
 =?utf-8?Q?ZxpRBtVu7HCnsQgRDA3UBHrPLEU9OhUL+LgbXQn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a389f5-f82e-4872-7e6e-08d90be9cb2b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2021 15:08:21.7094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLwwdaGJk0VkYtXjyVSQdwZaS/bWp3JqvW23wKEcR3IPhKg0btmsOzDyOEprhKfxmgjHSXTCFOUeHkcNhqYxlwhxqG+s/OvheK1kFKnZfxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4679
X-OriginatorOrg: citrix.com

On 29/04/2021 10:07, Jan Beulich wrote:
> On 28.04.2021 19:54, Andrew Cooper wrote:
>> I know we're making up our "how to do complicated experimental features"
>> process as we go here, but nothing *in Xen* will malfunction if a user
>> opts into CET_SS/IBT.=C2=A0 Therefore I think they're fine to go in and =
stay.
> Well, okay then. I hope possibls future additions of mine then will
> get similar treatment.

So having thought on this for a while...

The annotations in the header file don't help me.=C2=A0 My dev workflow
already starts with turning them to default, skips messing around with
toolstack level things.

At this point in feature development, there is no use to anyone who
isn't also editing the hypervisor too.

So unless it is going to help you (and I suspect it wont), its probably
not helpful to the wider world.

I'll drop the markings from this patch, and put them back in at the
point that we believe "basic VMs" work.

~Andrew


