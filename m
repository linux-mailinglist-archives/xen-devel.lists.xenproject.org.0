Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D146849B0BA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 10:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260022.448958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCISG-0001es-B7; Tue, 25 Jan 2022 09:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260022.448958; Tue, 25 Jan 2022 09:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCISG-0001cU-87; Tue, 25 Jan 2022 09:49:36 +0000
Received: by outflank-mailman (input) for mailman id 260022;
 Tue, 25 Jan 2022 09:49:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=81on=SJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nCISE-0001cO-Ie
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 09:49:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18e3d6c8-7dc4-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 10:49:33 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-ON3M-e_IOsuYPNk8eZrxRA-1; Tue, 25 Jan 2022 10:49:31 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB4724.eurprd04.prod.outlook.com (2603:10a6:208:c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.19; Tue, 25 Jan
 2022 09:49:29 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::353c:89ba:2675:f607%4]) with mapi id 15.20.4909.019; Tue, 25 Jan 2022
 09:49:29 +0000
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
X-Inumbo-ID: 18e3d6c8-7dc4-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643104172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QurmTp/BK5M5HtslKHeLN4tmyjSdaBdsVwT2JMCh/wk=;
	b=XfWQRnRDEcyu+ywTr5zWijKdg+0KCfhgy2671jnpIakuEWdJfRLx7ei9PLJg/qifnPmXnR
	LSZrv1Cf4aBdDDWQpWNjMmzfNAMJCSq+m7jzrvxKoD51oeAg8LNuj3LqQMOeQzuqc9Gk3m
	onkmERfsJayGUQPxMGmioIEIEfFVv9c=
X-MC-Unique: ON3M-e_IOsuYPNk8eZrxRA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WyRXv18zT4xAosJKcKvEWAq8igSUtT553I+U3XfgtF6O3a8gWYLAnLUAGhlpXN9bj+w+7+sYUy6BDmYcXIP2eyOaGOlHFz/T4/HUx9O4QboxGTW4DCYShfWX0iP4mVyx2M0a6KzLxqPm02FJdWW2MvP33xbZcG81eOLY6RvELnP0Iwn5UUrWCi3ukH/MqeB+RkL7AA0lXIAviYI8PmMp3x/Ixmlicu98PlQ0aKJhKbcrN7w+GM95eObdpU8T8ys6Ys3iW+ePmA9aBwfXB2J4zlw5zdoua2lvrW1bSkTeCUlJk6+x3KYTl/VE7b/TqjM8s7KTNBGVwj311401i5wAUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QurmTp/BK5M5HtslKHeLN4tmyjSdaBdsVwT2JMCh/wk=;
 b=E27dhtiKYPHjybVe528L/AFuvA3zGkiSMfGYtrSYKPGtCF9BJdADvM5ZFQF+artG0TLK2VX625B+t6x5ef7hNfrpOLVZ41OZ+FzJbmFMLexWPs3rnNefs0iX1GKn6CTPN3DqbTxpwR9lg+MITUln2LoQfNV+EOvt85IQwkehbKSt1QUiNo7/8Rx5V6hP7mhro2/weIs2PfQR7shS4C4qHnntTcVumdbNaaL6yB0OFyf+jS5vM3zR242hBBcG57ywng1EaZUkiDvuA5VuMBvazv+kk2Jx/aowCRpKOSBLM2AusnYVv9o+FkZD5PmWr5xUcJhe9VohW20/twYeesHhjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8df7606b-bf0d-bc6e-5393-09d187539e26@suse.com>
Date: Tue, 25 Jan 2022 10:49:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 13/37] xen/x86: decouple processor_nodes_parsed from acpi
 numa functions
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Bertrand.Marquis@arm.com, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, julien@xen.org
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-14-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20210923120236.3692135-14-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0046.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::23) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e51ad98a-d302-44b2-c8a9-08d9dfe7fb44
X-MS-TrafficTypeDiagnostic: AM0PR04MB4724:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB47248C2616FF58D70FBDABA3B35F9@AM0PR04MB4724.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M+pxNDY6f4PlYV4sQZrk5bnT/jyTA/WiZQr6sFnrr5CqPd3DsDiz9FI5PUILwAVIDOlQM8zjhKEG0qDGKDCbQFBD2GKA06LJjs6LPOfGN+Kpl2YIlh6wWgssIMOiH76pnmUTMnWzCJlpTOMD1WfvmzejiuorShlel3v3DqUdCxHbXWLo19kTRJC2+MoD7BEHnaPTmw0GR1jfC9jYfjt2TDjBRcSDxcikCUSiO3DJ1L9I0/xxAVrDOaATR2UotFGfUyCf7GlUKoNmofJVp4tFJX6YpYM/9OMiL60DStLA+M8ov1Ml4A407qKuWuaA01WR+5jAZVE3oZGS6CBhAvWdmOtHg4cDWYvkm0Iu21Z5yoKEvZiI/oV0JvwLy+bi+K62kBXztaDGQCEq58I6nWUy7vNmigZmHmaxDTsH9gz6dVhQh6WZc+zeIcWvBXlv7v1qOcf55antxFDdDtZ65JUcx8yICUNOKvnzLF852sKiYyuQsQuKhFHNlzIScRG/QZoqbBuItXOW7GKSwAeRdMPCGTc6Idxmp0ZYssg7I2a/WnM4mplgEDjAMz2mVepmAeyIgZkIw6KqxHadFsyWBuRciA4eJDdujO/xmtQFvDoBAK1EUKfHQ8hJ0cZvP6h2nnmJ7i8NcG5NpJlLIHQ7qeNrpdP3KRCsDmt4j7SVotWVk9vqUFAFaGN+qJGShzfviWa6vfxJ/F0wWt17Wpxhq3CNEt1TYa3UTQCt51xk4rwX3PrO8NwEkrltqnieOBqofXWU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(53546011)(66946007)(2906002)(66476007)(4326008)(4744005)(8936002)(6506007)(26005)(6486002)(66556008)(8676002)(5660300002)(6512007)(31686004)(86362001)(186003)(38100700002)(316002)(2616005)(83380400001)(36756003)(6916009)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjhNSmxJc240ZlFnRGZMSnlaakI4Y0U4WjZXOHVBSDhaVnVhYkRPNmNsMmE2?=
 =?utf-8?B?VVJ6UCtZdkVjVjhPOUFlWEtrVTg5eTZxbDNKdjZnYWQ5WEozcW5NNkxDRWt4?=
 =?utf-8?B?K1ZNcHJuc1F6Q2pwcGhvbFRNTGNDeWlkT2hjRDVZWFZtQmpXUE9DSjNzd05N?=
 =?utf-8?B?MEJ5T01qS0I3bjBLbHJ4WkI4VUsrN0VXeFR4T0p1ZFpOdlRJdlNneXZHUlBE?=
 =?utf-8?B?ajM4Ny9BYSt2K0NGU2sxbjUvQlZaQXdDbm1pN0ZHRlkxQ3VwakJ6MW9sZTVl?=
 =?utf-8?B?b1liU2hXK3FvUXVTMDRmTndVY1gxZWJBeE9FVWpNSlVJMXF0MVR6bkdmR05x?=
 =?utf-8?B?UFNWbXYxeVhOeFlhL3htZkhORW9HRnVTSWNXblBFNFN4cHNHMFkyRDBoeGRv?=
 =?utf-8?B?Zy9hL2xlRXF2QWtUSFV5dXRPckRKUFhGSytNcGN6c3g3OW1sVXoxMWttN1NG?=
 =?utf-8?B?dVFpeVJxaU9PM0VzTnV4Si9EcGV0alF6QUV1dnlQK3pENmJBMnpMa1V1UTJ1?=
 =?utf-8?B?aWJaTGUyUGF6MVUxMTlTVmZYZyswSWhqZUgzQ05PeVZlNGlLZ050M2Uvdk1u?=
 =?utf-8?B?SWdhWVZ1eDRHU0UwaUt6NnI2RGgyNFVoZSsxVjE3QlF2RnJvcU9ZelI1R2p1?=
 =?utf-8?B?WnRqN3JJYjZMT1VrOGJVcUowKzJoWnBRL09EZUN6cFgzRlNITkZQVy9xMlRq?=
 =?utf-8?B?UFFMWm9nRkdGV3pqRGE5SERiajhUOUhkZy9mV2ZJRFNOOHRBRnR3RWhhU1RN?=
 =?utf-8?B?MjF6Z1FScXJkUTlDZm5jOVJtZE0wR29wNXFXOVQ3U3JwaW05RVJGcng4L3py?=
 =?utf-8?B?K2FyUXRSQnpxOEhXQXNMc2NJZE5SWnFjSWlpTmF4STRCcG5iNnoxVkVyQ0ZC?=
 =?utf-8?B?TTR5VCtmZkp5TXpsWlg2ZmRUM3dHNmxvOE0rZ1dRY3lGMXdUcnhtZzRhNU84?=
 =?utf-8?B?bENraDdzQ0l3ZHJROWs5SUtCSE1vNzJuZ1F2WEdFZUxHSE9BcEl6dVl5UGJv?=
 =?utf-8?B?ek03eUJPTk94MkE2V2lWZ1VDcE9IUVNBMCtBZjRNU1JtUUFEQjA0RklLejRL?=
 =?utf-8?B?OUZaRWJaazhadkd2RTlrZnl5dzBmeE1wWnJicG1COUxDYk1tbHBUUjBJUktW?=
 =?utf-8?B?QzM0cDV4YlBudHFqZUk5VXhmOWQySUFiMytMclNVZ3dWcnRPdHVRMW1qOVh1?=
 =?utf-8?B?WitTV0NmbmdUb1EwZGlNTFdiY0pJQzNnVUxpWnlDUkZIczFDcnhXRnJMNjVj?=
 =?utf-8?B?Zy9LYk5WdktiYU11SWg5N3FFeDZVZkxNS1J5SUx2ZlFEand6Y2Y1anlxTTlG?=
 =?utf-8?B?SWRqbHNWa1lXUWN2b0cyQWZoKzVNT2tlWm9TbVc0SVM5UWd0Z3huVmJWUVFm?=
 =?utf-8?B?dWovc3daM1p6Tk9GUGVaMmNLQ2hxanhRS3FQSGZxUzZXenBjMlZrdW82S0lV?=
 =?utf-8?B?WkcyTWY3eVZDV3ZyYS9wR3hPRjNPR1d3MXZhNStZQUorUnBRaUM4ZkJwUFVr?=
 =?utf-8?B?aDZvTnJiVW1BYVFHK29pMXdsVnI3Nyt3bTUvdW9sZ0hyOUh1K255ZjlSdW8r?=
 =?utf-8?B?Qm9xZGR0Ky9DS2wza2oxK0F6MUlsYVVHN01XMnN2cnhXYzByM3piUnUzOHI1?=
 =?utf-8?B?aENRd1lqTlZ4RlYyb0pFWjBybnNLMFpuck1SbmVNbFdQVkl2QkxSdzdXRUdM?=
 =?utf-8?B?N09kblQ1WTdONnBQK2ZKMmgyUzJKM3BaRS9jaDJLWFJMSzRLZTduK2lMYXlL?=
 =?utf-8?B?UmVwd3lZSVlMelJOVjBKOGgzZnYwZjRjQ01KOEI4NGJpbWdQYmNWc2NXM2JT?=
 =?utf-8?B?RHR5YkxtUTZqT0Z3WXZBR2lEL01iQUxPcTZSWlJtVVJiemxBSFV1RVljRVcy?=
 =?utf-8?B?a2xUcEthN1JJMnV5Q2s4VDNsSUZqTXZZZ0gxQ05jWjIxcTVLRHZYazdBQjAw?=
 =?utf-8?B?VE5xNS9ENURQT3UxOEtWK1lpT29ldFJpNWZCWlN2ckQvTE5nV3FUS2MxU0pO?=
 =?utf-8?B?RzhTN2N2V1FzYUJsOW9PV0wrRGlub1lKTFgvN1lYanpJR2VuSFVtOUViM1Bm?=
 =?utf-8?B?d2Q5TG5kNEpGblZBQ2JjWFMvS250RVNxR1hVS2MwejhMUVdCYi9HaW1OMDUr?=
 =?utf-8?B?eG9NWlN6MG9Lc1c2U1ltUjViRXFBOG40OWx4bVJrYzByWEowbFgrSVZ2b3pn?=
 =?utf-8?Q?7Ug1QMV/TZ+3YcOZZsrxOZs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e51ad98a-d302-44b2-c8a9-08d9dfe7fb44
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 09:49:29.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nteIr82leJGYxbgeKMzivqSMOLf77jMYmhnSoo+Xo87uhQc8YwkzvpCstHMVYrfxsX9tDBBXzXOEX0lHV5t4xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4724

On 23.09.2021 14:02, Wei Chen wrote:
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -104,6 +104,11 @@ nodeid_t setup_node(unsigned pxm)
>  	return node;
>  }
>  
> +void  __init numa_set_processor_nodes_parsed(nodeid_t node)

Besides (nit) the stray blank here, earlier comments apply. The way you
do the rearrangement it is close to impossible to see the actual "why"
behind the changes. Even if it would make for a bigger patch, I think
you want to collapse patches and move things out of srat.c code while
you split out generically usable functionality. Or, if the result was
deemed to large a patch to have all in one go, make the movement of
individual static variables the topic of each patch, introducing
accessor functions like the one here.

Jan


