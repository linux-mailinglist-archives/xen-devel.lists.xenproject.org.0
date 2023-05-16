Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73C704E60
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 14:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535180.832816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuEV-0004X9-H2; Tue, 16 May 2023 12:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535180.832816; Tue, 16 May 2023 12:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyuEV-0004Up-EF; Tue, 16 May 2023 12:56:51 +0000
Received: by outflank-mailman (input) for mailman id 535180;
 Tue, 16 May 2023 12:56:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7WEk=BF=citrix.com=prvs=493b78b38=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyuET-0004Uh-AO
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 12:56:49 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cf0dd92-f3e9-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 14:56:47 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2023 08:56:38 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BL1PR03MB6053.namprd03.prod.outlook.com (2603:10b6:208:309::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 12:56:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 12:56:36 +0000
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
X-Inumbo-ID: 1cf0dd92-f3e9-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684241807;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XKCwIunBum2vxDWO5X2i9KAUoQUgFkD+77osieuX5Qk=;
  b=JlrAVS3GIG1Dx7GHjrQG92TGZnto+UkGybisjWKPtxegWz2nOW8Prvzw
   zHs12u7P6YEVrY37ik//AZOHtwiNKmxmVpXj7DZ67cxBryL6PxVInViXP
   d3BS46DBjmgNFu8+5mQzBD3fhRxVWSyODrtXq5VPzgk9Bags56qlDLGtJ
   I=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 111670068
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dI8maas++0FwbNIglj867ui6UOfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWCOOq2CYWb2eIx0O9m390pVsJ7XyYcxGlZv/y9mEnsT+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AKHySFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwE2E0YR26ueKKkeiUEsY93eQfEuDqFdZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60b4S9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThr6A12AXNlgT/DjUTaVWKgKGF1XWFQo57c
 xIPx3d0lpQboRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfSxloesRm+2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNrxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:dVASba3TylDOJY5VpOPAPQqjBIMkLtp133Aq2lEZdPUCSL38qy
 nOpoVh6faQslx9ZJhOo6HmBEDtewKkyXcX2+gs1NWZLW3bUQKTRekI0WKF+UyCJ8TQzJ8+6U
 4KSdkZNDSfNykDsS842maF+hQbrOVvPJrHuQ4W9RdQcT0=
X-Talos-CUID: 9a23:P6eeI2z6LyDkwJ4+XPWRBgUvS/kqf0TjzEuBeWDgJjcyaIGrYF65rfY=
X-Talos-MUID: 9a23:YIvnJwmWTLnI81CsgpB3dnpnCMlZwvySV3s2iMki45efCHEqAAu02WE=
X-IronPort-AV: E=Sophos;i="5.99,278,1677560400"; 
   d="scan'208";a="111670068"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tzy3vsZzWGu1rzpXVfobulIvqjsEytuJSwVfytWNr+Zl1YudfXamVZU+0R7CZV+lKsjj0uMEbVGot1Zg4PZ/qAQc6lLWKPpO6sHk6QK5IcQbo/GecyHLv1H4oWDySOhDHoy2HFzeusxDkN5hh+sW3Qz33f3RhCrMPkKY/ALRHAHEUMKbZddP8OR8oMeLxsnCenq+qctJdIJWF6Rlu9tb8p8G5WD4z6Ry490ASTGgDnhCrkc7dqVD8HwND5PC5ZCzrrmvuxl8qHASzk9ynvl+wthqTk2zQ2ngaC1GfkLNRFC3Ndr7fp24OOwuJkvnx+OHhLL+mi/0LmAEXLmwr6PhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTJ8dqIoUz5dD8/hena/jJbV1TPDKcWDlD2f6+2LorI=;
 b=IBlmvXzKqasdb6qZpPGtqDFSQOVve+1XFp141eULRPcbGrIwOpUktmBKHjOec2yMc7FK1EhtlJfs9Bbx98zB4nGOKadlM6t3L0r1386pL5xxpRgeo4aB3SdOR5M7MUyyypphpVioLOZQEOuRpzZnCjnOgGWhPY3QlqRbu8MCku1kjfK/GIlTGQqF/byRrj8xXErOFec6yNup5hEXNY2r3pM1I07nnQicKtKQkbZV0OLS+BClbONEugyzD07hsfXUb03zOKY28inMeUgSjopfB3kzdrRxpl/Lx8wE6AlSUT9NQd5q4UiisaIyCf1PTfydEiTa8Rly48BunBQ1uxbq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTJ8dqIoUz5dD8/hena/jJbV1TPDKcWDlD2f6+2LorI=;
 b=aELgFof/YY+nbRuNERUHobGFNZJvP5G5cON8+OpX2aFyTEfHS82ZxzFUQ5y1a3FlnMCWwiVgRvAluXrUbYgr8RFGVil6RsoV+toHvakyyVSEZFMaxTrVP8JSaJzjRj5MWpdpYe6f8ryWlkEjr0WhUXPgR62y2RnfVbyVK39CpWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <85a04714-c8e5-de21-7722-cd1ff715448f@citrix.com>
Date: Tue, 16 May 2023 13:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] x86/cpu-policy: MSR_ARCH_CAPS feature names
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-5-andrew.cooper3@citrix.com>
 <20a1b108-68a3-a200-1d0e-390cd20b5500@suse.com>
In-Reply-To: <20a1b108-68a3-a200-1d0e-390cd20b5500@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0488.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BL1PR03MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: bc5888a7-6200-47d1-83b7-08db560cfb0d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W7ZZUlQvHVT+bnXSh3Th0PYv99ZtDAwjMRsGy15dDBTl47hdAvT5v8Nm3SvODnhorCsfo3Uw+UsYoLz5Td31vT318mimE5cIqAJDcMLVu/sPmXAQdNDjkeB6j1JbkG6QGUzInCTI97hApIHv4+OmbnT9AIAAcRLR7gJ+webn8LSh199UjaQ+RRCwrIN4qBEH0UZB7fQDCyS7eXcZSEngfj+UdfJzSgZ6iRFNPLJQoxcCn2OSWYHq8xh25utBErUyYOc3xDYd0pqEkJVV//qdVcssDRpnBmC1G0KMGTj8jNTPwk/DcLUlpjXpMrrYKl8Bc+JxLY8JgPpU+4rpzgUzdA5XS/65aBnUPIOOkkKsiFw/FqRUOYZrpJfOz77weoqElFOvbnHV+3WMiSSosK9/X4XdfHtCLlofWfqRQE6+8veebbL7HmbR5ZkdzaqkmKCQzE2juQPT17WIYFW6De8/uMZnTF3crBndW89uvzCOAIF3qJZtIpbEm+Cf/0y6lwD5/+GjxJ4Xc4zFX1DHML/sOF0fKNuphu4IvA+BUZEJuK6DfCXWfeVhHGxCTyebpfK2DjdHAAstU6oApKHrzxxBmiJaZ6twFyt64zVybYMV9Y5D0w422GvEr6ODo1RCnhHPDadPLAQdK5SyjA1y4nyA8w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(2616005)(6506007)(6512007)(26005)(53546011)(186003)(2906002)(4326008)(36756003)(38100700002)(6916009)(82960400001)(66476007)(66946007)(41300700001)(66556008)(8936002)(316002)(86362001)(5660300002)(8676002)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVpBekZ1NG5naktEN0hicG1IampxZGRTRW13WnI1aXUxTVMxaFh2RWJraXdI?=
 =?utf-8?B?U0lsV25YcThIVEQxLzhOWUVyVlFiYisrTVdQZ2VFdlBXWmVhbGRJNk5ZcjdY?=
 =?utf-8?B?QXhIZmNDQ2kvdUVTeDdTOFpHaEMvMEptUi9iK1FNQWhnZ0UwbUZWU2VGUDJw?=
 =?utf-8?B?TzVCQWRhbCtKYVZiaHVtSUJpTnhCdXREb1RPUVdZSFlrdkJCNGtWcWxzS29D?=
 =?utf-8?B?c0tzVVRkSVArUU9XaGlOTndEL2tLZUI3QkFRd3Z2ZXlkQXdHWHREWksrWFZQ?=
 =?utf-8?B?RVVHOUFIY3ZHRyt3cHZIWXlmZlNYRGN5OWVJbkdtb05Ja3JUTDRPUm5iTll1?=
 =?utf-8?B?L2FhVitna0V1NjdJbTZGbU9CSGh5S0d6cXlLUXJVL3BoTElMSi9EYkJTRFhs?=
 =?utf-8?B?UUlJSll3RW9VajdrcEEwZVRSN2l2OFpEWXRhMWtqcy83RWlPMEFEbEVWWmR1?=
 =?utf-8?B?MldrTlcvdFBqQ3JaOUFOUWdJM2VyQ0JEWkpXaGttR1cxNHdKMy84U3k2bTVz?=
 =?utf-8?B?Tm0xaDRpaDlxdHVHTUdhSjVQZ0kwMjlNaDMyODkxSUJ3bEE0LzNSM2VSZDdo?=
 =?utf-8?B?RmhpMDNzSVN1cEp3bFB0cDM4Ym13emVTWmdnZmwwSlZYRGkxRC9LM3h4Qk1Z?=
 =?utf-8?B?MWxzY053ekpKeExvNjRpWWdvZUFjbCtjeTdGZHFQaEVpbVc0VWhYZmNvbGUx?=
 =?utf-8?B?RUpFeWxia2I2dVk3bmZneVNNVytWYnJsdDYvdEhEamtyVkdOSFpKaG8vWmpu?=
 =?utf-8?B?N2MrVTk0cTFOeHBOZlJYM3ZZRXJmZThvUzNVTzUzaVVaYUg4THlmeG4rb3Ex?=
 =?utf-8?B?NkVreW5ZUEI5amxWWWZHWmdoczkrTTZTeDZMdUUzQ0Q0cTVVaWc2VjYzNXJH?=
 =?utf-8?B?UnNwb2xlaEJ5RWVUK1FGc3FEb3ljQlJXbmJ4ZitNNTlBbEZWRmRUa2FzcEQz?=
 =?utf-8?B?N0c2UWdzS09CTjZTUEVFaGdoSjdjQ2c5bXV4RFBNaEltVnRaeVpxMWgyZHQ5?=
 =?utf-8?B?VTJVNzZtQjE0TzhVSnJaNlJKVUJKaUNGcld2YUI4R2ttVHcxdTRnRmwwNXRV?=
 =?utf-8?B?MmJMQVdPS1BNZ09ZV2d5S1V3UFlPdVE2b1RlRVJIdVJySlU4S0FBcFJ1T1FO?=
 =?utf-8?B?MUpscTdHZG41dTFoNGRVKzhZQytYQXJnZVVGSGM4VEZQUWk0WEZDZWpmZzR5?=
 =?utf-8?B?VFdsQ1luNWJWb0JnUCtZcFZ3d0E3cExLN1FWT1pVOFRDS0ZFVDM1Z0loOGxi?=
 =?utf-8?B?cElBaWJvODZydm5DR1NXMWdSL29CQ09LbHBKdFQrc0ZMd1hIWm5penJtQXhI?=
 =?utf-8?B?a1VwelQ0cjZKYlNaSkdDc3hWajlsaldDRFdQSG1YTFRGcDVyaHEvTWc0M1JF?=
 =?utf-8?B?NlJTODhQbTMxZFMxVjhQVzNGNGp5WWVoaEhKWHhjQWxqNVAwN0lTMUZjR0lH?=
 =?utf-8?B?QUFpZWNPUE9TRERjWGU0djFOWmFSbE00YXhnOWRHVU4zTW9XbWk0ckxYd1NE?=
 =?utf-8?B?N1p1OTd3czEybkpWK2FKaUk1NVdUdnBISzRSWEVYQml6S1VqSW82NUFudmh5?=
 =?utf-8?B?Ty9mWU80b0didjFIeGRVaHU5aElCZk5zNmsweDE4a1FKbzU3dmZ6YU0vMkZm?=
 =?utf-8?B?MGtSV0dnbW40TllHQnRGdCtoM3dCZkNVUzdZNlQwekcyMzBKVjFhRlU0Nmwv?=
 =?utf-8?B?cjk1NUdUZTRQMmpHK1ozc09CcU0zWlF3S3U5OCtQbjVzS2N5YU15b3dHTmc5?=
 =?utf-8?B?Yy91UUZNbTVYUk1FNnpuU3Z1bTdYamVaVUNnQkdXWXB1bXVBb002QjNOSnBY?=
 =?utf-8?B?dVJ0TzMzb3BHalZTRTBQOHlRcGg0eHgrZ3FRSG1UelVpWVlWbm9mSktqNnFV?=
 =?utf-8?B?eWhiU09nenFwMDUxSGxKNk0xTlNoZ09yTTRvZktQQ1o4UXk1WU12d2p3b21B?=
 =?utf-8?B?RjdIVnBmck9sb3hid2JBVEErczdkQUdvR3lpWlc0cWFhTlBzWEZjQVhxT3h6?=
 =?utf-8?B?TU9ITUtkeTRoQ2NuQ2pvbFdFOHh3WkNuYmFJOTY5cW9acWtTTlYxbSs1ZVk4?=
 =?utf-8?B?SGdQRnF0WXpuT1BsTW5wR2t4RlY1dy9IS1RsVTU1dU9YQWRiaWJ4d2xYZ0ps?=
 =?utf-8?B?b1VoUGNnS0pSSVpMUmVsRXozeVRuVzM5YWhTclJkRjVMaGhKY3RNZnVzcGFH?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	k/fqHyJi6CkYvEPDf+hZNuitVUU2+uXSwWfexHXk0uqvxNH7ybEa6HhdhWVNw5Q57DvP2ZZ2o5XnOKYAg4Vmm34qfy8SEnvfM5Ob83yjBpnbPG0i9wspSQW5W+GMMPeU+C0e7x8SWTB71HJyalx/EasptpwjqUD1FO90Nn03VRsK1kLOlphGvyiis4jmw1fOVRLiOnuv7fWQ1hbN7T5/WKOUu4vB319FFohQW06gWTczFOgu9eTL7z01wYuNmT7QxNn6NZ2S9TZHaNt6x2shcJR0W3DWTTr46BfD8DIn3vBmefMFyXCgG87bW3AUqtaLxgrcjJJEHGPjP3vh8SZxWEWY1tqZDgLCMA+6glZ9ZtJ4C/I4Jc9Ll7gZWLi5XNKcZh92KXbD27LGM9QtB89HpdkAqGG26ZN1KNuGg1QpoIQR0q1SiY4LR+fZ22e7aDZL2/V/w08ibGbW2ysH7ixJD31al/RIw03WFHcBPytxTLSsh18ZWpwLSDVhthOR+ccDxIXrq75bjeaORxCkxrKt4bpacLgo/CWUqvWAKko0ijMPkNyv+i06o5ecngSsZQB3NB7KomJBmEdbZsR4whP7mRFEXBWGRgILrV0pwmxSXKOL+yrv5qWwKXx1+zSlJ1zetWgwhe76fekyb4C0NUlzT1NcmBh6ZN1ojCGwJCqA8NmFrLwI6QL7I1koO5FVbfA5rgS2vlejPDOLZqlwKfXGG3cXjVVMazNF1vF5RDdba3c/v18qLloSJwbB3DO9KduHDu19n83FZOzlBzoFZuYNieJ3EzC53wqQ9P5TzOqjCEx++TVdnc0BtMx3pSrbulAf8D1EJY/ZPlrVezy0p+ForQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5888a7-6200-47d1-83b7-08db560cfb0d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 12:56:35.7683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FUaiHx7lkqNibhHTiDDf4zL0uDtwBrwqNv12EndKuuiOTJbfkpxJVXSXafRs3lEUROahtLna8KaLOyiiId8imfwGHRdaG+JS07M8gKa7wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6053

On 16/05/2023 1:27 pm, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> Seed the default visibility from the dom0 special case, which for the most
>> part just exposes the *_NO bits.
> EIBRS and SKIP_L1DFL are outliers here, in not presently being exposed
> to Dom0. If (latent) exposing of them wasn't an oversight, then this would
> imo want justifying here. They'll get exposed, after all, ...

EIBRS is exposed to dom0.  I've intentionally renamed it from
ARCH_CAPS_IBRS_ALL because EIBRS is by far the more recognisable name now.


SKIP_L1DFL is more complicated, but on yet more consideration I think
it's probably wrong here.

The confusion is regarding L1 Terminal Fault, where RDCL_NO was
retroactively declared to mean "also fixes L1TF".  SKIP_L1DFL means "you
don't need to flush on vmentry", which is advertised by real hardware
that also advertises RDCL_NO, but should also be advertised on
vulnerable hardware by the L0 hypervisor to an L1 to say "don't worry,
I'm already taking care of that for you".

So on consideration, I think SKIP_L1DFL should not be visible by
default, and when we start doing nested virt, should be reintroduced
with a dependency on the VMX feature.

>> +    [12] = "doitm",               [13] = "sbdr-ssdp-no",
>> +    [14] = "fbsdp-no",            [15] = "psdp-no",
>> +    /* 16 */                      [17] = "fb-clear",
>> +    [18] = "fb-clear-ctrl",       [19] = "rrsba",
>> +    [20] = "bhi-no",              [21] = "xapic-status",
>> +    /* 22 */                      [23] = "ovrclk-status",
>> +    [24] = "pbrsb-no",
>>  };
>>  
>>  static const char *const str_10Ah[32] =
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -308,6 +308,29 @@ XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
>>  
>>  /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
>> +XEN_CPUFEATURE(RDCL_NO,            16*32+ 0) /*A  No Rogue Data Cache Load (Meltdown) */
>> +XEN_CPUFEATURE(EIBRS,              16*32+ 1) /*A  Enhanced IBRS */
>> +XEN_CPUFEATURE(RSBA,               16*32+ 2) /*!A RSB Alternative (Retpoline not safe) */
>> +XEN_CPUFEATURE(SKIP_L1DFL,         16*32+ 3) /*A  Don't need to flush L1D on VMEntry */
>> +XEN_CPUFEATURE(INTEL_SSB_NO,       16*32+ 4) /*A  No Speculative Store Bypass */
>> +XEN_CPUFEATURE(MDS_NO,             16*32+ 5) /*A  No Microarchitectural Data Sampling */
>> +XEN_CPUFEATURE(IF_PSCHANGE_MC_NO,  16*32+ 6) /*A  No Instruction fetch #MC */
>> +XEN_CPUFEATURE(TSX_CTRL,           16*32+ 7) /*   MSR_TSX_CTRL */
>> +XEN_CPUFEATURE(TAA_NO,             16*32+ 8) /*A  No TSX Async Abort */
>> +XEN_CPUFEATURE(MCU_CTRL,           16*32+ 9) /*   MSR_MCU_CTRL */
>> +XEN_CPUFEATURE(MISC_PKG_CTRL,      16*32+10) /*   MSR_MISC_PKG_CTRL */
>> +XEN_CPUFEATURE(ENERGY_FILTERING,   16*32+11) /*   MSR_MISC_PKG_CTRL.ENERGY_FILTERING */
> These last two aren't exactly in sync with the SDM; I assume that's
> intended?

Yeah.  I'm bored of Intel failing with naming consistency.  This one, I
was assured that the draft was going to be fixed before publishing it,
and yet...

>
>> +XEN_CPUFEATURE(DOITM,              16*32+12) /*   Data Operand Invariant Timing Mode */
>> +XEN_CPUFEATURE(SBDR_SSBD_NO,       16*32+13) /*A  No Shared Buffer Data Read or Sideband Stale Data Propagation */
> SBDR_SSDP_NO?
>
>> +XEN_CPUFEATURE(FBDSP_NO,           16*32+14) /*A  No Fill Buffer Stale Data Propagation */
> FBSDP_NO?

Oops.  I hate the MMIO vulns especially because they're too similar to
other vulns.  Will fix.

~Andrew

