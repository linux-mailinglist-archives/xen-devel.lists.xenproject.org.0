Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF1455755C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354578.581761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9O-0005nB-B9; Thu, 23 Jun 2022 08:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354578.581761; Thu, 23 Jun 2022 08:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9O-0005kX-7V; Thu, 23 Jun 2022 08:25:18 +0000
Received: by outflank-mailman (input) for mailman id 354578;
 Thu, 23 Jun 2022 08:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9M-0005Uq-M4
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:16 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 013765d6-f2ce-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:15 +0200 (CEST)
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:11 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:11 +0000
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
X-Inumbo-ID: 013765d6-f2ce-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=f10z1FY1cEzgBr5aQzVFoWFCR34qa1FghZWIHlDrVVk=;
  b=ihXQi4ubWa5LSdoAzs65tqCvD8F/MdLQ4h5ILDm0SUX8RqxniHlWbxaN
   w5iz96Ie57Dj+eJISzFuM3Gwvcgb9GqwQfYs3gQ0kEYcg86jpgiguu8Ih
   Kswa2Md7TpcxUUqVuPJPE3IPsRLF2UWY3rNPQxRGA5JOpRNIiZ8p3OLvU
   U=;
X-IronPort-RemoteIP: 104.47.59.169
X-IronPort-MID: 74236204
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bBaqlK+7EiuI4WHy9zBFDrUD9H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 msaW22POfiCMzD2KdkjO9jn805UuJXdx95iQQVp+Cs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LjW1/lV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCncO0VxoUY7+SodYifDlxFChvJrFt6IaSdBBTseTLp6HHW13F5qw0SW0TY8gf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvSMvIEJtNszrpkm8fL2f
 c0WZCApdB3dSxZOJk0WGNQ1m+LAanzXLGEC8wzP/fZfD2774i9S9OXBaPnvXMWVQ59IglyUv
 m+e1jGsav0dHJnFodafyVq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRoky0Vs9bK
 kcU0jEztqV0/0uuJvHiWzWorXjCuQQTM+e8CMU/4QCJj6bRvQCQAzFeSiYbMYJ38sgrWTYty
 1mF2cvzAiBiu6GUTnTb8aqIqTS1Om4eKmpqiTI4cDbpKuLL+Okb5i8jhP44eEJpprUZwQ3N/
 g0=
IronPort-HdrOrdr: A9a23:+A0boa9G51zemGK+0xZuk+FKdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsj6KdgLNhRotKOTOLhILGFvAH0WKP+V3d8mjFh5dgPM
 RbAtdD4aPLfD9HZK/BiWHXcurIguP3iJxA7d2us0uFJjsaDp2IgT0JaTpyRSZNNXR77NcCZd
 Ohz/sCgwDlVWUcb8y9CHVAd+/fp+fTnJajRRIdHRYo5CSHkDvtsdfBYlOl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ82PI9ZxZlPbo19MGLs2Rjco+LCnql2+TFcxccozHmApwjPCk6V4snt
 WJixA8P/5r43eURW2xqQuF4XiV7B8er1vZjXOIi3rqpsL0ABggDdBauI5fehzFr2I9odBVys
 twri2knqsSKSmFsDX25tDOWR0vvFGzu2AenekaiGEaeZcCaYVWsZcU8CpuYds99RrBmcEa+d
 RVfYHhDK48SyLYU5mZhBgj/DWUZAV8Iv/cKXJy+PB80FBt7QVEJgUjtYkid0w7heMAoql/lp
 r525tT5cFzp7ctHMRA7cc6MLyK4z/2MGTx2Fz7GyWVKIg3f1TwlrXQ3JIZoMmXRb1g9upBpH
 2GaiITiVIP
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74236204"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdkAzbg6Gg9lG8qBl9jAzxBuo5vKWuVYmCpURHXq6LKK+8+IuOdE+fWRaQ+Y/KWo89W6rSM+bUSHgibCkrhL9COz49OHjPasic/xCQZHizreN2J/ApTX9iZtKLZsemXIXLXfAZzshpp+gOuqtkLA+1KhXLT1XKmAiB5WpQDV4DQSqCXgrUsT9uanEwJEz7wf6piHD8plDdbZz3P9hihL9iHL6i71UMTzdLZEXbcAZ8nJEcQrBFCTgVwt79tzmfrOZYpNXgtG9dRkQWKGZG04bWC2qWhuz9HeWY+QMkOW/dj81pM9xys1ZbaoahlbI0sDZbwp0g4/YnGFrHseXcgb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7D3+9B1wNBssAOS6U4CtpT3AYDnVm0sewLbpEyQ/iCE=;
 b=If/mSBDx8cbzhFT1GZJAkkBKJSuQeAJ2tUa3qbYt3uUCAWIeOl4/QJelSBjbuqlky6H94J51458ybzkNYcN8TvUYNn17BXxqYUO7SYIPoKUisR0U+V2QZmOrioumkW6p9BKK6HKzYzgC8bq/T0a/aiq/OFlm4EcxNpEIa6KiVIXJYG9fKyA+ErfmybmiPa4SYVo6YCJA+Ed9cGpEpzROWhqOBsEG0ofBWIp4W9PfK2Hm5vRuGHiwy4zyLDtI1OqYByYN1e3eSS1/4Rzt8qBlgMisSQEfImwnRXoKTXI1346FKRnHScQ1ezZ7QWtOvGZp5kDByExpQlhJAsU0ytU0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7D3+9B1wNBssAOS6U4CtpT3AYDnVm0sewLbpEyQ/iCE=;
 b=X19pl1H3V1PVUKEEgPY3Sm+x79WDnOA06+aMIFRiBg+G+okhW0/MWtyFe64y5XIuxQK+I1IMh8mgQSdUWEmLKPiToxa5GwfUJud7BkO70u4JLfNWjoQKKVYfCqpj3HDfR1/jgDPRrt6DVcM9ouVabu4wpVyBH+1vVHXAndYE0Cs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] x86/Kconfig: add selection of default x2APIC destination mode
Date: Thu, 23 Jun 2022 10:24:23 +0200
Message-Id: <20220623082428.28038-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0086.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c426ef9-13df-4ac6-dd43-08da54f1e3bf
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB50089BEFE7257294CF072E088FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1qaOju36ZDvS39oZEdLbat6Z5da2uQk/21u+2QN65Gh1V3c2n2lVXAQ/X5Zy5oz6ib1Yil1eN5hMGXsnvbLcXFOjt88bFFUZPO/EDTbdm2SNf5tI1j4HsN8ey741SlB9LaruuO6DqfFq9Ne9oE+ChzR+38RjkAzJgRT0mvceqbWhDblN2ZGVgdHkhQUTF1quarf6Blx9wpYJKxARe9j/rgSKT42KNt0XO15Y1aMa6Tf8Q3p98GoqmYOUb3D4+9lx+5IV0JP2VbKU9HdN7zUVsUa1hlpIYRsCmY2mF5BZ3sZU5c5wpIgcoGVtEZgELDsl08HKuxYYRd2cE1LryFm50+IooW0Is0cgbIuqG2NXmQEy+1QT9Fi+Iu/hQOxtyerraXyhloMRIp+A7a3jZ/SXC1tpxsdEOJJIe0z2oVekm1HnMtQ1AZF22AXaSMNHuMulR8Hz0R3PbOhk+Io5aZuh7BK7EJo76W9Pr59vYxPTkuia1WVwU6pTrfAx1xjtZAhk8tEldzJbXofQ1ApP37laJVnMxAKyl9BAxHJWIzni1Dma4IT/NFPrEtbpSqdUaHzN1dWZDprcIPGGXT3rDxGtovc1d8LH4ubNjgZvPlB+kbd97F1k63BIHKQpt69sEcZQUVo8RRZsTq5tW4G1kD9aW4rjNvzPm4BePwo7l9E7qwh5LL+KHNN6iIqOki0s7qkZ19ilKsWr/G+VD/wkvnGKbw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1JMZFJRUXRNSnZwY3MvUFlYdkZkTS9zMVVWQzN1dWFTV2JMMExlQUs5Nm00?=
 =?utf-8?B?TWZIMlJmMHI1YkhIUUJSN2QzWE9QazJIbXhnWVVVdFlaSnQ4TVV0Uko4dXlH?=
 =?utf-8?B?NEtMcWpzQllRNkk3Rzgzc0p2MjF5RE8yQy9VR2FleGdMRjRiY3hoeUJRa2Zq?=
 =?utf-8?B?ZUhQU1RVR0h4OWhDQzZBZmovR3ZUVTlzUWJhcWd3UDAxRHo2LzRqTkU5WjUy?=
 =?utf-8?B?eXh2WXR4RmE0eGR2L1BjQlZpRUNLUTJFT3ZON294RjZlTFFwOU5nRUprYm1o?=
 =?utf-8?B?b1pIS1hDS2ZKNTJFc1JVc2tzQ0pyYndZdjE5dVlKQUJ6amY1QktnWnprdldR?=
 =?utf-8?B?azk2dzV1c21ZbllmTVJYWHV6TjRpdkk1TDVrc0NRR1E4MnVSb20zUWQyaGdu?=
 =?utf-8?B?M3Vuc3BhVnA3TmltNHlDZHNiYkdkNWZnaExNMVFjVnFmUEtPT3V4V0NuSmQ0?=
 =?utf-8?B?a0RydWV3Qkg2UHBHaTJqRzZUaWZXekcwUkdhWGhIUWFjS0o3YTFUdHQ3Q1dN?=
 =?utf-8?B?U1c1dG9ib0E1ZUozcnlGRFZYNk5nV3VmaVU4RVMzL2F6U3NhTFo2LzdaQTB4?=
 =?utf-8?B?dUxoaG8xN1F6Y0VlTzJsZkpUMGNWOGVBRHg4Qzk4bkdOdkI4NTFKTWVTRjgr?=
 =?utf-8?B?WFFhdnJOQ21uZ282VE5jNkFtNHkrMHY1US9QZzZ6V2RBWjJlengrSUROUEZo?=
 =?utf-8?B?MGxOOUQzRXlTcGNtTXlwWEJoWElHSjNIQ09sK3NwdG9hc1VMRzlQS0xFMCto?=
 =?utf-8?B?Y3IxTldjWlF6akNXYUFhQzJlbGN6VW53TkRSL1RLUFBrRXkyeGo2Sk54ZXNj?=
 =?utf-8?B?Q3VpOWh5TXh3Z014bTE1OFF4d1c3OWtld2NUcTdBVzBmMk50YzFsc0VPQ0RZ?=
 =?utf-8?B?SlBSZS80cEFnRUc2NldVbldnbDZSY216MXE2OU5TVFFKUXNoRHdqeUlqVXB6?=
 =?utf-8?B?M2tFcVN6cUNxckYyc0UyazlCVE4yano3eFdhdkk2aTV3bVVrR0kvajlTRU11?=
 =?utf-8?B?UFBpZk1aY2VkcEZGRkZzVERBcVRsTTA2R3dSSjh0eEVjTU1BZFp0dHRKWHRN?=
 =?utf-8?B?NzMwMksydW9RbXgxY3B2bk5GVmxFRFYxeWZXNkVlY0J2UzVCWXk4R09DSFFB?=
 =?utf-8?B?d0Y2NC8vS1NzSXhaY0FHQTBlZkY1U1I2bWVjRlByRlhYSzdRMHJSMXA2aUJM?=
 =?utf-8?B?ZHYzUVpXZXl3QzF3UGdXUVp6U3VNalV1RytNQjlyMGpoZitMOGJkK3dDQ0s2?=
 =?utf-8?B?Z1htaUppOTRhbzNYWm9NcUsrT09wcUNSODdraW1XT2hheVBUSnljYnBjUGVs?=
 =?utf-8?B?bkNRRUkvT0NlVnhJd1ZRclFvQ1JlZG1zTVN5UUhEcnpnZ1RWdXNHa2R0OVhj?=
 =?utf-8?B?VjVDaVZTbkRUMUpNZWZrUWIweEh6YnJzQWhVRGh5M2t4NUc1V2JxbnFldzBp?=
 =?utf-8?B?NW16MlhRZkRHVmpyMHQ3Njcra3Zob1ZoOEJpUlVGSG1DK2NrdnJJNkhoMG9k?=
 =?utf-8?B?M0d5S0VYQ0ZqNmhLVHdXVlNxT0dwNFozSzYxdFJiTDNac2xhNTFHUkswZFJC?=
 =?utf-8?B?K1RNRzJYbko1V1RCSU51dyt4bjRGR3Z6L0JuUk1hN3lNUTNQTTdsY1ZpU0dD?=
 =?utf-8?B?dU5UbGxkNE9qSXhnR1Y3dlhUUkZNbXFPWHNpbmZuVGhEKy9zT3l1blFMemxI?=
 =?utf-8?B?VXE4b1ZpSWRwSFdpODA0aWpxS2JmZVZXSkpOWkdLSUV2TGtPZWlUUSswalZ3?=
 =?utf-8?B?RGtPbzViTXlXaTl4bUh1cjlCcDNyakN5T0dXZGxZQjhOS3htdzlxMWh6MG5G?=
 =?utf-8?B?ejJyVzhaK3h0QmxiMmJxRldrWnFOU1c3UDljejlyRUVCZy84S050dXB6QVNK?=
 =?utf-8?B?WThOblFTRjJzeGZQZDBGcDhzaWZRb3pFODRRdTNXQytkWFJHMGxHZ2VqYUlH?=
 =?utf-8?B?RkpnMW01cnBOTE42Ukc0WEd5NW5odjZWalF0N0c0d3VrYTlLc1NVdXRpMmhu?=
 =?utf-8?B?d3RIczA1SnNGN1BjZyt1OU1qYTRaeVYrQmM3Q0pPK2hQRHRhZmVwUFFzUFVL?=
 =?utf-8?B?dUFvTkdRb0VhaWpncUhTQ1JLNXNFbVh6WVhPQTVyS1J6KytaUExSZnRPT1Zi?=
 =?utf-8?Q?FEq+9pQ/j+PBmt1LsUT0QgRIS?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c426ef9-13df-4ac6-dd43-08da54f1e3bf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:11.2619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUNBIsXR+F2uvv68TB0aStpxT9JNDNR/nKrlHZ/lSM4XXMjQKyy/k01HLye2i+YlAiqnhnJnBIR7CUnA4X30YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Allow selecting the default x2APIC destination mode from Kconfig.
Note the default destination mode is still Logical (Cluster) mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/Kconfig          | 29 +++++++++++++++++++++++++++++
 xen/arch/x86/genapic/x2apic.c |  6 ++++--
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1e31edc99f..f560dc13f4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -226,6 +226,35 @@ config XEN_ALIGN_2M
 
 endchoice
 
+choice
+	prompt "x2APIC default destination mode"
+	default X2APIC_LOGICAL
+	---help---
+	  Specify default destination mode for x2APIC.
+
+	  If unsure, choose "Logical".
+
+config X2APIC_LOGICAL
+	bool "Logical mode"
+	---help---
+	  Use Logical Destination mode.
+
+	  When using this mode APICs are addressed using the Logical
+	  Destination mode, which allows for optimized IPI sending,
+	  but also reduces the amount of vectors available for external
+	  interrupts when compared to physical mode.
+
+config X2APIC_PHYS
+	bool "Physical mode"
+	---help---
+	  Use Physical Destination mode.
+
+	  When using this mode APICs are addressed using the Physical
+	  Destination mode, which allows using all dynamic vectors on
+	  each CPU independently.
+
+endchoice
+
 config GUEST
 	bool
 
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index de5032f202..4b9bbe2f3e 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -228,7 +228,7 @@ static struct notifier_block x2apic_cpu_nfb = {
    .notifier_call = update_clusterinfo
 };
 
-static s8 __initdata x2apic_phys = -1; /* By default we use logical cluster mode. */
+static int8_t __initdata x2apic_phys = -1;
 boolean_param("x2apic_phys", x2apic_phys);
 
 const struct genapic *__init apic_x2apic_probe(void)
@@ -241,7 +241,9 @@ const struct genapic *__init apic_x2apic_probe(void)
          * the usage of the high 16 bits to hold the cluster ID.
          */
         x2apic_phys = !iommu_intremap ||
-                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL);
+                      (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
+                      (IS_ENABLED(CONFIG_X2APIC_PHYS) &&
+                       !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));
     }
     else if ( !x2apic_phys )
         switch ( iommu_intremap )
-- 
2.36.1


