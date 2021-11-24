Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF845B7BE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 10:47:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230257.398066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mporw-0000l2-5S; Wed, 24 Nov 2021 09:47:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230257.398066; Wed, 24 Nov 2021 09:47:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mporw-0000iF-1j; Wed, 24 Nov 2021 09:47:12 +0000
Received: by outflank-mailman (input) for mailman id 230257;
 Wed, 24 Nov 2021 09:47:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mport-0000dL-Vg
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 09:47:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d955e63-4d0b-11ec-9787-a32c541c8605;
 Wed, 24 Nov 2021 10:47:09 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2053.outbound.protection.outlook.com [104.47.5.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-P16puqGqNMyQABqH8I9mcQ-1; Wed, 24 Nov 2021 10:47:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5743.eurprd04.prod.outlook.com (2603:10a6:803:e0::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 09:47:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 09:47:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0205.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 09:47:05 +0000
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
X-Inumbo-ID: 7d955e63-4d0b-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637747228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BSeWv28KQ1l5h5GXAKoI/OowuT0vgXcMOaA9rbcE51c=;
	b=Lf4NBHmTb+YD6fC8pnGT5pE5EFMQfAHIfOHxpfVQrASqkHui24wcbyjzONEkV1dfVB3M2z
	20DyOxNkHdlDxrf3Djb0htC5fvWMIVAbSLtG4h8FAbp55f6SBmmJen5VwRXL+8HI2rwK3Q
	hfFAE1o27EqhR/fMDFVrVGmcEZJ+HMI=
X-MC-Unique: P16puqGqNMyQABqH8I9mcQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BaY1SPXWHBcx6wqzN6I5tiknYLNfZceCGzYFtKoKuvmb1tcrMx9IQyxkvkZyQtb4RBfVxblPqI5ND2WLkgi2+72zYzA3LOkLzz0uu1IJTQ4V2Q79iHq06dr15RsxW/aYIDadmzjgOuGQc8DDX8DqaVNBYT44ujIGj8NCGJmkOjhnaAMO7Rf5vudZX4lyEbI4eNgtL2NDTfyHlt3CPAN/DkLgEuu7kryZ560Li99Yt9/BkVpBukIGjuND6uLujTfar13GtHN6d5LVEkucuu3av5fFOv41uSbbQqeNTFcSY3LKo5J/uWBAyof+RdafqgyakFT4Rlb4eEJ3lt2pLddefA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BSeWv28KQ1l5h5GXAKoI/OowuT0vgXcMOaA9rbcE51c=;
 b=InTvdIYWbGwhqFemsZIVa4qyDvV8ZiHBNIuuQ95oPQI6v4K7IcxUQfCx/0VINZgqstalvmuYbX3tYSb7eXNlIe+O37yrkXfAa5I572kLFeimoCLxcxumTP6b523dT25gGBQ4qvjz4KOqkcOtVSvL/jIgewvRWhTN8grAPq4mQSwKxhCgB/0ueUoF4RCPeakjV1HC8d/3L8KDd0QmAWYp646TCG8E2r2Iwr/DfxKGWeVReuuVXU5QyFjH7Bk0VAmqPAfUF2Ixu3z5S6ohyzxyqtGExEU+MOQ8muwyC+DKpQMHz3T1PjvCMEF9TXJafjHfMaH53yZZLpRscO+ofnq7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b454300f-9d63-bae3-c412-3b8d3f4db888@suse.com>
Date: Wed, 24 Nov 2021 10:47:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Ping: [PATCH 0/5] x86/mwait-idle: updates from Linux
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
In-Reply-To: <e16ff1ad-b1c5-f4e0-9336-716eceb93a9f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0205.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8492efc2-f0e8-450a-c975-08d9af2f5ff5
X-MS-TrafficTypeDiagnostic: VI1PR04MB5743:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB57439124C76952B55A212C00B3619@VI1PR04MB5743.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6rV6/vZkheznvwRx11P9Adjt3nrVA3ELOBiRSdgeXHE/TD6vZnIa2qCG3KnWKdUFdBK0e1bjC48zHNUStw5BpydmFUKtaxpEV1Ibu4wBUbbaUTiXcCQjxFvtjyJzajVvtQtGFpy+DIyfl3zpvLA1mKXanLDaQJF7suX1mhl94jdhg1toTXJwNxTIj2DqTK4lJ7T4G3DUZIPD7uaGB2kcFwJFYitF1CiqKsXGgh8+yLuawpWVnnxuIwYeohPAtZzwSm43Hh+zjpjyPCedvv/g1x80BiNLzBL29/9/hgkZqCtaCh31p4uRq3o3m7+wZ30brxll0M0wXs0rTc0WzBQDvhB9qGgMDiuSwZUxwBPZL7kFN4WAhJzNCvbJYv5fCldKO/3tdCLrhK2p8SNy7+V8npZg/HHpbkFjYNa07Qs3qRPBhtFYzz1qdHp2oKycUfZpl1ROr618YUpXvy3AXN7SzrxJoK5YXM8cUOWjQ9EqlK/Pa9p4tfyCGeJFUtIqyOuzy7C9u8m4ZFduEsTzJIptnFxdwsOQjqD+wctz5wa2tkDc66FJQbfJNmONCKTjT8wxOhAqdcedPikEilL/Gu/df5WzudQa8Dvkdl+0qrlaI8Vt+b/AD/ZhY2MUhQosM+w95zkUHVKfBImSC5w+8rAUAYtCik+HgjOnOhwW2GlvdH5+GPBLJz0b097bMKFaVzhoG1rtOINhKF/Vi9CrDfh6687hwzptd2WjTU7gPIyKhW4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(54906003)(316002)(15650500001)(110136005)(16576012)(66556008)(26005)(2616005)(66476007)(31696002)(186003)(38100700002)(4744005)(66946007)(956004)(2906002)(8936002)(5660300002)(31686004)(508600001)(83380400001)(6486002)(36756003)(86362001)(8676002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YytsdG9DZnhHQnhjbWJJc0xYcnlJWDVWOEV3UURFTXRvYnp3R0g2anV2OTBD?=
 =?utf-8?B?TTZRVnlZc09vY01ZWEtmdEI5V2lqeU0wMnpDaHhqZFNxVjBzbnVBQUNCaHhN?=
 =?utf-8?B?Uit4WVl2NlBvZk9JWHpieW00V0dBMTlkTWVEZW5BK1BVbWhBRHZJbktvM3pR?=
 =?utf-8?B?VFNBbm5qZDdwZXBuL0xFUjd4L3dEZVBJbzVQd1B4bGNnM01pMUFXU0dNM3B5?=
 =?utf-8?B?UmxFbytyNTE5bkNXMklGeW9rUkF2aG1iSHNTU1NmUm95U240WnpBalMvWVBI?=
 =?utf-8?B?Y2w1UnNhL3M4Smt0YzlUVkNDeWJxQWtob0Q4clpBaDFFMEhQdCtpOWJsMFJJ?=
 =?utf-8?B?VnZpK0VVZ2ZOOWxDVjI4NGxMTnpEanRHSUIrb0RuOEFxeURTZ0RKZTFzeGNx?=
 =?utf-8?B?MGFaQU5saHZOdkV5KzR0Yzh3eFc5OHV4dHpsM2IxSEJ5ZFIwY3lTUzBVSnpU?=
 =?utf-8?B?amxzMWgvSDRmL0plNFVsMVlhQThzK2RqZUdmWUxMdFAxZ2lSZWp1SUpNV29D?=
 =?utf-8?B?Zm9HbW5MVVFYRVhXS2xzTFh0aWoyUGpzQkhGczdDSCtjdk85TkpQQmdjVTh0?=
 =?utf-8?B?U0ZxQU5Ra0tZU012S24wd3QxcFZBRWN3YXprRnE3V1g2ZTZ0cHQrcjdNVUtJ?=
 =?utf-8?B?dVJrbkhZQ1FraGgwdDFKTERHUUZLQUdQZ0NmbG1KSTlQOUJVY2NFeXFkUU1J?=
 =?utf-8?B?N0JKTjI1MWNiV1BRVjRVRXNmb21BamZNdVRhWnFFV29lZUxaNHc1bEhVcHBu?=
 =?utf-8?B?MkhXMzMybm12UEs5Y1o1UGFnU0dZRzJyOHdBWFdUK0puaGJodTUwbkVVMUIx?=
 =?utf-8?B?UkhYMkl2UDJFSzg0bFRpWGM5T0FWbkpPWTFOR09UVElZeGQ3b2JuL3NWZENW?=
 =?utf-8?B?M3FNeER5b0xwajVOZFZ2OXZ3aUpnTDNWUUg2NUVlNUhlL0V1WEc1c3ltOFFo?=
 =?utf-8?B?dERVUDlZR3NDYXlLY2FIbkQwS25va3NEcmRoNEJPY3o0VGY3RmEyMkpzTUpF?=
 =?utf-8?B?YStxc2MvZm16MTRoNkxsMFlXWlJNYW04WDQ4WjhPT2FKMloxR0EvNUNqc1ZY?=
 =?utf-8?B?bzRFaUhSZ2ZnS2FXZzlmUXlaU0FrdGpjSEh1eXZjSG5oWHptbVhKczZJdXRo?=
 =?utf-8?B?Z2llUXREUGN6SnpMV21SalRsTStoOGdsVDZpUmk5MTRDQWI0aGl5UExTdE53?=
 =?utf-8?B?QTJ1U3RsYlFFbTdaT1lJWHJWOXlXZXBiNEdOZlRMWHFUNXl1THd0aDMvRWJl?=
 =?utf-8?B?cnJ1b3VSTGI4K3dTYmJBZW1kOHJ5M1IyQ0N5WTJsaERvdUN4MDVYNzN5ek1z?=
 =?utf-8?B?eXllTUF2bUl0bEdBRk95MXRKL04yeWpqZTRQTWpzKzZmQWh6WUxNN2pKMyta?=
 =?utf-8?B?aEZMa0JKZE9KSS9pa01NalgveXI5cm9seVF5TklIVFpOR2FDa3FNMy9xZ2w4?=
 =?utf-8?B?OTByK2x2M0RyNWZ3OVNhKzExUXMxSGNienBRV1R3M3NoZDdYUXZia2lTaHBV?=
 =?utf-8?B?SGowcHlWMDdtKzNwZXJnRFE3ZzJjNDdKbXZMeU1QcVNXeXpCbjZ2UkV6SWdy?=
 =?utf-8?B?RWxJcjNYV0J6bUdjVDFLQTJ5SE01eHFROFNCZ2NFMEUvZ1VmL280aTRHOXNn?=
 =?utf-8?B?NEl6Qk8xdG0vYU1mSjM1ZmorYVZZeWQzcnFhVEJDUkh4MHZscFpnYjdjSkQ0?=
 =?utf-8?B?RExQOTBKM3pFWDZ2Q2trdU1qMXJDbWk1UG00U21kaXExQU0zdGl1U1gzcDhi?=
 =?utf-8?B?VWc4NG9Cd2ZUdm1HSUNQSmlOdEZGb08xdWVwV0htS2FSbG1WV0lqeVRaVFNF?=
 =?utf-8?B?WEkwNkJOamhFS0V0YzNGS2VGUDAvaXV2dU1Nb3lobm53RGxWTVdUS0Q5WGIz?=
 =?utf-8?B?eUVNaVlmRG9UU0oxM0R0clFXNGlqZVJQa2dXZkhoN21VQjNVMnpkeGlYTTlu?=
 =?utf-8?B?Z25iU0kvN0xCWmZrNVpwZ2dPNTc4ZXIxcVcrZFBNSForR05jdU9PbklkS0JI?=
 =?utf-8?B?RDNvVTVNU2V0c2ZzQUpRR2ptaGlXVitJM014SVBUZDY0YnhocUR5SDVCT0c2?=
 =?utf-8?B?K2xiOCtZTnpwbUNTM0RIWFBheldIQTBmWWZFVE9ZUGg1cjJKWWNCS1FycVJV?=
 =?utf-8?B?RnZ6YUdhUUxwREdHMVMrdm9BdDNkSUJyUGZ6Rzd2Z0tYS1pPV0VGWVVMOWxF?=
 =?utf-8?Q?wZ4RdArjVOslmXHHOJFUixA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8492efc2-f0e8-450a-c975-08d9af2f5ff5
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 09:47:05.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfxdel1qPp4tKpzoJ9lI5A/8l5KQRQ32U4jb4CEmw1GO3nvcKTpMdokDqeI6MrXO5xiEtitX5GzP9+sGduIBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5743

On 06.09.2021 14:58, Jan Beulich wrote:
> Before the code freeze I thought I'd check the original driver again,
> and indeed there were a few changes we want to inherit.
> 
> 1: mention assumption that WBINVD is not needed
> 2: add SnowRidge C-state table
> 3: update ICX C6 data
> 4: add Icelake-D support
> 5: adjust the SKX C6 parameters if PC6 is disabled

Ping?

Thanks, Jan


