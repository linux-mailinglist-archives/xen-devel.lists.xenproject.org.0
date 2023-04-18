Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601116E6105
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 14:18:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522806.812405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokHq-0005UD-CS; Tue, 18 Apr 2023 12:18:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522806.812405; Tue, 18 Apr 2023 12:18:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pokHq-0005RN-95; Tue, 18 Apr 2023 12:18:18 +0000
Received: by outflank-mailman (input) for mailman id 522806;
 Tue, 18 Apr 2023 12:18:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pokHo-0005RH-Rn
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 12:18:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 16edd25c-dde3-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 14:18:14 +0200 (CEST)
Received: from mail-bn7nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 08:18:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA0PR03MB5611.namprd03.prod.outlook.com (2603:10b6:806:bf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 12:18:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 12:18:01 +0000
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
X-Inumbo-ID: 16edd25c-dde3-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681820294;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nqtMWzVhSHgKKA2lkWFoqWAqR+LCdhWzHZ+KIPm7k3s=;
  b=FFK0F2lIWMnL8oS2UpgDC3vod4TqVH9ymEj2ES7CcrPxISRjUkDAx/om
   ol8mdRfYp3UZSY6P9Vm8K5H6WhU50n/7aaogB96QlI9+Rfm4knUroqC8t
   TTyw193r04jdiwPSvKq+XYBGsefPTva5TV5/aXwNl8Xz3D8YVa+389Kh7
   k=;
X-IronPort-RemoteIP: 104.47.70.101
X-IronPort-MID: 108385673
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:51ZmEqu3fB5WWvbfeBHUQN2UJefnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWjVM/yPNzf8Ltwjatm2/B8AvMXRnNU2HlA5pC4yRS4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHxyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwK2sjazaHuOeK/Z2iV9BM3PsIIvbzM9ZK0p1g5Wmx4fcOZ7nmGv2Pz/kHmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ouiP60aIO9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgpqU63QPMnQT/DjUHCEWnnsu4hnKFStBjK
 UcfwQYnq5U9oRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8hSy2ETgYKykFfyBscOcey9zqoYV2hBSQSN9mSfaxloesQWi2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:d/rAf61aDIwj9cd2AMs3RAqjBGIkLtp133Aq2lEZdPUzSL3/qy
 nOpoV96faQsl16ZJhOo7290da7MAjhHPJOjbX5RI3SPjUO4VHYSb2KjrGSpwEIeReQygcH78
 ZdmsFFYbXN5DNB/L7HCWeDYq8dKfC8gcOVbJ/loUtFfEVMZ7976gtlFwqBVmFzTAlCQbo1fa
 D92iNPnUvbRUgq
X-Talos-CUID: 9a23:NK6eMm+KDbMo2riPeZKVv01PNMUDdkLY8Er/OlKBKTxWY7OqUVDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Af93k8A9mMDiast/MeHFYKEOQf9Y1/biROkEBra4?=
 =?us-ascii?q?XufWGPidLFz6bsTviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="108385673"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqyxmP9HeldJzpv6aoQFauD26P96/wWOOlx4KcB2rs7NbDeObaqq0rvezOjEi3+98mkhVdASVTAZNulhckJ7aiUdHRsUqpWQXfG/GO3fGxMQuCEkvAGtuXmemnzp9JFLRlWyBNZWE7TN2/hba4ZemJ1Hxry1CX4LUnjf8KJgvFTcyvNxXEJ+T300XP+skIQNgzLfuva/XfkHAmS8pPR4CV+dPkPLhA/FKWCTdwPFZU8iHM94Mn9L9LuYrtf6L/Z4SIPQctwvaChgsweqa9KzL6Z/gm8YEZV2hjKqeKeGZaZXTG8DJYNvWera/ZhXKIbPvGToethn5TChnszVfnmqgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EmqEYLVZS4IB3+FJFhu6PP4ws0zRPgYBkWt5s1tk+UA=;
 b=ECZG9nnpInqIJNMCiU1QAC8CE+EkQRENJT4TQh8t8sH49inbSNkFP/FRtfB8nxMeOa5pCLDMQjg462k/9K4B5joRPkjMkou/rLclu9UU7Q5UM2ZuVkE/9QV7bu2Brx4XabIHL3bmRyoj8M6f3NNcex/aZF+QurSWr6N7udQuSqAtDj1Ca6LwTc9CUFc4/AXAvp3KuqV+hTlCg6Fi0xeZ7vhNf9fINIH/vZ/cn/FfkThfFwxiBSGUnNWiMfSIJ/qhyEGXE8UF5jbiskr4plZZPutttKQedL/e8E8ljc0QCPOP661SEel9ovSlVX1r6q6rO7JBYysMyI2EejCY57Rwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmqEYLVZS4IB3+FJFhu6PP4ws0zRPgYBkWt5s1tk+UA=;
 b=i0qOHFDgN54fathBtnA3Vc5MCUm0maROLIBllwZJXLCVg/XYPWlqrLD5giUN6QxQPKQikyFj6CfUvTAR7pBu897Dr8UiO691BITDECWJl/3nsNwsO909quGSlVdfDMyQSssQoPaTKuMNR0edqdbAs7k2gc7RG6HF2GY/fkk4n+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fc9085f6-25b7-b94f-e7d3-ebc1d6283d73@citrix.com>
Date: Tue, 18 Apr 2023 13:17:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230418092458.15253-1-roger.pau@citrix.com>
In-Reply-To: <20230418092458.15253-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0196.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA0PR03MB5611:EE_
X-MS-Office365-Filtering-Correlation-Id: 6408f675-8b51-401e-3408-08db4006f3fe
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MUyxcIFm43n2sDO8uO+AZRjGL2keZLmRvOHwS6rehkvRUCkbMKUGh3jYkZfTEHfK4ntcS6UK88AUe5iUAloXUzYIkO/n6LOb06ppUEAdYxB0xWImsu7MQj9K8223GNk2HrhGyfNwnDJEoMmqOI025LCQVSz06bu7Hxp9hFhCvq6XonkDUv4PSaTF9rqMhj2dQdV9uFIwnxTEQub3CC42clUNDkzO9sfi2auDrjD7l1BLOYrf4ubhQYuFwdOTYksXFSeM6zoYDKqC4M/njwSmiUIKLm7h7nV8JlxoABNhopqr0grP7FK+nOUtBAk+Ru6O52YMT4DoG7lzigqPqr0WEk861Hb+WGlykL47H0Dg2jjzi7wrFK7hODDb+GAw1uzVJDly/fyhMrMXCVePnkH88WpZU5aHZzA7i6FzKhBNeE42L8qs6bDqBm9z34CdxsZtlhnNmjoFXDF9a90iWZhntNqsX4LrnG4vKKN7sJcS1omYm9xaKIdh+5xmBsnhzmhaC9xi1qExqlH+MDK0D9LBhYiMqEEcs5P0SEv/YyaLuDpo6R8WdxXic0TH0oMZIp9XWVsuveDdKBZG3NAlbD7vMeBGbfLbTuc8ox2FuobJhcNNDaHkhnVjXtpI5EfazhtaGcc4Q05HnxwSCsrzZdL60g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(36756003)(38100700002)(8936002)(8676002)(5660300002)(2906002)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(6512007)(66946007)(53546011)(6506007)(66476007)(26005)(41300700001)(82960400001)(316002)(83380400001)(4326008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFlGb2xsZjBkU0xMSFRPMG5wNHVyVXJwUExLM1pJNVNtUFE5WGFCMW1mVWNN?=
 =?utf-8?B?a3R1RndQdWZJdCs4b3hDSzFwWXNVWU5tTVhoQ0h6WC9mQms2ZTI1c2xHSG1S?=
 =?utf-8?B?TTVIYlVhbHhjMmUxSk9DWEdVQ1dwMXg2R0Y0bmVNQlVhWDh5eDZBR2JIZndt?=
 =?utf-8?B?dnUyYVVsVnlvdnNaOHc4N2ZIdkV4MEtCeXVqOUR3MmNNQVhvQUZFWS9kQWN2?=
 =?utf-8?B?MFc3a3hrQURvd3NoWER1M0tPajNvSVRFUHU5Vi8vSlROaHJPd2xwWlc3b0FY?=
 =?utf-8?B?OU1oSHUyYnlFalI5YVlPV2RGSlpjVkxncUZMR3NLS2RpbUdyWFF5ZnVyVWlx?=
 =?utf-8?B?ejZucVd4L1FoN29yckVjVHlpTXN6OE9vN25DVzRVaGtlUldUWWduRkxTdmY4?=
 =?utf-8?B?RUM1RlhuQTVZdTlhVnFTMWFWTTZqY0pWNFptaGRzUlFxRWZDUWttbHYwc2VH?=
 =?utf-8?B?bUlPN0NJMEN3ZjVDcFlNUnhwWGFoUGRDUWJaL2YvbkRpVTZiVXdzUzU2R3RR?=
 =?utf-8?B?N0tnTmloLzk0RVF5K0VvdTNVWm5ud2tsZGVPYVZZazhUY200TXR3L1pNMG5R?=
 =?utf-8?B?SUZVWlR0SzA0eUJDVlVIZUhCNUcrcGdoSVFjcnl4TTBzUFRsbUJJQzJhSjFO?=
 =?utf-8?B?U0R6VGlGb1V0S2VtRE9ocmFUQnhaQmxWcGw4UldzaGJWZ2ZHN09IOVdoQ3FX?=
 =?utf-8?B?Q3I2WmV2dUhRL2t5QVgrTjZodDFYcE16NXNsanlBbEx0STJTVG5UQ24vVlNn?=
 =?utf-8?B?Qk1tRmEzTktYa0E5RStNMFpCRlRRdFcwaVQwSVhjcmhJanZaQklBT0lHMS9y?=
 =?utf-8?B?U2RLSGo5VG5uMTlWN3NUdDdXT0FhSkczbWI1Wk9zWlk3R0gyeVFBOWUvc1or?=
 =?utf-8?B?c2hQLzl2Z1kwcjVqSXJxdXR5dDBaV256Ry9ZWmN1ajFPb3FjandFckZyUWVQ?=
 =?utf-8?B?Q3hnSFpiaHlMQlpIS2lDeG03VitZdHRxbDVzVFJYc2xLOWplUG5aZ1FIRVRi?=
 =?utf-8?B?REJmN25YbmszMzNIVDQySzhMQVhiSklHS3hLck9oalY0YnVqYWhwTFU4Q0tm?=
 =?utf-8?B?TVZmd2hBbnlmMXJzL1IxTlFUZ1FNY2M5R2dYUkljRFd0d255eTV0ckxtcktM?=
 =?utf-8?B?S016ZEJhMjBxZ2RnNXMwa1VPeVU0a0lGOTNqZHNMemxXTEhqVzg0MjVMMGdL?=
 =?utf-8?B?TUx5TmFuM2owZVBMMGUxek1RbnhXWkNSeTNreDRnMEh3ZEFsZG9DUjJRbmU5?=
 =?utf-8?B?MHpOeGxDZWhKSEN4TzQxZjR3cXEvL2V0aDdGQzJlVlI0QlRHY2hMN2ZOM01E?=
 =?utf-8?B?WXdjUUhnZVppWVNIWnNWSXBzNTBoU0VnYU1KUStjYlRRT3drbGdWazZObDNr?=
 =?utf-8?B?Z0lxWEVGY0xXU3paUW55QlVTbHdKSktQUHh3cEtVYkNjT2RNdVhkcWRnQmFq?=
 =?utf-8?B?Nk4wSHhOQTluSHdRU2RqL0FGOTZMY2pPNWx1RkhyUzk1Q0lTWmZoSlpjeXFw?=
 =?utf-8?B?cThsTmplT1hONkpDU3dPTm9oY3d3ZUdYekt5QnBUL0dFY2JEM1pmbUlOM3NT?=
 =?utf-8?B?QXJlWnF3dXVCbUdwZ2o3d3dpSmhHUktJK1h2UTArUVJPSnUrNDdmc0M1NHFl?=
 =?utf-8?B?bElsdmJBNWRMS0FtSnlGYVJIZ29zSFhpZjF5c2ZVdVgzby80NFNnYVd6ZlJh?=
 =?utf-8?B?VUcybC95OTZpbUtSeVRKWlFmMlY0dnZoaVpDUVlENC9TT0M4Q1lhc2V6aEVt?=
 =?utf-8?B?Ly92ZTkxYnhyMjdqaEN3am1QcVBUbGoxcFJFQjl0eGRqM1JBWk96K3gzanlQ?=
 =?utf-8?B?d1RHZVYzRU9vcHRZOHMyVDE2eUF6aEcxOTNtQ05WbE8rakNZODNlQWdPU2tz?=
 =?utf-8?B?b0dHditlSkZEUDhDN2xTbzJwZThHNUU5SHJvRGgwREpnZFg4TGFnUnRlWjBL?=
 =?utf-8?B?LzY2WG9WVWd1WkdHYW1YeWtOYlZQaDFZN0ZZY3hxR2kwUDNxUDRGUy8wRFNk?=
 =?utf-8?B?VlJzdGx1WXNORitGRThTVFY4cXJkMzJNREJlUWRNOXBzTmcrUnRtQ2EwM2gw?=
 =?utf-8?B?U0E5U3RDTlpLTER1NUhnZVhBZTFibGxpY3RYODhhZ0xwMmJ6RTFqL0EyaWZt?=
 =?utf-8?B?YVNZb1dlOFJwdE1PeWNwNmpHNEwwSm80SS8vZ3VyYldPWlFDVi93WnhEenBX?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DR3JoLcP9P9Nppo/7XE7NGJqyDCEUloVPnKgLeL/If8mYb7hkyEVRQGo9pvUJN7+rGieh4KbezWtuNO9Vf0khe5zmXUWcXMEM2Wsaq6ZUIRia2kmntwf42P5NJ3fyt/MDHaUpeXAvFHmtUwi3Qb6utTwN2cRrd5iiScNFNhpEID/yHDT9rj6KvAGhPFKJZH5264/Nr7pUC/42AGRch7l0v9/02+4qUp72x04+snxKA4XnDtFXJAdKINCjPAwL3pQrwwUcCiZxUL/CHXMTibAO5IUr2nsXn+SuuwqaTAMEGiHiQAnZ8+m3HYXZKhdSBhKgAcNQ0IDstInrlK1guHbvU33qvPX1uBGKnnYsycy5Jh/5r6JgnTgGPt2Dd4jca3RH/zruPcJJ6PSNTRAVjmfUG7GBUGNrH52LdSMFTymP/qyOMUNBJZvqPBUke04VgLvf5bg8RUEwaOTcPWESXc5PhNFiP+yF80qnlbmXM0g3L74q4Hjr8n72szqPnrmdNzjnPXCH78QuwzGmj+vt3BOH22XSztzJlWh7PlipLs4ww9YgJT7iG+gYVcN3tcn++sHR70iw2ebdyktEs0cnkPEjhQThg6OuOWCkdhMuUChBHJQfeTq4Wu2cxrtucOAMOPXuEmVB7W3UFvw9ndpctlEzp2p+Vo974sBREKm1n6qfBskwsG0oPBdbUXJjy7lLlAg0STWK54oX7URKHNN7tT1AO8deRQ0dRfg/5Jw8N5qHqC9fBKzqfac9WQ4Xr2beGjZusiRb5rF3MP4adc20e5oZmCFzoqTcy4RyI2T/yvvUtZigSfByGwNvXgZUeQv+D9eqcfF144gw2bTyhUmtKgP2A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6408f675-8b51-401e-3408-08db4006f3fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 12:18:01.3277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhPNGGtaNV3J8adBQyzEDewoZkAvpSCAAWBa31ezhWEEjz//nTdEgRWpj0eR3zuQf8kw8P1BcrrSay5WkC5s4f8oRTqnwc8azArd5is3bn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5611

On 18/04/2023 10:24 am, Roger Pau Monne wrote:

> diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> index 7675a59ff057..c204634910c4 100644
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
>  
>          ALIGN
>  /* No special register assumptions. */
> -restore_all_xen:
> +START_LP(restore_all_xen)
>          /*
>           * Check whether we need to switch to the per-CPU page tables, in
>           * case we return to late PV exit code (from an NMI or #MC).
> @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
>  
>          RESTORE_ALL adj=8
>          iretq
> +END_LP(restore_all_xen)


While it's useful to have a concrete idea of what is necessary to fix
all of this, I do not wish to put in markers like this.  This isn't
about livepatching - it's about getting sane ELF metadata.

This is why I had Jane work on using the Linux macros.  They account for
*all* interesting ELF metadata, as well as taking care of things like
the global function alignment settings, CFI patching space, etc.

Putting functions in separate sections should be hidden in the normal
SYM_FUNC_START(), and dependent on CONFIG_SPLIT_SECTIONS behind the
scenes seeing as we have that as a option already.

~Andrew

