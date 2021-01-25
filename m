Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEC3028D0
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 18:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74218.133358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45dc-0006dv-FH; Mon, 25 Jan 2021 17:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74218.133358; Mon, 25 Jan 2021 17:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l45dc-0006dW-BT; Mon, 25 Jan 2021 17:26:52 +0000
Received: by outflank-mailman (input) for mailman id 74218;
 Mon, 25 Jan 2021 17:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l45db-0006dR-61
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 17:26:51 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af48a066-53b9-40cc-bcb8-4193b528cd2e;
 Mon, 25 Jan 2021 17:26:50 +0000 (UTC)
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
X-Inumbo-ID: af48a066-53b9-40cc-bcb8-4193b528cd2e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611595609;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bOgZDa2ToLv3Owmt77I6hq2u93oH/ladYLlMIP+ACuk=;
  b=HWsqXFiXVh6N5spptpiVCXA/r98TzkJe/2MjhXFl/T/RDxDGPYEaemuY
   4muvEx4CEU1Ji6/PtXu1lmB3H75X/05EuLnc9Ei5ShL6CKZaQxpXr1ZMp
   x12ZbEKczco34SUGF42Nylhu05FPgkiGnP3n6+lvcQKmF256U4Vj5nIAB
   I=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7FOcANLGJDyH6fZ1sydwYetZd7Rm4dTbBYAFeqk0TY5NBUvbOYjwXZNnVa03bgGzoho2vhXF6U
 aiC1s3asoxsx0j+Ur5vodbCh9UI0Whv8AxHzSzgUV7AIfxU6qjmNzZUHIXzHBbvygRRuW3lRRj
 RWdUtbfWyWxMt+eIgz7yxQeMrUUhwHF/6stciQiuDxox77qhGkI+piQU85n5nc6GOXhVRxialz
 zHQ9gIdNby24GrKLzDIsVdjETzmskxla84vUannhOaXpW87T5Z2Nr2xj+QJ3qHTGQ3ZjkKLDBW
 zQ0=
X-SBRS: 5.2
X-MesageID: 36012889
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,374,1602561600"; 
   d="scan'208";a="36012889"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWgVTCUFSEPV85yn8HuesH2lPQ26qS5HKT/4MKmlTc7IfYNxqllSH+oGjjU/wP1EvCE9OveIDK9qYcr2jt5DAGeJEmecwDqpr/PfvTPA/CLU8qAuXujpVcvOFLr2I4E71QzYxhfla6PqzBP+3BLwpGleUIQaUWcBRroZ/D9k+DSB/3OrpBa7XQ8E3BMphA5/kq4r2iP/qacVblr5zZwZnmRSF4IwTRRJRQo6d2bOza17MESsH0Ud2mjITtwY4C715aHwP+DJNAHCxqU5WM/hA+YrXkcehn0EWoPzPPltoU9S4tpET689CXWKPa9HQi5m3eKYNxiRjGTDOUEM/vyWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtWEsjpWj2lQLxSmdtBBZE+KeHNYR/qf7aJEew4am/g=;
 b=IHsh0ZfCaApP40wa534jIYhIBo7dC2f02sIEu69DDWJe6jptUnggvTf+XpCWkbfKWj6Alk4dKs/5gmZ+WxEPZLX9/KHvcCvZACMuvjiyOFiJ+yJCek3A/JAerriUFVsmC74o7z8WMI4NEby1YXHssQC26YBeE6zojn+F6i6qtr488oDCkvbisFySjHwVkNWiFtpasvN8izFBa876wUiUIIKDEKJkPx4kDcppg2g1kkJ1wWX+2RDRT7TYH5JWdtolLwwBP/ndxPVAXXXY5xar/ZtwMqVGPWHh9C/2xy+ydemQitnf9Oam2GTV1d+Zh4L0GOUArXD8l/H9RDArgsiEag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtWEsjpWj2lQLxSmdtBBZE+KeHNYR/qf7aJEew4am/g=;
 b=xma/Ag3Vnt7be5dwmPL5/J0NnHvk1Se4b3cm2SMiaccBRpmp40kHkDuj5X0/4xcfjTzWrmF24hTu52dgkMg/JCYYmHsSkQTpNYaoIOI5+sRfdYuPZvV6NmNifhRlYP90daFr/T4qGYQUl74QMF0azoVuR5+vpNZiupAPyjiRm7E=
Subject: Re: [PATCH] x86/xen: avoid warning in Xen pv guest with
 CONFIG_AMD_MEM_ENCRYPT enabled
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <stable@vger.kernel.org>
References: <20210125140013.10198-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e49727ce-80b6-9eb6-8bd7-a4ce63c693e0@citrix.com>
Date: Mon, 25 Jan 2021 17:26:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125140013.10198-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4408f2ab-d348-493e-aa99-08d8c15664ab
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5582:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB55827FAD0A2E354B8232FDCFBABD9@SJ0PR03MB5582.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hadhMtQkbotylDosOCqtSEEqQCzRqPv+Edm2zpq45jtUHwjm44SiRrf2s92x8M5mT8vxguLQvWHlyRGem3aBuU5haQSII9D6liOjl4Pm7Dp3dKKh6BtWpbUVpC5SOo0CuBmTsk5e5t9xVpR6g25gfdxYqe/g6DU5ogpLPsCPyKb0P5wrStHs3yoFxRZ1+EDnqXD8MI+Dj0rd1RFBYew6IZnbphY3+oiPEl8Qd5kHG5nvmO9k0UYv8ptyD5Cdo+gbH0i6b2DX1qv9H4KWUWKEaB8g+vRhlCNU856V05ecslBxojtqssS1i7pmpZnwCYQ3lOECRjp0M89FC4vkMVXk/16n92X8r8oQTdbtYhM4E8STPCh39nC/ujXv37Ew5oBPUSJSln13K0E+sbnLRa4c7huywASnz+gqoDqSd37clcMmAQs1ulkz2px1mX8Rd/S7OS4G3a9Sf8gDRVE1df/dRalMpKv3I8rV4MvjsPfCbHQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(66476007)(66946007)(54906003)(66556008)(16576012)(316002)(478600001)(6666004)(4744005)(31686004)(8676002)(5660300002)(4326008)(8936002)(31696002)(36756003)(186003)(16526019)(26005)(53546011)(7416002)(6486002)(2906002)(86362001)(2616005)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0gyWnhVL2ZQRTEvTWhDN256VVVPU1RkRlVONHROOUNVd3pkUCtQRzRvUWNQ?=
 =?utf-8?B?SDAvSEhCT3VsUEdHT3BMeGxwWGJOOVdvZmhNa0pXY0FKM3BVbzVkN2wwV2k0?=
 =?utf-8?B?U21TbUF3ZmxpVFJsRjdIRndiMzZSQnhaTmhjWU84ZkhyQWR6cWlqcUU4Z1E1?=
 =?utf-8?B?NlUrK1pLUUx2UGoxeHZIVGFPYTA4ZWh3ZUM3RHBoZ08vU0RRd2w3cDBzQXRS?=
 =?utf-8?B?MWE0aXF4N1JtbFBDdEpJMXBEUEVyemRrZnRxT3RYQ1lrcGQ5R1lVUFZXSXpy?=
 =?utf-8?B?Q2Q4L2N4WEtWckx2RThQeSt2czY1UG8wRzMwVlVaYTQ4SlFLZlQ5dTRqUEt3?=
 =?utf-8?B?TlZ3aDNsajQya3RubFU4MnhlYk4wbEFaYzEyOGhVdWxRZ2t5dkQvb0E5Zmwr?=
 =?utf-8?B?L0c0UHNjYitLc0wvQTNXc29mdG42TEJWNzlZVjlLU3MwNW5YRVFnT2J6bDdn?=
 =?utf-8?B?c2MwTDU5aFdKTkJvcUs4WXV2RDBUWVYwVFJySENuSE0wSWwwajNvUitxblZp?=
 =?utf-8?B?THV3N1JYeGlmVDYvakpPdEhJV3lnZzYzTW9qaDRCbXNvakNQUFViZFA5SzVJ?=
 =?utf-8?B?U0M4emdZTGJhdTVpWFh3TDIzS1NDZ0l4d2ZtZmxQc1Z6N21OKzBpdjhrbkkz?=
 =?utf-8?B?WFBpeVpPUTl6SUZJU2NlQVM5QlJtcnRNc25La1lWZjVGcHpCc2FtTGlaTVMr?=
 =?utf-8?B?VWk5ODRIdHNHNHFETVB5bmVUUThXNi9CUitneHo1UUtnT1plN3FGMFRnbU9h?=
 =?utf-8?B?U1hiV1hSRkozL0lTb244eXF0Yk44VWNmd1ZkUC9kQ0l0Y3JPeXFyeXlWdnlm?=
 =?utf-8?B?RnZGRFZISk9PdDhKQy9ydDRISWxFWVJ3K29tTjBtMGJ3QnkybXM1bXFNcE0v?=
 =?utf-8?B?RWJMdzlKajRucno1NitSYVh2S0ZxR1k1NGs4QnNBbU5qYTExdE9rOGNtZGdV?=
 =?utf-8?B?S1M5bmhBZWVWQVpsVlpVeWVtbSs1NldnemE3cThBSkEwcHJFQWxoWEFHQ2FE?=
 =?utf-8?B?Nkk5OE5rdjdLUEU4M2lJSzd2cXdRaWJET1NyU3ZhdnFtMml0ZDdKUmZmSmo0?=
 =?utf-8?B?WldzV3dXOUZkNEx5aWUvaUdlbk9odE45YjhucmIxRllnOHdPZDN1d2R4RUg0?=
 =?utf-8?B?STA4dW9uNmRWSTkzZDhEdTR5THNwZVJ6ZkVFWDVKYnBaOHpJZS9pVjdPQ3Iw?=
 =?utf-8?B?Y0ExM2hIZ3MwSEVkWHZTVjU4cGF2N3BrakVuNkJJNGNaNFgzeGY3Z1VJWHdi?=
 =?utf-8?B?dk55M0VnMUhVQTBGSEc3Mmg1YUxSakpPSjBaWUY5dTIxd0FtbytkaGRGSWxt?=
 =?utf-8?Q?lWlkgcJrmn31NZ0OQIhJ4vrBsQUMV8HbpZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4408f2ab-d348-493e-aa99-08d8c15664ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 17:26:47.5444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UD7g7oXNF6SJNphTSRhfht67+Fx8KI87Qo0VRaqe49GY8gy1VLJn1bWLYAsMGkK9TKljr2+kaURdxKedY5cZP9zAFd2egByhgSZENTKKEXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5582
X-OriginatorOrg: citrix.com

On 25/01/2021 14:00, Juergen Gross wrote:
> diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> index 4409306364dc..82948251f57b 100644
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -583,6 +583,14 @@ DEFINE_IDTENTRY_RAW(xenpv_exc_debug)
>  		exc_debug(regs);
>  }
>  
> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +DEFINE_IDTENTRY_RAW(xenpv_exc_vmm_communication)
> +{
> +	/* This should never happen and there is no way to handle it. */
> +	panic("X86_TRAP_VC in Xen PV mode.");

Honestly, exactly the same is true of #VE, #HV and #SX.

What we do in the hypervisor is wire up one handler for all unknown
exceptions (to avoid potential future #DF issues) leading to a panic. 
Wouldn't it be better to do this unconditionally, especially as #GP/#NP
doesn't work for PV guests for unregistered callbacks, rather than
fixing up piecewise like this?

~Andrew

