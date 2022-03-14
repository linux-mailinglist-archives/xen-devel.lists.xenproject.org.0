Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B094D86F4
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 15:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290262.492224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTlhy-0005rm-KC; Mon, 14 Mar 2022 14:30:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290262.492224; Mon, 14 Mar 2022 14:30:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTlhy-0005nm-GU; Mon, 14 Mar 2022 14:30:02 +0000
Received: by outflank-mailman (input) for mailman id 290262;
 Mon, 14 Mar 2022 14:30:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=29fN=TZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nTlhx-0005gD-DC
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 14:30:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ab9be30-a3a3-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 15:30:00 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-hDASDS4bMwSrnRMU3r5jFg-1; Mon, 14 Mar 2022 15:29:58 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3891.eurprd04.prod.outlook.com (2603:10a6:208:f::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.28; Mon, 14 Mar
 2022 14:29:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Mon, 14 Mar 2022
 14:29:57 +0000
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
X-Inumbo-ID: 3ab9be30-a3a3-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647268200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tYHR7PcaYqY7VjWLjnvS5cXYPgv6I6R4EJ2G8G7mzGg=;
	b=WZAncF29+vW+6SIWs+Uzqtx3Xstq1k4Iw2nEttBECwECEVZuDopnUaBfWTsbGHU0tJAtZ4
	e/kRFyK/9WNxyiAqVxmkdaC5c/36Ln7rwjKaLKEhFpb23nRmM72xHQzOT8y5GH5DGXcr6E
	MiSP6BmkepCFNSItQP9rRJ5/0jIp6t0=
X-MC-Unique: hDASDS4bMwSrnRMU3r5jFg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RxLqbWcqkxA++sRHmIiJVvRAfayi2sqeshw6hKBNqRfxtiQllqupUczWiUIUtd5yNFIdwtwsj6nUoMKiQlvH+o7SiphK3idzSsbB8KUEgD6BlLWONxNQnY9LceM/B0adrhIy37/2XJUBoeGpB8YRPeug5Ml9kJlmOgsJOLurU5kb8A58GNwqrV0fNFjWNNlTDEMeZs5+QAvHnI0I3B1sZICTcEBS6ZS6t8kajsXdqk1p2QBIRexRwbbOqjzWnvw4Bsh3r+zM1FqecA1AzH8AaajLxxBxYQ7osd/397HcL/7FAp8qGueMarPMY86exRTfnDqR4I+Y+cKZaOBP3J6wEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYHR7PcaYqY7VjWLjnvS5cXYPgv6I6R4EJ2G8G7mzGg=;
 b=L7ai+ao8muujJCaqc4quA/ufRepYQGfWD8GyQjVvsIi/jR4mJUBpkhYOuJZXX/Q+zg2bsqrGnOYJtR/6HEkc3mPU4c2OGSQoQlxHal1UfF3gimZzspf1tsEE34yJ3QK01SjTInoES7eV7j9TEkQe9vhKux7n6J5lU5Zy+GCH+OtlIDddAihp9Vm5iAmB5HlYObCf+H5KCBqugg0ohg4BOZC9x3ZGWfvFTUvDE8iQJ6QnBxvGtnq4qnkukw4RnRhmvLtpzf3k0LAfz+YVCOVMVkh+x/bKFIwV8ks3YpNxj2Cg/Us/PXdx6f1rrJNzJ/91H9grmITZouD4JETJOEVTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb3316ac-0ab7-5cd8-85b6-164ffc78e725@suse.com>
Date: Mon, 14 Mar 2022 15:29:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86/cet: Clear IST supervisor token busy bits on S3
 resume
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220314110034.28498-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220314110034.28498-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR05CA0023.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56f67a7b-0718-469d-121d-08da05c71ce9
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3891:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3891A5561FC1984E5AE522B6B30F9@AM0PR0402MB3891.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ElbvfcBwyBxVaj6U+m6K/L2q2/Gs/x5oplB6sYsQBDb/LjzIuORrMBTB8UF7MV5hx3UCPGUlxjUBekB7Pdnd3TCslll6WtIdyQIjH4XbKQO3q6cJ13Cy0wBc8GZdQVSUqrSgA1kfdnTY9HynTiwBNW0BxOIxx1HOyBvIljQHIIEB84IAl09w6lVIdzUkyD4x0qxJ1Mjc9Gt5RYyddAs9yTcWAJ3d8vcwOJUdQGk0ZknpTJYVRaktaJM2BOipmKmQ6SYCncUt7twi6rDSdXojZK1opa5CNOVtYtYKxrMrLyjB8n4r0Qsvv/35v7iS2KBDviu/k2Y85l0OHYmuzBxF1HDrP7zuUix21snczdaG4+yi4hKgj4Hp4WuqMWSKWSotmTwO/llZ32E5si3B26pdcKkZUwCZp0bDEMI24TMsw1ZfyNoN+B5e82bmLJ4o13M7MsDhIYwc85oR6Y6hqzr3fJX/u7NbsPO3d22yt3MkjH+JOWPCD8YvJzy6onNb3Ll4FBVNQR5OoK/Efpw0rZxnVQasKmsI14qdeooB2O/lYXhX5V9cp3P0nITFhDOet4uK4j8jo4LpNHgA4NXNASGWvV33X2Ccj/SmvuzUcAI+W4gGW4lxeT2b0usXXFNwNEVNFcohYTJDijm//QD0MVq0dhZyD5T7Q5g4SII4UPeTIQUJ821i8aRWzGIQOIQLk0jJtVPIh3Ombg0NZMnDXbs4mKUHCGvEfm59HmXCvs7bjz6JP3CdTnoD//y6Rf3+6YVi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(6916009)(54906003)(6512007)(316002)(6506007)(53546011)(38100700002)(8676002)(31696002)(6486002)(66556008)(66476007)(66946007)(508600001)(86362001)(31686004)(5660300002)(4744005)(8936002)(36756003)(83380400001)(26005)(2906002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2xrV0paelE2R1JmL1cxa21TNXBGR0RWUHN2aHJWNWUrNTQwSHhoUHJoZmxN?=
 =?utf-8?B?UHd0UjZHTkU1eW5raVF3bkZyeklQZHAyV2RSQ1ZyZ1VxRys5ODBBL2NHS2Fl?=
 =?utf-8?B?R2cvRDdGRklVNUd1U2lNSWJsa1didEtCb2pXSldIcDJ2dzMrUGV1aktEa25k?=
 =?utf-8?B?cFVvaWwrL0NxdmFiYnZjVnhyWUxCNTNZbjJxVVV6aGRtSWw2b1NxaVk0YUox?=
 =?utf-8?B?UGlHZndIRVl2NGJucDltVG9yTC9ZcUlISEswNld1Z3hQYmNwQVFtbnd5TzAz?=
 =?utf-8?B?M0xXQlBMbW9Tb2FPcERJSkNDZ240eEQ0TStDNm9nK3FvZCtTTjBNUE1ZQktV?=
 =?utf-8?B?VCtXZG9xamROUlBaNyt1a0RueDk4NFo0Um1zMVArRjl4eHh4N2ZteVNkN2FJ?=
 =?utf-8?B?L2hTRVZtOTFsNm1RZHhiMDNoRUR2M0hkZ2JqbGwxbGV0bWNuQldzb0I5SWdW?=
 =?utf-8?B?cXpIVXNGM2kzK2RNc3p1V3ZJMUVDUmkxVFFJQU1XYkw0ZE43VHZtaHJKOFZ1?=
 =?utf-8?B?d3plditpQy9SUFdEQ3A0WkE1VGlhZHlGSGNQaXZ3MnloZE9uK003NjJRSk1o?=
 =?utf-8?B?SEJ0dS9EYXdaU1dkdnE5VGFZNWs5elp2RTVLQ25iQWY2WWNRMjB2Y0kyMXMv?=
 =?utf-8?B?RkFoZnl4WXhXV25jSmpYU3l1L0dNL2RaRm9nb1dtUUVXcGxPb2xYWVdZZmlV?=
 =?utf-8?B?TXhUV2hiQjBxYXdqYmQwZlN0YmtqR2NWZmRTdmVrbHY3VXNPZTVQQlErUEQr?=
 =?utf-8?B?c3N4Ukk1b0VOZEk5RlpCcHBVRSt2R1pBZmJlQ2NqRWNXYkYrQmk5K3BhVEpY?=
 =?utf-8?B?dmZqZXMzcGxpdE9DdmlVUFZndTUxdm0zMTNwcDZvM3ZsVE15V054Wm1scklK?=
 =?utf-8?B?RGJYNjZ0ajFVZWdsQmpwMk1vZW54RFRkN3hPSG9NU0dSbW5taTQ5K285bC9B?=
 =?utf-8?B?blgvMk11OWUzQS9za3V3OEQ5dnFqc3NmQ0lwRVhpWDgvRU9oRmJKVXFjcW5u?=
 =?utf-8?B?dUc4RkUzckxSUmZHZ3pOREFBcTZSSStsMzNmNmhXREIyU1d3emJjTUxscWt5?=
 =?utf-8?B?VE9YS1dxQUJuWlVsN2Q2OE13ZStFYllHalBvMkRiN3FaRzJyU1U2SU52RS9S?=
 =?utf-8?B?M3ZEY0lvUGxLVExJQ2JVb3JsL0N6V3haZFp3QVQvTkdEWFA4U3FZaDFUR244?=
 =?utf-8?B?SFlkRk1UQWpMRVVEVHdxaTBrRTd4NTVBYW0raTVwRFIwREVRTTdzQnF3bWJ4?=
 =?utf-8?B?VVVFT3MrNzBnQWpPNXRJZTQ3Yk44YjduR3FqT1MzL2xqWTM0Zy9hckRUSEdQ?=
 =?utf-8?B?SytqLzdwdG42S29KT2c2Q3o0UlNhcysxbjRXVWsyclhMdk1LclorRGp0TFpz?=
 =?utf-8?B?RDNWWnNEMUhtUlRrVnBOOEpnVGNKb2xPOHd2MHUvUmFVYjRwSnowT3daWjlG?=
 =?utf-8?B?SUtieFh2Zkd5REM5cHF4YjNreWlla0I4ZllpQmVteittbzd3TDBxeUxrRjda?=
 =?utf-8?B?WDBNRHVwdVdpWFgrRlBNaDI4UysycVNKM2JxamREdW5sL2lEMTJkRFJGa3Zt?=
 =?utf-8?B?Q0VBaWtZN0hNd2J5SmN6L0YrR2pWTTdkZ0U4T3N4N3VTUTdnOXlLWElvVUR6?=
 =?utf-8?B?dUNGVjZTTndMRmJkRVdqd0F6NnVjWWMya1ZYV1F2S2swSVF5UnB0UGxFM29E?=
 =?utf-8?B?V1BwSzQyMTMvZ0laZE1OTm9XVmoyWWxPUjZMOTFWT29Gd21OYnJndnU2cEVM?=
 =?utf-8?B?NDhxZ1k1N0xqa2FabDduVWh1VkhWcC95dXlqZmxUVlU3WUlnS04wSWFBdVo3?=
 =?utf-8?B?ejFXRWZpWEQ2UXZpWmNUaTRwNVZPMnJ5RHFBUk82ZjVaVGJESXp6aVZTWmEr?=
 =?utf-8?B?bjFKcjBYd1FjUXR2ZDZxdXFJalg2UmR5RnlsYURodWFnQnBVZVlyTUQvVGdZ?=
 =?utf-8?Q?Ajii03yzj6cQSb3TckK+8FE8B3KkejNA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f67a7b-0718-469d-121d-08da05c71ce9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2022 14:29:56.9888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jxAkzQZL0fg98lwN7Hvork5XSZ97Wne+RVMKtJK8T+j53ZrSrxGYnUXwZEGxZi1SMazc0VQaYxqFV5qFVQqIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3891

On 14.03.2022 12:00, Andrew Cooper wrote:
> Stacks are not freed across S3.  Execution just stops, leaving supervisor
> token busy bits active.  Fixing this for the primary shadow stack was done
> previously, but there is a (rare) risk that an IST token is left busy too.
> This will manifest as #DF next time the IST vector gets used.

Thinking about it some more - wouldn't it be more natural to turn off
CET as CPUs are being brought down (and for the BSP as late as possible
before actually invoking S3)? That way no new busy bits can be written
anymore.

Jan


