Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9523538C359
	for <lists+xen-devel@lfdr.de>; Fri, 21 May 2021 11:38:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.131216.245362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk1bW-0008Vg-7K; Fri, 21 May 2021 09:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 131216.245362; Fri, 21 May 2021 09:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lk1bW-0008TM-4H; Fri, 21 May 2021 09:38:02 +0000
Received: by outflank-mailman (input) for mailman id 131216;
 Fri, 21 May 2021 09:38:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6S5r=KQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lk1bU-0008TE-2S
 for xen-devel@lists.xenproject.org; Fri, 21 May 2021 09:38:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89c57c51-75d7-4d28-9551-cfc64209afba;
 Fri, 21 May 2021 09:37:58 +0000 (UTC)
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
X-Inumbo-ID: 89c57c51-75d7-4d28-9551-cfc64209afba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621589878;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=V5EFvMg3jfMFvzguFgH186OthJYDl3cIR8GbLLffcHQ=;
  b=CF/MBeTeoUvpeXnzjfLDaYBpSYik4Xz5mtgKcWlDcUx8vXKyb4+eybC9
   ZQwcW2OPVTFJuSH1TeR+MHLKRH/mn64oKa0KmsC/Qf8cBwIvPGx2WVHDr
   qUwJCagllb3yoLAj8p6YuyVeJbV/Vhh9NaU4VtvWq/4N0ZLfwMHvQeA+s
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0HkmY+Nz04qwXX8lzYq/3zOOEBcE4n8YQzDnK3bJo5tPjnKu0Kn3p5/x+z2TPO+nG4+vXA/i9O
 VPQisO5PibBX7YnlBwslovsxg268IkF2tjqTDyAtEbc5KM/mR/fS/j8+owBziwfYg0aR8N4SAK
 isKrdLJHa8z8Kew0DFBADv5DkSVyipuBiWvY5dqMagNZqEKGbBwKXjUe/UlfbQ51lGbANE0Hgf
 xOk9kXn9t5WXB2O958CwcfIVWK8mOK9piyBclL4opPcbWhpG5X9etbS4LjlemmJMfwfu0c67LG
 PWQ=
X-SBRS: 5.1
X-MesageID: 44329957
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-Data: A9a23:+fRLRqAZKNJwVRVW/wPjw5YqxClBgxIJ4kV8jS/XYbTApG8ihjQCm
 2IeCzvQM/+CN2X2LYsiO9m29xgH65aGzYU1QQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaH4EjratANlFEkvU2ybuOU5NXsZ2YhH2eIdA970Ug6w7Ng09Y26TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhzz
 vZ0hcCtTT0rHfLvhL4GUhdkCS5xaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM0DF3bveLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcEgGxq15ETQp4yY
 eJIVD5kdSjKWSRGP1kRC5gzxvX4nyLwJmgwRFW9+vNsvjm7IBZK+LriKt3OYfSRWN5Y2E2fo
 wru/W70HxUbP9y30iee/zSngeqntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3K
 lMW0jojq7Ao806mRcW7WAe3yFabujYMVtwWFPc1gCmP167V7gCxFmUCCDlbZ7QOr9QqTDYn0
 luImdLBBjF1trCRD3WH+d+pQSiaYHZPazVYPGldEFtDuYCLTJwPYgznTNBAKZ7pk9nPGxKv4
 CzQtykwu68cgptev0mkxmwrkw5At7CQEFRsvFSGDzr4hu9qTNT7PtT1sDA3+d4FfN7AFAjZ1
 JQRs5XGtIgz4YexeDthqQnnNJ+u/erNFDTBjVN1E5Al+lxBEFb4JtsJvlmSyKpzW/vomAMFg
 meI42u9B7cJZhNGiJObhKrrVqwXIVDIT4iNaxwtRoMmjmJNmOq7EMdGPhX4M4fFyxlErE3CE
 c7EIJzE4YgyUPs4pNZJewvt+eBynX1vrY8ibbv60w6mwdKjiI29Eu9eWGZimtsRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0Clo3QD1+U6eJn9vMueVNxsxoqwsBx
 VnkMmdww1vjn3zXbwKMb3FocrT0Wphj63k8OEQR0ZyAghDPva7HAH8jSqYK
IronPort-HdrOrdr: A9a23:apZfz6tG8gMNELDTEwKAWuMy7skCToMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXqF+rQbsaG6GcmT7I+0pRodLnAJGtRdBkVCe32m+yVNNXl77PECZe
 OhD6R81l2dkSN9VLXLOpBJZZmNmzWl/6iWLyIuNloC0k2jnDmo4Ln1H1yzxREFSQ5Cxr8k7C
 zsjxH5zr/LiYD59jbsk0voq7hGktrozdVOQOaWjNIOFznqggG0IKx8Rry5uiwvqu3H0idrrD
 D1mWZkAy1P0QKUQonsyiGdnDUIkQxeqkMK8GXow0cK+qfCNXQH46Mrv/MqTvPbg3BQ9u2Unp
 g7hl5wGvJsfFr9dR/Glq/1vidR5wGJSEoZ4JouZkNkIP0jgZ9q3MEiFRBuYds99ByT0vFuLA
 A4NrCj2B8RSyLDU0zk
X-IronPort-AV: E=Sophos;i="5.82,313,1613451600"; 
   d="scan'208";a="44329957"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doF0lzzlCpRNUGpy/rYm02zwxcb7rY2AVACd5Say7edAwbRoxVlTNiykRpI1ILal2T/tzcVmU6K6UFPpGBrh7ohrnNM9y5wKIerlzDhLLQwhw0H6r9tYqKW8fllWh+AMhPLTdsBAk/ZbWtieotdHwpQhjINBg7wCDPGUOOwgNVOjI+rx1mFwvts8vfVYceP367T+5g8vrrj0fkClxf9zgq1dS6Xo9T+NvjQVssJ+5VnpyXnVfyQwGRS27+U2nXxz7hDqKlN7nZ+5zueEMDavugoDozm9TLXASUHe3wqsUFoftUxFyHGyarceyPG0+YI9hQPgdqaNi01Es37Nknc07g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWwnRSBxKZqHRNCT6g9seyV9Rg0Xk/a5GNpEqkZ4XLk=;
 b=T9i184bPVQMWKv10sbA7anmfDEbEzACmq/NCPF9jIwcrm8rNSrCE5RxRcDtvK2PB22+pdMYKQ1DO+BmLf68hHgT5yweV+iY/l9N5ff9XHVASKoaFFaHdTMhSNM2tcvjFSg04soAYPyGUK10jsQr4/8rgD4Tjec9+0aQtriF96JWNmcf5hzfeNtz9QlgybRXvhVvnYz+P2rT4ptnQhKHietZxS05R1PuqVy4Hm6pWUiTRrm6ni1+NUzPyR5Jq/mY0oV3b1VHC0mGcqL/Bw24sMG2pSTlPZ5wQo/Cip+Xyzv+BMujFcYojj3U4K/RwEZE/nr/DCechDoURs2xojahTzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWwnRSBxKZqHRNCT6g9seyV9Rg0Xk/a5GNpEqkZ4XLk=;
 b=Iv/OSN2u4qBaSq+FHuDkAQ9URON+0aXsmUUxigXJiwCBXEg5KpLSRbYMwIC+dCdKb/3YzGL5rz7VA5RfVJ1gxx3tcfR1pUe5/N7MLwh1CGOpyyS8Tz1DkvxSwjAL8uOwtXCa8dMY24eY3PqdJKYsycPtZmfdxR04+CQQZilheN8=
Date: Fri, 21 May 2021 11:37:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: Jan Beulich <jbeulich@suse.com>, <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"Julien Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] libelf: improve PVH elfnote parsing
Message-ID: <YKd/awAn3UkZuszh@Air-de-Roger>
References: <20210518144741.44395-1-roger.pau@citrix.com>
 <c645b764-00fe-2b90-3b31-7f2bb6f07c02@suse.com>
 <YKYreLP8N16vcIVB@Air-de-Roger>
 <162f76e1-9da5-c750-2591-ea011b4b2842@suse.com>
 <d4250baa-9680-cd48-3684-2b61b955713d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4250baa-9680-cd48-3684-2b61b955713d@suse.com>
X-ClientProxiedBy: MR2P264CA0038.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::26)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 692a0959-3367-4ab3-3cbb-08d91c3c1b5b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB27779268066D624124CB35518F299@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +m6yz/Z5/0w7G/s/muRTo2fUpfFu+wsk9bcEgAzYKIHnkQ5XoHvH/McgcXAzdHSKo7KzJp5CoOv1mcPfTkEgq18XPxShKFhwLZCuJ5Ra0mXHvz3WSP+itFjO4ex9O9Fiv38Z3amQDO1iTCAG/zWVVzQ7wqdHfb9TkUC8SBNokesyt6xvIjE9JWZ2BncMqay5nMe2aI0LnKqhyWZRDIwzuqjwHiOGnPSleXb0vaJ3Se1V9yQOG5PfK2bJkOReNw1f2WTkYNKcC0TIhbsuSLoKOTFo7dG4TDN3ISvYkKAoiioiPbPx4w6mmqh/Ef+CxK4Q+u5ffrArzXyFW9Qgy26o0wpTR21Xuqb+NcYgPs86uycuD59O525J9Qs/xt0gGJirWgbHy5OYN8yYUuIoV9N7wA1P+A20RW3ALPED1C9uIydDNOjrVPsJu/pNPQ+IAkTJTnh4/0xUkHqTUPV9mQaBfXNdQksNmO3D0pdDtIxJ0KC72n+k92skBqBHMQTYykQKNacAujUlTvke+N/8fqAEy8eRrcOMNAAchexDMq5TzslxpoTQjFZFbdE9UY6PBp0uf037TVzgwGmABwADgBD8TVnOT9R1maKd/mOqS6uA7U8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(16526019)(8676002)(8936002)(54906003)(186003)(478600001)(86362001)(6496006)(33716001)(6916009)(26005)(6666004)(53546011)(9686003)(316002)(4326008)(956004)(2906002)(6486002)(83380400001)(85182001)(5660300002)(66476007)(66946007)(38100700002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eEo5ZThWNm92WEJ3SGNZY0tWL0VQS0dRMEVXTmJ3Q001SUdabUZmMGttQVhj?=
 =?utf-8?B?TTF1b3BSNnI2NEhMd3BaTkZjZHRUZTNza3JjY0tCTDFlZDl3Sk9KekpMTzNP?=
 =?utf-8?B?cVdXZVRxOXcvVzByM0dEeWV5LytjUllGc09mWE5mQ0xCclF6RUwzdFY3bVE5?=
 =?utf-8?B?Q3p6aHN3VmphUEZwelgxMHE5YUdDSnJVMzF5Mlpubk5PaldzbmNpcjV6NWsy?=
 =?utf-8?B?UGRoNzBtcXFTVk5OYVJzUnNkNGMwOXQ0Y3JCTWZzbGE3TE5hTUIrWGNGSVZo?=
 =?utf-8?B?WmRXL05DWjR1QjRyNDNKVVhYRlNUaDVnMTVYVXdwb0tRaHVkMUFlcU1leW9O?=
 =?utf-8?B?TUtzR1N3bXIxRlg0Z3pNQVNyQWYvRmI3Sm43K1owazZTbVBXTjNtTDlXQjZy?=
 =?utf-8?B?Y0pIK2FSUzFnekJHY0lDcTZMNUhxd0J2VnU3RFVubVhBekgvWVBXQVUzNUJ3?=
 =?utf-8?B?RUxyM1MzS0ZDeWlTMGZ2YThFalh5UU5nY2xVK3R4RUF6TFQ1ak1pM0tKL3Fk?=
 =?utf-8?B?bFRIV0tCVUxQb01abUlyZnFqRU1BTkVQblgxYVpmSlRqQndkMGxLNW1ST093?=
 =?utf-8?B?RGdaazFJWVVYbnEyWjF3eDExYnVERnozd3JiT2tLa2pvbTVPQzVheUE0T1NT?=
 =?utf-8?B?aVV3MlExOWZaVVJFRmMrOFNqRU1vanpKM0tnZktaS0NnYlVUeXViUDFacTFF?=
 =?utf-8?B?Qk5VbEExYjNzSE5UaFRObU9KbUpTTi9zVTdVM1M2S1NJanI3ZmdhKzhxL1la?=
 =?utf-8?B?L2hUWVB3ZytjbHJodU5zUkl6cldhYjB5b3VnNU01d0ZCOEpHOVhHMm8rdkEx?=
 =?utf-8?B?Wmo0RG9sUnJXakNNQmxjcDlyR2t4Z3Erc3JEb2Z5bHIyRjFTUnpENXc1bUxu?=
 =?utf-8?B?dUJkM3lWY3JiZmVQaTd3dHFzd0JyNEh5SWpCSW5vY29Lb1FjQlRybTcyQm41?=
 =?utf-8?B?cFU0TzJ2NWx5RFpmNWtXYjNEbmRtbEVrYWYxdVJMaXFPdUpuOFBEeitWZCtW?=
 =?utf-8?B?ZTg4cXJ5WHQyWkI4Qmt5Q05zTEJDd2NGbEV2cmRoODh0dmxqYkZRdlFhUXZ2?=
 =?utf-8?B?VnA0RjlwUHBRVTA0d2NjZDI2SXlHMXBrRWVCVjVzUExZU3BGTEs5a256WjBp?=
 =?utf-8?B?d3A3Rk4zSHRNd3l0VDQ0ZVFCV1ZiSEhsbFdCdGliU2tXVGluZlBWalJHS1ZX?=
 =?utf-8?B?UVk2QWc5WVdjTXJHam0zQWVWK0JvQVhwOHcvQy90SFA5aDkrLzJrSWNkNy9j?=
 =?utf-8?B?K0oyOG96S2FCSGJuQlFicENLZmV1d3hFNVpYN1MyVmRlR0UvdHk1T3ZCV2sy?=
 =?utf-8?B?V0VnNzQ3TlFqMUZKNUl4MUtwQ0hLZUhVTVJucGpYT1Zma2FSVnVGRzNubG5x?=
 =?utf-8?B?dmlSb2xhUWV1Q3Rxbm1qTXNLaVdrNGc1Yi9QVEFIeHdVV3FyaS9zNkd1Uk9q?=
 =?utf-8?B?RjN1b3JnaE5PcTMxdm0yM2JSemRWMk15eEM4OVB0cjhKM2ZWN0hJY3R4Z0w0?=
 =?utf-8?B?Y3ZrL1dXZHpHL2l1dU5xd1VROG9oOEgvM0I0UnZkRXUrTXFSV2RUb2xPYkQw?=
 =?utf-8?B?d1ZSVUtia0lQeTJyaUt4OG8vc0tnWkJzTDhHaEI5bUJUQVBqMllxclhoUFF1?=
 =?utf-8?B?ODBROWVOelNESGltZ2ZxbjFKbHVidWRoQ2xhTE9lZ2JrTVNFOTc0LzNWa1RI?=
 =?utf-8?B?cXYrQXJ6WmFINExEak9pZHBCSDJ2ZjFkWW9SNWFaS0dRSUJlZVU4dWh0WW93?=
 =?utf-8?Q?ejVZ/8IOZaHj3i1VeUNZY1o3aM3LXW+t+p6BVPi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 692a0959-3367-4ab3-3cbb-08d91c3c1b5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 09:37:53.4097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWNlvl3Muv/bCENJQjt45DCvHN2KvTq/GkcZC9hVosoSSs5PjwcqbC0CT5qQlH7Vifb0pQUb2M6bYFVsv2WdZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

On Fri, May 21, 2021 at 07:26:21AM +0200, Juergen Gross wrote:
> On 20.05.21 11:28, Jan Beulich wrote:
> > On 20.05.2021 11:27, Roger Pau Monné wrote:
> > > On Wed, May 19, 2021 at 12:34:19PM +0200, Jan Beulich wrote:
> > > > On 18.05.2021 16:47, Roger Pau Monne wrote:
> > > > > @@ -425,8 +425,11 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> > > > >           return -1;
> > > > >       }
> > > > > -    /* Initial guess for virt_base is 0 if it is not explicitly defined. */
> > > > > -    if ( parms->virt_base == UNSET_ADDR )
> > > > > +    /*
> > > > > +     * Initial guess for virt_base is 0 if it is not explicitly defined in the
> > > > > +     * PV case. For PVH virt_base is forced to 0 because paging is disabled.
> > > > > +     */
> > > > > +    if ( parms->virt_base == UNSET_ADDR || hvm )
> > > > >       {
> > > > >           parms->virt_base = 0;
> > > > >           elf_msg(elf, "ELF: VIRT_BASE unset, using %#" PRIx64 "\n",
> > > > 
> > > > This message is wrong now if hvm is true but parms->virt_base != UNSET_ADDR.
> > > > Best perhaps is to avoid emitting the message altogether when hvm is true.
> > > > (Since you'll be touching it anyway, perhaps a good opportunity
> > > > to do
> away
> > > > with passing parms->virt_base to elf_msg(), and instead simply use a literal
> > > > zero.)
> > > > 
> > > > > @@ -441,8 +444,10 @@ static elf_errorstatus elf_xen_addr_calc_check(struct elf_binary *elf,
> > > > >        *
> > > > >        * If we are using the modern ELF notes interface then the default
> > > > >        * is 0.
> > > > > +     *
> > > > > +     * For PVH this is forced to 0, as it's already a
> > > > > legacy option
> for PV.
> > > > >        */
> > > > > -    if ( parms->elf_paddr_offset == UNSET_ADDR )
> > > > > +    if ( parms->elf_paddr_offset == UNSET_ADDR || hvm )
> > > > >       {
> > > > >           if ( parms->elf_note_start )
> > > > 
> > > > Don't you want "|| hvm" here as well, or alternatively suppress the
> > > > fallback to the __xen_guest section in the PVH case (near the end of
> > > > elf_xen_parse())?
> > > 
> > > The legacy __xen_guest section doesn't support PHYS32_ENTRY, so yes,
> > > that part could be completely skipped when called from an HVM
> > > container.
> > > 
> > > I think I will fix that in another patch though if you are OK, as
> > > it's not strictly related to the calculation fixes done here.
> > 
> > That's fine; it wants to be a prereq to the one here then, though,
> > I think.
> 
> Would it be possible to add some comment to xen/include/public/elfnote.h
> Indicating which elfnotes are evaluated for which guest types,

For PVH after this patch the only mandatory note should be
PHYS32_ENTRY. BSD_SYMTAB is also parsed if found on that case.

> including
> a hint which elfnotes _have_ been evaluated before this series?

Before this patch mostly all PV notes are parsed, and you have to
manage to get suitable values set so that:

    if ( (parms->virt_kstart > parms->virt_kend) ||
         (parms->virt_entry < parms->virt_kstart) ||
         (parms->virt_entry > parms->virt_kend) ||
         (parms->virt_base > parms->virt_kstart) )
    {
        elf_err(elf, "ERROR: ELF start or entries are out of bounds\n");
        return -1;
    }

Doesn't trigger. That can be done by setting virt_entry or the native
elf entry point to a value that satisfies the condition. Or by setting
a suitable offset in VIRT_BASE to a value that matches the offset
added to the native entry point in the ELF header.

I can try to write this up, albeit I think it can get messy. Not sure
what's the best approach here regarding recommended settings to
satisfy old Xen versions.

Roger.

