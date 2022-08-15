Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A62592A82
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387112.623226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNV2s-0000nK-Dw; Mon, 15 Aug 2022 08:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387112.623226; Mon, 15 Aug 2022 08:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNV2s-0000l1-B4; Mon, 15 Aug 2022 08:01:58 +0000
Received: by outflank-mailman (input) for mailman id 387112;
 Mon, 15 Aug 2022 08:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNV2q-0000ks-Ke
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:01:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 875ed26c-1c70-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 10:01:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB5411.eurprd04.prod.outlook.com (2603:10a6:208:117::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.25; Mon, 15 Aug
 2022 08:01:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 08:01:53 +0000
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
X-Inumbo-ID: 875ed26c-1c70-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CX19Ruv+Xm97XoUJm30um+bBWHAVnu5Ok1BhhBQ9q9TZkIROuvqZuHj3xdpkcJDRnTQiZd0QDlBnk0e+uP07iXbkJ3UP7z4vsd7bfX8CbTtIpJCfbtGp3EbDpArCFbH3PGVJvRZverR+FW8iROq0OGHuOAHzXLZjNvbA6M7u34T7LgMWcIxExC5QZwIZLEn3cO+SZUyqlekegxvNEvnml+AJ3mCaP/bNK80pwSPJrbFMtEPyGXStezvA37d7q/K6M/CbCToZyfXPXSvEEDGcMxDGRkuv9KlhSKzfCbe6JPkRjc+sJCYEG968nHv9bG9SKC3vI+yQ88mABJ+WTxjs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9YSMvfOXBViNAGD29TGSdUJ8NI9sf+6egphJs68qDY=;
 b=Eq9Gh5dcuG0uiis/XkaKHu3o3H0oNxCrYIX0z4O7Vu98NVt5Rgiodk2VjZTT8WRIOo360IImZfCYhLdvjulPXu0VaRpnakJZJZ2CJmL7To7eUZkBCWGA2v12eInETdprNyqAQrHKLG0NvstkXsK0K7mLCNKZd0HKQXK/OtyHYwT3JO1FZeTfmKGBeaE0V9/3xCTYvkFlN7+Uj4nyLBqOewY8TNXf0iJzOev/qMqluRyvxgGQvO1IHt3/WrQPFYCXPhhFnpRvuPRzm1JwrzYTcLnGyk3ago0d9+eNooxDgnOKkJw/dcK5KRmizQofxDlcwXH3OLPc6YeLuTy/jNubQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9YSMvfOXBViNAGD29TGSdUJ8NI9sf+6egphJs68qDY=;
 b=VaKxv0IbBxm7NVZxVbVJiC0KX0wEaPNWYI96rl737oTjOPS57kis0Ln3tKgLi6Te+3umVOSzObvpcSyyzW1YZ+uXSlQP2qYq6wiuOtzGswkwiLIk++fUzLeG31I/LFxkntCOvwD0TvQYsDy0O5Eh63txmRa0K26dY41m+fAkrPvL0/3wSNlEXmHGBBDzQ1csWueJr+mT4HKqFTUvOZFChm0nUZzE2eLULJ/mYC+VUGhf/PC26J+kNbkwr00/U+l87omN6YragN7erOlVKoijQ9ucjaLduocrDZowivMIYge7tsbYgrUU4CLkT1B9fYHubwm0eJjeVjlRL8xOOStyfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
Date: Mon, 15 Aug 2022 10:01:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20220517153127.40276-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220517153127.40276-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d46a220a-c3bd-47fe-c947-08da7e946a42
X-MS-TrafficTypeDiagnostic: AM0PR04MB5411:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6HJ5aGk6ytYTKvCygwt8KfBYqsR+DgOUlOwF+8MwXJpVJEwuSsS4bH0knBrgL5gBkG3byIe6LuORi0O19xsejCf4Rv7zvdnDj809AMhOVpScJozgI7JqpxFswkD/XMrqUukFU9OTwo6Ni3c07BLxXYP/Qru3fAnIhVlot6Kc7RB0UKo7vLPiDGgiNZQEPqlbjw02WXefcwKDBtzP6FrMTIxHmsfp3ROmpeToYqCITndxgcmVJNDYMvrjejQR9Vk6uWG8OnCtTYe8mbiRp7O8EwDsYy//8fE7Eop1F8EYn0Mthcqw/ow1FGeS9sqP4ccvAWVHy6lj0gFTRBJH+7b4Vw0daBN2cXArXd0y+wnOfbhhO7yyOZpOtB9cREZPZZZTsxgTMx9l3WakyG7jutLtf78axJ6zCecMr36ICKafQxvCzRq1t5Yp2Y5KydPyC7n2AwNykntiQsAiHu2pEsS2fXCH8Pa2uWvYGDEqz5z3Rz3fMgK0eDn5GZVu7iDzf0gkT2Bnhlh5HKF3ODmFAZwXeNMA0UcfGDldA3DK60p7c8xy9td1npyORxxX93pl+jzKYJGH3HK3CinXkJUFIlSwLfR+h8f1vfp9NBd5tOAfXrbMRA3fbH02ItJqOd12J+yJTVkGLjKN5CExmEqDB0fGtODYbz1tvC9+mvFJacFWbxFHg73c2oUdVTLaEGXM2hvbg1hqSX87IthJ5s71snij1ed1AnsZriXpO665RpjTNu7CzzjDxoHycuFcIl8GOFRal948D64bWkJHTTZ6Y4AhmfdDtRMHGBA2j34yHuXDb2GHOvk67wkv9/dsAaGJxXLUe+vPzYfn8X0JnBz4IL7L7w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(366004)(396003)(136003)(39860400002)(6512007)(41300700001)(2906002)(4744005)(6506007)(53546011)(38100700002)(186003)(26005)(2616005)(31696002)(8676002)(316002)(6486002)(54906003)(478600001)(66476007)(66946007)(66556008)(4326008)(86362001)(36756003)(31686004)(8936002)(6916009)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3JPS0lFNjB3bGJId0V3SlhQTDhnbEVLbXprUTg5OUZwVUxnZzVyM0NZZHdE?=
 =?utf-8?B?bm12TEU5WnFFYlgyaHA2TTZKUlNIcVpiOXJib3BBOGoxRkVCNldGdVo3STE3?=
 =?utf-8?B?TXhCMzFhRG5tVWZNcjNTUG5NeTAyeVlrNkJ5dnFGNzF3TEtCbVB6a1ljS0M2?=
 =?utf-8?B?aCtPK3J5ME13UjdHN0tCU1JtQ3dxd1lRU09NY1hiN3pEZmtDZGQyYnE4MlhV?=
 =?utf-8?B?T3dQT2libWU3bjdPemY3SmNRN3J0amlLRU5EN3B4dWZFNkRIRUt0UE5TaWZO?=
 =?utf-8?B?SS8yVll2MmdKZ3NmUG03NEZJRXFCZk1OdlVhY0c5aWJNdS8vSVd1Y0dqT2x1?=
 =?utf-8?B?TXpCVkEvejM1azBNR25ObUpzaGZVdys5MHhTaEVqN2ZRWExBU204djl0L2JQ?=
 =?utf-8?B?VlZLM2xHQzh6L3AzelQyQ2FxN0RQZXgrcm0wbE5zRXlqQThSMUYwN014amtM?=
 =?utf-8?B?RkpBbVEvb0x0bXdZSFlOa2hYTlE5Tkh4TGFTNzEzVis2MVY3Q01LR09nMTZy?=
 =?utf-8?B?cXlxR1o0WklLOUpkL2xUem5memtuT2E2RGVLTUlhZC9HSys2MW50aGgxM2Iw?=
 =?utf-8?B?UXVKbWlxOSs5b0Y2VjVrNnBWNWlxSHRhNnpmY2JxZkJvOGl0N0VsZzdCV1h4?=
 =?utf-8?B?TEN5ZHFpaFNpMFpLd1h3bW54bmJCdVdjK2hBOGVodXp2ZlFiOVpxMGcwTSt1?=
 =?utf-8?B?cUpQYmF1T0E1Q25oa3M5bzNzMS82eVhlN21Pb2xZaEE1V0NoMXdUUXhrRGF1?=
 =?utf-8?B?MXdBT1prVk93TW5WNzBadEVkRnkzTStGTjc1TzlBSHNxNHRTU3p5OFUrVDI4?=
 =?utf-8?B?ZHRLeEF3b0Z4emZoUStxMnMycW11bzNacEhOYzJGQVBLbVpZS3pJa0h4WmNC?=
 =?utf-8?B?bW1BUlZRekNXSDN0eHdlTW5XTEl3WUd0b1VCZXRJSGJDWFppbkQ2SkIvRndk?=
 =?utf-8?B?VlZYek83T3NKRU9lZjVpYXV5SHMwTTlmbWU2M1FZTFNtNVo3Zk9TSmZSRlRs?=
 =?utf-8?B?SEJxTndSL2hCMlVCbHJ2c1l0NGU4NUE2WjNUbmNFbldXem13T3o0b3hHekxi?=
 =?utf-8?B?V2k3OWh6VU5ScjBMeDkwNnpyQXdwb2xqU1E4NS8wK1JZMHBIQXg4UGttK2lp?=
 =?utf-8?B?V1ljV1loeXNlTGk1L1VLckN3NUMySDZmbEdBRytyUi9CSFg3SHhRSlE4dEtR?=
 =?utf-8?B?cGYwQkZQdklyTmZoNEpsYUxUNTFCZGcrbUNSNkM3UEJTcnVQV0E2amJob01Y?=
 =?utf-8?B?RzNjZW94NGp1cVVkblZzZWhsQ3BlQ0t3Qkx5VEdNeVBpSFhTbG0xUktveDR4?=
 =?utf-8?B?Nml2aGtYMERudEF0MWNsVERmOWFmNFhmaVpCVlVOb2ZnWHdIOWlXV0UwMDdv?=
 =?utf-8?B?QjVHVmtVbnlkRGxiQlBpdlF4eTllbFdYakFDRWtLNG9NUzZCVGVrWjJBTDBI?=
 =?utf-8?B?YTVjMjN5S09FdVBvLzFTR0lUZDYvT2dGQ2R0ZHBFWklDa2krUklDdW14REJi?=
 =?utf-8?B?am1TSEo5QUFkaDY2NUtxTmFmK2Y2eWhIZ0hONnpqMTlrLzdDSHNDc1FTQzZL?=
 =?utf-8?B?Qy9vaEZCbzBObWpZU0xqOVYyRHhnN0NOQ2lUZTFsT1AzM3VXR2J6M3ZmVXdY?=
 =?utf-8?B?VmZyZEtVMWdhSkJxTXBkQktzaGFRd1ZPV282Rm9zTTgrTE1jK0twa2Frdlgy?=
 =?utf-8?B?NjBkcmN5QThtNVk4Z3Y0aC9hWjdLQnZ0RHAwZ0JSTWh4bXNhaFVQOFEvd1Vs?=
 =?utf-8?B?bzl5V0ZnVDM4YTlHMmNpTUJCTTd0aDJqOCtMQ1JFaU1rRzRVU2NnSEE0Y1ho?=
 =?utf-8?B?RjdqdTZ0VUVyUjQyOHUzbFZrTUx0bmMrdjc1ajIxQUZna0FJOVpjT2V2YnYr?=
 =?utf-8?B?OFpVTGphUUdseldIbVNUdVU2d2thVkZadVE1eGlVaFpKb05nRWxMUURMc29Y?=
 =?utf-8?B?OHBUazVDcU9WNEY2c0xSdDNlaldrMDg4Q0U1bC94a1Q2TXJiVENLSmU3a1dZ?=
 =?utf-8?B?cWtMc1pSbmlHSVdJTkRJM0sxRkx6V0dHbmNqb0xXanFHT3hOekgyZzFBQ0h0?=
 =?utf-8?B?ckNzcXErRnZtMTZVL1huMXlJYWdVdlNHcWw1b245Q2ZTR0RPSk1CYnA2SzNu?=
 =?utf-8?Q?aIb/IN6m8C/At+PDk85FGJo6u?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a220a-c3bd-47fe-c947-08da7e946a42
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 08:01:53.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WqZ73lmkYw5lPUQBEu07rr3gmiq+VmMIDPBtmYDcvCwW7KxoMrabnuQOUnapwT0VK6Xyoara0USd41AmhydIgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5411

On 17.05.2022 17:31, Roger Pau Monne wrote:
> Roger Pau Monne (3):
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD

I came to realize that I had announced that I would commit this about a
month ago. I've done so now, but there was quite a bit of re-basing
necessary, to a fair degree because of this delay that I did introduce
by oversight. I hope I didn't screw up anywhere.

Jan

