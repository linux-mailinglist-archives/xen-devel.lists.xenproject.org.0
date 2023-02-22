Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD44B69F89A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 17:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499693.770953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrc1-0001Nr-Gj; Wed, 22 Feb 2023 16:04:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499693.770953; Wed, 22 Feb 2023 16:04:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUrc1-0001Kz-DX; Wed, 22 Feb 2023 16:04:57 +0000
Received: by outflank-mailman (input) for mailman id 499693;
 Wed, 22 Feb 2023 16:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TNgZ=6S=citrix.com=prvs=410ac2269=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUrbz-0001Kt-J4
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 16:04:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a299f9c5-b2ca-11ed-a089-e9535cc0f9c3;
 Wed, 22 Feb 2023 17:04:52 +0100 (CET)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Feb 2023 11:04:40 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5795.namprd03.prod.outlook.com (2603:10b6:303:9b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Wed, 22 Feb
 2023 16:04:39 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Wed, 22 Feb 2023
 16:04:38 +0000
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
X-Inumbo-ID: a299f9c5-b2ca-11ed-a089-e9535cc0f9c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677081891;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=38zvKDkk5vqJDj8XXymqC8QaIrvQS3pO3Dlxi9Z+Zrk=;
  b=DINdOil6PUf1jjomjIQrpIApUjCdyHvayaqSJ+kklIK9Gvsfefz8OEH3
   uZLnSxe66L1LZ7TaH7cF1r0YCe6kQjkNqZCQ6NRXd50uxJ6qKjIwx11fb
   U5YlteztMqOLyXySCVdR3qugTgSngyuesJRvlXybq4D/FcI2seYrio2Pa
   4=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 97472559
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:kWe6bKoBKP+WPSdKQEgk2TYD1+5eBmLLZBIvgKrLsJaIsI4StFCzt
 garIBmOaKmIMDTzetl2YY7l8UlVv5Xcn9djQQNvqS43RXgX9puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSNNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACouNTaCxMm3+qi6VLlhpMIRHfHHMapK7xmMzRmBZRonabbqZvyQoPpnhnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3juarbIC9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOznqqEw3QDCroAVIBsOc3fhs8KntmivfNtFF
 0IP1hoiqrdnoSRHSfG4BXVUukWsrhMaHtZdDeA+wAWM0bbPpRaUAHAeSTxMY8Bgs9U5LRQo3
 FKUm9LiBRR0raaYD3ma89+8sjeaKSUTa2gYakcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnYy
 S2QviE6gLkUkscj2KCy/FSBiDWpzqUlVSYw7wTTG2e6tAVwYdf/Y5TysQSBq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gJuFmS+G8B3h44RALU
IronPort-HdrOrdr: A9a23:biaMCqoBeUFsULUMACnOPFkaV5oUeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc7Qx6ZJhOo6HkBEDtewK/yXcx2/hzAV7AZmjbUQmTXeVfBOLZqlWKJ8S9zI5gPM
 xbAs9D4bPLfD5HZAXBjDVQ0exM/DBKys+VbC7loUtQcQ==
X-IronPort-AV: E=Sophos;i="5.97,319,1669093200"; 
   d="scan'208";a="97472559"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQSqmt91haoul2dZO9LYWNK1Dwk5HD2TRgQlNg5tX6nvQgzsxDG7KtKOkRTX12iS/M1yCO8gi6nd4eYvBVyWzccd9JRl9bDplRU0zmLVTJ5XshYiQjcijZ4AmDMIkMOHFkOIIj7zc5wHVlXniSOUERMsZJ5ThT/WFaMCujlemAnPrNf0nbftMSu/9n+e9rYCeh8Nb2S/7YEOmnuWpYHj/k/jHvRg1sgJYVTK+bZLebxmR8lVNueRuzDAQBILnw9iML8OSpfFZS+Ja9yqEjz+TmobyFA5XZKM/MemvE1vT4UrLE87q0IMlGxQ/fkvHySF9V8Gk2yQxlakdC+ch+FnIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38zvKDkk5vqJDj8XXymqC8QaIrvQS3pO3Dlxi9Z+Zrk=;
 b=aMBxK/A+YMX9rTa0TJeYf8XFEWgrKWEPwSIPw3SZJ7gC9qeMwRtqRIepYcQPPwNrbTHo8pAagY188i0/a9/GENWCctvshPZxcQUAD/6FYo5R5yr6XgC/pzHRutHzec+sTyTIuiKHuYmuC4Xjc+uday8k0LnF+SW7g4DGdnIjIzQVrciXnPtXPeGfQJ0JOekgNySC+psidbM/DnwhpvvfmPtCd4rMuV0K78MoZteZumlPEB401odPcj3r2FAHr1ju1MzhO++9V/KgX6++JQ3+3OQtNgBEvJp3OdCUbGxZHUfCg5lu0RhNakwJW2NQraJbjSDZRZnPSK199zYI7Yidvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38zvKDkk5vqJDj8XXymqC8QaIrvQS3pO3Dlxi9Z+Zrk=;
 b=vQKZbduX9fwdpjC2DYIAvkS5taq8/1EUQ+n5rrqeRt5dC9seJ2y7iAol5KOIt6IDFmAVU8JBCty+6AgAQkmhHF3gC1550YuYt75KzIOnWu0h4aJSPCRvzQJdSoVYK/l6pEoqlMStB7ttVKwSYorditsUFdCtr5qKOwM8vZWxdog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <75b06911-9ff0-e75f-b611-810277524171@citrix.com>
Date: Wed, 22 Feb 2023 16:04:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Core parking broken with NR_CPUS=1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0401.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: a8715fc5-9852-4a58-90d9-08db14ee7ff2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cdkC6pmu35NZzR4tKQA8J3Gqn3dUrbR8+WEO7Q5iONKLFQ9OGKbsClqmdK+PTVHjOU5rVyEUxnJt9oALLSm9ic+cmLfj7M1lyQgzBTxUitCowiFW05a194hmnvMSSg3JKWav9EfTzP5RD7KuPqA38IBuSYNY8JZnNZm8VGETTfTfj939Cdv8LdKgZFn2W374F3996TZQnm+uKwg1wYgn00mPt36HXisgXLF/l7Kz7u+B7rRj0SotLUXDFs/khMbzPcmoZZcPd/PmctgQ/1UBC/iqwkZNxUuCbv6L7Ytxz+tUqGwFSHPXzUETfVoG0SikgM2xdlbmYa1sQgsdQRQYTgRekDGZxVOyqav19grFIS5Jz90/kPOuRtPrK0YjAyozEq2Ce3yAnWEjJr4T54BOOETUiLo+ZpPxw9GAFqLycdPl5oTi2K+7toqvII0xqilb3lRiFkMgiO66h1cgZYRuEOsHULbgIH+mmGK3M7SXVLx7EsZZzqIpjcLsjuJpYw05XXS8zRrPw3Cq3NR2/5PS0OofWDLAbgrK2a/WWPseZOWEPw/CXeml5LWY8xdmF58/tXHmBr6sgad2kmN8t4TrmABRppOEEf1JHhIt+iv2GLa5Ny8Bqw4JAePSgSYsLGpLuJRypkwYPfw5+LIT9RuEmntVqn2C9Ud9ihZRe+qfjoXNLPV3TDOmq7Ro/bBNBkhMqjsXwUczrDlkNHY4++2pTiqVWql38hiixF4sZJbn6m4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(6512007)(2906002)(38100700002)(82960400001)(8936002)(6916009)(4326008)(41300700001)(66946007)(8676002)(66556008)(66476007)(5660300002)(36756003)(6506007)(186003)(478600001)(26005)(6666004)(2616005)(86362001)(316002)(31696002)(54906003)(31686004)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WnlpY05EQ1BQcVhObzBrM0VFLzRZR1ovb3k3RlVBQW9DS0w4TDhqVnRSMXdv?=
 =?utf-8?B?UWNNN3I2NlVmMnpldkh6dzJoV1o3WUpjdlZoK0djT21VWitibWRaaGl2MGRw?=
 =?utf-8?B?cVRqNU1oT2ZVd2JnUEhPNkF5b2FjSWp2bzFvck16QXRJN283dzZlTlhMeUQ2?=
 =?utf-8?B?OG5VejZiVEppZmRMdUFDVmlYV0NWRDdrc2JORjlsQlFHRmtkUFBsYitVQ1d2?=
 =?utf-8?B?U2NlZW1xbTNnYU1LOThuNHFoY2x6bkU5WWVNZG1oNlY4eVBuc1RhYU9Dcm1O?=
 =?utf-8?B?U0RoeHdSSTVPVnU0L3Fzc21NazUyT3p0RzZNbmI4cFk5WHVScE15N2xySlBh?=
 =?utf-8?B?SHYxMTFnVTdCZHdIZlc0MmZsTFd1a1V5YmJsTkxJckhQVDdhdlQ2bUVpREhI?=
 =?utf-8?B?b0tHd0N1MUdDYkF6bmVPQStCVXlsVnlzOVBzR2hHcytyN1FkYkhmMWp0OU50?=
 =?utf-8?B?Ry9tUzhaTmU2UlVrdWJkaHJLTFMwMXBUZndZTk5lZVhkY1F6SE1oL3dUcWZ2?=
 =?utf-8?B?ei93YytOQmttMjZ1N0ZQRnBSditnaEhxSmJoMEt4MDA3aFBlRXpxdm1zaHVK?=
 =?utf-8?B?SnRmc0t5bjdiSVY1WElseW5pQ2NQQjE0UU5nenVoWktJbmtwOFIxNlptcWQ3?=
 =?utf-8?B?WjhTTG9WSHJ2Nk5oK2dCZ3U1RlVJK3ZQS3FZNFF6T25OWnZHNERsazJFTnhy?=
 =?utf-8?B?OGdKaGp1aloyd2JSWDNNWHIvYjhjYlg1QW5qQVZWVDVUeWFobldvSzNnczB0?=
 =?utf-8?B?N3NNRlhUK1NDV2NLUkE5a1NQQUNELzJrL3JhTkZDcHlKVUMxTStCZU5JUGNN?=
 =?utf-8?B?SnUxSFhXT05aT0RRZlhwYUk1eFN6U2VKQjc1TzNHbUlIVC9teXlxQzUxUGZ6?=
 =?utf-8?B?K3BDQkFVK2ZGRVROaHZwczQ3SnZqaTl3NU9oNTExemlxamlLKy8xUm84OEg3?=
 =?utf-8?B?QVU2S3N4QXJIemgxWnk5djFGZ1l6YVdSV1lhQUFqNWJwNTF5NG4rZldrOHp0?=
 =?utf-8?B?ZHQ2YUwzSEQ0amRRcC95eXlEWnh5NVFFeG1FZUF2YjQvbWVYVFFlVWFNZlFI?=
 =?utf-8?B?Y2RHOG9sanNhQnk4ZGU0NHVabzhKM2cwcEo1eGNWa0lRSk44N04vZzdHZDNL?=
 =?utf-8?B?UGZ6LzcyRFRkcGlKaFRHdis4M0FnNUJBS3RzRkc1VGpwOXFVby81RzBwUDZh?=
 =?utf-8?B?VndTL2ozNFozMjliQ0F2WXBURVJ4emRZQldnL3hCUmtiblhJalFLR0RHWlZV?=
 =?utf-8?B?WnVyTlJnK3VOT3dJYTZZdGUxWExSb29YZXZnbUdQSXNvdnhuQXUxcXlNaHdl?=
 =?utf-8?B?MThQWkZTUUozYWJUdEowZDU0R01mZlBhVHlnUDJVNFBwVm1WRTVmRWN1M2ZT?=
 =?utf-8?B?N211K2lSTU4vTmZ6djVlenpEK3V6WFNrSmVDbmdSbmp4dlhzbXEyRk1mUmNl?=
 =?utf-8?B?OElnOWFXdlcwQ2R1Njd0eUpmZjBaVmRidDNQbXF5UExhM1RQQ2JBanpMZ3RZ?=
 =?utf-8?B?Y21CNVZNVmlmQ3c4SjFpdlpVbnd6U1BkZ3BRY0dzTU9UQWJoQndzdTY1YmVr?=
 =?utf-8?B?K0xZZnZkSGVwc2lEdk44dkljdFhaSWNtRklFaUNtZzlTMkxJbUdMS1FrMGgr?=
 =?utf-8?B?djhVc3d3ZEw4UmtLNXQxOGV6ZC9tb3JON3Y5NXpHUENKK1lmWjRIaXRXSVA3?=
 =?utf-8?B?NVZwWnRnZ2ltcHEzZGs0Z293alk5Mnd3dVFNRW9XMEZzelZrV3FOYTlqSEpX?=
 =?utf-8?B?M0wrQ3RoTXk4YWd6SkZsaThmcnM2dTQ1akh2UVhPSjF3SWJsdFNiYkI5dE1K?=
 =?utf-8?B?cFpkcit2RlR6TXdWeks1VjhMc2c1eTByckd3Szd0M01Gb2s1RmNhTlhXSnUz?=
 =?utf-8?B?ZFlZQXhLcFJsRk8zWm4vamZlOUFqcDFOdlB0UHRsTU84SDFFN0pQZlYybW9Y?=
 =?utf-8?B?bnI1VkNwTFZkeEdITGJKWnFpc2h2cmg1L3A3SEFGSVdDTm5lK2JHQWxKeGpv?=
 =?utf-8?B?a3hyZ1VWdDRLcEk0bFJqdUFBamVET2xBa3RDOUJDYWVCZjFHRWgyU0w1SXdn?=
 =?utf-8?B?M3JmbmNPZjJuTHF5b1pHTHNnRU5jSGhJL1I0UEdxTmo5bXVUVlg4KzNPcW5s?=
 =?utf-8?B?d1Z4YzRXYnlGNXJZbXpDWWRhUzNXSkZJd3dzU29Zc08yNklSQWY2NXR2RXBr?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	g5+eclxvM6txDaH+Z7QT74Vi9w3610dRPdqJa5Yhc6O31h3GZ2+PRYFFmVF6jtYpGrwq8faHNfDFNlpf6JqOzudr28mSHxIgSYn4Lixz09VmV99iEi1/PGq+9pEBcaBYsAAOKLCalHx+8+IdrHNzYFphQ2cH7RKh9MAdr607S0RZIeUcmtxrIY8owlzI7zueRhAAYt0xovnaWoALuwbbibLgF11dp00hnL5uCOmpytmph/q764+jXX7GSzlQ83mPf6Ip6EfKVl1vfF229zDTZwDOHd/g/QNnGR23GZpkbzSonPrT5QgO9QmM40JxDUFvd5l2dGncwm/dCYZ8pW2FxGfhEdzwUsNNF3TsBoIW+kSfiUPCHx2MrdmBODtYBzQzKTFdc00DoMkAC+yBpU6QjBNXzZ2ZxRViyITfvEAPptZs7YoGVpn7TafQKzqF19G1VTZkAvitxxBkIl/yKa8ttfLRuQni0hZWmzww24ODeEk/G69MA+2yHSpm1hCbhNZ+QWpTMPsgWiIQxMDP8kM1cAAq/82xOpNWqr4bzErOijMM6tbMFW7vQHsCEcHk3+hui5lFrAAsRPG98qyqVU2JoPhBfpCObSTk542WetIdKJxGN2xERX70YJTzxDNxMJjP1azCAab8fhaYwCvZ6gcbg3EafUGvBLBoyQ4i1iVlEHou/o4pHzwLjKrxxreXrtwVZ9ndZoanbjYSUBvgEcyeJJMIQBdg/uPO6ZYzwSrt6UrK7NuGLIYefWHB2mMv1+h2FyYQMCe0qGI75CDv3ik55jeB7oRhuvyU1nl8CSCW9efxhdYRERlbBiE5+JVsKyJY5btlHJiq/LyBO8zNUo3U3sXrKodLaTtfBoFwrmMt3XsKsziPNC11+A05+HGJ/VPF
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8715fc5-9852-4a58-90d9-08db14ee7ff2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 16:04:38.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9s6zp3QNAUg3uIhkewpthPs8hNhIcYdH99l+K4xryhPZN0gPlRpfaJnf2S7iU0jiet6FhywYzj3wUtwJyBt6bNv341OaiJsk8uzTaQj2yKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5795

While testing the rebuilt debian unstable container, I found:

common/core_parking.c: In function 'core_parking_remove':
common/core_parking.c:230:53: error: array subscript 1 is above array
bounds of 'unsigned int[1]' [-Werror=array-bounds]
  230 |         core_parking_cpunum[i] = core_parking_cpunum[i + 1];
      |                                  ~~~~~~~~~~~~~~~~~~~^~~~~~~
common/core_parking.c:31:21: note: while referencing 'core_parking_cpunum'
   31 | static unsigned int core_parking_cpunum[NR_CPUS] = {[0 ...
NR_CPUS-1] = -1};
      |                     ^~~~~~~~~~~~~~~~~~~


which is an legitimate complaint - this logic is simply broken with
NR_CPUS=1.

In principle, I think the best fix is probably to have CORE_PARKING
depend on NR_CPUS > 1, except none of the interacting x86 code has been
written in a way that would be compatible.

But it also occurs to me that this is the kind of thing an embedded x86
usecase would want to compile.  Frankly, its niche even on regular x86
use-cases.

Except having looked at the code, it's a different to the other thing we
call core parking which is the smt=0 logic to keep the stacks valid for
cores/threads we don't want to use, because of #MC broadcast problems -
and this logic does need to stay.

Thoughts?

~Andrew

