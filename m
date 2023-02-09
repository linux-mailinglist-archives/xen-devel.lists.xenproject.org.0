Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9282D690F28
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:26:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492812.762537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAgx-0003rN-U4; Thu, 09 Feb 2023 17:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492812.762537; Thu, 09 Feb 2023 17:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAgx-0003oh-QV; Thu, 09 Feb 2023 17:26:39 +0000
Received: by outflank-mailman (input) for mailman id 492812;
 Thu, 09 Feb 2023 17:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQAgx-0003ob-1N
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:26:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7137179-a89e-11ed-933c-83870f6b2ba8;
 Thu, 09 Feb 2023 18:26:37 +0100 (CET)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 12:26:34 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5130.namprd03.prod.outlook.com (2603:10b6:5:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 17:26:32 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 17:26:31 +0000
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
X-Inumbo-ID: e7137179-a89e-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675963597;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wDHncq4T8makkjtymMII6kUCENYxW9Uo3GjETb4cFi4=;
  b=ffpy7JP1AHcKZJjeF29J85+wWLkkbAfyTmMUWnMVw+p4+UGeV0n3AbES
   6Y+pN8a9kAxpHa6u0lnazaGoVD1vqpZHsnGSP9cRNxDSZj4CTffsgwl+l
   ibwzuoQIpSlONa1N9ykuOOgi7a9YrsokqoO6GxHdFYwRZ/mkoOUcyOHZt
   o=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 96401910
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KB/Kmarq9yU7RwLMEwsP7lKV/DVeBmIuZBIvgKrLsJaIsI4StFCzt
 garIBmFbvrfMGOnfI0laI+28EwOvJKEz9dmHQdsrX8yQn8Q9ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyhNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACpKQC6koMGt+7aYZvFr2MslN+7kN6pK7xmMzRmBZRonabbqZv2QoOR+hXI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeerbIe9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzmqqYz0QTLroAVIAE0TQOigt+SsRadR/97N
 UYKxyp1rYFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakcsUQoAy8nupsc0lB2nczp4OKu8j9mwAjepx
 TmP9HI6n+9L0ZNN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:0B5KVq5H1fYF+3E+KAPXwBTXdLJyesId70hD6qkoc20tTiX5ra
 qTdPRy726WtN9jYgBZpTngAtj9fZq4z/VICOYqTNCftWXd2VdAT7sSkrcKoQeQfREWn9Q1vc
 sOHZSSEOecMbETt7eF3ODSKadD/DDzytHNuQ6o9QYJcegFUcFdBkxCe32m+wVNNXN77LQCZe
 eh2vY=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96401910"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JWYmMWh1x/LuA2eMLd8qCNyzB3/iIlxPAFEhGB+LU4CeWaxyVDy3PkUkarrOiPIIQsbdmxoDuR8a8r/EsMGcxNLtTFhwaKRxl81mdZyQGlHWVW/ViLSUnVR+blyr2h/HfkR3Q4Yj4osiGiBI7se758M+HYqOmhFdqsaGEYaKaU3ufIdhXyIucUbHcKQpzvITr6TiKYs+jPaNMCxi1/ILTdOHU/AFzhJ9ivWG7GSNdNkiHQlB1RCMnap7VX+bsfyjyClRkJonQpFpaAAUS6yhKNPfzTu+tCHHQ5AUPLp65qIMEdvy53zHvUxNo0OYEiGKsZN0nSRkNaKs7DR4OqQRGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXSoiHqzF5sku05KOPYN+Fkj22jfeW5+TWc/spDNkbU=;
 b=oS53/YsQQJFQFnn4sDQ1u0jDjZ/1IKvuV7XM84QEOR/eatncRJ/0iVxyOKej/JFYj/sZhzXrbP4TDplpYQWMQWvB8rPZbR4AGJUAfhEnjsP+26hx0HOrkORMwXeGXXxRquRHIU8YhGJ480G5KpmLpgy4y/eH47IdTsuY5GGHbgYX8KfTtq946f4+yZpQvOzzfPXHQUTPRz6v0pOMHeSUHagw0YEalmcQpnyeYmaHWhx5raBdySvOL6GL+ECE2L8K1ALRu4uEUfIlmP4HT2PAlG93P/W/ehJZml7o0cXbm6Pzy00NNhBYcXDVRYysJ9FfzpHdUumIkvk5stE4VIuhVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXSoiHqzF5sku05KOPYN+Fkj22jfeW5+TWc/spDNkbU=;
 b=mXhCxu7PiVFlauOVhJC7SRqUqMEwx6/0dYY6Bin+QgLvePM8XwL0Bxt8I3fD1RgsV6x7vgqEMJ7VDnYK8MkssxTzULfa+X8jVqwSvdtvSuxMRv1FYyVVYfkq9pvuit5JHEpLfJG7iqf8v2DHi/ASQtjit4sV9Azs6RWoO1ostVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7751faad-d281-bdce-60c3-74b17f57313b@citrix.com>
Date: Thu, 9 Feb 2023 17:26:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 4/4] x86/shadow: re-work 4-level SHADOW_FOREACH_L2E()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>
References: <c8858a19-e89a-c1de-3222-810bb43c3c88@suse.com>
 <7d2dd28a-a821-e906-6245-ab26e5518706@suse.com>
In-Reply-To: <7d2dd28a-a821-e906-6245-ab26e5518706@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0226.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac1f3ce-f69b-43d7-306f-08db0ac2c8e6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IU9A8pq2hU8XTY8Z+rhZrhpjjGD/xccykdbI3RJzHUgdj+WAt9An4UEuQn0bjPhqEPZKCPLefVCiLZq1sGJTvq1+2aex8R+9XIKI/ZnhE1wI2fl2ltvhKtTOeV9T6DtZO359ycACpI/G283A3Kfrmpdk1hrf/VlU4NR7b8vBkHxLlJQLdqbHxkpROM9xBGWNSwd3cfDmZUQtkQViN+U3PPvsY+8j2bn2P2DcIZrbvxXZ0LBZRsV1kDyFy56PEqv0IdAfdrFRi6c7d8dY6ZYqYAqBBMUafHY62W5gJwQ3iKZTeWMbwzV3WL/3ZhWOV2bbLXwObzQzRmryI7/xCKpUD7sWJI8ZzRj3bZDFhMqu20C+MayEmnG+Mc5tXamKedzqARnVytwPp3366lx1TUu6mWFXeomOE93T6xXdVOMBU1LQ4+NsO3rJPxyW+XZXb76yR6cf6/Jvj3l4kMNNnBzXa+0faYAr5mN/+tp8UiQIKCI5x1cIt9yEgYJGCrwo7GZ9DJbAIOSrUPec0gz0up24aD0T36iSXlGXQjPUrOwZWqnodYOF/z7ojEG13Ayb/VKSj54KicuM+eae3t1ao5maBRqfJ7MSA9KzOXqgHBEtG2ZbmGoRSoDCFQ/ifpWv64eOsKN+Fb4GNDeuMrCjxXYz5u06N+QsFBTOX0VjvZxCaKtrj5ZZMFNqGvy4Az/1W1bKzZBYyagcXIwWZYT8zT0spZItdFycxHMMRJY+xoi9fl0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(451199018)(66946007)(4326008)(66476007)(8676002)(31696002)(38100700002)(316002)(66556008)(110136005)(54906003)(86362001)(5660300002)(6486002)(31686004)(478600001)(186003)(53546011)(36756003)(26005)(6506007)(6512007)(6666004)(107886003)(2906002)(41300700001)(82960400001)(8936002)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3JZbE03Wkg3VERWQUd0bUMxSW5SbHNqTHBqejNjZm5BcWxmc0ZyNWdnNDBM?=
 =?utf-8?B?MS9oWmZkMWVabkYxREYvMHNOT25aMk5kam44Y0JNZG53ZU5yelhGdnFyWm5q?=
 =?utf-8?B?NGg5bXVxVFpLajE5OEU4WTV6NldyL2ZJMmJvOVBPUldWOUYvcXFrYWxzQkNa?=
 =?utf-8?B?ZngxNUVzNFd6d1F2RWMrZG1tdmc1TUlUeFRPNGtRKzZHT2xXVCtUenBrcmg0?=
 =?utf-8?B?dlFHZi96Y3QwcXJpRy9yUk1ZdXBjcTFjaU1MZTRuMm5BNkRUTlFaN0dJWG9W?=
 =?utf-8?B?K1BYUFBvV0xVUnlqK3NJaUZZOGI2dVRlS1BhVzdMWW1CYjlQRTFNUmIxMi9i?=
 =?utf-8?B?NVZuOEVHNk85a2o4TGc1SDJWemZJbE5Sc1hCT0tuVjFyNnRjaHdMZjNpbDBE?=
 =?utf-8?B?THBTRnZhclZrOHVHQUdyb0ltVFF6K0puWjRkTVBuaTF6ZVNmOWx2eGd6WjVp?=
 =?utf-8?B?dFlmKzFpY2pWSUxaMDBaQ3NacVpKYlYyNUEvUWxmYlJ6MzFTdmZ4MjJSUC9L?=
 =?utf-8?B?eE5zeFhKRlE5eHBwU2MvZGp6Y2xvVXBzWE5CekJIaUVYbFVxV1lQNnBSd0Za?=
 =?utf-8?B?cVIxYW9saDVqVE1QNDZKakhmVXFDN0g5UWN0WjhjTFg0dmF3OWhmR1JWTTdy?=
 =?utf-8?B?d05jWUsrZk12V2RLMzBjSU10NWF4UUhLU1FqMStMNjNNWU5weWpGTFNFYlYw?=
 =?utf-8?B?QUVFME9lL0dqM2ZJZWptalhQUEh4ZFJYM2h4Tkx1Z3ZWSXRHc2xrNFZSbS9U?=
 =?utf-8?B?eEhMRXBZbHRKZHBTVkFiVzBNcmo3TXhhTXZyTGM2blQ0TTZYYUMrNUNPNndY?=
 =?utf-8?B?SmRhM3hBTjN0dHlzUXRtNGJaYmtaUUJXRHhHaUpERU9saUU0MmFyczFUWWZQ?=
 =?utf-8?B?d0xiMVVTL3BnMFlyUDBabUdyNHQ4bFRuWklNaVdjRUVwNW9OWWV1UXFqSU91?=
 =?utf-8?B?TFNrTW93R2puc2VVd3VPVlFsZTFFUDRxNDBCdHNKT0Y0THppNERyaFU5TURQ?=
 =?utf-8?B?UmJWQnpkQ0NXbzcvZWhpQ0NuaWgyZGdFb2NVemtydFlwbjZ5dUY4MVNTMkFE?=
 =?utf-8?B?Y0FIWXh2cGlLLzN3aHZ3c0lyT0huSXpZRGlMV2IxaDM3NFB6R0dmTHNXTm9w?=
 =?utf-8?B?TStzRTZIT3BmREcvTTBhR3c3VGc0MGhUNzNkLzd3WnVMMEZOclVLTGdFaHdj?=
 =?utf-8?B?bHFJc0V4ZU5DRHozRmpqbkNFa1BRaWtaRnFRNm5zSkZOckNRMmMvakIwbTRi?=
 =?utf-8?B?cUkvSTMrTkR0MW51QVVZZzVPaUswYWRaczYyRHVRTXBpVjYvSE1hWkNnYmhB?=
 =?utf-8?B?amk1OU01VEVkeU1PMmMrS0lMT25Zek9lT2Vpd2tMaDQ4TW42M3k2b2NUVnEv?=
 =?utf-8?B?dGhLYWR5TmpPRmRRYk5mT2IyYTRIQWRCMEpDc2Y4S3lOM0J6Q3NHWG5ITDF0?=
 =?utf-8?B?SVNCZ2laa1RpWm53VlZqbXBVZ1ZWR3Vya3YvR0ZoSDBSZDQ5L2RDVDgzVnho?=
 =?utf-8?B?TW9vSzFIWDF5VnE4Sy9pUldyY2szbHNZWU4rWitSSzQwSXVRMDFoTmRvV2ZF?=
 =?utf-8?B?aVgzZXlhZXFhSUNodCsyNGdGb1Z4bHlDa0FDUFkvVUJMalMvdjRRTW14Wlg0?=
 =?utf-8?B?QVIva2xSSE82N1FYTEU0OWZwbmwwbWxqMFNyaHZTTFhyMGY5bzZkUkxNMldO?=
 =?utf-8?B?RTFDM0xpR0RWbWxNcGw1ZDljVURyaFNlUW40cnU5OGQwUGR3dWUzYUc0cEt4?=
 =?utf-8?B?aXFVZCsyWUhjcGk5cjhGZjRwMmx4NTk0bUc3OTFuTUR6bHhwL1IwZ0UvUkw0?=
 =?utf-8?B?ek81N1gzUGk0MnhKRTFsK29VejFkWXpsNGNvUlRnTUVBSVJkekhPeU91eHJV?=
 =?utf-8?B?bkNNbXM1NWsxK25ZY3ZWS3RUYWp6N2FZTUtYZzJHYnl4QVl6SDJZb3h2Y28r?=
 =?utf-8?B?T25CUUdlS0FzdGlIRnVXdWVyWC81ZkJxYjZ1eis2UGFIWTdRdmNRdWNmcXUx?=
 =?utf-8?B?b1lLRlNmSm43ZnQ2ZytFdWVnOE5JelZ6VVF3NWNLMUkrQXlCdWhINGc1SG9y?=
 =?utf-8?B?VTc3c1VwOTZNQTkxRnBCOXhjWm9LODU4Z09UK0xvWmZFbjE0Nk9sc2lMSVV3?=
 =?utf-8?B?ck9Edmp1OHBkK1hYRUJpeDFxZ0UyZndid1pySlowcy9tbml1YWxmYUlBVmps?=
 =?utf-8?B?OEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yEiMrk+hMPjyQnXF7gpalO2OlN7LXwF9oFbWKKxbgalKZY6SU8exXO1PJprArfkHhgwTl0yG9nogrKbrmTx7KQdAzS1cFJqZd9Pvwohro/ybYFjJg3OvAE5FEUvf/3rLhC5tH8KnHW3QLiRgYQ5WRKSDSSX0Vv8FyCxMoyeklGJ/a/Wt5k9XwEDQVjUMED9CnTRjDhQbjbgpGIosYc8U6T5vT2sNOdOiBJj/XwbO2nIHtLeJTe2UMcsU2tteSFFZ0n4H69/c51WvjEIpp+WhlvDOBsSHC2/L++88cFtCsnCTMd7jVnWdr6GL2TuPQRaFxGpcMkdLYE2WyiMMiHnFg2ERNcZ6wu71vir+VtaiwKwQsn/qew2BCux7G5ecytpNFHmek+HdNUxGzhaLSSC8e3+GqRT0qf4hK5Cl3mlu7bGxCVQeCoAsUTfS/PcrixCYj2Q1kZcXK9E0AX6ZorGWhZflhNxOvtVz/u1ujdlV/HeImySrlEu3dal6vr7E7tKjTudGty3pNkPXU1K3xSUpi/+gBxRfOeUFBgpeRAUJABORfTYemIfXN+wjniROiojRkLcRVfoDuHJ840N001eJkxkQsWRahG3purCAJaWwbVOfQdiVR3BYKFzHRRgFvpIHOxi5LNs3qJ6iNYeszn0YIUTV4LJLptxXGTPaLFArl40bolVx9avW1geW2rBL6Xo9rS7O+ZQUBbRT5kQB+s2qB+UdMdZgxjyYISZ78xaxQVUQ0oQ/Q63DsplAoYQSkGmkP9l/pwjNC3zflEd2no6JOuLbbl5TXUWQCmyia8+uf/CjrtOIJoP9zmdLkWbHqmtO
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac1f3ce-f69b-43d7-306f-08db0ac2c8e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 17:26:31.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cz6GXtqgMB2JXxCCbK8B15qDlWQmBdPxR6tXR6Z6z6QdsmKMTuYE/wiwmHjsk+KahY0rVGeuJMLvfEx2JYcVQZ1jopc8uE4SZh6c3Uljgzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5130

On 08/02/2023 2:38 pm, Jan Beulich wrote:
> First of all move the almost loop-invariant condition out of the loop;
> transform it into an altered loop boundary, noting that the updating of
> _gl2p is relevant only at one use site, and then also only inside the
> _code blob it provides. Then drop the shadow_mode_external() part of the
> condition as being redundant with the is_pv_32bit_domain() check.
> Further, since the new local variable wants to be "unsigned int",
> convert the loop induction variable accordingly. Finally also adjust
> formatting as most code needs touching anyway.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -861,23 +861,22 @@ do {
>  /* 64-bit l2: touch all entries except for PAE compat guests. */
>  #define SHADOW_FOREACH_L2E(_sl2mfn, _sl2e, _gl2p, _done, _dom, _code)       \
>  do {                                                                        \
> -    int _i;                                                                 \
> -    int _xen = !shadow_mode_external(_dom);                                 \
> +    unsigned int _i, _end = SHADOW_L2_PAGETABLE_ENTRIES;                    \
>      shadow_l2e_t *_sp = map_domain_page((_sl2mfn));                         \
>      ASSERT_VALID_L2(mfn_to_page(_sl2mfn)->u.sh.type);                       \
> -    for ( _i = 0; _i < SHADOW_L2_PAGETABLE_ENTRIES; _i++ )                  \
> +    if ( is_pv_32bit_domain(_dom) /* implies !shadow_mode_external(_dom) */ && \

As this is a comment, I think can reasonably be

/* implies !shadow_mode_external */

which shortens it enough to maintain the RHS justification.

~Andrew

