Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A462A6F1812
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 14:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527304.819788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNIU-0003s2-1F; Fri, 28 Apr 2023 12:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527304.819788; Fri, 28 Apr 2023 12:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psNIT-0003pK-Tr; Fri, 28 Apr 2023 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 527304;
 Fri, 28 Apr 2023 12:33:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CzbF=AT=citrix.com=prvs=4752babc1=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psNIS-0003km-J2
 for xen-devel@lists.xenproject.org; Fri, 28 Apr 2023 12:33:56 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id efe9e873-e5c0-11ed-b224-6b7b168915f2;
 Fri, 28 Apr 2023 14:33:55 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Apr 2023 08:33:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5819.namprd03.prod.outlook.com (2603:10b6:806:113::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 12:33:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Fri, 28 Apr 2023
 12:33:51 +0000
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
X-Inumbo-ID: efe9e873-e5c0-11ed-b224-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682685235;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cRdkIQCG4dT0BZ5JT04N1f1IEKk2pM21yKZ+abY5WEY=;
  b=PCdkrvs6mrWu1DRx5DvVD9bQzZgOdHieGdUWLsuNsZxVFcmXtzxxZsMl
   iiPBNsrJkss2InFun9pHxRYULnZlQVKy3g46VXhdGfj7DaZtcHkck46PR
   JSzj3Wf5ySrrOLqKGQj4mUOQi54icZGTABwL6vctR9yzSFbuJPwPFljJF
   o=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 107103674
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/KJc86g/Mg9albtM4+1EsBbmX161VxEKZh0ujC45NGQN5FlHY01je
 htvUGDUPveNYDbyfNkkYYyy9R4C78OHm9NrSQVppXszHyob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4AWOzyV94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ9F20iYh+crdiamoCrW+g8tJUbfPH0adZ3VnFIlVk1DN4AaLWaGuDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluGzYLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnr6Yx3gLProAVIF4ndUqanvKVtlSddsh+K
 mkWvSkUjIFnoSRHSfG4BXVUukWstxoRWdNWH/c9rh+Ezq7Z4QGxDWwDUzIHY9sj3OcmSDpv2
 lKXktfBAT10rKbTWX+b7q2Trz65JW4SN2BqTTAAZRsI5Z/kuo5bs/7UZtNqEarwhNulHzj1m
 mmOtHJn2eVVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:wKQr2Kwac9TNPpCAqKijKrPwPb1zdoMgy1knxilNoH1uH/Bw8v
 rE9sjzuiWE6wr5J0tQ++xoVJPvfZq+z/JICOsqXYtKNTOO0FdAR7sM0WKN+Vzd8iTFh4tg6Z
 s=
X-Talos-CUID: =?us-ascii?q?9a23=3AmDd3zGt1kJ+RlwGZHZR5lbmf6IsATSDywHjPCXW?=
 =?us-ascii?q?UU1R5WbzFew6oqJt7xp8=3D?=
X-Talos-MUID: 9a23:0OTFFgkwBcXc6QueDI/9dnohBed5wpulJHwXsrgcmsihN2tzARa02WE=
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="107103674"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGFDx/lWdvjNsatouccgaRvVTZGlF2BDE9f8Vsaax396V7A852Fike+BI4IKrF44X/l2/zMxgpLu3XmPAol+LMSpYXS6OtP0EvxOD5eQUeAwbyPJb2G3z9uBtp1DQTlhmM9jRiUZwmgBwywUadXz6Oj2/kUM4/evbDXRv7iIjj5YQQdPzEdBuUX0n+Pl3bm7WWngbLrrv5hNdYwdPD3h8Ft3nD5ZOK7Uoi6cx1QAyg7DyfFSDyoNMlZUEyPMzy9kYwGdhw8qGcmDtB5At24aoIszSb5oipPl6lv5MMxXkv70TkT4555ojZdxRHHNrksK/h+XvE5a+gZUggn6IQumPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOB0Ijva4oi5TiSj74GAVfoKZMQqT6eHBNEr/tiIN/U=;
 b=KMheG4jeNWtePIl44sKM4GdocCzWvDjL/m8dM7OwpUH/c0HHkWYmZip0BO3GX2VVs85PYR1aqcZiv3csFTO6G9FdHeuY+0LEXTSIgpfiFrbMrSqFpKQRsRcTlYo1h/dPg+vtDt0Di7ayEPP90jcLuC89sMazqmuzHVASOngM/FtabwnPN9tlfnhN+TNhamcXf6YFVW4w/4TzRusi3fkTnvjllhxsxTp1rhC5ZXjrTOZodMiypp0ZrYHklA2WXTh2lz6hTHZbhqryzg1coqLFBxx+sBt3iOelp5eJJ8wSY2S5veiiMe3HXEJDxDqJE3I8FDWkQb8WoL8Qx9vMuGyB7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOB0Ijva4oi5TiSj74GAVfoKZMQqT6eHBNEr/tiIN/U=;
 b=Ba++kDtoiUxsaYaRpFUKtaq+AqPT/9OU9WgZ/a0YU1Aocik0oljPokYVZUhxg+rJPZ5OuGcZ3quBG/tuI4jCoZuo+q3Ey5LdZeLuvVIpwfAY3knB4Z6PGlrWh2hDSdyaKmekm4xAB7TJDyWg/k4ceyd5iCea82IbCoYRGQ9qpXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <91438b54-df82-f790-7154-c76feea90f18@citrix.com>
Date: Fri, 28 Apr 2023 13:33:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/7] tools: Refactor console/io.c to avoid using
 xc_domain_getinfo()
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230428104124.1044-1-alejandro.vallejo@cloud.com>
 <20230428104124.1044-4-alejandro.vallejo@cloud.com>
In-Reply-To: <20230428104124.1044-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:339::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aae1e69-7769-4de4-d46b-08db47e4d217
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LgstE9+GwJQ4bbY1KfkP/Xa4wBYxJzUH1igQxw6h6uidDzxCW5wEPIdWeT06sUmomwlMj5wEu7ecDIq/IyY19k3cTvtDd332vIja6YV1BUtYoP1SPkDUUyhpzvExY+MrGgTHWbxKydRtWcPEWYfZ38DcwQ+24+gNj2S6PTLk3ZJ2V8JqQtgcc/JqCaySJmYA6I+ZWerVwZJi01BcOsRgbSDhRMiMFRe0vikpUW73+xlr9bBveXrbiIKEsWNdDLCJ9AxWbA7RkAo8oErhbFWnFuojpV19Kz4l/RZbHqmz/2zWKuVPL05740XDquSqJvZOMMKGbgacinIlanVuKJ0RcuwRqZd1BaVGTIwFHHO2r4W6cIDWR6H/DNz5s/xMtdxNXhYh5q/kfFi0jMbwxPx2jbtVySIlMdu+S9rv7SichSC3jGxjBEexFhYSYMWzwvaMGxdp7OEyBeKpRbjZv0NiS5NtpwEEFwmdYIismepiV+Yertg9qovot8S4F5ooXsmRemP6xyJ1ZqvKBQkQC/v2YsZAJwCZCi4vylxGbk2fnxH8elhDGgvLMdjvFhYMBnYIYNb4HNi+Cb0BJjz8CX6yB9sSslXVxrsT85C7QHurAtKx/cYMMEZaK5AyHfK9BZ6uwXwLUXkqQlKXCoOMBNNfAg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199021)(66556008)(110136005)(66946007)(4326008)(66476007)(478600001)(5660300002)(8676002)(8936002)(316002)(82960400001)(41300700001)(38100700002)(83380400001)(2616005)(6486002)(53546011)(6666004)(186003)(107886003)(26005)(6512007)(6506007)(86362001)(31696002)(36756003)(4744005)(2906002)(54906003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S29iWTVyRlFyVFRlVnFsLzV3TVB6ZWhabEhLL0xNNjMwQkNlMlNMRkZ6Zm5q?=
 =?utf-8?B?Q1dpOU1WdUxmcmdld1QwMTBqVnZtaTQyYUNqbTNrcHJGZWJnVjREdG9jSXU4?=
 =?utf-8?B?NU9kZlE2TnlOTjNORlFjamJhQThhaUNMdEV1VlNvcUhQUjhuZjZHVnJYRVdO?=
 =?utf-8?B?cTkyWWVETnRSWEVSUi96Z1JnN1ptSUlvazVudVU3a3E3SkdrVXBKdTVCaFBN?=
 =?utf-8?B?aFlTd2h6OHMwcjN3b2RndG1iUnFIdmRZVzZTbi94NlpYOHBvZlo0U2pTY2pQ?=
 =?utf-8?B?Ly9Ndk1zTkRDank3M2NiaTUvRzlJYmgwYXlOZTRMZUFDby9TMXAwOE9XUVhY?=
 =?utf-8?B?N2hZWEJKeHFibDBDelorNHRNZ3RrSmlaYzN5bEM0R3RhdkhCK1hFQ2Z1LzVp?=
 =?utf-8?B?a3hhaXVCL0NHMG5XRjUxOUpJQksyaTU5UmIzckxZR0Q5eDVWM0hnNXFYdEds?=
 =?utf-8?B?eVBUa1M4TytEY0Z1MDk3SDloT3dOb0REMjI1Tk9YWVRYbzZFU3JMNzQ5R1JG?=
 =?utf-8?B?VThJT1I5VlFXOG9wbVR0NzdBb2JGSkpUMmpTOVhPQ2h4YXVKTnlUZklMaW9x?=
 =?utf-8?B?aTNMTVZmRXJESkNRYTI5aWZROU1PUEo5eVEvVzk4UjRxYXpyN3lBNHgyQmdC?=
 =?utf-8?B?QUJMNXJqdkxwOGhVNHYrWndGS1pNcWVrcVFmaFM0cVpkeDlvWHp6V1JFZjN5?=
 =?utf-8?B?VzhsekxWRUF6S29nSTdsc3BtV3F5clFMZFZta3p4dndvMkRpVmp4cGlBTXRN?=
 =?utf-8?B?NzBibVZVZlVaOUZNd2tSUnpSQmFDeHhtd2EydTl3VEZaWmQvTmtZQUFqMStT?=
 =?utf-8?B?MEs3dTZ5MUNJbTZFdGdXK3JjOGVWTDIvdXpiRldNMDBmRVZPTmNwbkxVMGxn?=
 =?utf-8?B?Mm05ZUxwaHQrZHFPWERGaUpiS1Y4Z29KQ1RiUENNWEcwU1VBZURPOG02SDIy?=
 =?utf-8?B?VGpaeDlnR0dhaEFNNzUyRlhwYWFBeWFvL2I1WHdoRW9qWUhVajlGV3d1dnhN?=
 =?utf-8?B?LzRGQ0lwajlWWHJXaDF5R3hlUWt2N2ZmVk9YOE5jWEJUbVlEbE51RFVDdlRF?=
 =?utf-8?B?dlNLQ3JtQWNIQkhmK1NBOThHMDRWdkljcFZBV2F2M0dBQ3FqWC9waTN6YytB?=
 =?utf-8?B?bXBKQjhnMUdoeVc2TWM2U0pJejdBcUpiVzZUNWtyWmI1QXZCdWlDMS9GQXE2?=
 =?utf-8?B?c2kwWlh5UlI3dVlZMkoramRCZG5leEpORFdGU1czdTN5MGMwUWd3eVRnZ1Nt?=
 =?utf-8?B?dmdpcFNDOFdQZFcwRzcwbEJaY1dwdGVtMlkzaUxNMFJzUnBJWlowTXdaS2xv?=
 =?utf-8?B?L1RYL25od3RheFQ0QkR0T2pFQnhKWnNNVDZRMWpreVJwN09ZTHdSeFJrQUh2?=
 =?utf-8?B?L0Y2b1lRaXg5TitqT3cvdkEzdW5yN09FNzN3WllBSHEyUGliUDRzNVJmWGds?=
 =?utf-8?B?TnRHUEpXbUc2Y2w3REJncjJLZnNGZ1ZaT0hIdUdTeWJGSEVmcmJaWG8rK2gx?=
 =?utf-8?B?eDJtMWEvTVRGbXZGejdOSStvNTBBTWEybEx1dDlFTEJGZW1XTlo5ZzBrRUE4?=
 =?utf-8?B?ajQwbHNnSTQyMUJWbENjK0grVkYxWnRBejZTQ2tQWnNyQWNlNWlyYmxyKzBs?=
 =?utf-8?B?RVdQRk9KTjNZZFJ2K3JxQ2Rwa3Rzb21wL015RkNVMDQwK0JSOHowZmZYVG9Q?=
 =?utf-8?B?MnltM2trMExBMElaTS9yUHdhVU4rMlEyYVdUWGl2YkIyT1lMR2J4Nnl6enIw?=
 =?utf-8?B?RE1nN1VCN0U4U2M3MUM5K250MHlNcURvTSttUjJFNkJ1aXg0VlpCcWxrMTJv?=
 =?utf-8?B?R1dDekZmZXdjNjRubm9SalIxUzFVLytLc294Um5FaGM1V0JZMFdoSndXTmor?=
 =?utf-8?B?QnFJM25SVTlXSW9RWlNrYlowTXRBVVpab3djUFRIK0dhL3BSNnc4SzlYclBl?=
 =?utf-8?B?dzRpb052TW15Q0Fwczh1ZENTcFZFdHdKbmNnVi9hMFdjZ1lOVUt4VkpzYzFi?=
 =?utf-8?B?WXhOZmE1bzRTaXdmTmZsSEtpSmN1RXRrL2RJZngvajViSnVoR0JKVGUvQVZK?=
 =?utf-8?B?WEhxK2o0NkFhbFlQa1p4b3JEMWJjQ25SWEVzVGs5S1YrNmZoaUFtd2kvem1h?=
 =?utf-8?B?WXRTMGJkMWpYWlU5QTJaSjZZM25SYTNMdFRCbFQ2OWFLdFhVSDRwLzhHbm1M?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DTQy+qFDZE085rojjMCEwVUl21mraLP6xpbfHGjlzsHg7ZNIaYYh1GgokSgsCypv9/3TdUqWdg8v8DJn3FLT2fE0WaY2Qd8tePNpYAtGMLvLbzBtrPZ36Qy0a5CSnGwldEa6sqOFns+8zAL1eVcBevhyjJxdKFw4CjNUkQymk/Jp1I5WU6dNaxpjjK0YCnZOm5w+XK/8rFax+pJbq3Z/1OSQZMGK0W6Moex6qXsGxXSeWKr4ZNim5fVuqjpz1oyVPJUHUD6bFMf5n9qADuKjacrL2ZygnXg/htZBoCmaGy0+4sHLvQjGOarerZtw+vh9hyAkVV+wQ5QlzDPuOCLz8PCdXTqC6mS+eUrWMb/4igcipP98Ztnsw7A53UDkVYzy9Zc85YL+t/rDKTqSI9QQM+2wBW2EaAveX7kwJzO8MKgeJ9pPNwJqz9TnmhJm+hmKF46Cwbr/4mjSj0dfZVaI2J7dgPzsJmO7nHRJKvc0brZHLkWr42nD1Jp466kgIZtq0B1pqlfEIgYW5Wmc8LbJrqKc9nQwwHtxqL3jarg5B/N/QPHhZ1EUvFdvLOSc8lH4EgJMbdCMahgR1tMp9W+BtLjljRW5gkOrnnToSsbjH7cesfpCWhKDyFu1pVlhYJ4CioaA9J54Mb+0nZYNRvCeLsWVPpFTu2WvFveDAZFn24W3oTRJ7+MDJMkf1Qy784HjAuUOuYSxkyCnqB5CY9ekp+zQT3fR3lD1qPGSCscFtDjSCsIzlAROPA8xd2wxh84NVyW4FkCsFg17CrgA2vL92o4oHWOcXzSgFT8J3iVJWGXQO0fEs8EVoD3bIBv93PDyUGM8JEHB5O/SPouvm6sU4w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aae1e69-7769-4de4-d46b-08db47e4d217
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 12:33:50.9920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ufajj0jPNftsz7dhR0LpJoHRHYXFWHK//M2RMOL64GQJP0pE/voSl78w603tRlMNgKZkeAa7H/KbK8V/OnyDyaRnNm2cGQ6bbn1/2sOXghI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5819

On 28/04/2023 11:41 am, Alejandro Vallejo wrote:
> It has 2 avoidable occurences
>
> * Check whether a domain is valid, which can be done faster with
>     xc_domain_getinfo_single()
> * Domain discovery, which can be done much faster with the sysctl
>     interface through xc_domain_getinfolist().

It occurs to me that this isn't really right here.

It's true in principle, but switching to requesting all domains at once
is a fix for a race condition.

I'd suggest "which can be done in a race free way through ..." and avoid
saying faster.  It's likely not faster now with the 4M bounce, but we
can fix that in due course.

