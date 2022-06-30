Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 834F456157F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358345.587540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyW-0008Lw-OQ; Thu, 30 Jun 2022 08:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358345.587540; Thu, 30 Jun 2022 08:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyW-0008HR-Jd; Thu, 30 Jun 2022 08:56:36 +0000
Received: by outflank-mailman (input) for mailman id 358345;
 Thu, 30 Jun 2022 08:56:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pyV-0007Q3-AU
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 880a05ab-f852-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:56:30 +0200 (CEST)
Received: from mail-sn1anam02lp2049.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:31 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6699.namprd03.prod.outlook.com (2603:10b6:a03:402::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:56:29 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:29 +0000
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
X-Inumbo-ID: 880a05ab-f852-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579393;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=JROiIcytnT09wIXffk8Xeuw3JUfAkJpdvq4oMXLF/HA=;
  b=GGYY13cWcrcO5IREOgWFjAUS+FI6b4Rs/1eUQVHop8cSYqLvVhEGq/4X
   YDKmVa8gWf8f7yH0bqxOi4fIyqP5bct+/Y0glm5TUWkNyg6/j4ExJrX+7
   Fqfofzwo4pJcG3CUN77m58f1UpyriAjW9ALulLGkAclcGFRTb6KWHAunv
   U=;
X-IronPort-RemoteIP: 104.47.57.49
X-IronPort-MID: 74794303
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:W57PUaB+nr07uBVW/13iw5YqxClBgxIJ4kV8jS/XYbTApD4n1DVSy
 GIYWmiCPq7fZTagc9EiO4+z908BsJ+DzN4yQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgH2eIdA970Ug5w7Bi2tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgqx
 N9G7rqaaDwmL+7lmPowSzZGL3lxaPguFL/veRBTsOS15mieKT7X5awrC0s7e4oF5uxwHGdCs
 +QCLywAZQyCgOTwx6+nTu5rhYIoK8yD0IE34yk8i22GS6t5B8ySK0nJzYYwMDMYnMdBEOyYf
 8MEQTFucA7Bc1tEPVJ/5JcWw7v31yWkK2YwRFS9lJUIyjOQ5hFNyLnsLN+Oc8yXR+wOtxPNz
 o7B1yGjav0AD/SPxDzA/n+yi+vnmSLgRJlUBLC+7uRtglCY2ioUEhJ+fVmxrOS9i0W+c8lCM
 EFS8S0rxYAt8GS7Q9+7WAe3yENopTYZUttUVvY8sQiLw6+MuQKBXDBYH3hGdcAss9IwSXoyz
 FiVktj1BDtp9rqIVXaa8bTSpjS3UcQIEVI/ieY/ZVNty7HeTEsb1Hojkv4L/HaJs+DI
IronPort-HdrOrdr: A9a23:eQzNqq7/Bns5pG7x4wPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKnyXcV2/hrAV7GZmXbUQSTXeVfBOfZowEIXheOj9K1tp
 0QDJSWdueAamSS5PySiGfYLz9j+qj+zEnBv5aj854Hd3AOV0gP1XYbNu7NeXcGOTWuSKBJYq
 a0145inX6NaH4XZsO0Cj0sWPXCncTCkNbDbQQdDxAqxQGShXfwgYSKWySw71M7aXdi0L0i+W
 /Kn0jQ4biiieiyzlv523XI55pbtdP9wp9oBdCKiOISNjLw4zzYLbhJavmnhnQYseuv4FElnJ
 3lpAohBd167zfrcmS8sXLWqnzd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7k16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklXavoJBiKprzPLd
 MeTf01vJ1tABOnhjHizyNSKeWXLzsO9kzseDlAhiSXuwIm7kyRgXFohvD3pU1wha7Ve6M0md
 gsDZ4Y5I2mNvVmC56VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74794303"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSHz5XwDLfM+xRWzdkRp76wM17Quhn3EiswzWIyGE32K7MaPlcn3gII0AUy7Us4FQOlTc2+5vOdUtphq//igiruZ8YXWUgj8ZSMeV2Y18ZMvmZHXZaSi965EfjQnH3F/Q2P2VdFNvAf+VhSaib+hJQZrt34ZaRBfFXYEPLZwc3uFu1XihtaxUgw7sUVug0CAOZ85iOUdOrZzb/8VKZrNaP5VFZF6G2gspEEFmLfs0mtbhC6cxTA7f7SY1+yyOhCp1KS+xWXmPtZFXyn79bYV6qUuLZCVBGiWqy24NtrpsTZxAMruUFztBr9yiRx+8mZorju3ESgP/hKbS9gzaojgoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FloscYbijaSLVpLxOdcT4wyXo161zpQTeRJwtCFDY80=;
 b=c/SHP9RIFXJlgOPgWEc/cjxrrMXPhUx/ChooB05OP3EcXJAru8QhlxAZr4L1YaSOTiwZWmeETqQFKma1iTZAoGK25m3u9efGJkdkZYOpUHjX2xQTLtArrL2mINaCQoXRz/aRGlXZoqesou5rjFrv2mKA6+qFkznMli/9K4g4FHuVMTbXVSM30eMyyFhdz2E+UCG/pf838bA7G7jg1VtUnxcyfZJlZInCmhWzKiuh+uwxAyRX3YveUb7cwk8tKx0r8PY64GnZTU8nRkmKm7eE7hLpMWUmCqJ0ty9bMk69bVLIVCB+RhiJ4qQvXOiZa42aHNQNKY4XtliIB/vAg9FFcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FloscYbijaSLVpLxOdcT4wyXo161zpQTeRJwtCFDY80=;
 b=fuZlxv9fMBjeyh/KIYSmG6b+OA+XYvFVz/rYXS6p2nSo4NKgv4C7LGmZGaLAiw7UFYyroyI5iM5/IjGp95REvLv4CqUSAHUHAmeWzFNiIWWN++jilg3SCDobDfBav8QprKlvMZIMMbL3wDu0uiSC12RXeNx2PKX2Cz0soB/s5jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/6] x86/irq: fix setting irq limits
Date: Thu, 30 Jun 2022 10:54:37 +0200
Message-Id: <20220630085439.83193-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6ac01c8-77ed-428b-f3e2-08da5a766c04
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6699:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m0nbE3sS4ZosGph5t2+YFXN0qJQwWkO/aR85HKeNB+eYkeXVs+AbFspUmbN6xKHj4I+I6P8wRhdnP/xMVWA9t7ltqvIQxLtKAL7rdM9gvs6Q0pjH3XfIfSsHwF55GdPcyLjHM6G/ThkaKryCOxTjhVn2SQyRtnE0NuolJbqSXqccJtWFGIDrB7Vv3bCGU6yT1N37Lo0t4OP6z8nAs6tvL1H+nFoBeHoL6vPOWjqZWtjWi31AJv78qVYxGgnMCeKKyVh1dYM80rILgiFTxDI/B/NgZMDoeuiYaXmH7a+wKOPWYLFZZ9yXByzixDgaufTz7Ucuemn9iouTlJDUkLGY9wVAY/NjfqtuxCdmu0K/uKJIu0VTUKhHAtjhi2mSLrlT3d0zJSWMVL97OhNvNfMMiE9bKqroVpoWSOU4TcdewB+oOy35RRuhc33h002HoIOFUbWOowFfd9s96voRL1oRr69159lMRMTXVjXOhIeLdylBAwbORj4n/ofxgHphkSjUrVlJ6pSAE1DUO7p872tocyC9yNWmnv+/31eK+qvrtsXifipMrkLSp+6RKyzo+sR8PCX6KoSl4sSnC5KGyvpoVZcO7l1iz6FaACNWukNmwEuptjZSUhqhgNkk3tXFSgtgn+x5Z0acCMY3IO/9mwYM+pl5FvdsqoacERXh3v/E5TYxi9Pk67PlJm+Kzj/JWBxXlWLbf47GSlO9UxEVIbBw0xTH42GoAfr/amwoTiud/od+RxlvSqTjwuUUiOQ3JfNT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(186003)(36756003)(316002)(2906002)(6506007)(86362001)(54906003)(41300700001)(2616005)(6666004)(38100700002)(6916009)(66556008)(66476007)(26005)(66946007)(4326008)(5660300002)(8936002)(8676002)(6512007)(1076003)(478600001)(6486002)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NytQcjNkblBqWTRxN2dORGdSTCtMYll3N21ObDRMdFlaVmRYN2xIUWIxRlBF?=
 =?utf-8?B?SlduVTVzYkJsczUzZHZLQXpaeXRlS0FiZjFkR1M2emxwQTYvbXczZ0l3SXZ0?=
 =?utf-8?B?bXRvTDhzbmFZNXVKcmJMdmxjM2xDVnBic1ZOTWI0TmkvbGFyS0syYk45RGNG?=
 =?utf-8?B?b0lWOGxmdk1aY0ZRclJpNDRyL1BLWVJxQitwUzFZSGpqYWhXV3BQWTFiN2c0?=
 =?utf-8?B?bkswN25tN2lLLzVPR1lZY2NzVE56ZzU5NDAvbkdDT3lYaXVCeld3bFZWREl0?=
 =?utf-8?B?YkZ6UzR0WG5PSVVsZUN4WElaQ2JZYXFRVk9Id1V0NGx5Zm9UcFE2TDVhREpO?=
 =?utf-8?B?K0hkR2dPeU5POERRdWMzaXdxcTVrSEVrZEV4ZmhleVQwSnl6ekN6T2VUa3E3?=
 =?utf-8?B?TFFOalAwdFp0bWN6TVFtWTVKN0dFcGc4QUhROTFSZm10Ry8zUUFuRktIbFZj?=
 =?utf-8?B?UVNHOHcyUWtIODlOazFGTHVZUUhuTFYwcXBuSjN5UzlsTjcyY0R5WXMwNC81?=
 =?utf-8?B?MzhJcUcwckZ3c09NMXhLbzRFS3A3VjZ5eW1PTWxUbkc2QkY4L2hyTXlQc3l0?=
 =?utf-8?B?ZEJzSklmaEFReEZ4RTRPS0RRTkNYN2Jjb1Ywc2txOXhtOVlzQW1XSUc1RDRY?=
 =?utf-8?B?aktCWWlTVUZPU2ZxTE82R1Y2VzUvSjl0RE1TTCthbHJZWmdHZEFLWU05a3Fy?=
 =?utf-8?B?NWQ5aC83WEdPOFc1UGFPZnRVSjIveDh5dWEzZDd2bk1aQ0NFQTM1NnBoaFNo?=
 =?utf-8?B?QWtxdnJQQlZvUzIvSlk2eVVjQkgzdFlQRm1BS2JWcS83R213eEJCRmpScnNE?=
 =?utf-8?B?eXpXWVEwMlkzUTJ1Mk1rbGoyMnFDcDhjaTJOZVdIcnBDb3NJTmVLb1hXK0NL?=
 =?utf-8?B?RmdjZ1pwQWRBWENWd0xwcWlqYTNXVEdUa0kybnVRem96RE5BWmtBMXcydS8z?=
 =?utf-8?B?MW1vdHdEZ1ZleGsvS1ZYMm1sZ1JMcmtOV3hGeExLeUNSSVY2c2Q1L0NkSitn?=
 =?utf-8?B?T2pIMG5sWW9tZXdCeFZsRTJENkpON1AyZDloRFF4Z29VQVZ6TVBDQ2xKSzFF?=
 =?utf-8?B?WTZscWs1b3RRNnd2cjhKdEM0Mm1CZHdRYi80YVl4UVUxc2ZwVS84cmsvVEk0?=
 =?utf-8?B?ZDJUc0kzRDhpVmdWVzg0UHRmRmhlUjdYN3N4VGg5eVM1ZGEvUzdvY3BRRVZs?=
 =?utf-8?B?K21LMFBBM3g2YWVNNi9Hd0JWbVFITWNoMDdQKzQ5Z0dqUi83ZUw3MjAxNm9G?=
 =?utf-8?B?TmZCK250MVFQWndVeHdyaWpsRWh3TDU0a0Z2QTlOWHdJeUpGRm5lQ1FVWkR6?=
 =?utf-8?B?MkRiY202RDRLUTBZVWxibmhQalVLZ3hzWnRBWXpYSzBCaGdHaGJnVWdMM0Zk?=
 =?utf-8?B?SkJnZWp2S2s5OHRLeTdaaE5tSVplSnFFaDRDTTErRmxrT1hweVo5UDY5T016?=
 =?utf-8?B?SnEvdXBNZ3dhZ0RxRm01eWhpY1NENFFoQ2svRCtxQitXS3lCQ2dCcHNXOHR6?=
 =?utf-8?B?VzI5T1pEUXE3N1VxZVFyb3AvSTg1VGF1dkpIU1Qrck5IcENta2xQMTJKY21P?=
 =?utf-8?B?R1l6SUN3QWVFcUF5TW4wSjBVL1FpNFZXWXhuV1gzODNwOHMxeTY0QTNrS3RB?=
 =?utf-8?B?d3g5VUhoVU5QTmtEcUp0MEczdWRFanU5RHJBNXdqZG13bU9qaXJWaWRXaXFI?=
 =?utf-8?B?UE9yWmxIN1FHNEduVUxoUFFxR1RFaTB3amxTaDFzWjBBcWh5Zk9uN1htQkRh?=
 =?utf-8?B?UmU4VEM3Z1pxZ3o3d0dLbFYvSXdDckVSS2NFdVpwVXZYakFsUHo4eE90SStM?=
 =?utf-8?B?bWY5Y21WeVk0SXlvMHNRakZWU3cvVGxIaGR4VnZhSUczZHhZNmpGY0c0N2F2?=
 =?utf-8?B?UnNXSEVENTdYTUR2TXhuVjNCbjdCS0tLZVhHUjNhTHNzWThUdjNkMDZJMFB5?=
 =?utf-8?B?TGw4N3BmYU9PTUh5V2psRmhWelVHZkdNZThHeDNQaW5BaGxVQnZwL1E0aDdG?=
 =?utf-8?B?NUpoODV6RTZEQkkwcFh0aGNzc3p4b0gvb3JmK1luRkxwOTlLZDB4SWxaRUVU?=
 =?utf-8?B?S3UydGFZTUsveWl0VjdnK0JEZElmWExRUllkMWhtOU9sNmw5V3czSk5rdmxx?=
 =?utf-8?B?bGpCK0UxYlp1b1plQmNWbVVPUDdpcDJiSkZUQ1BVRXk5RjVlNjZ1ZHpHVkhp?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6ac01c8-77ed-428b-f3e2-08da5a766c04
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:29.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyTho2dkLudEbOraS8MUR3y0vuNOjWwoRyDy+vYBRZxSzHvBg+chstdFe6nCZ2UF3hx4cijfEF/PY6sV3nHHaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6699

Current code to calculate nr_irqs assumes the APIC destination mode to
be physical, so all vectors on each possible CPU is available for use
by a different interrupt source. This is not true when using Logical
(Cluster) destination mode, where CPUs in the same cluster share the
vector space.

Fix by calculating the maximum Cluster ID and use it to derive the
number of clusters in the system. Note the code assumes Cluster IDs to
be contiguous, or else we will set nr_irqs to a number higher than the
real amount of vectors (still not fatal).

The number of clusters is then used instead of the number of present
CPUs when calculating the value of nr_irqs.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/genapic/x2apic.c   |  2 +-
 xen/arch/x86/include/asm/apic.h |  2 ++
 xen/arch/x86/irq.c              | 10 ++++++++--
 xen/arch/x86/mpparse.c          |  5 +++++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 7dfc793514..ad95564e90 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,7 @@ static struct notifier_block x2apic_cpu_nfb = {
    .notifier_call = update_clusterinfo
 };
 
-static int8_t __initdata x2apic_phys = -1;
+int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
 const struct genapic *__init apic_x2apic_probe(void)
diff --git a/xen/arch/x86/include/asm/apic.h b/xen/arch/x86/include/asm/apic.h
index 7625c0ecd6..6060628836 100644
--- a/xen/arch/x86/include/asm/apic.h
+++ b/xen/arch/x86/include/asm/apic.h
@@ -27,6 +27,8 @@ enum apic_mode {
 extern bool iommu_x2apic_enabled;
 extern u8 apic_verbosity;
 extern bool directed_eoi_enabled;
+extern uint16_t x2apic_max_cluster_id;
+extern int8_t x2apic_phys;
 
 void check_x2apic_preenabled(void);
 void x2apic_bsp_setup(void);
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index b51e25f696..b64d18c450 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -421,9 +421,15 @@ int __init init_irq_data(void)
     int irq, vector;
 
     if ( nr_irqs == 0 )
-        nr_irqs = cpu_has_apic ? max(0U + num_present_cpus() *
-                                     NR_DYNAMIC_VECTORS, 8 * nr_irqs_gsi)
+    {
+        unsigned int vec_spaces =
+            (x2apic_enabled && !x2apic_phys) ? x2apic_max_cluster_id + 1
+                                             : num_present_cpus();
+
+        nr_irqs = cpu_has_apic ? max(vec_spaces * NR_DYNAMIC_VECTORS,
+                                     8 * nr_irqs_gsi)
                                : nr_irqs_gsi;
+    }
     else if ( nr_irqs < 16 )
         nr_irqs = 16;
 
diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449..dc112bffc7 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -131,6 +131,8 @@ static int __init mpf_checksum(unsigned char *mp, int len)
 	return sum & 0xFF;
 }
 
+uint16_t __initdata x2apic_max_cluster_id;
+
 /* Return xen's logical cpu_id of the new added cpu or <0 if error */
 static int MP_processor_info_x(struct mpc_config_processor *m,
 			       u32 apicid, bool hotplug)
@@ -199,6 +201,9 @@ static int MP_processor_info_x(struct mpc_config_processor *m,
 		def_to_bigsmp = true;
 	}
 
+	x2apic_max_cluster_id = max(x2apic_max_cluster_id,
+				    (uint16_t)(apicid >> 4));
+
 	return cpu;
 }
 
-- 
2.36.1


