Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5685B6D3F97
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 10:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517340.802535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjG18-00054p-QR; Mon, 03 Apr 2023 08:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517340.802535; Mon, 03 Apr 2023 08:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjG17-00053c-PW; Mon, 03 Apr 2023 08:58:21 +0000
Received: by outflank-mailman (input) for mailman id 517340;
 Mon, 03 Apr 2023 08:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W/KQ=72=citrix.com=prvs=450b71a79=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pjG12-00051H-RF
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 08:58:17 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8ff499d-d1fd-11ed-85db-49a42c6b2330;
 Mon, 03 Apr 2023 10:58:13 +0200 (CEST)
Received: from mail-dm6nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Apr 2023 04:58:01 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB4950.namprd03.prod.outlook.com (2603:10b6:a03:1e1::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 08:57:58 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6254.026; Mon, 3 Apr 2023
 08:57:58 +0000
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
X-Inumbo-ID: a8ff499d-d1fd-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680512293;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=sIJr1DpFzFESjuG658Iht8tRP4KhsgK2Pqw9uQ1tb0k=;
  b=BqDIm73rGlRPu7zFnE0/Q/cmp3tPB7Gmc75YLjVS9FjYHlouKO9rso7W
   eQgJRLj4fl4VtxymQThyjzPOwGmHXQxxjW3TK3M8emetyAYivEB4jjpXL
   eUfCfTZPeIaB9NPUFesobDasi9TC4G8xVK+I8FeivkSsR05cHk6SNLYwL
   A=;
X-IronPort-RemoteIP: 104.47.58.103
X-IronPort-MID: 104500074
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w8onRqscBbgJnBvfEsa33cPBz+fnVHdfMUV32f8akzHdYApBsoF/q
 tZmKWvVb6rcZ2r8KN8nOojgpEMHuJPRn9JjGQA6ryExQywX+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5AOGzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwaxs1VUCIl+mMneirccw1ipwtEcTuBdZK0p1g5Wmx4fcOZ7nmGv2PyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60aIG9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAN5PTOXgqaICbFu7+zwYGT4zcECCsNKfqnGRCt5DE
 VEt5X97xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO0cSCEu1
 1SJt8j0HjEpu7qQIVqC8p+EoDX0PjIaRVLufgcBRAoBptXm/oc6i0uXSs45SfbuyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CKvZ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:Q2u7z6nXACZYU6U1u0NBJVll0HXpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.98,314,1673931600"; 
   d="scan'208";a="104500074"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0CkQzkp9lDYeT1y5/ecnK9MeaqWs+QPfjTuNQvSByp3ULQw6QKvoT+pqlcYKicsHlYoDPh5YS8iXdW0L++ftTowkzK3BEgEIS5lzwydy7ByP/si9hpVCYB5KD7Hbynj232bb+fr+tIp9cYDxSkSF1uf9QtNmL78tVYKKywdDwhCvsnWaYsE+ts1FoSZSC+U+mOjdIyqfKKphwsY2o9IEczrQXwktqBETDpfP2p/EUZlWS9Fypg4yPyoqr8OGl7hfK73dD1wh0MPhkzTSmDYRUEIqIP5VVnzI0sLjDnAvbJBX45h2EDglI1in/cjShSnMu5/IUGDvH8T8HuNU9O8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xf3yZJpNniIwd+LVSfWWmL7nhLZsXRRI19tvZcvt07g=;
 b=HAK+4Uny4llysaBC7W4EPOpcM5b26rinJB3crCbrkepXYk8rdRPuRLFOHTVe5kPVWH2yjCSVHWMCmSZ+svNru/ToOYLhz6vBISSgIY8lmZIyBcSqIXY8O3KSoCLl3QNWjdfI4iGN4ukZjusC/GOQP9d1z+bjBcCvacuPyYy+eo83ivXBs6GoDDBTpaXsd1ofqfSFP4BnTjAWoQchAjdeYAvNGppaWeMblUaP/DjOhnF/HM3lLtT7U1sXCtuJup9vUKP/umgg5aW1yhs3DrI033M4b57pMiUYG+NVUexyr2+GqmdwUc4P3OlOh/m/RFCYiMsUCtztZoKRbBxLXw7+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xf3yZJpNniIwd+LVSfWWmL7nhLZsXRRI19tvZcvt07g=;
 b=JPNT9cnkz5roi6FXlBBe+OPXbxNa4cCsw/B6QqJQN1yY/NvxKwN197EK7eWBcbdPQ0LXttYNtKGc38hFfK4iX/r68xmCfj9Jzmxtb+6wnJx5nQYaauSVrfeGnkoMF0zYCuh0EAGqMuQ3ll/FfA/pbRk70xlIsp+pig6JsGsW3TI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Apr 2023 10:57:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pci: Correct ECS handling with CF8/CFC emulation
Message-ID: <ZCqVEHe1Qo3skeVf@Air-de-Roger>
References: <20230331175719.500285-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230331175719.500285-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P123CA0032.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB4950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b6339fd-7c7c-4ba8-b985-08db34218595
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7D6imCPUVXcFC92XXRAvmOK5LGdg+GYXofDgK1W32VRJpp75sg6CQJ0/cEI3hDGVxfCS0aRkOHrgE6FJqNhX+rYCd2OCqSVO9SbBxaDwTwCo4W5xU9rusnjQjqu5iAGdNRWXV3CAxUOly3avdN752TovD+69bVdK8FcjR14BxZO6H2Wc5ypiWUARZNVkAFplD3KAaQo6j5CfuM56wFMLalZYXCY5TdMl0QayysMq9dsbVm5hgVM2lwFJl/5Rvnc95jO11ABHwmRAK+gf+/n2Lli7UK/2gr9eLhy2rlgL6vpnoyBb2b3OxSbzuQinc8nxHPimCBr6oVa9x7E2HOSuU9yTi66Jkj9UCCarv2me3bksZu72YXqGTd2sUalapkkhFCwT84seEeeOFx147IbfUQ3bxSXoRMSjfaxX7in2nFThpFBHp/ke6uDPRQWmesZekip1v28FGF3gLBl5E+mVLzmqvYp1hM7mgUgtJKttsBGnhgzZTvgGhEcgMu+vkXOngRl9ljqj2usYvEH3tUwjXV9YiT4aiMQB24kj/1aEpO50PYKh3j91R2Wnl7FekCd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(82960400001)(83380400001)(8676002)(4326008)(66946007)(66556008)(86362001)(66476007)(2906002)(41300700001)(316002)(33716001)(54906003)(478600001)(6636002)(85182001)(38100700002)(6486002)(6862004)(8936002)(5660300002)(9686003)(6512007)(186003)(6666004)(26005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amZ4cURTbDZIWFFCTmg5NzJsK1hleGRYV2tWRXhhOURJcDlKVE00c2J5dXJS?=
 =?utf-8?B?KzJxWFppdDNPeXF0bHhUM0E2NUpPSHIydGp1WkVkOXpEN2c2bS8zSTJlT1Vo?=
 =?utf-8?B?Y1dlOXIrSXNkMUdzYjNPWjZTOGRub3p0cFZST3RteS84bk1pK0JrMWxtdVFx?=
 =?utf-8?B?QnM5TnY5WUErTlVEUmRyV3IyWTZCOVU1WmJGSUREc2ZUQUUxTVZqdjNKaFpt?=
 =?utf-8?B?N04wTnR1TkpKWkgvNWN6WkdCQWsrSGNxNS9KWlpKbTNLSDlQZkZJclVlN252?=
 =?utf-8?B?ZGhnb1R2S1RuSy9LQWtmWjJuUnVuM3dzR29rc2E5WGlEaDFYbFRJalhQaTNN?=
 =?utf-8?B?enE1NFZRTTAyem5ja3ZCZkFERUZzZ2NzRlRJbnpqU3laQUdZcEM4NmVidFpW?=
 =?utf-8?B?V0haWmVWOTZoZWc4QlAyMFBUcEpXbUZEK0kwOGpIZTdEaGRqWDhhRGI0REhH?=
 =?utf-8?B?RDQ5VVM0WW0xTnQ3YjhpTDlKc05IeGhWeUIxTCtTSmRuY3AyQndyV2x0UTc2?=
 =?utf-8?B?eEMwRERacWFyNFF4eHBwUkgyaTJsanNCZVNZcFRnNFFDN0Fpa1FvMDRsMGQx?=
 =?utf-8?B?OEwybXV0Yi94L3VucXFkRC9Ea3JsWmRUUDYwSWQ1cGgzWVY5cE9kYUhXV0ZW?=
 =?utf-8?B?L21lczFPKzhSekhsQ0NGUUU0dVVyS3p1d2JGNTFyVzhSQlluVG0zRGZMMnd4?=
 =?utf-8?B?UVBjY0JiWDF0Y1JUcVRWd0prZDFkb20wVmJlVGZBanowNXlMc1l6eXJPUHBM?=
 =?utf-8?B?TG9iN2JVcEUzSnVqUFB1ZUdodElvTHowQ2UvM243R3lWS0J3UmZvWlZ4a1Vv?=
 =?utf-8?B?Zkl2dUoybkZ1RmpWQVhCWXhROXZnOTBuMi9BUitPb3EyQVJxWXEySlRWVkkx?=
 =?utf-8?B?cVdQZU10TkJodUh6VkplY1pNUXdiWEhrbTRUMUhXMDNCL01GdGwwSnBSeFc4?=
 =?utf-8?B?SndiZDM0Q1ZkaXljSzdyUWt1MWVDZWdOT0svWEJqS1BRMWw2LzE5S3FGYWho?=
 =?utf-8?B?WVJjZFcvdU5ob0k0WjY1Q3dhV0JxcnR2YzF5ZEluV3VuQmZLbElGT1doT3hm?=
 =?utf-8?B?SHpXanZISEdzUW9TUzFJSmNEOUFLZUQrWHpSZlRZVWpmeUVrMnRuSlRqditk?=
 =?utf-8?B?MlorUFZRaUV2U1FRWU9nRkhSVHBZR3YySW50amtmQ0tmaG9IV2Z5YmdwK1lE?=
 =?utf-8?B?V3BMMXlTcVdlQUpVZDJzaWppdis2d1NUZVVuNEFWSlIrVVRGdVBlazFHTzFu?=
 =?utf-8?B?TXp2cjBjVnRBZmRFTWVxaVpyT1JrbCtSOURSS0ZoVnFTWEg5czRNMlBWd1hE?=
 =?utf-8?B?dUNKTFY1dkx2djlVcDFBQkZjMTd5V2JMN000Mll4WWZhUEFOL0NtWmVkR0Y1?=
 =?utf-8?B?WHVKc1NvNk1XMEFSZmRQek93KzRBcVkvOEkwaWJKRXJndlFxalo5cUlnR0s5?=
 =?utf-8?B?TUVrV0I1dHc3NFhxeUFWdWQzclFNWlIzSkpFRmh0dVhjOFBMS0ZCUlg0RENm?=
 =?utf-8?B?dmc3bUE1QmFMZk5RQmxXR1l2SDBjRW94eklUaU1tTXZmV0x0cnJkdm95Vjd1?=
 =?utf-8?B?VEQ4VUJuY2Y5WTVFNzAvZzVrNko3cmxxOTZodjVzM0VOcGl3V3NkNGhnaWMv?=
 =?utf-8?B?SnZKN2RQSFN1RkJPSWhOMjZmdzhxR3NkQUlKTlY0QWg3cno1MzY2SkNvcVBj?=
 =?utf-8?B?eUxBZWp1blo2RnhlR3RHUnpCYUUvQUJwdWgwWlVPS1AxL011UjAxTWdKUjFI?=
 =?utf-8?B?M2k0R3YrQnpqNUxXMEJMVG9xaGZUb3pKN3NuVStzQzVUZ2lvWldrdkpNUzFV?=
 =?utf-8?B?U3VzVDl4R3kzK0ZGb2JhUVRMYWF3NFBTeHVqTEtJOCtrWkw4QVVZKzZINjVF?=
 =?utf-8?B?ZlN5U3NOcUZOSzlhMDFFbU81dzF6R0F0VGt0b3poT2dxWHhPZ29sVy80MnpN?=
 =?utf-8?B?eStHeHRjek1laHhjQmpJOFFaM1FLRk81THg5L0pmZXJQcjkvUnpaY093SmpU?=
 =?utf-8?B?Ui9sUFhwYkgxRzVTa0FBcUhMRG1CR01Hc0t5TWZDSXErT1hySXp0bnBHVXBv?=
 =?utf-8?B?a1dKMGsrck5DTW1vUThvVmx1NGxROEdjMjlkdVNYN25BZzc2NUFVK0oyT1VZ?=
 =?utf-8?Q?nqKQ315XYiX6n/S5lDFgH5C+C?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	szt51JlSFrCauktts5mbwXId76pM7TsqI148Nzc8DDagaOb7dh3FnESfge4IfIr4C4/emJruiFhttOlYAgknN12Lq2t832Fw8DabWa/hTv4yR8DXjkE4UeGVHGSHHBprSKHEgguF/mtQdSLMA+2IzanhqJk39c5bfY2pY7/wwvGTeg5aOm8kwJq2z9Ipdkkjmh/vD9NnM5jz4G7jakvobjmg/fB+C5usgYoRkubPE1R1aWdn60SIlrxbJVcZglH2xpbCeIGl8yBc8iX20p/3IX/cNyuwkFjd9AcMmeLj6QPCX4xXyECZ+UMpYbMqjzQeBaAW00tu6gu4OMZ6KYLqR6GveUzKCy8pf6Gjhz9QrNlDuxO9F0HewF4HBAGlj2TtsWrAdDcGiBrHDfRJ6HJw5CBenhtLc2nj2acK9Il+CqApdIqh3Zn3hOgI7ldjf0VPmp4uRtdtBSOx5gi623lninZ1+CeJrOpTc0dRpeo7rssLQBBlYqGBRlOmQelKxDPHt/EDlWkohMNbWQWEv5EW9P8k+6SDlcB3CSVdou5Av5MRPfocxFBpScmA6O7IGrapX/lUG6bsbepMP68emKsQ7RjHD/PSgmu0wKxrn5vYeI7AX4FpQ4M16HDS5k/5cYYbtvQiiHf6sSOBqRZpaAjHlW4BHbNO/UHX3p86SmORE5JUOEn0nEJXouqLyHdxZKZDoWQWQU2z0zpA9KyOiFRCXdomYsh0Tjsrwztsq7g7nsUy6LGh5fajL3VLokBoHZQu6n4A2h8UGFZK8f2GNmhLmUFW+Qi1oZKQUeusnpxxfQn1TnW673KgV3aVqRjcuOMr
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b6339fd-7c7c-4ba8-b985-08db34218595
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 08:57:58.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4sf1BWTabxoH/ANDiNIm8XLslx6OjkoxyLk3/RQqHVQ9zJhleequIS75bAWjSaYgn66FzA+MjVlTf6xaMPwJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4950

On Fri, Mar 31, 2023 at 06:57:19PM +0100, Andrew Cooper wrote:
> This started by noticing the dubious Fam17h check in
> arch_ioreq_server_get_type_addr(), and then realising that checking the host
> CF8_EXT setting is utterly bogus for the guest <-> qemu emulation path.
> 
> What should be consulted here is the guest's MSR_AMD64_NB_CFG setting, but a)
> there isn't one, and b) the vestigial remnants of the cross-vendor migration
> logic cause MSR_AMD64_NB_CFG to be unconditionally read-as-zero, making the
> CF8_EXT path unused by any suitably-written OS in the first place.
> 
> MSR_AMD64_NB_CFG really has been removed on Fam17h (it's now just a read-zero,
> write-discard stub), and the ECS extension is unconditionally active, meaning
> it is not correct for Xen to ignore the ExtRegNo field on newer AMD CPUs.
> 
> It turns out that Xen did even have this behaviour in 4.5 and earlier, with
> this problematic CF8_EXT checking being added in 4.6.  Therefore, revert back
> to Xen's older behaviour - it is objectively less wrong than the current
> logic.
> 
> While fixing this, get rid of hvm_pci_decode_addr() - it is more complicated
> to follow (and to call) than using the CF8* macros in the calling context.
> Rename CF8_ADDR() to CF8_REG() to better describe what it does, and write a
> comment explaining all about CF8/CFC accesses.
> 
> There's one rare case when CF8_EXT is visible to guests, and that is for a
> pinned hwdom.  Right now, we permit such a dom0 to modify the CF8_EXT bit, but
> this seems like a very unwise idea.  Leave a TODO for people to consider.

One weirdness I've noticed is that for vPCI we decode the accesses
taking the extended CF8 bit after this change, but then if the access
is relayed to the hardware using vpci_{read,write}_hw it will be
forwarded to the hardware using pci_conf_{read,write}<size> which
doesn't have support for CF8_EXT.  So if the underlying hardware
doesn't have MMCFG support and the reg is > 255 it will be dropped.

> Fixes: e0fbf3bf9871 ("x86/AMD: correct certain Fam17 checks")
> Fixes: 2d67a7a4d37a ("x86: synchronize PCI config space access decoding")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> Whoever reviewed those two patches originally was clearly a fool...
> ---
>  xen/arch/x86/hvm/io.c             | 24 ++++++------------------
>  xen/arch/x86/hvm/ioreq.c          | 19 ++-----------------
>  xen/arch/x86/include/asm/hvm/io.h |  4 ----
>  xen/arch/x86/include/asm/pci.h    | 26 ++++++++++++++++++++++++--
>  xen/arch/x86/pv/emul-priv-op.c    | 19 ++++++-------------
>  5 files changed, 38 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
> index 5ae209d3b6b3..b0d3c236e985 100644
> --- a/xen/arch/x86/hvm/io.c
> +++ b/xen/arch/x86/hvm/io.c
> @@ -248,20 +248,6 @@ void register_g2m_portio_handler(struct domain *d)
>      handler->ops = &g2m_portio_ops;
>  }
>  
> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> -                                 pci_sbdf_t *sbdf)
> -{
> -    ASSERT(CF8_ENABLED(cf8));
> -
> -    sbdf->bdf = CF8_BDF(cf8);
> -    sbdf->seg = 0;
> -    /*
> -     * NB: the lower 2 bits of the register address are fetched from the
> -     * offset into the 0xcfc register when reading/writing to it.
> -     */
> -    return CF8_ADDR_LO(cf8) | (addr & 3);
> -}
> -
>  /* vPCI config space IO ports handlers (0xcf8/0xcfc). */
>  static bool cf_check vpci_portio_accept(
>      const struct hvm_io_handler *handler, const ioreq_t *p)
> @@ -275,7 +261,7 @@ static int cf_check vpci_portio_read(
>  {
>      const struct domain *d = current->domain;
>      unsigned int reg;
> -    pci_sbdf_t sbdf;
> +    pci_sbdf_t sbdf = {};
>      uint32_t cf8;
>  
>      *data = ~(uint64_t)0;
> @@ -292,7 +278,8 @@ static int cf_check vpci_portio_read(
>      if ( !CF8_ENABLED(cf8) )
>          return X86EMUL_UNHANDLEABLE;
>  
> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> +    sbdf.bdf = CF8_BDF(cf8);
> +    reg = CF8_REG(cf8) | (addr & 3);
>  
>      if ( !vpci_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
> @@ -308,7 +295,7 @@ static int cf_check vpci_portio_write(
>  {
>      struct domain *d = current->domain;
>      unsigned int reg;
> -    pci_sbdf_t sbdf;
> +    pci_sbdf_t sbdf = {};
>      uint32_t cf8;
>  
>      if ( addr == 0xcf8 )
> @@ -323,7 +310,8 @@ static int cf_check vpci_portio_write(
>      if ( !CF8_ENABLED(cf8) )
>          return X86EMUL_UNHANDLEABLE;
>  
> -    reg = hvm_pci_decode_addr(cf8, addr, &sbdf);
> +    sbdf.bdf = CF8_BDF(cf8);
> +    reg = CF8_REG(cf8) | (addr & 3);
>  
>      if ( !vpci_access_allowed(reg, size) )
>          return X86EMUL_OKAY;
> diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> index 0bdcca1e1a5f..325a9d118e52 100644
> --- a/xen/arch/x86/hvm/ioreq.c
> +++ b/xen/arch/x86/hvm/ioreq.c
> @@ -285,27 +285,12 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
>           (p->addr & ~3) == 0xcfc &&
>           CF8_ENABLED(cf8) )
>      {
> -        unsigned int x86_fam, reg;
> -        pci_sbdf_t sbdf;
> -
> -        reg = hvm_pci_decode_addr(cf8, p->addr, &sbdf);
> +        pci_sbdf_t sbdf = { .bdf = CF8_BDF(cf8) };
> +        unsigned int reg = CF8_REG(cf8) | (p->addr & 3);
>  
>          /* PCI config data cycle */
>          *type = XEN_DMOP_IO_RANGE_PCI;
>          *addr = ((uint64_t)sbdf.sbdf << 32) | reg;
> -        /* AMD extended configuration space access? */
> -        if ( CF8_ADDR_HI(cf8) &&
> -             d->arch.cpuid->x86_vendor == X86_VENDOR_AMD &&
> -             (x86_fam = get_cpu_family(
> -                 d->arch.cpuid->basic.raw_fms, NULL, NULL)) >= 0x10 &&
> -             x86_fam < 0x17 )
> -        {
> -            uint64_t msr_val;
> -
> -            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
> -                 (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
> -                *addr |= CF8_ADDR_HI(cf8);
> -        }
>      }
>      else
>      {
> diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
> index 54e0161b492c..3f3fb6403ccb 100644
> --- a/xen/arch/x86/include/asm/hvm/io.h
> +++ b/xen/arch/x86/include/asm/hvm/io.h
> @@ -144,10 +144,6 @@ void stdvga_deinit(struct domain *d);
>  
>  extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
>  
> -/* Decode a PCI port IO access into a bus/slot/func/reg. */
> -unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
> -                                 pci_sbdf_t *sbdf);
> -
>  /*
>   * HVM port IO handler that performs forwarding of guest IO ports into machine
>   * IO ports.
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index f4a58c8acf13..3b814f4ebacf 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -3,10 +3,32 @@
>  
>  #include <xen/mm.h>
>  
> +/*
> + * PCI config space accesses with CF8/CFC:
> + *
> + * 1) Write {Enable | BDF | Reg} to CF8 to set an address
> + * 2) Read or write CF{C..F} to access the register
> + *
> + * For sub-dword register accesses, the bottom two register address bits come
> + * from the CF{C..F} address, not from CF8.
> + *
> + * AMD have extention to this protocol to access PCIe Extend Config Space by
> + * storing the 4 extra register address bits in the penultimate nibble of CF8.
> + * This extention:
> + *  - Is unconditionally active on Fam17h and later
> + *  - Has model specific enablement on Fam10h thru Fam16h
> + *  - Has reserved behaviour in all other cases, including other vendors
> + *
> + * For simplicity and because we are permitted to, given "reserved", Xen
> + * always treats ECS as active when emulating guest PCI config space accesses.
> + */
>  #define CF8_BDF(cf8)     (  ((cf8) & 0x00ffff00) >> 8)
> -#define CF8_ADDR_LO(cf8) (   (cf8) & 0x000000fc)
> -#define CF8_ADDR_HI(cf8) (  ((cf8) & 0x0f000000) >> 16)
>  #define CF8_ENABLED(cf8) (!!((cf8) & 0x80000000))
> +#define CF8_REG(cf8)                                    \
> +    ({                                                  \
> +        unsigned int _c = cf8;                          \
> +        ((_c & 0x0f000000) >> 16) | (_c & 0xfc);        \
> +    })

What happens on Intel when the bit is set, is it just ignored?

We only allow such accesses for dom0 anyway.

>  
>  #define IS_SNB_GFX(id) (id == 0x01068086 || id == 0x01168086 \
>                          || id == 0x01268086 || id == 0x01028086 \
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 5da00e24e4ff..008367195c78 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -245,19 +245,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
>          if ( ro_map && test_bit(machine_bdf, ro_map) )
>              return false;
>      }
> -    start |= CF8_ADDR_LO(currd->arch.pci_cf8);
> -    /* AMD extended configuration space access? */
> -    if ( CF8_ADDR_HI(currd->arch.pci_cf8) &&
> -         boot_cpu_data.x86_vendor == X86_VENDOR_AMD &&
> -         boot_cpu_data.x86 >= 0x10 && boot_cpu_data.x86 < 0x17 )
> -    {
> -        uint64_t msr_val;
> -
> -        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
> -            return false;
> -        if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
> -            start |= CF8_ADDR_HI(currd->arch.pci_cf8);
> -    }
> +    start |= CF8_REG(currd->arch.pci_cf8);
>  
>      return !write ?
>             xsm_pci_config_permission(XSM_HOOK, currd, machine_bdf,
> @@ -1104,6 +1092,11 @@ static int cf_check write_msr(
>          if ( !is_hwdom_pinned_vcpu(curr) )
>              return X86EMUL_OKAY;
>          if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
> +             /*
> +              * TODO: this is broken.  What happens when dom0 is pinned but
> +              * can't see the full system?  CF8_EXT probably ought to be a
> +              * Xen-owned setting, and made symmetric across the system.
> +              */

I would assume CF8_EXT would be symmetric across the system, specially
given that it seems to be phased out and only used in older AMD
families that where all symmetric?

Thanks, Roger.

