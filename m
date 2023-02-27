Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1C6A4097
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 12:28:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502396.774174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbfq-0000Tl-3s; Mon, 27 Feb 2023 11:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502396.774174; Mon, 27 Feb 2023 11:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWbfq-0000RZ-1A; Mon, 27 Feb 2023 11:28:06 +0000
Received: by outflank-mailman (input) for mailman id 502396;
 Mon, 27 Feb 2023 11:28:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mutd=6X=citrix.com=prvs=4152eaadc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pWbfo-0000RT-SQ
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 11:28:04 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cba94f27-b691-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 12:28:03 +0100 (CET)
Received: from mail-co1nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Feb 2023 06:28:01 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB4966.namprd03.prod.outlook.com (2603:10b6:a03:1eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 11:27:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 11:27:58 +0000
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
X-Inumbo-ID: cba94f27-b691-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677497283;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wm/NFo3BAu17msknJ+L9gDTeuE0IRHMZnnrjelXuSUo=;
  b=bvcIoQhixhHJMcb84TviN5gw8u/u8t9uVLyQXZWLAFQq7h8s2v+LojP0
   ym2szo2vJ0K4T/OBfrxcKZe6CzHTxjnzwXOKSMuRv8GdwzwzvQaiZ6aOq
   JjOffPviPcaSu5sOKB2RBRgXgpMBrf9PWJNuQHzOEzsIbl17ToPb2ao3d
   A=;
X-IronPort-RemoteIP: 104.47.56.174
X-IronPort-MID: 98572584
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HCGpkavJ2CS+43l2cB2puGPLzefnVHRfMUV32f8akzHdYApBsoF/q
 tZmKWqHb6zbYGWmf9AgO4uw9E4O6MDVzYRnS1A6+ShmRHhD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj51v0gnRkPaoQ5AWEyCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwOCsBYC+Oq7+P/5GrRekwgMMGa/nyM9ZK0p1g5Wmx4fcOZ7nmGvyPzvgBmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjv60b4a9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOzoq6Ew3Q3ProAVIBoHTkKWosa/tn+VBO1ED
 F0Rxi0nsJFnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ4iUvJR9M6Saqt1ISqRXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxodu51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:CYPdLKMSW2yJlsBcTvyjsMiBIKoaSvp033AB3UoZc20zTiX+ra
 yTdZUguiMc7Qx7ZJhOo7690cW7IE80l6QFgrX5TI3DYOCOggLBRuxfBODZsl/d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhjVQyuxQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.97,331,1669093200"; 
   d="scan'208";a="98572584"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdGfksjbm47aAfROJUaranqtIQTDs66aGzbVoxeosr58SuX0WBaCqq+Z+caq8AgpOxFZvpsPESWUl3vN0qUOjC3jvGjcXlrNoGI/I/bHK1k/vwp1xvvKVA6kfuSCBdTqbGuiBq0D8GG0wjoD8VQk0PksPzyshtmkrZ0Az1vkIoNUDn9ngd1usCZgAHHf7YU6eFOmppVb7GWjzvhZsLu2h8J5LBTQv0RxjoeA9UcgDjHiYYM0RkDV6UQPE+RjrLQNfnfreL2UM16s05AIeXFg07CXFOHgVBtKig96rujH5Yk3TJTrO4KNjqzF2vqhXq7dSdOMapCWQotgvIngxZWJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wm/NFo3BAu17msknJ+L9gDTeuE0IRHMZnnrjelXuSUo=;
 b=LVq8JCcILmijtVszTCBOEnsx71Od6e/htl783PKoMGHYp7DTIc3PaeI8OOdONhOJOBUGf9Co7haX1AekjZPLhaI+dQxpLakLVmo6fdpzGg1/IcLIrpBn/XIA8q+DPQfGRL7vMSLp0rSip/DY86dbUX+EoEcwXolCZLvOMr9vXg3he8ETQruy9W3p22syqsv/Wfmtcgk9gLSbX0zbl/6i1+ojP7sLgqcMijN2AwXf+bUvYmxhTQP1+WKjEDK5psg1hqxj614wpc4O1Wc+ebsdpK2YHGNdDJELRNsaQMuHUmiXEtqSGoiKFhVh3P1aM0XnFHh6O+xvpcqiC0IWTlj0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wm/NFo3BAu17msknJ+L9gDTeuE0IRHMZnnrjelXuSUo=;
 b=Y2DDg0FV/4sP8qhno8VK0eThtbMUmXpvNSm8SQ/wtOg+YodeNmAgJVl3LFHeJtYUjCcIMhJM7Uq/U+PNE0PyGquyOoYSk9KmGyXHdVnjujWd3fX+uuVHwtXdflCermolTLt/Sb9GAxItAoq5rWtMXSWSRH5C3lw3gr85OG8vpRo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <35de356c-0ed0-fa23-5cd6-c13c534a3ca0@citrix.com>
Date: Mon, 27 Feb 2023 11:27:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/setup: drop stale declarations of __bss_{start,end}[]
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <f365e970-006d-4bcb-aa39-6d6bc99395a9@suse.com>
In-Reply-To: <f365e970-006d-4bcb-aa39-6d6bc99395a9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0466.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB4966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef73321-4af0-4db9-8fd2-08db18b5ad43
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u8fw8s5ARVfTil50sK8kVCk1s5BKEG++AGcnNgJa+Ity/GUEpgk4IsUHvatreL8cyciomwB8Sclqb2wqYKfHJKQxNxsw3hAdbngHfgBYdPEiSEeK7GqgRU0gDSKp7ufFUCaHoghTPbzH0mkZXm0lgljq/A1orqdAmwXca6+QFaEoXLDXuq19kJSwviRDMcbg+atXvPpjaRatF82rH+3gXgMABdWAbgYsWlWJF1pZSwIElvw93g2Z0IWIKOZt+SFVS6J37DK/y7gTg+nkiNAjDJv09JTjJLr/YJ6v5/cH+b/B5a91ZSVO/M9TGwJKQhUkhmLMjJ/69eBBVZ498WsqQW/AsoKT3eSjPJaPkg+a4UtsKN2gbrPmZ8Hrz1jMcjDnhLDV0LQ5qKeN7oF7oIyYD8iZV3VmKM89AvHG876tb7bHDGmQN1eOMiWpZcij+G4gqPkJDAfEL+GqxT9hGszAfQqY4xlrJCrTtTC9JRWUgVRJfLHEB8bNP4QqteTJaf+0DVP7D7M7UQyhDoW5hpeaRuTE7waalaopjiCl0/S+9V0LcWLvGJ8HjP43IxR8Y42U27cTHfFvlW6cyMw83kn8Ic5DU/sC+/GBg93ifIJ9czfDJK6GGmCuxerhzFdOAQEuLToJrW86DXB87ik3Q9RhnIp8y6rANbvUuaq7f6DaWCX7GkCOT7+8rKGM0Uxkl19Bhi8ykY3EBILbrpxwnM7uDxXy5+m16acKcGNDmqRZsss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199018)(38100700002)(2906002)(82960400001)(31686004)(4744005)(66899018)(5660300002)(8936002)(2616005)(66946007)(316002)(6486002)(86362001)(66476007)(66556008)(6512007)(8676002)(53546011)(6506007)(4326008)(186003)(26005)(478600001)(54906003)(110136005)(36756003)(31696002)(107886003)(6666004)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUg5M1VTZ2pJSWpZSXFSczl2U3RicHk3OVZwL3pVNWNkVHByWElKL0Z3SXl2?=
 =?utf-8?B?M1JlR2dOUEc1QzcweEpaMDRCUzdlMnYzYlZzci9WeUo2bC9OazdHM0NPY0kz?=
 =?utf-8?B?L1VZR2JhcVpBbDc0OVVOR1pJcExEV2hDdDdGNyswc3NhMzhmUEFPUnVuT0cw?=
 =?utf-8?B?MHJ3WXRnSHlsN1k0ZCtUS25QWjlvWm82K3NlVGo0bFRRTnJWTGcyejVHUTc3?=
 =?utf-8?B?SUl4YVR4ZEJTSENaMG05OFFac2xadU1nbkhmSUlvdWNoT1ZqVGE4T1pvcldo?=
 =?utf-8?B?azZvZDlQak9CaGFoUlEwYjB2T09pRlhTRDRwVjUwbHRCc2NGbkl2SlBVT1lK?=
 =?utf-8?B?amFKTHJVSGRGQjRMSDBjNWk3eEhtb3pFRnJsbEVlNWpMRGQwc2NFU0RSVC9K?=
 =?utf-8?B?eWVIdCtOUDdtQVZlaENUQnVvaHdqRUtjUy84NHE0NWRVZ2lyUDcvcmZhZDRi?=
 =?utf-8?B?ek50VHovWXNxSGVoYjd2Y213bmllZStReW12bnFZZXNIZEtNM1Vka0pXUk5t?=
 =?utf-8?B?aXNib2ZFUUozWTdZeERpekFHWktJS3lZSmFSanZoU0I4WGhvbTBVY3I1UFZE?=
 =?utf-8?B?c1B2eEdvdnRjbDZ5LzVHWVdmTElYQkk4MDNBV2QrZ3VUK25jWHFTMkZZYzIv?=
 =?utf-8?B?YXNFYmNvL3lTVG9xZEQ4OGd0dFpLSG80cVMxZGNSUm5vdjY5N0VFbU43bFpV?=
 =?utf-8?B?bmtERGhBU2RqNkpuM2pFSjBGbUEzZmpyRG5hYWFKcHlSUE1wRDVncmlzTEhw?=
 =?utf-8?B?Z2hEOWdnQnViUDBhNU9KQ2R5Z2lTSGl3MGNjakUrLyt4akc5OXIzQ3NtdWU1?=
 =?utf-8?B?K0laWFg5YUI3dWRXVHBtNjE0Nk94RkNGbEUwb1BMVFR2bjRETGx5L1RBZ3dX?=
 =?utf-8?B?QlpRS0V6RDlsNmtsVEkrbUVzUWFKcDVsbUM2cjIwZlhabnpOWlJvZ254LzBF?=
 =?utf-8?B?YitxcGQ4WUt6UEJjZWZtTmh3N3BhbUlHRjRvaml0WDgwamFiV2FKdjhKTTlv?=
 =?utf-8?B?c24wKzdpeDV0bHpzZC9EdzM2NDBkbGpzaGRwcHRqSWFEUUZQU1dxL0JTVE1Z?=
 =?utf-8?B?MlpEbEpaR09pVEVySWQ0STRmUC9Bb1hzNGtYSkJReElVUXdwTXdhT25lTWZx?=
 =?utf-8?B?ZUYyWkZZMlQ1TmJ1TXczK2E4N2F5aTRvZDR2UWo2V0o0QUJOUU1zazRsbmNO?=
 =?utf-8?B?T2QzZVhob25WWFJueGdIaEU0ZzR6WFdhSmdsZlJqWnhjK0crWHZhRGc4Y1Uw?=
 =?utf-8?B?K1o2ak5DeUFrblREbFU1cFlmT1k0Z01LTUIvWVJtMmJqcG1kUGgxSXllRjFt?=
 =?utf-8?B?SmNuelc5V0Q3aDM0c2lMaDRYVG1LcGNOZG9vblJqcmV5aXdMbTlqT3IwTGMx?=
 =?utf-8?B?NGVlQUQrTjVXeEhEYkJaL1FXaWxXSnR4N0Z6TDBHdEFLY2dYWVNRUTU3ZndU?=
 =?utf-8?B?Y0VQNjJMVFNSOGJZVEFxekN6T3FSUEZ3aVpZWC9hN1hsS3k1L1B6aHB3L3l5?=
 =?utf-8?B?endHM3k2ZW1NTzltSWNUWW1CeTRuS2Z2QXcyLzJiNVkvM00rc0EvRXl6UGt2?=
 =?utf-8?B?cGMxV3cvWjFFTnFndzlFczlXcCs2clF2SVZCZ3Q2b0QzMU5wRU8rQlFYaXcy?=
 =?utf-8?B?d1RWWmp4cCtpclQyVExndVZ3TTVCYlk3NlIyclZyeURFck1yZE1jdFJzejhY?=
 =?utf-8?B?bWg0OFJYdE1HZ2JsaXF0RFg1QkJXOXJYbUxUSmpaTFJ5SFk1dnUzK0R5cW1D?=
 =?utf-8?B?RU55QzVqWEZuZVBWVkJUam1VaEIzbnl1MDVOOWg2UGJWajlXNllzbTdPT3E3?=
 =?utf-8?B?MDFVRGJVNDE3SHQ2cnRBa1dCZnVnTWpwQ3dPNVJ4ZE9Ja0oyVGQ2eUxJVGY3?=
 =?utf-8?B?eGVodGdGa0k4b0RDLzI5TEZkcWtPYW5VYU9kTFhEU0FlWm1FVnBzWEhDWW5H?=
 =?utf-8?B?YmZQQjg3Q2N5TDI5Q1JYMzN4aVd6eUUxa0NkYkpXbGM3Q0dralB2aGp5cnJ0?=
 =?utf-8?B?K1ZNUFF5VXFMUFpkTnhhNEZXd3hRbVAvTnJudnVqUm1jcWsvVW5MVkVCWHRy?=
 =?utf-8?B?cVg4eXVPODZ2b1pCdS9SMGhuTElhbld1RktOWTFnR0MvSVUrbVRLNmNSRXZm?=
 =?utf-8?B?Y0VsVytlczNYMThyMU5Ka2lpbDNSMmtiOXRaaXk3dGs0S25lNHdnRm1OWmJP?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7FDtgBOpCuDPq0+Tioo9kx5Vq9G250GWUheOBM1klU2pMnPC6Ojpq5laN9anlgS3+QDMKmtZIkvn9ap/PFgkaFAC+MNmPBexMiOSNcwstY6sexmVXRkS7L6+wVadOlkIWqaXlbasY0cL+5jJXPIJ3NId/ESAlpfczHgISqtq2orxyF2gwwRYAYl+62SVhV3GQjl+GPWuk7ZKZ2ySbNOJmDbg7n3aEoUgKkDqQikBR9ljaB+1E6R2JJxjr3YO8PJu2lC3tOSen4m+tu/jT66+4limBldWdFzpuePb2Mm1MQpWvoNVUz47Zo1/BGo+/3SXJyKlIWw67xls/GLXtX2nFJdjUHi2omYewnZlvi/23RP3dzbHptZNiJRniXfOvqq0Y8XrNfJ10iXHvPkGPXa3l1HOQ0P3zWKL67bSSH7D9LYM49hpslxIkytYVktlviboyyCDg55eFLTB6T1eYQ2dWbX4cK5loUkBA8gR1KnRj8kOZJEkq4B/IOz27NSlKh0ptO8smvPYIphznkcFOfa50DOmzyDV8Q/reRQhek0rqGSiwBdBBgwi5TyCOEusJYx0+IuiZ8h7K2gM4H98i+89Xm6yjeFp5Vzvm6nZXHUilh+mkKhLhR2bXtqm3rv5aeYruFqtoIQNVfEcEjvuF3efSs3sgIuiZRaO2DD/PGT0qIECmYxOKbrumAY8fW/OSl1ZVkQY92jWkouJeqv9vUS1A8MmxKk2yfABlbatF/Y0kuYeikMiA/yh7cLsw94LodMeUDDw4gvxgr/J7S6bHqvHLxYqVASXhfLfd0QC4h6OxwecNZsTsvSrU+eK+En56UpDSmTH5XZrSpNLPrXwyuEv/A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef73321-4af0-4db9-8fd2-08db18b5ad43
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 11:27:58.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ch9BszX3oIuS6BRzJShKq8nEZK/m60UZKD4WOxc9TZY/xTyqILBU5LQmuIn8gJ8vaBBLMTylekyUGz1fIWcEPTd5GVSSoKLW7GsSPTCsp4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4966

On 27/02/2023 9:32 am, Jan Beulich wrote:
> There are no references anymore as of c9a4a1c419ce ("x86/layout: Correct
> Xen's idea of its own memory layout"). For what's left, switch to
> "unsigned char" as here we're not dealing with strings of any kind.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

