Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19E16FF1C3
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:44:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533361.829953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5eb-0000ps-Rk; Thu, 11 May 2023 12:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533361.829953; Thu, 11 May 2023 12:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px5eb-0000nT-OL; Thu, 11 May 2023 12:44:17 +0000
Received: by outflank-mailman (input) for mailman id 533361;
 Thu, 11 May 2023 12:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+vG=BA=citrix.com=prvs=48888ca5b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1px5eZ-0000nN-Ky
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:44:16 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86be14c4-eff9-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 14:44:12 +0200 (CEST)
Received: from mail-bn8nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 08:44:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5069.namprd03.prod.outlook.com (2603:10b6:208:1a2::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.20; Thu, 11 May
 2023 12:43:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 12:43:59 +0000
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
X-Inumbo-ID: 86be14c4-eff9-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683809052;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bVec7Tp0OCZ5cslkiMqF76gUL132hj4Id9gmY+bv45o=;
  b=LNBcHOxmqmOnaclXQDGp9dFxxedVNTEg3ZG3aCEq0f8J666esqcg43D1
   S5PpXE4ghmNid3p+rOdDkimHkzj6BOY2TKnGIibmmW0LOPM8CK26ORsTV
   w8ftUwUKOeefNB/WVP0APyAd/Tp+lGV4zbb/rJ9PeTx9q0V1f8EvxtBV8
   g=;
X-IronPort-RemoteIP: 104.47.55.171
X-IronPort-MID: 107421437
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:zn4M4qjlUlDqm8umySUJZGWtX161TREKZh0ujC45NGQN5FlHY01je
 htvXDiObvnbYmryKdl3b4Tg9xtSvsOEzd9qHgA+qCxkFCsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWj0N8klgZmP6sT4QaHzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ1EyAmdC6MmNjx45aGQ/hutOY+L+zSadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGyabI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXnqqQz3AbMroAVIFoTa0ujguSAsR+7fdlvK
 lcK1BBpvadnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iELJR9M6Sqqt1ISqQHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:/7MgmK+i1R8mwSkGDbJuk+DnI+orL9Y04lQ7vn2ZhyYlC/Bw9v
 re5MjzsCWftN9/YgBEpTntAtjjfZqYz+8X3WBzB9aftWvdyQ+VxehZhOOI/9SjIU3DH4VmpM
 BdmsZFebvN5JtB4foSIjPULz/t+ra6GWmT69vj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AYLYDQGnsjnxtfkfzFD4fR7t/0e3XOVDm3FzKHUC?=
 =?us-ascii?q?nMyFKbICcWF2i2r5ntvM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3An2UWqgwEVCQzxUic3emVjM6iPvCaqOOrNlAVsog?=
 =?us-ascii?q?/gJiBEydAOiyDog7wUoByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,266,1677560400"; 
   d="scan'208";a="107421437"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAR7pGklb0PQAkjVoq4z7IFKcL2i9Z1TzbOAFSYSEuFYKggeo4S9DXISUxxDCyU6AR3M5G9qp4AcF8l3RXzSGSTA3kIDmmJ+IpW3aPK4WcQDQAjRgL1WGJ4m5Q5XZqbEc1eVGiree0m6TerDZU3n68yZO8JlscJXL9+8w3Gow4AOaq+VHV5z2V/4eLmSQYZ8Ll58DFsJ9hP9lHpFNhFknxVcKR4eGF3KkavyXRyoOvN1a4N+Kj/djfQY54DE+pZhA5tE8EgiSHDrtOSTt478DEBiE7WxR+4jW8/47leQcbl9/s5e2EnCGP034bxQMhOh0nHjMdom/SAK0ZNIoJ25uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGJqgexwdaNn0ZMhjGxzc2Ea7RbILscdiQFdjAq+D4w=;
 b=YfrzrpnzI0jf0tDEq3Nt7kv1evc0h81XSZ4bVMhpTep8sfF23DMJHG2Ost5NyXiZM+8WEoWNuMuUdt3S6NHfKMJEbmUzie9vAra9VKQAB247xKhCZX/4WvpfWak3vRzDXxHjqwFCRdXJMD1Fjik1DTAp9W7eCtEoiIyevhR0y65KJXTUmjJKUl5wiRrv4uLcraZxSD/1zUT8gWPbeZOYvxxK96kQlEfejPzB5rQfebzJUIUdN15T3V36GW/ZcmLJ1ePGZ14nF4abQwrUa0ixvHZaKEo//ELq8FI0lvCT8zfPO4eganTuPOnAWobYB68vQwE22lQv6KzLOOXshiPOcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGJqgexwdaNn0ZMhjGxzc2Ea7RbILscdiQFdjAq+D4w=;
 b=rHTiuehvVjOFFk5s1PUzQvj5yx2RdpwBV2IGptL0BAtHwY58WiH7JlUrMnhHMvkcE3AlFcfxyKyYnJKp98De1bQo3TD29Pzj/ytRmAG+R5he1ycVxL82qrxDyCkqga5d82pzvm1toPs2m3dQEronUmqHi7Y2O2+XOitVXjDThmU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <64b3589b-b66e-fb44-a75d-ff5e7d00ea44@citrix.com>
Date: Thu, 11 May 2023 13:43:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
 <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
 <742a5807-dd53-0cd1-d478-aed567d5c4f5@citrix.com>
 <c8cb1df9-33af-8cae-291d-9a86a3b7f6b9@suse.com>
 <6d62ba23-d247-08da-3a84-ed8d1cdc4271@citrix.com>
 <62b721a0-7d09-751f-5d95-086584f3d7e5@suse.com>
In-Reply-To: <62b721a0-7d09-751f-5d95-086584f3d7e5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4cbd49-24ce-4663-0a9f-08db521d63f0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/afh+buvmnyZVpItGsch/6mbEeIK6v8UwwN7Ehl4xy8PJhzOtYp8GgecxgxhCib6qUJ4w/UfySAsK9zck0Aja6g9FbYwWuyOuphWRZUsneLBmOxggnccLuceZDXyj7EdhcwtVE9F8YU/mA0v5FPRb0mujKjG8nCudEDbC3Fn8vuVCpD9pkW2sHZsnvMw0TtfyosGTdkhPnscTbD95rUZVZO+Qvm37niJ+SSzlbeXSU7zWeRNlJZq7n/z2n6FysdA107tZTOmacjsHtMbNPmIuBbueehkNHPXMh4ktYpTD6w/rH72/9zyuAJzn9MuaCHyHW1RFyl0PzDS1e97t9CoK5yj9K2y3bULvZF2qYjk2nQ/ss1CrtIA+VYktuykomxrbwR4taScnrmb6dEYE+3EmVgP4GFuMtn8a2F5OvI8yPyiNvTK0rL/pTWXQfIzfYUBfmnuJJSL1V7G4Uqc/GpqI0SOq0b7JSptaVinbYdoZUn06A66qkNBjfeTlRIYqfuSPqoAeDCg3csVVeZdkxM77qS+391e4jtgOHE4sPWMEkL9Mx5VivQNH+HFLm5MjFUtoIWUYGIsT2JvvWhGSKaDBylO127qNhtuRuq+cIjCuFW8c/hzB+bjoOc5k6M76Mtedh8hq3u5SvETufw0Fpgi4g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199021)(8676002)(36756003)(2616005)(5660300002)(86362001)(8936002)(83380400001)(6486002)(66946007)(6666004)(966005)(54906003)(478600001)(41300700001)(53546011)(6916009)(316002)(4326008)(66556008)(66476007)(186003)(26005)(2906002)(6512007)(6506007)(31696002)(82960400001)(38100700002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDRmUjJKV0IwL0lWQ2ZpODgrMURTMnRCUjV5UlJIdXRodmlWdDNjd3RBWm9X?=
 =?utf-8?B?Vk9SUk5GUDF2R2RWNWxQSlA2K0tvVE83b3hFUFFBTGZrbnQzN1pKWDdRd2Ix?=
 =?utf-8?B?amdOb0hMVjhMZkwrUnRUVEIyMmQyNStFZzFJNm1aVXNsZW5Vb2JLc01uMWZ6?=
 =?utf-8?B?MWNVb2l6SU9kWlFzeGJrMTdhN3hta3ZJclBFR3VmakJtK2cxWDIyVExJQktk?=
 =?utf-8?B?N05zYm9FTWwzSEVOQ2dwTTZJb3gvMjMycWdFQ3FIblFVWjd3UkplbEFmejlO?=
 =?utf-8?B?OHBJNzFOajNyaVVLU2FpZG5MUUJsbGw5V1EzcFE2VXVwNk9JR0w0Mjh6Sm9F?=
 =?utf-8?B?V0kzSWpTL0RCV2VWWWVaeGw0V3NMd2ZjenN0aXdiSXN6cG9NYXc5dTVzMWNI?=
 =?utf-8?B?SS9ISzV3dWFCajZjZ1ZUVFJ5azNMVDRnN2Y0Zk1TbktYOWJYcWJZczVCeWtu?=
 =?utf-8?B?eWhJWkR3bTc2UVlLSVFOM0hnMi9QRzFJWEo1VmcyY1hkVkRla1plc3dHcXY5?=
 =?utf-8?B?ZXNBMzRLSFk5MG05ZGcraEwvWU85djJCVnk0cFI2clBsN2UzVUUzNVpLTGJz?=
 =?utf-8?B?SkczT3NwTldtQnZoSSs3M3EvNjJwM0lHb0M3UHhBcU5UbktXbml6RXBneWZq?=
 =?utf-8?B?bFhLcDYvT3RWZDYzZlZCUlpJQ1RmSnRMcGtEZjBOMG9Kc0FWWHM1RG85aFZj?=
 =?utf-8?B?UW9KS0k1WFdGOXdWMWhKNU0vaTNkVElBVk5EYWp5QWthYnNZM3puK2UzNWl3?=
 =?utf-8?B?Z0kvV09kckJVSlRBRkN4eE9rOUFaVERDRHhpU0FwcVFQVlhqZ3Zzd2FtTTEv?=
 =?utf-8?B?Y0ZIVGt5c00ydElpc2J6b09DTkdxT0xqeVlZUjJMVStZV3UwTDNHSS9GNzFq?=
 =?utf-8?B?MWlWajlORitGMG5iMlpJTlYyZE5LdU1UTjFyZ3hQbDNISUpJZ1hEeU5sY2g1?=
 =?utf-8?B?amRTY1lEaGpicGZ3MlRsUlIyd3BaaExsOXA2Y1hHeURIRTFodzRwUDMyNHhp?=
 =?utf-8?B?aDdmWXZWdGswUDZvMWk3QUN2M0wwTGtqWHdHMGR6dCszTFhZcUFGOHJRVFMw?=
 =?utf-8?B?cTZESVpEL0s0N3ZhV005R1RZWnJFeHB1U2pZUmdkZ1dLZWk3QlVjaHg3R2Qy?=
 =?utf-8?B?RlBNUkwyREtIanoxb2tsQ3V0aklOMUZqS08xSlVycHVBNlptNkFCdFhmRzFI?=
 =?utf-8?B?cngzdHNTcm5Eb2JoVE13b2ZUZzd3M2VwYlkvczhZS3FGWVIrQXlpWnlLendR?=
 =?utf-8?B?dXN6ZHlhK3drQy9RL1AyUUtiQzR6Y3N3QVhGY0lkUk5aQm5kVldJM1JHVmU2?=
 =?utf-8?B?aDdzTDBQaklqQ2Q3a0krbXI5dWtJWkdUM2tVZGJLbFdZSkdOMXFub3BXNjFR?=
 =?utf-8?B?dnkwWHJTSzZLWjNCWFAzdm5PdnV6L083bUt3RXA1UFdoVWd0bE1CejBEdENl?=
 =?utf-8?B?NzdHeFVTbnVzOXU5bkpCZkN3ampyYTBuVkNmVE5FUzJWaEVYcmRydFQ4MkRJ?=
 =?utf-8?B?Unl0T1d0dlpobHV3R1JuMUc4cDF2RHg0eER6alVNM0hjZ2M0d3ZqNFJ3WUxv?=
 =?utf-8?B?TjRZcy9FcjN6VVN1VDA0YjJ2TnE0ME8yNEV0WjlYN0JBVGlkU1JlWjQ0WTVF?=
 =?utf-8?B?ekNuZjBya2NnWVNBRU5mcElCbkRndzB2OUlRWTV0UW9HcGZuOStjRHc1a096?=
 =?utf-8?B?OHZPNGp3NmpLck5GTzliQWlpbjJHNWtJWWJwdVEzWTJ6dU1ZOWdySzdsbWRK?=
 =?utf-8?B?VTQ1MmhZZTVPdk5wTTNHY3Jud3I5dlVhL0ZQVmFvV2d6YUpDbzVDR1RibDR2?=
 =?utf-8?B?R0pZaVZ2MzNmZGxYNUxydDJuUVB0Qjk5di9wWjVESit4SHZySjRhMm9BbGNS?=
 =?utf-8?B?T2lEeEw2bXI5ZjJMMDRielJNUnNMVFhHTlY3UXFDbXJRL2tFelpXWFdZTEx6?=
 =?utf-8?B?MVc2NDFXSHRKbEFsYzhYTnR4Z1ZhVUkyVnkvWW0wMnZ6a20rcUIrNEV4ZzBt?=
 =?utf-8?B?WW4vQU1iOXBjajZRU3p5TUcxTE4wbTdKa0VuRitCNW9MZUJISnM3cithV2xk?=
 =?utf-8?B?MXhSejlNWFRsM2ozVkRCZmJOSWU4WmlMQktTWlJpSE9QUUZhZ1dSSUhKSnZl?=
 =?utf-8?B?R2tkWXVHMytoL2ZlZGc0V0QxR2dzbDBsL0tpNnJTemdZdEcyMkhNa2dyWnRw?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	se9muSsW5VxqpN/E8V+1PoGEQo1IJjtJ5wIV+TBZg3R/ST9b2hA7h3IruoobLWeq5xkPnPJYZtlZsNpSeeFcGDI8ubeTUjclRya9Jag8BkZNRR7WfemVj3QwCGRekOQ/C6IG9BxQjxoe3PD5veVMMFMZEOZh9OUAVZq2/6WK3Xvh1w8FylteSpVCQgincPkA18vDu0WrhwfOhjByy7OZJzntdoPWspi0k+FQmPbzKLiL4CZTPT/o0+CJQ7W/wk3kHqCOfmR5zEF3aX/BdjBkLxYXF9ujNgg4kfKuVY4bFTctTGN2QthAw1bocaO79SGkpdmh+Q+cfGSv2Wcec9TkAcA0MewQFS1FPl6kwSOADU1dqDygVD3fbXZOPZB7neQQQ7yl8gwM+3TspkaB2p3c+Ms/zXxZ+u0VHX9KxFYGXKESp7l/nZT3kBksRpdzqiCuiPqswcOdtdAu2MTUnNN7OAOyMwxnYuX3M6/PBvqYzN05nYQjyB7phs2pflk6qGIah96uBoCMnuCt4mUGzY4itV1uy+HiejNvtIAuWd65suLbNBXM9IjO2w4OSontbeev2ualPabP/Bj1bbaLNPoBKJkHTbEuvTbvBzJWGqdkrDGeI77unP5ufGdgSy7kAH/yl1hEoINMe9HKWbW5xKtEpse2nw67aAvcfW8lri3kAgWi9YLA5qKAaM2bTBPK9HLRCxzIT7+Aubsgf5MlO6iCkrHPbYySEjcMDVfjn91haK+dik1dSvKPCuOLUSBQUgYuK4bpts07dsiFx0MoigNfdTMX85AMaJZq9Qhb9I/zKQz68DRlMWqmLscmuwu6XZbu+j9OeSRrXzuRzimZzH9okg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4cbd49-24ce-4663-0a9f-08db521d63f0
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 12:43:59.0716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ssNzWB2+HyuPG6hXUPGKkLJAS7sSwgrCCjPTrqR4gJ9m6Zkw6O8Jx4H3LozKfeKSzJw2/7b3a6ySwHqZO/tFJkis3rLxthTxN8djxVf6MUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5069

On 11/05/2023 7:43 am, Jan Beulich wrote:
> On 10.05.2023 17:06, Andrew Cooper wrote:
>> On 09/05/2023 5:15 pm, Jan Beulich wrote:
>>> On 09.05.2023 17:59, Andrew Cooper wrote:
>>>> On 09/05/2023 3:28 pm, Jan Beulich wrote:
>>>>> On 09.05.2023 15:04, Andrew Cooper wrote:
>>>>>> On 08/05/2023 7:47 am, Jan Beulich wrote:
>>>>>>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>>>>>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>>>>>>> code which looks like:
>>>>>>>>
>>>>>>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>>>>>>
>>>>>>>> However, GCC 12 at least does now warn for this:
>>>>>>>>
>>>>>>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>>>>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>>>>>>         |                        ^
>>>>>>>>   foo.c:1:24: note: (near initialization for 'foo')
>>>>>>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>>>>>>> the arrays in question don't have explicit dimensions at their
>>>>>>> definition sites, and hence they derive their dimensions from their
>>>>>>> initializers. So the build-time-checks are about the arrays in fact
>>>>>>> obtaining the right dimensions, i.e. the initializers being suitable.
>>>>>>>
>>>>>>> With the core part of the reasoning not being applicable, I'm afraid I
>>>>>>> can't even say "okay with an adjusted description".
>>>>>> Now I'm extra confused.
>>>>>>
>>>>>> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
>>>>>> when I was expecting one, and there was a bug in the original featureset
>>>>>> work caused by this going wrong.
>>>>>>
>>>>>> But godbolt seems to agree that even GCC 4.1 notices.
>>>>>>
>>>>>> Maybe it was some other error (C file not seeing the header properly?)
>>>>>> which disappeared across the upstream review?
>>>>> Or maybe, by mistake, too few initializer fields? But what exactly it
>>>>> was probably doesn't matter. If this patch is to stay (see below), some
>>>>> different description will be needed anyway (or the change be folded
>>>>> into the one actually invalidating those BUILD_BUG_ON()s).
>>>>>
>>>>>> Either way, these aren't appropriate, and need deleting before patch 5,
>>>>>> because the check is no longer valid when a featureset can be longer
>>>>>> than the autogen length.
>>>>> Well, they need deleting if we stick to the approach chosen there right
>>>>> now. If we switched to my proposed alternative, they better would stay.
>>>> Given that all versions of GCC do warn, I don't see any justification
>>>> for them to stay.
>>> All versions warn when the variable declarations / definitions have a
>>> dimension specified, and then there are excess initializers. Yet none
>>> of the five affected arrays have a dimension specified in their
>>> definitions.
>>>
>>> Even if dimensions were added, we'd then have only covered half of
>>> what the BUILD_BUG_ON()s cover right now: There could then be fewer
>>> than intended initializer fields, and things may still be screwed. I
>>> think it was for this very reason why BUILD_BUG_ON() was chosen.
>> ???
>>
>> The dimensions already exist, as proved by the fact GCC can spot the
>> violation.
> Where? Quoting cpu-policy.c:
>
> const uint32_t known_features[] = INIT_KNOWN_FEATURES;
>
> static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
> static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
> static const uint32_t __initconst hvm_hap_max_featuremask[] =
>     INIT_HVM_HAP_MAX_FEATURES;
> static const uint32_t __initconst pv_def_featuremask[] = INIT_PV_DEF_FEATURES;
> static const uint32_t __initconst hvm_shadow_def_featuremask[] =
>     INIT_HVM_SHADOW_DEF_FEATURES;
> static const uint32_t __initconst hvm_hap_def_featuremask[] =
>     INIT_HVM_HAP_DEF_FEATURES;
> static const uint32_t deep_features[] = INIT_DEEP_FEATURES;
>
> I notice that known_features[], as an exception, has its dimension declared
> in cpuid.h.

Ah.  I had indeed not spotted that.  Sorry.

It explains why all of my test builds (checking known_features[])
appeared to work.  I will rework these to have dimensions, because it
will remove some reasonably complex logic in gen-cpuid.py.

>
>> On the other hand, zero extending a featureset is explicitly how they're
>> supposed to work.  How do you think Xapi has coped with migration
>> compatibility over the years, not to mention the microcode changes which
>> lengthen a featureset?
>>
>> So no, there was never any problem with constructs of the form uint32_t
>> foo[10] = { 1, } in the first place.
>>
>> The BUILD_BUG_ON()s therefore serve no purpose at all.
> As per above the very minimum would be to accompany their dropping with
> adding of explicitly specified dimensions for all the static arrays. I'm
> not entirely certain about the other side (the zero-extension), but I'd
> likely end up simply trusting you on that.

https://godbolt.org/z/c13Kxcdsh

GCC (on both extremes that godbolt supports) zero extends to the
declaration dimension size.

~Andrew

