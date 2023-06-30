Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC1743D47
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 16:17:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557501.870878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFEuy-000525-OG; Fri, 30 Jun 2023 14:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557501.870878; Fri, 30 Jun 2023 14:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFEuy-0004z2-LO; Fri, 30 Jun 2023 14:16:12 +0000
Received: by outflank-mailman (input) for mailman id 557501;
 Fri, 30 Jun 2023 14:16:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHd2=CS=citrix.com=prvs=53833986c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qFEux-0004yw-Mv
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 14:16:11 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a838e912-1750-11ee-b237-6b7b168915f2;
 Fri, 30 Jun 2023 16:16:09 +0200 (CEST)
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2023 10:16:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6913.namprd03.prod.outlook.com (2603:10b6:510:166::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Fri, 30 Jun
 2023 14:16:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.019; Fri, 30 Jun 2023
 14:16:01 +0000
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
X-Inumbo-ID: a838e912-1750-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688134569;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NSdbtmEUzY0770YpRPl72/mhY8NNZa1mGu9fHQKZohU=;
  b=M7TTQeUikr56vVJYqxJ+M40OQZUBG3Qmv+fAF92RKToZnSsdUFBPovKD
   tTjPGwug0X8WY/m1rJp1XBc3cqEusLw41aKhazmR+DhTnDeK6Xd2CoLI3
   jzhEwPmlRPknFtg9n4P5+4Z3xmMR/ey5g39hmR5YG349OTCYak/RXk8fB
   Y=;
X-IronPort-RemoteIP: 104.47.66.46
X-IronPort-MID: 114771544
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IK2h86tuAxdYKpwuYFFlg88w0ufnVJReMUV32f8akzHdYApBsoF/q
 tZmKWzVafeLZWfxLo0kOo22/EIF75HSzNQwTws9ri9hQSxB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5AGFzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBRABbEmyuriKwYmmV8lqo859JvWwFdZK0p1g5Wmx4fcOZ7nmGv+PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0ovjv6xbrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeTkqaEz3QHProAVIEMqb2KihN2Bs1T9dfwCL
 kUyyC1tirdnoSRHSfG4BXVUukWssBMQVsBRGOp88wyXw6TV5QexDHULVTNHZ5ots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsRgwD+MTnvIA1gTrFU9l4Hai6yNbyHFnYw
 TqHsSw/jLU7ltMQ2uOw+lWvqy2ojojESEgy/Aq/dnqs8wdRdIOjIYuy5jDz8f9FJZ2xUlqFs
 X4LisWaqusJCPmlnS2WSeQJFZmj5uqJPTPRh1JiBd8q8DHF02a7fJpb6TV3LlpBOMcYdTLnb
 UnftBkX75hWVFOocKkxZYuyAsYryKHIFNL5W/SSZd1LCrByeRGG+mdyZEeW92HrjEUo16o4P
 P+zat2wBHwXDaBmyjueROoH17IvgCckygv7QJHwzx2jl72EdnORYb4APB2FaeVRxLOJpgTct
 cxWOMqDxxxcV/DWayzbt4UUKDgiJGkyA9b1tslebKiDKw5qFXsJAvrdh7gmfuRYc799k+7J+
 jS4RRVewV+m33nfc13WNDZkda/lWot5oTQjJyswMF202n8lJ4Gy8KMYcJhxdr4inAB+8cNJo
 zA+U53oKpxypv7volzxsbGVQFReSSmW
IronPort-HdrOrdr: A9a23:K2C0gKhru+FoJ0wEhzXatnfwTHBQXtgji2hC6mlwRA09TyX4ra
 CTdZsguyMc5Ax8ZJhCo7G90cu7MBHhHPdOiOF7V9qftWHdyQ+VxepZnO7fKlPbdBHWx6px74
 BLda9iBMzsZGIK7voTq2GDYrEd/OU=
X-Talos-CUID: 9a23:L4CuAGPRtyzn/u5DdQlr9hclJ5oZc0bA0VfWBkXmA1oyYejA
X-Talos-MUID: 9a23:lO5RfgrUXdf4M1JItHcez29eDv5xxoCWMVpOv7tbvsCiByszHCjI2Q==
X-IronPort-AV: E=Sophos;i="6.01,171,1684814400"; 
   d="scan'208";a="114771544"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CCZ/oKtQ+fqTRU5BuJaLWsgr3umPD9fZqfIVfCCDr6u2WDwNYzvH3mOjForj8aQZM3p1hBFpU2GmhYTeZ53ZBPWZ8n0UQ523+aPti3KCcH81KPkq8JwqzhjJ2PSj5FY05xmZfuMYIzWH4ZZO7Ny1oY+kBC7tLw/mQseEHKNfG3ONwExuh6leVP6mygnAraaDVRrsXVzthENgjlPz3T74tNFryB/dZnKMhLSIsNbBPMRCE6GiOIbha9BxryYDCcEK35Rbx9fIWJWmpsm7pbSzGigtLDBPJR/Fa/E/HRRzjcWP/5TaUUfdw4mbp2IKzUbvZ1MNkEmiZXntbgPT+GcDEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYZlIcGWZSSO/fOKj9E6L2yKtF0j7asYh+P7/uEn8k8=;
 b=Qqzd7sP/Zv+CuFw21cdVbCYe1bP5ToschA3fhWceH4LNTEMuj3m0v2c9scPT/t5wVkAzyZ73gjCE+f/0LZ1ha3d4wMnLKVCaf9CuzH7t5P673hWKDkYP+XluEDK0vX2v76UVTGvTetzjlAhvQQBjXTegqgkY7BMcgsJXli+H6GrGl7biLgq/ECl63sLhY+Dkugrr7SFniTrp5tlhCOOhnSFTL+maTw7Z9+Wpsin0CSVrTxioonfKt/3v8UulXxdOdivxrWWFOoMMcStf/pQyZVcvzkpJJHGRV0BT+L5bWcdjPibmYeQV2IaLG6rXv6HdYUHNaSiX/2gxv91edHD6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYZlIcGWZSSO/fOKj9E6L2yKtF0j7asYh+P7/uEn8k8=;
 b=G//8d86WaD5N+aIQ0zTcBBaZlCvwmVFT5LJIzedU2md0jCLLW8sUexwfJQiKmB4k7GlylEYYLhXahMNccuBGs5YV5ryyrDwv8PzL8X0/AxMcfgRlaMhmKoq6i6s9MG2+yQIpLyD/GFoqZdsm1I55jJAlWbZ15+4LoQNL/MX7E0I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f384ab51-6f96-1427-b473-96412c2d2384@citrix.com>
Date: Fri, 30 Jun 2023 15:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH 0/5] Fix violations of MISRA C:2012 Rule 8.3 on
 parameter names
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
Content-Language: en-GB
In-Reply-To: <cover.1688049494.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 5de7540e-2203-409b-7c89-08db7974880e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BtucBUYZuGaH1IzkXRSb3cG53iWtuA8Nbp2VYf3/MPgzOoGJPWs183EqnUD/aBzOSEOWm2VX3qjI1K7Baj4p3bF3vlDHiwQm57M0VHh7T/qCJfS0h8iwDImpXE984EAWRITDTrlwrI84Z0NGK4VKrRXzBgZ1DiFa0PaNpb8LYuICeK++RArlGVXD7R/TUUcazwzekF8fvKgDsNmiSZ1rIciQ1bJ0VFX1+rzdD30PnMZVgnkFcCug4887v8tSvQ7N83qLoR6MO3wSanT0f/WFgaiQEklAzwUfe0AqKcsIC962qV6XJl+k1t8g90DfCigyNGivkgDy1SqlTFKTsVNtMaqbHAT4P5fECRLr094N3P21OcZlo3vm8ug5kBtt6zPmMUgIxIfrXatux+W3o1GHVWeIIT+683APQ35qc+pZdemz6lKLQPBSSsKo6Y7OFqYOuThgjjbqp247+1RjUVK3bpvcPHalm992kanh8uNVaqy5bQSfcPRGTkss/w1mqKJ2tJh918uIPc/PzC5PSB/AV2qAALYqPmkSwqda3xX8raDBpi7Qipfb9H8ouFm/GCV7A6fyuxyzHcGAPQX7YaUm36tFZELtf2UrHwn86CVU5ZEKaD9UF0lUlQ2trUspiwLQI69SNGOF4Vy8sHqOJY00YQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(31686004)(8936002)(8676002)(7416002)(5660300002)(66946007)(66556008)(66476007)(4326008)(2906002)(4744005)(316002)(41300700001)(54906003)(478600001)(6666004)(6486002)(53546011)(6506007)(2616005)(83380400001)(36756003)(6512007)(186003)(26005)(82960400001)(38100700002)(31696002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDU0VUh6SlVZVUN3S291czVlRUtDTE0vdStqcE8wREJJQ3JoMEVENHJxc1U2?=
 =?utf-8?B?bFlnNG9qWVZta1JVTmFNbEFoMWs5Qytzc0pwMHBmMUNoVkJoNll4UDZqQmZu?=
 =?utf-8?B?Y2VZVXZTTGRjTGZneHFVUjR0Q2dENHgza3hvcnZ5SkNvSWo3aVhFSXZZbU9J?=
 =?utf-8?B?a3ZzWlI0QWlaMHBGNnNKenB2ajNCWUoxRzZDM3hRMkQydStNRDRxZEYwU3Rx?=
 =?utf-8?B?U3IzblhjZzM5Wms2Z0sxS1pud1AxN2ppM00wZTZWbmFrOXhramwrQkZwWktJ?=
 =?utf-8?B?bWVvdmdDY3Bkd1ljaEdpS3B1bUlEaGR6cVhYVEw2dXdrZFczRC9WMlJtT2hx?=
 =?utf-8?B?MnBiVk9IWG4xVlJwOU9XUnpnU0YrQVV6VCtNN0JWNzNRa2F4K05DUW5tM0RH?=
 =?utf-8?B?RXdlUUZJVHJKM25pN2Q4ODFoeVI0R2NLWXBzbkwxKzV6ODFRRlJxWGMvSzZ5?=
 =?utf-8?B?dkJhV2xtdGNEdlQzc0VKOUpjcEwzUFoyRnd1OE9teTJxNEZ2M0d2SHZtTlN5?=
 =?utf-8?B?MGJPelFTd2dkeTNsTmlsWGZnWmhrMVBoVjJUZ3JZR1J4amI4MzZnTU5yeElp?=
 =?utf-8?B?WnlSWnAyTG9qdkVpdmFKR1ZwTE1FTy96UmRRTUxkY2NZOXN5ZWt3R2VlZUdS?=
 =?utf-8?B?UkJheVI5UzRhQWJBbWNIMmI3ZDk1VjRYTTIxNy9NSFQzMjFzOEVMVEkya0R5?=
 =?utf-8?B?bDA5REk3QlpnY0hRRXozK29ic29SVW9tRmtqVTIzSzRHcThJOXgwR1ptSjFt?=
 =?utf-8?B?N2tzYlRXalJLQlVqTFdJV0Y5ZHNvTUl4UXBHU2pzcVp0RjdKL3gwVXpzSWpG?=
 =?utf-8?B?cWxqdUJ5VEZlc2NzODd6cmFMK1hhelBmNzRWZHBTRXdnQS9FSmwzeHZPVDV4?=
 =?utf-8?B?eUMyOFhIRGdoWFhaekc5bUVDb2M5OXlvbENla0MwSHh5Q0JmbVMwM0x4Lytu?=
 =?utf-8?B?NHhDUnJmbDNyenNYV2p6YVZ6aFRFRDBaYlVELzFZd1RHenZOckVKRCtKbnh0?=
 =?utf-8?B?ZDRzL1ZsL1pKbFNSYTFUcVFDOUw2UWNPM2xIVFFhZ3NUVDh6eUt2bGk4R0xv?=
 =?utf-8?B?eER2WmlSY1lKVC9adDVrSDhVTDh3R1JwSEx5L0ltekticThNaE03VnJSZENW?=
 =?utf-8?B?UEYyK0ZzNEVqbzdjM01OODRHZFM2YmJLbEpnVWlCL2JaQmhsVWEvc0hNMmdH?=
 =?utf-8?B?clNXa3RFOTFXZng4OTFEeWtnYnVoYm8reHYrVzQ4WDVwWjQyRE0xYlhMbnUx?=
 =?utf-8?B?NnNnMDQ5bnFwQUZxaG5rMmFycWNZZzBpVVR6ai9ad2JvTEZya3ZUSkRZZHlo?=
 =?utf-8?B?UW8wa0JnZFp0UGc4YzlDeU9UdzZyR2dJYTkyUVE5TDN4SWhuTDdld2w3NHAy?=
 =?utf-8?B?L052QUVKNElsZUdaVC8wakpmNFdxMGhtR2ZqZzlZU0U2YkpHaUhJRzVwZWFY?=
 =?utf-8?B?QlV6bmFCVm01M1ZsamNuTVpZekNGQUZ5djBSenZNK2lvWVlGVUJQUnZJa1J5?=
 =?utf-8?B?WXdXMWtzd2VGbkxKRFdIcCtNVkFRbUVEUlA1RG15Rmkwa2lWMGRoaE5QUHVT?=
 =?utf-8?B?Y2ZiZFFaVVBxbGlTczlPbXFkU2hTS2haSjlCS2N2WHR5UmhtWmF2ZjVIOXBV?=
 =?utf-8?B?akZtUjNaUzR0RUcvMW0zbE82Y0JqTDk3S3B5UG4reENzdUNSaEtKTmh2eXg5?=
 =?utf-8?B?UTA4enBHUmkzRk1qRmJuai9KL0V1QjJ0T3l3OWxITUUvajFPVm9iUkI1QVdW?=
 =?utf-8?B?K3Jpdm8wOVA3c0JpMkwzNVFEaTVmNEptUG9Zd0dQckJkcXF5R3lRc3FSMmNV?=
 =?utf-8?B?VXl1Vi8xNjJJVGFmVzJueUlLcEdTS1lMbmQrYXo2TStITDVzb24zeHUzMmxP?=
 =?utf-8?B?eCtISjZrZjVscGEvUjlMbG5FYVRPb2J3TXVEbEFCY25RV0ljZDhOR3lnbGE4?=
 =?utf-8?B?U3Z3bUVUb3ZINDlTTjd5aTJYeWg4WFQ0cmhJRnpndHppYktaeitab3ZlNmdX?=
 =?utf-8?B?Wk0wK3BuZnhIeEU0VEJ5MktsbDBPYTdFbzdyMFZhOVNuSkp3eE1VQ0RuQysy?=
 =?utf-8?B?TlNtWTZyUzNzeGExTXVTdWdidng3aDhaUmptSnQ2NFNJR1lnVlRNLzE1L1Z5?=
 =?utf-8?B?UTZXRCtWVVJPMUhhOTBuUUxLcHZTbDlIQjgzcndqK2d6d0dRSmRXN1NTVkRZ?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?T0dVK0wvNS9yY0c5dGNNRGVpeFdnUXd0Rk9VVDBkWkRhS05oWkRHcldmRzFa?=
 =?utf-8?B?bEp0UCszcXIyMzFFZ0N1a2FvMGhLZW9ObU9ocHplMlB3NzRyL0JnWmRhUitD?=
 =?utf-8?B?emV0M2QwN1JDMFBQcXhCODJDSWFhSHJ6WjlFd1ExenFmTkhEYU9xQ2ZBSGNk?=
 =?utf-8?B?N2NyRjZyYk5mWDl2S1BYTUVQdit3LzJDc1E2aXZmQmpyaG5COHlYSnF6Umtr?=
 =?utf-8?B?WDBpR3kvQ1I3YjY0VmdTODFWbEs5b01BejdXanNhb1dwQ0JUT0JuNGQwYWZ6?=
 =?utf-8?B?M3MxNS8rQTNkd0tPaFRiTXR2WmRqYnN2RVZ4dGhWbDkyeUtMSEtRbEwzdi81?=
 =?utf-8?B?SHhZa0E0cWhoTWxOT2JqSXMyazV5eDlpZTZlYkZnN1lTNzBpWmJyRDllV0ww?=
 =?utf-8?B?ZEx0R1grbFRmZi9pK1JNK0J3ZGpRQmhOYVErYjJEV0FYVHQ2b1BZLzNVOUpa?=
 =?utf-8?B?cnd2TlVKR0dWZ0FHa2p3a2FMWkt0VlVCcGhqQlczdWpWK3BpZGFvSXNpYi91?=
 =?utf-8?B?ZXRUcFpUNGlGVkVLRS9OUUNXd2xtMVFTd3dhWGoyQTd3K20zNURzZjRaOTl1?=
 =?utf-8?B?ZUVha1VGc1RobDFTMEZwd2pzc0ZTckIzeTVYOVlGU0pCMHJCTllvSFVSOG1u?=
 =?utf-8?B?V1VVZHdlc2JVOFVFRjlqQWlwbHBTaUd6Q3BBWnNHQk5OWDJSSkVwK2xheWRY?=
 =?utf-8?B?VGpJSVFwU0Rqamh0U2hVVmVCaENFdUp6SXN0aGFtNURjSG1QdU0vUXdFR0VL?=
 =?utf-8?B?OVdTa2ZVdDdIem1lRFhzUE85Ty9xZmVQeWl0VFpuMHdxdTdydGxzbHIrcnlk?=
 =?utf-8?B?aDY1Q3N0NEwyendMc0hxeU5iV3A5dkxXYnE1dGh5ZFpUL0N0TWQyYUx0dW5W?=
 =?utf-8?B?VDFIK1Qzc0RaZ3Z6Y25LcUFUZVlDNjdnZmNEbVdpd3UxMjFtQ0czcTJibVZz?=
 =?utf-8?B?UHJ3ZmZUc3BnT2lkekM2djRZYkdDRlBSKzFTcGphNm5MSWcxMXprWVhhNTY0?=
 =?utf-8?B?Z1VHK0JNQzMxME5CYnN6MU12VmM3Y01SZkdiNlppWFNRWGpjcXlPL3B2aWFp?=
 =?utf-8?B?eUZDVXZWeEE0VHVrOTZXYUlBM3RGaGlWT3VKSWtQNnA0RE1Nd0xXWmVpNG12?=
 =?utf-8?B?ajMwdFRWcmhGOGVFQi9JdkVHUHFkMzM3MlhhdWxzbVc0cVFDUTRucDhlcU1H?=
 =?utf-8?B?WldFK2xDNXBoKzZFaGUzL3NuU0pDcWlkNjZBVE93Z1ZTWXNkT0Flb0M3emQ2?=
 =?utf-8?B?NTh0ZmltR0FjRXBTYVlZbi9RQWNUVVhjZWpxeTVjbXpvZGRlV0N2eDhDM3A5?=
 =?utf-8?Q?dMpUsfsMP+VZflePca4W+mfrZCfSeon2wr?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5de7540e-2203-409b-7c89-08db7974880e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 14:16:01.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzUNdeeusGsS+6G/xjLkIdMPzCRk3aZuRxsEkdb/sCLaFtrMuNZKg/+XFmsmeYLE368mw0qVdZ5vGI6SXaCsFBoVie2DClYDwSmg8Wv4g0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6913

On 29/06/2023 4:55 pm, Federico Serafini wrote:
> Federico Serafini (5):
>   x86: swap parameter names of hvm_copy_context_and_params() declaration
>   x86: change parameter names of nestedhvm_vcpu_iomap_get() definition
>   x86/vlapic: change parameter names in function definitions

I've acked/committed the first 3 patches, with the various tweaks that
Stefano identified.

nestedhvm_vcpu_iomap_get() is utter nonsense (it would absolutely not
have passed review if I'd seen it before it went in), but untangling
nested virt is multiple cans of worms, so I've put the name changes in
as-are to avoid blocking the MISRA effort.

The final two patches need a bit more consideration time.

~Andrew

