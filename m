Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24894725B5E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:16:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544668.850609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qDI-0003He-Ih; Wed, 07 Jun 2023 10:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544668.850609; Wed, 07 Jun 2023 10:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6qDI-0003Em-EH; Wed, 07 Jun 2023 10:16:24 +0000
Received: by outflank-mailman (input) for mailman id 544668;
 Wed, 07 Jun 2023 10:16:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6qDG-0002Ig-Kn
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:16:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 588aec85-051c-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 12:16:21 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 06:16:18 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY1PR03MB7239.namprd03.prod.outlook.com (2603:10b6:a03:534::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 7 Jun
 2023 10:16:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:16:11 +0000
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
X-Inumbo-ID: 588aec85-051c-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686132981;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/gNm6+CfLO0ptz7VZDZ41Bg8E8kNfaw4fQ4ZupxO2sE=;
  b=ElC/1U/el6OR1V3806C1Xnoa6a6CJzyKUVV8yWKGlmXXpqYFvZKeEKB1
   LtXJEH8S7z7ScsthV+bUOVu19/3BiOQKAvP8ZeMZzu2sLj8hJSemtZ3Ze
   MEXoz51Dv5MTugrQdpZSO/Zr5jyVgueTgaHzpUgyqt5qz8EW8M6/IgoYv
   g=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 112306542
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vwXWz6l1zOo+WahUkKWtLEvo5gxUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMCDuAbvaJNGKmc4x+PITlpx9Q75XXzIAySQY+rCtjFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5KyaVA8w5ARkPqgV5ACGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cc8cTNScTGDvtj1npmVQdJSnochN+C+aevzulk4pd3YJdAPZMmbBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3ieC8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTefjrqA33Af7Kmo7Fx8aaWaKuueFuhCbZf1Zc
 EZO3DYXlP1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xBHUATzNHQMwrsokxXzNC/
 kSSg9rjCDhrsbuUYXGQ7LGZqXW1Iyd9BXAGTT8JS00C+daLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2GEUvvhjutot3FS1Az7wCOBma9tFohNciiepCi7kXd4bBYNoGFQ1Kdv
 X8C3c+D8OQJCpLLnyuIKAkQIIyUCz++GGW0qTZS81MJrlxBJ1bLkVhs3QxD
IronPort-HdrOrdr: A9a23:qHY1H6HeZzNOTA3GpLqFBJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6La90dq7MBfhHPlOkPQs1NaZLXPbUQ6TQL2KgrGSoAEIdxeOjtK1kJ
 0QCJSWa+eAc2SS7/yb3ODQKb9Jrri6GeKT9J7jJh9WPH5XgspbnmJE42igYypLrUV9dPgE/M
 323Ls6m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUaqFh/dL5mUUtDPpZwfSKWMB24ffueChPkHb2gLtBNB07w
X-Talos-CUID: =?us-ascii?q?9a23=3A6KmDJWlDAVhMMOiHPpXTRr8cUNfXOUb5lXSPPG6?=
 =?us-ascii?q?4MFwqFpa7QmSu4OBmiOM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATCB+UA8OJFHtClwHBVRbbcOQf9hq75iTOVsTraV?=
 =?us-ascii?q?YnverM3d6YRGBtQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="112306542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dvt8SGQ+Pu8IMlGyq/FoNlD4F+N0JCOH5F6nAJabVpvXc/N6e6CdpJRcb93IHknWNiY5Rj5kNWgfAwWlakhDgHVt6oeTA0oFh6WEV7QAQPHZXfTiidrGeeAHQA2bb3SWhWyCQWXnntBeCbCAP2if+zY5ZeqJgfT23xJqo07fgShZemi6YTF5o2Mr7pT8jka1ZGj8SF5SiL0bCujm5Q40pteusZmj1P1qTIFfjTID0emu4+wsbCk2DJgq+NO6IRdVlpVTW+CXlQbD15XZ30Y3xhakSCHaAbt0uzFJcGTtzR79gA+6N68WPrm6XZii9JxC47KpxbT/AMrox+9buYOhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrwK6+fhZcohYE8jUc1dakYfq8Ws9LON8Axv9ZQrpRY=;
 b=VK3T92h05Ni1iD5BsGlbiAsS5e/1NHj9Q4gn0zw52C6hFm8E+JPZsQFLlHeREsWo3AW57Wd86KAueDh1DaTWUdL9Iu+ulM9bK5z5txwoYqJTGPGasTQJQLMORhuzrsf951dQEan+LMU0qUHqy97nIrKgBfcJctogmpmqjoNCmpb/oTuvauTDmNuC6QeF2EgU0fbvm2SOGqcunCxLseJq4lZAx/vYSJmMv+Y6mc0Jmsm9OATNpChUcvIXUr7bV1oEoE9WBIXtzrDtDSuqkQOWyAdRo4clQwDm7D9DULjngMgV+p+RYm3jSpfkg4DmUcieYN0YO/9xgTmjfT42OW8G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrwK6+fhZcohYE8jUc1dakYfq8Ws9LON8Axv9ZQrpRY=;
 b=dRXrJU0XxEan1FCRFUopER/PcO/xrUv/dHsYWwsTUzUJgER/EX2rFcxlfbYYKDWVkhHS6o/w0xAeaByUSfeVsBE89T0vQa66rKy6tmYvu79tQ5b3/5dPS+Mbm3mb7Mz4q0zvzPrdmqiDwVLoRLAg/9jy5oO9RUpXQ0MQvK25Kyc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <26555c3c-f68f-c6b8-1926-7e9f35a6b820@citrix.com>
Date: Wed, 7 Jun 2023 11:16:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 3/3] cmdline: parse multiple instances of the vga
 option
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-4-roger.pau@citrix.com>
 <0a0671ea-9209-37fc-1d9f-1c38aff45bba@suse.com>
In-Reply-To: <0a0671ea-9209-37fc-1d9f-1c38aff45bba@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0278.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY1PR03MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: e72e0dc1-652d-42ff-11af-08db67403737
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqVxp5qWIJGDEvRrzKL5h1VsAJF0CR3ezW8yU4ZmR5m+5NsDDx/RNCSDxiej7mdXL7SfNKnN0tFzd0QQ+oJ4tMr2VprNT83HR9bFM05U0xgquPGgeVLXje+V8nsQhB8oBK9dUhd9Lsq2hkb1YAfGY7sszFqj7XclZ1uH+45WpKwuyVhSPITSbC9rmFOuNLyOV1f5CnIlpgQC3svTXjfuk6v6pAGovp/Fn+Q/uRR67zYwlnXeKsDjM3nGt8WsJsdx9GnotntQJwPQityq3iCFYSZiAIo2idIwKm2A5h04UOAE8vpHk+lG6R9ABINM54YDahX+92cxcfCXdMfm8V9+NpfI1KEIJ4psV8dxymMa4/qWPVtuNJztZ8xWGInUcZk+S5i8DS2IUqmyp6f0scWsGMs0e5Es7xIQmYxQgNvJ/YGaCtDlKju55A3vDQi4evnZUPTXDZlscRGEhG3/tqPce71sADwyHnsJIVIBcGqBMbEj3YJgq9Gp7/WJp9/D1J3hlS0xaknrrmcor53FYWsvlWWEJXMpQ+R44Rc1L6o0PgfvrAZJPZDICFCjV8eK3Rn0TRvUOexLXXNV5FX6SszOd51y+PcHb1e0B66hEEF2xXlqyAds295XbMj7MnRaqTq4RxaLT05DELrU00sIg5BVzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199021)(26005)(31686004)(53546011)(6512007)(41300700001)(38100700002)(186003)(6506007)(6666004)(6486002)(2616005)(478600001)(54906003)(110136005)(8936002)(66476007)(82960400001)(66556008)(316002)(6636002)(5660300002)(66946007)(4326008)(8676002)(31696002)(86362001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anJtT2dDRnhoZmZQdzBmdS80MEM3NHp0UVpRNTQ1ZjFjOU8rWTM0c3BYV21F?=
 =?utf-8?B?dmZ0NWJvbVZpS1pnZFBoUTJIbDRWOWg2L3FJVndZYmpDZnIrZ1VDR3RwSjlm?=
 =?utf-8?B?SWdLV0haODRyNStmWDI4RHpuNGlrcFgrUGx6QlNwR1JoOFQvR2pFdmt4bjZp?=
 =?utf-8?B?MjA3bFJERzBlVjcycVVlNVZiQ0x1MmlqVEh6WDQ1SmtWeHRqSTVtMGNsSExL?=
 =?utf-8?B?Q1hpS1pZTmdqSWZMbU1LMVBNeHdvUjRDUmdTUDVHeVgwdkE2NVZuQzZ1WitH?=
 =?utf-8?B?UHIxMnN4OGY1SWhRazZ2VjgzVlV6Smk5K09hNW9LK21jME9zTjJpVDB5N3hx?=
 =?utf-8?B?dEt3QWRIN3dwZkNCOUVtdFJCVEJVSjc2N096VW9BTit6bEhwd0xXa3d3Zng2?=
 =?utf-8?B?cVJmMzAyc0VqclE1M1RNTmM3MmRYdjEzUnRzLyszenNLNWQraS9JUUExTWNy?=
 =?utf-8?B?SkF2d1A5TlkwbjVIbE5UZ3RGNTdCMlozeHRrVmJSOW0vQTluUmtCa0JobDNq?=
 =?utf-8?B?dGtWdDJPQ3paZkxSbTVnU2QxT05IRXJ3Rkh6azg0NTJrWi9KOU1WenZEWXlT?=
 =?utf-8?B?Y1d4MHFOVjB1OUVBWmNuakRyY2tIV09xaWZLL2daeW0xMHg1dnRrUFhzV1Vx?=
 =?utf-8?B?bndLeHh0WVl5V1RZd2poOVVjaTZkbWJydFd5YzBoYTBZVlVMcENGY0RlZEp0?=
 =?utf-8?B?MXZ6SVVlQlRqa1hKUDJFL0xaN3dDbGJKekE3SUxjd1RKcWlwSGxVaTRqMzJB?=
 =?utf-8?B?bEJDald4NHFNd09KRklwWEZEVkhqaWVZdzZmK3ZOTWlWc1RkRGpVaTZydlh1?=
 =?utf-8?B?bXlkY0pQZitBV1U3VlErWk5GV3RwcGZxcXJSVi80K1dJR3FDVVRISDZXbCtL?=
 =?utf-8?B?aSt3MEp5RnRvY0svdm9rMFJjTkgvc0RpMGg4WVQvN3RlL2I4NCtUN1p3dnZX?=
 =?utf-8?B?Rzlza1I4a0c0cmY4OUorMGdDamtGY1RmeVFDUlQ2NWpkQ0YyZEpEWVFndE5a?=
 =?utf-8?B?UUx4ZC8zcVpkRldVWGp2QlQ5OUpUUG15VDZDL0tJWko4T1JJS1o5TnVLeW1W?=
 =?utf-8?B?ZVRJQjFPbGoxWHk4N1BEbWp5eVNSRkpQU2RIU05tei9oWmw5OVlMck5Wb21S?=
 =?utf-8?B?VTBhZnFBSmxMYVRiODJTQ2xrYndkMXJOT3h1eUZUaU1UWmRTNGFtV2NGeDBu?=
 =?utf-8?B?a1FNUm81bit0blR6ZWNiQXlHZG9vanMxVE1TRTFQekl3ZFJ4WStaQ1JrU2RV?=
 =?utf-8?B?ZDRKdjlDeVZSdzB5OExmTFpvY1JDd0lBbHZ3SDFYbUpyeE4vN0pvVHF5UXVM?=
 =?utf-8?B?eW8rcGZLdUlUdDl2K0FGSElxTUJxaWdGSXVqT0M5MzF6RkRyTi9Rb2MvUWdj?=
 =?utf-8?B?UzNLRGViWjM2Uml4L3g5em5BL2NraW1zMFpvRXhsUlNIMVhFZ0tDOXQza2VT?=
 =?utf-8?B?bVR5ejZMcWxSc2dBNG0vZFhGNHVIK2ZiVVB0NGFjc0QzSEFNMnZyNDEzc3FG?=
 =?utf-8?B?VjNzK1F3bkJXcm1pOElCN1hLcFZPNWxBZ3hLVWsrTmF2ZitZQWxRMkJ4YnBC?=
 =?utf-8?B?NUFLb0RnRzhVbDk5aC90UVIyWmVDZis2TXMvT01Ed3NMd2psZDZxdHRhbGNn?=
 =?utf-8?B?Y3BSZFFRaXBwVVZNTzVFT0lVWVAvdVF5N3dWMGUydFRPeG9LdENOZjhLdllR?=
 =?utf-8?B?M3Mxa2dVUSs3SkwxQ25MaEVleUlnMDNya0NYM1MxZ2YzZGp2aTZaR09KRG4v?=
 =?utf-8?B?ZUZmQlpRMXFnNU1ESGo2bUdZaGtJZzlWYjZIYnZUSmZ4aHlPQ0xJaUQ0VjZq?=
 =?utf-8?B?QzlXQUlUeVFmUndmNllKQWJEZU0yU0lXaUYzbnl0RzMva1l2WnZRUnFIaWhZ?=
 =?utf-8?B?YjNrUXF1cVZsTUpkbUV5L2EwbDNXbitBR1RnbXY0V3RwWFJsdThBSm52bXhF?=
 =?utf-8?B?OHNFTUlJNmR3T3ZoeXVhS1E1QlZCb1J5SFNta1hJcEF3L1VJL3JsbDFTNU5m?=
 =?utf-8?B?V0l1ZThqcHRFREVud2E3SENubjVRaDZiR1FPK1cvTHZsNWVlTWYweWs0VjhV?=
 =?utf-8?B?WW0xb3BMU1Y0dGNUeDd4bHZiZDZqaDhUQXhXS2UyT1pzYmVYZmZVbDlmWGpt?=
 =?utf-8?B?NFNydTR6TnVuSnFGTkM3Nit4NU9LN0xvVk0xMjRDQnJtTDNBVzVTUDRBRVp6?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kj1TTHblkc0X6GgdrFGSRTO207tPxAwG7UTkAcpvTK+kIDLfK1E7aIEYiPTi3Q+9D79e36TTfXMsPmfUC21NrSZ+8jgUGxuZBwwF+r8VwBbHzjNz3TvLIJVg8NCp4irbYUn5VYMmNOpfO1f4IuqfFk/4zhsvqAe4DB8bzjokbCMUCzasn7lqz3ZHunNt5WJfyvNCdW5Uwezm90ot+75t022lezLJmRdYMco3tGYNoO4ijfJvV0I/0WyYwpiZJGsi3sC4JMdnmVUQ8aBBFIUCI0JkMVVoPUVi9dP9BiUJNJbSgq4PE9AGxjsp7y8jrPAhIGawl1wRp9kH7bINpLOZCariYRsyZTcAzTixi6SG2CwP3XHCRkevCvlSDQqbNIJ8bfqwGJVTbyyx+XqS0MOZCBqqdgAApzjeA4xJdIXco+e+ffqmL3++7oZ6MFRngj+zKCgQgtFdQo0DirVNrZWRfv0qmhGrLefqiH3IN1CON/fLb+NGNefgGQLSt+B8tq6qFUyrF8IFlw3wH2+32ixbU0pWRFRyTeJFtqqrIrvfg0bU1ImYAnxoZ1wnXJryiIRvbSWyfR4LniR3D+l0znUjmx6+t6umoUTMfVmnXf7DkB5za9kl81hafhIDMV5JgooETq/fMuiDcnlllvkLccL5NX91oGpkoLwID79M3PaapRf5DKnIjMpP6SYDTLI0+O4/mPRWiazy6tJm2m+rA+6/BmSnh0RXWbYYEaZNVSqf3Bqm+LLg0rvvW6XLaAOp1t/L+YQ0yBl596jqmLKFR7c32dwsiodU0k946ew4IydPO95qe2b/Kk4vKsuWOPZ9OUcOCs3vCnRC9ZDNPHOis69Ml5zMZpb5nERbbS1Q9oHlqJU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72e0dc1-652d-42ff-11af-08db67403737
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:16:10.7854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSLOjZdQ81Ex1j6q9aiyVvnekrDJZHcy6H/rUawbw/YAizanf7ERTS9QAmjzvN8D1RvTJot+LOSJ65g9pMEKLl+XUErQbKnWP6Zf7vlYg7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7239

On 07/06/2023 11:07 am, Jan Beulich wrote:
> On 01.06.2023 15:05, Roger Pau Monne wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2628,6 +2628,9 @@ with the specified width, height and depth.
>>  `ask` option.  (N.B menu modes are displayed in hex, so `<mode>`
>>  should be a hexadecimal number)
>>  
>> +Note that all the occurrences of the vga option in the command line are parsed,
>> +and hence later occurrences can overwrite selections done by prior ones.
> I'm not a native speaker, but is it perhaps more "override" that you
> mean?

I don't think this is appropriate to say in the cmdline docs.  Absent
bugs, all command line options get parsed left->right with
latest-takes-precedence.

It is a bug that vga= didn't behave like this.

It might be ok to say "Note, prior to Xen 4.18, only the first instance
of vga= got parsed, with subsequent instances getting ignored".

Explicitly calling out the default behaviour in one option does nothing
but confuse things.

~Andrew

