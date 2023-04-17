Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFAE6E4629
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:16:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521991.811067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMpf-0006ym-SE; Mon, 17 Apr 2023 11:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521991.811067; Mon, 17 Apr 2023 11:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMpf-0006x6-PG; Mon, 17 Apr 2023 11:15:39 +0000
Received: by outflank-mailman (input) for mailman id 521991;
 Mon, 17 Apr 2023 11:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=696H=AI=citrix.com=prvs=464f2b76b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poMpe-0006x0-U1
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:15:38 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8afff5-dd11-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 13:15:36 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Apr 2023 07:15:30 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB5955.namprd03.prod.outlook.com (2603:10b6:610:e2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 11:15:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:15:22 +0000
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
X-Inumbo-ID: 2c8afff5-dd11-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681730136;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=t1Oc15oY+SibQeuRLZm/bYE42FQCGF+bveXnFQrPLkQ=;
  b=MWxQK3TMYPPIQaZ/GTSq4vndMps/rvJChKDyy3WMSGtphpdH4kLOLRdW
   jsrYkaCxsgT0GojHP85V54jK2+7P4joIBDIXtPI2tLFzrLAzOI/kcghns
   U6GvHUrV5CrI8elrSzhYkQOEEG/HFRyuHONYEoWNlM8yJQv6nqteg5ngg
   U=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 108232542
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:raonzKsZAhvz2GCseAhxYJvpROfnVHtfMUV32f8akzHdYApBsoF/q
 tZmKWqBMv3cZzD8KNBwaIi18UtXvZfdmoJrSgpvpC40ECpA+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Vv0gnRkPaoQ5AOHyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwLWk3Pkm9gLyK/bOYEsJN1v4BNePnBdZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4G9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTgpqQx2gDPnAT/DjU3ennlm+WIrHKyVuBGJ
 GI2xnMX96E9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hRWWSN9mSfexloesRmq2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBN/xooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:eos7r6sO3yO1984sRgET4YJE7skDUNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoQZPwI080l6QU3WBhB9aftWDd0QPDQb2KhrGSoAEIdReOjdJ15O
 NNdLV/Fc21LXUSt7eB3OG0eexQp+Vu/MqT9IPjJ30Gd3AOV0luhT0JbDpzy3cGPTWu06BJbK
 ah2g==
X-Talos-CUID: 9a23:AZZI5m2vfmD25eG6CHktfLxfH5kfIiTjyynsHk6bUU1IGIe3UHWcwfYx
X-Talos-MUID: 9a23:cKHHlQtV8L+p2Ckouc2npR5Aav100oKSBE0/iJoomfXdDHZ5NGLI
X-IronPort-AV: E=Sophos;i="5.99,204,1677560400"; 
   d="scan'208";a="108232542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhdYTL3QzmH5xUJ63oCd3NR0Mgc0qWdCK3f2HmRCGxAxcTo8F8JcTbyy2ZntivA99z7w6wLXmLuLvLL4Dyv3OWzjPtt9xOKA/AUSwMIkMMR+ytV0493Cq+NX+CpuHtpKOOsN9bFX69eD6ch8slXJuRc5Yfvv/zbre2mqBTe4QuV9HhxEospj/3Eq3utLOYOoMTlylCzBUZM1j5Afe0tmtCNhdGCjeIPBpvfsQxHvZWOx4U4pSc80IV8EgZoIFcudl6Ih0WB/0rYSIiYsvimsmCeFUVjmf7/b3qFooxaVBEgo/EimzKq4ucD0oSKHtngmYj88I702CrIvseagEb89xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rpg6lElZC59lsXCnEog1fWyecGpK9ciM/VpA9qPFSHc=;
 b=jpi7wiVLMYFOYZs/uPxeHGLbeqc4qS8fhyriPnl6zgi4h352750xgXD/jVR68D8gCPo2ZBt44ghqsafLE6rDzZI3v8buENtSu/OcfTSwHBBipjqyqbueI9o7axthImAlo1VajNLnt5NS6VR9MVVMzYyv5CLJXsfR+WcDRgYoHuj3qYwOscRWYEfiS9ZCSCMiECEtEO1JOSv0ECwy85QTKBKHzeEN/I76EkyJ3CnGFsEyGjKC1In45TkvIZEstiZixfmYbRNK23RV8HfVhCQ5hEZIaRHa3dzg0bj9Wi7gq2t7flbB7lOcQNUdXtH8tImtMD08eqqoIv+bkwp8OXjQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rpg6lElZC59lsXCnEog1fWyecGpK9ciM/VpA9qPFSHc=;
 b=KLDfxTflvSwMk6mx+Op/L2n2wquWEN9Ae6NvbA+PEY21H6kZ54ZTDPlcUWcDszxRAAnrvx+FLJiq5hHT3ATbKuhn/G5gNw00WHImN1XSWKfDsJ6na3X5OTvxrw+Ya/HSM3jAY5FQ7pcc/ZjySWWOom/nkEHYUHtjcCGjScrUIY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e7456897-cde6-9bf7-2444-16de2aab6cce@citrix.com>
Date: Mon, 17 Apr 2023 12:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/hvm: Disallow CR0.PG 1->0 transitions when CS.L=1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230412183519.2996902-1-andrew.cooper3@citrix.com>
 <20230413150009.3145462-1-andrew.cooper3@citrix.com>
 <3a554475-9e74-39be-e03a-aaca2c22b857@suse.com>
In-Reply-To: <3a554475-9e74-39be-e03a-aaca2c22b857@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0572.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB5955:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2640ad-e772-4b08-abd9-08db3f35094b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KHNWM8KPU3hcVeFef/ASn8pphkMtj2drwsnB8RflVxA7h+kuug741357ekTSE4w3qHvTr0pknIibRQp8fzXzsdf9TBHJNGul3An9L8XO8O3viACNhWs/2fdldM41usH9/lmJBOtOJarukBPA1Xt9AxnYcMXiDK6wb4/3gdwcEHp7ETtfpGbjOjKxWTYapOKI9djAUQZp6Bo04HebugZNvXH+dFPjMZQ4+PF/PtQ/I3h10gammelccoBaOc2h5GUC3a8BwFSD6PRRCmUh20PJ4OkNFOfl1Q5mnfQB1Fm9GICskdDgx6Vzaa6N/uw8Cr44SZ2S56LUYjjHDeRpCtGhVR/+UO8ezGzZHMiWSFDwFLhsaLcry4tSGVDni6NrYHne5p1xGSDAVGLRb/EDWgac8mtWND3u49Juwypu1ARZ0gwcNekImz9Js1ytPAm71nUU5uMosH3q0BxL2HiyYOTrvNjgZURM409dD9g4+NY8r9HHg/BcC1Pb5pXjTADDSt3LOqI/qMcx9s7GyKvr6+b453fGzZFxtzX6AKqUEJDwXp3rli89gB+TlbP37s87qIz/J00Sz1SuK6PXtMW30nORThyMoLO/GKqfzG3FH2X4e5Md30dlYFxF13qG29Hz665qcLNu8tBUGlZE5CLAGbyvxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(451199021)(38100700002)(8676002)(8936002)(5660300002)(2906002)(36756003)(86362001)(31696002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(26005)(6506007)(6512007)(53546011)(66946007)(66476007)(316002)(41300700001)(82960400001)(4326008)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US9jYkZIU2tpVVd5VTlPbFhTSEpDL1RRaFRjbmlHQ0NKVTByTFFyR1ZwOStO?=
 =?utf-8?B?Y0luV081MytEN2hYQVlRaEE4ZTB2aTEyOUlRVWFxMDJVNnBiVmFzR0VrTVZi?=
 =?utf-8?B?Ti9MbWtuYTNPamg4VmxxZnhmNWl2MTd1YUVvdThLN2FpNnVxa2l6TmFVejhP?=
 =?utf-8?B?Q2tUVlpwVWNMZVNIN3l2bHlhL1RCcVp6bDk1MHRoRldoZTQxc25EYkljUytS?=
 =?utf-8?B?TUR5ZG1obXVOL291ekxJSlN4bW1QL3c2VHJxT1c5MVFwQm1GaFdDeDlTODZ6?=
 =?utf-8?B?S01lQTFnN0ZKTTNKYXhWb0RMYjNkL0lhN0VJckU4eGYvN2FZdU9iSGJpRTBa?=
 =?utf-8?B?ZE9NL3ExL1RxUFFPTkNlSFFDK0VlaWNmZHBteE9vODBpTnhsdW05bzYxNkRH?=
 =?utf-8?B?V3VUTW50Zk5wZ05MblB3TzczdDRjWk5UeUJramdOM0lQNXhvK1lzczNTeU5H?=
 =?utf-8?B?U2Y0djNKU1h1QXBNSFhmajBPMDZtWjB6YmZzTStqRkkydkZlaFVqK1RZMTFt?=
 =?utf-8?B?dS90QVhTZ2pNNXcyWUlWT3ptaHdwYWhVUnZVSVRITFFFWndTQmhHZ3Q3WW9s?=
 =?utf-8?B?RjNzbW9BL3k2VkFFZ05UMDA3NVpIMjcxa3paeWtncjV1SldYRENFeE5uYU1T?=
 =?utf-8?B?UERlaDcrdWd0TTJ1TWpPYzJnN0pXdjFLb1NzSUNTaFIxWStoQ21OU2gzd21B?=
 =?utf-8?B?bWpLSzBHMkNQc3QxajRPZVcrWDFvYzJGVWRjTks5VFliODZyTGYwaVMyc2hB?=
 =?utf-8?B?UmFWR1VkbDEwUmUyM3Q3ZjlNZnU0OEZ3c1F6NWZtVk9EL1hHd3g3bHdGVitS?=
 =?utf-8?B?cWhEbjk2bGxsbEpOYzQwNTlSa1Uwc0hPYi9MWWNjUDhCWlhOeldZejNVUnhL?=
 =?utf-8?B?ZUhmUDd2ZDA5cVNYd2ZhUUpGQ0Y0VTQzQ1FtV0RhbzhkRXViejg4SUZia201?=
 =?utf-8?B?QkZEVjhuODJ4SzEwbWZucE8yTlpIM2VZbS8wQUxWSE9GN3JkT1ByTjRVNEow?=
 =?utf-8?B?Zitnem5WaFFsZjFUNkVaT0s4RGN1c05NUWo2RTNiQkwzL21tTGhVVXhmbG5L?=
 =?utf-8?B?T0lxVU5Tb1pjck43Z2FlRlpRUlhwMXhNTGtKSE54Z2lEeXNueTJPMFFxTzF4?=
 =?utf-8?B?aDRzSk40bzM5eUN5cjl3cTBBOWVJdFhySHRzYzhGZFZZYjJvSjMwWXA3NkI3?=
 =?utf-8?B?U2lwY2lVTzNLaE9oTndXekE5N3ptTHpGSWIyNDFpRmkwbWdzZG52bU54bnp3?=
 =?utf-8?B?cXJMcjNvcnFMdVNqTVlkQk1WZEhpVGdLQUhjdmVPdmFzcWkrYWRaQU5zaVFx?=
 =?utf-8?B?dmpkSGhuNzA2VDlhc0haY0VyL1NraWQ1Q0VoeUZ0R05Pak5SdlNCMUZieExx?=
 =?utf-8?B?WDVwdXJSenIwenkrUkNhR0VEWCtueTF1d05Ra3ZUSVVSQmdCSmZaQkpESWh1?=
 =?utf-8?B?TFdPSWtVYUZTRldPMlg4NmJCbTRiRTRyZ0dlRE1vSjl6OUdHaDg1NWFJY0lX?=
 =?utf-8?B?TzZHUzAvYXErQUJyOElVN2cxL0R6N2hzZnNEV0kwdnhwTnBvRFNmd043K0hQ?=
 =?utf-8?B?OCtRaThkbk9QRXdFMzlzK0tCYlphckpFYXpRbGkxNW1jSDhIU2EraDlvTG1I?=
 =?utf-8?B?OHBzRlNhZElyanJQYUpya09obWhwUG5wYWZUeWpZRTYwMXI5RHR1YmJHM0xm?=
 =?utf-8?B?NVdpQlNzK0RaZVE1YTExOS9Wd0FtaXJ2YkVCWTg2dHBwNWl5MzdESHoyT0po?=
 =?utf-8?B?LzR0UDZhS1U1LzdQTFNBTi8yR1JIRkhCQlpBOHJPZEpSdTY2M1dzd3M4QmdZ?=
 =?utf-8?B?ODZwTHFlcmR4c3JHdzJPaGl6YnFic2lrVUZ2YXYrTTRYeDgxOURPQnRnSkRo?=
 =?utf-8?B?ZSsxMW9SNTBBZXhvNWY3RENybkVCMk03aE5ZWE42ZkxXVlR2VTFJYy80V0VE?=
 =?utf-8?B?MXJpMWFuT3Jvako1ZXhCRmZEbEQrR1VLU3dhYjlQcGVkc1h4ZFhnWUlWb1lR?=
 =?utf-8?B?UHVvYWVQMElrOFNDQkpseHRLQkFOL09aeXZZbXVxd1FnY0YxcEhhaDFtcFNl?=
 =?utf-8?B?emRjaEVTMDZSdHBzTVdqZWNkRzdHTXUwYnU4YklNd2dHaTRCMXJPSzNmN3pw?=
 =?utf-8?B?VnRKY1pEVEtsTFdCT2c2UUtMem52dUh6QVkyNmM0R0pKcEM5Q2hMLzZsaENE?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	o3DhuTvn+czws/SVTRAJJEdPTmUoIwmMRONWivOaQELs7nJtoUes809BTW0shlWXWon47rrc06RASOypiGDyUHy64Y6Iv8jitVo2UpVKROqzgJZk5bl3VZgmUqIL6dEIxmPu4iIjjWAhI61i4oojx1/7jVHlqBI31wez0aRtQ72Xok9Ulq/KIxy/o8wnr2Sz47vlWYDc4LpqT4lmN7tpcODNZvYbmISotyIy+Liu1TXjoV+ZVCPNb1SyBoPQ8e/7UugcheMPjRlucNB9SVgtIhEw2cD1zoE+/dxVWW6C1PulGCgPbxtHdbjq20KhT6lVirWazqMoXu4veWmgsHo39PR2ConmzJwaaagC8Sp/GrZ5i8gari/6xGPPefoGa68e2p1WiS8ZFE0IrAO+EgaeX1KfYbd6RNRLr/P8N7hlze1R2y2qW18j4rhZ3u4OyMDQFDMTEJ/9o/gVbCNbj0Si86hBUo3NQgKXcPHJqDflYujqJU0vaToIcnJaKm4Fk5XDQ0iXi20O8c1+KPWL65Xr7AAinVxS4ul08pLlalOyrvuX9b52r33R0EK72N/25LEvoggLUvMapwdc4aYGIhA+u73wrCegztdUG53S8Juuq+U8wZ5U34y3bZtwKnM3JdFcuSNZvMrrwwAQxApwTdj5xvoXTTZPUuJ9q0CbhMXRDrcoWs3yebsBPN9yk/d5e9+obezF1HkWWTB45cMDSjqY/t9QvaooMt4wuXxwQ/TYlxQdALBk76PLnYLzWh2C+IJb+IH5JYk9NuDrTXfF0UJWsjezyGJvBRAp69MZn6l2Mb72IJZflGb3AL2QPREe9MUKg3WGfni8b38Gvpf8Rn+wXQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2640ad-e772-4b08-abd9-08db3f35094b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:15:22.7838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8RasDs17mDhsbAMXD+nC8/AiWPrNjRHTr0Rruw6jIKgZcoziJ5WomEhDBN6hTZB3zP7zT2Dv/QlXKFgqjytNiASNdcraMeVPdZNRRG0XNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5955

On 17/04/2023 9:05 am, Jan Beulich wrote:
> On 13.04.2023 17:00, Andrew Cooper wrote:
>> The Long Mode consistency checks exist to "ensure that the processor does not
>> enter an undefined mode or state that results in unpredictable behavior".  APM
>> Vol2 Table 14-5 "Long-Mode Consistency Checks" lists them, but there is no row
>> preventing the OS from trying to exit Long mode while in 64bit mode.  This
>> could leave the CPU in Protected Mode with an %rip above the 4G boundary.
>>
>> Experimentally, AMD CPUs really do permit this state transition.  An OS which
>> tries it hits an instant SHUTDOWN, even in cases where the truncation I expect
>> to be going on behind the scenes ought to result in sane continued execution.
> For my own understanding, which truncation are you referring to here?
> As you're in 1:1 mapped code, %rip can't really be meant. Clearly IDT
> and GDT would need to be (re)loaded to point to 32-bit-style tables, so
> the only thing left would seem to be %rsp. It's not clear to me whether
> after such an illegal mode switch its upper bits would be cleared or
> ignored ...

Outside of 64bit mode, all address generation is truncated to 32 bits.

So when %rip happens to be above 2^32, the fetch of the next instruction
ought to be from a truncated %eip, but my attempts to set up such an
experiment still crashed.

I didn't spend too long investigating.  I've got too many other things
to do.

~Andrew

