Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEEA65415A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 13:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468508.727618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8L55-0004d9-Ey; Thu, 22 Dec 2022 12:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468508.727618; Thu, 22 Dec 2022 12:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8L55-0004a4-CE; Thu, 22 Dec 2022 12:53:51 +0000
Received: by outflank-mailman (input) for mailman id 468508;
 Thu, 22 Dec 2022 12:53:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8L53-0004Zy-Ua
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 12:53:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad47372d-81f7-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 13:53:48 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM0PR04MB6788.eurprd04.prod.outlook.com (2603:10a6:208:18e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.22; Thu, 22 Dec
 2022 12:53:46 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 12:53:46 +0000
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
X-Inumbo-ID: ad47372d-81f7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ku4J4vbUavOAWd4bUiB/AtYyOZWQXlR3+Cap1krEIhAUkKBY9J6POS4gzWkaEFLaSMd5UK2FSCvx6W2sUR0aY4of+7WxORDOGfeutPMskTlLliFob/TWMzqcHDG714dk449vg1RWt/npryjGrNlqT1gPIWOsy4codABcb1Di18mOBgL3uvowDjlZHvPNWChvZ3J68FBRwfxV05pxk9ueZkTh8D7zG2UsREn6VU1nie+Kfw4TW/R51+bsP1GXk8re/uh8ebuYUsDD2fqui3kXPG6HZjnDc5OishiF2PifMb6oXB3PG7d6YbHT9O8yIM2ofNjGdeySqDVD41H6rk4qAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXHLU0oSfqDANM8rOYB2yY93KdQkBxgXP3czOd1Cjiw=;
 b=YU+YOu+A+/LcWF0jaxAMoRZM5ppY/oxGAs1/0gN63mX3ovxkEU6d1p7L9s7q30MET2DcFw6/RAeoKuLDgaMYxvGl6PxlJoE0QG5Vo3QoaH83frQjdJ06pCcT6XJifuTzB+4puL9EQ9UPhe5krc+yD2jg4SMoJY/0jN36df0pizfTmwKkCLV1dvBaCRrSwB5LbFqZsGAl69JUifE3Y8UWLoOu656bopAofNURzuNoULXe2zlWYhd2m+IVlRhivZ8lCQw1UZodslkd/H25XELv3ZCs22gDgAq5/hJeNnsDmgCBbf4eaCstywyAkUU66R+cnRP+uZlOSRG2Xp97dGxNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXHLU0oSfqDANM8rOYB2yY93KdQkBxgXP3czOd1Cjiw=;
 b=ccYLXcv+Pi1vku3X9JiN9Fb3RxpSnTaoXOXpXl8CRIo1wdlcumnmIrzk85Ty3PVkuicwGoMPKdFL1ZK72R1FTQJ5BJTQ7sNvXwTSzgEfcjzSO55dGOE9JRORZF7xfsc2PeEvAozOKM32koyH74B+mSlPq35EqviwgKbJn4LaE/zPAPnBNrcW6YTUGp120GqcFcX6Vu5x2prgycCjvBWlPy5isrBP+QX5CJpr85QEH82BHl9MaprNum/2rNbufoA3n2C59XdgyJFCvrgSgAp3Rh8VyXHLUn1VIrgrkfSDZKwCZ+bwLuNv7+wBC2/7vo2Z+ffuClacs6/tTrCq0qWgiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c25266b0-ef99-e23d-da22-49eeaee8af03@suse.com>
Date: Thu, 22 Dec 2022 13:53:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 09/22] x86: lift mapcache variable to the arch level
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-10-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-10-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AM0PR04MB6788:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a56ff9-1b91-4153-0036-08dae41b902d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e4rEgDELL2rDQAQbwvFc3xbl5LhMWV0D0LtLhJvk5/RP6Ilaa58Hn1CEFrXCpy16HaD7rgmju1BtD1i1bXi6JlclzaRE8bbWqQWT/hOV4pMRqWrJTOD1xk4fnh1EDa6PDFGGnFep/BmSNIYqh4i+jvPFsqSXvSEITDo2Elf35kGnKXQWV8ApmcsnW7GU2hIqc4pKvJjYX4VLgcZoR4vE4X6Hqo0UuhX7cUhGggVkpvOWbm4yL7cDODSjtGJBMHgsBYF1zWckFrKhpdbliHqfEF9uflbd94Fh9H+CxnG06VtCptbWlpQeVzR1BRKqmywrAdNclVYd2XhDL41Y4YOMGgXkwhyXRlqCUAsV9XX+5eNuIVQ2JUUQZAOZxWmZwRCzvULg3uCjnu3ymnNRTU+O6nBfQEggy12BjSCaoZmUDd7pQih6sRR2nSk1EtuaP7iV9zKxw5HXDRaheu+777MgSYbJiiN5DhfJOV0hebaoKcWHmqJs8/2juxNaqnraDHReG1N8lLt4nnNQfVHKJXsaFCF2u2cRodI52+tL8NArICY0hoVyoRzWiWTAllMVarohg/8//Zye7J4m/PtKfXCcud97qPCP3vJoSx/e0zMAuNP124efaM/x1goZmWAxFwMfDxMovBmOUoPkgwoKtzb/E1luY5A5fjWRrlvYahim53roA16KCt9pz3S/RjCOXadBcnnptakfdLwm/ETdiu5kcy6yWVRSLTO3nMEdlPekElk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(346002)(376002)(396003)(136003)(451199015)(86362001)(31696002)(2906002)(38100700002)(5660300002)(4744005)(41300700001)(8936002)(6506007)(4326008)(6486002)(2616005)(478600001)(53546011)(26005)(186003)(66946007)(6512007)(66476007)(6916009)(54906003)(316002)(66556008)(8676002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpqZjFVRmErcUdMOGNaTnhrdDhqVFNkdXh0bkZIaVIxc1lBUmtldVhsWHNM?=
 =?utf-8?B?a0k4VWFQM0dzU2UraUx2b3djSEhpdi9oUlBlL3EwaW9UR21OT1M3THlMVlFv?=
 =?utf-8?B?Q3Zpb000ZDRIeDhNUUVYcGg1Z2dzV0dTenhubnJ0ekp1WjZuemhnK3FVTlpR?=
 =?utf-8?B?QWNyNDg4WC9OZXQ4RlJtU3VrY2ZVelFCQzlqMzY5alZLbW83V1FUc0c4clFF?=
 =?utf-8?B?ejFkTkxJUThPN1pCWENiWWJaT2hSWFN3dmVnbExhNnhEb2RNM0k2MGFkMEpE?=
 =?utf-8?B?RzUrV1Uwbk5EejhxTFI2OTBVYzdCYUYvZk4yTm51L0c5dUNYMXF2blpsNU81?=
 =?utf-8?B?bldwVm16OG5xVTJ2YTZ0YVRJai92a1BRcGNwVzQwdUxSY1ZOSklpa0lsRnZx?=
 =?utf-8?B?REhueXhaSUMvSjJzaGFIUGhjVXY5Yk1EU1pSTmFmemc1d1VCRmN1Y1ZRRFJL?=
 =?utf-8?B?WmU0QjVkWnZaclBiaTRGa2Q3U1ZpYlZXVXVCcWpmZzZGVFFzc2YxWkM3Rnd3?=
 =?utf-8?B?YnBRdUVFWTZIWDdQQ2Z0QW53T1A2WWROckNvVjZGejVFSmx1RThqUFUrbGdN?=
 =?utf-8?B?T2xRdkNYaWtmRk16azFPNXNWOFFOaGxHNXhVTkx3MVpLVjNiUFJFYXFSNUZH?=
 =?utf-8?B?VVRMVDJZU3daQjRmUGVlVGM2ZiswTCtuTmRNeDVLTllldnpuZEF6bHNoNVdR?=
 =?utf-8?B?TVZxZmtjUWVOeWhUZ2o4L2puME85bGJrNWp0VklEYkhaWVJNSCt5OWdkb1dz?=
 =?utf-8?B?TE44M1ZOV05LcjhObjBRbGgzRUVIYnk1RnQ0UE9FeXN2L3VwRFA4cDRSM053?=
 =?utf-8?B?NEpSTnJ5blgxQ2MvVUdvYUV6UVdKa0l3WllQZHc1SFdQbENiRjQ1U1hFajJV?=
 =?utf-8?B?KzVuRHpzME9WQmVmMTF6T0YwZ0FuTmMxWmdmeTVyMlNaWXlLTG9odG1ZWkpy?=
 =?utf-8?B?Zjg4cHJYUzAvK2tjdWRkU2w5QTJCM0F5amMrcXU2TnlPcU41TDFaUHdYTjZq?=
 =?utf-8?B?MThiR2JPdXQ2YlRTOWlxVGpmWE5DNDd0dUZmMk1nUENvdWJNOGR0OEZiYlZi?=
 =?utf-8?B?TFpTVlc3b3BOSWUzckVsMzE1ZVFVLzZ1Z2lUNVlibHYrSmFkZ2tSN1Q4Qmc2?=
 =?utf-8?B?VXJoME15Wjd0SkYzYkI1K0k4OEpzc2pOVk9RaGt5MEVtU1R2ZGhhYVQ4VGI5?=
 =?utf-8?B?NEtmdnhVc1lKRmhaOVBXWDYvdXM4RkdwNWJsMFVsbFF3RnhpVno1S29mY0Jr?=
 =?utf-8?B?YVRsdWYxOXl4NGF4UzhTdjN3MDJEMTcrUzBsbTJiWFUvcmRYalROUGlhVnNT?=
 =?utf-8?B?bDh1b3dnTGV2MFBZS3RaWHZtR25sWVFTSkR0MkFOWlNSdkR0UHBnQzRUbkpT?=
 =?utf-8?B?QVBTY05GYml1eTltb2VrRDltV21BYTBxblV4emt2WkhDY2JMRFoxclhDREY0?=
 =?utf-8?B?SDF4MGFSS251dFZ4U29Hc0k2NEdKVlJ4Y0pFV0h1cUZkTXdVMWhSeHhCeDQ5?=
 =?utf-8?B?NFYweGMvemRYM1IyTTZSNEl6NzBTRzVtUElobGtuUTlVT3VFZ2dXbG1zWnR5?=
 =?utf-8?B?eUJzVElJYTFWOWJXdFdUb2JEZEhsOHdkTnJ6L0RMTmsxUUZPWUVKWE9HTk9i?=
 =?utf-8?B?ZHp6eGVqdXJzNTJkYWRpWC9JWDVYTFZjVVBZajdjVWtQTXNwUis2ZXJ0UXNG?=
 =?utf-8?B?SmEvL2hoN2J1Z2FTN3JEZlkxWXducDBDUXZ4WEoyM0xZV3dlMlJ1Z0ZaQzdD?=
 =?utf-8?B?cjJnMVh6T3BmWnJVQnlSUEVwZFR6R01DdFQyTHdmL2xZOGRnUk1KelBxS0w3?=
 =?utf-8?B?RlBGck8wMStFNWszUnZyWEJ0YTUzdjA0ZnRqWXl4NS9nWHlEU25XY21PZkUw?=
 =?utf-8?B?aGg0K3RsdWUzbzJ2bENjclJUMHhraEtoOW9JWlVJZ24xTk9tQ2x2R2lrUVAw?=
 =?utf-8?B?NWp3ZUpsbE11WHZUQ0I4SkFwWjZUNGw2ekZrTldwM01Ra3JicjdoNjNiejVS?=
 =?utf-8?B?WjkwSmd5N3FCOEZJOGM4c1poaW9JakpzaEhaZ0hXc2xRMVBOak9HemJvd2s0?=
 =?utf-8?B?emUyTUY4dHg0ZEtjUlg2Um8rY2VkNko3UGFQOGdBZ0dvT21zTGFXTkdocmlY?=
 =?utf-8?Q?HWTvvKUDHHKaBDChr8f9y5rEx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a56ff9-1b91-4153-0036-08dae41b902d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 12:53:46.3901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw7w4XO89JmKgvde+WQMuKlpg+eBLIXMV/eNgdYzGzGEcrL1Wn0JmRgDl49NlmOxuDM1Eb0X/nRecCaHEW3TNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6788

On 16.12.2022 12:48, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> It is going to be needed by HVM and idle domain as well, because without
> the direct map, both need a mapcache to map pages.
> 
> This only lifts the mapcache variable up. Whether we populate the
> mapcache for a domain is unchanged in this patch.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Wei Wang <wawei@amazon.de>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



