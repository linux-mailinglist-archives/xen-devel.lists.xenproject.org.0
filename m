Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3483F18DA
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 14:13:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168706.308007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgue-0004dW-WF; Thu, 19 Aug 2021 12:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168706.308007; Thu, 19 Aug 2021 12:12:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGgue-0004aV-SM; Thu, 19 Aug 2021 12:12:48 +0000
Received: by outflank-mailman (input) for mailman id 168706;
 Thu, 19 Aug 2021 12:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KGBc=NK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGgud-0004aP-OI
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 12:12:47 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d3e62cb-22e2-44f7-bf34-a2e5b74417de;
 Thu, 19 Aug 2021 12:12:46 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2056.outbound.protection.outlook.com [104.47.13.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-7uxtjW1DNOiQ5rr31JbsAA-1;
 Thu, 19 Aug 2021 14:12:44 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 12:12:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 12:12:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 12:12:42 +0000
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
X-Inumbo-ID: 7d3e62cb-22e2-44f7-bf34-a2e5b74417de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629375165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JJZORqtucVApWQgaGg79zXuwp7iiOAVUA/gC1m6H+ic=;
	b=hbpFo5toIz+ckDetbsyoUjIVZEcBtALpEzzMAlMUOQAv+v6CnjXIo/UdJsjYSWLwf1bjii
	QMOvkO938J9q8jtFrvgYeAF5TcHkZknfROpLSiEkMXvGfFkFYMMtFwvSjGB+Y41JouR1ZR
	1YGb6FsVfF6M0ut09F8t3md+GwJXTvQ=
X-MC-Unique: 7uxtjW1DNOiQ5rr31JbsAA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAnis6eCQh2WJZ7j8Ro36KPnD/szTIEQRwqbNz/ZmLNkgnYMo58TtrESTBWVOrrFXC9yanKSkC9tSul6AJf18XDdje8YgATR+EBKaIvORoZzVTEAFg3SJmojGZMjtCF6NS2qSfJZD4VACjxuh54ihYKm4morqT+Vnx9LcsagEo7QgIowCYYx2effxCM2lQzLICKEvSZVh0M0Yax81MPgEPyxMqt/0sVSDtMEOYgCewqveI9Q4m716nXpoChzzP7vtyGpEfpTn09JxBK4av5EbSPHR5iwhEWz16jdAOBC/0QcsfN1u1lDefi43aR1eYLEBWtP/96EPrC+ITIozO9BiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJZORqtucVApWQgaGg79zXuwp7iiOAVUA/gC1m6H+ic=;
 b=HWqOtjncEZAovVSwUGDHYT1AkhsYz9grhc5UoU30TsGPmU3zYZwgLsoLLFNlKsS/Xp73HynN/huoGdoDNyFgvvj9kMFOeBrFxwSKWoawKNIQR/Jv5KMrL1/ic4PVQueJ3QcrIhNjaSAo/pFLPIpFl/CpYEk+Nah1wXVsFn8Ejje7e7xXodPZcTBjAx9GQ5acg6KQ7vGJeh86vZeqStoS6N7ufGylTrkO1dDHE6cWgAVQyexdB4TTkd2G93cSc6brt9IISKb5gmAu4fpLjZIQDZ1FWdGAwZ428Enm3tBDqtwIHMthHyd+UeTc9kgTN5KQoKX8tnf2UGXGD9eq+AGgWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v1 13/14] xen/arm: Fixed error when PCI device is assigned
 to guest
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
References: <cover.1629366665.git.rahul.singh@arm.com>
 <917720808121c3098690b51d55f2d60118ec6408.1629366665.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f57bc8cf-6fcf-b9ef-cdd5-1bf5ad4701a7@suse.com>
Date: Thu, 19 Aug 2021 14:12:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <917720808121c3098690b51d55f2d60118ec6408.1629366665.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0175.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 106d931e-0bdd-4cd4-32bb-08d9630aa550
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5328981071748DE89F72EDD9B3C09@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HkZNSxUKe1QqTGDJhBobJcPdQ6OsSjNDkEBL5Ci5ldOthu3wEHac349TcJvV1km5q5dQPqcfXXOstQpHMWoaKPl7c22IFyi9jezl8MwLujbhbrc7g2VJR9Jvda2w+s6v9penAjcKGhiU/5ckM4Oex7yLZEKDemzApftmhn/JCnSJ+jo7P5Y61VMUk8x9bRC8dIDT5SMyCnACc2AqP7D9h4x9GOEiqSdLN1RfzdB89SEP6/swRKjorwK0amZx1r2jxJ5OMnTRLyJE3Gk3cYUaBWuiAVN1JaExuwVmoMGsxfkW37dON8iMmLgsZqQ1c3MIeC4lGLjBu6uHG4byS1me5saLgFYrPXxzocyQsSEY4CiKRRvWyzileBjRk1Eo2f96xqnGzsjO1YHBBvJDxxMlpHiRF7KeH9n2JPhClL5jw3wcNJcCCCFOxy0f1T/9Rs7tTKzzwlcKqYYTbxDuwgnb9NV5fczQU+HwKSOkd+BYLPI9KaofZKxL0ndVnw5bIRk3x30b0VXvanjt+mU6fii5moQkeYJN0HCsSQB8fLDRLvC+t/aOuvK2dmtqzOglJ54kp4naF/I+fVob7Qs29SncRmvPv9G/50bMsP+ozEW37yof5QqEa5vs6h5+zZ6PhbCrmqG9jO2gtSSLgT16ULc1EPgeCiCr2jEOaNZ9ZuubqNE9sBS/nLVUAD2hnwuotZzkQyoP4qjsMqCwuhyjWemnrRrc7+otjmWm6Bfm3R4hklo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(26005)(186003)(38100700002)(6916009)(8936002)(36756003)(53546011)(2616005)(8676002)(16576012)(4326008)(956004)(316002)(478600001)(4744005)(54906003)(31686004)(2906002)(86362001)(6486002)(66946007)(66556008)(31696002)(5660300002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFhndkZXZ0FMdkkzbUUrM1hycWVzTFpsU0o0M0tyLys2ejN5QzZ4QXhaQTVY?=
 =?utf-8?B?ZjNFSnJvK0MzYm00aHUyTmxMR0I4cmJwd1ZveFFoOWdrYXFHQzNGWkcyWXhV?=
 =?utf-8?B?cnZiSnB1VDBUTkpQNEYyWldmZjRCNmFCMlM3ZWVJcWhRdHdrVnluMDIwTTRr?=
 =?utf-8?B?bUJLMWx1UEZDdzhSbnVLWGhXRkJVVlJYaTcvbFRaMmhlKzNmYXpwLzdwWjFa?=
 =?utf-8?B?b2UzLzR1Skc0ako2enRUUjJaV0NoNnB5L2FYOXA3WUZJOW56OTd5dmtTZk50?=
 =?utf-8?B?UTlsTTJzdmlLU01BTG9BeUhFQ2xiV21Mc2lPUDBsRlBuZ3g0TkwzZ1ovdXkw?=
 =?utf-8?B?MDRFd0JJemZncy8xTE4zcmQ1U2h5VTBmdERFU1ZwWUtpQnNsMWpOOGVxWGRW?=
 =?utf-8?B?RmJPRjQwczZ1bGgvaHZHTW1VUHdBcmdvUjE3VFJhVEhTRE1Xejl1TFZsYXZk?=
 =?utf-8?B?b2dJNnluRGw1SHN5UFpPVTR2Z3pNMm5WSEwwWlNVN0EyTWNYYXlzWEV0NXE5?=
 =?utf-8?B?eTVsbHBVdnhMME0zaTRHQXh6VTM3SE4zYjB0SktBc0tkMFFUUXd3Tk1rd1Zi?=
 =?utf-8?B?bEE4UFFnYkthcklPRXB0RVAvWW8yck5yVEdPZXF3YjFWUXdqWjdBME1kWkRw?=
 =?utf-8?B?UCs2ek1yZDFvbHhsakx4bzBvT1V0Und5YnVoMkUrczlEelo3dmdVZWIrUUhK?=
 =?utf-8?B?NFFMZURucFJqS2hhd3UrY09TWk84SnREbWwzekFUU2Q1anlLcUxEUFRaSjNS?=
 =?utf-8?B?MTdOMlpOODAyelRFaWlENDlSVTFRRWRidFFianMyMUJrcnptRG5JSm9KQ01C?=
 =?utf-8?B?N0hId3JsVzNuRGl4Mms0c05EWXZ3dHVpTFVtT0g3K1NjbnRZRzM0ZkV0VFQ1?=
 =?utf-8?B?NTFGTTUxZ1REakxTWFo5ZWRoZWErc2MxbmxqVU11RitzRjRCWS9NNmhnZ0Zv?=
 =?utf-8?B?cHNjR2pqKzl3U1NFZUpxd01EaitTdjBUZ2Q4U3BMZTlyTUJzR3VETXo4dU5E?=
 =?utf-8?B?dUoyQ0J6UzJTSHBuWU9QWFg2WFcraDdQTWJyRklJbVZobncvV2lUbXdnekt3?=
 =?utf-8?B?UU8yZnVIaFhha1RqNlAraVE2a2UzeGxJU29yT09CTEV0V0orN2RqMnl6S2lw?=
 =?utf-8?B?UkN1ZUxrak9iZlJrTm5zZHdaMzhwY2tBZzR3eEpyaEdhbDE1M3dETG5Qc3pY?=
 =?utf-8?B?dGsyd0ZtZW4rRm92QXFGVSszTko1cGdOeGxrcUM4aWZFL1JDanEzZHo1OUkz?=
 =?utf-8?B?SGt6ZVhQZ0NPU3VVa240TkZSVGs5ZFM3Tk54NWIxN1hOeG9LczVWVzh6a3c4?=
 =?utf-8?B?UktDN3Byc0pKZ2swT0puZWZEOUVTcHZUUmROR2lMSUxxUlNyV1JQZkJDOEl2?=
 =?utf-8?B?dUh6QXZZdmJuUUUwU09SS0J3czJVZzZzb0hLS2ZhMEQxQitON3RSK2RvZDUz?=
 =?utf-8?B?ZC9hVFV0dUtURnVWbFVzdjlPbkxmenBaeFdidlFZc1ZWMDA5Zy9QQm9aOVNq?=
 =?utf-8?B?cWlGUDdaSWFQVk0waEdEbGd0am5BSDI3YU5XSlV6SjlCZ0ozZHhrQ05heHF5?=
 =?utf-8?B?ZnFxSVJ3LzdhMllUemZLdVRkb3E0S3VzaitsYWhJVXRaOVBuRnpRbXRpY0ds?=
 =?utf-8?B?R3B1SFk5RHJFOGh6alpzS2w1aVVEa3hTek9lYW9GVHZ1LzQ4Y3kxdWNJYklU?=
 =?utf-8?B?TFU2THQ4cXdaVGRza2ZWcjZzWjdqMGg1Z0U4RFFrSEFrb1RVSWowc21VdmtH?=
 =?utf-8?Q?y9yVqGLuh0hxwJ5sb3yt+I02OpfiSmL837/kmdE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106d931e-0bdd-4cd4-32bb-08d9630aa550
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 12:12:42.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXzoijH4WwBKtP6e4mnQ1AVT+3kJVf4Nk4dKaoHWyXqITlNDK4ieJCT9LeQCnvISqm5PFzwJpqyyVngB/GVdyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 19.08.2021 14:02, Rahul Singh wrote:
> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -173,6 +173,8 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return rc;
>      }
> +    case XEN_DOMCTL_ioport_permission:
> +        return 0;

I don't think returning success for something that doesn't make
much sense in the first place (there aren't truly "I/O ports" on
Arm afaik) is a good idea. Instead I think the tool stack should
avoid making arch-specific calls in an arch-independent way.

> --- a/xen/arch/arm/physdev.c
> +++ b/xen/arch/arm/physdev.c
> @@ -42,6 +42,9 @@ int do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>      }
>  #endif
> +    case PHYSDEVOP_unmap_pirq:
> +    case PHYSDEVOP_map_pirq:
> +        break;

Less sure here, but I'm not convinced either.

Jan


