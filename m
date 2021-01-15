Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BF2F8044
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 17:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68404.122491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Re6-0007xV-M1; Fri, 15 Jan 2021 16:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68404.122491; Fri, 15 Jan 2021 16:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Re6-0007x6-IZ; Fri, 15 Jan 2021 16:08:18 +0000
Received: by outflank-mailman (input) for mailman id 68404;
 Fri, 15 Jan 2021 16:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h4P=GS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1l0Re4-0007x0-L6
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:08:16 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83693abd-de47-41b6-bff5-4d2b2e1d2333;
 Fri, 15 Jan 2021 16:08:15 +0000 (UTC)
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
X-Inumbo-ID: 83693abd-de47-41b6-bff5-4d2b2e1d2333
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610726895;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=x3aQYrc+70uiTSLTCFeXiJvlZ9WNdv2MI0mzjeRy6sk=;
  b=aSiyZLnBBa78L0b8yBuvKBbYqDXt3dWiqfI2aeMa6m3E8O+f52vFJRTu
   p/il42DAC5409gCb9keNoJxluB0gTPIybeNUdwdjqTjledDjroIPfJxma
   fhYP9LFkwOXdLKmeJBw7KdUB2LuJEOiv+KoPIzN97IISa7HFtgPkcPu78
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kNC15CsnN196iz1UsC0WDaSFrODKKJzD34qRM07iNPjxpAd0bbOlUHbh0t/7NwlimVDsPYERHg
 WGYf/fosIOeaFrpSx52iuGb+cRfWb3GVdG7FqfJKP+u93QA5ABY0ZFpZHnSRjuymjJj/xGM5m4
 4Mxs0WT7l46wjFPexSuKc/wVi6U4inwW5UB/lI+tvkVmLoueyD5aEp5JkpDWNKexEhuaPffDSh
 Bl/t5PR4+NmQWMQBkdANz60RahTxdSovbUZTXOqILgbyU+nZNkfkzji5WlzQT0FzQRpVUVqjMp
 SzU=
X-SBRS: 5.2
X-MesageID: 35187644
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,349,1602561600"; 
   d="scan'208";a="35187644"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMgUA8eEyvA8x90zg9+0qV2C1/wcmnxos+10tPQxdE4NzQkMVUUsGq0/JeMhWxg7+98ra70duuOX6sFvndxijGDAEuW1Kb22o1jpMRhfw+0WCfxUQkDVp9lM0v6GaEx71MWpBH5wsL3YL7fHYJ3ju1Ox1gV/qvNyBLWLVyNl5/Kt1ERGytDottL4GZxyBHSY/wUBRWI9IoT64sKfCg5hc7Z8F+KKAwtw1Yd+2Vghq2XElPnzPJqXrhUdxR3u8qmT0pZqFZwuT+NkepMgrCviTNFM1UWhB4pHO9wAtxPAhQFBKxwNVTdHuxMKN+ZXXT+rQg+LLuvk6077yX3f3BubQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phvsl5XWf1Xbbb4wAbhpi9nGpGCzw1QIzaPd9enO0lg=;
 b=e5PWpTqO036qJhYefqdqC9EPcQPnqT1DZoxjuL5GwWByinN0/sEOKncNB2+SiY34nJOTNaeKPlG+TRqPqtEQdTITV4WzzHiDsT6xikhn2+wflK8zVZT7kdUMFaVZV5aXepWAXomRY70WCMFVRncwbVdlQ0LweWGA6a/K3wwiJsfoY88h4+/HmGEFd0rDiXwE3fCwNp6vLhXgHTHD5KlgM0pawhHexFKxJpRNyQBV4KXFc11h248CpwSNA7rMXeDpGVAPkSzHfZ3X5yG0Jq91UeI4ebcuLvkiIrsDRITqKumqBGbB+a3nFW38HPsN5noMpFCdQOtD/C4GjiPRMZuX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phvsl5XWf1Xbbb4wAbhpi9nGpGCzw1QIzaPd9enO0lg=;
 b=F1dj2MnClU9FaY3jXUNS2TZV1yfrzhwLw3LZRlxB77L4sVIs9c6DasGgOAR6wEP+vSIUEVxgZHidkPQZ13QrJwnl3ksvD36GBAkfsOLahr1cp3tWe2JtkZaR36+401OTkFeqyhpAis6cO1+7fPXBWRUJfIHfA/1YTMLSj6A5FUo=
Date: Fri, 15 Jan 2021 17:08:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Ian
 Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xenpaging.c: include errno.h
Message-ID: <20210115160806.5n3kl2sued4j7fqc@Air-de-Roger>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-20-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210112181242.1570-20-bouyer@antioche.eu.org>
X-ClientProxiedBy: MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9306b77d-bb3d-4d78-6b52-08d8b96fc0fd
X-MS-TrafficTypeDiagnostic: DS7PR03MB5445:
X-Microsoft-Antispam-PRVS: <DS7PR03MB5445BF86F6D2EA43D3B0D11C8FA70@DS7PR03MB5445.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktmgzWK8wl0XP9mJH1YdnwgKQ/hoMAo8QkxIll/zr0fShH7EYWeR8yyf9W9aLFgsTvZNhDWcocWFrMZqAPC+4vJsA37qnaryk75Jleg+Uf16RZJNS1u0Y0IlZo0XvOTlSXEjBfCx+002adek5gsr2nZ2vQZGy9KXZOigOzonNLRqNrVmELSL+AHPCIHYhCSQEomMMtuif9+qA3KgdZfF6Go39gMLdYhD33egEadULllaAaBK5mU54cT5jomNUw+9/czvq4eyxEErhXuy6D46sAXAJFZTl19Kl4c5trzWahoey7FX0m0q2lVw2PeBnYtMa0AILJyQR3XlX8qvjqnv4VDXph7JN9DpnW3j/Z8xc7NJbhYaCDStQ2zI8haMBPHWMQAlgPsqVaRsCo1wLZSTeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(366004)(346002)(376002)(136003)(39860400002)(33716001)(5660300002)(186003)(86362001)(26005)(16526019)(6486002)(54906003)(2906002)(8936002)(6916009)(6666004)(85182001)(1076003)(558084003)(4326008)(66946007)(66476007)(66556008)(478600001)(6496006)(8676002)(316002)(956004)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WU5HK2thNTdRbU1aT1Z5Mi9uSWNDNE9VV2Jxa0pwYTJ1ZWk1U2RnYUJjZ3o3?=
 =?utf-8?B?ejQ2WURTcFB0MGVlYkJBbTdPdzd1MTM0WkZtSnlPRVM1aFJnMW9BV2ExUEUx?=
 =?utf-8?B?NGt6OHY5emJlcHk3NkNTOURjc2EzQUFCcStWSS90ZFhFVEhrZm9LcndUUFR6?=
 =?utf-8?B?cVdRTjJxdzhZMXVLbGhHVW9MMFF4U1pSL05UZGFyeTJ5MzFDUFQwUURmYTR1?=
 =?utf-8?B?enY0K094Y0tOMHUwVXY4Ymh1ZlBPejVEWHZkSEFoUFNnWS9Wakp2QnB5Q2pt?=
 =?utf-8?B?MGxKU3ZJSE1MdWhub2wrRVN2d0VBc24wRlFLQmcxZ0FKV1Q3NUpyeFlrRGg1?=
 =?utf-8?B?UGRwcTI3c0doMHVxdWFNdWlTSERya3NxNjJkS3NXZk1QcFpoZXVZQzI1Mys2?=
 =?utf-8?B?WEcxWVBnNHNpNWFwQTJ5UStyNmZnV0xDOW8vNDhXa2YwUmtQY094K2tuSTBY?=
 =?utf-8?B?ckJackE1bVYyYWZiNGNUNUJrcCt2ZktmeVBkZFN4ZzBNTkhHeXAxM1dhcSt1?=
 =?utf-8?B?OFlLNjV6N2lhZzVaWXBCdkc2ZWVUS1hOM1FMZjhlMGNoYmlCajlVbkZZWlJI?=
 =?utf-8?B?MUM0Y09kem5ZWGhZVUoza3NJdkxhMy9DSjhpajBNbnduK3pneVk5bklyai85?=
 =?utf-8?B?NVE1SHdKN1hEbTdPTi9YRGp4eDU0TnhScFU2WExHdDB3N0ZUL0RESkwxMG95?=
 =?utf-8?B?V3BHaWJ3a0R0U0ZRRlo2ZW9SMUxVMlV3Z0xqNERQQ3pNVXp4UldDQkRzcWxJ?=
 =?utf-8?B?M0tQUGJBeURUNVdDT1AyV3VUVFdyZ0dsaVB1bFRJM2ZocGxTZXRxTmlVZkx1?=
 =?utf-8?B?MDZxZ3BwdW9FNE01bWRzaWxIYlJWT2V5N3dSOTYzMlhxMkg4WGM5Z0JrbUYx?=
 =?utf-8?B?NU4vSnF1OFdLR1pZRGlqbkhJVmUrQVhCVGlNRjFNOVkwbm9KcG1GbGNqTjB5?=
 =?utf-8?B?eUY0Ymh3RHJqQno2QUN4Vjg2c2psb08rTkdsMlo2ekVqdmVGVno5RnJrMUJa?=
 =?utf-8?B?czhodDd1K3BYUi82TXgwTVN4L1hPVDZmd1RBbHNNbW9oMGVzNVRFL1Nqc0FT?=
 =?utf-8?B?bWRPUW5YUlF2ejNXUTR4RkRtNkhmZWkwZjgyd0M0QzI2ZllRMzl0cWZ5d3F3?=
 =?utf-8?B?aUkzcHpzaVFDUFV4Vjl2bEZadWFQZjBaWHJPR00vbGkrd1JjdnM4cGhXTlhv?=
 =?utf-8?B?VHlNRyt5SFZEMkF6bUxIeTJZaDZXSTh5amgyWDd5c3d2WVhuNzhRdWZKZms5?=
 =?utf-8?B?QWU3Vng1V29KeVppVU1EL0Y2VUMzU0paUnFWc0JmVlJoQ0ZKZ3hoVTVQd1JO?=
 =?utf-8?Q?o1RQpMJTybBMsPQRKqwciUUO+qzt5B0n21?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9306b77d-bb3d-4d78-6b52-08d8b96fc0fd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 16:08:10.4651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +DORVvYW44LBhpO4BwCwaqlCaUeCwHxlfoRfdEwncdoe/F5lM4cef/QuWAAZMwDO2zEODBEZZCog06YhwPDBMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5445
X-OriginatorOrg: citrix.com

On Tue, Jan 12, 2021 at 07:12:40PM +0100, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> writable definition of errno on NetBSD.
> 
> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

