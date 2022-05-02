Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C07516AE5
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 08:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318645.538494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPcx-0006B8-II; Mon, 02 May 2022 06:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318645.538494; Mon, 02 May 2022 06:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlPcx-00067k-F3; Mon, 02 May 2022 06:33:47 +0000
Received: by outflank-mailman (input) for mailman id 318645;
 Mon, 02 May 2022 06:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nlPcw-00067e-5y
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 06:33:46 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0b49308-c9e1-11ec-a405-831a346695d4;
 Mon, 02 May 2022 08:33:45 +0200 (CEST)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2050.outbound.protection.outlook.com [104.47.13.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-0fA6E43dOR-nGPAflxj5KA-2; Mon, 02 May 2022 08:33:43 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8586.eurprd04.prod.outlook.com (2603:10a6:20b:439::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 2 May
 2022 06:33:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Mon, 2 May 2022
 06:33:40 +0000
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
X-Inumbo-ID: d0b49308-c9e1-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651473224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ll/cG+hgZ50hXK8PlMmD+tzjmdvby0u0ztVZzLVRIg=;
	b=Asg0x7PBFxVA/EQkiHtLOmQBG6vEddpzJf3kvvM3qhbuqXiLd2+zzpCDuXUAlz7MjzskGq
	Ki2mStseFINN/oc9sUzaLC7RRSEG6kLEsyzhle/Hhg97AX+dWCrce1cBBKu+9MH9b+lTFD
	HHwByw25Y5tDCLeBcDqcQbijTFN5tQE=
X-MC-Unique: 0fA6E43dOR-nGPAflxj5KA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXK7HazJkaRhk6Pca6YOU8DvzDhv8oJ3tmq8nujUqKcd3CX25q2GdVrxmbcDsdhT3GpUr1vvZRn0TuYlIZ5/0VBZUxorRuw9mSzR0I8AQHWtNjxoSppRv2xVIlwTxggPjhFN8OioQexzw+dJo1SaZAQTmi2yGheV9c9krcn9wq4LoQ7AbRPbv8LewdzE2mQDKXsbyj7vEd0NbzbLGm/zIYO706l7QSANx3KiDVfWzsbW15WTJwa11sJzwn3Gyb1G3ol63Lw+xPalhT49jo8HfQDeWDFJd0fu/EccVnq4/yjN92DZoT27N+6dumY7Scq3iMGL6toVCW4ACH0J30YUpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ll/cG+hgZ50hXK8PlMmD+tzjmdvby0u0ztVZzLVRIg=;
 b=GanKL8I2/PIFsFj7gCSgxiCxhRlQwJ6J+uj0B8x5xVYJpPETIJ3MWpLAK//mDnSQwaX+fYvgq/IlMDOhPlW7Vd7pJDg9ZfAabbbeTqYG5/zGV8ZJ1/ioSQoXfi6ATsLwRS7Le3XGpx0AjoikJtb48C4Ki54ZPnRNJbALIb5T6mawXk0/LclGfDLh1kxLB7HCTYuAsPDs0fpBgztffuedUfwoer16coriPuqs/sxyZnDKAKiKmJ2uCbiUS27jfZ4CoyIa0gIONevfNYRY9a3WOpW++2wX1gnKBgYWkOCpHwhIxA+6UPJIGNoRTRaOjSkkz+kFhnWYvof996maDUwQJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0d726025-3ea0-e66e-d4c8-77708f0aaa94@suse.com>
Date: Mon, 2 May 2022 08:33:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v5 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-4-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220429205732.2030094-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::45) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 031cb4da-7b83-4eb4-cdf9-08da2c05b1f7
X-MS-TrafficTypeDiagnostic: AM9PR04MB8586:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8586F76B91AEC2574ECA7EE7B3C19@AM9PR04MB8586.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fsdtOmkpYDI6Pb2btIOIVYAz0W2dwYnbBAsWlHk+oMNqXjzhA7EoJXdgIztLmT+t09f/+D1MRbU7Clr5dN/jynmT1UCg7O5wqLZH2xMB9md4uxos+6Tbwn4trJUtBzjFPkVJnEYyoMlxArYHHpN9vvQGvfDZWfxHMlioJbbR6ySK7VSIDkT9xjPBy8JX8B6Lkdpt5wQwfEBYDOG8a0Sx0+2UKwQlhXMx+7GFYKCztL3DqcQ94S2yJCqbLbCS0Y1e5Izu9huGt72JGLOmwyS5TLrrCz0TJ6jz5s+apR3O0m9s5TmOvEge0A3A1laPnFI0CMNi3wEnSN05/rldg3QjdKDROFPnbP6j3B5YSaGq3keCt2MENTrkil1pDyinlga1GcHkEjV4wnwiomFgyBx0Fug+0LjFyaUVAnMhY4Fb0SqBvBsNH6r+v1LMUQAEHyh5fWUb2PHmJGAUZLNCy5ZIDCvHczCLgNhhDe355J56bf+W8r7Y0YyyJbnsOn8j9aDJUPp0oWPKTqFfniCUMRs+WQ+k1g1vX5tCt7HydMXzF6VE0dqXtNuoZE/szKW55654CLmdkSpj2TQxsuvUR/Kpkxe/WAESh+4bvAiALRR7N7qHoJyNWIEQS9c3aSTjaX1xe+QTXqzYs/OeMMve/KvucAcLrsoTosxl2PAPRrNz09UinbQMNkqn5J57OrJf+UsDjaF9ezfvbBJfs0OBKukPxeVN0CUVYk1REFl2DhrQ6WTHbbDBXrC4ECVa52LHlQqR2GX0Lkik3SQEq+b6hAYNuw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(4744005)(38100700002)(53546011)(6506007)(6512007)(36756003)(31696002)(86362001)(54906003)(508600001)(6486002)(2906002)(66556008)(5660300002)(83380400001)(31686004)(8936002)(186003)(2616005)(66946007)(316002)(6916009)(8676002)(4326008)(66476007)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk11d1lsbVpIdUhMU1NXeEliL3VPczBOb1BkY1RlVjFETlp0MHN3VGxPMUs2?=
 =?utf-8?B?Nnd4cUxJdjlWdlBNNndneURVMzVrVldKakprMEl3TVhTcHgwSG85R0dJNC9u?=
 =?utf-8?B?TUUrcENwQjhRdUFjMWo2MWRHYlRtL3BBaVdVQ2tubSt5MEFyM1pvVU5xNUFZ?=
 =?utf-8?B?aDcyOWpKWjB4OWJOaUlKdjJVU0E1aWtJZGR6enA0UlRjSVp2ZnYwTldDVWJV?=
 =?utf-8?B?VDBzVGNlaWdYTXd2UlZBMHhsd3RSemFQckFKMkI4Smx1UWtnTTRwRUFOZjh2?=
 =?utf-8?B?YVVXVGVDWURVcHdyaTZlQjcyaVp4dXpOMGMraUl6TTRzVmZSQkd5eDFIa01x?=
 =?utf-8?B?REowUFZTTTlDdlA5L3Z1TXFzdUdXdUN0U0ZCdFp2VUxMNDkvMHhIb3owNFA3?=
 =?utf-8?B?OGFWaGZWalhxQi94aFFhMDZtMnFKdE9wVFI3U1AydW9Fbkc2RzZrWHRXSlM1?=
 =?utf-8?B?STRLRFlJakNQVjNrUGhhYk93NGlmSUVHZUZ0N0Q4R3k4T1JJWFZhT0FQeXgv?=
 =?utf-8?B?SVRDWEUrSDJlU3dTZlhaTzFIU3lOZjdWVmlWdkNkeThRY25UbEJUVVkyMkVC?=
 =?utf-8?B?dFc5ZWwvR0RQZUl2eDlGWWYvb2RSa1FCTjdxeFVZMi9wK2R2endIbVdZd1Zk?=
 =?utf-8?B?bVhmc0x4S2lnY0wxY1diR0VNZVJWcUxaZndQcnBsQUhCRzVqOUUxMGJSZnpE?=
 =?utf-8?B?RkFNK0p1c3BlQUtIWmVXbGNkbExSRGFNeWw1NTNRWS9CanV3WXRoNURUUTI0?=
 =?utf-8?B?Rm40cnVZSXZrN1ltcGdOVThOWUp0bjEzMzYzZ1h0RVhZKzI1ODJtVWorbEVn?=
 =?utf-8?B?QXJ2OWcvWjJRSGprRURYcjU3T0Q5WHdSWHFtRVlubHVERzMzVlJRUmdPa3lO?=
 =?utf-8?B?UUl4ZU5zbk5KUklJaDJ1eXpTQ2VROTFxRG45aTh0K3ZDQmVwcHdYK08zNEFv?=
 =?utf-8?B?N21IbEhaeW9ETGUrSmpKWFoxdkl2aktMRmhVVVl1VzhhYW1lSTlzVURBTEJx?=
 =?utf-8?B?eVJsblBTVlIvV0llcWdyUHpXcTI4Vll0M0ZlYTlOekJLOXY1QTJLcVRwTUxa?=
 =?utf-8?B?SXpYYUR1TUxSOElnbkZsM0JRK1RuRDFqOEJraUZnZ00vNVVXM1JDV2NHY2pN?=
 =?utf-8?B?NTVoSEJLY1RTaG9Jd1JyaWxSVFBJMWlFU0RaYW0yb3VXNlFYaENmSUJKSzU0?=
 =?utf-8?B?YWlldmxwaWR4Y3h0WUd1ejkvT05sd0hrTzIrZHpmS05yTHBXMmNBSlJWOTRG?=
 =?utf-8?B?dm9qSngvSTFnendzemhPSGVTZU9oQVkvZWpwcDRXdndrU0tiOWE1VS9Eenox?=
 =?utf-8?B?WmcvOFFwWWJWQUhxbTRCNHhBU2hPMUYvaSt3ODRyUk5ha2JaZ0JKcUNPdmFP?=
 =?utf-8?B?V3lPS0doZXFYaHJGek91eVB3U0E4aitteFpDRlNYeGttc0t2dFBuYTFGOVNv?=
 =?utf-8?B?dnBhb1NvV1dLYTNuWVhtSGZZM3NpMlh5cGZ4MitPeDNHazJKcGxGQUl4NERt?=
 =?utf-8?B?WVIvcHhjNVZ5dWpPK3ZqSEdUVzl0cHk1dWc3NEp3WDZacTVVTXBsOUZYeTBR?=
 =?utf-8?B?UkxwRmZyTHV2OEM2WjJtQ3VnM0xvem9sbmJ5ZjdxNEJpeStnckZrbE93ZHMy?=
 =?utf-8?B?UFZ1eVgzeDZVbWNNbnlXelNVck9wQmg4WFRIOUJGSnd2WWc3dWFTNThIbDd4?=
 =?utf-8?B?VGp4VGR2T0FMVTJiTlo3N2VNUGpkS1AvcDBJaW5SdTV5VXFSbEkxMy9hYmtD?=
 =?utf-8?B?TzNZT1FpMXBMQjRCMnkxL1VFWXdPdkEzTTdZTnpWc0prTXZxVEJveHJxMjZX?=
 =?utf-8?B?SEFpYktCd3YrditJbXZvUUY4R09DNFVNdWk4b0V1K2k3b2d5Z3gzVGVMc3NQ?=
 =?utf-8?B?emNTUVpTVHU2eEVSN3pNcjZsRWp2ZGNacHBJSUthK0hVVmtsVVNPMGdYU01z?=
 =?utf-8?B?OTBaVlZ3dDQ5UTVuck5IakVadG1CcHJaOWlvcnZNUG1kSUpVNlAwcGFONlFN?=
 =?utf-8?B?anJVNzhGVnNETy9qR000Yk1jSlZlOEJPd0hjdHpYOEVNYUEwNkh3dmVTN1Bv?=
 =?utf-8?B?Q1dkcmxkMFcxNG9yZTd6UkhOUTMvbmN4TkpHTGN3T2VTUzdzZGZkRTIwVXF6?=
 =?utf-8?B?UFZIeXBIazB6UWg1QThWVU5GTTN1U1l2dGl1REw0WlFjSWw5NTZWRytBaG1o?=
 =?utf-8?B?aW9SNnNYdmlZK2Nvc0JjMFkzeDRtWlZCZGptVzZyM2IzcjVpV05KcDdXME1E?=
 =?utf-8?B?S2VMcDArdEY1SzZrcDRWMVZGZ3czT25QWDhWUzhpNnJINXZHQWJab1VIM1Jh?=
 =?utf-8?B?RFFZWDJDTWhNQStFRnBLdDRPVjVzV0JEWmw4ZzU1dFdJWXQ5WnFrUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031cb4da-7b83-4eb4-cdf9-08da2c05b1f7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 06:33:39.9706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gr6FlUvEm8DsB7jklzDokH7RPHS7UjpbJtAwBNzf0M3g/ylVCUzQkHiwbGSb2dETIc1TbR8x5sROroKqnJiVTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8586

On 29.04.2022 22:57, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Export evtchn_alloc_unbound and make it __must_check.
> 
> If "xen,enhanced" is enabled, then add to dom0less domains:
> 
> - the hypervisor node in device tree
> - the xenstore event channel
> 
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


