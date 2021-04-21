Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3D83669E5
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:27:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114418.218052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB0Y-0006w7-7a; Wed, 21 Apr 2021 11:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114418.218052; Wed, 21 Apr 2021 11:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZB0Y-0006vi-4W; Wed, 21 Apr 2021 11:27:02 +0000
Received: by outflank-mailman (input) for mailman id 114418;
 Wed, 21 Apr 2021 11:27:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZB0W-0006vd-CH
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:27:00 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1cf66c6-5ce8-47cb-95f9-7bc232ef4d3c;
 Wed, 21 Apr 2021 11:26:59 +0000 (UTC)
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
X-Inumbo-ID: c1cf66c6-5ce8-47cb-95f9-7bc232ef4d3c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619004418;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=orrdjUkLg3UeVFB4RobFMNiWAQR1fBympfPY75MVj34=;
  b=VpDDNgDXb3pz0MmAihr3r9JTdr9yd0AcD3/Egsl+6A4QZ/ePV2r1LFl2
   gPmeFpCW215mfe87IHsvIsNMVqKcfBXtIFLKErf4h3cx/vor6eDa4YYq3
   r8CRNtCRmDvkjZdeF4k7HmBb98+K7fi6HoddrBoWRbUUoZxJSM+6xFZ/P
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jMg5UdUImqcflGpiBpva7Y94D4JFgQC9vpTxJTm7es/2rQg+8g5XcgYWlpp2+Q/THoksqNoFIs
 1dGVV+/KsHBMQy19vPJSYz0FzqukHOo17ITQXOCred/8vsWCvGd7FVtIxrrvqMezjrHaSta7lt
 kTjzpgrEkX8fnJWYI0cSPaUksnfBDK22E+yVxjzj0CpfqJnXmx13hhl9seyFH9WA5m4nF3ffGv
 lhJnOTqpu1TtZTKU7g37EVJpgpC8lgZ/uDlv6M/F3bFmj/lES09m+JcqquX8j6Z4C4YmQMh7K2
 wyo=
X-SBRS: 5.2
X-MesageID: 41902367
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sOuXR6E6Lffm/PrVpLqFe5TXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7L0/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeOJwTXzcQY76
 tpdsFFZOHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLT1CQYsI1XYeNi+wFEpqSA5aQbc4Do
 Ob/MpbpzymEE5nE/iTLH8DQuTFupn3hIvrCCR2fSIPxSuvqXeT6LD8GwWFxRt2aVJy6Jor7G
 StqX2d2oyNqPe+oyWss1P7z5MTo9f5z8sGOcrksLloFhzJqiKFILtsQKeDujddmpDe1H8PnM
 PXqxkte+RfgkmhBl2dmhfm1wn+3DtG0RaLojX08BiTw72KeBsAB8VMno5feBfCgnBQx+1U66
 5Xw3mf86NeEBKoplWN2/HzSxpomkCoyEBS6NI7sno3a/p4VJZh6aYb/E9TDa4aGjP75I0NAI
 BVfb/hzccTXlWAY3/DuG5zhPSqQ3QoBx+DBnMPo8qPzlFt7TxE5npd4PZasmYL9Zo7RZUBz+
 PYMp5wnLULasMNd6pyCMoIXMPfMB2DfTv8dEapZXj3HqAOPHzA77Tt5q8u2e2scJsUiLMvhZ
 XoSjpjxC4PUnOrLffL8IxA8xjLTmn4dy/q0Nti659wvaC5bKb3MBeEVEsln6Kb0rQiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbf9YSvvo9RlKSsuPGIoDnrYXgAbTuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUe36FQD27wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9og/fE
 50JqLbgrq2zFPGuVrg3iFMAF5wH0xV6LLvXzdhvgkRKX75dr4FppG5dX1N2mCEYjtyVdnfHg
 Iah1kfw9P4E7WggQQZT/63OGOTiHUe4FiQSY0Hp6GF7cD5PrUiDpgnX6R1PR7RFwN8nDtrrG
 srUn5GembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8XmHqdoXXXsdVT62WcuxiQIjLgAkwW
 FZwus6uv6tiDyvIWwwjKAdPEdXYGqaOr5AET+IfZ5ZgLztZQF2Q1qbnDDysWBBRkPas2Epwk
 DxJyydfv/GRmBQvX1VyY7G2lJ5fGf1RTM6VllK9alGUUjWsHd61uGGIpep22yKc10Y36U2Kz
 feewYfJQto2vG63BOYgyy5CH0j35kiV9atSogLQvX24DeAOYeInaYJE7to555jLsnpqfJOfu
 SFeQOZRQmIfd8B6kiwnDICNyZ1onV/zq+t9x3h8WSi3HkwRdDVO09rQrkHI9eaq0joLsz4pK
 lRvJYQh6+XNG60V/utjYfwRBRHIgnIoWG3Q/ozwKok9Z4ahf9WJd3jTTDM1Ht7xx0wI8f/qV
 MGTM1AkcX8E74qW/ZXRjlQ8VUonumeNUcHsgT5BeklYFEm5kWrSO+h0v7tqbA1BFeGqxa1EV
 6D8zdF9/OtZVrI6ZcqT4YxK39Rck4y9TBL+/6DbZTZDEGPe/tY9FS3dl+7f7k1ctnJJZwg6j
 J76cqPhemZam7R3x3RpyJyJuZ2yFmcKPnCST6kKKpv6Ny1OVOFn6us7oqStV7MOESGQnVdo5
 ZEe0wWZtlEkR84guQMo3GPdpA=
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41902367"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DUbGH8Z6A5NrcFASkPGFWj5pgr82Nc0cpyJwO2uDwbG5Xp8z5Xe8UZkoQPkf1S7Am24oH30FIRqSxxcMRSrwpsYQL2pXgr9jqRzXrQ/GlCy2iNayUzbqod+tGAFR64/qAk/Ah2harJKXN5C62I2SjVzh995JGE+JTKknDZFgL6yAX3xkJ0EqxFNL8cutnGDjJDXGh+zGdoSsHI7mHl9UgpjDqp7yqdgGYwnsfq1b82b3PGm4/PU0A5fGMWdnofqxjnynYeE5jKSLTyLRhpZdW9fecUZh7us7FD9SxwYphDEH/qpB5zae0PUypbHEUGCU54PGyqBuSnga920XrJBWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjA3XpiWFUlWc655WKA0W69uVPRIRbj68f3OjbzNZrQ=;
 b=dneIymlwv8/f/7C9la0j92tOoh5e7xNfykwP+Q1jFeS/sRswEq/U0wvTBCrPF/BRIwHwqMH6/VfqNLVgxoQH4VUhKUGSYcNXxc852NszF0DVOiubDy4udA6Wtq13IPI5PlBVFyYtk9EJkqSCmxMy3xfH+4P4WMR0dsaVodzbcgRJiU5oVBUDbeOrcACjlvASMCnPYCvmvrecQqhyKp1WVJElBk4sbcVUCE9tb+YL7ML4wUXNoYSlKO0dMyWPlMJiLAYhy55fcc3wicUcQ+CLYGGMW3X52K3tEmILNhJ8vSju6zPS1Z9JQnoP9hRDS41OAe9D/2M/T/rZgzgnig9K6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjA3XpiWFUlWc655WKA0W69uVPRIRbj68f3OjbzNZrQ=;
 b=KdOSfQhCxdlCd6zDw585+sPewMrz39qjX4j/bVbwLfRIunmiIm6aBZQl4G71gGYVm8widsLVIM8pEfhBYoTNxGBxe+DEsf4T3J5i7PxrBREzQpw0TN51cl9VNd8+bOMARO9vpwGrrp3qhlqbUCHLH4HqAupaQnbHPGTGFdmCzV4=
Date: Wed, 21 Apr 2021 13:26:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: Re: [PATCH v2 15/21] libs/guest: obtain a compatible cpu policy from
 two input ones
Message-ID: <YIAL+bTKvPsAfM2a@Air-de-Roger>
References: <20210413140140.73690-1-roger.pau@citrix.com>
 <20210413140140.73690-16-roger.pau@citrix.com>
 <20210421102239.tlesqrxsplk5vthm@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210421102239.tlesqrxsplk5vthm@liuwe-devbox-debian-v2>
X-ClientProxiedBy: MR2P264CA0125.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80cda1e2-9643-4e67-a0d1-08d904b85eb3
X-MS-TrafficTypeDiagnostic: DM5PR03MB3065:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3065EEF4D24D6EECA380D67B8F479@DM5PR03MB3065.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EyMf4UQVNwQ5ucSHQ97qU8VjT0aJHF5+aLABrXFNbXG7RHkI4i3Gcm02raOK+EoCe6P10ehyS70Um43jIHBa1y4CRGJN/E2JTX3o8QAqRL8cx02VhR97KWOJzBYfIHkRwYKTw+5Da5L0P6iQBuX/5Fkq288qtWXEn4C9GjfM5zNwD0gK1yE1nmkummivzyl2PxU1+nmXjah9FgJroqdc/XB0Jspwx0a5Oa2zxVslmeWXjuZc+F6eQob0msE823yhXmnyB76TRyjwrF1DIUvUQ/tmbplvKWCYhyKEaVw8K5Z0JmsbReRAWgKb5tbCAZ5lWkpoOnsPQXCAAnS8S1L0KX910f9GN1fbuNZN/B3R7eDYaHxkpTDqeU8t1D7aybChIKQ+oFojBmjtyjp+335dqzp9FZwP1vEPPOkRvmjfubIsMcdFEFb4s4Nm5JCxuJpsyfGwRj4uRTHnkAPHMWf5iegQVFh24y74TwTMxGLUKWNTIR4irYsK8g6ck/nScoBFNWdkTfuXNtPaTqIjV9HU9g2b7h7UJfCOlUxIP40XQ9cYgr1JAjnQ/e9zgEJgPFZwh9cgJt3AGzk0Mk0zBAIYISk4YcHHIFIEzwu1CMHwY7Zc0Ya9j31qYLm+npfU+GMwsEtYTcUH6iTIlh1T1TYgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(136003)(396003)(366004)(346002)(16526019)(478600001)(66476007)(316002)(26005)(66946007)(33716001)(6486002)(6916009)(85182001)(86362001)(2906002)(4326008)(6666004)(66556008)(107886003)(8676002)(5660300002)(9686003)(6496006)(8936002)(54906003)(83380400001)(186003)(956004)(38100700002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z2dYZTIvUDBPQmUxd1VXM1FGNm5iMjB4QTFqcTlNSTN0elh2V3NibngwTmxX?=
 =?utf-8?B?bnp0Wlo1TFZBaTY1VXpXMHBmNTdVbEJqOG1QYjZxRnc3QW54TGRHV3ZIWjJN?=
 =?utf-8?B?MVBOSlJ1WDN5RVdpZEFtQVZPS013VXNvYkFiQnhMR0hUbmdxRmkzaDl1Qnlp?=
 =?utf-8?B?Zmg0VXp5dTlUSDB6dkdwblZxZkozVW5jUGdVd1pWOHhEVExOMURqRDJLRnJN?=
 =?utf-8?B?eS9uSHNtZ0NWMzBSKzBBVSsrTndSMEhTUjZKcjhZbVNEY2dVQWFlY1dhckV1?=
 =?utf-8?B?bERjbkJQODQzdXBmSi9jNS9KU3NqLzhZVXZHbGo0cTlKc2N5U3FsL3dOd3c2?=
 =?utf-8?B?bzZrMllZc3Zvd2RXZ0M0T0s1M1JNdzVjTjRLRy82UG5yNVFPV1I5THNtRXY2?=
 =?utf-8?B?Z1lmWElIRjBoYklqdVYzbEhQTzJVbUM2Vk5NSmc1Q3k1bHl1cXBtYTQwTVA2?=
 =?utf-8?B?VTFpdkR4cFVCdS9Ub0Y5c0xqVUcxcW9Rd0lxYUtVNGJmSVVBLzQzZFVXRkd4?=
 =?utf-8?B?NDdTUkpHVGRDZmovaWNLdGxuSlJSSkdYSUNCUm40ZzhmbFczdVdyYmNDZDBm?=
 =?utf-8?B?blNzNUhCeDk3N0lXVjhNYkwyUlJZVndXZldDbHpJYzA3S2JCSkFSdk91eXA5?=
 =?utf-8?B?WGVxK1BhOVRKR3EzdlR4VVk1OTNpc3hIVEt0YXZLaVpqekQwcktFcXM3OEJ0?=
 =?utf-8?B?UnE3ZkFEdHpGbFB6bENJR2N4enk1RWswa3IyRGhHL1h1N0d5TVZ0UFV6VTc3?=
 =?utf-8?B?TnVsZXBpZHRIQlF3RmhiWElxbkozMldZYWlrUGVzR2tPTFhMVHZtRlRWUC9N?=
 =?utf-8?B?amNoY3ArVEY2ZUY0VXJJSlBBM3RidDVqWHpzVXJHcVNXZGlHNGlKMCtzd2ky?=
 =?utf-8?B?WndheE1kalkzeG1yeFNscnpPM21uNG9CYUtqcDd5Y2lPcGVYK0ZaaU9pZlNI?=
 =?utf-8?B?YWhkV3F5Q3ZsbXJIbFM1bjNEenRWOWJzd05NQnUrb2czWm5LeHVxTlU4bHM3?=
 =?utf-8?B?RDVVUDhmSXNQS2QvWTJLOGlmNktkMGtJNDFTRGdlcHlONWhYVEhxdzg0K29y?=
 =?utf-8?B?ODkzUHc1czhnSFBHSXZ3QVpaYUp4dUlVdHpqSGUxdnFhV2lTNmdEbE9hYTBS?=
 =?utf-8?B?MHpqcHhubVlVTWlQeHpzRHBKMjlab3hTQ2QrbFZvdS8xUDArbWFPU09RSldQ?=
 =?utf-8?B?YXprNHgzWjF5YkNLWHpSMnNmS2lFd3Rhb2I0YXNCb3VGNzBZSTdxbDdITEJ1?=
 =?utf-8?B?RnczSFdUYVptaXROY0VlQXBhbjFPNStiZ2xaTkM5clhROUtpWDVGN05oYTQ4?=
 =?utf-8?B?VTdEdHBySDJFQTJlNGVUdGlGQko4LzZzMnVaa0QxRVo3eFdRV2hTM1lSS21v?=
 =?utf-8?B?SFNDMG1DbFBrZGlqMWxrNTdOMXE1T2pJRmVLUVFzbHorcmVVdFI4RVRhOUR5?=
 =?utf-8?B?ZCtTVmFLT3oyOTlhRCt0WHNocjVsd0VNNWVyT2ZLWmZ4dG9Gb2RFUmpFZnho?=
 =?utf-8?B?cEdVYmVTRnVvTXpxZnp3UnRjTHV0c0hud3B2azREMUxodk9zMVp2b0FRZDE4?=
 =?utf-8?B?ZXhyL2s5SU0xVHhSQTFnTEl4aFZDcFFqbFZFME1NSmdGQm0wVGpFM1UzOG5N?=
 =?utf-8?B?MVhjZU1iMVVHNEFvRFRybGovTG9nTHFqanRHTmg4YVBHdVhDZjdRYktiMDU3?=
 =?utf-8?B?Mnk0QTVzQjhRUnNHNmhyc2ppcWxnRlh3SmVlMlo3R0cvRlEzUmVrSTBZM3Ez?=
 =?utf-8?Q?YS8QElIuZEi+XdJmFyDfj0vmXepahG9723zYwNK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cda1e2-9643-4e67-a0d1-08d904b85eb3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 11:26:56.0941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4d8k+FJ95l0ymdMlbV6PSOtmQwDz5LxhTvfxvRdmlLiLbRa5ZPuF2Qd9/NI70387Aobhzu2P6VTNauVWh5fcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3065
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 10:22:39AM +0000, Wei Liu wrote:
> On Tue, Apr 13, 2021 at 04:01:33PM +0200, Roger Pau Monne wrote:
> > Introduce a helper to obtain a compatible cpu policy based on two
> > input cpu policies. Currently this is done by and'ing all CPUID leaves
> > and MSR entries, except for MSR_ARCH_CAPABILITIES which has the RSBA
> > bit or'ed.
> > 
> 
> I thought canonical source for compatibility was to be put into the
> hypervisor, thus all this functionality would be in the hypervisor. Am I
> misremembering?

Andrew said something similar on v1, but I'm not able to figure how
this would be used by the hypervisor.

It's my understating that the toolstack will attempt to generate a CPU
policy and forward it to the hypervisor, which will either accept or
reject it based on the capabilities of the system. I'm not sure I see
why we would need to give the hypervisor two policies in order to
generate a resulting compatible one - it should all be done by the
toolstack AFAICT.

If there's a use case for this being in the hypervisor I'm happy to
add it there, but so far I haven't been able to come up with one
myself, and hence I don't see the need to make the code available.

Thanks, Roger.

