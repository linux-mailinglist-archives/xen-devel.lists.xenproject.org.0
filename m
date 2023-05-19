Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E72709B6E
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 17:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537168.836042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02A3-0003wu-Ug; Fri, 19 May 2023 15:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537168.836042; Fri, 19 May 2023 15:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q02A3-0003tZ-Rk; Fri, 19 May 2023 15:36:55 +0000
Received: by outflank-mailman (input) for mailman id 537168;
 Fri, 19 May 2023 15:36:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9pCJ=BI=citrix.com=prvs=496ec590c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q02A2-0003tR-1F
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 15:36:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8ae665a-f65a-11ed-8611-37d641c3527e;
 Fri, 19 May 2023 17:36:51 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 May 2023 11:36:48 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA3PR03MB7467.namprd03.prod.outlook.com (2603:10b6:806:3a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 15:36:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 15:36:45 +0000
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
X-Inumbo-ID: f8ae665a-f65a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684510611;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FlQh7b5LTJf4+44J5I14Xqx887u+lfrJucGy/YqvKUk=;
  b=MJGlZO18n0oCqPi0lxoy77OKWRuHxZ/EpVAnBykGrXXXu7yJZK/vtmfu
   o1XiotHcp6awnJRtwpuWH36Jama57/aPDSrkeWtXVJwCQe4vcORzd4mZQ
   VXbmJKrUspDKNDZOFxkiK8YPkwtjOFyc3PPme+69LSFLuwF2ad7tMWFjZ
   s=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 109688956
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:CiY0nKvpefk0FJVgvgQGqOWo1OfnVHRfMUV32f8akzHdYApBsoF/q
 tZmKW2CP/+JajfxLYtwPYjg/U0BvsXSzIQxQAVqr3s0RHsR+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKHxiFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGg0DNh+Kv/OPm6u+Wu9w3dUCFvj5I9ZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xYbI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXpqK460QDNroAVIBJRSQuHmf/gtl6Baf0HE
 XMmqyEJj5FnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ2kUjJR9M6Sqqt1IWpSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:wYNAN6GLbELaW5GYpLqE28eALOsnbusQ8zAXPhZKOGVom62j5q
 WTdJZy73XJYVMqNU3I9urtBEDtexzhHP1OkOss1NWZPDUO41HYSr2KhLGKq1bd8kvFmNK1vp
 0QEJSWZueQMbDU5/yKmDVRv7wbsb26GAHDv5a480tQ
X-Talos-CUID: 9a23:Ih+TQ2HdiY7VFPAgqmJVyUBMFckdY0SG1XLAJVPjGEdTea+KHAo=
X-Talos-MUID: 9a23:xi5CQAg4j/dmIfn3GF1NRsMpO4B0s5iWDhkxgao0lJG+Ch4hMBC/tWHi
X-IronPort-AV: E=Sophos;i="6.00,177,1681185600"; 
   d="scan'208";a="109688956"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmmDhRAefJtRKCKfZxkPZeXOsi57s7lHCV5udf2DoMAePp3iX3FoHVICLKdH2HxBpCQtaDgqK2KsT/PaUwXugL371kqeilZ6fAQRfCuufshCAwgnc7ijuDd1/b/bq0cO+brmtrsy1bJaFADoLRmXXosPZuRGxcZ70F8vueE+rLqv9OARoCqOjDBysupW9XrOX6RN0sXKOaANWXjslO2tCY3aeKxs16N5SNUDyIbOvWXri0qEroNbzDTco+zf0+d4ADOvMj38k7iArBGC7PbAZcP6gbEZdPaj1wApgAjTCergU9chGuw99XScks+vmjLS82husGXFV/5+4caflNAdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtMiiOK4EZSQ52xTb4CP2P8D+baoolUYBsdhmsSZFbk=;
 b=cyF5qzzK5lwQXhkgbyYSCSSRWm6T0d6YOzZ6XxQvLf44+2W5A7EavHfaibIbMnpGT2oaZhRpxLPhg1xefqWR5OoZp5vfcp6kwuo8XDtl4ZLR1YskpszwRSNyvr2BEh2u4vThx4TJJs/MTGDlE3w0epZEXyW8Z1Bqbt6iYL9bfVkH5WHYTt8Jr5oVbFreR/YZIdZPzCWFFYFIl406XoCBybEZvaXKd/B4Sq7YrMmFsK8hMbOxYNUMmMY2OnInL35eyJuMjIFxpdg8AdmkTX0ZL0eIulDKA1xRwh8C9XYZJYA9CYdxTEfdua/NqOhjsgjtDU/lVu7wTNFV0B+QdC1vBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtMiiOK4EZSQ52xTb4CP2P8D+baoolUYBsdhmsSZFbk=;
 b=LYCfKRDFm3WWaNQNA8FlAVQ77mQ/N7fDSb14mIKmxwBmlkyVcYPdjoOMVXaSZZJPl9rE5TL7FUsnb56cK66oQmz9UG0zS41ytj2S1vd0UciPMZKHGg0K3e1gg3Jvrw19qNsGeTgxczRu+YHaDyvUTMEYiN5Z3UjuUsenOzeS9I0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ea8bb0da-6326-55d6-18b7-0ce681046d53@citrix.com>
Date: Fri, 19 May 2023 16:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] x86/cpu-policy: Infrastructure for MSR_ARCH_CAPS
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
 <20230515144259.1009245-4-andrew.cooper3@citrix.com>
 <347219e4-6c3a-a0ad-b010-4dbd7282c7ad@suse.com>
In-Reply-To: <347219e4-6c3a-a0ad-b010-4dbd7282c7ad@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0225.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::10) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA3PR03MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: d5fdaebe-f469-4b74-7b00-08db587eda17
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tFPGE7/jjOhZBaXXMCqFtxn/RGIprB2bLNVWjZY6KEQ1K3y1sG33FaQ5zRFW6zKIycEGC+hEG1VzQEcH4mvmgVsIsWBCSwDx0N2kP7tOV7lorN6RBuWQ3y/XbRda2xIbvI2ogsSrxJ0Gsxota/3eei0GYIrjXAqKYMNUuIxi+RdwSnqlL6FBHaxK/dM5Rn74G86NXp2qJUsSfyk3mq5dOwiYTBspZlx4+TW1g4qoOsSCpj0pyrisoS2p2qKArLgjhkozdUwr6Aax1mGub4z6QTtK7u5Woq9NR6AXfwoTYTsGqOvcD8+vaQ3rZaQj2bccrzO27fVLVwsitUDWbc/mg3flbhin199VtgUNcfXpG9z1osfYqYW6ryRYfI9kUOs5l/znUbofYMArcfZCVG8vhSBuBRZzgyUmTuUBQVOlZ7DzM597y4WsWA1cZKcMcR+bOP9BLgRuKgPAdTf8bJKlMD6VFWUYYP4IfBaxYvDQF5LgfB11c7GgCNvxuCrVwn7vww7T/677e94jNwIH111qa3LzDDS66LCkhFcyaPKf4fHHk3zanhv//mE/pRP6dPL4nMPe4/BrmIfESmWDGQ/6dKcr2Gef9Uca07hWpNQ8mlqcNOavje4g/2/7WBMuCVp6wCLzFM6ap9T1i9pcduh6gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(86362001)(31696002)(36756003)(316002)(54906003)(66556008)(66946007)(66476007)(6916009)(478600001)(4326008)(6666004)(6486002)(8936002)(5660300002)(6512007)(2906002)(8676002)(41300700001)(38100700002)(82960400001)(2616005)(26005)(186003)(53546011)(6506007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFU5eFR4NHRsMlkxaEpzRzRmVWFrZy9pT0crazhiRFFhNWVXZVBUaDdMbU5Q?=
 =?utf-8?B?QjQ1VFNxMEs3SGhBT1dGRi9ZOUkreUphYzlmMmNNUlhqeGYwWHJXcmkxQmtQ?=
 =?utf-8?B?YzVuQ1lXdGlCVVlqeDgzbmdCcFZIbnlYM0JwOGp1S3BIVGhQbmhBeitvbW1X?=
 =?utf-8?B?RWNpazA2RDhlUVJLajJhdU5SdjlndWV1dkQrOGdDNy9RRWwrV2Z2aUM1cVJ3?=
 =?utf-8?B?TG1VbmlMQk1QaCtDUm9xUWx2KzBIUDlyMDJCamNrNWpDdzY2cE45UmhFSnJP?=
 =?utf-8?B?VVVuWUNEQzU1Q2g5aUVwemVsOC9mMW50NVdGMElGL3hFVjJRZlplQjZuam85?=
 =?utf-8?B?b2dpNi9iVCt4TDZOTFBmQkZJOUFaRzlEUUlYRnVhM3dyaVFPY0RDZ3IrR2lP?=
 =?utf-8?B?cmQ0TW8rS1NvQzE4T3gxVjZBL0o5Nk9XYmRHTVRpaUYwUklLOGlRZ0JkR2la?=
 =?utf-8?B?aVZjUXNiU2VOUmp5NVUyUmR0NzBhcE1GV1JHaWZ4OUZQS29HZFRtVWRidFU3?=
 =?utf-8?B?dW1PdG9NblkvM25oWGlqUW5iblBBUkpua2xTajd1TDBmYlpmU3dIWTVsVUln?=
 =?utf-8?B?VjloVTZ4cWdXMnVxWi9iOERZczZhVjlyMEM5cC8wTTJtS25TdDBRNldpNEN3?=
 =?utf-8?B?VGFRY3hyaHlzeHA3U0w5T1ZmcmF4S0tTSzJnSkgzdXFWL3I4MzhuZ0ZXTWhs?=
 =?utf-8?B?SjBkWEUyMW5pMVFBdGx1cTZicTgxK1A4QVQyU25ycTBFTWQ2a2c3bFVlSHBK?=
 =?utf-8?B?TEJXTXc3cm92SkRWL1d6dDM4Z3BZamZlUlFEY0hXQ2Q3MVFGS3cvWDV2bE5G?=
 =?utf-8?B?cS9rb0ZwNWRrcm05SEZUN3IwQ3JYNHdHb090TkxaRlZ2ak04Z3pod3NyM09h?=
 =?utf-8?B?Nk9KbzNST3JMVGYvYWxPUzVzTXh1Uk9zV0hneWlacUFPYjdHczA5RGhoNjBS?=
 =?utf-8?B?N2JuYWVlNHVSK2dzL0hSSnBYMnNPQ3k0RmpaY3c5RUhzMkQ0SldsVTRaVGNF?=
 =?utf-8?B?ZWYrR3dMMFdkcGx1OUdDOCs0dmg5N0RtelRTU1Q3citpeVdLUDRkaFhGWnM5?=
 =?utf-8?B?Q2VIYXZXQXpya0xlUzVCU0U0dklpTUgwMVFqdmcxYjF3S1MwWjMrMmRqNDI4?=
 =?utf-8?B?anRITWZwTWltOEFHQzNuaFlDOEo5Q3pCZE16eVZrTXdWQmhKNkRORkNUci9m?=
 =?utf-8?B?ZHNXQXdCei9pdHc0OXgvTGZOWHdKV0hNeHl2ZTc4NG9mK2U0QlUwd0lOQSt1?=
 =?utf-8?B?bnB0WHJqS1RXREtxWGxaUVd3THVLN2hVMjZ2SmhDZmdicDRlUGFVckJPQWVK?=
 =?utf-8?B?MEtQM1dSeFZKTGdDVUk4VmdXSzBrdVEvdWlUakVOWlN3bStHaGc1ME5YckFC?=
 =?utf-8?B?QzlHL2RXSnEvdURjQ28yTDY1Z1lZVERlemFWU2Q2b3JqNDJXYnZUdnU5YkdB?=
 =?utf-8?B?WWxjSHdiK0ZWb2tXbmNxMTJpMGRMaUE5ci9tWmwvekdodkpIVmtUWER3L3Mw?=
 =?utf-8?B?REhEYm9wbGdqcGJDSVpyMEZ6ckZFQjBIWE9scFVTN3NqSzFhM1dGWlBtdE1R?=
 =?utf-8?B?a2hTOG56R2FyZWRlZzAxUzNQdmVobmI0T3VVbXUxSVRYblN3RmwrNHFZVDRF?=
 =?utf-8?B?SDQyK1hXOVJBNFgzdDBlSnhQZmhNaDJBT3pKSkk3eEFrOFllQnV3Y21UVlhC?=
 =?utf-8?B?NXNOT01SZUhqL1BPdWdtNXZJdFdRWUlqTldhbGtqNS9qYkxLSnQzbG1VK3dy?=
 =?utf-8?B?dDFETnQ3NmF3SFhJQXI0LzJEYzQ2WE50R250dkR4S1FpOVlDVWpNZzlsUEI0?=
 =?utf-8?B?OEF3UVorcEMwb2VQM2Q5cTluUUZmbDMrK3k5NWZaUVltbEtEdUd6TUVGYUFK?=
 =?utf-8?B?ZjBpLzJPUkZGMnRJT1g2TkFKMnN2THFEaHBYRzVCUEJrUlZNYjJMRVV1dDhP?=
 =?utf-8?B?bjVIeHdOQkN4ZWhHNnBMOE5HM3FPdGxMczFLSEloMjdrMTJBMVdVdGhadTZy?=
 =?utf-8?B?R0dqLzJXcW9TS0ZMSkZKemtzZ1Q0RklVbVdlZ2JGN2VnRWJwdjFMZk15UDk4?=
 =?utf-8?B?dHRrMmRzTHdqU0Z5eE9pZ0V1Y0pQZUFMYSt1bFBPWExWN3RPMDFvSE43UWxZ?=
 =?utf-8?B?NlZPS1lkZmpZakc5MlFmbGs4MlNsOEJnVEkxM0h6aUxreG1xVk9saEdBRTFF?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	npQHue5S7xR007EmC6nZ3JM1YBqryyNUYL9uMDShY9hAD4V5b3IJM3lPhDAfvXrbYYblE/tXDEssoZuLosgzdulMhoxa4rNc/0kOOcOBpWJF963y0hQ1JFVhz7ouOHrFyN5p4ELV6f4MxvWirAK0EuN6Iw4U8OkHX+EEfEN20CdQdBe5ilF84c7/x3D+wghNrPdajX5XhuU3tX8liwuEVM8fHn+iSlWayaZ5LaHy1JZA6Xgnbylc+7QwdWOBW5GAI8SpJRmxVnVQRHGqIyZrogaz5iYfygxB/CsD+ihcpW6cdlw8zPDDDAtDz3abu0XTWTQNoZ6uKaP9I1SLDIcqVpfIIdqZ9gvjnheCXoDcPr5vzEhfIGNFsAhi3j0wxMn795Noqbeq3NgO1LgjrP/FORKa3Mcvv3O3J7LkXg0jEMaEVs1wxdzZJRsgF3I9nXHDylxBwqQUaemqOw8fKkOLtxw+HadZVgCusPjx6H/i9yFIPlx0Fi6FUIr/KqMMyCECP4FrIErp6pqHRTVus5cJi1AzQC9dSIOOsJO97o7lK2DI4xe5gRxcS5VEzixWqVFUGsuvGnV0AM9iBcrF0SOmFX0U8+ZGDwO8faBy7mbZJj47ehfV20dsGC7SfOhyK3OYzgMDrKapZNOz16nz9oiMxy8cB6lFbuWAOW5LpvRgfW2nNwHobsY8pr5ZGa6TyXQvhHiqj3iyhKiUl+qOFsaq7cJ5suuZ/NllHXUaGSLZtvxQ0onvEUisY4Mnpom/n23xiiBZ7OTn0CN/lKuf85VOP+dzFHzF7DRJFIyM4hR9FYcLDjJNppqdQKi0F4yhlvkS
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5fdaebe-f469-4b74-7b00-08db587eda17
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 15:36:45.4638
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5tCeFcqkrL1t9P7Yd0umwI5S7dR2X1gVmqsPmrGJ+9X4AVlvVMyQ8KB30HwNE46ZROwpxRvcVWQtKrNiQshCaeeX4e66a3EWA8Paq1unAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7467

On 16/05/2023 1:02 pm, Jan Beulich wrote:
> On 15.05.2023 16:42, Andrew Cooper wrote:
>> Bits through 24 are already defined, meaning that we're not far off needing
>> the second word.  Put both in right away.
>>
>> The bool bitfield names in the arch_caps union are unused, and somewhat out of
>> date.  They'll shortly be automatically generated.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> I'm largely okay, but I'd like to raise a couple of naming / presentation
> questions:
>
>> --- a/tools/misc/xen-cpuid.c
>> +++ b/tools/misc/xen-cpuid.c
>> @@ -226,6 +226,14 @@ static const char *const str_7d2[32] =
>>      [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
>>  };
>>  
>> +static const char *const str_10Al[32] =
>> +{
>> +};
>> +
>> +static const char *const str_10Ah[32] =
>> +{
>> +};
>> +
>>  static const struct {
>>      const char *name;
>>      const char *abbr;
>> @@ -248,6 +256,8 @@ static const struct {
>>      { "0x00000007:2.edx", "7d2", str_7d2 },
>>      { "0x00000007:1.ecx", "7c1", str_7c1 },
>>      { "0x00000007:1.edx", "7d1", str_7d1 },
>> +    { "0x0000010a.lo",   "10Al", str_10Al },
>> +    { "0x0000010a.hi",   "10Ah", str_10Ah },
> The MSR-ness can certainly be inferred from the .lo / .hi and l/h
> suffixes of the strings, but I wonder whether having it e.g. like
>
>     { "MSR0000010a.lo",   "m10Al", str_10Al },
>     { "MSR0000010a.hi",   "m10Ah", str_10Ah },
>
> or
>
>     { "MSR[010a].lo",   "m10Al", str_10Al },
>     { "MSR[010a].hi",   "m10Ah", str_10Ah },
>
> or even
>
>     { "ARCH_CAPS.lo",   "m10Al", str_10Al },
>     { "ARCH_CAPS.hi",   "m10Ah", str_10Ah },
>
> wouldn't make it more obvious.

Well, it's takes something which is consistent, and introduces
inconsistencies.

The e is logically part of the leaf number, so using m for MSRs is not
equivalent.  If you do want to prefix MSRs, you need to prefix the
non-extended leaves, and c isn't obviously CPUID when there's the
Centaur range at 0xC000xxxx

Nor can you reasonably have MSR[...] in the long names without
CPUID[...] too, and that's taking some pretty long lines and making them
even longer.

>  For the two str_*, see below.
>
>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -307,6 +307,10 @@ XEN_CPUFEATURE(AVX_VNNI_INT8,      15*32+ 4) /*A  AVX-VNNI-INT8 Instructions */
>>  XEN_CPUFEATURE(AVX_NE_CONVERT,     15*32+ 5) /*A  AVX-NE-CONVERT Instructions */
>>  XEN_CPUFEATURE(CET_SSS,            15*32+18) /*   CET Supervisor Shadow Stacks safe to use */
>>  
>> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.eax, word 16 */
>> +
>> +/* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 */
> Right here I'd be inclined to omit the MSR index; the name ought to
> be sufficient.

It doesn't hurt to have it, and it it might be helpful for people who
don't know the indices off by heart.

~Andrew

