Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C79050F21A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 09:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313481.531023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFTS-00055n-4i; Tue, 26 Apr 2022 07:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313481.531023; Tue, 26 Apr 2022 07:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njFTS-00053n-1W; Tue, 26 Apr 2022 07:19:02 +0000
Received: by outflank-mailman (input) for mailman id 313481;
 Tue, 26 Apr 2022 07:19:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQU5=VE=citrix.com=prvs=10866150f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1njFTQ-00053h-Vq
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 07:19:01 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23359098-c531-11ec-a405-831a346695d4;
 Tue, 26 Apr 2022 09:18:59 +0200 (CEST)
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2022 03:18:56 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB4601.namprd03.prod.outlook.com (2603:10b6:5:185::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 26 Apr
 2022 07:18:54 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 07:18:54 +0000
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
X-Inumbo-ID: 23359098-c531-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650957539;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ZaBPHFEhsIEy5z7h3TQK5CZLvSHf/Jsh4a8FdEdKN9E=;
  b=fRLab8rdwSf2QWH4b14q+1zwFPnLNmpwZ7yBskRX8+y6sOexWntagG5v
   JEU1bqWsTsJZunOSrQbCUqkJaW3cwKq/2L4na6TWO0qd0S7g7u/4wpdof
   gDtVixTq3kHJwPQa7o2ghaqlVDbhi365Jw1gnDiEO1FUFFvneIhvFDPVC
   8=;
X-IronPort-RemoteIP: 104.47.58.173
X-IronPort-MID: 69943304
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KBqmCaKUZKR/06OgFE+RpZQlxSXFcZb7ZxGr2PjKsXjdYENS02ZSm
 GcbDWzXaKvYNDbzetEjbY/lo0wAvJHTnNRmS1BlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tQ22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PBRrbWOQw13BbSSw8M4QTlHHQBBEKITrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvqRjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2CiuL2YD8A79SawfpGjL5w0s4OTXMuXnX9jaVfpOoVScu
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTiduTh1O6WtlfA
 1cJ4Sdopq83nGS0SvHtUhv+p2SL1iPwQPJVGuw+rQuLmqzd5l/AAnBeF2EaLts7qMUxWDomk
 EeTmM/kDiBut7vTTm+B8rCTrnW5Pi19wXI+WBLohDAtu7HLyLzfRDqWJjq/OMZZVuHIJAw=
IronPort-HdrOrdr: A9a23:/kifKq4PjsxZfLjBwwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.90,290,1643691600"; 
   d="scan'208";a="69943304"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ar+Nelhxf1YXlIeqkjTmja1CoxuTHljBPQFGlersq13MsCLEpcnbvj3OId+qhQ1PPmKIZ5neDg8FsmRW0gwo7brFzUkVXzkv/ZSou/pmLkxV9sBgDlXMdEUJ7zShzUttosDjHOzPQ1NJfCFpQ0Uk0rUmRKDH4pmmPqVVjkqxKz7O32NkO6zxAyq3WYCo97MEvIu4fDbqBm3A8dONP0AJGwWpsMbeGTmNvU0WxwfCuAetO11KGaBgMfanCthfTSoqzThcWMz9NCSz+GsTA+7nB2NuMZrOc30/N3EWabbMOt5rC5PWr72nPf+vjzZPw9wlxkydOGdLSpveZrWVay0ZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VA7SvFpQMmBLN71emlYqmPV1v/s2k3j7xy4Z5BhQiY=;
 b=JC0GIdcZk/lpgh3XKHECTeptf9hVF5UMaKAr5gl0fYUT8M/CvWnsv+0bWjTvmonCzFLjdJeU/VLANrap8uG2ZNj7U0JEJSW7wgWdTTigkXwStCDHnJRP3nLh64hwTwdaQSE6L0ybxV6e5AXZEPcDu2nQCDWwSDfHNASeJ3Y8xvYYAMVIX6+rrdXRdoe0fnvrZes2XMlEeHlAzkdlh7kQG4gtQso0YFnHzYrYRJ2GnVr6zk7BeB3LQ2IYUHZeCOma8fgzaK3TM1lKIu09aAW439rrMdIXdtYvVcP7U4XmUw7O9sqF6IRSyv7HOC6AConsM878SmjNznWbwM7cneG9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VA7SvFpQMmBLN71emlYqmPV1v/s2k3j7xy4Z5BhQiY=;
 b=jDfjIXQ3DuvlA1TI/lX1ZGsaCLFVdjft6bMo8X1JMumYTMcpMhqjJvvsVcZSB0o3gV2uEFQGfwPgLZdJQ2iWGzDugl84yhTHco0ATucmwH8t4hnfWfpLDDH91MAByuIAyIBlzwgwoWaRAPlWtbU/QoXVGqZgriyLIdAQmrI5JCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 26 Apr 2022 09:18:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/nospec: Fix evaluate_nospec() code generation under
 Clang
Message-ID: <Ymec2P8YnyYA2XUO@Air-de-Roger>
References: <20220425175603.21086-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220425175603.21086-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: MRXP264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189398b8-848f-4b8d-d6b5-08da27550522
X-MS-TrafficTypeDiagnostic: DM6PR03MB4601:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB460170F266DD2A5415D6B5208FFB9@DM6PR03MB4601.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0As7rgvYtkCmf1oyFNjJSL+hKa1jwt0ghgeDH13ysVHxruM+f7f+Q1izVzYEVjicN3Yutvicrzay3u092g3m6mB31rIhLiGcAHoKgiCSKgUI90d8ksOnAqs/enta4BQ/x5S7zao50GrWvZCtYoGWnmzkVIUnHfSlfOKk0eMcdZSFHcTmS8asrkk14GkPpl04FdGWDoIAoprfHWdgKKIqNrMoAiIEEeNBotZ6Fg33U+8XDBXnlM1/yN8oqcUtZj1hBFunRt/YiF1PeJQKFbd+NkFlk+fKUqgyYeoEmuIuSCVhOLXpoYHexaxmnZol9f8uz572UhNK8qVk6zkwuS19WUisvJV+tZF5U06GtA8/noZk3VqJ5kCkoI9XS5tnmMU33qrs3OcKR1gf66wDeGpvj2HgK6RlunFjUUR7RSHRatDFmfo90RHsiY7Pc7NiDTqtHl2T82H/nzoZsatdahUVacsn+tmuO91ZryqNRwe80Lt3bUvwTTxYRtVuSNymo5lPU9PQ1x8Pfa8nEYEsScIKk201OsPu1qx7Z7xDUs7d9fAqJGf96CQVgqrjUXyU4Kjzji3jeuKvWTRK07GNIIaBbF6oIFLCFZy15z6KYvnWEAAkbm9aOsmx8dNDJth/c9EGeV91MjT8J0DA7SS7cKpGKw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(4326008)(6666004)(6862004)(6486002)(508600001)(8676002)(66556008)(66476007)(86362001)(82960400001)(54906003)(6636002)(66946007)(38100700002)(6506007)(5660300002)(2906002)(85182001)(83380400001)(9686003)(6512007)(26005)(186003)(8936002)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFIbzJkVEVFdm1PWXZmV21hdlhnNU11Zng2U1R3b0kzSkJ5azNUWHRWclRJ?=
 =?utf-8?B?YjdiVkVhdVJ2am1BQ28ybGVYNk42bWtFSzNlMnFaNFVFdm16V3VCQ2ZNZzdJ?=
 =?utf-8?B?YWZIZloyN3JHTkJRUFpNcmtwWVdjaW91U2dMQytJSVhhY3NuY3NyYmFiMVBH?=
 =?utf-8?B?TlBZTFJuZXB0RnlDeWhlZzBiMVhtTHNseUhwL0VLNUxHQUZFbzBvd09ob1lO?=
 =?utf-8?B?cmovM2dOL01aRVBIYm9yc1ZYQklnVm1LWGx0MHBjWWJMM0Q0TC9aM1pUNkt2?=
 =?utf-8?B?U1UwRWhhbjQrZDI5ZTdnSlVlek9SNVNESmJURUF3L2MxdW5WY2pVR3dDNWla?=
 =?utf-8?B?b0ZGZXQxMXRUWkJ1aURIeWNNQUtBbEhqL3hwQk1paUgrYm9YQWtHR1NKNUJs?=
 =?utf-8?B?RlJ1OHVEL014bVNOWXNIT1dhdUsrS3Voc0ZKODhRRzVKQXRXOWVtbitYQUIx?=
 =?utf-8?B?WENtdmpOQ1JWOURveTBQTUZQUmk0bG9kL3VWZXQ2bFhLWXpUdUpDQTZZNEV1?=
 =?utf-8?B?Vk82dGYrRDZPMFV6ZmprdVE3blJ1QWhQZ2lTc0hzR1FtMG5seXFwK1I1bk40?=
 =?utf-8?B?eGlia0d2NWtLSEtsK3RuWDBxckY0TVBwWnZjenpvZFQ1WkpOMjh3UjNNbFlT?=
 =?utf-8?B?RjV4RzNZS1pmb3VLTWNqYkJZcmdjU0d0THdFMnh4M0FXN3RmamNqN2hnU0ha?=
 =?utf-8?B?bUhBaHVwcDNicEtZd3FYUEpFVytsYldlcGErVzFIczFiMzV1dVRFQ3FGNE9m?=
 =?utf-8?B?VXhIc1VkUGhXSHlrZDdhTkxuUUJrVWhkVnVRTkZqSi9FUFlyaGJuaGx3eFo3?=
 =?utf-8?B?YnIxeFVzeFBmMDkxN3BnclpabkVHNmI5SG5nVVViMmFuLzlickh4RjVOQjE3?=
 =?utf-8?B?ejc1WWtnQlZDbjhqbVV4QkswUjYyS2FqYlV2NThoK3A2UUIxUWh0R2k3cm8w?=
 =?utf-8?B?RExubC9oYkw1enBjL2RORnZTd3BaUXk2WWN1eDY5djdNSEtVcjEvQnF3Zlov?=
 =?utf-8?B?cUpjeElPYm1OZ3Z0QmZySWYvdWtkLzhuOUJQSnNabWxzSTR3ZVB2dnpDckRN?=
 =?utf-8?B?TDV6cXhJM2hhZjd4NW5HRUdZMW4wcmYvTUU5dTFJRUZ3b3Z2SXkySnUxWFlB?=
 =?utf-8?B?UnludGxYTGFVR204ejJLckVUZTZpTjFqc250YkxmaDhIRTZ1anFGSS9senF6?=
 =?utf-8?B?aWpzK285Z1FqeHlkbnVoemNHUEoxdFI0alhzR20zSEtLUHR4V2ZiWU82MjlW?=
 =?utf-8?B?WFZyYmhrRVhBbm1WK1hVdURaWWM0WVNBVTZ5ek1iNkN6OHpOcDM3Rm90T1A3?=
 =?utf-8?B?VUE3R0F4NVhsYVRGM2V6c1dYRGdkVzVFZWZGbEZsRkZ2SG9WdkZicVJDWEw4?=
 =?utf-8?B?UEwxSUlKM0VsYTRqVzNBdXc3U25waGdnc3RqQW5TYlJvWkFUV2tPVUNHbTI4?=
 =?utf-8?B?VEl3Y2hFTThqeFFOdzRjcCt4QlBsNHRYYTRtR3A0azF1MlRSS0RSeG5xb2t1?=
 =?utf-8?B?NDZ6RjM0c1ZBUFhrWGpTSEJWWE1Ya3V5N1BUSzc0TFZKcVU3OVB3K3hCeGdK?=
 =?utf-8?B?Z1pOMmdWRStDOEltOXJHNlA3YVNibmJyS25CSjZROHFEM2hDVyt4ZVlkWkNa?=
 =?utf-8?B?WGFEZS9MNlBSL2NXeE5rMjZBeTVWSGRrcFJPY1FPaE93RTFDUHlVdHhkK1dF?=
 =?utf-8?B?MWFKUnVNMFhNeFdSUTlydGFwZjNpbm14K2ttelQxcGhBTFh3clBwS01XRXhT?=
 =?utf-8?B?eitQL2g4ckhHWWhqai9hVFI5Uk5JSmJDbFJ1ZGNqQXF3NDBiZzk1RGhmVzRS?=
 =?utf-8?B?dDdLOWtER2tPWkZFZ3U2M1M4dWkrM2JtZTVrck5YR1VhMjFQV1hiK2pwMkxq?=
 =?utf-8?B?UGJnU1NkVGR2VmtPSWRxbFZJc3c2eHNTOGltN29jdWVnSEErZm1keThuN3dq?=
 =?utf-8?B?cW01TUhSRzdLbTEzU3lyaHEyVmJjUDM5RllrTzZGWmlRa1luN09SY0g5VDdB?=
 =?utf-8?B?cHpnVmwydlJsZlM1MWxxaloyd2JlMWdGcUF6QktTWHVvNk5SNk5FK3g2STY4?=
 =?utf-8?B?WDRFcUwrakNQT0xSc1dYclZHTWRXWVkzRWhNOTJTcWpXS2dsRFdXSFRwSzZH?=
 =?utf-8?B?dnRzN3g0a21LNXBZOHZIMit0WmloUHpRTTRibXRqMDVpV0k1OHU0S083aThN?=
 =?utf-8?B?bENHemJFTzdnRjJtbUZwSzFXWC9KZzloTEw0TjExQjJBYVFEOXlxeUNNemxJ?=
 =?utf-8?B?RG9MeXBieVMzeXMrblY1NUprMC9UV2xLWjNnTG9IYllQaGxRQWZOdisxamJi?=
 =?utf-8?B?b0RRcTdjQ0JyNk13cVQ3ZkZUM2pzY3c4UW4wa3g4L1FQK0hpNGhUZEpLVysx?=
 =?utf-8?Q?0tsUeLVoevwO3RpE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189398b8-848f-4b8d-d6b5-08da27550522
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 07:18:54.0562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdApY045z5LGE/3dI81fitPAJbzJ/qH7uQLPd5gSXvjFB0fFAun3XreR7EwPKYCEKhdhGw49G2/lDZTgAQX0Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4601

On Mon, Apr 25, 2022 at 06:56:03PM +0100, Andrew Cooper wrote:
> It turns out that evaluate_nospec() code generation is not safe under Clang.
> Given:
> 
>   void eval_nospec_test(int x)
>   {
>       if ( evaluate_nospec(x) )
>           asm volatile ("nop #true" ::: "memory");
>       else
>           asm volatile ("nop #false" ::: "memory");
>   }
> 
> Clang emits:
> 
>   <eval_nospec_test>:
>          0f ae e8                lfence
>          85 ff                   test   %edi,%edi
>          74 02                   je     <eval_nospec_test+0x9>
>          90                      nop
>          c3                      ret
>          90                      nop
>          c3                      ret
> 
> which is not safe because the lfence has been hoisted above the conditional
> jump.  Clang concludes that both barrier_nospec_true()'s have identical side
> effects and can safely be merged.
> 
> Clang can be persuaded that the side effects are different if there are
> different comments in the asm blocks.  This is fragile, but no more fragile
> that other aspects of this construct.
> 
> Introduce barrier_nospec_false() with a separate internal comment to prevent
> Clang merging it with barrier_nospec_true() despite the otherwise-identical
> content.  The generated code now becomes:
> 
>   <eval_nospec_test>:
>          85 ff                   test   %edi,%edi
>          74 05                   je     <eval_nospec_test+0x9>
>          0f ae e8                lfence
>          90                      nop
>          c3                      ret
>          0f ae e8                lfence
>          90                      nop
>          c3                      ret
> 
> which has the correct number of lfence's, and in the correct place.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Like Jan I wonder what the clang devs think of this solution.  Is
there any test in clang to assert that comments won't be stripped from
asm blocks before optimization?

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/include/asm/nospec.h | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/nospec.h b/xen/arch/x86/include/asm/nospec.h
> index 5312ae4c6f31..7150e76b87fb 100644
> --- a/xen/arch/x86/include/asm/nospec.h
> +++ b/xen/arch/x86/include/asm/nospec.h
> @@ -10,15 +10,26 @@
>  static always_inline bool barrier_nospec_true(void)
>  {
>  #ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> -    alternative("lfence", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
> +    alternative("lfence #nospec-true", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
>  #endif
>      return true;
>  }
>  
> +static always_inline bool barrier_nospec_false(void)
> +{
> +#ifdef CONFIG_SPECULATIVE_HARDEN_BRANCH
> +    alternative("lfence #nospec-false", "", X86_FEATURE_SC_NO_BRANCH_HARDEN);
> +#endif
> +    return false;
> +}
> +
>  /* Allow to protect evaluation of conditionals with respect to speculation */
>  static always_inline bool evaluate_nospec(bool condition)
>  {
> -    return condition ? barrier_nospec_true() : !barrier_nospec_true();
> +    if ( condition )
> +        return barrier_nospec_true();
> +    else
> +        return barrier_nospec_false();
>  }

Is the switch from using a ternary operator also a requirement for
clang not optimizing this? (I would assume not, but better ask)

Thanks, Roger.

