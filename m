Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588A07CD535
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 09:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618421.962050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt0eD-0002Dg-Ks; Wed, 18 Oct 2023 07:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618421.962050; Wed, 18 Oct 2023 07:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt0eD-0002B9-HH; Wed, 18 Oct 2023 07:07:17 +0000
Received: by outflank-mailman (input) for mailman id 618421;
 Wed, 18 Oct 2023 07:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EezS=GA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qt0eC-0002B3-5U
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 07:07:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2041.outbound.protection.outlook.com [40.107.7.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f77ab66b-6d84-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 09:07:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 07:06:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Wed, 18 Oct 2023
 07:06:45 +0000
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
X-Inumbo-ID: f77ab66b-6d84-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+ZWTC6ChlcDy3pbTyPWJ9VtA+uaKdRSsJdS6bJo3VhokhLOV/1JwfSNqjQW5bs/vX40FtReBBrS4iYN/mzwr1SHdbZzVWuAAae3ofiB/3COiN95BsLxV4tK1Obxgatkfx8jZGzwNzmxEx8ZDvHVG9qrbt0NfIg/+sLtlCZ2go8GJTFTN+bKkvKSg4R3r31sz5NfkUClZMWqs7it5vtS7kM5Cldyo1mfLuahdXvTLyd7ZG5UVGTyN1T8103owu9QJgQPJD+fP7OwkdKXhMY45iMMzZREkvpUTdyUA2pmEQfzC7ahZIOI8s8iJrOSNjhDUWcW8QbkCkydtNMW0lfuWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKdDwI2hzVwx/kUhrO3TgG3tpZjsIQYiZp1FPIOF9Mg=;
 b=jCRzvl3U7Tjq/79XC0X0yiP1kghSc4DTBn77USB4wehkzG94KaYXQf4X9IAUlvtv7HNTluqa73uio9M+RN4sZjALqZSnRnLK1P0l4ncFMblTja/j9K43+pygGtXYupfobTcSvAOvPNrrPZiCp72HF0PTespuDIqgmwCJFTFP/h4gYcHphRJS1Orc31I2+G3EH3//vasHqcrbyOZAZQrAi14ggb0TfTQAxf5fX2QYCs/HEjmW3L8vZnZz85/xH1gs4uz0XsiVuznHU3lBaYoQ+kM2Smm5aO8mWAR2kykqD/mYO3F9Btczjx1cHyVG9wPi2dv1QxyoRCfW+dKNVvkLZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKdDwI2hzVwx/kUhrO3TgG3tpZjsIQYiZp1FPIOF9Mg=;
 b=GbLOWmbief/idIuv1KQ/Brkrtttt1s7lBCMN8CrBIf/G06sQpKoQmqF52OC5VXM05jmVs41H3RYTeT4Ql+KKHBUwA/vmv+QexeHxMPbjQNIJATOILGliX4xvHyBMrMJ/gRj5ag93ox+je5wFlWr4PFIvru72IrYkU1ha9sy5ekLUXs4P/dbI1J1cDjI2cFoOo0DxQEepV2fjITGyuDfGgugZY8VF81BH5BgCz/dLasuGe7AeihDqqPDUU8QqKjb/pH5hkyR7j2SGrsOP07n5fCLy53bMQduuN9jMsh4qfchX3OBM3VZQDfPC9ZL3rkACECUkrPK2rHxR/Rvnms29cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <55f70f98-4a84-401c-f9a4-3cb50ca1418c@suse.com>
Date: Wed, 18 Oct 2023 09:06:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] cxenstored: wait until after reset to notify dom0less
 domains
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, jgross@suse.com,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <20231013230624.1007969-1-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20231013230624.1007969-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 473cd3ba-7ed6-468a-a807-08dbcfa8c9f1
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LQSF9LkUh23Eg6yYTHujH6L0rNIVtWbuG/ZVnYynZwas7J9sULrsVAqsGHcql9oOzRh27YX/xfAo8XjW8vWNfrbGfRBtXDBPJ9awwDEoLbbWaFANaptqg1Ip6QgQKqM3xrrWcw3SXMpkqkskvGgYkYledXHk1NvDZp2AqaPgSdy1T+7U9wTdD2/SBiiTXAf49cpzXTMg01rZUxSWm+CUQ8q7fnujk9IKpEQ086/PeEKqpjG3UrwQhWDob2jPnSthhew9hEZAvoatRkA55aIjKuxxEigdTh2kHDBzfiyNCMDcVZYvgPkCCpMKGXNeFBzsrdCxjfdP8Cda4vBpCSHi4Mqsd/c2KT4VezWYaQIf/UsNz5Zf8cN7U9hqClJlWs1/HEfipw+yw4VkPXpWOv5ZxejbzE7lYJ8NxMtYRrr1Np7vDU77s7TKUuFQl1yrBVmV9rlNjVGKvOnNIMvgHpIVCUSAaG/v4hpXmzGO8bp7FJiu1XHNbH7ItqQJu/lz941xNOgep1rbkKa605edkZS+VW0lggxoeemSerGPIxfOD9pGF1WxnThVlLP7dDy9nCtiUrtH66fmILsFUzOtbmvZNYDekBl2B6EvivESebitNtdcjWJ+tfptpQHLn53Ji84mQYYrnXOBTlGTRiRcIDJ25iz15OYKYOW43vLsuEUCK5Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(316002)(66476007)(66946007)(66556008)(4326008)(41300700001)(8936002)(2906002)(5660300002)(6666004)(6506007)(6486002)(478600001)(8676002)(53546011)(6512007)(110136005)(31696002)(36756003)(38100700002)(86362001)(31686004)(2616005)(83380400001)(26005)(32563001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnBIM3FRVVgvNTlJSzd4aTZxb0wxbDF5ZWI3SzduVkp6MktNdVJ6WG95YnUx?=
 =?utf-8?B?K1d0ZGk4MEViNmJEd2lDcEhVNW5hNHA5K2pHcGJMQmMrWnZ1NDNtdDBFeE9F?=
 =?utf-8?B?b3krRGozRkFUUkM2ZE9pd3NENGVMbzR6Q0tkcy9sRjd4UG9HZ3l2ZmppOHBS?=
 =?utf-8?B?ZHZEdmkzYXRzNTNRTG9GQjdJSFRsNFdSdFdjNHRWK3JZakczb20yakFLM1V0?=
 =?utf-8?B?eTVWYURaSmdMNk1UeDZySE5sN3pod0tCdnFlYjA1NG5LaUJvS3creDM3T3JM?=
 =?utf-8?B?VVIwbXVtRDJ1VmcxaFZwbGR4NlFnWjZ1VnBoUWt2UUdZVWxzN2IyaTlpbGRL?=
 =?utf-8?B?UHpBclBqWjlPVnZtcC95NENxQlcyVXl3K1p3TlpFenJjV00ycGE0Y2FiTTAx?=
 =?utf-8?B?YkwxWTJESThGWUxsY1FrTy85cWI5QXlUSHZiZjJES2dnQWVEeGtOVUdLUGd4?=
 =?utf-8?B?UGZDbGpCelhyMlNwVEZSMkEwb2RJWUtIcjBraERaSkpONFlteHY0aGJ5SHc3?=
 =?utf-8?B?TEpBR2FXZm45bGxlQVZ3ZjRkOEt1eWpYbTIxTDAvOGxRWXF3cHozelUvNzM5?=
 =?utf-8?B?aHZqRWRRR0tENnFOcU9BbndPYnp6Wm4wbXlMaHRoOUhNTGxaSXRaYm1ONHlS?=
 =?utf-8?B?SzFENEZONWY1dmlpTnQwZDhkRlcxRTBpWUo1QTUxN0Mvbzl1Y1ZnS2J6OGh1?=
 =?utf-8?B?Qms3cTJlYU5pbTlMb2pLZzdpWEZsRjJUWHljNXhzelhxbzVJR3NwSW92eUlm?=
 =?utf-8?B?V1VTWkI5clQ3cjdFa004SzFmMFhkM3k3dlpyMS90TE5vWmVHdHd6VFVvOEY4?=
 =?utf-8?B?ZTdQcmQxR211L3Y2dDIyRFBpS3JMY0M2cVZZaGtVOGNuNGpUbjcrc0lObjIz?=
 =?utf-8?B?TkNqTitVSHNudnJ0bGRBZWJacVU2a2xuc205cTU0bnR5RzE1cG1PR3A4N0FM?=
 =?utf-8?B?WGhGNEM2MXBVNzkyOXNxa0tSaEFRZ01pS1dwdmJiMzlGZlNkNXMzT3c1Tm5Z?=
 =?utf-8?B?ZTBNcnJQbWJyclFDOENJK3JNdURLRUllb3p3ODdwS3pwUW50dlBhWkxRZWJj?=
 =?utf-8?B?VnV3dHRiL2dJR1B0RE5reUI0ekNaQkpaQVBoYmNQSE8rNEk1Y3piMVhtM2h1?=
 =?utf-8?B?Y2FVNWl5dnR4TEYrNDU4OFlibjNhQiswNjFHUndiTVNOSWxoMThUS2V0WFph?=
 =?utf-8?B?WnZOMnJtWDRkUk9yWUpxOTRsYUJUWkt1QkR5TC90Yi83a3Q3OTNHMUdYZ2Rq?=
 =?utf-8?B?UlVOK2x4ODAzQzU2dENsbHJvZ00ySDFaZUIwZisxNGxQZS9jRkttNDgrdno2?=
 =?utf-8?B?RjMxNkptakNVdmVzby95TzRLRmIyQTVjQ1ZKUzVNRmI3NXY3WmZNa0ptWWY4?=
 =?utf-8?B?WlJqNkV0TkdrWDFJL2k3L3dUbEVPQzZGVWpYQzdVd21hVDJOODVkcWxyTjVh?=
 =?utf-8?B?cUNSbXFSRzRMUStkV0IzM0xhTVhEMXhlOGhxTWR2dGRMOVcvcjM4MVArM1dJ?=
 =?utf-8?B?a0xuV3p1dVJkZVU3U0JzOG1peWVtU1ZNQ0pBdXk1Q2xCY2U3cEFldHZIaFFN?=
 =?utf-8?B?ZmpIbWl1NHpzUHUxcUpwcDZsNlBnZ3FpR2g4RmNLbTlpc0ZCdW1NdTZJTmxR?=
 =?utf-8?B?WHpDZXZIV1VhSjZ2d1dWM1pDRm0xZW1jNkk0bkEwV0NEdDNURmFxVVZYdXdG?=
 =?utf-8?B?OVFPdmVhdWhEaGNoYU5UeXlpLzhBcXBHOGNHOXFZdEdqYjQrb1RZRURIR1FL?=
 =?utf-8?B?S3M4WFRDbU85elVpY251TzZRQ1FwYnhsc0hUVmQyQUh2cGJtYU1QMFBUMExw?=
 =?utf-8?B?MVRJNC90a0duVkRKZVVCYmJyUzZkRUhnSEFqbFNRZGtBUVk2V3lsU2ZEVWls?=
 =?utf-8?B?aUFtWWU4OVBIcTNxS2pvcjFITXhSQzRpYzVSemVmSU9WN0VsWUhVN3VOYzRm?=
 =?utf-8?B?RHl1SWsrcGYzVnl4aXdiN291S2lITXByYXNlUjZ4ZzRRQWxTQlFRZ0pXM3hW?=
 =?utf-8?B?NWVOSU9xMVFJUXJpcFg2WW5JTWV5RjJlcGhQRm1wRzhBWm9VeEZ2ckpkanFR?=
 =?utf-8?B?TGV4VFUrZ1A0Si9YcW8raGFtNG9yY04xY0Q3M3NIYUQ1WW5BcXNKQWNSSTNP?=
 =?utf-8?Q?u92Qp8Xf2s62+uFIpEURYTdSv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473cd3ba-7ed6-468a-a807-08dbcfa8c9f1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:06:45.6974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fnQ29/Xe+dXzhen5LM/8vgmQYxTU0I/vCmPV1aPF/TUrI8Emky/cExUqeEM08A8XSevni4yCCeWPUrVbqiS0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416

On 14.10.2023 01:06, Stefano Stabellini wrote:
> From: George Dunlap <george.dunlap@cloud.com>
> 
> Commit fc2b57c9a ("xenstored: send an evtchn notification on
> introduce_domain") introduced the sending of an event channel to the
> guest when first introduced, so that dom0less domains waiting for the
> connection would know that xenstore was ready to use.
> 
> Unfortunately, it was introduced in introduce_domain(), which 1) is
> called by other functions, where such functionality is unneeded, and
> 2) after the main XS_INTRODUCE call, calls domain_conn_reset().  This
> introduces a race condition, whereby if xenstored is delayed, a domain
> can wake up, send messages to the buffer, only to have them deleted by
> xenstore before finishing its processing of the XS_INTRODUCE message.
> 
> Move the connect-and-notfy call into do_introduce() instead, after the
> domain_conn_rest(); predicated on the state being in the
> XENSTORE_RECONNECT state.
> 
> (We don't need to check for "restoring", since that value is always
> passed as "false" from do_domain_introduce()).
> 
> Also take the opportunity to add a missing wmb barrier after resetting
> the indexes of the ring in domain_conn_reset.
> 
> This change will also remove an extra event channel notification for
> dom0 (because the notification is now done by do_introduce which is not
> called for dom0.) The extra dom0 event channel notification was only
> introduced by fc2b57c9a and was never present before. It is not needed
> because dom0 is the one to tell xenstored the connection parameters, so
> dom0 has to know that the ring page is setup correctly by the time
> xenstored starts looking at it. It is dom0 that performs the ring page
> init.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Should this have had a Fixes: tag thus marking it to pick up for
backport?

Jan

