Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB93042F430
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 15:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210604.367532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNYm-0006te-8z; Fri, 15 Oct 2021 13:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210604.367532; Fri, 15 Oct 2021 13:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbNYm-0006rB-4o; Fri, 15 Oct 2021 13:47:44 +0000
Received: by outflank-mailman (input) for mailman id 210604;
 Fri, 15 Oct 2021 13:47:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UM5E=PD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mbNYj-0006r5-W6
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 13:47:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49a81ca9-b578-45d0-9a87-d7fbd490eadd;
 Fri, 15 Oct 2021 13:47:40 +0000 (UTC)
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
X-Inumbo-ID: 49a81ca9-b578-45d0-9a87-d7fbd490eadd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634305660;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=rxHefHo66IXw+lNQvqOV3aGfWd14F0ppwhcLcMyhPDQ=;
  b=WCPaRzBdhunlSMqud4G4Q7LDXtk06OB5IvIq+iQE2yOq4vt7SYfkVLoA
   h/vB4PS+Oa1x9568orGMg7XhkGSEOoIFk0XlFumooXA2bkERpMbshSPW7
   qYcI2ZR8+EmznUbe1MVC+ixk6gNQ9BKUJeTsN4uW8UbVEUzxXGefcp0f4
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: NL/KQgug7lSuMdzjx9ahq1l/oZQ4CVsWWnOd+umI9mOwcSeX36n6LRfHCCvteBZFMdx1LCYng/
 CrCdJ0+Kcp9mgcP1zhMfkFpuP5Ilrim4Z8s1RDYPDO9v/dtL88rlGxmQqF8uIooXgtNT8bgsJ+
 LnogGEhPCHdhrU8GzOV591FQp/8wkEecASnz2wyHGmsvlF/Zoa4dLm0w3M1xDe5DkeEkPvJ0zW
 LAg12fsnOkoKlE0/USs9ewp9Pa7T99XjEy1B5286wPUavw2/ku4sTeqaciAPTPxdz+d0W0AJQy
 sMizc8aVr6IqrRNRSQUEl44F
X-SBRS: 5.1
X-MesageID: 55291026
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WRdGZq/ZOjepbniI6j+1DrUDkHiTJUtcMsCJ2f8bNWPcYEJGY0x3m
 msfDW3UPfiIazamc9tyPYnjoUpT75bSn9ZhHgNspSA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhGGeIdA970Ug6wrZg39Yx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhfk
 OwWsZOwYz0UHbLpxeQiCkgFDwdxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcFgW1h35gUQ54yY
 eI+VhB+QQXLZSduP1YwBZQQhdWipSDwJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKH73ati+nnjS79HoUIG9WQ6fpCkFCVgGsJB3U+cl+2ouKwjEKkbPtZJ
 1YJ4SolraU090uDQ8H0Wluzp3vslgYVRt54A+A8rgaXxcL8+B2FD2IJSjpAbt0Ot8IsQzEuk
 FiTkLvBBzZirbmUQnK17aqPoHW5Pi19BUUPfzMeRA0JpfzqupgujwnnR8xmVqWyi7XdCTz2h
 jyHsiU6r7ESltIQkbW2+0jdhDChrYSPSRQ6ji3tV2K46kVCZYiqZ6Sh812d5vFFRK6YUVupr
 HUCg9KZ7u0FEdeKjiPlfQkWNOj3vbDfamSa2AMxWcl6n9iwx5K9Va4I2Wp6K0dDCPsnZhq0Y
 HCK6F5NwpAGaRNGcpRLS462Ds0ry43pGtLkSu3YY7JyX3RhSOOU1HoxPRDIjggBhGBpyPtlY
 c7KLq5AGF5DUfw/pAdaUdvxxlPCKsoW/mjUWYzghyqu1b6TdRZ5op9UbQPQMIjVAE6CyTg5E
 uqz1ePWlH2zs8WkO0E7FLL/y3hRcBDX4ris+qRqmhareFYOJY3YI6a5LUkdU4Jkhb9JsezD4
 2uwXERVoHKm2yabc17QMS06OOmxNXqakZ7dFXdxVbpP8yN7CbtDEY9FL8dnFVXZ3L0LIQFIo
 wktJJzbX6UnpsXv8DUBd5jtxLGOhzzw7T9iyxGNOWBlF7Y5HlSh0oa9ImPHqXlfZgLq5JBWi
 +DxiWvmrW8rGl0K4DD+M6n0kTtcfBE1xYpPYqc/CoINJRu2qdM0dnWZYz1eC5hkFCgvDwCyj
 m6+KRwZufPMs8ky9tzIjrqDtICnD611GU8yIoURxe/e2fDy8jXxzIlefvyPeDyBBmr49L/7P
 bdezu3mMe1Bl1FP6tIuH7FuxKM4xt3uu74FkVg0QCSVNwymWuF6P32L/chTrakRlLVXjhS7B
 xCU8d5ANLTXZM68SAwNJBAoZ/io3O0PnmWA9uw8JUj3vXcl/LeOXUhIEQOLjShRcOl8PI8/m
 L9zs88K8Q2vzBEtN4/e3CxT8m2NKF0GUrkm6c5GUNO61FJzxwgbM5LGCyLw7JWeUPl2MxEnc
 m2Oma7Pp7VA3U6eIXA9ImfAgLhGjpMUtREUkFJbfwaVmsDIj+Mc1QFK9WhlVRxcyxhK3r4hO
 mVvMEEpd6yC8y0x2ZpGVmGoXQpAGAeY6gr6zF5QzD/VSEyhV2rsKmwhOLnSoBBFojwEJjULr
 quFzGvFUCrxeJCj1yQ/bkdptvj/QIEj7QbFgs2mQ5yIEpRSjeAJWUNyib7kcyfaPP4=
IronPort-HdrOrdr: A9a23:WgCZ36qoTIlLLrKr6SVK+wEaV5u4L9V00zEX/kB9WHVpm5Oj+f
 xGzc516farslossREb+expOMG7MBXhHLpOkPQs1NCZLXXbUQqTXftfBO7ZogEIdBeOk9K1uZ
 0QF5SWTeeAcmSS7vyKkDVQcexQuOVvmZrA7Yy1ogYPPGMaGJ2IrT0JcTpzencGNTWubqBJba
 Z0iPA3wAZJLh8sH7qG7zQ+LqT+juyOsKijTQ8NBhYh5gXLpTS06ITiGxzd+hsFSTtAzZor7G
 CAymXCl+uemsD+7iWZ+37Y7pxQltek4txfBPaUgsxQDjn3kA6naKloRrXHljEop+OE7kosjb
 D30lgdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdunfnqdyRfkNwN+NxwaZiNjfJ4Uspu99xlI
 hR2XiCipZRBRTc2Azg+tnhTXhR5wmJiEtntdRWo21UUIMYZrMUh5cY5llpHJAJGz+/wJw7Ed
 NpENrX6J9tABOnhkjizyxSKeGXLzAO9k/seDlEhiXV6UkWoJlB9Tpb+CRF9U1wsq7USPF/lq
 z52+pT5ehzpmJ/V9MLOA47e7rDNoX6e2OEDIujGyWUKEg5AQO4l3fW2sR+2Aj4Qu1E8HMN8K
 6xJm+w81RCI37TNQ==
X-IronPort-AV: E=Sophos;i="5.85,375,1624334400"; 
   d="scan'208";a="55291026"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXaT/VwYAR1RVNe+0MbAb5smi3GMw1VI5rYI7DhREvpvRVVNcEIfhswQLhFgyN198bm7CPEBRdW41FOMWtBvBDEQVTDBLKvcY7pItCqilqdK5h3rTxRy2mFtkHWaRP628fG6YSu+PP029gMGqYk4vaOBJnsKoTxjjfCvzsCiAmnyz/GdM/rr3JtRhvbZAAtv0YTJfpSpFCL/RGEzMYAUEZNNj5Aa2rzEG92HsjCjOblSXXPQZDhVSSLOex2ollWQ0c9VaoiIz5bEKW2PN/NdcSETLUFcGDdzfdwHgUinGnGnbi8OhI+GgL83++SwG02+epN9BnPJN2ghaFADxiB5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aV5AwARp94NX6IihHSUjnTV9/aEWOTrRgdUCmtrUkHE=;
 b=d+DGmKkehXOE0NdN0qKbuAtSUjwsbS1l1oLF3fK1iyaVffO3ax/vDqYM1gYRzcQfBdMJNXcbyxgFpmY3YzfnNqsaCDlP6ITR1HdpkSCnCF5/PgLT88XAEJH8PR5ey/Q32hM7hVBiShUFmpEoC6x/vWa7HjU0xZsv2sZAHR9iNQLUb2HjNcuoye1r6g7Qco0OUJKmciaZMdGON+WfceHODZ49WEWKpaYCg9aMaZoHA2iAyt8q+rQLNaxEkryE0ntdosiT+NbG6Z0WsSk2twr6Ly0cSaTxAOiTOj8KcGr20X0fWZMjBLbXG2+JNbbY8Oh0ChdjUD7GTcs/tIB+SDs+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aV5AwARp94NX6IihHSUjnTV9/aEWOTrRgdUCmtrUkHE=;
 b=iA6CXObcbfvAtdrXEeU3TmIrmb9SzfdduqPScypP+XcGS2lW+y67sIuyeesAsLbE3I1LotHs9Kewbjn1zhfhJhz+pzFIFIU+LECQdwOh2tKUO1C8WrpmLd24B983nPQvIB1D3w7TenhUzrEA5KoxsHhCIXAHOmp8XSHRALbnUgc=
Date: Fri, 15 Oct 2021 15:47:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Jan Beulich <jbeulich@suse.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Rahul
 Singh" <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/3] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Message-ID: <YWmGbzPdCxmwfdIX@MacBook-Air-de-Roger.local>
References: <cover.1634221830.git.bertrand.marquis@arm.com>
 <396b08e2598cf0338e0c7f4ad3cd5cb66db89224.1634221830.git.bertrand.marquis@arm.com>
 <YWk8uP/YuSee1MfG@MacBook-Air-de-Roger.local>
 <CD9B29B0-31FD-4E09-93E3-7124C724BC23@arm.com>
 <1c298c02-5791-8935-f996-516da2409f24@suse.com>
 <BFC005A8-4C72-41C5-93F4-98BB9CBAB198@arm.com>
 <cd81cc31-617c-c750-01f4-b02bcb9e3a9e@suse.com>
 <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B57498FA-F205-4DC1-ACE0-414558400293@arm.com>
X-ClientProxiedBy: LO4P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::9) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d349c140-cf54-4f48-ccfb-08d98fe25689
X-MS-TrafficTypeDiagnostic: DM6PR03MB4474:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4474E10B394AA9E30BE31B2A8FB99@DM6PR03MB4474.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+GY7FOlyq8qT88gJHu+vlalrIihKOydC3WgIw0cS8CAV8baX/+IEzrwaTGkqtIyDPz0yhXn0Tcx3ZxVOMPb/uib+EPqIZbShNLjxWIzOA1OuxvUKEtbNUIOBxDncgJDG1kiy01GOc0xQL2+1dY8doCNIV+b20etTaFUXbNyDh5s+JgrP0toAUOUQt5yyf1myr0xwK/kbaT7Ttivs+n7XAYoHqVSjb/yfVPlh/HwBqm6XxbXS8ENAIKwMJekLL+BiNl8e//VQwH4iSbEB7UvH5tneDgEy2F81SUM1koA4nPXZ1oTx1EzsW/V4DMu3xBSQU9x5UrDHF+KU1P1qltyZw62S57XhppuAt2+1a1SygCl++EUKGoiQkxz+GSoCvgIbeGreOScS8GA8pHg20zIliXKd3Nk6pC/+QDzuKj7o4EY9KdRqGGOtr9Q5pcqPnSlyiEhQE1juV+wXa3MdYuff2cKB2+sWgGFw1ECSWnxAyEMlA/lxXqMvVKgzlplrr03XLxiy9JsLgyhAWfEMkQF5XfeKhRMD0ycHT7zagxXOz2/XoU26vtwuYjZ+hjyFOyfKCW8+vTLanlk7xbR4iMmLHgfoQViDTzb5vwuUqCvyZaSegd8N2vNLBedODQgHtKgd/eeJtMIdGe3TegsmB8xvA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(6916009)(316002)(66476007)(66556008)(26005)(9686003)(6496006)(53546011)(186003)(85182001)(8936002)(66946007)(38100700002)(83380400001)(2906002)(82960400001)(54906003)(8676002)(86362001)(6486002)(4326008)(5660300002)(7416002)(508600001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmZCQXJTR2ltbGlFOEdwZTlQOUNBNWVrUm1BbHp4bm85M1dSRHFCT2pIQVdW?=
 =?utf-8?B?RENvcStZRnlMd3dlek84cFJ1NnF0SDd3QjVheHVjME0vS0NGbW9uNEFCWXND?=
 =?utf-8?B?bFhrWldZRDk1S2F4R1hMOWpZRmo2RUxHR0tSdFFvUE1udTk5QUo1clJoOUxQ?=
 =?utf-8?B?SURRaWFxeDVRajN4aFA0QjdnQUtCSWxneE05dEZBZWxubitHT3lRcmg1YS9E?=
 =?utf-8?B?cS9oZjZMdEZ6TkRGeVlQQ0NtOWlqeTFuZjFEZy82UWlML3pXcW9XYTJERW9u?=
 =?utf-8?B?bkpvK2NRL1VuZHZUNlJEOExuejFzREFnTlpicWlPVWNtSDZKeHNDOFR5Rytu?=
 =?utf-8?B?aFQ2azZDWExQZXBtVXlyVTJwcGFBVXNOZzlsRnB2UTh3RDdMbkQyRXZUYk1u?=
 =?utf-8?B?YXZXeVFkdjJqZ1AxQ1V1VzMvTmcwalZKMlhTTXpHUncvcWNsVVloOTRDcCtP?=
 =?utf-8?B?d0ptM0Jld1ZQNlJRaDRKRHVUUTYyaXlMNnhJZDdKc3JkaGRUZVZHN2VYQ0dh?=
 =?utf-8?B?ZnNlcW9ackxpZ3lkMGQ3WlJWZmlwUDlDWk0zV2hxdll2MENsS0QxVXZabHBL?=
 =?utf-8?B?b3hkbW01ZWppV3NuNVdLT1AwMHNkRmRqL05LNHhDdTJFamJFRUV2U29CVkF2?=
 =?utf-8?B?MnB2SnNvNDFJUEJkSHpKWGs5dEF6cjFCU0hFYzFYSVUvVW5ZeEhhWjc0dTk1?=
 =?utf-8?B?M3lGSnI1OG5KdnhWRllOdjRZanlyaUdIY0loQjEzWERVUHNOT1RyK2hzaDR3?=
 =?utf-8?B?cEl1MW9zK2lsdW9RZlFETjBwSmdocENNUEc3OXExQWp5OFR1WXZrRnFYdDRr?=
 =?utf-8?B?WjlTOWdHMTd1SFlzYlMyTUZuUlV2YUZ3RGNXRURqamp0clBUNlpSZlpnNTdB?=
 =?utf-8?B?R0dRUjRNV3F2S0dqZ0MwVnNyY0RWK1FyWW9ZS1dsc0tYdjRPRGx2RTl5SFNj?=
 =?utf-8?B?c25vUXVNalVkWkl2blVVRGhsSmVTamZNaDhpTlFtTUFkVVAwQ2tIdWc5Q3V6?=
 =?utf-8?B?RkJYZ0ZYaUttaTF6Y0lDbUZKbURtQ0d0eFAxU2psSk1mbklVN2xzVjVBbEVp?=
 =?utf-8?B?NlR3VFEvam9JQTVHbjFPelJrRy9ZQUFIOGIzRDdUZUI3RkFqTDFXWlg1VzU5?=
 =?utf-8?B?NnovL05nZ1crSUxmaUdGQ3F0WEQ3SUpVVDVMcDM2MzJ2VkVCR1FCZWZmYm9u?=
 =?utf-8?B?ZEpkMTBlOWhMbFUxWFNiN25GMHBLNWlTTitYTG1kREw0MHZOcUt2QVNKcUZ6?=
 =?utf-8?B?c2ZUWXNpaEgvNlR3N2dmOHJFNTFuWE5aVTlNNjB1WVRJVmdVRkt0dTd6ZkVL?=
 =?utf-8?B?MjhGcTQ4YXhLeEc2d1VtSnR6Sm04RHg3aUVTU2FQUU05cFR0b0lJblNTZ2Y1?=
 =?utf-8?B?RGw1VVR0MWNPd0JyMFZPQk52aElOT2Zydmg0MVNqaWxlTlg5d212eFdkOGpK?=
 =?utf-8?B?K21iTVQ0cmFFN3hWYW5PaHYxRHh6WTNxUUp6KzlRTXBLWnZDZ1dzTTFFc0hi?=
 =?utf-8?B?WFptRHh6dEViYmFHMHczczk4alhOYUw4M0RtZ25QSXY5bGp4c1JFYU1FOThn?=
 =?utf-8?B?Wlg5VEcxNzZxck4vYW50Z3BqZmpqbHNyc2RMSkd6Znh1bHVmeVUyV3M1NTZ3?=
 =?utf-8?B?T2VPNnJnNzFEbUVlM204b3FsUXU0d0pHcE1KQktzZVl5b0dHeUN0QmtuSG9m?=
 =?utf-8?B?aHBvMnlvbXFpOTFlT01nWkpKbkVxTE1IMGYyVTRPR1oxd0JtdU5uOVROaHRx?=
 =?utf-8?Q?O3B8v2qg9TX9vt9lnZVdeH3nGUPEbppKtsj8F7h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d349c140-cf54-4f48-ccfb-08d98fe25689
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 13:47:33.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d35ZPVcj2sU9tG4b0dpcMK0BER7C0qcJa2znAtTCby9O8ZZadHsbkdbVaOA8gAUR3iKJenNln1szEkAuhG4iFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4474
X-OriginatorOrg: citrix.com

On Fri, Oct 15, 2021 at 10:48:41AM +0000, Bertrand Marquis wrote:
> Hi Jan,
> 
> > On 15 Oct 2021, at 11:41, Jan Beulich <jbeulich@suse.com> wrote:
> > 
> > On 15.10.2021 12:33, Bertrand Marquis wrote:
> >>> On 15 Oct 2021, at 11:24, Jan Beulich <jbeulich@suse.com> wrote:
> >>> On 15.10.2021 11:52, Bertrand Marquis wrote:
> >>>>> On 15 Oct 2021, at 09:32, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>> On Thu, Oct 14, 2021 at 03:49:50PM +0100, Bertrand Marquis wrote:
> >>>>>> @@ -752,6 +752,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
> >>>>>> 
> >>>>>>   check_pdev(pdev);
> >>>>>> 
> >>>>>> +#ifdef CONFIG_ARM
> >>>>>> +    /*
> >>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
> >>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
> >>>>>> +     */
> >>>>>> +    ret = vpci_add_handlers(pdev);
> >>>>>> +    if ( ret )
> >>>>>> +    {
> >>>>>> +        printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> >>>>>> +        goto out;
> >>>>>> +    }
> >>>>>> +#endif
> >>>>> 
> >>>>> I think vpci_add_handlers should be called after checking that
> >>>>> pdev->domain is != NULL, so I would move this chunk a bit below.
> >>>> 
> >>>> On arm this would prevent the dom0less use case or to have the PCI
> >>>> bus enumerated from an other domain.
> >>>> @oleksandr: can you comment on this one, you might have a better
> >>>> answer than me on this ?
> >>> 
> >>> Well, without Xen doing the enumeration, some other entity would need
> >>> to do so, including the reporting to Xen. Obviously without a Dom0 it
> >>> would be ambiguous which domain to assign the device to; perhaps it
> >>> should be the caller in this case? That would make that caller domain
> >>> a pseudo-hwdom though, as far as PCI is concerned, which may not be
> >>> desirable according to my (limited) understanding of dom0less.
> >> 
> >> This is not really related to this patch but the plan is the following:
> >> - enumeration would have to be done by the firmware or boot loader before
> >> - xen will have some code to detect PCI devices
> >> - dom0less can be used to assign PCI devices to guest
> >> 
> >> Anyway does not change the fact that this must be called when domain is
> >> not NULL and I will fix that.
> > 
> > Since we now all seem to agree that the NULL would have been a problem,
> > may I ask in how far any of this has actually been tested?
> 
> With the whole serie currently on gitlab we have extensively tested passing
> through PCI devices on Arm in several configuration (number of device, MSI,
> MSI-X) and check that PCI was still functional on x86.
> 
> With the patches pushed to Xen right now it was checked that:
> - xen compiles properly on arm32, arm64 and x86
> - xen compiles properly with VPCI activated (using a patch) on arm32 and arm64
> - xen on x86 is functionnal (using basic test on QEMU)
> - xen on arm64 is functionnal (with some extensive tests on different targets)

I thinks it's unlikely, but since I haven't checked myself, could you
see if the vpci user-space test harness (tools/tests/vpci) still
builds and functions properly?

Thanks, Roger.

