Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A86C673D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 12:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513814.795394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJXo-0008TY-T3; Thu, 23 Mar 2023 11:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513814.795394; Thu, 23 Mar 2023 11:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfJXo-0008RM-Pe; Thu, 23 Mar 2023 11:55:48 +0000
Received: by outflank-mailman (input) for mailman id 513814;
 Thu, 23 Mar 2023 11:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfJXo-0008RG-6i
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 11:55:48 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a313bc6d-c971-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 12:55:44 +0100 (CET)
Received: from mail-mw2nam12lp2045.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 07:55:40 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6385.namprd03.prod.outlook.com (2603:10b6:806:1c0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 11:55:38 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 11:55:38 +0000
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
X-Inumbo-ID: a313bc6d-c971-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679572544;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LarZHhDJBy+j0liB3i/zSGFxPLdpVdKqkI2bdyo9//Q=;
  b=RUQv37Ecak+DNlXDxSrtoPvMye9udEzes5BCNXO1ey0sUMzp8t4IcU8s
   Fl9JSPSsSZtbkY6ZhUS/Oc040bZiHEBJ5fIH//+aBfBEWbkXttQqLUwz+
   w0UruY+oXzJvJ6tWlURb7+nGfkrZtMmV8hfx/1ai0yhbJZWH3Ijwy7Rkz
   U=;
X-IronPort-RemoteIP: 104.47.66.45
X-IronPort-MID: 100809706
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YT2MbagXt1YwhPF1mGbKQe8YX161UREKZh0ujC45NGQN5FlHY01je
 htvDG2EaK7eNzP9LowlaYSzoBsGvcTSzdNlT1E+pH1jEnsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWFzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRAGAwmYBzTidi8ye21YbBKnYMiF87kadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluSwWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOXorq812AP7Kmo7JkAZRUOHvqiCtkPuS80AA
 EETwXQyov1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnp+LqRuiNC5TKnUNDQcYTA4t89Tl5oYpgXryos1LFae0ipjwBmv2y
 jXT9iwm3e1P0IgMyrmx+k3Bj3S0vJ/VQwUp5wLRGGW48gd+Y43jbIutgbTG0ct9wE+iZgHpl
 BA5dwK2toji0bnlePSxfdgw
IronPort-HdrOrdr: A9a23:UzueJaiTq9Rtvm34Skp3gAL/+XBQXwB23DAbv31ZSRFFG/Fwz/
 re5MjzpiWEzgr5OUtQwOxoXZPqfZqyz+8S3WGOVY3SOzUO1FHHEGhC1/qG/9SCIVyJygc+79
 YYT0EWMrSZZzQUsS+Q2mmF+qMbsbu6GdeT9ITjJhlWLD2DxspbgjtRO0K+KAlbVQNGDZ02GN
 614ddGnSOpfTA6f9m2HX4MWsnEvpnumIj9aRALKhY74E3W5AnYoILSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WW2wLRzGja6rVRgZ/ExsFYDMKBp8AJInG14zzYL7hJavmnhnQYseuv4FElnJ
 3lpAohBd167zf8b3y4uhzk3ijnyXIL52X5wVGVrHP/qYjSRS48CeBGmYVFGyGponYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciufR7tQ0TbaIuLJtq6aAP9kJcF5kNWAjg7po8Le
 VoBMbAoN5LbFKhaWzDtGUH+q3hYp1zJGbIfqExgL3V79FkpgE486Le/r1dop40zuNyd3CD3Z
 WHDk0nrsAKciZcV9MHOA5Ie7rMNoRLKii8d1579T/cZeU60jT22tTKCc4OlYWXUY1Nw50olJ
 vbVlRE8WY0ZkL1EMWLmIZG6xbXXQyGLEHQI25lluZEU5DHNcnW2Be4OSITutrlp+9aDtzQWv
 61Np4TC/j/LXH2EYIM2wHlQZFdJXQXTcVQ478AKiWzi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GWDToPs1P4k2iR3e9ihnMXHHmfFD54PtLYdzn1vlWzJJIOpxHswATh1j87saXKSdauqhzZ0
 d6KKOPqNLKmYB3xxe404xEAGsjMq8O2sScb5pjn353D3/J
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; 
   d="scan'208";a="100809706"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EL5FBNA+ds/TEKL95lRULkII93VOeShXP3ei6Om71BYZss44qOgfCln7eaGZoB46+d4wYYhhPbtbtM2yCuwINIZtfNC25eddgpeo7f2IKWhhYzzDrQfYXNpu0Cy9Em6OIaFNokSVbsWOArPFUSJwSL0pNe3Vd0bHHWGZDCjl1Zx+vMw1o0FbSACwROS7DM23xnkhQXU6vmlO6jpkj+aTJaBbIq4RIz3W94sx/Y62CQh4frid9t64g/cDNrX1GPC1k9YpuDTGNRaieADwutneR0Seskj7QcSmIXVj27z9BmoiYm/Ym9C0202RP5FXlklrYBiVxssyYJicwnRY08cHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LarZHhDJBy+j0liB3i/zSGFxPLdpVdKqkI2bdyo9//Q=;
 b=ocYyD7GLsIR2xlJzpNoiP8JN0jzA+EQERCG1tookuJAT3Dv3fhZhx56LXDvNoQdAriOxkaXwT53tCaQrxP2pWeSOakJSH31MG4VlLWsSYyloeE7ax+iHkfF9liLSk38Bxy1GTD/2o08aWn6rJwd4BYiKg4CrPd1DA+TbGDAhsvJ8POO+/ZzCbiJT4dMHfy1BCb8eZ7Rx/Ibf5jlzpiK62nNRDbIAO+3Gv/alU75RXDow6x04cHULIyfMpAHBhbnLD6Yz3eHJxv6PURz2cFoHSpbdrTY3RIHLoj6DT+1O/dYZ9R0AqzO/dvZIX5vO/G5n84U8BZiCiUzl57ESrrq6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LarZHhDJBy+j0liB3i/zSGFxPLdpVdKqkI2bdyo9//Q=;
 b=VKQ7hAHUu2eYpaeMCtDtWfNXDxobli42zLwbBU6YacOEaQWbA28b0GzvClM/JtbEeVw2Y6ta4/V60PlhGTqmnLUtlqr5D78qTIdFoKlSg938E8YHgrhA/kDESwnYnlj4Jq5yLAAc7X2c3SXLLArIqTXnGncKYf46pNvGt34uSqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e40982b-b86b-012c-89af-1e8aa851d51c@citrix.com>
Date: Thu, 23 Mar 2023 11:55:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 01/16] x86/shadow: fix and improve
 sh_page_has_multiple_shadows()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <290c9058-9907-4c6d-3fe8-987868a3a843@suse.com>
In-Reply-To: <290c9058-9907-4c6d-3fe8-987868a3a843@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a666fe-8c8d-49ed-683f-08db2b958483
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bvydxkgjEF21dwiKegvzXHQeSulyRLbxWz8aOfyx1L3gUFfjLfwNqS6EVO5Psc88L7x7g8MLXlJM5HIL2aUHVVAzNRzkpzaX4i6Z15nW/CYMMKfiqCEZbLB1sDQjj3KHD+a3I6O0IcQpz5UnMj7oTDEPgeKDS2iQ/oLJkAhIKgbnymU1R2eXoTQrVjrwViHKMVPRw0pXLw3g3CgF3MGOO7EDn0CXtOqr2VmXpfqvRDwX3tvua+TsWs00HgYBgWd9JSzfgZy8QX2G1B2RkgmbheuIXWTe+kx0sHyExBZtTnG2UBOxWT3jpEF8BMfROHHlebnSLsavVsls7A5B11XS+FHm3NUX0wtU9k5U6jjvQ+tEfjKOJp8N4MQf8DBH93bhtoxCnxCJEwkObn+Vd8AlVzS0DBDLPKWg7xX0oljG29jHKkKy7wkmTSJ7/Yr3latzcVPvvAAIaBOtTbVW4JkAES5JANzmsCCEjpkm8qdAjd2vutLzwOVNIlPjNLi8aV9fQYXhqTuBP+rVr8CVlymTrG2KDVIqDqQhQd9rjnAspO/Ly6ZTzZl+L8KkOKOL9T3coo3CuqgnVqozYj2jCa7CwheBDXJQKZI+6YugEaUkuihWKDBYMHPC9bAP349nosaYsKxtxJ5mLLx0euAJ9p+/B+qkfl9U+GvshtHVarRth3FyoFfUlTLRuzDRnVGTXi9HpAo8U+t4EB43hXhpvCcNpCku6Gw57bSIFobhWMRVE88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199018)(31696002)(86362001)(36756003)(82960400001)(38100700002)(2906002)(41300700001)(4744005)(8676002)(4326008)(66476007)(5660300002)(8936002)(66556008)(2616005)(66946007)(53546011)(186003)(6512007)(6506007)(54906003)(110136005)(478600001)(316002)(6666004)(26005)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azlkL0hYSTkvT3poNUlPU1AzUThhbi9zelJseW1qS2cyTXBsTFU0akgzOUU4?=
 =?utf-8?B?NURFdUVZbEJmc0dxeWFUMkZhR1p3cUNiRmpnM3hiRjN6WU5DSWJrbnBaUmZW?=
 =?utf-8?B?dlFYbnpmUkV4cnJDaGVxNk5nK09LMmEyWnVDWUNISU41S2hVUUdBR1RoYSs2?=
 =?utf-8?B?M21meGtvemJRK1pZNytKVDFJV3cvd1VOeXNNZ0hvRkxGZnh0VTA2UzRwNEtj?=
 =?utf-8?B?VDkyMXRkU3pWcC9qVE1EbnlNVmhGZE1nR3dYVDdMdUsyZWNVeFIzTkxjakRm?=
 =?utf-8?B?UjFDQXZMUlR4TmFuQSs0UmhLMExkME9FRklsNkRNUjJiQ1hCQ2ZIVDF1bEpF?=
 =?utf-8?B?R0tlVHR5MUNRVnpNeUI3R3pjQXN1azNSREowWUdORStDVURFVlMrbFdvSGt2?=
 =?utf-8?B?WTFNOWhZdkVXODVPTGZaR0d3VUJkWFQxWlFMWkQwVFhHSThTVDV6M3ZwSmtS?=
 =?utf-8?B?RG1VbFR2MXUwNjZTYy9Ec3B2Z1NST25ISHBHNndJRW9zMWxsVUNHbXQ2Q0gw?=
 =?utf-8?B?WFg1RWF6cU9OY044VnVkcmhVRGkvT3dydEJzMzQ1T2daLzZKdUl0VUdNZUFl?=
 =?utf-8?B?dzVLRzVVRS81aE14VHNjVExUeUJVV2tiTmx4cTZRYVNDbEp0NXhMTnIrelpo?=
 =?utf-8?B?eU9DbFU1Nks2dzh2UjlBdHdQL0p1R3ZzRTU2QzNMY01lR3A4NDlFMTNqSWlT?=
 =?utf-8?B?dWF2ODV6ajE1aUhHVFpYdWdrZzhVK09pYVd3UUVZRWwvWEt3MTNkK0s3VUR1?=
 =?utf-8?B?UlZtc3dEUTFzUE5LTGppY3FEVVBqKzIwRjY2ZWUySTNKUlVjK1BGM2F6eUZm?=
 =?utf-8?B?eDJTaytNdDRMRzd5OTZLUHI3SHB1cWhTZzhMTVViaHRFTENCSi85MWl6MlBi?=
 =?utf-8?B?QUV6NnJSWnVkeEt0QWoxeUxHcWFtNzJHeXhPN0pUbjRta0Yxak5SUDVkR21J?=
 =?utf-8?B?VzJta2Z6R2d1NTFSdU5hQkpXUU1neWNOSFZQcjlnS3FmdDJ1Mkh0cUtjeDJl?=
 =?utf-8?B?YityWThERUFVRXJYTnRMdTdiNmV2MkxOK2pvQUM2dzJqa3FsblFWZGJNZzBT?=
 =?utf-8?B?N01vUTd0aktKNnFrcE8xS1hHVmdONzRwMVFjc2ZPOTRTeGRkb1RrTGx0SFpa?=
 =?utf-8?B?bkU1dFBxUVVENU5oOEdhd0JucXpleGZiOGJ5dDlNN295UHplYTNBSGlNV3Bp?=
 =?utf-8?B?SStkZjB2S1ZXMTNmWjRSRitTTTh3MzVpdkRTOG5tSHNVZnY0MHhpUDJjZVJD?=
 =?utf-8?B?c2d1NVdaVlJzR0JQNk9qOHhwT0pKOWxtdnBDY2tqRjhyb1B2c3g1YmdhOWZ0?=
 =?utf-8?B?WmFUbmoyeXR1djFwdVJvUHYyQWp6U2JOUlBBeWIxRUNVUHQ4WFQxWEFGdmth?=
 =?utf-8?B?aTlGTUxHSFYyVU80elQ4NmtsZS9reG5jYWZESXNlY1EwL1I3ZmhxbXkzdDdi?=
 =?utf-8?B?MnJiVTJYaEVxbUlUam96VU9TL1BtZVB6Wlh0T0VjSFJVMXBzeER3dnY2N0VG?=
 =?utf-8?B?Rks3aUlvNXh0Y2Zsd3RhRm5nbFhxYXNnOXM3eUdVYnA5clU3VkdaZG1mbFdi?=
 =?utf-8?B?SlVET1d6NU1TYmp0SXNqTlppQTNnL3pYTnloNHU2SjFBZHF2aHRValo2WFN3?=
 =?utf-8?B?UGhYS1ZOM3FrR3pKdmFxaUYrQU5RZ2paUHJVTmRIQ3hTOXNWUW1CckdEZU12?=
 =?utf-8?B?M1hZUGZoa0hrQms5RUNJZHp1QVBMbTFwaDJHUUMyNUxkTWFOMjc4R0tsT3Np?=
 =?utf-8?B?ZFU1aklhZnNjRjRveWF0UTIzSVFDSWp0KytablNtSVZOZVJ6a2I5eHp6RmtP?=
 =?utf-8?B?MGRZdmxxaTRXamZrQlhUVktSb1VjazFrQkFjTEVBeTZDaGlkR01BSDQ3c0hC?=
 =?utf-8?B?RzFkVEsyYTY3M3ZrUXlOUGpQRGdBbnUxckUzNUN3OGJwd2NuMWJuTXJtWkhE?=
 =?utf-8?B?dUxxSHh5c2hPaXJZSFhza0ZaNFIvZ0ZEOVJ3RXA3SzhINmxCQVpocEVaWkhR?=
 =?utf-8?B?SkZhWkhYTHNORDNGd0lDTTB1ODlLZkpoWk5panNyMVRpWTVmREVvVXFjSW4v?=
 =?utf-8?B?ak4wK3ZNMWVONjRKNGJBeEp0Y3dBV1dqOEticlBnL3FWc3N4U0Z1VlhtN2V1?=
 =?utf-8?B?WnBDV1cvMXRZS2JFakpMcnhaUllucVc1VERRdVhqa0EvL0QzcUUySEdIOE83?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t3j0BXo5J4Td3JqtiGozCY8PUCM2ZqOG/F0mZhj6vrXzsq14ITTqSLvllxev4mY3XPN6UXSHzzyCiK8nemiZCf5bM5cHPf4zx/sm9Ydd32jX+fPYDdoGxpjcENt1CmkhAQuVdxshD9ybb9GgHTwECiQMQ3dnrJD2yHZfx/FamUiZ0FGkM4To6+IfcSQR4aF1Goyck/lCbaPfNnWi7DZvgmFL3D0oh3qyWQjDq6C1plkzNZ5p69K32yvCXbTcl9Hkx565CwMULjoGOLtqy3zWFmfz1nX3D+KOtajN86d7gbUbrLLAShwTp7wrvfikizAkR12DyLoDtGElQd0Ma3hOjhE+1MItSPiy+RiR/rcBqOQts1zmmprc6IR1FtAl9TwMTG6QKxU7bvltuzvt6avtkmYoQNd6m9Bl+xb0tevUHFUlTpUs5yCP7n4qVynw0bEnulNkkMtlLH7glI6Her13MzvjSmcwxAg2r/yrBicJCPtumUPl5NLiVoeatD6mQ32bW6cR4fy0ww7xd20dSKFOAJV37Ev1NYGlI5gqGEGbFPvmN1kQEt0nqpdSel5NUh//8giD3SQJxUyPpf/EPW52q+27IwintRmx8egjAduUMGTx7YfwYkfTzUcFSpmbgKUXuDiXg6315eIKADQXLmriy5yje5s/De59+i6Y8xQeEoIGCKnu09ybnCLXzykx5qvYV9M6odcZWyxi9F7dYediOJ1SG5RrlwdABy80ny6NRE0X7au5aBXXs/LR8HsK1VN4Pcm1JqbF/CMGe7Mtz8I7ChRsl/8VSGmTi2bFWHktM8Y0ep0Fdg8EDq6AYQZgriYVRUp5sTbIl5UvN8b0oNlvXQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a666fe-8c8d-49ed-683f-08db2b958483
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 11:55:37.9507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHaVsMgpLd4zjumMsqd7CJSMA5QL/5B3/pgFriXO+Q174mtyr5J5iJTNt5cDu1v57a4kvZEP7KVqfSbplNBwADLJafBYPE7F5jjxgkR5L28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6385

On 22/03/2023 9:29 am, Jan Beulich wrote:
> While no caller currently invokes the function without first making sure
> there is at least one shadow [1], we'd better eliminate UB here:
> find_first_set_bit() requires input to be non-zero to return a well-
> defined result.
>
> Further, using find_first_set_bit() isn't very efficient in the first
> place for the intended purpose.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

