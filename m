Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BCA50A058
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 15:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310122.526778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWW3-00089S-5b; Thu, 21 Apr 2022 13:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310122.526778; Thu, 21 Apr 2022 13:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhWW3-00087Z-1Y; Thu, 21 Apr 2022 13:06:35 +0000
Received: by outflank-mailman (input) for mailman id 310122;
 Thu, 21 Apr 2022 13:06:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhWW1-00085i-DJ
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 13:06:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd6b8d35-c173-11ec-8fc2-03012f2f19d4;
 Thu, 21 Apr 2022 15:06:32 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-32-5bx8AzauO_eP1lO0rQkAFQ-2; Thu, 21 Apr 2022 15:06:30 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VI1PR0402MB3389.eurprd04.prod.outlook.com (2603:10a6:803:b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:06:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:06:28 +0000
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
X-Inumbo-ID: dd6b8d35-c173-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650546392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tepNA3z5icaKcddPsneOrUEpl8pzhfueXNqcqLddl+k=;
	b=X1O9w77Jd65k51Qcoy7hIwZMwfjy0HysqPg+S4T1qsj9Km9F4+wKMeeJhER5RW7q+a7sOD
	Z0eQmiNRyNcSMbBLXrH8/hr1PvmJq4NwLDHZlXHfQyDxrUGLdvOVb5ISAdhGrKQuKaVt8S
	epoCy+wBnFQnF94SSv3CE7/zR803SlA=
X-MC-Unique: 5bx8AzauO_eP1lO0rQkAFQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFFkGIwjWLefrBmOqaF4fvC3XrWWJisSKepofYaqWCBXXnDk929EKg4Ks2IvWyG9Em4zrBVT/1q3csRc0sVJUG/cteRt82rLkKdNao2/p7iiBAmSmA+RJxXUOEoavubiT7PY/jALKy/xQzfrpbh1J3hnZKko2zLhih+vIjLgE5zV08VyGoFr995RGRmfryonrWz67yJqVDxoGJG1iiCn5jW/gqwF58z6dVe1WGC8cWK1e9vBOmdyL1vTeP0xWWBti4GLbIxlRFEOO3xDWOF7fCivGvt2YPXkxqkugrwMQDqpMyRElhTuRzFecaFlpxL9V8J+IsYXKRhvzCBfYtc6iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tepNA3z5icaKcddPsneOrUEpl8pzhfueXNqcqLddl+k=;
 b=W1bzwVT6/V0iv0lnop5ko7MtH+JXsoWxMoJXdqkmnNSxiAUiiSUsaa+ceIJ1ugARnjtcdGdTYiWH2pHz/W3vlvNTP00ZpzAMGvZw2IBNfC6dmrIiqjb9Jt08kx9tFZO8lfsay2IqSmAVmDtkSRGzClZt2qwCwcUnlkrXuxZxRZxmNyc5XTnCykZNVeBpiexQ88vPeO5QXZUp0QKgJ6ylfE12o3hJNN4zneoAqE+S9L2JelpvfbqQt9LZlmJXT734PlMxvlQK6iAeDWme7lNOpc9TQx/eioyjb+XlB4iNtZ/COK+kSz/uongeMOiBZbvhVF5BIDmlhMBGyazc6NhWxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bb1961c1-af89-0220-6328-aa8cb98a1d84@suse.com>
Date: Thu, 21 Apr 2022 15:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 2/6] x86/gdbsx: Rename debug.c to gdbsx.c
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bobby Eshleman <bobby.eshleman@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220420141307.24153-1-andrew.cooper3@citrix.com>
 <20220420141307.24153-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220420141307.24153-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::32) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05f8d24f-f0bd-41dd-b090-08da2397bf5c
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3389:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB338957F2F8D87851B059EEACB3F49@VI1PR0402MB3389.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	se7dHIYLkp/D3KM8w7+a7uo1UjAw+h/sCjY5Oi4HdKSGj/I7ScwuPWfVZ2WtH8sRgSq7WE3c2RbRT3+C/7KwRl8tjrJUupYJFoEB9IId7EX8OfWAs65tcxUe9zbTKPKk3Wl7JLjmZLNjM+vG3l7WF8unfI2y/rF5pSrlPma53XmqHbBxssQAiyS0Q1/acpSV/HAxr841QCelxplTSpNHq7+Xhs94O70f0d/L4/XCxfD3M7gDEZ7P+dku6DPVmM9ONaQZuAdewaiUNf/NszTS30RHdxNgfP3aqOr6Itn6vXUZGHQYJDKU3TaMlZ3btGaw4KF9Qh13r8G1Mg+d2xmVkim7C6//3VwenwRqBMSoNnBj1c/5vjZykihUJdEWMleq5j6utj5P58sGwBSpTMwdHwMK6XM16EViaC1M8P1HYU+GX1jsFVvnVKI8kfal+mmwRO8Ob8fpfgSfQ6udDY2bOXfQUyGWp0S5EqMfh0PO2i8JxTpWwe8MEuvbU/xXFyBklgtWM2q9FTeKRaCvevppT/G7mSR+Rsv9ztsovu3sBYiWG4H++KlIGkQ+5rGMShXNONYCkopmBZOGk1BatqAgvg+41osBh/9FsR968I8hTXFR2D+JFcNkAMVn68mx7Zap56rpaIkaJuX9mr58UaxZEsa/PC/v+hWmktcbhojXoH1zlWFBH8RMCKh3HTILS54LSpgA6tvtOaweb5Uo2qkU1I52zrXyF4DwnZRdpVB1Ea3eHJvk2UZj0Esos7TimvuT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31696002)(86362001)(6512007)(26005)(6916009)(53546011)(54906003)(316002)(6506007)(508600001)(6486002)(38100700002)(186003)(66946007)(66556008)(66476007)(36756003)(2906002)(4744005)(31686004)(5660300002)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnJRSU4rQndJakJiM0dxUWdMQWcvU3RNRWhXZndDdHlObThWazh6MVNkeDlN?=
 =?utf-8?B?RU1uWFpwQ3VWTVQrZmJoNTE2Q3M4aDJGWC9GNGsyVC9tc282UVR5MVNUQm5j?=
 =?utf-8?B?WmQ2Rmh4enpXNnNYWlRML2xaTFV1TGozVGVXQ3NPSFZsNFdUaWR5eE1rSm1U?=
 =?utf-8?B?SGcwdFZMRGV6RE5keDdOV0M3bkx5Z2hqc0hwUWFFeUd3ZjFaR3lid3RsM1Fr?=
 =?utf-8?B?emZOeWFuZXM0NTdOYUtMTHFzeU5VS3JlTkNPakczYUM5UlAwSElYWkU4VEkz?=
 =?utf-8?B?d2N1b0tuSjZjTnhXVjI2ZFlWK1BUUFNwaUZLNzhTbis3dmxnQ0hiKzRJTjJQ?=
 =?utf-8?B?V0hNR1RWUnVpR2p3UnBVMnRBd0JYaWpFVkF3Q0FaV3dBUlJKUmxUOXNXK3Mz?=
 =?utf-8?B?Z3JMK0JackpVUE1LTFhURzVQdUwwRmhONzlWMllERFdGNnNHSHp6T0QwOEhu?=
 =?utf-8?B?L3dWK0RIaUVIUzdidHdXL2w5U0M0aFVNYnl3b0I1YXFpUkM3L2RaUlFVVFdV?=
 =?utf-8?B?WTNXYnhINU5IMmhqWjNtZkdqMmlkQ0NlNks4MG9RYkc5RW8zUnhJSStDRDgy?=
 =?utf-8?B?MGo1aTEzOVFwbUgzMkQzbjAvWDdoUE4wd0FpVVptMGhleUhsdW52N084eDZ1?=
 =?utf-8?B?ZFZUZVQ4SG1JQTlRN2lVZWRrbG1HQ25FVVVQZmY4NDNOYWUrTkRTSTU1RUVD?=
 =?utf-8?B?cU51cFBDaGdPeW9oRWJlcGpRNC9CdXd6b2Z5U0s0Y01zSFJKVTk3aDZpZkxG?=
 =?utf-8?B?eGVtb1JLQS8vbW4weWc2Z0NQcDdNU2p3UEZLU1BJbHAzaVZpVVBDbTFoWDlo?=
 =?utf-8?B?UXZGUDNjQ28rZTVIbHU1SXUxUTVQNE04MURXcDBxZFZmTFJBaklyTllSVWw5?=
 =?utf-8?B?L0JINmhTNVNuVHJUWFI0Z3BjR1AzMlJZYVorcmZDaU9nRm0xUnlTNUlCcVgv?=
 =?utf-8?B?dFp6MGVxaklYUmdjTEpwbGsxREMvR1pGbVNjWER5Mnc2Zm9OS0NBWk40bEp4?=
 =?utf-8?B?YjZ6TWp5RXlHM2hWQWFIVnRYdyt2UnptNFZhWTV3azRKaU5sdk5yN3VBbExr?=
 =?utf-8?B?VWJoVVFsQ1liL2RqUkgxY1F4ckJUM3d6OWJjblI0b3RmN3ZWR0xlRkExbElL?=
 =?utf-8?B?WUUxS1JpV3hmMVNwQUYvVFVlVm11VTBneHdabGFnQ2dDODdMbEFoKzd6dHJu?=
 =?utf-8?B?a2NxeTRXc09sZmtFcUU2MHJWbmtMSkFIcm1oY3dGM0xlWk8xT0pDTW1jck1r?=
 =?utf-8?B?U2ZUQlR1Z256Sk9lOHBFYUh1ZWRySXhML0R2dnA2dTNvR3FvS0hIbWRSQlRj?=
 =?utf-8?B?cm1iKzJwc2xFcEFLRCtNTmw3MUtFVkUxaEhuV1RiUVNCWVZ3V0hWY3c4YkRi?=
 =?utf-8?B?UUJmRjR5UnVOWFJFOXR3MnplNFZhNGt6NzhxTVNtWkVhWkxwZktaZUZyUTlW?=
 =?utf-8?B?OTBWUklWQm1nYmtyR01jM2dyc2hiYmFnWEsvZ2NGVTE5Rk9Vdm82a25HWkxB?=
 =?utf-8?B?VnRGS3ZnNk0yZEhEQUV4VEFVcE8rWWFhUUFuSVpXc29pZjl4SGFWc3FDTTBi?=
 =?utf-8?B?VGt1NUNtN284WEFRb1RyVkxlYkwrRWNPTGtlSncxSjhqZGVQNzRqY1lDZ1Fp?=
 =?utf-8?B?KzhLbFpleEVlRFRRVlQ4eXp4SkdnSTF3V0ZMRXlTbDRGUkZhWUp0U1BUemgx?=
 =?utf-8?B?R1dLSmk2V3BMQWJUdDhJbTc5RVIzTDZpbnVhVWF2OGJKWExXczk2MGkxcSs1?=
 =?utf-8?B?UGZHdkJyY3htaktTbWY3ZzY4VjF0Vk4rck96QkovamRLUlc2RVhKYUNlY0dw?=
 =?utf-8?B?UlhJcHlEa0Naalk1am1tZFJNWmFaQXFwZWtoLzVvcU1JRSs2V2tsNzhHamhq?=
 =?utf-8?B?TlU3ZmFUejdzNmFFUHNWRWpPM2ROWi9KaUtVMTF6TUErKzA5M0NYWUVDSEw0?=
 =?utf-8?B?MDBQcktHQ09rZ1ZqK0lBbkxzS2I4MUlhRmhTRzkzS0hsSUlybW83VzJkZUh1?=
 =?utf-8?B?T2FUQlNqbWZ0V29hSUl1YVMycXJPMTZuSk1aQjkzcUlHODBTYnluUk5XZjNP?=
 =?utf-8?B?Z2M2VmJWdVVWdEk3WGdnQkRSaUk0WklUMHVuU1dxODFIY3FQM2RBRXhFQWth?=
 =?utf-8?B?Vm9KQ1NxQ2crOStUT1J3bVl2M0ZRNk9BdUVBQXRNdFpTV3gzQmNaWndPRmlR?=
 =?utf-8?B?NmhBN3h1KzNpek5oa2dqMjF4L0trMHVMZTJOWE4yTnlnTkUydkNQQlRPbFVZ?=
 =?utf-8?B?ZHVzMUJQeWZEemc4NFBSOGxDV0Job25BZTQ1RHNVeXczZkRGTGVlQlpZMmdD?=
 =?utf-8?B?ZHUwc29VZEVpRVY2cGptRllJNkxCMEJGZURONm9pVTdRQ1VYOGlaUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f8d24f-f0bd-41dd-b090-08da2397bf5c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 13:06:28.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyUf7EqfeevUyDXaGKBFVJdfXpWBI5QTIwqQh9ahWd23u0vipAGctgSpDSl9FjRZ9f6Fd9uxx/DYnZAsjoAr8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3389

On 20.04.2022 16:13, Andrew Cooper wrote:
> From: Bobby Eshleman <bobby.eshleman@gmail.com>
> 
> debug.c contains only dbg_rw_mem().  Rename it to gdbsx.c.
> 
> Move gdbsx_guest_mem_io(), and the prior setup of iop->remain, from domctl.c
> to gdbsx.c, merging it with dbg_rw_mem().
> 
> Signed-off-by: Bobby Eshleman <bobby.eshleman@gmail.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> The semantics are rather broken.  XEN_DOMCTL_gdbsx_guestmemio only sets
> copyback when there's nothing to copy back, and skips copying back in the
> -EFAULT case when the iop->remain field is relevant.  Furthermore, it can be
> asked to move up to 4GB in one go, with no continuability whatsoever.

The last point perhaps isn't overly much of a problem for this specific
operation.

Jan


