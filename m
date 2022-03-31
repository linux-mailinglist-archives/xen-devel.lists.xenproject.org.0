Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289234ED63B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296776.505253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqVi-00016S-5x; Thu, 31 Mar 2022 08:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296776.505253; Thu, 31 Mar 2022 08:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZqVi-00013m-2f; Thu, 31 Mar 2022 08:50:30 +0000
Received: by outflank-mailman (input) for mailman id 296776;
 Thu, 31 Mar 2022 08:50:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nZqVg-00013g-Kv
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 08:50:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ca28cfd-b0cf-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 10:50:27 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-ugKrotDOP5iCalwqYM6Fzg-1; Thu, 31 Mar 2022 10:50:24 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by HE1PR0402MB3627.eurprd04.prod.outlook.com (2603:10a6:7:84::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Thu, 31 Mar
 2022 08:50:22 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::914d:e08d:7798:8476%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 08:50:22 +0000
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
X-Inumbo-ID: 9ca28cfd-b0cf-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1648716627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=09wT7A4DsdGxUWO4vNRv3n6kZVUUopasuBCdY4PwJUg=;
	b=SK0DjWBlAgNJWogRzBAXAPn4P6YhYuIpKCUlvwkKxAGXyJpTmMuqFl3ajLf87bukMGGIVc
	CB04mfzXpdvt6GTqzijakt2fboSgA35TfooUocHWwGVU1ciM+2P3Cj6+bkGowjOZ7Zd/mK
	YFO9rStkZVNtm21oYTu3xzU3kKknurc=
X-MC-Unique: ugKrotDOP5iCalwqYM6Fzg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaPtsrJkjrFpf45z452owaQWnxHYuLQ9PBNrTgAH8zvdtKJ8d1wdLOoAJCOO4bxu4cTOAGx00ZB6G7f9cK0H6lU5qPkZ2071OocevzslvjYvQdgOja2yqdEZ5yEi+yRNaslJ/th7Dl133Z9F49u6zs0Pz5MzJB+OGH8cNUXseomCLt2q4o+U3Ng7o48DA8sjCTmz1ehipfv9koN5m+dAcpf+MqGwgSxDote9UmzWpelj3LVbDgMyPwsc+8fLTUSFxqjtktQ/eBPXi46jh4wa+oNWtKHqyX4pGWny0GJLCHbwv+DCMLPJUyfhvxe0HiDOb31AHJUGSiJSorzXsC20IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09wT7A4DsdGxUWO4vNRv3n6kZVUUopasuBCdY4PwJUg=;
 b=GsbsrOMcw89sJvtQkEpoTahL7zjw7aQubORmPca+AUktz0mjsqVfdlbVpawEN/MWXH5UWeNpmt+uFoT3uSTVlx84khSQn390aH0N7kl/4S2xUbcq6f8RLt6h6vwNjCYTaDwKqkMlhghSA7u5DVWdAHCfVaIsFGr4/IEIGubl44uf4OAnelgoaK6TL6lS6Dx0e68HyNM9o0ro5kocVeIJ+bHwLj6VrHeNxXN6WhhZVj5untl0snyA2XxzLj5n7U9QbCqax7/V4Ejowr1esqmWWRg4DC6z4fnN8K0yt75uN4eaBhgkoVa5WLpNUkrA+Hm8547O7ZAWHxulXrLOyMqTuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74571cb4-55ef-e2ae-3645-aa827472ae25@suse.com>
Date: Thu, 31 Mar 2022 10:50:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] Livepatch: fix typos
Content-Language: en-US
To: Bjoern Doebel <doebel@amazon.de>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <032faef0d56d1de17b9dd229b33bd755c402b978.1647025870.git.doebel@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <032faef0d56d1de17b9dd229b33bd755c402b978.1647025870.git.doebel@amazon.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0080.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::15) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbd2e7c1-d9a2-47c4-5234-08da12f37d95
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3627:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB36270089A57428E24C8503F3B3E19@HE1PR0402MB3627.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XSdhG/DPskYz87t4k4uMhTpCp34aORgkg+iKt5KuwW+J/koPPTwQy7liZl4EPv9+pGMXt57Co11+D6UEYSdwLB/GZxLixeEJmO7mK5bVwCsciSSonrDR0Bz560HgIcSdqfDjmQXPrHhSSNoN9WWSsQn8jtQcME4GoIE86kqBUpsBwcGLtwHjTFpQOl2XGGOPm5PtG4HY9tWRnKp4x/KHniIy8EiSxKOtc+mj7yo0cwIIfWfA+LgDbS02cGA/vAFgXD9+8rCjWRJ5hRBlL4nl5iJzZ7f9XBPZ2Qb1nBAU2LbLN/SXTbKn4jVxEfFhtAFqAo7W3iSJYmJUyYTXUNtNujJwXZ7E5meqQRsT0EUasAjbRis4WULU/9mD542JCsqrVIy5lRnIUBSkXyFHBP/3BC5KJ/IwREPIoNywKs3apidlysXP8NcdwVYyatdl28Zm/rCd0EsrFB7IYbdNF0Sz4J6Kb2HRQwrUpnDbm4/z0m4WlV6qkEPYaHcPMBh1Zg/gnYqd6LDBbQXh09o8HNkquwCKAIvY82J3gAGrGhqv5YtipFh9XGE9RY8NWg8v5wgd30Rywqk1dPwlSf+xL86bBsHK5qf6o0/4XYS/Vv/4ozPwNuzyVyneaDlgtvDuCSdelstEweQbNWFn38+vnEfQzZcm7c4ybT05iV/jRHcTGwyIWBs78cRzYUkan1m9QJU76T62/W6b36kbkwE7uxsGQ2tBncxb6TGNRuEdE6wSQB8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4744005)(2906002)(6486002)(86362001)(31696002)(2616005)(8936002)(186003)(26005)(6666004)(508600001)(38100700002)(6512007)(53546011)(6506007)(4326008)(36756003)(66946007)(66476007)(8676002)(31686004)(316002)(5660300002)(54906003)(6916009)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0lCNUNpK3RYTVZFb3N1U25EVysxR3Q4L01taG9wN2QyaVlEeXo5OUh4TzZF?=
 =?utf-8?B?MkFWUHN4RnJmcG9NUGZGd3U5R2doeUZnUldySG5CeG1Na3lrZDlYSWIzUUtC?=
 =?utf-8?B?QUQveTluNElYSHB1TlJScWpQeDJsZHpveFF2WEpmMFM1cjhLTEhiUlNYSmZL?=
 =?utf-8?B?WXNTam4wWXZ2OXRveld6dnZxUGtQd2YzaFVkakNEQVAyWlhnSzBKY3R2V0Jn?=
 =?utf-8?B?YnNYVUIzQWF3RWlSUjRVZEJER2JvTytEWXVpbk9OVzZGNUs2S29vSXJjTGcw?=
 =?utf-8?B?V1lUSzFJNFRjb3pHQm00TG5VNlhtandpRy9LSDJJeEdaK2pNRWpxN3J2YjZV?=
 =?utf-8?B?V0JRd3pnSlNSV0x2OUdja3htNzM3U2gwOGZUMkFBdjFOTWN1cVBoVGhBQVFR?=
 =?utf-8?B?TSs1TFU2RW8xZkJ1MllJWFZMN0labVNPWFZ4YUNjSDRpUGpkVEg3OVZXQXh2?=
 =?utf-8?B?eHVIempZdGxwc3F6Zy9zN1gyZEd3ZGdFN0orVHFVWXJOZzRtMVZxN1B0RlFy?=
 =?utf-8?B?M3ovTXFSU3ZaTExzRkl5WmsxSXAvYURmQTdMNkdBdjk4dGVnalFIZFlOQUtU?=
 =?utf-8?B?RCtHM09URlhXS05TZDRGaXFtLzNMTU9PdE54UUtsOUhacnlGaUVMZFhCVkFH?=
 =?utf-8?B?dVQyWXZUeUhyM3UvM2dYSjJ3aWQ4cVBaUHdqQVREU3R6VHViYVhGZkpMUE9x?=
 =?utf-8?B?ZWkxeHczenhCdklHOW1IQXQzeDlqQURqZ0tUdFN6SlFRc0d6WlFzNnA3ZXEv?=
 =?utf-8?B?N0UvMm9ocEg3OTFWUHR1QkEyaVM4NncrazdzUzdPVndYcHlOVFQveEdGT1Nh?=
 =?utf-8?B?RVdrS1VtdTUxNFQrN2dZbU9kZHQxaGtwR3dvNnhEMy84dS9pbVpCd0IwMXFr?=
 =?utf-8?B?cDhPZFZWOTZLSTc1ZlZnYzNTSU0xTCtGclcrbmVnM3Zld01IL1JJS1hsdWlD?=
 =?utf-8?B?VzdXN1NiUWxlR0hXTVMydmJFeVJBRnE5aVNsS0t2cXQxdVBxRmlXVlpPWUtB?=
 =?utf-8?B?aFc4V1kxSmc2SDNJNEtlK0RZY1pRQXMzdGx4R2VZVmtKSXpGZ3NYalcyZmpa?=
 =?utf-8?B?YVBEUUN3TjNhMmh6UHdhb2tyekQyT3Q3b1R4aUVRcGJGMTNkTERKU09Jc3NY?=
 =?utf-8?B?VU1Jbnh5YWxWd3RaR2VZMy9DbzBYMFN1U0xSZTNYVTdRS2hEaEl1YlJ4WE56?=
 =?utf-8?B?Yk9PdDVGem1xMXpXZ1VtRmg2RncrU3d4OUFmUlZRVFhWTWdMU2FUbUQzaWtX?=
 =?utf-8?B?U2RSUUZtYmhTcjZiZlhvcVNLQ3hrK3dKa3R4dnBKMlJMaGRvUTVMempDWFZN?=
 =?utf-8?B?ZU9pelVoTVFkRGppMU1SY3VQTHlNaGVsTU1mZFlKc21ITm1GWXFKRWRHSVBp?=
 =?utf-8?B?Q25oMzIyZG1HZ3kycHhpYzVaTm9wMTJjWW5NRzNPZTYrcHBEYk1lYlA1SDZI?=
 =?utf-8?B?eE5wcTNhS2VpWktrR3dFU2cvd2x4NVZjc0ZCdGR3TmQ0Qm1yRkUxVlFxakdm?=
 =?utf-8?B?MnQ5d2xtYlVqc3BoZE13ME5zeElTL09Dd09KUDd1ZTFrSkhDeGM3YTVxZndQ?=
 =?utf-8?B?UjNVSzlaSEhVMzJPOUhHQXhFUkJSQUNBejE5VGF2QUNsWXNVaXJlV3JZRW9B?=
 =?utf-8?B?MVkxOTd2L2RZZ1VxLzdnNzlWWXNwSWxOODdHbVBEdlNUZ3lwN0FGRXJtdHIy?=
 =?utf-8?B?ZVdwdlhlWURhMFY3UWNVakExcXNTa3N3TW4zbHVxWksySVQwMnFVbEpDcUEy?=
 =?utf-8?B?cHRtOGxRU2lxUDlrdklEUUdRVkFHTWhTUlNDN1IyNjc2Yjk0bEFtektoWklp?=
 =?utf-8?B?djZiYzdhQVVmVHpwbVh3VEtTMGpONFUrUnhaWkZScFlyOW9NTEo1RytCeGha?=
 =?utf-8?B?UHJSYm5FZHhTR3BzQkFVTHpsSm5yVE5aQllicUxLdGlVWFk2emFHVmw0Kyt4?=
 =?utf-8?B?OTJvenBoSDRRUS9pUldkS2JYK0s3UmhvRGp1amhvYzR4YVNFbU80ZnpObjRo?=
 =?utf-8?B?YzJDcUJzRDZ4SGdDM2s2L0pOWEtOQVlHSW9IVGc4eEJFUS9WcExScTR3MDd0?=
 =?utf-8?B?L04xL0t4SFpEMllJMFl5bmoyNDdPTkhqTHpRa1pDamxsSXJJOW5wa1UzYXVs?=
 =?utf-8?B?c2F6MEVkZ3RvazhVNVJrTUJLUHkveUhEeGh0Zk45UDN4NzkvblB1cXpwTGsx?=
 =?utf-8?B?ZVVRM1RsNnhsYVVvTEw1MU56eGErYU9ndjljdUtkbERYeGROQzV5V1BFN3B4?=
 =?utf-8?B?UmVLTHYzMVo0QnhzYXpkMC96aXR2RkhhRG5ybldvMGwxeDVUclIyY1RLOVVF?=
 =?utf-8?B?SWVhUEF1R3R4UjNTWlQ4OVk1MkJGbTZjbncwRWZ6RHIxWEZFaThZUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd2e7c1-d9a2-47c4-5234-08da12f37d95
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 08:50:22.1980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7uAHkBXsbnIvmMyrPap+f2cDMQJRgWr2sF0lTCCMf55YyBDw+zpAYctDKNUBkCwgDIheJYuxM5svO2JlLPgU4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3627

On 11.03.2022 20:11, Bjoern Doebel wrote:
> Fix a couple of typos in livepatch code.
> 
> Signed-off-by: Bjoern Doebel <doebel@amazon.de>
> CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> CC: Ross Lagerwall <ross.lagerwall@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
and committed in spite of a lack of a maintainer ack.

Jan


