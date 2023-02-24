Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B416A2328
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 21:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501571.773393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVelz-00055Y-OB; Fri, 24 Feb 2023 20:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501571.773393; Fri, 24 Feb 2023 20:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVelz-00052l-Kr; Fri, 24 Feb 2023 20:34:31 +0000
Received: by outflank-mailman (input) for mailman id 501571;
 Fri, 24 Feb 2023 20:34:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVely-00052f-3J
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 20:34:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fc75805-b482-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 21:34:26 +0100 (CET)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 15:34:22 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5603.namprd03.prod.outlook.com (2603:10b6:208:29b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 20:34:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 20:34:20 +0000
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
X-Inumbo-ID: 9fc75805-b482-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677270866;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QRujyF0JhVHzl3GY5yu72FcWYlEWv2Lil7clkS54Ypo=;
  b=GXk9AnTjaz1ZqM8vrs7Y5PW5DSWtIWMC5tf2ks5ypvfJxH/+zxc9UNbE
   wbGG+Vztn5HNKsp7lWVNxMkS9DR2R6jPbS9y9sSkjsUb0YceKYd0oRdk6
   96vD/Q2WXyWDhK/BlGVczXni24T3xY6i0CgZkbOlZxvhNO9IHniWAn3RQ
   k=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 98874056
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kJmllqOwA7kQwZrvrR2dlsFynXyQoLVcMsEvi/4bfWQNrUohhTYHy
 2QeXmvUPPiINGP2eIgjOdvj9BsDvMDRzIcxHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uV2X0thr
 /VBFCkQRQnAmPKS5OiqFfY506zPLOGzVG8ekldJ6GiDSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+/Rxvze7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prr6fzXynAN9MfFG+3uFninaV7T06NDE5C1Tn+tCnqkK3RfsKf
 iT4/QJr98De7neDRMTnTRS8p3KDoRc0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSMa5/HzrYd1iQjAJuuPC4awh9zxXDTvm
 TaDqXFkg61J1ZJUkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:mN+J+69KNRrEUenr/+Ruk+DxI+orL9Y04lQ7vn2ZKCYlEfBw8v
 rFoB1173TJYVoqNU3I+urhBEDjex3hHPdOiOEs1NGZMDUO01HIEGgN1+Tf6gylNyf+8NRc26
 AlWK5jD9f9ZGIK7/rS0U2VGdcn+tmI9+SUiePGyn9xQWhRGsRd0zs=
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="98874056"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTXF8CX/a2TkkEeYnWhKJTNRfR9boGD6P0py9KcYlwooRuIc/9DRu8kDH2Mj8TnfhIRloqJ0Ft7ZD4id6CfYnkRmIbuzV8qqvjHtWL5J+DzF+LFs3H5Xsi02oofcXxAUM4OHC4ZPBuHQZyF24ck/Dlp4vJ5E39eCYi/jiSjMJxkky2E/4TkgHOFdzaXLNGaR65FpcOgqtvwwz6wKG0kjmmyyJM5pjmzs1PK4ahK6U8i8tiei6O0k8CyEpqnC/bOXL5Z0loXVmKLFfCQ4fLUBjwWeYfECXbQGin/FSkx1sEGjL468ioGpa8sgLONjyfwKAT4++6TPZghCjCh362CaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRujyF0JhVHzl3GY5yu72FcWYlEWv2Lil7clkS54Ypo=;
 b=lnKEc9d7lZvadZrrkHLnWm+QjjGFTndTmA0GrNOUpCDP564iDYcwYHV3IF+Cb5eJQFOw8tcbJO2slENyrCsVZ8aWmkcqRygqJ2Ec1dJgBNY7sc/CD2uqHhk16I3qs+iZwdVXlGoBxOBGYBCnRpnnrno028GheCoWRQmdCxVxAnHgGMBE7gZgGpu4zNWifxhRGrBDqy3oA8VkBWH7uuFQy7LRROVttDmWDnAlvkHISTiwaaMonXXDhNIYskatlOLa1yrfW7/ru1GuWFm9ZCZluM7VIIzAL3H+zgVWKkRjn7h65JkA47l0YX2HxwpgfBPbaPPYKVd4Pdx37q4KaYrKZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRujyF0JhVHzl3GY5yu72FcWYlEWv2Lil7clkS54Ypo=;
 b=bljaBeZ4HN5S7/QWeKk7n1B1S5Z4njvGAp+Ycwdoa1EatBPdl53GrzkfrrNmSXBjVucA9mH0m5WZQVD3o/UljPdQYmirrcXR0ztL5B9OeMGdmnzRa+ILPgFgbAb/o1V//C8c5gL42dfpdHkx504lomK2Gu3Qs5nVJWDLOTxX5I0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6dcd2528-3ee4-6fba-b1b2-41fb1a552033@citrix.com>
Date: Fri, 24 Feb 2023 20:34:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 05/14] x86/svm: move nestedsvm declarations used only
 by svm code to private header
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
 <20230224185010.3692754-6-burzalodowa@gmail.com>
 <2c6f4132-9c75-767d-1b98-dca1527c2b58@citrix.com>
 <e4262b99-fb13-f58c-d6a3-972fafa790bd@gmail.com>
In-Reply-To: <e4262b99-fb13-f58c-d6a3-972fafa790bd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0152.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: ab7ee8a2-f300-4317-5e74-08db16a6816e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MiIZu2Tx8rotexr8Vf8e6BZkgLw8xFt8iP8v/ENPx2yleZAa21cjHN4LdFVnKoLwv2Wv786HWJScYe/La7K1QCeRc38Xfg70HwJ3CrT4KcSDVrGueJ5T0gs6pB35wQb/XWe+OEbmRzfPA7OOtnCYzAEhSx2XLRIwCvaOq41BT1KNt8+98B898zWfuphN0Hnk/dkI03UrJMg6NpZRYFvEL6qLIrjOULADeNphc5tBFiVhvMbZ8lAP9nBFCxnciuBgTs1kkeDGcTeKqbJE1UfTqIpHtAVxhIATW3ajpE9J0/vKAztFN/0v2R9ht3EyKS/k5Hyci6fHFiTYt096VIy2p7MhModBVzFypXfKMElWO6LnITX08JhRE8rI/a6dZB0tgAxaFdx97h0SFarWZGLc+9tXoqvd+UvvbdTXKFzISqHz3xhYeLoUkcmticB0PB8DhRI6I44Gfj1EYsdLIWoVKkJZYhkMnZ9F5/HIDIa+1qz9B8RuCcQkfPqRpRoLgzfA31pk1dPMscOe1zu85078U+n79ivuBxbT4PrsimifZDr4zvv6HH17fsXJjHzeknrqwJ1YH9GMUQOETWb75Fen46rPnXcNICLNeGqNyUOyEMaU19CRqLiQr9LfVklRaqyaYZb0I0BKNpxALZvaPjxFhEehmTa0o8J7wXF0Ir7wh1OZDLhsXPzK1EgMONEUhBNUPI5Z9VvXPFgoevRLMu9c0S3+2j8mE7R6Z8SbbUgDJH0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(451199018)(31696002)(2906002)(82960400001)(38100700002)(86362001)(31686004)(2616005)(6486002)(53546011)(478600001)(4326008)(26005)(36756003)(186003)(66476007)(66556008)(8676002)(83380400001)(54906003)(316002)(66946007)(41300700001)(6512007)(6666004)(6506007)(8936002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVRSTnl1Y3luSUdiaDFBNzZFcXd4anpiUVNGdGp4UTVHOHF2djRVVmJuWGYy?=
 =?utf-8?B?ZVJETytlQTBCTlhmY0UwQTlxa1JrM0pNekE5ZnFzT21iSmtpYTIxclNZTWxo?=
 =?utf-8?B?Ynl2ZEF6Z2NEU0Nvdm13TmVkUkpUK2dxMzBDNTlETnF4VzF6d2hmK0Nhdml0?=
 =?utf-8?B?VkMvaHNPRVlSV0p3NUxRUS9PWmFiV25KVEtRSHlZY2kyMlJTWW50R2JMbm1P?=
 =?utf-8?B?L1FjYUN5VGZjcStKMEVMNHZQcitjcEJyR1VxWWdDUUk2RjdPMWxRQUlDenNK?=
 =?utf-8?B?LzBKRE1nNkhXT0ZvSE15bk5SWGg5SVAvT2lyTmdJV1p6Wm1DSmxYR2dIOS9t?=
 =?utf-8?B?RUdUOFBCc3BUbGdsMVd6SUVFTm5VUTRBeEduMHloMlZRa3Z4cDFJSmYyeHhh?=
 =?utf-8?B?WDNDSGo4K1E0Z054cHptUmlNSjF1RDdLc3RRUTBEVXgxdkFmSnhpUzV6eXhn?=
 =?utf-8?B?Y3Z4c3c2OUpudERudytZdkpJalNNd1Q1Rmt3WTF3ZkZvVzZUMlRnZUZqd3NX?=
 =?utf-8?B?eWlYWmlzTkVUNVNaZjFHc3RCTGcySHl2OC9SeDh4NzlrZjlMQXAvQnV0N0hG?=
 =?utf-8?B?YjNSa1NqOU5udUNOUXlYdzg4cUNCQUdDU0hCblhBVDdlWU9ZWkRtM1JZZUE2?=
 =?utf-8?B?SEQyR2F6cFBzTWJPYXRWY1hNYkEyREtiRUhHZVVIeldRSDd3Qmhub3hxT2pT?=
 =?utf-8?B?MmRJOTh2WjM5bGd2emhlTmIxMkROYkRpc29wWGFoYkM3LzdydG1VRVAwR0VS?=
 =?utf-8?B?T2VsNXhHeGY4cHd0L1poUUpuMzFoSTdHN3p0NWtHTEI5b3VwYkxUdFZqQk9r?=
 =?utf-8?B?bTAyaTRIZHEwUjMxNENzZnlxOFlnYkhUeVRZV1gzTDdTMGJjVkpQNjdNVlZz?=
 =?utf-8?B?d2Y4S0doWHM1WEp4TTc0NnRYQkZLQXRBUGMrck5hZmlUcHVEdVhscFFtanRD?=
 =?utf-8?B?VGV0L1VGZncxaVRRcVUvekt1aGJmZEJnL3ZHZlVhdDN4ZGVMTHJsMXNqdC9l?=
 =?utf-8?B?M2VicGVGMTYwcmNiRFl5eUR6ZE8vZlN1TjIxd3VIZVErTUdOdHkyYUQxNU9M?=
 =?utf-8?B?cmtHTjNrRXpGbDk5bTZCRC8vSXlFZ0FlY2hvbVBEMm1ZMmE3N0k5VWhldWZw?=
 =?utf-8?B?OWx5RUMvSUdLdDBycFN0NUtGdm5KRng1S2tpRnh2L2JPRVU4ck9FSUl4QkRO?=
 =?utf-8?B?ZFFvUlFBZWlZT1ltTG1mem9lYWFqVTRKbVZqT3dVdzJCWHpGZmlPNUpEaTIr?=
 =?utf-8?B?SXpYbEFCcjQyZ1BvczFUbDdXYldyZ05ZV3crbnVYU0o2ZmNTOHBnWW9Vd0tz?=
 =?utf-8?B?YzJQcFV3djhoRS8xdERiREduRGg4RkwyTWpjdGVIVng5R05uZnBUYkhpNCtk?=
 =?utf-8?B?N0NVWHZCV29VZU0vTzRyWmQ0d1ppbDlMMVBrdDk4Z2k0SUFqWWl0eEtwelUw?=
 =?utf-8?B?aTZtUXhkNE5YQlU1MC84SEVqZzF5TUpzZXhxT1I1eVBIM3lBcWNYM1NYNm02?=
 =?utf-8?B?Wm9oSkJaNC9hcTYwYldyR25aVkZvZWpMM3dpQkREOEZyNTgwajJqT2VxRTFu?=
 =?utf-8?B?dHRkSHV4M1YrT1VvOTBGYzY2K2FjeEw1SlQzVFBtK1dLSWw4WE9RNWlIdnFj?=
 =?utf-8?B?c0V2VXM4VElBd3VESGMvbDVHQnErbWsyWEhQNFNURGc0eGludUdRR0dFd2xB?=
 =?utf-8?B?R2JNa1JPMDZlelNLTU5HMlRoRVBCdlY4c1doMjMzei9CcHNMVVlqMWJsVUp5?=
 =?utf-8?B?cU94Z1FCU0dHNVNmLzNLQmI1aHpkQjY3MDFaaHA2UkQ4WkY3UUJucU5WRUUr?=
 =?utf-8?B?Y3VSV3hxY1Z6blRiTkFQQTYxZUNDclhoMm5pZ2xJc0tuTzZIVVhxVS9KZ3lt?=
 =?utf-8?B?dHllSFNBV0VjYWlsMGZ3RlRSbVAybkNraXlwRDF5UTdub003anMycFdJcEJW?=
 =?utf-8?B?dXF6aTdrcmtkRHZYNnBwNHBzNW8zV0QxSXk2cFg5Y1pRcFEzS2ZzM1R0WUFj?=
 =?utf-8?B?Wm9ObkkzN1E2Z01GQ1hUbW4vVC9IbzZPRjJoNkoxZVBNVkVsQXo3WEltdmk1?=
 =?utf-8?B?QXg3dkhYeHpUVUNQamxNTkpWM0RQSE9sUUdqN2RCckdCZWI4OEt0THF5Mm1h?=
 =?utf-8?B?QnA3MitwVjYzUSs0MGhaNFhybWg0bTNOOTU0WVlNNW5FWUxjVHNSNERoSGJz?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/3mnID6HtVigER+ddIyEjBuWo7rV5CYC2nSgheX3UwghATf8E3lKej39A3OT7874Dth1+P3Y8xj4sZqcsB6XiIcc6SakfMf53KQWuE1F8t2XbE2/LzxRYrxw20qDfXFw2wiTxgHpb2mRFSZ4drU65f9B3TJE9bOibbF+63NyKNEPGemb6grpWqCzmOJ7T6Y8eO8VWVKmrNEh1cYD686BTEiqmpP9sKYihpMmruiKQgjz/B4LRZKyr4jA479FiJifYMLVB7INKu97mqLME4f6ARTbjexvVc6fYcXL/PDlRy//p5m1XprtjsZ5Ov2gnGqyI+gKJvpOTHC8oCnwddqbWGWg1+RvqtVOxqd8rR1fPBry1C4z52l3vZ2almse2y/pgktgx936XCFhzfmOXeBy4n/lVI97tyZyCK8eb0tm93RPnfFIWHRa2Gdzk349tsVRxniTfSpZUc2YOt34niD28xd6N3CDZ6YpZjWenT6AJgbJaNcHI0DvO3vS1si5acz2G7iearpkoz1+ooejm8rSixNtyyFwfhPbEDVazJ6aPwwjlvDbbTQH5N6VmF9eCJLsRp3n/RA27XzFEA8BWrlGSVypRiGfp4eV7BZGjII0SLZI+KbOxtrDvD6ywrepsdijJtZKd/mfxSjz8q3A6+joTjn7Azy2Y3Vf4USW3IqlgtM89MgSpmbDddg9XG6irDC0VkAjCeKyCDajI3uB/DpGAW0gA9fh1AcjVxDOIxzjK53mvjnsy17dhNuWI2cTe7y8e/yNDcMdRKxm9lHFUhUq73tKbMIBCVJplzvZ3nkTJGIQ4Ty19Fo8tUlWQBnHLXJALE4mkNRdeM4zLOOZvmi1qe/2/HANCNeUZhGIV9EFoQ4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7ee8a2-f300-4317-5e74-08db16a6816e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 20:34:19.9151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RrCy+OQJ6cZollD3gg/s65/R9KvQW6d7UTIIqhvuvQe2MN+lK74mbYf0L9sMDMAeVFC3YkfWJgmQsZOc+FC7kct3OsGPacv4fZsr34VOfHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5603

On 24/02/2023 8:28 pm, Xenia Ragiadakou wrote:
>
> On 2/24/23 22:12, Andrew Cooper wrote:
>> On 24/02/2023 6:50 pm, Xenia Ragiadakou wrote:
>>> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h
>>> b/xen/arch/x86/hvm/svm/nestedhvm.h
>>> new file mode 100644
>>> index 0000000000..43245e13de
>>> --- /dev/null
>>> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
>>> @@ -0,0 +1,77 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * nestedsvm.h: Nested Virtualization
>>> + *
>>> + * Copyright (c) 2011, Advanced Micro Devices, Inc
>>> + */
>>> +
>>> +#ifndef __X86_HVM_SVM_NESTEDHVM_PRIV_H__
>>> +#define __X86_HVM_SVM_NESTEDHVM_PRIV_H__
>>> +
>>> +#include <xen/mm.h>
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/hvm/vcpu.h>
>>> +#include <asm/hvm/hvm.h>
>>> +#include <asm/hvm/nestedhvm.h>
>>> +#include <asm/msr-index.h>
>>> +
>>> +/* SVM specific intblk types, cannot be an enum because gcc 4.5
>>> complains */
>>> +/* GIF cleared */
>>> +#define hvm_intblk_svm_gif      hvm_intblk_arch
>>
>> I know you're just moving code, but I simply don't believe this comment.
>>
>> This additional delta seems to compile fine:
>>
>> diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
>> index dbb0022190a8..111b10673cf4 100644
>> --- a/xen/arch/x86/hvm/svm/intr.c
>> +++ b/xen/arch/x86/hvm/svm/intr.c
>> @@ -154,7 +154,7 @@ void svm_intr_assist(void)
>>               return;
>>             intblk = hvm_interrupt_blocked(v, intack);
>> -        if ( intblk == hvm_intblk_svm_gif )
>> +        if ( intblk == hvm_intblk_arch ) /* GIF */
>>           {
>>               ASSERT(nestedhvm_enabled(v->domain));
>>               return;
>> diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h
>> b/xen/arch/x86/hvm/svm/nestedhvm.h
>> index 43245e13deb7..c7747daae24a 100644
>> --- a/xen/arch/x86/hvm/svm/nestedhvm.h
>> +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
>> @@ -16,10 +16,6 @@
>>   #include <asm/hvm/nestedhvm.h>
>>   #include <asm/msr-index.h>
>>   -/* SVM specific intblk types, cannot be an enum because gcc 4.5
>> complains */
>> -/* GIF cleared */
>> -#define hvm_intblk_svm_gif      hvm_intblk_arch
>> -
>>   #define vcpu_nestedsvm(v) (vcpu_nestedhvm(v).u.nsvm)
>>     /* True when l1 guest enabled SVM in EFER */
>> diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c
>> b/xen/arch/x86/hvm/svm/nestedsvm.c
>> index 92316c6624ce..1794eb2105be 100644
>> --- a/xen/arch/x86/hvm/svm/nestedsvm.c
>> +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
>> @@ -1247,7 +1247,7 @@ enum hvm_intblk cf_check nsvm_intr_blocked(struct
>> vcpu *v)
>>       ASSERT(nestedhvm_enabled(v->domain));
>>         if ( !nestedsvm_gif_isset(v) )
>> -        return hvm_intblk_svm_gif;
>> +        return hvm_intblk_arch;
>>         if ( nestedhvm_vcpu_in_guestmode(v) )
>>       {
>>
>>
>> but the first hunk demonstrates an error in the original logic.
>> Architecturally, GIF can become set for SKINIT, and in systems where SVM
>> isn't available.
>>
>> I'm unsure whether its better to fix this up in this patch, or defer it
>> for later.
>
> I think this change merits its own patch.

Yeah, it probably does.

Seeing as you've reviewed my two alt patches, I'll commit some more as
I've already resolved the conflicts around adjacent headers.

~Andrew

